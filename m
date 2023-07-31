Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2E1BB4A
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:03:46 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-790a590237aso64000439f.3
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=LO7IgtMfV7D/5pieeNhzhX7jbefImFR1TuQgjSMNALZjO7jWhqLJ0NYlGohhp9vNEp
         P7qjRmM9tu3EiZV8IpnwyOsR5oR0G2xN8+6lkb99Xp3Pq2LKGQ1pnDBT3xTub9FDUFeD
         NiuludkMelWGqpPq5Si9scPBohunGQ7wjCbjn1MG6IHkoKqu0G6KIfhUmk1zbCODarzf
         JF+LluYmZmW6+nXXKHPD8kZWEQzzXdWA4gTgt31gpJPirIvHnT+QXlpNT9xuTR/Ob7I2
         6KYVvpK8cyw965ouTwB0qJzxRQ+l2kkvuwks4w7hfsZgPcLfFUXNyqFPQAdsNQn7UH4p
         LAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823026; x=1691427826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=VeLMF5c4EMkVciYUyKgoS8HRqTu/79BzgkJtrz5nJRrk74wdARL38VH9UGI72GNhXS
         yc+BMxd4bNSbXdBgEyWYUDRrzvoBykRtH6KIjba70MJSQ8g+BHSYX7qnpwfTgqE79IR1
         OHX+raFvnUpRVTol5mcVOuDUpBMg8u2vDcPsB+AhzLbUV5TkoI18esnZHFspgq38qcI5
         VK9FJ33mrw84/AIJTvMVBk3bgqa8P/XAwCz3lb2hKvcMhUFvCrCVOabwM/ttMzxlhLlM
         fVc5kgAGXmkb45bniOjzF3PLIZQ6Af17C7zLP6ltfxyZ4JA84vRiqnTIYjx+ngEgYHd8
         VfNw==
X-Gm-Message-State: ABy/qLZOq5mFuW8JhIXa816MQaQmzvBFYSXMrv33CgRxLALU/9eskqpj
	JNP90TBqDBxVvWg2rio0fLM=
X-Google-Smtp-Source: APBJJlEWqZXE1sICWadhT2wO43hXTa2FHUgzTzYXN3XbSpmzVLjVyMFNIil8bQaSo4X4bLn1gewpKQ==
X-Received: by 2002:a05:6e02:924:b0:349:2498:ed90 with SMTP id o4-20020a056e02092400b003492498ed90mr1956382ilt.30.1690823025849;
        Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:03:45 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon, 31 Jul 2023 10:03:05 -0700
Message-Id: <20230731170332.69404-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3fda0ad41cf2..bf552a106e4a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2971,7 +2971,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2990,7 +2990,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

