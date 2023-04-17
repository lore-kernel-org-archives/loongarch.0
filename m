Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB2A94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id v21-20020a17090a459500b0024776162815so6442077pjg.2
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=Bs6MBnbjQkX1GScZCbLklar3CQYsHMcNQJhdEJMSRoz85XciXhpnQ0YtDU9kdG/nWk
         TxMCtPr19eviQJI5aQ6Z23KjvD0/UYdwUUF801SK8Z3tk/XuPH8n6ufK4lU6OPOoTkEa
         tcxsOYaiL60cLVhSI6wekl2Ojt4T3pVi0l4/Kpd6dmP8a2GTqJPhoPlibhYfl7AzaVkC
         8dHP626PMZuKBlHUuWDeE5Ws0Xf5nvhx1+eNXqdjJYxnU1JpJLYxfuGpVyKb6jdKhgqK
         l+AozFzFnnh8JDe5VzEpQS6lDqTnIa40opwHXXYLbmcB20BMSqSIISIYF0OD142rh4KG
         4Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=HJT03D/enI6WizMbIUli1ONTwCeYf7R3Jsqaee0fZxl9OkxKLkR0LlOl+TD6hj+lsj
         bky3AD6I1IiXN26+x1enLCRqJCavhouuvvpuUTbHJAh2+qrHZ3/jVgMHSXAiC0W6txff
         n3wm3c98wEJPzu7ANx2d7urVjijoVUoewgFA2nRiTTeWtGGTJTYU/w0cn01uregV7rC/
         hK2cZScmGf6V6aFVq6veGWQS8gLAXxX6HjuqWTWrBDQgQqwLt4GOS5xwmhknnKwXsAiO
         QX4y6ASrzIifvqmJlgmpHe57Yx/etVe5uacdgzC8JUBCbKeCtZ6w/ZbROOzHkUo8zR4q
         FM1g==
X-Gm-Message-State: AAQBX9cbYBdM4N30TVdscW7mdFbrWlHHSMwGV8YP8b41Tf+P0HTnlCz/
	cHHsBFqBkLXL4n/awC6SfVs=
X-Google-Smtp-Source: AKy350a2GcdGbRUVrvD14pA7yb7zjU30cICJUnhJQSgTB8CRLuH7Cup5yhi/f0UjvURoMBG/RaZdVQ==
X-Received: by 2002:a17:903:1206:b0:19f:1871:3dcd with SMTP id l6-20020a170903120600b0019f18713dcdmr272381plh.5.1681764808447;
        Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 31/33] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 17 Apr 2023 13:50:46 -0700
Message-Id: <20230417205048.15870-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..964938aa7b88 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!ptdesc_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		ptdesc_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.39.2

