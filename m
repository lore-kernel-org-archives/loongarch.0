Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE12DB7BE
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495603; cv=none; b=DQXA029GAk0maX7QWk50tHOFN6v168C1YKHJK96/MaV/MZx3JDsfOrLhfuz6sxAJxgxMKf/6lK87M8Vjd+6XpK6/q1N9d83JlPX7xAjcu6IrcectoLHw8FciRdSOwXrmUkysrN4QzsLomgwL3f4AQlkZKxtsBICgk8xPWCfWzrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495603; c=relaxed/simple;
	bh=zCd+XFSwI5qKL/jtDGjDxZYoXRjQFJN5LaruBa6FpME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAo3kaz4cOSAeQbMUWKTDmcVDvHPjat471oXd5I3/BjP4XF05Q5YmL9kMc1CLwBfkTeqSbTI5Ia3DshbggO+uWBpifMY+SEYeaYvFxgJnko7OAO4DnnRMQeNTuxHv6iYtbJqw54/1W3CfnfdT7Y43qsjJ2KKYjLPlssCm6K/LGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PToQoWao; arc=none smtp.client-ip=95.215.58.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PToQoWao"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zCd+XFSwI5qKL/jtDGjDxZYoXRjQFJN5LaruBa6FpME=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790495597; v=1; x=1791100397;
 b=PToQoWaoatwpdz2MDU+Sv31dfrKpsj5VMm3N2nSpp/xT2+rZ+W2lJFZFC+QQR/lIJZqLBtiw
 e3TDDaTBAh2qzCvXVSXX7TmSKqPoJ/DEjOh2FgPrwEymSMj6hJa4A+zWDoa87wcoxy89BjUfijg
 MkmYcnSH6CzxZsuYLlo1s1jw=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 51b516ac111a3e66;
	Sun, 27 Sep 2026 07:53:17 +0000
X-Mizu-Trace-ID: 51b516ac111a3e66
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
Subject: [PATCH 3/6] LoongArch: KVM: Load dmsintc pointer once in pch_msi_set_irq
Date: Sun, 27 Sep 2026 15:52:37 +0800
Message-ID: <20260927075240.3007947-4-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927075240.3007947-1-cui.tao@linux.dev>
References: <20260927075240.3007947-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

pch_msi_set_irq() reads kvm->arch.dmsintc several times: the non-NULL
check and the address-window comparison each reload the pointer, so a
concurrent device removal can be observed between them and the
following dereference hits a freed object.

Load the pointer once at the top of pch_msi_set_irq(); also use the
local in dmsintc_set_irq() for its own cpu_mask read.

Fixes: 03de5eecb0f0 ("LoongArch: KVM: Add DMSINTC inject msi to vCPU")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/intc/dmsintc.c | 6 ++++--
 arch/loongarch/kvm/intc/pch_pic.c | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/dmsintc.c
index e27f448bb54f..d42567eba3ed 100644
--- a/arch/loongarch/kvm/intc/dmsintc.c
+++ b/arch/loongarch/kvm/intc/dmsintc.c
@@ -70,11 +70,13 @@ int dmsintc_set_irq(struct kvm *kvm, u64 addr, int data, int level)
 	unsigned int irq, cpu;
 	struct kvm_vcpu *vcpu;
 
-	if (!kvm->arch.dmsintc)
+	struct loongarch_dmsintc *s = kvm->arch.dmsintc;
+
+	if (!s)
 		return -EINVAL;
 
 	irq = (addr >> AVEC_IRQ_SHIFT) & AVEC_IRQ_MASK;
-	cpu = (addr >> AVEC_CPU_SHIFT) & kvm->arch.dmsintc->cpu_mask;
+	cpu = (addr >> AVEC_CPU_SHIFT) & s->cpu_mask;
 	if (cpu >= KVM_MAX_VCPUS)
 		return -EINVAL;
 	vcpu = kvm_get_vcpu_by_cpuid(kvm, cpu);
diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 88666425d800..e33d6693c37c 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -74,10 +74,11 @@ void pch_pic_set_irq(struct loongarch_pch_pic *s, int irq, int level)
 int pch_msi_set_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e, int level)
 {
 	u64 msg_addr = (((u64)e->msi.address_hi) << 32) | e->msi.address_lo;
+	struct loongarch_dmsintc *dmsintc = kvm->arch.dmsintc;
 
-	if (cpu_has_msgint && kvm->arch.dmsintc &&
-		msg_addr >= kvm->arch.dmsintc->msg_addr_base &&
-		msg_addr < (kvm->arch.dmsintc->msg_addr_base + kvm->arch.dmsintc->msg_addr_size)) {
+	if (cpu_has_msgint && dmsintc &&
+		msg_addr >= dmsintc->msg_addr_base &&
+		msg_addr < (dmsintc->msg_addr_base + dmsintc->msg_addr_size)) {
 		return dmsintc_set_irq(kvm, msg_addr, e->msi.data, level);
 	}
 
-- 
2.43.0

