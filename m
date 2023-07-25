Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C555E748C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:22:07 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ca3cc52ee62so5589359276.0
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258926; x=1690863726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=qNSUsqiVKVB0ESH5eMh2318rltbeTzVNrLxONrPQx/nleyciLPoBJAEyvEQiA5s1Tn
         685R6sAh2RRkBOJ+dHhwwHaTsDfn1Dq0fhp7maY379FRtPvlZFAioZBWPPk7fa1Wkq01
         qN75vY9UJqWiLkOixY4L6XdTPAaqKlrcR9SWRLlUZxoXjG975sFhxm21WZutHmQKl3h2
         OQ9WcHoISTJ2OjIGWYQNx9W6xFSNLrPRAFCGXfmCK8TcPNzYvmKngSTkC45cBTIzIEjY
         73sY0YERl7Ohg+xplAh/xTNZowvdAeC+fipfIzPvDIC0nmap4j6fccJNDYEXWoxWM6gV
         WCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258926; x=1690863726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=iqTzEh8YpqfYME856V78dlnUzSduiCd3Cy/CFXAKlzjOpyTZUHod/0vR9lQCLgjSGv
         2I0oNxtl6Pjhb3M3ATGT11OPDgEbaXJGhKB5MIApoRZXkUhIuofoT1v8fIgxAPjA+MLg
         sluelDu8kEvLc9OqLx82CbN2K5l8Y/VxQ/sxrj16BH3zII6pdPi/xSlOMQEOIfGqiGpe
         mL3a4MgrXa49iXGRmTLmWeBZAl2mEmGfkk6Q7X1tC4atdVwf8GIyt+DDdqEwr2wLxONi
         zZRlulOkiJ8V/npaH2MT2F2j5J/6cJiagXykBTgrtfzYq1NOtte1hJrVFdBo127m2300
         BTgA==
X-Gm-Message-State: ABy/qLbgC+6OYC6t5cGlZCYBNUitapW/ro07Qb96qlaI/anhi27iUIST
	pNenjHfqlgEBCY0d47F8ZPM=
X-Google-Smtp-Source: APBJJlEYsYvwES4yIHo2kt7NPKD5Twgr2oGLJnzn9f7qzh6ZvPXJtQdH1+pOAmNJT4cd1ABpvr+wDQ==
X-Received: by 2002:a5b:88e:0:b0:d0e:3831:fa2b with SMTP id e14-20020a5b088e000000b00d0e3831fa2bmr4772882ybq.62.1690258926669;
        Mon, 24 Jul 2023 21:22:06 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:06 -0700 (PDT)
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
	"David S. Miller" <davem@davemloft.net>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 28/31] sparc64: Convert various functions to use ptdescs
Date: Mon, 24 Jul 2023 21:20:48 -0700
Message-Id: <20230725042051.36691-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 0d7fd793924c..9a63a3e08e40 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.40.1

