Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FAB1E3762
	for <loongarch@lists.linux.dev>; Mon, 16 Jun 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059353; cv=none; b=Om/qTXMiTDylC7dR60KwnXYTpHtBl4SC+M0Hk+vZMMBG3SIkc/PqodUNuYXaUrBNvSu2v/FXansYETesCMfvl7z5Nm7UG1SzQt4I0aMwK5g3ko9K6MfNRN69jmsMtT4EfQUdVHE6Zrcy2YFATvLk2dtDFbLA+46ShF0UpnUPsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059353; c=relaxed/simple;
	bh=OXHyOQjPAclYNECK89o5OFOvELjQkjU9xXw6+X5XWRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+rn6iud3+DXy+Ylr1CCSbyMrGywHZa5YejqmuH+v+66PuYyvDE9teyeAkbmoPH9M94+IUQKaRiWA0EymzHyzIimQADuRMCzNFx5mlT8epytUEaDloKlH8YrijsM8I+03zE5aQYsOuzYFMLhrvC43v49gaGzH2FiXe+Yi3WAM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxGHFTyU9ox40XAQ--.57381S3;
	Mon, 16 Jun 2025 15:35:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxvhtLyU9okMEcAQ--.34084S3;
	Mon, 16 Jun 2025 15:35:41 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: KVM: INTC: Remove local variable device1
Date: Mon, 16 Jun 2025 15:35:38 +0800
Message-Id: <20250616073539.129365-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250616073539.129365-1-maobibo@loongson.cn>
References: <20250616073539.129365-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxvhtLyU9okMEcAQ--.34084S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Local variable device1 can be replaced with existing variable device,
it makes code concise.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/eiointc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index f39929d7bf8a..d9c4fe93405d 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -956,7 +956,7 @@ static int kvm_eiointc_create(struct kvm_device *dev, u32 type)
 {
 	int ret;
 	struct loongarch_eiointc *s;
-	struct kvm_io_device *device, *device1;
+	struct kvm_io_device *device;
 	struct kvm *kvm = dev->kvm;
 
 	/* eiointc has been created */
@@ -984,10 +984,10 @@ static int kvm_eiointc_create(struct kvm_device *dev, u32 type)
 		return ret;
 	}
 
-	device1 = &s->device_vext;
-	kvm_iodevice_init(device1, &kvm_eiointc_virt_ops);
+	device = &s->device_vext;
+	kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
 	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
-			EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device1);
+			EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
 	if (ret < 0) {
 		kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device);
 		kfree(s);
-- 
2.39.3

