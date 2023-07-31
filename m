Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516AC1D2E2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 17:04:36 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d13e0bfbbcfso6733369276.0
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 10:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823075; x=1691427875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=NsFqLoWt3v/Ei4hrw5AsnvwdpZbLVDKyj7Tbvrs08XADPJ7gaOSxsw7sciWyK4ium/
         IicTt5pAnx/uEvhHlkhBbrdEgtE6/Y30DbetyPtuylWlm9M94rgMfdNkMfsGqtqBt9r5
         2L6Wjhryz46RjM7Eb4DDBBbwHfcSN7h5N/Jso4kYni+cF2Cm7JoIdTfshA0rAirRtgJq
         t1r00+5UN5MvK3JKDaigYuLE4bDBuDPbT6+YGl+hj7DsF2cKQbydBN3rr041uGf1vOTw
         rMTuYysQGj/R6E2nTgdgPgBnp/CeSE0cUWUK6rVcO8oVilzfT/uwMzlyU+7MnJSFTrKk
         qPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823075; x=1691427875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=NASuSpsdwXYSWzHLeh3XRDBpo5Ye2W7v6j5fXiCgPdxFs6P7N4cszfYRm04VVZzwPe
         Oq8SBnbqfTX+4vTbhhZxucqgQ/YH1UhQnc/ugELV5d5Az++wIhUOB/U/I8oVWrbOp6cW
         vLHRtFJrGZkWJVc/H7atcNIRhTHZguOtEy/wQPKtFB6PPXivAICG+QyfOR5ZNEhiEAn6
         IA7JYvsqettovmZru5w3QZxs6xSTl/Y9+cOPrwbpfwhK6Hqycygz7IVTxV86cgd3qN8U
         f0UWOOlijUVVL81DeneBfBvP9mzcQdeMgs07/+DOvNG/Q4hQXY7WNGYQWIY+2H1jGI/H
         vsvA==
X-Gm-Message-State: ABy/qLaKaa79XRU5cHDK9Y4TtW4DuiZCt5MItr+WUT+LiwYErFr3afOe
	bo5X98Q2tWbh9BoJTLfa8IJsrGgtKtbIDw==
X-Google-Smtp-Source: APBJJlGLJI7wOi/cAC+4887p5NxC1O6Jx9Z8tS0dkQscAqT6FlNcjE8alBIW2Z/pk8K3FJGLN+6VNQ==
X-Received: by 2002:a25:ac99:0:b0:d35:ee7e:349 with SMTP id x25-20020a25ac99000000b00d35ee7e0349mr1328711ybi.1.1690823074854;
        Mon, 31 Jul 2023 10:04:34 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:34 -0700 (PDT)
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
Subject: [PATCH mm-unstable v8 28/31] sparc64: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:29 -0700
Message-Id: <20230731170332.69404-29-vishal.moola@gmail.com>
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

