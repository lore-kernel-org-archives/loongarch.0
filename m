Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99F1F172
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:33 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56d047c92a8so25739897b3.2
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603933; x=1689195933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=LyMVzyXqiqaKfQOftnbB5qB90EtUnrbgPE+tRRy8u809McOQMdRt58iULBOhR8JFtH
         hhRJmphgmRUDnbyyXP2Q9YxbwzAkn3ThfcILkwgMQG3ISbn98a07kPZmsAVC8Vehd4Mo
         1biR1LFmmxLwxk8sGkOJv0esnaOWjdr489RSbTn71+xsATggGjgO9UBlAUeAeLB5A5f/
         kGoRSfqAHa+jn1LV08UE8edOQfnKwbxOGGV8ICxkOoxOLTvOaFWF2RtvL1e5xr2jqLU0
         QA04uFGbeM6zqpolABbfncapro6b5DTja8wzwTkJfjoIbnkhTJwsqQTX3z92z2Org5Ii
         BY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603933; x=1689195933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrYSGf3rZcM0SKncNLanyoUH1rFlxcI1YjdtaAHWOM=;
        b=Q09pbKQlFQT0beX7ISHPtX40+cblYPNb2Yzad8pp767r6KYzC9iSD4ANHVntV9LLas
         Q3nee5Qhmh8hKPuUxH949ZYf/WX9pe+fEYHRVqNIBRMaV6Pr9ChJNYshJRq8DH5dN+Jj
         sXSI+AwMAkN7sal00tJ8R5bz2JaD2txaR6d9FzQcKFZp45z0/v0Mot1k+u+SDoD5XWfk
         hZs2tQrCkZNBfYlz8S7SQJpxZcd2hsx3HHe9g/yt0o9/4kc7hgt2v01q7zXP56q7gE6n
         UdZn0xTm/mlfDI31g4bJSCJdc8gKAOGCjZH5AzvGl0zT+Axt8Gl+IQIqVLYzhSbQjW8g
         dV1g==
X-Gm-Message-State: AC+VfDyVV8MtmYUkbvaQnEn3X4EmeCBE8+oPFiQsxJAkm2XMT0AsqXdH
	7rPYzeTzAjzo0w/mN8eWcGo=
X-Google-Smtp-Source: ACHHUZ7fItlbNlNZv8dpxyHqv1w2q3utm4HiSoRDwiOPIqWB+aVpZeSy3j3Rf4mLiiGsI+aWaI88yQ==
X-Received: by 2002:a81:8942:0:b0:56d:1f8d:b480 with SMTP id z63-20020a818942000000b0056d1f8db480mr4434878ywf.25.1686603932812;
        Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:32 -0700 (PDT)
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
Subject: [PATCH v4 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:12 -0700
Message-Id: <20230612210423.18611-24-vishal.moola@gmail.com>
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
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

