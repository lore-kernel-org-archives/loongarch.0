Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586EE1F4C84
	for <loongarch@lists.linux.dev>; Tue,  1 Jul 2025 03:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339337; cv=none; b=ODL22ShFVwei2mrp4kAUPINt+wRyoiyqRh2D2pREvTj0EdyZoppwPrVdfiTlfv7UnL8auf/uqes52X4fQ6yGXxXlpKnEk1iPrBlraGI/iWbXF5yLOzUMLXORXsPmTr9N1pAXFahIqWlYyR9yLVkA2BWuAlh2JdYzYT/Lszxo4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339337; c=relaxed/simple;
	bh=Wwf4KEKrXnF9gvqifWBUBHvK19Eqz9FJtulVulbzSLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fVdpwktIuM2u1tFwhj0/GZvu91nZIPN8SWQbn51P3qZFrjct0gUCXsRkt1YxXBkX0Cg3bFPyz+W+qXnNYUkaIdT0tDvo6eshCI+bVEoo4G+LLJq3qIw0N+igdsZTVAG/KXdbnaWyS2pLsxPH5jS37XAqltkbvso/myssVk5Csa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxlnBFUWNor04gAQ--.4584S3;
	Tue, 01 Jul 2025 11:08:53 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxpeQ7UWNolGYEAA--.27732S7;
	Tue, 01 Jul 2025 11:08:52 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/13] LoongArch: KVM: Rename loongarch_eiointc_readq with loongarch_eiointc_read
Date: Tue,  1 Jul 2025 11:08:34 +0800
Message-Id: <20250701030842.1136519-6-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250701030842.1136519-1-maobibo@loongson.cn>
References: <20250701030842.1136519-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeQ7UWNolGYEAA--.27732S7
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

General function loongarch_eiointc_read() will be used for 1/2/4/8
bytes read access, it comes from loongarch_eiointc_readq().

Here rename function loongarch_eiointc_readq() with
loongarch_eiointc_read().

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 137cd3adca80..e169b96b7e5c 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -256,8 +256,8 @@ static int loongarch_eiointc_readl(struct kvm_vcpu *vcpu, struct loongarch_eioin
 	return ret;
 }
 
-static int loongarch_eiointc_readq(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
-				gpa_t addr, void *val)
+static int loongarch_eiointc_read(struct kvm_vcpu *vcpu, struct loongarch_eiointc *s,
+				gpa_t addr, unsigned long *val)
 {
 	int index, ret = 0;
 	u64 data = 0;
@@ -293,7 +293,7 @@ static int loongarch_eiointc_readq(struct kvm_vcpu *vcpu, struct loongarch_eioin
 		ret = -EINVAL;
 		break;
 	}
-	*(u64 *)val = data;
+	*val = data;
 
 	return ret;
 }
@@ -303,7 +303,7 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 			gpa_t addr, int len, void *val)
 {
 	int ret = -EINVAL;
-	unsigned long flags;
+	unsigned long flags, data;
 	struct loongarch_eiointc *eiointc = vcpu->kvm->arch.eiointc;
 
 	if (!eiointc) {
@@ -329,7 +329,8 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 		ret = loongarch_eiointc_readl(vcpu, eiointc, addr, val);
 		break;
 	default:
-		ret = loongarch_eiointc_readq(vcpu, eiointc, addr, val);
+		ret = loongarch_eiointc_read(vcpu, eiointc, addr, &data);
+		*(u64 *)val = data;
 		break;
 	}
 	spin_unlock_irqrestore(&eiointc->lock, flags);
-- 
2.39.3

