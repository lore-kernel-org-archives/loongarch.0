Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F667A94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id x8-20020a17090a6b4800b002474c5d3367so9751807pjl.2
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764807; x=1684356807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=fsz9HBXpyixYv0zGEIQNfLPb4EjMqtI/28pihon+vRduZpglxs4kGo7QlnsgzbeVep
         MUefXrtmBIPAEKph1/xE0Hixz+XFSj9eLb4OXqcCPGwVWZta2b+6OV8DcUNUc3MYWho8
         foQqBfLzT6QF4GBhL/zISw/ZQfIxqSnZu2sd2q6CE2U54ygVclXX08i47edCNHvoHxB+
         sBBNY+ovhIlsXyYoYKNVSm2boGQ3Di1szM5293gnTSGOnWYTxtAAUVimXGr6dZV0Zyrz
         TtkMrcCltGZOVK2SbO9vEj4TQWwRgKIU6/H0ozoMQVL6Kfmq0ZrnJgq0p7Ga0/De5Qi0
         sDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764807; x=1684356807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIsUNYOwSPNxjYFxvF4LgB4Ah8JH2T7Nmtlw8Cz+gsw=;
        b=iXK37EILn8B3OyVLieCcNvijtkn1JpJf59VU6jN6jtZ7k6/4b2gVmpK9gkn4cf0ma+
         bEz+KqU+OQ35BmeW4p+dB1C7VoEy11oYEJv6yS0+fHlgp6SnL5BFCaRoiFIX3tGRUWXg
         aDj8E/OH0HZEfZQBwR4YR80D4DW6ZBlNNT9XlCqORAXF3yQX2tFPiI9B09HPd3ktbo0r
         bJuK0YHuWol3K28I4u3OZb/LW73f1u3XzzRCkPK0zsBRW0/ImeoiaLX416O9oJjvRfhN
         Vn79xF/tzK9PJp+MIn8obhosGyriW6+eJVjOtL9zNigdkJmW7vQMESSQ61IkiG5llbwU
         e+Zg==
X-Gm-Message-State: AAQBX9fyIzWympslsmxwp0eNw4Ww7PTZfyaSN4cRVlhiH11lpop11m3n
	VGGQzzW+PdgA40yayldReII=
X-Google-Smtp-Source: AKy350YfnaT8KE6LOLQ9wRoeSIO99cnRXYKnv4nnzRXnI3u1QAONlMDFC8rrZFtHP4TZD3hWsCKEag==
X-Received: by 2002:a17:90a:fa3:b0:237:3dfb:9095 with SMTP id 32-20020a17090a0fa300b002373dfb9095mr16284735pjz.6.1681764806946;
        Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:26 -0700 (PDT)
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
Subject: [PATCH 30/33] sparc64: Convert various functions to use ptdescs
Date: Mon, 17 Apr 2023 13:50:45 -0700
Message-Id: <20230417205048.15870-31-vishal.moola@gmail.com>
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

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..eedb3e03b1fe 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = ptdesc_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!ptdesc_pte_ctor(ptdesc)) {
+		ptdesc_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return (pte_t *) ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	ptdesc_pte_dtor(ptdesc);
+	ptdesc_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.39.2

