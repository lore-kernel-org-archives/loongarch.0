Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7B524C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:21:16 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-ca4a6e11f55so4307756276.1
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258875; x=1690863675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=p9s9prTX9rn/wpC0IRJR9+orYvMKxIQqYiO/2qc1ucIOxNaOErt5vfdpNKxEU6T/vv
         +2unp610u7/KZK91WoTQLcBH/VtkD3XUQxHC44CLkqpLaHmHFzgBPOO6uWyO/3jX9Xgf
         76GcUW4UU7BHeMr+SY/V25wW6PaanozuCo4EhC7wsdhYIlQKIrWatw16Z/wgKznB+Orn
         ruoMSNrGoRWxyM/OJxGteQSORJl7RZHeZVq6QR7pMySplhmG3+tZ02+FH1KXAFJgXdGU
         XCaHvNOv6BykhfTtnLqNaZvGHZmQ1vFu3nRlDk8gtK37Li+LTW7MffEEWNWOsyB37y52
         60nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258875; x=1690863675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUMUqbW/uAIHfn0G4toP3JCuPKsaNgXF+JjYaBSaBaw=;
        b=TpAc6a1jAutHxa/vlQNIjwaPIp/bOOedbB112VsXtndoFoGnD+mcTpkCTPupCjjkBL
         lBl9G+vjmVm9IeQFhWpr7iznAybIV4UCrIlH0NYe0q5D8cqdwOJyXJxS8S+5TtO9kNiG
         59ZBWSwafa09Ms6V1VlDopNPTTxskhQvwWtdRVdIzId6vrQ/7CGyR8FQ4fSYEfciqDFq
         SkjunngWusjm87vDT/uQQ97B7ogR5cVqPzH7KDrNAYDIAjXTlJ+GNPiTUOZ8wqAZZ3Mq
         k2u+9cKdntsJZTIXx/wEvuSES4Xw4LPfvT0KxikTEIvtheihpuP+8sozZobNYpnRHU1h
         KchQ==
X-Gm-Message-State: ABy/qLY5qxEEMNxN7pgYeC9H9QTEdtwGsEDPDMzpMTnuraK6CYVc1sCO
	uaS13Z5o80FAdo8c3VYE3xQ=
X-Google-Smtp-Source: APBJJlEMSP0J8OF6O819F/tTFVo5KNWedtuWn+u3qsGgdRhWZk0PUYcaZVFlVCsLViSNb2GRnqh20Q==
X-Received: by 2002:a25:6b45:0:b0:d10:68c5:233e with SMTP id o5-20020a256b45000000b00d1068c5233emr4343866ybm.60.1690258875202;
        Mon, 24 Jul 2023 21:21:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:14 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon, 24 Jul 2023 21:20:24 -0700
Message-Id: <20230725042051.36691-5-vishal.moola@gmail.com>
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

