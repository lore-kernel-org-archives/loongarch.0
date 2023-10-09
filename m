Received: from sender3-op-o17.zoho.com (sender3-op-o17.zoho.com [136.143.184.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A88C12
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="ImLCAr6A"
ARC-Seal: i=1; a=rsa-sha256; t=1696825742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mhAHFu0PrbcB2KJ2otzaWOVD1PbZP6xUnPODPzNSqmNJmDRlYBLgjstLvG3WtxJVqTbhHWGRt89z95PSqps/jb1qojg133Flrmx0Px7FHJMTD9qxhZEiv8Eks6IH7CeC+YGd8yuY2gQVS3VWEo96UeXgHisl7tmWkYmCrV/9d40=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696825742; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lmdSDHq0MuIPQ4ESN8fwForLSzHEx/eIpg0EMcwqDD4=; 
	b=KDmkUIRlUTCJm98rpEftuJhnWSVov9E6E6o3hMZ6AkCR8n6NOjk+/uhXzQsUm2mipzWsuSd/bk4dq7J4AGQlhOhnS449LqS7SYXprkUAUioc/EDtaQEkdzecG608tgJKdOLDPTF9GqBx5wNOqM8m+HK41jxjtO3cqaHzyPi5utA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696825742;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lmdSDHq0MuIPQ4ESN8fwForLSzHEx/eIpg0EMcwqDD4=;
	b=ImLCAr6ALnkCymXbMQaJJjv5dli8TWNWjtEQw9uaSxolp1SQNwvrm9/wL4QK5gJy
	N99Wz53BkS2HJyIUn3Pw578hzMl0cZLqY0oszcap7Xf3BiDtf1V2p7jF/3YfDKEo8wu
	mwtTpY5kpz8kUpW+frNvjUUpb6OGyWkB4+X+mtzy+2j0d1TbGC96f1oNqkP37KEDTBb
	6dnk62RfJZToR9iipOhfuohKvUWSYj5LYKh8w7pIq/1A4xjs/XHHxlOdBCbRUaxqJ1a
	x6JvJlBht1+qumOqnv0cFJHuRbsOCHrs6E6xLUsZKlvPjKmA0XPAMwN+88FBgDz+Pxd
	JC7N/cpLQA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.233 [120.85.97.233]) by mx.zohomail.com
	with SMTPS id 1696825740748920.581354397575; Sun, 8 Oct 2023 21:29:00 -0700 (PDT)
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
Subject: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as same as ioremap_wc
Date: Mon,  9 Oct 2023 12:28:41 +0800
Message-Id: <20231009042841.635366-1-uwu@icenowy.me>
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

