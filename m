Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774B2108D
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 21:05:54 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b2993c9652so2993136a34.1
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603953; x=1689195953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=Tn4mHghr2z50QboRcFFwBXnQDC7dmOVTmd7q6odwa9ofCDQNfilhaBNviFDHX8SrYA
         fagx19tWV5xnG2unDu30AzBD8hFIWArocnuzCUa1K7AMS5VYUgKKhDVTLptGD0WPUw8/
         ZX9JliY6gx8+hXM3OztwRe71m1A+kx2eLC7qxtJVOpdoP5HVloTMtr0/abQT4yyYQOzs
         IVhZgoGgAdf28rfS5OorktySibfeqB5FLW0b+HoIsUsy+Q3Hv3TNg2zjbv2EGrbvSAhn
         +UJqDlCblQUHBUCUqLriRDZ3qurN8WXPOHGnwhy4vkGIt3E2YX1KhqR56pPwBtbb673W
         dPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603953; x=1689195953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=aRhMX+uacM857Zum+5icdD+cxFtWLS7Ot5hbxeGwfVG/7Ne1VbjtzH81WyuNiFEpiq
         q8rJVXRqK0Zwq3R2YLTZXS2fmDDDG7LBbS3hQR7F74+U3mxSFj2g4webo2ZfjIzsOYde
         JDELfU8DsPy7GFJe1uKNIldLAwKACci8wED2VjpR0YObhM6KsL38ifJ4K9lW08UDCidh
         lwddh79uvSTXdT62gxNUjMm0KSlMZMHd3oFYP/7BEJ4LZIFFCWDWU9OVAIkVq3xOXRE+
         lhmWbXjpoMOXtiI0cMldhQ5NUrLaaQmGxnCooH0Y0JtDmLHdWsFnp45MUCgelZ81hCQH
         wM1Q==
X-Gm-Message-State: AC+VfDxcWzadZUanx0SmVvG93XBmy4enPef3440WFfMXqXYxfIGlVdeG
	2H9WGeUKIbzKd4z2k/i6F/g=
X-Google-Smtp-Source: ACHHUZ4ThTH5LM1afe2PTTFtQ0ZfGkzFFO1FbLLwGaoZUh9UZKP9YYPXqsENj3drsF2z7+M8WUTgQg==
X-Received: by 2002:a05:6870:2207:b0:19f:5701:8c47 with SMTP id i7-20020a056870220700b0019f57018c47mr6429537oaf.9.1686603953383;
        Mon, 12 Jun 2023 14:05:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:53 -0700 (PDT)
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
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:22 -0700
Message-Id: <20230612210423.18611-34-vishal.moola@gmail.com>
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
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1

