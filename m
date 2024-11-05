Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD2D1B6CE6
	for <loongarch@lists.linux.dev>; Tue,  5 Nov 2024 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809803; cv=none; b=KIfzu9WOoD6j6Myr+Bc7JMfIJZZNIeqE3PZlUppB8DltyNOtNSiw2p5YkvLsqluOE8sl+SDEQtlZDi2hTVznw3W2nPr/cEf2SIwLv8i1DIU0UcE0dltEoa13iw45OhC1Q++OjBV4FDp4AOU5T6dUea6dDHpXXqm7tLYfMvkgGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809803; c=relaxed/simple;
	bh=JcS5tCb+phxSQzQMJehrhVoydruiI6oeuAogtf1sBYk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AnDgwVzpH6LunEMKuKgbdQhYzt60gM5iL15+OEJAiv4m7svU0HXNXo9qhaKAsqo7ZWnB4aMKJV8vlaA2x4b+tn9sjiCVp7ROi0MGD50pKNdiIdsH5lk2+NYDFTsumHqqaW9t2GG5nfM4acz3nfEiQVzmp8LJRQlCuM3BGkVIpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx2uG_DypnwLExAA--.35743S3;
	Tue, 05 Nov 2024 20:29:52 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxHEe+Dypno4RCAA--.57194S2;
	Tue, 05 Nov 2024 20:29:50 +0800 (CST)
From: Kanglong Wang <wangkanglong@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Add DMW2 shadow mapping in KASAN
Date: Tue,  5 Nov 2024 20:29:45 +0800
Message-Id: <20241105122945.21886-1-wangkanglong@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxHEe+Dypno4RCAA--.57194S2
X-CM-SenderInfo: 5zdqwyxdqjz0tqj6z05rqj20fqof0/1tbiAQEMAmcpTjsJsQAHsK
X-Coremail-Antispam: 1Uk129KBj93XoWxGry3JFW7GrWrZw13tr4xuFX_yoWrJF4Dp3
	93JFyv9rWkKF1xW34Ykr1Utr1DtrnxCanIva45XF4fJF4xu34Igr1DGFWvqa4qqr4UJFyY
	9r1kuayUX39rAwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1YL9UUUUU=

Currently,the kernel couldn't boot when both CONFIG_ARCH_IOREMAP,
CONFIG_ARCH_WRITECOMBINE and KASAN are enabled. Because the DMW2 is used
by kernel now which is configured as 0xa000000000000000, the KASAN has
no segment mapping. This patch fix this issue.

Solution: Add the relevant definitions for DMW2 in KASAN.

Fixes: 8e02c3b782ec ("LoongArch: Add writecombine support for DMW-based ioremap()")
Signed-off-by: Kanglong Wang <wangkanglong@loongson.cn>
---
 arch/loongarch/include/asm/kasan.h | 11 ++++++++++-
 arch/loongarch/mm/kasan_init.c     |  5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
index c6bce5fbff57..2636a1160bae 100644
--- a/arch/loongarch/include/asm/kasan.h
+++ b/arch/loongarch/include/asm/kasan.h
@@ -25,6 +25,7 @@
 /* 64-bit segment value. */
 #define XKPRANGE_UC_SEG		(0x8000)
 #define XKPRANGE_CC_SEG		(0x9000)
+#define XKPRANGE_WC_SEG		(0xa000)
 #define XKVRANGE_VC_SEG		(0xffff)
 
 /* Cached */
@@ -41,10 +42,17 @@
 #define XKPRANGE_UC_SHADOW_SIZE		(XKPRANGE_UC_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
 #define XKPRANGE_UC_SHADOW_END		(XKPRANGE_UC_KASAN_OFFSET + XKPRANGE_UC_SHADOW_SIZE)
 
+/* Weak-ordered UnCached */
+#define XKPRANGE_WC_START		WRITECOMBINE_BASE
+#define XKPRANGE_WC_SIZE		XRANGE_SIZE
+#define XKPRANGE_WC_KASAN_OFFSET	XKPRANGE_UC_SHADOW_END
+#define XKPRANGE_WC_SHADOW_SIZE		(XKPRANGE_WC_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
+#define XKPRANGE_WC_SHADOW_END		(XKPRANGE_WC_KASAN_OFFSET + XKPRANGE_WC_SHADOW_SIZE)
+
 /* VMALLOC (Cached or UnCached)  */
 #define XKVRANGE_VC_START		MODULES_VADDR
 #define XKVRANGE_VC_SIZE		round_up(KFENCE_AREA_END - MODULES_VADDR + 1, PGDIR_SIZE)
-#define XKVRANGE_VC_KASAN_OFFSET	XKPRANGE_UC_SHADOW_END
+#define XKVRANGE_VC_KASAN_OFFSET	XKPRANGE_WC_SHADOW_END
 #define XKVRANGE_VC_SHADOW_SIZE		(XKVRANGE_VC_SIZE >> KASAN_SHADOW_SCALE_SHIFT)
 #define XKVRANGE_VC_SHADOW_END		(XKVRANGE_VC_KASAN_OFFSET + XKVRANGE_VC_SHADOW_SIZE)
 
@@ -55,6 +63,7 @@
 
 #define XKPRANGE_CC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_CC_KASAN_OFFSET)
 #define XKPRANGE_UC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_UC_KASAN_OFFSET)
+#define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
 #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
 
 extern bool kasan_early_stage;
diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 427d6b1aec09..0babfab73448 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -55,6 +55,9 @@ void *kasan_mem_to_shadow(const void *addr)
 		case XKPRANGE_UC_SEG:
 			offset = XKPRANGE_UC_SHADOW_OFFSET;
 			break;
+		case XKPRANGE_WC_SEG:
+			offset = XKPRANGE_WC_SHADOW_OFFSET;
+			break;
 		case XKVRANGE_VC_SEG:
 			offset = XKVRANGE_VC_SHADOW_OFFSET;
 			break;
@@ -79,6 +82,8 @@ const void *kasan_shadow_to_mem(const void *shadow_addr)
 
 	if (addr >= XKVRANGE_VC_SHADOW_OFFSET)
 		return (void *)(((addr - XKVRANGE_VC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKVRANGE_VC_START);
+	else if (addr >= XKPRANGE_WC_SHADOW_OFFSET)
+		return (void *)(((addr - XKPRANGE_WC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_WC_START);
 	else if (addr >= XKPRANGE_UC_SHADOW_OFFSET)
 		return (void *)(((addr - XKPRANGE_UC_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT) + XKPRANGE_UC_START);
 	else if (addr >= XKPRANGE_CC_SHADOW_OFFSET)
-- 
2.20.1

