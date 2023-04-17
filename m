Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340EA94D
	for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 20:53:30 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id z11-20020a17090abd8b00b0024721c47ceaso14042380pjr.3
        for <loongarch@lists.linux.dev>; Mon, 17 Apr 2023 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764810; x=1684356810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=RTJID0Q/WW7iedj/afuCWToOfH/aBrY/NrWNeyN7ByP/usee9y9Bzy2eV2Pryddh5k
         SgN8rXjbYlFESamvA2kpEGUYeNDAEQAcb5DBJGBzqZ39H1PUjeRb3TeWmdsscSkj+duB
         XdhsoeufQBiAlQ1VDbbJWcUzg1wdK3pe72OAkzLWRjQ1C0S075Nqq87qXF8IdfaSlDxW
         +Bud3Bjv7jwgjZOfa7R1sSZhrnf0y6c/vZkSvJ9Qym0uRrXk7trecdbr2o902twf3Tei
         jaw/7g2aCCpoNC5Ttid57NGpw+n0jzjqhu5TM+KCbKbeUljRTtHuGZwGu624c+XnB9eN
         r1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764810; x=1684356810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=GF/h9oxpKPzpXfYin8sWXXgrLyKW9b2BFUE7u8UYxOPNyH1DuNaVoT0LOvGyAkCgju
         lTHkkAAXNYxXn/TOYu6zx8QQ8bN0pf/AgdhJaCCQywZnYP7kwS9uZ4ChMZQquC+x65Hm
         SjE0jbl8AY+NKGVsLG/k134jhZfDfT/H3yRxdo+p7zjVORRNxEAFoWAL67dLp6nwO5k/
         dWHaV+4sio4nRiP5aaU7dbnklYRjaFdOatzW6T7zFhajsGcl5EcT7yqexLT+3tnvbqRN
         pAT9EkASnS//fweDRlyoNv+9GXXZ/AHM00WEAjcKg7IEGZ5PhN5ebPZKybrs9yyiOy4s
         ac8Q==
X-Gm-Message-State: AAQBX9e8NEQyXUAYtJt6oOVAutlqNNVW9gDJagCWiHbZCSE2ydvLHRgh
	3ySzEgwlEFOEZ393ihy6lcg=
X-Google-Smtp-Source: AKy350Ygryz7WWGm7uHh1637qBCeDzWZK5X9wTShPkAHp+hvTpFfVrAPSXU4dDYY+IJtVCH6njxkhg==
X-Received: by 2002:a17:90a:4144:b0:240:973d:b436 with SMTP id m4-20020a17090a414400b00240973db436mr14169767pjg.49.1681764809815;
        Mon, 17 Apr 2023 13:53:29 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:29 -0700 (PDT)
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
Subject: [PATCH 32/33] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:47 -0700
Message-Id: <20230417205048.15870-33-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..760b029505c1 100644
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
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
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
+	ptdesc_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.39.2

