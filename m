Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620722370A
	for <loongarch@lists.linux.dev>; Thu, 15 Oct 2026 23:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792108012; cv=none; b=cGiAGd9DJ0NVMQ9bICRl2IquerIDPtAu4mW31y3VTTD5s2p8s6/Xla1YAyOMenVVMa947dEIStnYnWXkFtQCrty8QP2BhYIxT4l/OkO0nCePtFp3T20QgfjjQWdEJ2jMkc5x2mNVaLa0Z3rXCS+5Bnw61vr3XXmdxb0M3Q+kssU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792108012; c=relaxed/simple;
	bh=zWUKHHgdE4FtiQpO2+FWlgc3I65IEDGH6HfPURJKSvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXnavXWtbWUEvvdnE1iO6Z0sE/mNEjOhz/k6w7Zv1ax0xZLRfJ1dzLD/K01Ck7vF8FwWgnghgCiYphvOc4mxzwLv4wtJsNmIf/GvV59HuyyYxBNOgw8h2SDa9pxri8GLRL1GCEPFwpN/qPVR9J9TXPA9U4WivqIv04SL+Y2qg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VyYNPXHP; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VyYNPXHP"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zWUKHHgdE4FtiQpO2+FWlgc3I65IEDGH6HfPURJKSvc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792108007; v=1; x=1792712807;
 b=VyYNPXHPNnNNBWBfuRLW0MJgeY/9gdl6m4YScaUWCm5jumdyyjn0IiHYwA7leVY7tq/uN3vZ
 9bwJRDjAkTomatP/C7FPcBhX4FeDlwQI9ebBPMPzH1ziJwuIqNR15QQvhPxglaCod/ir34XKPmG
 J2dlOVgKyWfyGnHn2gyTTKac=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ea0d57db6aa5ee63;
	Thu, 15 Oct 2026 23:46:47 +0000
X-Mizu-Trace-ID: ea0d57db6aa5ee63
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: chenhuacai@kernel.org,
	maobibo@loongson.cn,
	zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	nagachaithanya9911@gmail.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v4 0/3] LoongArch: KVM: irqchip fixes
Date: Fri, 16 Oct 2026 07:46:35 +0800
Message-ID: <20261015234638.1077815-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Hi,

Three fixes for the LoongArch KVM irqchip code:

- Patch 1 clears the device pointer in the destroy callbacks: when
  KVM_CREATE_DEVICE succeeds but the following fd allocation fails
  (e.g. under RLIMIT_NOFILE), ops->destroy() frees the irqchip while
  kvm->arch.* still points to it.

- Patch 2 aligns kvm_pch_pic_create() with kvm_eiointc_create() by
  propagating the real error code; the kvm_ipi_create() counterpart is
  being fixed separately (Chaithanya Lagisetty).

- Patch 3 rejects repeated PCH-PIC CTRL_INIT with -EEXIST, using the
  initialized state of the kvm_io_device as the indicator.  The check,
  the MMIO base update and the bus registration are serialized by
  slots_lock.

All patches carry Fixes tags.

Changes in v4:

- Patch 3: update pch_pic_base unconditionally, as suggested by
  Huacai.

Changes in v3:

- Drop "Load dmsintc pointer once in pch_msi_set_irq" (v2 patch 2),
  suggested by Bibo and Huacai.

- Patch 3 (v2 patch 4): reject repeated CTRL_INIT by checking the
  kvm_io_device state instead of a separate has_init flag, also
  suggested by Huacai; the check stays under slots_lock.

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

Tao Cui (3):
  LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
  LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
  LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT

 arch/loongarch/kvm/intc/dmsintc.c |  1 +
 arch/loongarch/kvm/intc/eiointc.c |  1 +
 arch/loongarch/kvm/intc/ipi.c     |  1 +
 arch/loongarch/kvm/intc/pch_pic.c | 14 ++++++++++----
 4 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

