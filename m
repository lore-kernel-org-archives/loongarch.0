Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D519218585
	for <loongarch@lists.linux.dev>; Wed,  9 Jul 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048161; cv=none; b=ibAoHRNWZlgtC8kBusiullTN5jKxJDpt/dAOqmlIhTUYA7ngSQIDxv6NMuC1OvUIPm6AnKFwTpeQwsHrQNjUSZpe/6M0cGKpi4sVYmJLtedJo8w2lsE09kDCQEA6BMPpkmYDzWgn0GLgzhEU7LsZWCFN0RVE/ghQRNjytGAGAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048161; c=relaxed/simple;
	bh=o4TIx92RBZnLsQZf5EAsiMP4FKhwveOeG+D2/fxYzmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1vKnmiXLKf2q7c0BZyb0uVH9G6VJcTr+0lOBoEw+3W/YBH1zfHsGW4IZR98QZBKj06Qzhpb2ZOiRMXzqQlDAVa5mnvnRCxwIZdw2L65d8UlIR/kJz5uLtNhyIJTYZGbu0ZB1wZIQl0y6hiBs04F++TRKsPRqXr7DxqDG3nbj4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxqmobIm5oUyklAQ--.38716S3;
	Wed, 09 Jul 2025 16:02:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxpeQZIm5oS6cPAA--.24964S4;
	Wed, 09 Jul 2025 16:02:34 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/8] LoongArch: KVM: Remove unused parameter len
Date: Wed,  9 Jul 2025 16:02:27 +0800
Message-Id: <20250709080233.3948503-3-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250709080233.3948503-1-maobibo@loongson.cn>
References: <20250709080233.3948503-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeQZIm5oS6cPAA--.24964S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Parameter len is unused in some functions with eiointc emulation
driver, remove it here.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 3cf9894999da..acd975ce9608 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -131,7 +131,7 @@ static inline void eiointc_enable_irq(struct kvm_vcpu *vcpu,
 }
 
 static int loongarch_eiointc_readb(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
-				gpa_t addr, int len, void *val)
+				gpa_t addr, void *val)
 {
 	int index, ret = 0;
 	u8 data = 0;
@@ -173,7 +173,7 @@ static int loongarch_eiointc_readb(struct kvm_vcpu *vcpu, struct loongarch_eioin
 }
 
 static int loongarch_eiointc_readw(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
-				gpa_t addr, int len, void *val)
+				gpa_t addr, void *val)
 {
 	int index, ret = 0;
 	u16 data = 0;
@@ -215,7 +215,7 @@ static int loongarch_eiointc_readw(struct kvm_vcpu *vcpu, struct loongarch_eioin
 }
 
 static int loongarch_eiointc_readl(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
-				gpa_t addr, int len, void *val)
+				gpa_t addr, void *val)
 {
 	int index, ret = 0;
 	u32 data = 0;
@@ -257,7 +257,7 @@ static int loongarch_eiointc_readl(struct kvm_vcpu *vcpu, struct loongarch_eioin
 }
 
 static int loongarch_eiointc_readq(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
-				gpa_t addr, int len, void *val)
+				gpa_t addr, void *val)
 {
 	int index, ret = 0;
 	u64 data = 0;
@@ -320,16 +320,16 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 	spin_lock_irqsave(&eiointc->lock, flags);
 	switch (len) {
 	case 1:
-		ret = loongarch_eiointc_readb(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_readb(vcpu, eiointc, addr, val);
 		break;
 	case 2:
-		ret = loongarch_eiointc_readw(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_readw(vcpu, eiointc, addr, val);
 		break;
 	case 4:
-		ret = loongarch_eiointc_readl(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_readl(vcpu, eiointc, addr, val);
 		break;
 	case 8:
-		ret = loongarch_eiointc_readq(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_readq(vcpu, eiointc, addr, val);
 		break;
 	default:
 		WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
@@ -342,7 +342,7 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 
 static int loongarch_eiointc_writeb(struct kvm_vcpu *vcpu,
 				struct loongarch_eiointc *s,
-				gpa_t addr, int len, const void *val)
+				gpa_t addr, const void *val)
 {
 	int index, irq, bits, ret = 0;
 	u8 cpu;
@@ -421,7 +421,7 @@ static int loongarch_eiointc_writeb(struct kvm_vcpu *vcpu,
 
 static int loongarch_eiointc_writew(struct kvm_vcpu *vcpu,
 				struct loongarch_eiointc *s,
-				gpa_t addr, int len, const void *val)
+				gpa_t addr, const void *val)
 {
 	int i, index, irq, bits, ret = 0;
 	u8 cpu;
@@ -506,7 +506,7 @@ static int loongarch_eiointc_writew(struct kvm_vcpu *vcpu,
 
 static int loongarch_eiointc_writel(struct kvm_vcpu *vcpu,
 				struct loongarch_eiointc *s,
-				gpa_t addr, int len, const void *val)
+				gpa_t addr, const void *val)
 {
 	int i, index, irq, bits, ret = 0;
 	u8 cpu;
@@ -591,7 +591,7 @@ static int loongarch_eiointc_writel(struct kvm_vcpu *vcpu,
 
 static int loongarch_eiointc_writeq(struct kvm_vcpu *vcpu,
 				struct loongarch_eiointc *s,
-				gpa_t addr, int len, const void *val)
+				gpa_t addr, const void *val)
 {
 	int i, index, irq, bits, ret = 0;
 	u8 cpu;
@@ -696,16 +696,16 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
 	spin_lock_irqsave(&eiointc->lock, flags);
 	switch (len) {
 	case 1:
-		ret = loongarch_eiointc_writeb(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_writeb(vcpu, eiointc, addr, val);
 		break;
 	case 2:
-		ret = loongarch_eiointc_writew(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_writew(vcpu, eiointc, addr, val);
 		break;
 	case 4:
-		ret = loongarch_eiointc_writel(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_writel(vcpu, eiointc, addr, val);
 		break;
 	case 8:
-		ret = loongarch_eiointc_writeq(vcpu, eiointc, addr, len, val);
+		ret = loongarch_eiointc_writeq(vcpu, eiointc, addr, val);
 		break;
 	default:
 		WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
-- 
2.39.3

