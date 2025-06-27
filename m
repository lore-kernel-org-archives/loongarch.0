Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35D52951A0
	for <loongarch@lists.linux.dev>; Fri, 27 Jun 2025 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015116; cv=none; b=FjQiz6Lf2CgCcO71R/sG5ug+Zt8xTa5wh8BDbVvjflhnwhJ/W24sFRckTWRlLK8aVaZlb8F4eFyKcDrN9j4efArvX1BOSrOF0QK9SuwhEqy3FMxLUt2XYEo06GFdxjVrQNNqrmFaXOYsRB6MiN8+ZtjP3doennhvi/U+oM8q5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015116; c=relaxed/simple;
	bh=uD27TLOkmLE97SKX+m1nAjFPEUD7oQ+EyEzUgNGPZHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=isFo5NhlHWnHhebQswpwy9/TknqO+/gayOPyqexNtvn6KWexB6kQYQ2P48fIM6tJhNxgDKzb/EvN8zhOQV7KOzkeuxP4OGOI1NvpzOrs/bDbnXEaMAmj8klOIw8jZsXbyiveNTMAhSWZmo5bFj/pvALOkLR+ROeWH8Oe1eGbfIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Axx2nJXl5oTDIeAQ--.32649S3;
	Fri, 27 Jun 2025 17:05:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxM+TEXl5ovCsAAA--.1247S5;
	Fri, 27 Jun 2025 17:05:12 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 3/6] LoongArch: KVM: Disable update property num_cpu and feature
Date: Fri, 27 Jun 2025 17:05:04 +0800
Message-Id: <20250627090507.808319-4-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250627090507.808319-1-maobibo@loongson.cn>
References: <20250627090507.808319-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxM+TEXl5ovCsAAA--.1247S5
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Property num_cpu and feature is read-only once eiointc is created, which
is set with KVM_DEV_LOONGARCH_EXTIOI_GRP_CTRL attr group before device
creation.

Attr group KVM_DEV_LOONGARCH_EXTIOI_GRP_SW_STATUS is to update register
and software state for migration and reset usage, property num_cpu and
feature can not be update again if it is created already.

Here discard write operation with property num_cpu and feature in attr
group KVM_DEV_LOONGARCH_EXTIOI_GRP_CTRL.

Cc: stable@vger.kernel.org
Fixes: 1ad7efa552fd ("LoongArch: KVM: Add EIOINTC user mode read and write functions")
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 0b648c56b0c3..b48511f903b5 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -910,9 +910,22 @@ static int kvm_eiointc_sw_status_access(struct kvm_device *dev,
 	data = (void __user *)attr->addr;
 	switch (addr) {
 	case KVM_DEV_LOONGARCH_EXTIOI_SW_STATUS_NUM_CPU:
+		/*
+		 * Property num_cpu and feature is read-only once eiointc is
+		 * created with KVM_DEV_LOONGARCH_EXTIOI_GRP_CTRL group API
+		 *
+		 * Disable writing with KVM_DEV_LOONGARCH_EXTIOI_GRP_SW_STATUS
+		 * group API
+		 */
+		if (is_write)
+			return ret;
+
 		p = &s->num_cpu;
 		break;
 	case KVM_DEV_LOONGARCH_EXTIOI_SW_STATUS_FEATURE:
+		if (is_write)
+			return ret;
+
 		p = &s->features;
 		break;
 	case KVM_DEV_LOONGARCH_EXTIOI_SW_STATUS_STATE:
-- 
2.39.3

