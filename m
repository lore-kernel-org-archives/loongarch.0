Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A36FA7
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 04:21:48 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d167393b95aso1021234276.0
        for <loongarch@lists.linux.dev>; Mon, 24 Jul 2023 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=isSLzJlVCcu3DqkromZhEI/qWyA5zzmxG1x9IbP6194I1DKOByM/hDEPdxe0FV3MLw
         d6Rw+lHZ9WlgptdvBWiFzGMaM6KUoRlGp3xu2jda8iMy45KiL59BtGKHYho8dHuVUxG+
         hJLuMObqibUKBJwga6VwRPSAoh79vGoLNGxF2cxBKo1aHJdauK67/yOhDfLuLDKzblyJ
         F0wgtxLKGut1KlZ4xgsSxueuM+T0O4hKbp6cFWk4PiHYX5rGa1VxC3c5t+U93CbfreQA
         BhDLct+PPc5ibyvQ9RmPu/T+BvIQhbpSiLzGAmfokkxsUZTkKg3EAjaoANJECHoNxZLs
         xbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=K8/bg4cjPSu3uZYepo7V0RBLz8OSlcRvVi8T+uldjxtux0MrGNw5AEu44ZjdA5wrEf
         T6kxYBd66psHqyB+x8VNUpf1i1toNfXrL1DpjJjuR5G1HXppXssT4ha3lW0Lryb1cZjM
         29E1viTTh9o/W2ZVA/7mt4dXbZaFXxuxBrwGtCTTodhkC81sJsq4knKglJ8MwXikaQQK
         H9+OKq69ZabPY/jjl33Tdl7FfxGYctk40ModMTtxAO6kOAqMi2/d5mT9TT62IltD/uL8
         dyx+LSfAKZQUV9j/F7YiUreZ27/0DgQEXYJ5c2dgsiMtCgooKwYOVcpv4w5DZJTPYdHY
         j50Q==
X-Gm-Message-State: ABy/qLYVCUGTAzvQzbv4igUfy7Lc9HZjxDkkvEMHrhc5ycKBnZky0hlx
	qX3TN2zdL86BF5qChxcewBU=
X-Google-Smtp-Source: APBJJlE3eJKl34GJI9esPlRffLNepF5AyEOkc7MEH4MKJMttiyYPB1pXgCmUyzmySa6Xjpm5Cuhodw==
X-Received: by 2002:a25:b08a:0:b0:d07:1a89:2e73 with SMTP id f10-20020a25b08a000000b00d071a892e73mr1367996ybj.28.1690258907697;
        Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:39 -0700
Message-Id: <20230725042051.36691-20-vishal.moola@gmail.com>
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
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1

