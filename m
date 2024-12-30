Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2631A4F1F
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549909; cv=none; b=DbUxJlSHpxMZ3A/Hd8PXZHjANk0Fw0yHyfu2TyrpEzFAM3y2Y5VUsRPIO1z2+KrTtmZDExVXgkTFSwb0FbuVQ3UUKe9aEwzVZeZWN4wwOOAaTayHQJ0n5i1qEqb+X0tWJ3T93ESAOysPkzWgUf/PB4qRuJbKuCj7c5gG5UdvY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549909; c=relaxed/simple;
	bh=q1hWJFvFfNeFAOErQnfZb6jq/jCJy3LyoYOS1Q4McDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n5KQRljMKNAUr9XEg7owzET3W8fvK2y0A9Ajyb+//4WF5L9/xNza2zU2r1GC50S8NTVBAQOdV8sE2I6AJziPPjRV/ZqR24aVWB4F+OOJThEUYmU9H81Mf0NOVM/GdxkqTLx9cwZTQG/mM+fEyNR6q86xlNkz5AQXTrUX6YByn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JmmFB6ph; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JmmFB6ph"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21644aca3a0so17758815ad.3
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549907; x=1736154707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxx1VFA8X6F1Vml9+szJuo78n9B3sJITH2LTRfnVDm8=;
        b=JmmFB6phwNJVxAp6OCyHAsPI2PZSrKImglvWYFf1VyMzMPY+hspIhZTC51BkjVk0Hu
         vZe3+nKfRW4InwXlSHqCfWfEq7txGhA62LhME6VeStHO9u0xLRInEswNLCowmeqnNFeD
         iF0RB2slPjABPs+9sr4WC4IXpQAvvksfgKBt2YnepWZIdlhzFOhpNJ2zt3Ij28PTUtAU
         VSFwBe+rD5X9yyvTfMK+tnDIVJvbx56fwga4ISdYvPnWNAEMtk1XlgQLMNNZqQEpmeNI
         zdSVZv7NjcPyVGUhWUaAgGIwprtNMy+rlF75RqEwxy9LZVpMP1qM/XokRiSLkLATlkzt
         k1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549907; x=1736154707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxx1VFA8X6F1Vml9+szJuo78n9B3sJITH2LTRfnVDm8=;
        b=PF44wo7IqBEJIZzEIvFTSFUw/X7XztcRcG8Msh5GdScjxvNL99Z/LdFVSp8EnKU2Z+
         37KXVGt2BrGD2WZG3P+08tEPtsjD3aK1Nak6ySNTsBm0odDq3x2GMGIuAo3zFGTCL1sC
         Yb/6nC7p2JJMmVDNijsgjvYRMYvciOMrwAFWzLZzSauhAAaCc1gHmyPmiLgeWFCTbi0L
         FtxPQMefAmEDs6z52Iv3JMctJPcHAxmJvNYfPcJwoij8lWTI/9SndaVBKa83w2U0FJQQ
         5Xc0XtCbsjSXxuRsnQGpAcFPjGl3FEYa02q9yFfVdmx+tiZklPF42VLM+N0MV4kSIRwt
         fl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiUwBGpHgftLO8ggwipjwnOjojBoDSeh840g94zGFkJfMINDCD+mr9aABe9eeUgxeO1zcdFd0CryA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8gpPEyiFgt255igD/odcgbH6MEh8T/+8ienqd7R+or7qxKOn8
	Xi6MpK+T5SHasP/f9gQIXKjK3CYwTNp5Tdj1VMmVIuk9KZo7oXWKX5iOZqvNNyE=
X-Gm-Gg: ASbGnctIPvEY+ks/5Gfj0sH48PHuXiOR1yYYvF8hr93q20N9XmyyC3SMKILYb5KOlgt
	eaZYNeOi1jJrnt/7drQ/x+JIR4QgZvhW9XEjmeSqtx381x11Ee9lCUNIwfw0eeyD2+qKIZNlPD3
	B27xe+zbzRsbW+HWrlyO52xP9izEzTYsvJBNAp5Np8ONwqF14/Buc9VpMpkQzPqmKvZ+mOQRd7C
	RfhVVfMhVhwWAVicRJ61BqPXR9LayXVLu4cHBtDHNJQ95uwia+7bX4HRUtXWpEtbb0XKa1ikM3z
	AmP0s92vpoiEEgmO9ouvBA==
X-Google-Smtp-Source: AGHT+IH6enLQBRxhPiyC+b4rbFoH6ZPXIb+9j2XLkfNoZdfNkkGtY/WgMqtF7HfldrPWQopcc9iyNw==
X-Received: by 2002:a05:6a20:4308:b0:1e0:c8d9:3382 with SMTP id adf61e73a8af0-1e5e0847084mr55644198637.45.1735549906952;
        Mon, 30 Dec 2024 01:11:46 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:46 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v4 15/15] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Mon, 30 Dec 2024 17:07:50 +0800
Message-Id: <cb5700c21d0eed9eb50bac385be1fb6cdef7e530.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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
index 69de47c7ef3c5..a96d4b440f3da 100644
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

