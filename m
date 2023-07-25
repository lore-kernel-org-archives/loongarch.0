Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9A748C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:22:05 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d09ba80fbcaso2950559276.2
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=GBQqKOXR4MY0Ps6Ytzn9QjLc5kcnNARqYVMOSqCl4nxxP5zueTINjr7iMbjZhk8uU1
         uF+ZNdDLWemlb8QXVTn60jLorPF4KaxuajyPq7XQ8ZCUpgrsfyxcNU4aZsjJHBdfgv4V
         f3SehFOrdMCWYaV3GNfOxXZlwwtfQps2pLwSnw0r1MZbny4VXC0cZl+5ECg/uwswSkJJ
         2spe5/EA1yI0VqTuQ1Drr9GEQcMwkhM/FKbElCEbuZdJkSdi81Zbahgosic5IMYJMWsY
         zz7YF2FVGFBOrfl6ZnWHbV39qhmx668oKEAvnRRKMjMLLqABK50UfsT2Oc13y2cvxYxd
         xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258924; x=1690863724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=l1ljOKEAC8+u47hiQxYOFIRZ4U6m5UvB84SvTNsiFbXNRDASHQiChBVZau+A1zq1tD
         F3qM5iY5I0BB+2qCSRORhittpgn81362BDyIbG8OA9PurvymQy+hqFge8/RZVVpz8GDs
         03g6gYAsS9MsskEGgfRdBujZWMyzmBMj1bMRG5SZa3eX0cmeuWnHWsD7KI+P9T1GV1Ws
         1FQ+8C3wNHgl/pFCnk2eVySuQ+765CE9yXjCJVcFs0nPA27IAFhM1H+FQAXglXSWdX4K
         +r9cSfWtPF6kpW8rU6vz3vAcgJ7FEGirWwWDQGiY/OtLG8mahgWWutvwWiEnReFEuSE6
         KSeQ==
X-Gm-Message-State: ABy/qLZu7mR/VtmTfne0MhVxRTYDg154qYXR3yCIbrK2NL1vOspyw3Ar
	OR+cRaXm6o6BRqTvMbmE8VE=
X-Google-Smtp-Source: APBJJlFIEKBO4FnrV/9ajkbTKUo/vEdRCYW7kk6X3z3g19puIv3mx6us1kMtRHRFLnY2I/2ODsKhEw==
X-Received: by 2002:a25:2309:0:b0:d0d:2d82:7a27 with SMTP id j9-20020a252309000000b00d0d2d827a27mr4389099ybj.13.1690258924402;
        Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:04 -0700 (PDT)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:47 -0700
Message-Id: <20230725042051.36691-28-vishal.moola@gmail.com>
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

