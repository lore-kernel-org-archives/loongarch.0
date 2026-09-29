Received: from mta1.migadu.com (out-229.mta1.migadu.com [95.215.58.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDA50EC06
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677737; cv=none; b=MGvAt+XFWh2e2kNS6SRfaGHVxPmCaw7Pf21P1Hys8AdRqqPh3kXu2NjkbCOP0G4zQ6U1oQhyG0gHtbIJAznCry1t/a68xZ2W40QV6+k9/VrHhN3LxzIy9+Qg9fe6q0ssrOvvpjv9tEr5jQbWao/VCht6pt2Orlxvy2Dq5CWYL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677737; c=relaxed/simple;
	bh=ueNQlhqhmqHM0X/l3vHJc4f9p4ZUFkO1tEMcu4/fw/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8cjaaEFcHMw19IbGiL66StnXbAZCqmpnoFettSrnLydVVrwagMa494V88WLwBy/ReNol4EHb0pZAw49qiVZ/PaFH6IO7QeGn0SV9vUwjuX0qE7GrYJYcRFRYOrJJaxij74djOvWiEwSVaxTPb041Y0THPl4tOzVnP8ggmbCXbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kVc1z9RE; arc=none smtp.client-ip=95.215.58.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kVc1z9RE"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ueNQlhqhmqHM0X/l3vHJc4f9p4ZUFkO1tEMcu4/fw/I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790677712; v=1; x=1791282512;
 b=kVc1z9REDaIdE7YVr9qUQRyElY7ghb80Y/Yej3GdFzF97/0qqgaxk9Mnw5thzmoTIoXEr5iE
 tCV43wp138MMSLpBD1azW3JN1Q5xJ19Q2A87Kuxw85D/On5RaXN/zhGO03r8Xp9AjTVOcTBEoxp
 plBaYN3FOM2sUqzPTGQPnFco=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0654bdcf0b4971f0;
	Tue, 29 Sep 2026 10:28:31 +0000
X-Mizu-Trace-ID: 0654bdcf0b4971f0
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: maobibo@loongson.cn,
	gaosong@loongson.cn,
	zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	nagachaithanya9911@gmail.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v2 0/4] LoongArch: KVM: irqchip fixes
Date: Tue, 29 Sep 2026 18:28:17 +0800
Message-ID: <20260929102821.36112-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Hi,

Four fixes for the LoongArch KVM irqchip code:

- Patch 1 clears the device pointer in the destroy callbacks: when
  KVM_CREATE_DEVICE succeeds but the following fd allocation fails
  (e.g. under RLIMIT_NOFILE), ops->destroy() frees the irqchip while
  kvm->arch.* still points to it.

- Patch 2 loads kvm->arch.dmsintc once in the MSI injection path:
  pch_msi_set_irq() re-reads the pointer between the non-NULL check
  and the address-window comparison, so a concurrent device removal
  can be observed between them.

- Patch 3 aligns kvm_pch_pic_create() with kvm_eiointc_create() by
  propagating the real error code; the kvm_ipi_create() counterpart is
  being fixed separately (Chaithanya Lagisetty).

- Patch 4 rejects repeated PCH-PIC CTRL_INIT with -EEXIST, tracking
  the state with a has_init flag so the check and the MMIO base update
  are atomic under slots_lock.

All patches carry Fixes tags.

Changes in v2:

- Drop "Guard against NULL irqchip in irq injection" (v1 patch 2) and
  "Rebase steal time counter in vcpu context" (v1 patch 4) after
  review discussion: their trigger scenarios are not reachable
  through real VMM behaviour.

- Use the one-line destroy style in dmsintc suggested by Bibo.

- Track repeated PCH-PIC CTRL_INIT with a has_init flag and return
  -EEXIST instead of -EBUSY, also suggested by Bibo; move the check
  and base update under slots_lock so they are atomic.

- Add READ_ONCE() to the dmsintc pointer loads so the compiler
  keeps each of them a single load.

Tao Cui (4):
  LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
  LoongArch: KVM: Load dmsintc pointer once in pch_msi_set_irq
  LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
  LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT

 arch/loongarch/include/asm/kvm_pch_pic.h |  1 +
 arch/loongarch/kvm/intc/dmsintc.c        |  7 ++++++-
 arch/loongarch/kvm/intc/eiointc.c        |  1 +
 arch/loongarch/kvm/intc/ipi.c            |  1 +
 arch/loongarch/kvm/intc/pch_pic.c        | 22 ++++++++++++++++------
 5 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.43.0

