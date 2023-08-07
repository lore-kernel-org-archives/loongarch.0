Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1817AA9
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:06:19 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d1fb9107036so5483034276.0
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449578; x=1692054378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb5+fiX/YSPgeVruPImZCslC+7XzLtSDmAZ+KnCCvCw=;
        b=LURal4KqklmU9AiCOifU5Mxc6WM+IybZMw4f+H9b+ehsvWfF2rdEGUCUpHED/xgeP0
         03+is7BherE6vDUPF9cInwhZZ6O6FVEP73Sri7+CBG0/7jN64G4bgtBq56ZrcLUBIxxT
         uSfx8fFqjmiqF0MtkULVgc1gjFJH4lOvkwRfZt9wzMVRnizjKRrxJwuFQ2mIfEo7cHgy
         UR2ZIO+mIWR9RWU4d+HJedZnPKiZaDv8i4STB2D6+pQaLcMt/pvWXKdhAwPxBTPHyGDc
         YUL8XwwyvOUHrQNxNKfZS8WVqZrgPXs80ZLFz3I7kRgWNiGS07HTyMzLuT9V1dLH0d1v
         g2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449578; x=1692054378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb5+fiX/YSPgeVruPImZCslC+7XzLtSDmAZ+KnCCvCw=;
        b=UXYKBhnLfWbaEMoewva8ppfe6QD9zJTZrjy1xcEOzL+B3efiuf0uxtCadUjVkMiGqj
         M1ah6kmEMaI6MJSuvrHeoen6okvMBAg0qh/NPi5DtKp1tu1yHG4A6s80NOUp7VhQ8DVd
         MpX7wIBYDa9w8Rx929gHYuSPEhylNFFFm7MlQ1StMIMBPm57tafHH3ubTOXeTior7r9g
         Cb7fTCdDHhBdS1mDUgxpFDEkacmhffIoDIQeKZEzQ2oqsYPHLUf2sLGjKVROntY0OVlJ
         v4doMWW9r2COfnxHgykk4QUepwxVPBc6nFm12IuRBmqXPb/H4YSn11omWMdvHPSTdRxK
         ++IQ==
X-Gm-Message-State: AOJu0Yz3YwWYnJRwAjwDbVtM5RSILDkPHKUNvHIgJy60c7m+aE52CXVR
	ifxbfGVvsHPAAgNQByRMX1A=
X-Google-Smtp-Source: AGHT+IHSK0JHQfLZYNqZB3BuP0bNBVURutz2ITpQB4n2EhlNMl4NfRND8wevRJ4hRdMY0+rsbG2z6w==
X-Received: by 2002:a25:ac04:0:b0:d0a:8269:e5d9 with SMTP id w4-20020a25ac04000000b00d0a8269e5d9mr9659872ybi.60.1691449578542;
        Mon, 07 Aug 2023 16:06:18 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:18 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon,  7 Aug 2023 16:05:11 -0700
Message-Id: <20230807230513.102486-30-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..8393faa3e596 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!pagetable_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		pagetable_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.40.1

