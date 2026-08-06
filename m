Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90E3EAC61
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003473; cv=none; b=VATVbdeN8U0q08B9JuejMZrF8HDZX1aUx5nUY/kA7MzAPAPSY9dIZSEzoQCluErvtL+Ept2PKEeJ0rHXxEgMgSs1DK8of/UYgOtRZ6CR1SC0ZAu02rM+GRbHdiJvSMYL75/hY62b6b23/RotndiH4EvdYIZ3zClEjF4NeyThr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003473; c=relaxed/simple;
	bh=sCkJ+zT1XiGwHr8+o+bOgmu7sY4IwpcBZOYpJiHMBhE=;
	h=Message-ID:Date:MIME-Version:Cc:To:From:Subject:Content-Type; b=NiqONpe0TJm7kC7wsuTgZ962Q+45I9PXDDDaSyLdzhN4+XAQy2FtWUSV1qjwA+j/icszHxXsogqKsbtRWvHeY2qGA+sA4NTFIme9a7SsGiCrEbA2adWry4pqfN8AviaYqBI/STt5uq3ItLOgGvBSQyIZuleslYUjGpSnGSAG2Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fSWup2OM; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fSWup2OM"
Message-ID: <7e2648e9-e333-42f7-857a-8337ef033147@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786003465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sf6oV860KXDfJGvNeswhQ7Gq0mooQiSzBH98OT6/KsQ=;
	b=fSWup2OMy6p4vrQrjYNtTlOmOpElQkHu87sLdaKTwY2WmHHY149Y1pu49bTccDtAgSUJ4V
	ByahkkenbSUcCh1PJwY7WcScJ0yY84UNKiWd3wm0zfmiy+qU2NN4pLuN4429OKuD1ROm1y
	fmI4UYYMmy2HW4zPeqH1IstH/jKmPLI=
Date: Thu, 6 Aug 2026 16:04:14 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, zhaotianrui@loongson.cn,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
To: Bibo Mao <maobibo@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
Subject: [RFC] LoongArch: KVM: VCPU_EVENTS for pending interrupt/exception
 migration
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Bibo,

I'd like to get your feedback on an approach for migrating the pending
interrupt and exception state (irq_pending, irq_clear, exception_pending,
esubcode) that is currently not captured by the CSR-based migration path.

I noticed your earlier work on this in the "Small enhancement about
interrupt injection" series — specifically the kvm_vcpu_sync_intr() patch
([PATCH v3 6/6], 2026-05-19), which tried to fold irq_pending into the
software ESTAT register before migration reads.  I see it was removed in
v4 with the note that it "does not sync cached" state correctly, and the
rest of the series was merged without it.

The core difficulty, as I understand it, is that irq_pending represents
queued-but-not-yet-delivered interrupts, while ESTAT represents the
already-delivered state — folding the former into the latter would make
the guest see interrupts it should not yet see.

My alternative approach is to add KVM_CAP_VCPU_EVENTS with a
LoongArch-specific struct that captures these fields independently,
without modifying ESTAT:

  struct kvm_vcpu_events {
      __u64 irq_pending;
      __u64 irq_clear;
      __u64 exception_pending;
      __u32 esubcode;
      __u32 reserved[11];
  };

Userspace (QEMU) calls KVM_GET_VCPU_EVENTS during migration save and
KVM_SET_VCPU_EVENTS during restore, keeping the queued/delivered
distinction intact.  The kernel handler is straightforward — just
read/write the four fields to/from vcpu->arch.

I've implemented both sides and verified end-to-end on a 3A6000:
- Kernel: 3-file patch (uapi struct + cap advertisement + GET/SET
  ioctl handlers), built on linux-next 20260805.
- QEMU: 4-file patch (LA kvm header struct + CPUState fields +
  VMState subsection + get/put in save/load path), built on
  QEMU 11.1-rc3.
- strace on a real source→dest migration confirms QEMU probes
  KVM_CAP_VCPU_EVENTS (=1), then issues KVM_GET_VCPU_EVENTS on save
  and KVM_SET_VCPU_EVENTS on restore for both vCPUs (all return 0).

Do you think this approach is reasonable?  I wanted to check with you
before submitting, since you've worked in this area and might have
insights on why the fold-into-ESTAT path was preferred (or if there
are concerns with the separate-capture approach I'm missing).

Thanks,
Tao
