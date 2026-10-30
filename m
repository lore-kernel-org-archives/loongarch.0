Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369324;
	b=ZuBEXuG9MYnXGHBRHykWZzh7bcYlS0uoJnoQPqOhiLw7N6MrIhA5AfpfkjPUEy3jw37b
	 tgCKofJ5pi3zZqOTdsmr4xrSn56nEhYITzBZVMBnqowD3sJA+Q1rDHce26k0aChpXzwfx
	 gJmPZuRr320NAq6JWysBqOzC8+letGfTFHpkbpxjWxOyj2lDD4njnp2Bb6TBfW087BkWt
	 vZA+Snwz/mBrD4woRWKDAGwfbJZf9M17bzmuA6piAdPpu6F8KNVy1Bg6GFlhVN4FicMmD
	 +H389sA1OYuUxRbg4mwFjNOdRq7F6g0p5FTPMHJ1SO3NIDazD3QKv6SgX/KafJ6fm7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
	b=YGbEMqC7KEVjgEGJAnord+q/6+5meE6RiJtRBktVxY1l28PquDG/gS7EzBKcA7DLhGiZ
	 v9Jdgilgm+WZyItkZJAOwX14zuH9ci/t4loVmS6ZSsMVwzoAUojEmeKbPGNX8n71pqLVr
	 dLmbLxIcfdLfXZQPSpydJO9TZycMeUOpO1DhZ8SjuG3+0HNRGhBMG9/FDE84tBdk2Uwi/
	 cOHHN/927n686jm+7qF3evKKkMfA1e0R7mXAQI+oLA9fGv/Q2OwgT1+6TnnWo93K77LBZ
	 sNJedlsZut3hvf/AoNKHlGZMWnT3OeTsfhjW8ZJnjAbs+7SauCsYvhiZ+OpXldpaeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VT8OUje2;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28A606A337
	for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 14:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F28A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VT8OUje2
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e608cd460eso4697875ad.3
        for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369323; x=1793974123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=VT8OUje2huDu7k1pk58jkLrCZOX2AoVrc8DUVx2eo4EXmPa1yo5mosVNwLjvW1yE2z
         dGa56DFQHKHWhvRAjJtU2lSYhYNQ+0ztQlToUBX5GmlISPM8ukOe/8yL4LEkpfZMYL/2
         qv5eWvPwfgYHmR7RrZcAGisfDLboPqKhQL0F+hUQZw4NmEgr6tyK4Ge8qdKebD+x3Ve3
         Out8X701E0MoFiWAasGP7j/gy+4/KYAZRoDta2egdTgpfc7qlB7Hgh8OR9nVjC8JzkSn
         06AvVvt3JXNjBCpeB20JWuTx8NIGyzW55ndaK67tsoENuw77/hPSRWUo/NqwfkmUdTvJ
         /H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369323; x=1793974123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwaJdDbl3ziEIlNq+4GJpu2/q8X3inKh6ZLd1kzHiJY=;
        b=q01TuqoZk3+WWnAK2JScfexvzRWkwuTGleRMwUnnpjcUVAgSJFCD8qdfbcq2LBg9UU
         Kt37sxmZ3OIwxg+duDLEvTOcL0YF3MH861hBDig46d7GZBx6qhVbSf38X+vfOMV1hFsH
         lt2Xw9Q3AzPGTzlU2FWo9ayM8yrFWpkFk3TTXBqSbWb0nYuQMYG9WcTN8hIGiRS+sHex
         zswFYkP5xOFVpfUGWZ9oPA/8MxciMa5zftxaPFWeyjW54UWQtd2PECWbR7ZQDcQ2dCd0
         N77PmWFLQKhqbcrnte+YKO4vkmI0VtKJgk1PhzYBmR3fCVeulbUy0NC9VcaA3WW0DmSN
         07vw==
X-Forwarded-Encrypted: i=1; AKwUvBxDEUjiw0qaZkG/ZebxiNgNwckzsg3QXR6lXWPoNOqUBlS0URcA02/t+SRWX4jCcwsETjk5ur5tSXY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIvmB/HL7z3AGK0E/Yzqodw43T+xP2aNU8HfIfvBMM8s/YIT9I0
	9aLy20F6fPyHXW5Idt4LnHB6MMj3rYBdYoiyqk+6vAoJFo1xMKm31xSej9kfVxOyCuk=
X-Gm-Gg: AYBFou32baO0ITksE3UZVb9qUgd0TiDBIky6VvaxsSgFLC3Eagt1QSCrtQz4Pm9dQz4
	PISF9XlHPrUDm9mDZCgIbAb1vNZ4aYMgtOzD8pxqaUVjupZGLdql9N0PZq3QQJi84vIYlZ/GU0Z
	gaw0oz9+5lQf+5NLkpMr1/lGxsN/XYz/y1YbQcNCgcIJXM9HKjiWGlosRri2nOTyt5HG83VAFBi
	G/fzEfgfygFVwFFxaeFliHb5VgZA4c+7XgCaIbMIoyXqsOIwHLC9a+1c7oXySadJrQxTxMYjKlt
	Ovfn5lMyg8593WIietcJTjZdyhmp/NTEl1wIccUYdycf0sJ5kalvPr8Vb6/o/ZGkHFjSaGcomgJ
	Kc+2IucqQS3skxHHU9+nAPKtpleSG757VhW/35CZR8/4bum/6LAv87gFym0G8Bp9y/GjN1DMVWm
	SCfIMntipwi4iHmW5J8NySOrhhB2Rth3v/OWQ1rgx5l8zdMrth1lt8X5TsJb0lC0OiehHNEadSh
	TFpC+eCKFd9LJWmWyu5C4+g4/7zq+wP5w2ukLj+xN3YiG6912Cl2CZlLVXz79gm71MvdrikDJft
	79XTW/98y51HL8992tP58lAIJHbge4qcn8/x1KiooNPyZqago1WX
X-Received: by 2002:a17:903:1a8b:b0:2e9:401f:f0f8 with SMTP id d9443c01a7336-2eb364e9f6amr24067465ad.53.1793369322301;
        Fri, 30 Oct 2026 07:08:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:41 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 2/4] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:18 +0800
Message-ID: <20261030140720.1256062-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
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

PowerPC no longer needs an architecture-specific vmemmap_can_optimize()
override for DAX vmemmap optimization.

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can simply clear the section compound order
there and disable the optimization for that section.

Drop the radix-specific vmemmap_can_optimize() override and rely on the
generic checks instead.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  1 +
 3 files changed, 1 insertion(+), 15 deletions(-)

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
index 0e777d7dc332..509cc4190db7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -282,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_set_compound_order(__pfn_to_section(page_to_pfn((struct page *)start)), 0);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
-- 
2.54.0

