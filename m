Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A03EA6
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 03:16:03 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56fff21c2ebso42600577b3.3
        for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 20:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835763; x=1690427763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=pYu/np5E02v9D4l9kp2NKvJbLly/W4E/pytzpciEjQbyT6+cb3MtewkIWSZ/wCYqXd
         G1Xr/QkETq+9GbOV2yhW+2wZnwokC/KdlaanhyggpRl1yOJr09K81oiMFpOqkCSKUN1U
         FaF0VsjnMFKldVgjw5dM4Iy6YMJ/sIWl4pMPKU4lAMjDSOWrwT/y3HEK7DZHkwf96llK
         iirmdX85Js3ztXjDiHDLqtShs9EXg3guUWkHRosbVKtQGujpNsiEApphQ37yRcHluKce
         hLpePft/RQblwSLVA6U8/x8zaLVFAB0Ea9ymuNJLOKqGjd9fA49LoIOpslhGIKWxr+Yx
         skeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835763; x=1690427763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOzSOLTncjJXn0AvJQqE6PD7zrtBe8MIuyz5zw7TzDY=;
        b=bj4OYgWJzTczWj+99VUs/0Sz5GwzEOeAv5i+Pjptiswl1R3KQBzuIsP8rFSblFK4jM
         kTaxuGcxgEKxVJWfaOtkPLdF7OPeOm1Wovtjb2g3gskgE+LfyWuZkzbWjlclOGU7+Ql8
         /e0fMIkJiW0Iy++YzC7sTD6WML08MVBptLXOMeJ8pWalXLK0SPzHPAh7ZPmqDX280Wym
         PlzyqnfCP/wVTF7Tg/3GuYGVXCRl7xxz9iS5MeV69qqc+pJe9exwAXzROa8Y7NZ/7VSk
         veyjjG619CsIQx+Qhh8dWVnomoO8l74CFYEGHRX72+J6dI2KamOaxnoBGheXWxuZXV7R
         emZA==
X-Gm-Message-State: AC+VfDw1njrOzMLXWh0pEndIc63jiLciNbHgYiDjXebty7roIeefq9mx
	ZXc1p159pALUE5hrg9CLfEE=
X-Google-Smtp-Source: ACHHUZ4sbsRgQIL7xgoFeCT8hAtH3rltXvvkgvi4T0uDEBiqb265+aHLns97dzgLS2JgA0bF/wvN3w==
X-Received: by 2002:a0d:ddc5:0:b0:576:8a5a:87e5 with SMTP id g188-20020a0dddc5000000b005768a5a87e5mr10382513ywe.26.1687835762791;
        Mon, 26 Jun 2023 20:16:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:02 -0700 (PDT)
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
Subject: [PATCH v6 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:24 -0700
Message-Id: <20230627031431.29653-27-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
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

