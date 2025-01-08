Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB51E9B0A
	for <loongarch@lists.linux.dev>; Wed,  8 Jan 2025 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319823; cv=none; b=okTUGIf5NQ4VoDcZica+Mta6c4KfFhTl6nQ0IHRCO/iZBNioXjahDwZFMSrQ8rkGzlmo+g8gZVqbOoswM+tt0VEjt1ruExGP/fdh8aptK8RvV/lFLc5tN3nqwZVB3ir1ILSNSNv1/kD5wYreOnsveVapX6dtRKgRR+Tr+AvvwEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319823; c=relaxed/simple;
	bh=6Tm9tzzLwfPI5sWMJ+gGPjjpg7Ij0ovc/RrCPGoP6W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RZuHpsA8Dac3QreiCjhJkEMUeLp7nKRKUYBBkVLMfY6WWdH/KF6FG909jWiKIq9lLrA08g2tXM47SwtCafMdgni+B2EI6HF3hSS3pKcMNmq5vHmF95NzPXYpSTzJwObMrBe/v3y+B2ic7c46tk4khJNkd8nUPZlzov452aaI0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bxb6MKRi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bxb6MKRi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216395e151bso7145975ad.0
        for <loongarch@lists.linux.dev>; Tue, 07 Jan 2025 23:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319820; x=1736924620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=bxb6MKRihDxgMBA6WOYiwQJdETYhd+oH8+T7kRIoDMDShHLp9X7eX3dUx6gBZgUseB
         iPAMuu09ocJbU5MxKM1INEveCDP5MENKFe558KNEQieT5mCfqso6wawlqFu1tIb5a5kj
         BMt3tyJnvvTseD8XDEgOfrabGArxoUE/ObmSkBNqJdObHa+6/YYu74mGOGTcstx/JT8b
         xIn9pJXnQUXf0d4XS/nSA/cKTnTQ/LtnThMXn2NeST0Z3HvJO4RlE2bY7od+J+vJSMtN
         jRq/XsrTUSAWk7Kv0U1XsQp4k1F0p+Ezhs6mdnFj+mWNOx8HuIj9C81SOjzJ09lWDO0L
         YHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319820; x=1736924620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmV2C/123ilQKoYc6h41pKDzG2aiaIfZ7nQkaBcWxp0=;
        b=HXCtWLvKtAuN/Cuqg4gEv5OocqMUYNpKUYjNBkpdJHer2mA8G7cCecceaS2Rmzl+OS
         V2xxk8wbMJYgxnapyC46q0UqjiH3KpdudmWB7/WGdkCd+mx+S8F9VVAo6150x/bslmGb
         acAS4FePbqVBPaweIkcw3EXnorX3XbKSAVSAX5hxbdHachPXyWaH3KDyW1NSoDBWuh74
         xjIMcwT8gyFdrCIVFWzofYpHy4MV+bRh3z2S3sJs253YcW3eUYtewBdullEPDvFldI6o
         i0iDuZCOq4MM9B6lX02mvb3BzBO4q+z7fVWtaw6wTkeM4YnLgbqDyqELPjhcYeDnQ3xn
         Mg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDj/c8XD41zgMRjMlJZuCb0zCMjESvI8zUofU9n2dLTsQGnY5f3nWWBAWOSl750iBiWnwo6zz+QQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcR79ITyDtEYRC/UnLFH6+J8S8hWDMIIFir8b6SHdS0URL4AIb
	JZY8FwgcySXOifuG6LyLAjFohQpvdy2qN4O3v2WyhxLQhNqXlVfGRTWJccphFBk=
X-Gm-Gg: ASbGncuHRltvIL+4JnG+zaKbt6hb4CUz9cTt88w3bd68c1eGIN/AoUFQjmSIwSeK8Rj
	sfPLrXQXZB92TNSQxN1ncwndTZGVshdQC4wk78wVjh/qdO6FjtXUUVXHQjytZngiRg5Oqp1sCFa
	d7l4CRApdlRWcSIM0WAJ0DEg5E28vB7sUAZ77d0f+tpWkoRQbve3HMIuIKEEipOmIz+XNAz5sbk
	m22HWoS3q/BYwkZGUHH75jMde+I9uZDrF1Jg9034mxwlOjxpIXbBronZiMrzVjIZVCg+Exurrnd
	w8h9qQKj+/Uup22O4H5uDAW42Iw=
X-Google-Smtp-Source: AGHT+IFPhscn4ro6sBJsBOR2a8pRlJGCRsiSDouRo+43OGNlwIzbjZLHQRkjQ8iB7a2FmZbbQjyk4w==
X-Received: by 2002:a17:902:fc46:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21a7a1d4731mr100818035ad.9.1736319820276;
        Tue, 07 Jan 2025 23:03:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:39 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Wed,  8 Jan 2025 14:57:33 +0800
Message-Id: <1663a0565aca881d1338ceb7d1db4aa9c333abd6.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 does the same thing, so
let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
 arch/s390/mm/pgalloc.c        |  6 ------
 include/asm-generic/pgalloc.h | 12 ++++--------
 include/asm-generic/tlb.h     |  3 +--
 include/linux/mm.h            |  6 ++++++
 4 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..a4e7619020931 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,12 +180,6 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..e3977ddca15e4 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -109,8 +109,7 @@ static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte_page);
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 
@@ -153,8 +152,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 
 	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
@@ -202,8 +200,7 @@ static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
 
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -248,8 +245,7 @@ static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
 
 	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 53ae7748f555b..e402aef79c93e 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -213,8 +213,7 @@ static inline void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..94078c488e904 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,12 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
+{
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1

