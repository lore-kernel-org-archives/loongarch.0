Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com [136.143.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9915B4
	for <loongarch@lists.linux.dev>; Sun, 15 Oct 2023 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="VMBdpqst"
ARC-Seal: i=1; a=rsa-sha256; t=1697352031; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EUHWn97BjzuhVk4aoSNe5kTYbVS1evSOKIQO+l5Nt6hPYRJI6o/+1dnNLUoA7gamN1lnzfe1ze60zVeOGS2jB6Cn9mqZdG0pXtkbFCHYlznfuO9nwemdi798EtZ7pOz3j9bSUl1BPCa2PaLpd+3cv5nE8UrX9FjnLX6ZyQ1i3d8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1697352031; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tdDhVnGxLtb4fS71jSH6UyR1CF4JMcetfgtEDsucopY=; 
	b=Y6MMc8X9pts5ZpTKiaS1yLU06DgbCTC5WPY6cpBlW985UGVrOL2nS2gbWBwqzdJa6oX7Uu79gAHRZZQKncLVLM0pE8hOXwIpbuut/NjIclQnpVhhg7To7sPiiMaeWa6excB4xl2jZ5/9borV0hUj6icPW/Or5/e5Q2p/D1LgeNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1697352031;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=tdDhVnGxLtb4fS71jSH6UyR1CF4JMcetfgtEDsucopY=;
	b=VMBdpqstCHXb7MzWwPc/56HOZSVF6K4tDr+TsadbeyALjLcwRhrTwBkwrJSoEfUu
	LmE/SUozYBZBKTCxuYiQGHekvYyOz61hmMduvsKh1IqPM5nPcN9JNhWx/ncBjSO+L4B
	oVW67LWqaoOmM4SL5yfDKrph7iRFstJkCFnghZtjUrUSdo6W91MZZwyi9Cx6kzTrM7u
	NGYmYTJWHXbUe+JBWK+P1shVbVWPCTnGFqjKh7K9a/+AXEjY3WFYmPxhOcHFPl13gAK
	lR0z8XsWySy8ROVJX2WTvaQSrrafmrbVtz2YwwtzBvWt46Ub9uLHxGNZkAWZ9zl13YW
	Xeh7kjPr1g==
Received: from edelgard.fodlan.icenowy.me (120.85.96.102 [120.85.96.102]) by mx.zohomail.com
	with SMTPS id 1697352029711769.5282799913583; Sat, 14 Oct 2023 23:40:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Weihao Li <liweihao@loongson.cn>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Jun Yi <yijun@loongson.cn>,
	Baoquan He <bhe@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Youling Tang <tangyouling@loongson.cn>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zhihong Dong <donmor3000@hotmail.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3] loongarch/mm: disable WUC for pgprot_writecombine() like ioremap_wc()
Date: Sun, 15 Oct 2023 14:39:57 +0800
Message-Id: <20231015063957.1999585-1-uwu@icenowy.me>
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

This solves some misrendering on AMDGPU driver, e.g. opening some
webpages in Firefox.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Changes since v2:
- Changed commit message (use "like" instead of "as same as" and
  change the problem fixed from stability issue (still mysterious) to
  misrendering.)

Changes since v1:
- Removed _WC macros
- Mention ioremap_wc in commit message

 arch/loongarch/include/asm/io.h           |  5 ++---
 arch/loongarch/include/asm/pgtable-bits.h |  4 +++-
 arch/loongarch/kernel/setup.c             | 10 +++++-----
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/include/asm/io.h b/arch/loongarch/include/asm/io.h
index 0dcb36b32cb25..290aad87a8847 100644
--- a/arch/loongarch/include/asm/io.h
+++ b/arch/loongarch/include/asm/io.h
@@ -52,10 +52,9 @@ static inline void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
  * @offset:    bus address of the memory
  * @size:      size of the resource to map
  */
-extern pgprot_t pgprot_wc;
-
 #define ioremap_wc(offset, size)	\
-	ioremap_prot((offset), (size), pgprot_val(pgprot_wc))
+	ioremap_prot((offset), (size), pgprot_val( \
+		wc_enabled ? PAGE_KERNEL_WUC : PAGE_KERNEL_SUC))
 
 #define ioremap_cache(offset, size)	\
 	ioremap_prot((offset), (size), pgprot_val(PAGE_KERNEL))
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 35348d4c4209a..a3d827701736d 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -92,6 +92,8 @@
 
 #ifndef __ASSEMBLY__
 
+extern bool wc_enabled;
+
 #define _PAGE_IOREMAP		pgprot_val(PAGE_KERNEL_SUC)
 
 #define pgprot_noncached pgprot_noncached
@@ -111,7 +113,7 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 {
 	unsigned long prot = pgprot_val(_prot);
 
-	prot = (prot & ~_CACHE_MASK) | _CACHE_WUC;
+	prot = (prot & ~_CACHE_MASK) | (wc_enabled ? _CACHE_WUC : _CACHE_SUC);
 
 	return __pgprot(prot);
 }
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 7783f0a3d742c..465c1dbb6f4b4 100644
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

