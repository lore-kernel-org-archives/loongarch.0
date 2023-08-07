Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719D17AA9
	for <loongarch@lists.linux.dev>; Mon,  7 Aug 2023 23:06:08 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-c5f98fc4237so4187800276.2
        for <loongarch@lists.linux.dev>; Mon, 07 Aug 2023 16:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=W+7e7ZXA6pq6bkOdiU4kqXMdaRoaFiJYq1YjNheTen2BEAKrJsHyDCwylC8TwIaELf
         OoOeKnKEm2Bup1E3lQkfzBFhNx4UEQeZdbP6gFS8EtHNx1s6wSSR8pJNy131BEuCYsID
         5yHclRtlDqB0YUpxc8mp/j3duvqB/kcSwVKs7titgSAxTd3bahGpDvqB1s5BR/l1Q8b5
         JJTz17F1sukT0v2fD4c6TeVfoKxL+4R8ZKOAgjggAvDHXskwAwGz/9+hK5mkw3BMis+2
         8wcIPPvCrUvFi8Oxcy9SzYIpq7haNxXeYlICDRNRlufgVcr5TYo9K2btnO8SAcdlpPvp
         77sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449567; x=1692054367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke0Z6VjA86Q0iJYCAtHmQzMGt2iXqJZdkl8QiQF9dCo=;
        b=ADwPsnyZbitJ23rNSnGPSeu4ONNE2aWSGB5ThV0krPo5s36HiSrTuqtAsHUN/bGXlN
         bd3CNzrgthvGdnZTlneS5rWIFjz2NPqBNB3yazAFAsSCPKrLhTbMmWhmqAgJduKKDq6R
         9jzK8jM3ByTSbfxQY280bnEa3uZMX44MFwb9zYv7DM23ogVG4gGpylb2AD9tON5n/ibS
         t0QpH+OuvO0VlKJtdWwn2md28ZSdbQHeaR0uSWXFO1YmqRwCpAisRWIZ4Vww/iAcVPuK
         QvYT/zkH1Q95dtER1I2DpHxZv5O0bAG4PtMziZEG655HsXdS1gaaOgOfh/uDcGXpEoBT
         J0vw==
X-Gm-Message-State: AOJu0YwmOfx0fSN1MfCmM78XL7BTxBYGIMZPfoKiKb0NErPrFiUtL9n6
	c6F/E9ZsR0l4khBqw6OSg9s=
X-Google-Smtp-Source: AGHT+IEFwZzf7hWzCaDcJ0rf5o011LKpXcZZ+QgyAwbXtivToV2K1Z3qkIAZZunAX4r/XJQivv3Vpw==
X-Received: by 2002:a25:29c2:0:b0:d4c:f456:d562 with SMTP id p185-20020a2529c2000000b00d4cf456d562mr4842541ybp.1.1691449567341;
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:06:07 -0700 (PDT)
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
	Mike Rapoport <rppt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH mm-unstable v9 24/31] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:06 -0700
Message-Id: <20230807230513.102486-25-vishal.moola@gmail.com>
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
ptdesc equivalents.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1

