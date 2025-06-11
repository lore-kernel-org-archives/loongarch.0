Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD9813CA97
	for <loongarch@lists.linux.dev>; Wed, 11 Jun 2025 01:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606708; cv=none; b=ukfFk7PZJt/xL/IWQrytA3X4F0OEbP28qK62Joj88bE+x6aRAIJiPUBHuMuZvR6ij4ojEf0xOB315PXb0fnW2eqAQvMH6hxmvOszCZ44FnHEML2DnSvpcc2iKjVPMvDIwXFmFN+NLqHYAUqMKUlzpPkYp5MjhneX3elPExtYTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606708; c=relaxed/simple;
	bh=WR+OC66bsWbh7oerKCupNJIST5tHLZ3Uqr/wnP0OJvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jNxGdcbDXybmRj1bMz5X+ybcSx8eVhC92H8oGNUJnAOuGqJ4/3zFAQR3Vl1qKioXlPiBWg+qNNDmb4t2EmZGi0xyQY3EoZ4XRZdROFkhn42vpemBqSaX/jG1oiwukJL8U50jAaTbCxFxc5MKve9ZLKqIvBZYuKmEZdSVnAcMSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxLGsx4UhoKkQTAQ--.47397S3;
	Wed, 11 Jun 2025 09:51:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMCxPscx4UhoikwVAQ--.2322S2;
	Wed, 11 Jun 2025 09:51:45 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] LoongArch: KVM: INTC: Add address alignment check
Date: Wed, 11 Jun 2025 09:51:45 +0800
Message-Id: <20250611015145.3042884-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250611014651.3042734-1-maobibo@loongson.cn>
References: <20250611014651.3042734-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxPscx4UhoikwVAQ--.2322S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

IOCSR instruction supports 1/2/4/8 bytes access, the address should
be naturally aligned with its access size. Here address alignment
check is added in eiointc kernel emulation.

At the same time len must be 1/2/4/8 bytes from iocsr exit emulation
function kvm_emu_iocsr(), remove the default case in switch case
statements.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 8b0d9376eb54..4e9d12300cc4 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -311,6 +311,12 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 	}
 
+	/* len must be 1/2/4/8 from function kvm_emu_iocsr() */
+	if (addr & (len - 1)) {
+		kvm_err("%s: eiointc not aligned addr %llx len %d\n", __func__, addr, len);
+		return -EINVAL;
+	}
+
 	vcpu->stat.eiointc_read_exits++;
 	spin_lock_irqsave(&eiointc->lock, flags);
 	switch (len) {
@@ -323,12 +329,9 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
 	case 4:
 		ret = loongarch_eiointc_readl(vcpu, eiointc, addr, val);
 		break;
-	case 8:
+	default:
 		ret = loongarch_eiointc_readq(vcpu, eiointc, addr, val);
 		break;
-	default:
-		WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
-						__func__, addr, len);
 	}
 	spin_unlock_irqrestore(&eiointc->lock, flags);
 
@@ -682,6 +685,11 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 	}
 
+	if (addr & (len - 1)) {
+		kvm_err("%s: eiointc not aligned addr %llx len %d\n", __func__, addr, len);
+		return -EINVAL;
+	}
+
 	vcpu->stat.eiointc_write_exits++;
 	spin_lock_irqsave(&eiointc->lock, flags);
 	switch (len) {
@@ -694,12 +702,9 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
 	case 4:
 		ret = loongarch_eiointc_writel(vcpu, eiointc, addr, val);
 		break;
-	case 8:
+	default:
 		ret = loongarch_eiointc_writeq(vcpu, eiointc, addr, val);
 		break;
-	default:
-		WARN_ONCE(1, "%s: Abnormal address access: addr 0x%llx, size %d\n",
-						__func__, addr, len);
 	}
 	spin_unlock_irqrestore(&eiointc->lock, flags);
 
-- 
2.39.3

