Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09CB6FD9
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:15 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a66e7a52d3so20941125ad.0
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=pbOgq641Q1VbKkWYpSKEOBTaJbK7N+gn3tPQxAnQMHVxsbuYS7d6gCFZWWRyAoJPvd
         QWBoalX7ztTkXy1/S77S44wUsaYiw+c9l0pjoAvj83RwanS2FHVDTD9b5yLt3dvSiRkC
         Y6FbuRkXeTez8mU8JwqFdJ8q3udPbLVyCGPniHNdmE3Bvis2G1N5Cf54GBHK19m19dh2
         ECy1qDfhwNI4K2KlZeZKdUsb//pSuTNjtcr9BAZz+ZE7jjtZb0g8W7o+eLshkW2fWRhk
         rjbBHucvZ06kdc4e0Uijz1mCvV4V1RY1P7Hdmh8XbAUQYZvgzIuSpNmzClPaEZvw/eBL
         VKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969355; x=1685561355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=ZvzPlWC0MX0cgXwdYSzHocOh1rPGkh8WsywieIg52pc+1uED4obpgOx+jf1IHhATRh
         AA2njmOUDxx3NK9etI8/DfQ6wa5BrVOPl7ocjLIk9OKgGuhiazEfrjoZe9GYCUj7iGkL
         Cl3bmyn8F3y+TWGZyTrBJyCpj6t1vI0kZA7u+SJLYXYyVqcvuRZ/ZQOgXjmwA7Ieapwm
         8nnoWH2H8pIXpWqKcw0ZtZ3+NVBypdI+P0VxEelUghpTPOv7p7CT2fbBu484u4wXXgjG
         kDULocl/IMOV5Yus5fknn+OXzV+dLk6/u6oFTxsOHd1QrCjOw8eOKtMlKr7NQlcfFbfs
         UfwQ==
X-Gm-Message-State: AC+VfDyUCPu5dbU4wHW5c0HzrOKT3JsIM8ip7NE4RBSM+oy8GfbTWoZD
	k6fAiQw/i9+ptt9EhG2qrGmE22X9ctZQslbM
X-Google-Smtp-Source: ACHHUZ5aUwQpmXFq62IOwkeTiJiFUSz6Wt9PaXTxNdRH/kylJwLUJvf08r71LifeGRMo3EYnyRIKBw==
X-Received: by 2002:a17:902:dacb:b0:1a8:d7a:9255 with SMTP id q11-20020a170902dacb00b001a80d7a9255mr17869996plx.54.1682969355424;
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:15 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Jonas Bonn <jonas@southpole.se>
Subject: [PATCH v2 28/34] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:23 -0700
Message-Id: <20230501192829.17086-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..14e641686281 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2

