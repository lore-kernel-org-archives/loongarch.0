Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CEE12C539
	for <loongarch@lists.linux.dev>; Fri, 10 May 2024 14:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352318; cv=none; b=Zh5fNDsT0AzHjm13xye1txoAu2rVye6TKpaRz7TZVsqkM1hn60TzzXg8Wsv/edY0V3SEGQ4TCYS6l3rGZH7y3XnLFb67aQqTNgvnYK7ceuggHYAzdhrCpghkpxckxZzbczll/ZIgyAFjMOb9ptbq924gPL+som9QQWC3dbiBD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352318; c=relaxed/simple;
	bh=kmj44PEzEs1Hc7RYAG2y6Omx6rTiyxtrlA8AzcCTcUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFltvad8SstX9EWte9d+852otTYPNVUm9aGfc8DsMJOtV4LjMj3MfJtppwgwAUlungJvJQsePjapuPQB4xcSaLZMhvufVb1/pb+F4tPrs7MXdPWvIViOQyJIGqQJJLILGuW5CMOfIgGzyRHpt00pPeve2ckAI6xJJewtEdh0gtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T/R9ZiRD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T/R9ZiRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715352315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V0JbujFYt/9SItNTEbEiczRuSL3qAb2lZe4U6XNdsCE=;
	b=T/R9ZiRD8cowlEvt6k45zjjee8Kz32Ig6uE04Hl+0adaxC7SEYVRZ9pHV6omzhdCLueWKJ
	5Tr5u9HyopoRvIY/YBvdMI54UffAINO2tR/Fc+LDtxVUeMwEVeCeOlaxa0G4xa1LHr/WpC
	VkRlaK5h061dzpV+hatkQdfPbrK6eH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-KN1kYbJ_PLmg_b39VnpfxQ-1; Fri, 10 May 2024 10:44:58 -0400
X-MC-Unique: KN1kYbJ_PLmg_b39VnpfxQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34c93732095so818865f8f.0
        for <loongarch@lists.linux.dev>; Fri, 10 May 2024 07:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715352297; x=1715957097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0JbujFYt/9SItNTEbEiczRuSL3qAb2lZe4U6XNdsCE=;
        b=cLdm6GIzZ2dg0zlP0kW3mhXrBjLohSVoo7UfZJJ5mjAhXequ3QRjDgyxnld3/GGEH8
         k6ymqH3GnoU0WP+OnrBU5cP1FVgwrvdHc/TINo69VSbfDepSJTfTjG6XsqCz0+sd14ax
         q68LCNCCSrOjCwd822fmkpiFu/dyRjckGJIpcYg2HLeruUQ8ZyW4JSP2OcGej+i6pkcY
         9gSYiXkhcwktApLzZv6Zfm6ieorI/FmfBEBJPNNuDGAZDHmkNSc3W2Mof0bLk7XZ6OWi
         /gYdyKmqZYyL8yRKkPOJEbFF1KXp4uRgfZfqlXeMEohde5MStTTOCHWyWt0N/yALUGEh
         /I6g==
X-Forwarded-Encrypted: i=1; AJvYcCWeBiYFusgaa5kYDE+YzxL3RdaKhn5uVg0GgLjZacNP31aEW0UbW6Qw8sGwS5j2rUha7ctmzSq4RxS1MP006uSTzXf5lrZGCcu2
X-Gm-Message-State: AOJu0YzoXajXgrzCBKEQmH7w7iUvcWofRUOgIh9gGWn77HFOk3aZ9ycp
	DlB1om2w75imkNu0YxO6mgDsiM+aiSORBDh8frIbd80c5gcHAPn76qEWZZ0SZ6mA/6qp/l2O3wZ
	PXFgTvv4BTIlvvEcrXsHZuQuwZvJwwiNx+wMoDc1frARHFELPky0oV66JP59X+2zt86nnbiOuEr
	gNgQxz71puMVR+pFIIzYZ2t+2VI+BYEQSAj3xjiTGz
X-Received: by 2002:a05:6000:1003:b0:33e:7f5c:a75d with SMTP id ffacd0b85a97d-3504a96cca2mr1881557f8f.57.1715352297328;
        Fri, 10 May 2024 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqPh3msW6mLhD5AYzc7IzmHoZiilZKRmz2o9qQNP3DbnrKVIBIgk/dOAj3od9jdxMGgdFJY8LFNOkvNb4LRmc=
X-Received: by 2002:a05:6000:1003:b0:33e:7f5c:a75d with SMTP id
 ffacd0b85a97d-3504a96cca2mr1881542f8f.57.1715352296757; Fri, 10 May 2024
 07:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240508150240.225429-1-chenhuacai@loongson.cn>
In-Reply-To: <20240508150240.225429-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 May 2024 16:44:44 +0200
Message-ID: <CABgObfaivYUYZwmC9p2uwCWTC-hzJc4P_=rK0S244Hjx3X8kvg@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.10
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 5:11=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn>=
 wrote:
>
> The following changes since commit dd5a440a31fae6e459c0d6271dddd628255053=
61:
>
>   Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.10
>
> for you to fetch changes up to 7b7e584f90bf670d5c6f2b1fff884bf3b972cad4:
>
>   LoongArch: KVM: Add mmio trace events support (2024-05-06 22:00:47 +080=
0)

Pulled, thanks.

Paolo

> ----------------------------------------------------------------
> LoongArch KVM changes for v6.10
>
> 1. Add ParaVirt IPI support.
> 2. Add software breakpoint support.
> 3. Add mmio trace events support.
>
> ----------------------------------------------------------------
> Bibo Mao (8):
>       LoongArch/smp: Refine some ipi functions on LoongArch platform
>       LoongArch: KVM: Add hypercall instruction emulation
>       LoongArch: KVM: Add cpucfg area for kvm hypervisor
>       LoongArch: KVM: Add vcpu mapping from physical cpuid
>       LoongArch: KVM: Add PV IPI support on host side
>       LoongArch: KVM: Add PV IPI support on guest side
>       LoongArch: KVM: Add software breakpoint support
>       LoongArch: KVM: Add mmio trace events support
>
>  arch/loongarch/Kconfig                          |   9 ++
>  arch/loongarch/include/asm/Kbuild               |   1 -
>  arch/loongarch/include/asm/hardirq.h            |   6 +
>  arch/loongarch/include/asm/inst.h               |   2 +
>  arch/loongarch/include/asm/irq.h                |  11 +-
>  arch/loongarch/include/asm/kvm_host.h           |  33 +++++
>  arch/loongarch/include/asm/kvm_para.h           | 161 ++++++++++++++++++=
++++++
>  arch/loongarch/include/asm/kvm_vcpu.h           |  11 ++
>  arch/loongarch/include/asm/loongarch.h          |  12 ++
>  arch/loongarch/include/asm/paravirt.h           |  30 +++++
>  arch/loongarch/include/asm/paravirt_api_clock.h |   1 +
>  arch/loongarch/include/asm/smp.h                |  22 ++--
>  arch/loongarch/include/uapi/asm/kvm.h           |   4 +
>  arch/loongarch/kernel/Makefile                  |   1 +
>  arch/loongarch/kernel/irq.c                     |  24 +---
>  arch/loongarch/kernel/paravirt.c                | 151 ++++++++++++++++++=
++++
>  arch/loongarch/kernel/perf_event.c              |  14 +--
>  arch/loongarch/kernel/smp.c                     |  52 +++++---
>  arch/loongarch/kernel/time.c                    |  12 +-
>  arch/loongarch/kvm/exit.c                       | 151 ++++++++++++++++++=
+---
>  arch/loongarch/kvm/trace.h                      |  20 ++-
>  arch/loongarch/kvm/vcpu.c                       | 105 +++++++++++++++-
>  arch/loongarch/kvm/vm.c                         |  11 ++
>  23 files changed, 746 insertions(+), 98 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/kvm_para.h
>  create mode 100644 arch/loongarch/include/asm/paravirt.h
>  create mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
>  create mode 100644 arch/loongarch/kernel/paravirt.c
>

