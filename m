Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025935;
	b=gVN8imOFCsZ/8K2QQf5YUdoFFxAgM/LXZSvbwRu3TF2Ra/h0dNPko/9dd1Cpe2m1Up+Z
	 9wEr1bjzpzuamwODM2wQROkclxubUiMeHcZQJmNsz9M5DsFm1NmiKNr8cJ78kJdiZsC/7
	 1yTN6K/xkeeos9XUjuNL0oUz0QA9JEW6uFij7htS42p4J6RvRExwDHfhEVchqR9a9ZOTx
	 uzrFmPRw0V6tm3QJrZGI2irW+UAfosRN7GPIZTfV9MWFC3KrpPfWFxy2zZXXurppHHs0C
	 Sd/oLpPYDYc7NcIsf/8PiBpv3f1UgkVvGc1lEsUq/gjG23v9baVmhWHpjKayvpvfLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EjmiDhGTyjFqhaR2vuKwqHt93n+hCHkzTadeMRKHv0k=;
	b=nf6xxiLk0kpKMMP4MIP1CIwTIrUfQ7t6xyb/f/QmlQuhV9rrUmbS4auV7nUkk+yFTJrf
	 SMQFTZXL7DA+z7NgDfpT40FxyrPstPiTMQjVwR9eIBTY7BFBSs/ADNC6uVhgp1qfy96DZ
	 X03gi0Fgy6S7jebMpgcgQw0WHTR+6qLmZMxqR89SlisL/WCwTAeJ17k6uk3H064ThYLcZ
	 R2CYESVXnV77UT4AuY1OLztctPKXJIxlPyFK6PnhZhv9LAaLVhtgn8fthFyVZbUbHE1Xj
	 6BAAkb8VgD7maLmWN3pGeRwwson39bGJZDumwoOSyChagMbTxkMzR9YCBxkVCiHIOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=N1qWrev2;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8C606A338
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 04:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB8C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=N1qWrev2
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d7791b00so9354095ad.0
        for <loongarch@lists.linux.dev>; Fri, 06 Nov 2026 20:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025934; x=1794630734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjmiDhGTyjFqhaR2vuKwqHt93n+hCHkzTadeMRKHv0k=;
        b=N1qWrev2cmipEaxJ/yO2EZU69nHNjR2tvpQwoL2YvvpvZo2HoMGX/KPHqtkZ3gzs9x
         HLe4ROZQ/MrQCTzUsNVs/XBvw2xacSDGrSHwp8XFlNoXUExVTwf3wT5XOkFhRkVEwU4k
         aDZZqFNnxXoCP1uiKuVPttXG3y6N0+Ru12I0Q5cRI0dpcVWQDZNkmG0ceViMJi+5E7/5
         Qv++dbnLT+2x2AK4mJ4D+X5tv+c77+cuuM4zoZaAWZ+2cnGzl4u4yPHaq/NxpkmtPIKC
         LPTr8gFyrgFnrUmrWmrZDVM8o7+l4CcxOVbDPd4GDs4S9FnW26Wd/FmyUZBQPgby4+2o
         c9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025934; x=1794630734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjmiDhGTyjFqhaR2vuKwqHt93n+hCHkzTadeMRKHv0k=;
        b=DD+5O1hJXg7wRv6MD1XrYMVN0PaGi2ofKNexNzKQD4lXD8bHNjphfTAPYKfYmSku1Y
         bBF217Hu0kDzPQQZlu3IBCYSVASm9lJ/ESXN0f8gOOI8MtnovHT3zdyWMTBHjVEdms+c
         /D8SfcrCbT9jabtPAAF98TjvlshW9p1/06zH0YIBfjxkPRJggA30tKdZjvD+139Y0UTU
         iFGF4f7WaeWHEinOA+T+GS+ovHe3Ja6zzPs6Wx0+gL++F/cJ1iUsKOnUhw9KjPt/8M8M
         ke7fszYuQ9WD4CO1q14SxIhuZjlhb/b2zbUXcfGm5DxGoGaPZ6IWhtlkuAREzPlErWDO
         JikQ==
X-Forwarded-Encrypted: i=1; AL+hErE+uFI2pM91dffrMGSVTw5HkTQ/+yHwa+Wclqn8GfkJX4VuAJjGQtM5X5eedoP4aoq2bP5JDoaaCWo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9lE/Q9RdSEoK+magw+Ad3t3HUEZj39zvFXZoGWjUpUVlcmWVXY
	KjKQ0cdUto5uIe5BKLXapWsWGCJLYasTnyqbcB51DVXq1ATIdlpPFQSCyWQTyCptU5E=
X-Gm-Gg: AYBFou0UocYOXDKPs3HHJxQjFG7Xz6OuJFqSslvlRfvhuEDN71weLNXEGJ45qV+Z3R/
	4PriGx6hnVvrDc64OUw+jT5JXtlj/BTubMzt1Mj8SEViI/1Ot2ykCjk85W5wdgrj2SAPyebmVoz
	4DddkMSatM4pRLRkWRz2M5k92870lVdAjzQGzEluIDgMYIDpqAydHllsAXh6pLymC9ZvfDQaqL5
	3YEF7KQ8vSK76nsoK707AFBv77mxOC8+Y42awn0Fn0TTu8+vyvEer7apzk1lEmfjbz9wTqEmGud
	bdqfLqwBfvftw4X+znwXbAWPdPfPsbDC1u8/T8jUuJ2pamMVxFw8FTx2Ljxd+8Xl5ztpUtHUaZd
	+v1cpTwjPMlBnRkteoRueqfYewhGNaFfc9IJk6Em5zrk6p3oU0fJpobCYZ7uH+eepU0o4+wI/lm
	eLWFqlJFQ5hFI/Ap2dS+T+Sl13tJrr+cgYM7tLTm+Qm8vv4iClPVGjHuclAk+DLE+9iNT6DJPVo
	rVk7HzTQhkBi/EwpoZ9M4J1zZjgRUDLRh7u75F1ePKvBzLA15k3e7a9OFVjLklNTLexKKTL6stI
	LZ24e3YIER4ZeQudVllRmZwdIG1K5rOqCQAaD/QNbRFb7lmMES31ZcVMm+fO
X-Received: by 2002:a17:90b:28c4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b0db7114f1mr4190441a91.40.1794025934315;
        Fri, 06 Nov 2026 20:32:14 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:13 -0800 (PST)
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
Subject: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Sat,  7 Nov 2026 12:31:19 +0800
Message-ID: <20261107043122.25650-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
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
v3:
- Move section_vmemmap_optimization_disable() to mm/sparse-vmemmap.c
  to avoid the LoongArch header dependency (reported by Sashiko)

v2:
- Add section_vmemmap_optimization_disable() for architecture fallbacks
- Use the helper for the PowerPC Hash MMU path
- Include vmemmap-optimization.h directly (reported by Sashiko)
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  2 ++
 include/linux/vmemmap-optimization.h       |  6 ++++++
 mm/sparse-vmemmap.c                        | 17 +++++++++++++++++
 5 files changed, 25 insertions(+), 15 deletions(-)

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
index 0e777d7dc332..7329fcacdaf4 100644
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
@@ -281,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	if (radix_enabled())
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
+	section_vmemmap_optimization_disable(start, end);
 
 	return __vmemmap_populate(start, end, node, altmap);
 }
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 858311a71b0c..22e5a322be0b 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -63,6 +63,7 @@ static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 }
 
 struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+void section_vmemmap_optimization_disable(unsigned long start, unsigned long end);
 #else
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -79,6 +80,11 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 {
 }
 
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b8b55e12f5ba..57aa5c2d8034 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -232,6 +232,23 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	return page;
 }
+
+void __meminit section_vmemmap_optimization_disable(unsigned long start,
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
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SECTION));
+	VM_WARN_ON_ONCE(nr_pages != PAGES_PER_SECTION);
+	section_set_compound_order(section, 0);
+}
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-- 
2.54.0

