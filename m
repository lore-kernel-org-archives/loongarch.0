Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF861F172
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:31 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-39ca48cd4c6so2440562b6e.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=Hs3OvBwxjNbzyixj7aSD+NgtYC45wE004i2+DhLM32gwxSgyME8uf0ehUc+DFmEBWc
         xTMw6H3P+HY7Tq7UuCfgFLKB1x+LkNTK02YDaXYWD1PeR9EEokleZ/wyxNBXTFWH/El9
         c1bXL1i+QVcFD32llcBXIuwFJs/8j8fBCHPhcoBGFcfEu/JCwezOfmF0Yorw8OxgwAQW
         Ostw6KM5t1cwURmpaD0hTGMu4TC4wHA6I1gDTQyjBc+K/xsxhtlIAUhVsIG12sG34SnA
         HCLguPK5bJjFlDAoWGoj4Zr1Q8mKdxu4vSYAJa+HTJDnQnTisEOZH/pEJVvGvXlWVYbR
         pDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603931; x=1689195931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFY2ToTc/KdsqBsJRwbv8KRLKHn/LK4ImlbTce4a9J0=;
        b=YpQGroJz5zU5TLGL3jYljZ4B7pKryZ7SgPXig0B4QkjZ9HbjO1R+V805MzmHDlSGir
         Sk+H8xuJiakNLpPBXunfL4QTW1bumWyj1TcPDCXg87gzVkPBY/T6FZhUFaa8bVHj/CUi
         Ck77Uymhy0ATBzQqDGp5IAUlqxTWFYqrCi9C4G/13AR0IeuwbnRp9gzT/3vA8OHsLI4u
         HKU6q1VbPdFZNxoNXWSDg24ZpQmHcW4ErM43Kh5VYPz2yGo2uDi8dfaAYkXqMlfE4WPq
         /iW3yjXrRYZuejqrDtm67gmgA9vPU1NZzNBfxyIm5T8eDW+K1md5K8LDe1nCpiQJ486R
         kT9Q==
X-Gm-Message-State: AC+VfDwt0qR6PZYr4efsFdXDpPNDGkDz6VX91sixl/XcH96dSNfTfPz9
	xs4tQlM5JF48ULi6fQjPj+8=
X-Google-Smtp-Source: ACHHUZ6j3CfgAuZNFN9JISmvDm/MlbHYE4sRUTkol2XKHwfWtbEYLS5pSkDxzuxqJ+njTa+59MBJKg==
X-Received: by 2002:a05:6358:1a8a:b0:129:bddf:7960 with SMTP id gm10-20020a0563581a8a00b00129bddf7960mr4783450rwb.16.1686603930823;
        Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:30 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:11 -0700
Message-Id: <20230612210423.18611-23-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
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

