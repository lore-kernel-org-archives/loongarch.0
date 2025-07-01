Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D834E1E3775
	for <loongarch@lists.linux.dev>; Tue,  1 Jul 2025 03:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339335; cv=none; b=ju3doYeKjHfktyRfbtr99vpubb9Z5eUZmw5hUZ/iWHtN3NECIqzFJANdpiYCOsDmM3wVaqwWguIXR8tvpv/MxW5TRH26MCIXt1gFi8dcsiV7Cg2crmeytnSvMwzQyB4mwv2oS62cbvmmozcNX0x4u6QccNANe+j+wwO+Jc2vtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339335; c=relaxed/simple;
	bh=ryb6hx0FWcCXe6vAqcJ437xJ27ug4a9xTIatX/wE6HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WTTru23MByS2V1GZSs3nShBTXkPVli/xSAe6ADWr0WOIIvC73qVAha2JkGGo7GDB0GGGJpiZu1cjSJ+jc90hMTOz5Pv7EeAUxk4ffx+62n5lxNhrmdqgafmHMLUcwOqV/xmM6I9FLPHjHM1vot1OzJUJ3cqC8NdkFDWfo/Hev5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxaeFEUWNorE4gAQ--.27347S3;
	Tue, 01 Jul 2025 11:08:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxpeQ7UWNolGYEAA--.27732S6;
	Tue, 01 Jul 2025 11:08:52 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/13] LoongArch: KVM: Remove never called default case statement
Date: Tue,  1 Jul 2025 11:08:33 +0800
Message-Id: <20250701030842.1136519-5-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowJBxpeQ7UWNolGYEAA--.27732S6
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

IOCSR instruction supports 1/2/4/8 bytes access, len must be 1/2/4/8
bytes from iocsr exit emulation function kvm_emu_iocsr(), remove the
default case in switch case statements.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 92bae1dea8eb..137cd3adca80 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -328,12 +328,9 @@ static int kvm_eiointc_read(struct kvm_vcpu *vcpu,
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
 
@@ -704,12 +701,9 @@ static int kvm_eiointc_write(struct kvm_vcpu *vcpu,
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

