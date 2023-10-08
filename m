Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com [136.143.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35118BE48
	for <loongarch@lists.linux.dev>; Sun,  8 Oct 2023 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="PD/Y0r/Q"
ARC-Seal: i=1; a=rsa-sha256; t=1696770157; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iJ3STLMZ8t20XLJ5EROqQu9VvTc7QljoWk+YCnzFmzW/BGM9gbxBksj6BeGfukgAXH80tpaYMuZD5oeAtcRKNGdjjlx1KstjVI1hcSBVATGRSt/LFJXk9PURa97jTekMbxrwK9FMLDc37B3FrJSSDKoFDMbqCzyGN2zO+i4Y+xE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696770157; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VBlxTHh+op4ADZ3ZQmt0tLZf0Cudg9IHwDc+to4R0Yg=; 
	b=DSwytPz8xXjXePqa4f4z6FSnMcRjmmnfHgqiGDx6kx4ZKr5bUdxVuj0xL3Gd7UuSbtiUyWv5QoeKI5prVRn40y/M9yFaDie6d+hEeqQS90k5lBcKlpQ5FMeQ9KfuLZ9lxA6VQSC1f9hiL+SE3J8sa62P9klBu783a8s0NveV0X8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696770157;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=VBlxTHh+op4ADZ3ZQmt0tLZf0Cudg9IHwDc+to4R0Yg=;
	b=PD/Y0r/QvaqzF3TApAWBfq5tmAnmdEN0Opi6Em8nrG3xbYZon66fXhEb6l+3SZ5Y
	VRGOY1aA+nVoztC2WWxDREHlowb7PalVJfAqX9Xn7GVeJ3jXao1F3JkdbKona9napxQ
	0U8x5TeMCkUVr3s56D/LCACyDrJbaFSa32Sh3WTjUEAXPKL3BBC08qHHkTVZowwDxfi
	yG9gRVRv7f302V0BYNvtW8nIRLQ0hQaETjr1wMta4JeBgusCrnRxMWnfM6w79f29hWj
	Tq1CO/7ftu4cT6xXMHnp6W0PXMha8KJPReqvRIiMazun3WYkJ6wb0YEfGvtDUBejqly
	PxDax5VucQ==
Received: from edelgard.fodlan.icenowy.me (120.85.97.233 [120.85.97.233]) by mx.zohomail.com
	with SMTPS id 1696770154734739.6304167491805; Sun, 8 Oct 2023 06:02:34 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jun Yi <yijun@loongson.cn>,
	Baoquan He <bhe@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Youling Tang <tangyouling@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Zhihong Dong <donmor3000@hotmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] loongarch/mm: disable WUC for pgprot_writecombine() too
Date: Sun,  8 Oct 2023 21:02:04 +0800
Message-Id: <20231008130204.489081-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently the code disables WUC only disables it for ioremap_wc(), which
is only used when mapping writecombine pages like ioremap() (mapped to
the kernel space). For VRAM mapped in TTM/GEM, it's mapped with a
crafted pgprot with pgprot_writecombine() function, which isn't
corrently disabled now.

Disable WUC for pgprot_writecombine() (fallback to SUC) too.

This improves AMDGPU driver stability on Loongson 3A5000 machines.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/loongarch/include/asm/io.h           |  4 +---
 arch/loongarch/include/asm/pgtable-bits.h |  9 ++++++++-
 arch/loongarch/kernel/setup.c             | 10 +++++-----
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 0dcb36b32cb25..5477d9e3ab072 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -52,10 +52,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
  * @offset:    bus address of the memory
  * @size:      size of the resource to map
  */
-extern pgprot_t pgprot_wc;
-
 #define ioremap_wc(offset, size)	\
-	ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
+	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL_WC))
 
 #define ioremap_cache(offset, size)	\
 	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 35348d4c4209a..c9e3ed330fb97 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -92,6 +92,13 @@
 
 #ifndef __ASSEMBLY__
 
+extern bool wc_enabled;
+
+#define _CACHE_WC	(wc_enabled ? _CACHE_WUC : _CACHE_SUC)
+
+#define PAGE_KERNEL_WC	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
+				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WC)
+
 #define _PAGE_IOREMAP		pgprot_val(PAGE_KERNEL_SUC)
 
 #define pgprot_noncached pgprot_noncached
@@ -111,7 +118,7 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 {
 	unsigned long prot = pgprot_val(_prot);
 
-	prot = (prot & ~_CACHE_MASK) | _CACHE_WUC;
+	prot = (prot & ~_CACHE_MASK) | _CACHE_WC;
 
 	return __pgprot(prot);
 }
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 4de32b07c0dcd..b35186f7b2547 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -161,19 +161,19 @@ static void __init smbios_parse(void)
 }
 
 #ifdef CONFIG_ARCH_WRITECOMBINE
-pgprot_t pgprot_wc = PAGE_KERNEL_WUC;
+bool wc_enabled = true;
 #else
-pgprot_t pgprot_wc = PAGE_KERNEL_SUC;
+bool wc_enabled;
 #endif
 
-EXPORT_SYMBOL(pgprot_wc);
+EXPORT_SYMBOL(wc_enabled);
 
 static int __init setup_writecombine(char *p)
 {
 	if (!strcmp(p, "on"))
-		pgprot_wc = PAGE_KERNEL_WUC;
+		wc_enabled = true;
 	else if (!strcmp(p, "off"))
-		pgprot_wc = PAGE_KERNEL_SUC;
+		wc_enabled = false;
 	else
 		pr_warn("Unknown writecombine setting \"%s\".\n", p);
 
-- 
2.39.1

