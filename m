Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7002517AA9
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:06:15 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d4d0ddc15feso2348221276.1
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449574; x=1692054374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuJFa6mAGFwbCAvFBsdWEeQAHJIQ94yaq1s2El5pO5M=;
        b=sRCgndxFhKIflL3dRUOciVixuY3um2CsOH9mqCT4RfpcBNQLoC/2xIlVP2BC0LrRXg
         d0Mfnrp8G1Gq70+B6oCgBqzc+N7zHH9xY0+av47l7B8CO6Tt+n9pMVSoswf5Jzx8/yzy
         NzCNQAVK/Lkid61qiT1qq4e/dSW3T9N7fVh6BXy/whyNG/50NiRv4160ULtNDt7ZAJ8u
         ZEinV12wAdQdY0FHQSDiTfa7/P6pGvAR+Q1UWR0j31w4+0ktiAC1WT1q41QbYEtl/+hQ
         cKdjsvUfk2w2q52f0mVtR4dPNDq1UHAYwd2r0wZzmsP36I/aPnhCen/ej73PJ82E0WBs
         UQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449574; x=1692054374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuJFa6mAGFwbCAvFBsdWEeQAHJIQ94yaq1s2El5pO5M=;
        b=KZ1SENf8F7RUmA1+/6Y43EYTqWZCWY9sMbzLVjGIwqb049PUttQRr+jowP0+ThKRuj
         ktGBlDHKNlw9DSlXjVE4h/LlMC0RCdcLBC3YNKSb2fyNm9xH4gY/JmakY3Dd3h3i+0PR
         LA43ETkrSnX4yp0c8yOG0usqXNieZ+vgt21beRBFanXeFceZ90qy7ONHCR9a6Es5WMcI
         /2VY74NGgc7FsnjZY39cXYZ36NAM0PaBRmXeT5XU1eW9nVE/Qxjs1yMo9ArK90EEGlS6
         pLV6iw4xdBHjCf1u48uw6VfZ4/Qrl4g8o3ew1kHujOwHn6EM5VwqS1n1hwtFFj61tmlm
         V8uw==
X-Gm-Message-State: AOJu0YyCKkkWG9X8DHH79i/0ARK+Ou7LjUFnwGdPN6NGS7bwoa5RMBRC
	C2wpPSJAPipsO08KTUYISJg=
X-Google-Smtp-Source: AGHT+IHDPhUgl52q/fREvy7LWtCvyksQLzlkWI4tWrtb//A8NgqAG/s+XL1YOkSBACmJ6FF0msS3mA==
X-Received: by 2002:a25:4081:0:b0:d4c:82ff:7bde with SMTP id n123-20020a254081000000b00d4c82ff7bdemr6684894yba.63.1691449574044;
        Mon, 07 Aug 2023 16:06:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:13 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 27/31] sh: Convert pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:09 -0700
Message-Id: <20230807230513.102486-28-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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

