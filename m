Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A437B3FD
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950365; cv=none; b=IZsXhqDgnVHVcjvZwS0kNSdzRGVdY325i7xCul6oQ8sRaUuEeZMk3iIgWbO6ym1cFPkWBUzEZNqQP05tKgw5NP/Y23xr3DUlRfsBjBP5ojkJ9u7IULKDyJaKf4H3KNfLhu6f/xLy9v+putlto5pylOKwd+d4ZozYYHxkliYTLJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950365; c=relaxed/simple;
	bh=A40w+35DIpgiCQxJt0/IC2OqyHnzNk9q/eF9E1VEJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFkXMmGsQASRkmJh6MPnmX2B5OyCXay62lGwKlgIBzl/kSKq++tV4VtkPtqFFWrA+M3dIeNzijic5YM4Zz86UtrSbcNlRiCIq6Y3rnl0jra/Z/3AEt8uNYL6yBJdInb8Pgd8alFye4Y0LwOZSpWGM5FUzxYutY6o/HHoLLG06LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YhB1hRjq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YhB1hRjq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1625979a12.3
        for <loongarch@lists.linux.dev>; Tue, 13 Oct 2026 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950363; x=1792555163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=YhB1hRjq5fQYnydvl0uIztl4+Hkfj0qlAJW5F92y0w2dMS7J6kiHSGXxvTHub99a9H
         +mGF3t2YJF2evziIS3My1Q0Nq5fe29bK0kkq5/MEjOQRflZJYiOWjlUt2Z7+GWcQKvuD
         Rs1F8H8iztZwQ0LSNRQ6TNLNBSGpkJZWyesBjl6A47JKECIjl1uxG+OYIwafKWt7ubgj
         2Mxqn08I8eTDYpaKLYM4XVlTHqAD6Aa+zLnv69Sn36fZvfYnjKjeKkH7bXpsz1BXB11X
         lMEDFNjqohGPNrn3FkOMKbVHifzPCIgwJT4pjSi84F7+ZKqP6UA1R6MQWSqS/elPxHRo
         mt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950363; x=1792555163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=npPqsOEVPrcHyxLYjKzNNZwKhhgzlCzvy3h9A8101jF2eGWqZQp9v6kSujhzJicy/N
         MwLWWWqGDsIG7VET3TV2TM3AGpwAuIGqqwoQlyfG5y+33woNUiDQ6Iz75LYTxF1ypfY2
         SbT6GHhPuOYVsygGG8tCNN3pwE2zPzvRKVZHf6eTSkv3bM2r9T/+FMGJ4cVhqKbdly5D
         5vQz0BxbAg5kmfW5lEySpAn/Nt3HpfWPOS/ztDArRTj+3JwMSUaCON4+AQphQR5JrFh7
         oV31R1VIChFVO2vEUFrUWTnnns3VS1+9uWNuuvVA/G3p18t/NqcA/kC1lWH/svrazUfO
         5mMw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Wh7sojV0Ki4RFvzIpFO9+02d4e/U7fysYSKpnInj2UCKxN0EFoXRi2/6eB4t+0ydCni/jmiECkc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJdJKUOrcmu6GaNuIa1KwaarqX1M6CXt+mnJMLBij3p9uni1VKH
	Kp33izIZPjPhATNvkWoJXVcK0KvgW62fM19HYfFv/PmoOwBdCKZm4LvQ7Dtx7WGv7Bo=
X-Gm-Gg: AYBFou2zOnfaofjt4sSzzeG0AYC25KjqxuJPzkc6rYTUIcnDDVqal75myCjlAOwXShf
	IvPd/aca+oGX0x8Z8sMMKfPF1uzkdbT02eySCz+UHcfdYpv3bVYvLZKqTl//wOoj/FnxZm1tKTn
	JvshuzIW0jUdKRZy3jANwLatevtdcb8FeIX6SYZmveyAHXMsAZBfO8qmzHpymqUdMIdQardF5ka
	E/q5Y3DqOq6ViGPjFApG0f+UyNu1k1vwrvxDMxUOZuNG12d8sDFxMluZV13+Li95krN0gyR8gAe
	wHb92dARaG9TFMOZrfbPAhgJq86dtJx1x1B6uaI86S9Xj0vQg47OaiQKdy4Hf7rE3BCFuK93YOj
	8s1HBi3abKAyfmaUMpwPTpS0Lv5RPReg/KAmBb9rHQdDQV5Iwz15+OG14xDhXlQCgcXD6nT96iu
	K4Ka77gJWPFiapTPBV5i6rbNYZ9VXOuvtw15dSim0li8FiG6YJfOAm89Euye7LDTRpNlMK4HO+g
	1GkVE3W+r2lztlBUUc1
X-Received: by 2002:a17:90b:1dd1:b0:3a7:e0f4:2857 with SMTP id 98e67ed59e1d1-3ab3a359dd3mr10523369a91.1.1791950363442;
        Tue, 13 Oct 2026 20:59:23 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:22 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mm: generalize kernel PTE table allocation
Date: Wed, 14 Oct 2026 11:59:08 +0800
Message-ID: <20261014035910.687847-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014035910.687847-1-songmuchun@bytedance.com>
References: <20261014035910.687847-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures whose empty kernel PTE representation is not all zero must
initialize new kernel PTE tables. LoongArch therefore wraps
__pte_alloc_one_kernel() solely to call kernel_pte_init().

Call the architecture initialization hook from the generic allocator so
LoongArch can use it directly. The default hook is empty, so this does not
change other architectures.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 11 -----------
 include/asm-generic/pgalloc.h        |  6 +++++-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..a3f93a8b58be 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -10,7 +10,6 @@
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_ALLOC_ONE
-#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -45,16 +44,6 @@ extern void pagetable_init(void);
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	pte_t *pte = __pte_alloc_one_kernel(mm);
-
-	if (pte)
-		kernel_pte_init(pte);
-
-	return pte;
-}
-
 #define __pte_free_tlb(tlb, pte, address)	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 051aa1331051..a1de7d246754 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -19,6 +19,7 @@
 static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL, 0);
+	pte_t *pte;
 
 	if (!ptdesc)
 		return NULL;
@@ -29,7 +30,10 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 
 	ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	pte = ptdesc_address(ptdesc);
+	kernel_pte_init(pte);
+
+	return pte;
 }
 #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
 
-- 
2.54.0

