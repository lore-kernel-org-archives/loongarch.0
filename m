Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025927;
	b=G44g6lXOvltSyMU1pJHRjQng7ICIJt8bFBNXpO8Mw+JagOu9UZ9oxTQt3f7tkCp+3PxI
	 aDks4E4D/wEAezf7wBRu2uCzfjKD96NlbfuTfrAu84xraHkOgFbCSmZnW2PETsCP7VHxM
	 6hHCq90sHQgOE8Mqdvmqj3ZVN8Ge+7AdJLvBCE1rGA0CLE7dVWs1dLziia6XDLIFVZfio
	 qbWB5jqbUEQ5PB5L9AoUe0K6Aouxu2goPprn7thb6A7MXnb1ZqxQVx5mSgd/UrikBCNIn
	 hcBtRGc1U+UB3P9zRPWA+PS0AvJUQpW5m2q/JYbr5AP2jUXKgQpIKt0/qIyW3ZAoWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
	b=KlvEEVicFnTaw118f5SVrKwe3+IV5iqgmmPcK6KWnLgPuNfK/GH72jWFKnT1NOzSJnrL
	 eYUTtdO6061Bvh7+UwhaUvB/TUFsJizjFxkhkkp5kQLfAz6U9zhe7t3tcZTMIXG9KoOda
	 9oITwGBJcctNG8cB8dM/or4wMRDNknEHU2ZQyAYjN6LWTj2tE0dPsurL1o4REmpJ6PXHA
	 77C5jBH/Ly/CA1cJjWI6QT42KglxjaO2qLcvmdEYFmaflOiB/XpN3fv0zlbIGBGFo3DtP
	 rRm0/jYXWfoQxBdwlcoeEBkIQCqGV60YhTLE3jlQBaQUJMaqKIezJ9q/RAzW6s5X3OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bv3FlyFm;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED884606A336
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 04:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED884606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=bv3FlyFm
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070755c8cso575228b3a.0
        for <loongarch@lists.linux.dev>; Fri, 06 Nov 2026 20:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025926; x=1794630726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=bv3FlyFmWjYayIPAw8fpQYbTfVIRRqiqG4y74Be6DYsLJnjjYALgp4+IyeabDu4A1C
         Uf6J17PekD6ng1uVd4Xg4/6opXJwOUpMtvEPxBx/RTYQddUpDVxIYCkgDJaRa12U/XPb
         wALlkjf35b0yPi+nBT/AcFbWS1zcQ4PFsj8wTzhDoNTq3zB4HLCa2aVUQuK/GVYrjtMi
         Qx/3+7EGAdxqskshbJkG0/BWWEE8hV21tWvgZMOHT1vCsAIeHFd0adB5hwqUsogCR8Xv
         xqtu5LBKyojIxO1pb4206+/2u9NwTORnhgHOW/wtdzQUwgDHTNw8LGjfzjC6GzLWWlLA
         d3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025926; x=1794630726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3n9ukDrxII5BXz/7vbmrUFxcX10DGV7r2as+LtHfBI=;
        b=WLs5cB98WsshYFJ1Uqv9zk/e7Re/8Y032pT7fLWWD2mH2rzF2fvz0u5wdyRMmgKa9m
         dgCiumwoGG5Ba4/JbvfInNsj8VeOcxlM3aICtfWQdhOh70E3QIOTyBRJeatyYwTesC6Q
         EAknn08wWyOqxCpcRQ4l71JMv1iFNwmvOSw19yDTTTlW8q+CetDzTze2Q05UD8xdMcIX
         0pCa7J6GwnaakUEBFHfFiwHHDoudrpjIAdm8Fr0Un5Wio9b+13ly5B7O0+Wasv+U+F0s
         A/GFE8ipO2Im2vXyF6+iL4uANpZ4NMH/pM0ZpXrM1l46MZxw8aFxDd/FNk4hg3TveNiS
         saJA==
X-Forwarded-Encrypted: i=1; AL+hErFCtySCj1BdFprFev+H4N3xjn7gwXZAjOm4vUoqaIw7NfD8YL8LArRhWNyoolEJcPevLMKxsOhMVSc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UF1vdTgMHBg5f63h6uw1QvmrLCPNN35mxu2TVugTtYEsz273i
	U3v/LiDyMKAq3bkULvxO2Xw88ObOog+v8ptsQsY8dCuQb9uA4S9YqcgaiffHFtajEuo=
X-Gm-Gg: AYBFou23Wxmfqhx/ZJAV7cfIhVLkB1uolWx7LNvh9NpEKr9KViLYamzqYknyAUrRzoJ
	Eb3/leDiCq6lIvZNxPKO/O4bNjK5OlrTWmpztf6fwwGQQw0ezzBqMEgvlXygOyOEUULiqBYp4EP
	N3X7yO2+B+34XeZQ4dS2ToWFeoCbhiijrViDtjPpr7FrQ0mvDKXhgw6/vuLKs33GcdLDLvXPE6j
	NR1Xh5tL8wuykwwJdpG7Oi+GRF8eFHtDoD1ZZ4zjdZ68mcQWOuv066UmqW/+GjCIkv3vexNzQ1a
	AXx7A05Zv3x0O+OVpj98Q0RPQShlsdBe+g5U/xC7W2uIdZ6jx0FQ/Iv/1gu1UH3QDpKk4XJprLw
	Lv7iREPyU5+/iuDbU3XlB3uYtlWR4FLBjhXmcEYm4w7IfXj+vCfD1ST2dYKygQOPMoOOvBZ/2xb
	WQ++utlxRlcVp2i43/Fi/d5nHVXINlVNZJkMTNqRsZjW4YGDfIaW6SxECucHPfcAQAYSogggKMK
	UR10P+ITvlsF2GH8lvSztDhHUePBGV9hrvtvOggJwQhDWnJZ0icho8MSCYs28zmgPs/+P0l8wiw
	k2krsOR4V7xrXRQv9Y39Y781Dgf7djeNLlEfH3KxQ5UW20s1qil+Cui7ln7f
X-Received: by 2002:a17:90a:c107:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b0db6b8083mr4981632a91.24.1794025926246;
        Fri, 06 Nov 2026 20:32:06 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:04 -0800 (PST)
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
Subject: [PATCH v3 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Sat,  7 Nov 2026 12:31:18 +0800
Message-ID: <20261107043122.25650-2-songmuchun@bytedance.com>
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

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
---
v3:
- Collect Reviewed-by from Lance Yang
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

