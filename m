Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F493EBF2F
	for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503631; cv=none; b=kGsDKGXN6MSWLDYcxBE6Aflb+ey6MNr115JFHZKCCcmy4UQ2Y+d2+7oo6OF+KnDx6b4O0Ti0NAwKTY/ztGHtw3tc5FM9XnZM0M+bdAIpNEXMwC5u4ZTM24ZnWnBibkNzTtURk1UnwRsKs9tzqo85Gd7R5LURjbxw5jkI4Vq9gF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503631; c=relaxed/simple;
	bh=7h07a0cHWbB+eDlpYQe+Ab4msRcMXThPTZd71fT99x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLUV2z9/hs6uCs2JuzJBzzBy5sDHy46n2203ScE12HIY5pwhxZwuDyWK5/+WttDnIYj++nUGY2DiCDnr+eNZKnaJF/rQO1LD1946YQ0gziSDxM8K4yQrIFcoOBhsjTA5pA89XO0TgKIO6rGoGD0azoC2FvQfWQdgfHxLKKNhobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8DxecKLe3hprg0NAA--.42108S3;
	Tue, 27 Jan 2026 16:47:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxZcBke3hpNig0AA--.3500S4;
	Tue, 27 Jan 2026 16:47:04 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	stable@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 3/3] LoongArch: Rework KASAN initialization for PTW-enabled systems
Date: Tue, 27 Jan 2026 16:46:19 +0800
Message-ID: <20260127084619.1140692-3-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127084619.1140692-1-chenhuacai@loongson.cn>
References: <20260127084430.1135547-1-chenhuacai@loongson.cn>
 <20260127084619.1140692-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZcBke3hpNig0AA--.3500S4
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Wry5Kw1fAF4kAr1kGr13KFX_yoW7Cw1rpr
	WkKa48Kr4vqr4qganxGw1UZryDJws3Ca97tFZxta95Kay3CF1Fqr1kGFyxZFyUWrW8JF1Y
	yw1fAFZ8Gr45JacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
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

From: Tiezhu Yang <yangtiezhu@loongson.cn>

kasan_init_generic() indicates that kasan is fully initialized, so it
should be put at end of kasan_init().

Otherwise bringing up the primary CPU failed when CONFIG_KASAN is set
on PTW-enabled systems, here are the call chains:

    kernel_entry()
      start_kernel()
        setup_arch()
          kasan_init()
            kasan_init_generic()

The reason is PTW-enabled systems have speculative accesses which means
memory accesses to the shadow memory after kasan_init() may be executed
by hardware before. However, accessing shadow memory is safe only after
kasan fully initialized because kasan_init() uses a temporary PGD table
until we have populated all levels of shadow page tables and writen the
PGD register. Moving kasan_init_generic() later can defer the occasion
of kasan_enabled(), so as to avoid speculative accesses on shadow pages.

After moving kasan_init_generic() to the end, kasan_init() can no longer
call kasan_mem_to_shadow() for shadow address conversion because it will
always return kasan_early_shadow_page. On the other hand, we should keep
the current logic of kasan_mem_to_shadow() for both the early and final
stage because there may be instrumentation before kasan_init().

To solve this, we factor out a new mem_to_shadow() function from current
kasan_mem_to_shadow() for the shadow address conversion in kasan_init().

Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/kasan_init.c | 78 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 38 deletions(-)

diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
index 170da98ad4f5..0fc02ca06457 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,39 +40,43 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define __pte_none(early, pte) (early ? pte_none(pte) : \
 ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
 
-void *kasan_mem_to_shadow(const void *addr)
+static void *mem_to_shadow(const void *addr)
 {
-	if (!kasan_enabled()) {
+	unsigned long offset = 0;
+	unsigned long maddr = (unsigned long)addr;
+	unsigned long xrange = (maddr >> XRANGE_SHIFT) & 0xffff;
+
+	if (maddr >= FIXADDR_START)
 		return (void *)(kasan_early_shadow_page);
-	} else {
-		unsigned long maddr = (unsigned long)addr;
-		unsigned long xrange = (maddr >> XRANGE_SHIFT) & 0xffff;
-		unsigned long offset = 0;
-
-		if (maddr >= FIXADDR_START)
-			return (void *)(kasan_early_shadow_page);
-
-		maddr &= XRANGE_SHADOW_MASK;
-		switch (xrange) {
-		case XKPRANGE_CC_SEG:
-			offset = XKPRANGE_CC_SHADOW_OFFSET;
-			break;
-		case XKPRANGE_UC_SEG:
-			offset = XKPRANGE_UC_SHADOW_OFFSET;
-			break;
-		case XKPRANGE_WC_SEG:
-			offset = XKPRANGE_WC_SHADOW_OFFSET;
-			break;
-		case XKVRANGE_VC_SEG:
-			offset = XKVRANGE_VC_SHADOW_OFFSET;
-			break;
-		default:
-			WARN_ON(1);
-			return NULL;
-		}
 
-		return (void *)((maddr >> KASAN_SHADOW_SCALE_SHIFT) + offset);
+	maddr &= XRANGE_SHADOW_MASK;
+	switch (xrange) {
+	case XKPRANGE_CC_SEG:
+		offset = XKPRANGE_CC_SHADOW_OFFSET;
+		break;
+	case XKPRANGE_UC_SEG:
+		offset = XKPRANGE_UC_SHADOW_OFFSET;
+		break;
+	case XKPRANGE_WC_SEG:
+		offset = XKPRANGE_WC_SHADOW_OFFSET;
+		break;
+	case XKVRANGE_VC_SEG:
+		offset = XKVRANGE_VC_SHADOW_OFFSET;
+		break;
+	default:
+		WARN_ON(1);
+		return NULL;
 	}
+
+	return (void *)((maddr >> KASAN_SHADOW_SCALE_SHIFT) + offset);
+}
+
+void *kasan_mem_to_shadow(const void *addr)
+{
+	if (kasan_enabled())
+		return mem_to_shadow(addr);
+	else
+		return (void *)(kasan_early_shadow_page);
 }
 
 const void *kasan_shadow_to_mem(const void *shadow_addr)
@@ -293,11 +297,8 @@ void __init kasan_init(void)
 	/* Maps everything to a single page of zeroes */
 	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE, true);
 
-	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
-					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
-
-	/* Enable KASAN here before kasan_mem_to_shadow(). */
-	kasan_init_generic();
+	kasan_populate_early_shadow(mem_to_shadow((void *)VMALLOC_START),
+					mem_to_shadow((void *)KFENCE_AREA_END));
 
 	/* Populate the linear mapping */
 	for_each_mem_range(i, &pa_start, &pa_end) {
@@ -307,13 +308,13 @@ void __init kasan_init(void)
 		if (start >= end)
 			break;
 
-		kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
-			(unsigned long)kasan_mem_to_shadow(end), NUMA_NO_NODE);
+		kasan_map_populate((unsigned long)mem_to_shadow(start),
+			(unsigned long)mem_to_shadow(end), NUMA_NO_NODE);
 	}
 
 	/* Populate modules mapping */
-	kasan_map_populate((unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR),
-		(unsigned long)kasan_mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
+	kasan_map_populate((unsigned long)mem_to_shadow((void *)MODULES_VADDR),
+		(unsigned long)mem_to_shadow((void *)MODULES_END), NUMA_NO_NODE);
 	/*
 	 * KAsan may reuse the contents of kasan_early_shadow_pte directly, so we
 	 * should make sure that it maps the zero page read-only.
@@ -328,4 +329,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages */
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
-- 
2.47.3

