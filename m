Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F7D82866
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784636355; cv=none; b=Heq6a93ddgtvtdktw4VupdtF/liFF2crmXqBnaQ1fCkINnbBf1YLoj9zlA2K5XXhSHoE4tseCSU2h88EIcgIUz1EvAT4+dl1IqN4dGJbAoA9Rnzz0XMr0QSW2g2vriJZWp4AB1wU/vxISQe7IimXEiEEpfQsJB4nR1WiqdAIW20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784636355; c=relaxed/simple;
	bh=9KJqTDqMpyZpIV8Sku76sfGqrDIuQy4BP+Z94rKnUmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HahXOihWmWBtHRV7f7TpzaFFc489pBiL6GWIDg7CrxAnlLYXGzDp2NQlED40jNV2/knFF9OM9/V8oHJNKyxnp52DRXtwmDgi9YIRxYmIi4aPCzbhaed/YtIe2wbqtJR76Tz8DZAvzPF0KWf/dJPLkvs6FoTPtMaHpVAv/ByeR3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F5DGkZ8P; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F5DGkZ8P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784636350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I8HKgpy6k1D2rLobvwWeAJVu3Js45J7lc1vfiKHfJD4=;
	b=F5DGkZ8Pr3E/pamavNdQtpgM34+hKzjSSfmb6C+FF5kQDHZQNMk3sF47J+XOVy5xEgFdUh
	JEwiX9RXnqkw1NWGPEL/N4uSg3i8bbxOzs1WL7P2GOiCLDSNixpA1Yy2oI8jgSzWGdqyVr
	165JlRUTpEOp63m1H104ktV9vyvbZxs=
From: Tao Cui <cui.tao@linux.dev>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	cuitao@kylinos.cn
Subject: [PATCH] LoongArch: KVM: Implement KVM_GET/SET_SREGS for bulk CSR migration
Date: Tue, 21 Jul 2026 20:18:42 +0800
Message-ID: <20260721121842.156025-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

KVM_GET/SET_SREGS has so far returned -ENOIOCTLCMD with an empty
struct kvm_sregs, so migrating a vCPU's CSR state takes one
KVM_GET/SET_ONE_REG ioctl per register -- thousands of syscalls for a
large VM.

Define struct kvm_sregs as a flat array of 0x184 entries (the core CSR
range 0x0-0x183, up to DMWIN3) and implement the two ioctls:

- get_sregs does a single vcpu_load/put, which also pulls pending
  interrupts into ESTAT, avoiding the per-register load/put side-effect
  that made ONE_REG snapshots of ESTAT order-sensitive.
- set_sregs writes all CSRs via _kvm_setcsr in one pass, propagates
  _kvm_setcsr errors, and clears KVM_LARCH_HWCSR_USABLE up front so a
  mid-loop failure still forces the next vcpu_load() to reload from SW,
  matching KVM_SET_ONE_REG.

CSRs above 0x183 (debug, breakpoint, PMU) stay on KVM_GET/SET_ONE_REG.
struct kvm_sregs was empty, so enlarging it -- and the _IOWR-derived
ioctl number -- breaks no userspace; userspace built against the updated
UAPI header can adopt the bulk ioctl.

On a Loongson 3A6000, snapshotting one vCPU's core CSR range drops from
388 KVM_GET_ONE_REG calls (~2 ms) to a single KVM_GET_SREGS ioctl
(~5 us).

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/include/uapi/asm/kvm.h |  3 ++
 arch/loongarch/kvm/vcpu.c             | 43 +++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/include/uapi/asm/kvm.h
index cd0b5c11ca9c..dc091f29963d 100644
--- a/arch/loongarch/include/uapi/asm/kvm.h
+++ b/arch/loongarch/include/uapi/asm/kvm.h
@@ -124,7 +124,10 @@ struct kvm_sync_regs {
 };
 
 /* dummy definition */
+#define KVM_LOONGARCH_NR_SREGS	0x184
+
 struct kvm_sregs {
+	__u64 csr[KVM_LOONGARCH_NR_SREGS];
 };
 
 struct kvm_iocsr_entry {
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 20c207d80e31..0890b68efa2a 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1001,12 +1001,51 @@ static int kvm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 {
-	return -ENOIOCTLCMD;
+	int i;
+	unsigned long estat, gintc;
+	struct loongarch_csrs *csr = vcpu->arch.csr;
+
+	/*
+	 * Pull pending interrupts into ESTAT with a single vcpu_load/put so
+	 * the ESTAT value read below matches the current interrupt state.
+	 * This also avoids the per-register load/put side-effect that makes
+	 * the ONE_REG path's ESTAT snapshot order-sensitive.  The SW CSR
+	 * reads run under vcpu->mutex, which serialises this ioctl.
+	 */
+	preempt_disable();
+	vcpu_load(vcpu);
+	kvm_deliver_intr(vcpu);
+	vcpu->arch.aux_inuse &= ~KVM_LARCH_SWCSR_LATEST;
+	vcpu_put(vcpu);
+	preempt_enable();
+
+	for (i = 0; i < KVM_LOONGARCH_NR_SREGS; i++) {
+		if (i == LOONGARCH_CSR_ESTAT) {
+			gintc = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & KVM_GINTC_IRQ_MASK;
+			estat = kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) & ~KVM_ESTAT_EXTI_MASK;
+			sregs->csr[i] = estat | (gintc << VIP_DELTA);
+		} else {
+			sregs->csr[i] = kvm_read_sw_gcsr(csr, i);
+		}
+	}
+
+	return 0;
 }
 
 int kvm_arch_vcpu_ioctl_set_sregs(struct kvm_vcpu *vcpu, struct kvm_sregs *sregs)
 {
-	return -ENOIOCTLCMD;
+	int i, ret;
+
+	/* Clear first so a failing _kvm_setcsr still forces a HW reload. */
+	vcpu->arch.aux_inuse &= ~KVM_LARCH_HWCSR_USABLE;
+
+	for (i = 0; i < KVM_LOONGARCH_NR_SREGS; i++) {
+		ret = _kvm_setcsr(vcpu, i, sregs->csr[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
-- 
2.43.0

