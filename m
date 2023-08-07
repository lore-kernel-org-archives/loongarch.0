Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5151772A
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:05:27 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so4187555276.2
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=g0HQFm0Ih+ONj9bbGpN0SAoMFwZH1Hyy1LHhk9Yh2p6W+FyLdnCJ7RPABmEq6UvV+/
         I0mwYg/T2n8LaliwXnPTiC9GBqIvZu49Qi1V/N0MmNRCKbxincxnUS9jodhc4yydOwRP
         aDjCJ2ni1nNWMxe4NQznDsxKIox8DPgLSsmzUNzOiHFpehQua0QatbJlVlVObrSVTwwk
         ZCujc6+dVnog1ei5Zro9QqEP+ju61k33bEcuj8U0Qr32h8YYXwWu+8Jh8gouVCHVOaNS
         iYc6V/t51fkGJ7ybJ/9xFdZCGVtXquz95wk1/VRVK/X9HGuHOqtxoDT8S6kl5FuAfQB5
         VZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449526; x=1692054326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEHGQmND3TVCalts2Xn8ptU7qEA2BpyVbaRRrUVwgj4=;
        b=NvsSZeQvezgSWUIZsoFZmCLcGP6/J7rOiQjzRiC+bhXh/Z9dHBAUaAtyQNk23y+AYW
         +Bah4/NPF/pOpVgN/pxUWXRxjTSkSpFUrqhbqivE8C6HehjSrdVkFSwUVVaC5bZRJ28O
         t1B2C89STHQOnCBOLG0WRKmcI3keQmPn+TpTjdBQT5SICXepU6UUKsDZzG2WL2eBdlj2
         wTp1bw2vkD1fal7M9GxTH69L9H9jtxWICsK2h8EOvJc0yUVQaDV2wvmK0BJPuh2ZdvEj
         anpM+8cP4uiv2hnBQ9em3c6aURmYQz+lB/OJKysaBxEiCie2xBTw+KZZQ7/Jfi6vNKKz
         IBsA==
X-Gm-Message-State: AOJu0YyAWY1r1AS6ja9iUkb8+9EZUiE7rGxVolziMif9dYCl+P5M9s6f
	Rsznzga9CAnSuXlZaTw3Mv4=
X-Google-Smtp-Source: AGHT+IE5Cb4oRalCjMZQpBv2Qvb3EAIojgwuAgurnfPzGGotvhmzGY7E65P/TqlBpHFwkOco7I+V2Q==
X-Received: by 2002:a25:d56:0:b0:c67:77be:9ad9 with SMTP id 83-20020a250d56000000b00c6777be9ad9mr8584839ybn.30.1691449526389;
        Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:26 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 04/31] mm: Convert pmd_pgtable_page() callers to use pmd_ptdesc()
Date: Mon,  7 Aug 2023 16:04:46 -0700
Message-Id: <20230807230513.102486-5-vishal.moola@gmail.com>
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

Converts internal pmd_pgtable_page() callers to use pmd_ptdesc(). This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 54dc176b90ea..f6d14a5fe747 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2990,7 +2990,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -3009,7 +3009,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

