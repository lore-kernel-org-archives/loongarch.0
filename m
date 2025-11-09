Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100FE13B58C
	for <loongarch@lists.linux.dev>; Sun,  9 Nov 2025 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762655566; cv=none; b=WxITwhEcHfjoERAEDWQD9OHw5KEIkAHtWv0q7pas1PMtlZWKyTINEX6TgnYO5crgacaISNXy1dyhbrRMRj6vLkgxRclh+veQb31RItAD2eBNELI6Dhi1zMSDPRI5u36QenJ6R+42K6rDhaKTFOEcrE8L1MlZEFC+ftjhGePTnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762655566; c=relaxed/simple;
	bh=yP0wUqwDv+VrvJrRl4MeGRT5eX9vSWFZy6msvm4MXXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/LkuJHrUQ65STZS44IdXoLT9XVtQMifNhYqNjUpH8iOsIOCXNsEwodbKf2v/6U0x2cfSTlUR222VBth2Hkm7RPfcXJlHtNIBAPyoEgT0gsNPh26Ewjhx5UKuPbrldK5UTcJnLfGDQLEYC62JiKyuPnJKVlMS2CaYUtwN3cUOGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.45])
	by gateway (Coremail) with SMTP id _____8Bx39NK_Q9p69cgAA--.1070S3;
	Sun, 09 Nov 2025 10:32:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.45])
	by front1 (Coremail) with SMTP id qMiowJAxleQ4_Q9pqzAsAQ--.2346S2;
	Sun, 09 Nov 2025 10:32:41 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Consolidate early_ioremap()/ioremap_prot()
Date: Sun,  9 Nov 2025 10:32:14 +0800
Message-ID: <20251109023214.355231-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxleQ4_Q9pqzAsAQ--.2346S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFy5tFyrur1kAr1rJFyUXFc_yoW8ury8pF
	92kr1kJFs8Kr1xGFykJFy7Wr1UtFnrKFWIqFW2kF9xu3Wjvr18ZrWkCr90vFyUXa95KFWr
	XrZ3Wa43CF4UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

1. Use phys_addr_t instead of u64, which can work for both 32/64 bits.
2. Check whether the input physical address is above TO_PHYS_MASK (and
   return NULL if yes) for the DMW version.

Note: In theory early_ioremap() also need the TO_PHYS_MASK checking, but
the UEFI BIOS pass some DMW virtual addresses.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/io.h | 5 ++++-
 arch/loongarch/mm/ioremap.c     | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index eaff72b38dc8..0130185e0349 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -14,7 +14,7 @@
 #include <asm/pgtable-bits.h>
 #include <asm/string.h>
 
-extern void __init __iomem *early_ioremap(u64 phys_addr, unsigned long size);
+extern void __init __iomem *early_ioremap(phys_addr_t phys_addr, unsigned long size);
 extern void __init early_iounmap(void __iomem *addr, unsigned long size);
 
 #define early_memremap early_ioremap
@@ -25,6 +25,9 @@ extern void __init early_iounmap(void __iomem *addr, unsigned long size);
 static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
 					 pgprot_t prot)
 {
+	if (offset > TO_PHYS_MASK)
+		return NULL;
+
 	switch (pgprot_val(prot) & _CACHE_MASK) {
 	case _CACHE_CC:
 		return (void __iomem *)(unsigned long)(CACHE_BASE + offset);
diff --git a/arch/loongarch/mm/ioremap.c b/arch/loongarch/mm/ioremap.c
index df949a3d0f34..27c336959fe8 100644
--- a/arch/loongarch/mm/ioremap.c
+++ b/arch/loongarch/mm/ioremap.c
@@ -6,7 +6,7 @@
 #include <asm/io.h>
 #include <asm-generic/early_ioremap.h>
 
-void __init __iomem *early_ioremap(u64 phys_addr, unsigned long size)
+void __init __iomem *early_ioremap(phys_addr_t phys_addr, unsigned long size)
 {
 	return ((void __iomem *)TO_CACHE(phys_addr));
 }
-- 
2.47.3

