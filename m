Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E73D6FA7
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:22:01 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d075a831636so3448350276.3
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=pF3/aUrb3JX49e0u22fW9ciATl7u+MUedSxMIodJhkvCSur2UbV1ymLo02TZ+J+kPF
         Kx5HeDHnWoCFEiMJQRkEFLmGeKvRgst1SRco5Nf2sutYKL2w+MtMEjm9RYoVaVV/WbaV
         YVQVPd7LOUuBtkmGFl+FmiiuwqN1u54q2lW5pHrezKOb3piONF3+v81Wt/4bQq44saNJ
         XmrP/XQPqOefJAz6PJqT1BLnizFGrc2xSl/LadxebvB7doG0PAx8D01yebNX4JhyxCLk
         tgaBucE6SVITexqLzDjpMrpbMyKpy8WP6lMzfEvzG49OmJW0+1GrWwpk6bQXNmC80wMv
         +HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258920; x=1690863720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=APjLEhswYkRMoXOT/jPXP5kUcUA9zaYxhSUgetrUfsTTbQPjpGL2XueX4a0K3Pw/Em
         64LwGTgsD4ZNDA2bw6D6mU/Hn12NwDPXpIV44+Uv6b4HyXK0PU4vnvfqspvosp8CYfhs
         NE2R1fvuYwFk9AfgZ4vJ7Vf/iA0Ob9k7qoBi4wCY6TfherBp5NHpQVHqvheCfLmCk+Uh
         cQ28+7KKETFRiUvT491f/AwkmQK9Ivv4NG38vMJBWjQg1jD5busDbV6LjIkQJIjxFJZO
         lNZWlbrza8HOk0QlyakK1Fb8bM097nePrNLs8IrPpbln1thM/w+MI1ThcDONVeJNJG4m
         RcrQ==
X-Gm-Message-State: ABy/qLZwat6dKGqjtHSljTB1AmXh4hZmWUH53yzhPixqW51TXRiksN4C
	LfsE0nnvgH0KWHxp1FgL+iA=
X-Google-Smtp-Source: APBJJlEdkcahnNVyEvlWTLDmpaRsWSF5WciOnYxL0p0ce55MSQlJt+bgPnW2jeW0QxRihWyF8hwpDQ==
X-Received: by 2002:a25:ac42:0:b0:d0a:da40:638e with SMTP id r2-20020a25ac42000000b00d0ada40638emr6436068ybd.12.1690258920108;
        Mon, 24 Jul 2023 21:22:00 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:59 -0700 (PDT)
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
	Jonas Bonn <jonas@southpole.se>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:45 -0700
Message-Id: <20230725042051.36691-26-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..c6a73772a546 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

