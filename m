Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE381D2E2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:29 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d16639e16e6so3788765276.3
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=NCurFfzESiDx9LJv2ZuGZQRVSVONypfRSwp3UCPEimaJ0icLYx3MO5YhqaCkZBIR4Z
         l/oM16YnfTb6kc+h35gY+zFIGDLtxKkoqGrDMVFkoTTTXsh+xxxFI4aLUNlB4KO70CwF
         WRXyA1UJf7HH1gQrjYriX6iIExSZBg+JSpTH9iwwtWaRApzq4XeZb8/+i18fB7X+SbC5
         QNboB3mts09Ey/BGMzFFSqcMjH751GJumhdsMsGsSdMw+HfAwMqxwq/99BYNjLDy4Uwv
         T3I5GqlbCblT84V09f9Mmwx3a1PPDI4Kl+kA59SDykK80t9C+rJKaVJTL/sIPY4ok+Qa
         Stkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823068; x=1691427868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AnRv7d38hHUVaoAGins0CaWMMRgzo0GwUb20Y9YoSw=;
        b=TZPsTqAv5WKWMSNAm154DGdFc+/ygZcGlc0fLsZYBS/uvfR9Re5F6uYiWwY/JAyANs
         ppdeSFudNtXdNJU6D05JI/Kg4b77GWrmWtj/ofRAcpKix7gwHEj3Zv1JFHk7dbeULarI
         JG8X9g3mrPHawsCpnshsvi5dZiGFM5O/og/IQocc/FoBjKdJfdo1G6ToYOqqumkF5Pro
         wIOVxhGA0rcVWgUUbrQQctf4fnkeyNETdFSIk8R3Ka/5XyoHYmddEj1GEn9vEvxbXBOe
         3Wz5Hc/NiL7JLJaofviNnQeRZSkpr22wfpC/3Q2mVeViCiiVZlJSdCyV/uw+VeStw8ar
         3MrA==
X-Gm-Message-State: ABy/qLbTGgFTaNsocIOG+H0nfruNpYOGhM5KRH1MwLjvxQuBoR6ZVkjW
	gb7WfMSI/41nvEPi3N9+DJIlqyZf946ixQ==
X-Google-Smtp-Source: APBJJlH2OMZz7Ho/ZKKTbee+QNJ7Mj2bTW6BCb3XUatLH/MvStrEwd2dCkY4APrPVNcSGvWAfXuhUw==
X-Received: by 2002:a25:acd2:0:b0:c6d:f875:520e with SMTP id x18-20020a25acd2000000b00c6df875520emr7715849ybd.49.1690823068568;
        Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:28 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 25/31] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 31 Jul 2023 10:03:26 -0700
Message-Id: <20230731170332.69404-26-vishal.moola@gmail.com>
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

