Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24711D2E2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:33 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a426e70575so2742922b6e.0
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823073; x=1691427873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=J5UHMtA0qoYiWw4Ld5R0BKI4Tc5AGDSmTkXJ2I6fYmBwlIVDq2NZ9TijiKx7n7oR9S
         O2+0XndgcZyKpOow8lUaucDbgGPax/K8O+lCXFcyUW1OtbVxoGLUMUxT+xXe1Nbotguq
         wXQV4F4SfOD9dJwiO/iz9SNiN+CqscWBWqXkI0FM0EZ9ZzfP3bhZCq1/PYVKZkiSL88/
         WlbyA+YZDFKl4pgL1EI3/3iabhB8k7YUgWRxCXqfKPLtTRNQuaY8gnPQjbT+Yt9xzJqB
         tpRwv/UorbhC7cKUIm0hPbznR4XxDKlGiKxb+h0cWPY+2avNMZiADFAVxe8ptEu65tNh
         rVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823073; x=1691427873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=DuXb4+pActyhg8lziUc0gRzUVaAWpDidSNjHxUys1FfQg9pHJ/raC157Hfzw7V+hmY
         hCgQBsMZ8zWCjk8FIz6WFFh/iqOltOJBgIpoASEWJZl6NGdjN76X9wM69Nw30/cCogrZ
         UjGGhQlFq71lW++Iz9bTwoMXAIupe090jUTcktrZlbz0efqa/A50HKu39YUbRSAhb9Jx
         lRgOFgRQRK5ijHzfQdz6MZYLf6oyy8wwTMOKzkxbmQ+LJJFvAN4sHmWSXPBNSTOufF5m
         TWvRtiXz1m0XZ9sUznG1oBDaZ8xy81no2Dm4fHqH6odJP1dVg+HmcnaMNGqgNCCZ9Ksd
         XIoQ==
X-Gm-Message-State: ABy/qLZkIK2CqKM2RR8unieNlBbdcBdXcg0hr+4sdk/U91+ICSFu7kk0
	HXncN9vtQKPZ1VWu4quRfds=
X-Google-Smtp-Source: APBJJlFtSPsXmTmbaE2JVTTuMieuMfoOw8pkpK4ugTgdmGfxbA+pL1HJ6fgn2J808MNJLpsNTjXtIQ==
X-Received: by 2002:a05:6808:655:b0:396:4bbc:9a36 with SMTP id z21-20020a056808065500b003964bbc9a36mr8685999oih.19.1690823072749;
        Mon, 31 Jul 2023 10:04:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:32 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:28 -0700
Message-Id: <20230731170332.69404-28-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1

