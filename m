Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859160;
	b=v2n9Xa1Qq8ONv+xwdkwpy9woXf/zmA06nuQkGpRTfT9jQ9bnCsqWRYODbZ6rRwDZaO9c
	 dXiJXR81h2Q7VpjDQ/5XXyqXS8bLNNJunA+sImuhlif95Zp6//sN27pB356I7sWVZSXpt
	 XnDGPr3Q8R69qXzrMhvHi+5HeYBLe9RIaqJ+f7CaAcBBVeORFEX271ZMzNar99dhCkI+P
	 k/TZfgbNHSpCWyeI+enMCMFeyWBb8cSSWbcKImIYqLvcw9XPpLqOAQs6SYMVncDLGqVbp
	 7Ar250YrI1PuWcftn02XW9gPy4NSfMmqGBCfUPNpLh8aCqXtucvDIiuQWUofkJ7zhfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
	b=3bImjY0/GB8BpKjSZERnkkYD2MzO6DI/bsUZWsyaKjswY43qbyvcwcanaWgkKd0XB8ib
	 o6Ycjx60nrvatEUpCH3rGxQF26wIIYjIkXMi6jwkZXjUqNvzVMjOipyCe0WIcwsZt/PTv
	 zuH5wnEVbHpTuQ5acakLzLwj2PYj0+Cc1rpj3NH7cyU1DT7zNcn/X6qET4JctRU0FeeTq
	 pc9CsJT4VdO5YrcT98y54BlWQxKvKiicWWfbMU2Fv8WPfkmc0Sv9KiElGZWJ/Nu0+wN0R
	 4v2EEhC39BMeTQmpOREP+mriE7cgTozdrquLF8c/yOsSbmjdjGRiTFP3fs27KyeXfPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="I8teBq//";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CF9606A328
	for <loongarch@lists.linux.dev>; Thu,  5 Nov 2026 06:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12CF9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=I8teBq//
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1328678a91.3
        for <loongarch@lists.linux.dev>; Wed, 04 Nov 2026 22:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859159; x=1794463959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=I8teBq//Hvrjs6SOY1fltyJUtiUhksd5MNbg/pClthdg9NWtIxVV2rRZRH434HCMoq
         6YULbIWsTF13dby5i6H695tokTNCnXC20sTJ0SNRR1/ALSYXIKdNeG+cD5FJ4PV0Kctp
         TEjA+90M1m+msUtoy7B8XdosD/lsRVkaw0E+e8uB0YUJxZhP0UJO4/0y/lsJRyXUNw1b
         xk923J9rAPUSZxjxhzzMbSMz1L2EpXwY883dwcJU/vkPEegt3oNe3jUM4ATZhJveCu03
         iR4YMgcY6IDxL+CLEeARIXPzfXYXNiwaAQwrYsa4+p5MnZs//qKowP4cK/3zLukxKZpe
         QSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859159; x=1794463959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=XAyuXGAjl66O6sJo0IamxTMiGf3omcjEYtOWsQBYUI1QYbGeyB7C6KTsWakI0uTn8r
         gaBIC+QqBuFa/lwtfdRrcZz+LMUhKBftGM3tJNujmRWf4ioj7kosFYJ3RLHSyfy/zb1F
         0Z7qqeVhCPsqn8oXMYqNxQyeq5JkV3CzM3+/A/+Xj2QnVr6/Ehq78rviSobh1lCr7M7C
         uyjLYX7LntosAi4r85YpJIBWiYAeclfDTn0bFCoxp+V8ACbXgVK31BstC1ufejWdlBNp
         BVBsvZS9vQBZqTmslUP5g+5YZsI2+I1X0MNZFkWQcpyu1HsoiaoaXV1ga4A28u9asnkN
         zDDw==
X-Forwarded-Encrypted: i=1; AKwUvBybhMVqFEScc1OI8leZQlXzBD30FY2nn0sdCf603RsMfuhpItj3WSfl+biwj7qCgvNxphEPWllGpk8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pmHXeVI8Zm+TLc34Qr5t5inowRVg8OME78Vhf+/iFZ5L3Uhro
	3NXwmtS5rHM/ay8vqpeSq6zNDYZ3ZYeNx54MirHc0RtfCSdUCUWL3A/u89Tq3Fic2Co=
X-Gm-Gg: AYBFou0HrMCxozvil7klmioqkj50wvkeIl679mgasTN9mShY920eU4GezDwFrUTQLuX
	adq78Xe0hXCopw9Cdu6xqJbCG+btlBYtvyw6kfNS+Vw2cmmsfQzWOVjc0BzTh0kcapRaWvuof9H
	byR1Si5deDkcjQbj9eacf6NSpIE/BtWNJ5mSCZGm2OyL1mjkJo2Sx83VUAV9TevDoXp1+PjPdFp
	Tc8RejQZ0YYPc5eCwVpFc+pznixi/BzUUGrjWuBx6s8QOUn0v1DjBolUmZAzCO2aoHyZ2suGnEt
	ibmr8MVwzcEUrJYq8zw4h6L7StXAhKbDq8k9NKvW2iTe6mjiWSvD0Iqbcyl1+S+/giTzDGRAGi/
	yb0YQCY5wHZSfxQIkjfN4UMzKpsCBGdbJ3Uz1pPTQF1tS5P5gG8ptaVHRz1FIddwwtEHFrGv/NM
	TdAtrn88sOPYCeilowS0AeRCVkjfE4qxcMw3EsORKKJrLPxFQ3+y3J5q0+jxDrg8in5ojjJQgl4
	an3XgE/+vCpt9mbWnckT6/q215ynmFGgHRS6+1gdcsWGLAq/DwrvEeMdcwdRT4FqC0Sw6d5R6TE
	1vg0yUwNZl4I4CFHx6agGQ+btkapdYzCltvVzLxgOM6g+xjPAMQXO/sZMQVz1zJbvw==
X-Received: by 2002:a17:90b:3d4b:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3ae897c87acmr15846459a91.23.1793859159284;
        Wed, 04 Nov 2026 22:12:39 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:38 -0800 (PST)
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
Subject: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Thu,  5 Nov 2026 14:12:13 +0800
Message-ID: <20261105061217.13302-2-songmuchun@bytedance.com>
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

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0

