Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB5C8D5
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:04:49 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56cf343a645so28299237b3.3
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603888; x=1689195888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX969DJmm0QSNKJIBN0sjsA5M6jg25Ht5D0PDUGbnFg=;
        b=DHb+SR7KsGRi1DGfvFeb/cxlVpv7zXU0kX0me32XsqA75bRQ7Qg4ZCnHwXeAm+exma
         RyCRKTUKX0JKCLOqpLW0CXYvPaKDD9+dZndIAXIpXSKQZglxAQokLHyvAtkIDeRJVqHB
         93y59nGI8Llned7VxveKPhJ65jNvn/1ZERJFDahHCyrGnH91U4DjxWNrantb6oBNpN6U
         mc695USGNTsgQHXOo9YrYcYMEcbqRFQyfPiEiGMLPB7dp4D7SFOp0ccqCy0RMalipiJb
         VM0Bf5j8094tpGlxI2i0lahWPWShioW25k+D4Vvon+EHV5/1d2e6qLRJOoGvyJt4DN4r
         Rfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603888; x=1689195888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX969DJmm0QSNKJIBN0sjsA5M6jg25Ht5D0PDUGbnFg=;
        b=iHfE7VLfD2U65We1JhuytkhgqECW8rY6fJ0i3qrBgWPqsQwTJKYKzwzivebs54p62k
         zQMW9nMlz3WZ8Cpfg5Fp12lULUm4XuwADWRiGOMN2KSWJfUSF+UQWFW++0BmMjs2DrfQ
         fYlYJJsnrTh0IaqLY9Lm+6QnFGebXT9rKdHnto9QlGzxakLG5TZPecVAzqdo0HSWSPKp
         VHiMCdySw0IqgTknOPzubLgvhm9nvt5b8bF4MsMwGXCvmMUeU82tAJk0GS2RzGkmoAek
         iUVRwl6/oXlUyQ59wT8OAof24R7Qwv4rf+5NQHdcorCpwYccuSqpidYVreRW46aEkHU8
         DAPw==
X-Gm-Message-State: AC+VfDwKxEVSCnzHuDd805ixj3M0UyPa5Yor4TfdVTQIuzHRLPdfrcRF
	h7nEBJ38iuDU4PZdsFj39ts=
X-Google-Smtp-Source: ACHHUZ5kzgqtkXUhDflMob/cxrmRbtpI6j8wouGy2iBpxpeE5xKDHT022OIAglde1HGCV3lUDObTDw==
X-Received: by 2002:a81:8406:0:b0:56d:858:7d04 with SMTP id u6-20020a818406000000b0056d08587d04mr5203603ywf.51.1686603888124;
        Mon, 12 Jun 2023 14:04:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:47 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v4 01/34] mm: Add PAGE_TYPE_OP folio functions
Date: Mon, 12 Jun 2023 14:03:50 -0700
Message-Id: <20230612210423.18611-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No folio equivalents for page type operations have been defined, so
define them for later folio conversions.

Also changes the Page##uname macros to take in const struct page* since
we only read the memory here.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/page-flags.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 92a2063a0a23..e99a616b9bcd 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -908,6 +908,8 @@ static inline bool is_page_hwpoison(struct page *page)
 
 #define PageType(page, flag)						\
 	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
+#define folio_test_type(folio, flag)					\
+	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
 
 static inline int page_type_has_type(unsigned int page_type)
 {
@@ -920,20 +922,34 @@ static inline int page_has_type(struct page *page)
 }
 
 #define PAGE_TYPE_OPS(uname, lname)					\
-static __always_inline int Page##uname(struct page *page)		\
+static __always_inline int Page##uname(const struct page *page)		\
 {									\
 	return PageType(page, PG_##lname);				\
 }									\
+static __always_inline int folio_test_##lname(const struct folio *folio)\
+{									\
+	return folio_test_type(folio, PG_##lname);			\
+}									\
 static __always_inline void __SetPage##uname(struct page *page)		\
 {									\
 	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
 	page->page_type &= ~PG_##lname;					\
 }									\
+static __always_inline void __folio_set_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
+	folio->page.page_type &= ~PG_##lname;				\
+}									\
 static __always_inline void __ClearPage##uname(struct page *page)	\
 {									\
 	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
 	page->page_type |= PG_##lname;					\
-}
+}									\
+static __always_inline void __folio_clear_##lname(struct folio *folio)	\
+{									\
+	VM_BUG_ON_FOLIO(!folio_test_##lname(folio), folio);		\
+	folio->page.page_type |= PG_##lname;				\
+}									\
 
 /*
  * PageBuddy() indicates that the page is free and in the buddy system
-- 
2.40.1

