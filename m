Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59771AAA1D
	for <loongarch@lists.linux.dev>; Tue,  3 Jun 2025 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943985; cv=none; b=TMO0D37qBWzmr3YqwD8DxkQg1ENmlbbtA3pcdKWw0lPWJ5jPHReyVzOiI9e7Kfny4JpTuj5Y1ELiOSt8ePr/PDYGzTFAeqYygttSfB8SxjM2lwXRbcYdfdwnkJg6RiOosDadYJF4cEm21x2zNLTjs2CAIK3CnzaAqxwqi7nzDVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943985; c=relaxed/simple;
	bh=uD27TLOkmLE97SKX+m1nAjFPEUD7oQ+EyEzUgNGPZHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JqXcadTLrXsDCPn/e0/nGXZue7TGZs3ZiK07op/VswqsYEthOrHxzAjGnNXIMeEt4CDYDnAyPuclrBY0hdCwd5F61zVLMDOmHy9EzF9ZxKQGTj6Ku4byUnQZfa+wyAZXbZJ7JLHofdwewNPiptImhtNel48dsAOkX0OCV8hd/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxHHJoxD5oUQwKAQ--.32738S3;
	Tue, 03 Jun 2025 17:46:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxH+VfxD5ot8gGAQ--.23188S5;
	Tue, 03 Jun 2025 17:46:15 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/7] LoongArch: KVM: Disable update property num_cpu and feature with eiointc
Date: Tue,  3 Jun 2025 17:46:02 +0800
Message-Id: <20250603094606.1053622-4-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250603094606.1053622-1-maobibo@loongson.cn>
References: <20250603094606.1053622-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+VfxD5ot8gGAQ--.23188S5
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

