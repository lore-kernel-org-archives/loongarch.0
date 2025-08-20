Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2904409
	for <loongarch@lists.linux.dev>; Wed, 20 Aug 2025 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755661556; cv=none; b=BSSlKm96wVTdw407EIpJshivUXSNctTvT/3DRYTmF/Y3rlV9kVYA9azX5Gewvn2r9ErdFq0TX5YdIA7qSHyNW/h0hvRQUhh9lG0mahiwdaYlSowNUHLiXRHbKmGE6nV88vjU0uEV4gkLM66q5wNn9LnNkLoa3hhy8M5hnOAmR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755661556; c=relaxed/simple;
	bh=WTXWNo+8E1X+chuNWr88tcEsODferF2t7m6sSFkY1qg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fLbZP1xqKDw9YOCgj09sG2p0DY5H+WtRMtL5CQtnLa8p4RGhypmtUbhaE52/RNLuT2hb5Ww3KgJrAtlX8t1WjW4KecWno28yS1M7W4s+VHRRXKGnix2PAxO8psghvHEq2o3szYCdCGzWnBlyI1r402WtEg+y5bWCARhM1IU62gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Dxb_DsRKVoM7cAAA--.1496S3;
	Wed, 20 Aug 2025 11:45:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by front1 (Coremail) with SMTP id qMiowJAxQMLqRKVo5uVZAA--.7887S2;
	Wed, 20 Aug 2025 11:45:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: maobibo@loongson.cn,
	zhaotianrui@loongson.cn,
	chenhuacai@kernel.org,
	lixianglai@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yanteng Si <siyanteng@cqsoftware.com.cm>
Subject: [PATCH v2] LoongArch: KVM: Use kvm_get_vcpu_by_id() instead of kvm_get_vcpu()
Date: Wed, 20 Aug 2025 11:22:29 +0800
Message-Id: <20250820032229.913361-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxQMLqRKVo5uVZAA--.7887S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Since using kvm_get_vcpu() may fail to retrieve the vcpu context,
kvm_get_vcpu_by_id() should be used instead.

Fixes: 8e3054261bc3 ("LoongArch: KVM: Add IPI user mode read and write function")
Fixes: 3956a52bc05b ("LoongArch: KVM: Add EIOINTC read and write functions")
Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cm>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 6 +++++-
 arch/loongarch/kvm/intc/ipi.c     | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index a3a12af9ecbf..b3829fb4f64e 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -45,7 +45,11 @@ static void eiointc_update_irq(struct loongarch_eiointc *s, int irq, int level)
 	}
 
 	cpu = s->sw_coremap[irq];
-	vcpu = kvm_get_vcpu(s->kvm, cpu);
+	vcpu = kvm_get_vcpu_by_id(s->kvm, cpu);
+	if (unlikely(vcpu == NULL)) {
+		kvm_err("%s: invalid target cpu: %d\n", __func__, cpu);
+		return;
+	}
 	if (level) {
 		/* if not enable return false */
 		if (!test_bit(irq, (unsigned long *)s->enable.reg_u32))
diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index e658d5b37c04..0348a83a7ed7 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -298,7 +298,7 @@ static int kvm_ipi_regs_access(struct kvm_device *dev,
 	cpu = (attr->attr >> 16) & 0x3ff;
 	addr = attr->attr & 0xff;
 
-	vcpu = kvm_get_vcpu(dev->kvm, cpu);
+	vcpu = kvm_get_vcpu_by_id(dev->kvm, cpu);
 	if (unlikely(vcpu == NULL)) {
 		kvm_err("%s: invalid target cpu: %d\n", __func__, cpu);
 		return -EINVAL;
-- 
2.39.3

