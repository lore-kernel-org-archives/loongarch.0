Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551846FD4
	for <loongarch@lists.linux.dev>; Mon,  1 May 2023 19:29:06 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1aaec9ad820so16454345ad.0
        for <loongarch@lists.linux.dev>; Mon, 01 May 2023 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=q4na0YpY6+HIdR7eCjpOfgl3pLZKXaYPSEQBquag8z/68f0H1ARrXFU5GHdi9YxK8/
         rB/VLGJXy6D4ZufE/2LOOEwnretxgWAB++ZlGVRxVIYCoUOlMN8apcsmkHtbQevtOOJx
         LNKiQlcElPDsuGjD80MSn3zT41r1jijBtepWy2itQQP8kPb/qbuR3Nu9du37XsuFat5b
         tY9vSCaH65FZJZYGzqq6Sev5FEiEarceFI+PkCB4zysu+TPDmYzeupQ3qWrtewRiW+Ef
         pPbEC2E+2Gu9odmO4zWHfrgw5vSTXCdgYdvlBNlEJqZMmLFOH+elBEgtadEGjmhbbSeV
         twkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=lwoM1eB/MaKUP5vlRU7oqSuLPq+uNCmFlp+ota6MRZLfC5tVM32YZBKtN8NPCr5s0i
         07jXcF8f0wqjURykWIBV3bUHRwRyjPaqljZbqjt9u9/gN9L+hUehVYx5e8EloVXgNNuI
         kzGZkw8CvTW/tmbdDnrQb7zaRJqejjSXEq5p29gjFxNwmeObbhszcGmkdu7MxSiV6rFe
         a4VlzixlKapdkcsKHGz0p3HotHdNOnGqicmyDlmjjQA9cgcGt9Elry7IOg8f5ixO/WBl
         J1gC2N1W6E1KlyYQ9d2mao7GuuX9JXsgArbqOf16MgAz6ljwB9oixEBpSzt8ut8Tpnhi
         5ltw==
X-Gm-Message-State: AC+VfDznHk+AOm29MrGQLCwVqM+LWiHY4CUskr6lH3IkeBBGPuOomp6L
	bW6WrVJJWtacLkhDv3aSzg4=
X-Google-Smtp-Source: ACHHUZ4G7uSDpj0Az+Rf76NPdw6reyXbUYX/RD5L7uNUC8eMCewkmfrtYB+I6yNLHyDYyReDKoyXCw==
X-Received: by 2002:a17:902:c947:b0:1ab:8f4:af21 with SMTP id i7-20020a170902c94700b001ab08f4af21mr235908pla.42.1682969345737;
        Mon, 01 May 2023 12:29:05 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:29:05 -0700 (PDT)
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
Subject: [PATCH v2 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:17 -0700
Message-Id: <20230501192829.17086-23-vishal.moola@gmail.com>
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
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..af26f1191b43 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.39.2

