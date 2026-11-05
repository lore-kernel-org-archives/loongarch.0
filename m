Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859168;
	b=DXrhYO73CwQH/xxy8JBxjwf6n6QgN16WI0WhB8Si6R7NC2pt6I8uiLuclctmBpazcath
	 pM5H2tE0NAeTARZnT+p9oKrbOpRjWnrrum1KUKnjQwH9vCH5+4nzNjAn0R1LWq07WBy5m
	 lKmcWDN5BCkPnXbNm8vJd9Mb31wuueNn8AAv8EAOhEBa2qXP9LN5ph7XcqjudBtuwfcO7
	 aemOnJNsbRNWsysPI2eySGmUeFp2QwL0z5DX2S0RwPajKuhMz8vj0GBD7YSp82k0LuJGG
	 NzLJ5KMwJ6aitXAIzTDJwXxLVRcFsjWovzTtP6ZVzmF4YKucZPdmDrryMWVUKjOP+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
	b=JM/GkkzsgSWlSnLtMIVgGNAlBX98Ecfo8YMPgHTlr7I1Y3uAQ1IP8czaww8Sgfi78I9u
	 FWNtljeEglV5Qna6u00GDYdBS7PtgeGbo+QbpuOHo5z4gfOy/L7EZCFTs8iCNOwkQ/SC7
	 7jD9/qOWRRYJOComGc6Qnt/ctzLsbXBkYrj/pi2D5ZycOnjv2Jca0eEizAwTqjFcT+/j9
	 MZhTw1oPuaDS8FZ4+xuvMuJ7Xi+NDzll5TgSYWOlzxaMUwgsci2TshXV0qhzN3SbEcbzQ
	 l79iqbiGEDZPSjoS70Ksqt8E5sldJYV6lGgl+MBrJOXVQR28DZL3imvblpKSXhTB7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="G/esRAV3";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C494606A32C
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C494606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=G/esRAV3
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1089268a91.1
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859166; x=1794463966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=G/esRAV3LbGhPqiaNSjDQ8ur82KRLpt4mxqc31tYZs8x6NLzfizHqmjRsO3jwb7fS0
         tVjeNnR8CO7N3j16g9yxqP+Sln18hx6mip2yLjGA2J1uXq2wDq5aNg319RjK46puH7is
         3avKwI/tenSXM14M9ucHjlBwZLx7kJujl1y3e6rMoeOu+bkXgdBGRSK1aAcjbBXuxiX6
         zK58AWUrPCzfjQjIfj/ENEYNh56gh33LMDHi+mGIqOzgRG7EEd0TjVg9FR5Rhzs/Ot4k
         hd6MF2AjsiaSD8pmx6NRNKkUu4b3JapIitQChaDYnGoYX8JqY1N7njLXvBIqqbXgnByN
         T/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859166; x=1794463966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=xELdu/I04nLjv5hj396YAasB4IlEGS1G12YgP2LarHbEs6crwotTCiFh+RlioIJ2Wv
         kbgtqh8aFmeVclR7JzpWzX3iTg+aJQa6u8pS/EckNUhL549XwfFLnekhjgTKrkdogZVh
         Nw5wrb6Y1tk1FhTMN04g1HbxKVOy6m/TXjkUJgtD1N8LgOnaxSTHW/IGYLMVKFOdMj6x
         wZWxKNCkh130chHoS8zgu8UmZFMs9iiiZ2YI+w6+vcmoCzGOINrFoy7FLlBDX6D0wqwH
         hA5CJqoYMr1r5S5h4BMmD6Ii8xTHsUQ7mvwli2DyyJUHJ+OuFPqTlwQNVCm2fMCRkIiT
         wkaw==
X-Forwarded-Encrypted: i=1; AKwUvBwfNHGbomIwgCdEOW4B1DrOxcCulmOaPbrrrz+U8VAAshpOG8EuLg2rqhGF6hk6m6tkqojR2UF7h1Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z9k73nH4xmBVRMscMkDDJHD+JUrZkQp21mvarPOFBTseTJupyTu
	2LoDHQFgzTWPTmSuEMjg1HLQMEcNNn1fz6zDDwESkMbK24t8O0zDIhNtMwlKsYWmyok=
X-Gm-Gg: AYBFou2OLgn2SLUfTl8tYHz1UN+ydtIJWDLj3DilXGLCgyNPZWpENexNCWecrN/RDxW
	zRWU+cnf7EKBw773xx7ntaIdkUrHAFdih22RTqrkVeYtJydoF8kb6XghBWS2AYlxyQAAsotufbG
	D7OAyNlsopygiNerjFbDopBe9asMvLppSQKf6kyyCOfBP30LuMLdhcosHejSy9MaNTkxaGrvQJV
	UengorLOGgb1YDIjkGcYbaDZlS2PvMJXF9nxfWxS5zU3zQAGsZeFQuL/jkNGb1vKB5v7NV1KkYW
	rXhbVv2Rvb7mVHwmeqL1MMq1LSbktPZnTJIN0BQ8LStuXYYUM35hLlIuPvtZdQ0Iho5GwFQlcip
	Lv/yX/D8wrsGRHVrcmE0crUzjCF1MGsRhWVzYrpZ5sERKGMXghG6A0ff2YKW2kJo9Yo6x1JrBhz
	wt4fMUXRzpwbjMIVFnFPBHF5ycDJQjilEFPrSwUhmrjZltu4U5xYjN4VS3nSbq2cW8AxNy6pWya
	E6l2unRkW1/6fr0KvgLne3nCufzJBVUx+KI8qUxppeAt3OceBjh0mUq+JHP2qwG74NjawyxyRhp
	ZGIdnx9lKffGrTMMrLC6Usv7NV1YFNwouiPxkDv6Wsh0wZcWOOnYArn3Z7o94aN0lg==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15528967a91.65.1793859166073;
        Wed, 04 Nov 2026 22:12:46 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:45 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:14 +0800
Message-ID: <20261105061217.13302-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can disable optimization for the populated
vmemmap range there.

Add section_vmemmap_optimization_disable() to centralize this fallback,
use it in the Hash MMU path, and drop the radix-specific
vmemmap_can_optimize() override.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add section_vmemmap_optimization_disable() for architecture fallbacks
- Use the helper for the PowerPC Hash MMU path
- Include vmemmap-optimization.h directly (reported by Sashiko)
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 ----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 -------
 arch/powerpc/mm/init_64.c                  |  2 ++
 include/linux/vmemmap-optimization.h       | 31 ++++++++++++++++++++++
 mm/sparse.h                                |  5 ----
 5 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..4d6928f717cf 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/swap.h>
 #include <linux/stddef.h>
 #include <linux/vmalloc.h>
@@ -282,6 +283,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_vmemmap_optimization_disable(start, end);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 858311a71b0c..5c09da4df4d8 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -57,6 +57,27 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 		section_set_compound_order(__nr_to_section(section_nr + i), order);
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return vmemmap_optimizable_order(section_compound_order(section));
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+	unsigned long pfn = page_to_pfn((struct page *)start);
+	unsigned long nr_pages = (end - start) / sizeof(struct page);
+	struct mem_section *section = __pfn_to_section(pfn);
+
+	if (nr_pages < PAGES_PER_SECTION) {
+		VM_WARN_ON_ONCE(section_vmemmap_optimizable(section));
+		return;
+	}
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
+	section_set_compound_order(section, 0);
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return section_compound_order(__pfn_to_section(pfn));
@@ -79,6 +100,16 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 {
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return false;
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
diff --git a/mm/sparse.h b/mm/sparse.h
index fdbc4cacf91d..9b81a549d928 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -46,11 +46,6 @@ static inline size_t mem_section_usage_size(void)
 	return struct_size_t(struct mem_section_usage, pageblock_flags,
 			     BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS));
 }
-
-static inline bool section_vmemmap_optimizable(const struct mem_section *ms)
-{
-	return vmemmap_optimizable_order(section_compound_order(ms));
-}
 #else
 static inline void sparse_init(void) {}
 static inline void sparse_sections_init(void) {}
-- 
2.54.0

