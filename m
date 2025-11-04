Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962AA2D7DCE
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762256827; cv=none; b=VJ52VEP9lx7oaXJofR/7eueNAUfTKVyRMcqx6PLoTUV1qYddHCDKKoCNq18SaQkQ6t4ekD5f+a3cCc3MRPi07ZT0/Z3TbDMngf/H8eLSM6gZyV9i5N9TTl1B2zxJLDhIMp6PI4lPgBfMGIZHtzhcKagRNYn1CHYX/te2rDOgANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762256827; c=relaxed/simple;
	bh=lvS0akj3jwhum+640i2yy985glN9eEOQqYjI1B5pOMc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WNYkMXuiguYuT3TMZX5NA0/MEaDNunwnCEM/Mx5RmZMioyfl+aRzcn9FunkOsyarq5yyP8pkrgiv9QOYEhA0oPAvv/zQpZVCasn8y1ulJDdrd7jJSU9Id6U/oIH5W9K9yc2vtpLvuF2+n3VU9REdCeMjIV0NwdhY917u7nSqqUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxztK25wlp6LUeAA--.575S3;
	Tue, 04 Nov 2025 19:47:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxmcC15wlp0jQmAQ--.29563S2;
	Tue, 04 Nov 2025 19:47:01 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Add delay until timer interrupt injected
Date: Tue,  4 Nov 2025 19:46:58 +0800
Message-Id: <20251104114659.1562404-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxmcC15wlp0jQmAQ--.29563S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

When timer is fired in oneshot mode, CSR TVAL will stop with value -1
rather than 0. However when register CSR TVAL is restored, it will
continue to count down rather than stop there.

Now the method is to write 0 to CSR TVAL, wait to count down for 1
cycle at least, which is 10ns with timer freq 100MHZ, and retore timer
interrupt status. Here add 2 cycles delay to assure that timer interrupt
is injected.

With this patch, timer selftest case passes to run always.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
index 32dc213374be..daf1b60a8d47 100644
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
  */
 
+#include <asm/delay.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_csr.h>
 #include <asm/kvm_vcpu.h>
@@ -95,6 +96,8 @@ void kvm_restore_timer(struct kvm_vcpu *vcpu)
 		 * and set CSR TVAL with -1
 		 */
 		write_gcsr_timertick(0);
+		/* wait more than 1 cycle until timer interrupt injected */
+		__delay(2);
 
 		/*
 		 * Writing CSR_TINTCLR_TI to LOONGARCH_CSR_TINTCLR will clear

base-commit: ec0b62ccc986c06552c57f54116171cfd186ef92
-- 
2.39.3

