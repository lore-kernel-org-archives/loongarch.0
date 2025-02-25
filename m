Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED41A2393
	for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 03:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455231; cv=none; b=uuT7/Mu7pTGFQjndVKXiq/poH0s6MUX960je7EoYK+t69ZH1mmZlomrYDqz5mMAepUrV4s8WhPwekzhdlSkWYvliubzzWuINCNrKWU830irGswrMIevglOBriXRYj3Hg6Q4Ogx4yhOnEkOZO1d/5yFl1TiCvRu+zn+YRJ2lbdFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455231; c=relaxed/simple;
	bh=uEIt0iOIE1wq+fFnae14pvBZV4BJtIqtLEBiBKsbnt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=od/lOGjk0s/7DXI60hOb83AEQrESB/YvGhXCS+vbiXmLed7X3DfLvzmFgaHGr6aEmJ6ZGIFbcP1s1CLa+wsKMgAoKr8MCVRrkAzFYIndBBDL5DSLk6Zgdet9dL+TrWhIb8jmksQRM0Jo4hC+mtY+Xhkbn5lj2iUwTe6saYwuIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HPlgDG5V; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HPlgDG5V"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fcff77ff9bso5571004a91.0
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 19:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455228; x=1741060028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=HPlgDG5VLC8CfSlTIu0VWpTzpOgWQT8Fu65nDTx0JlMJZ1r2BJ3QODrbtH1NcltoEM
         Bmh4uctXqpEk61hg6OnCz7aAgfo7t3ptPxHXQtgSv6v0GUOwOtWUJyrChL3gGpQ9EMxl
         EfDYrX9H7Qj1hgSNjcJz59bMeeF7DKD/3ObzGkudceS6lMSk9lvpuMvuGUDzGHpv4GSx
         CZWym3xXqLR58j8f+ezjXDfcYVj+Y8LpoYYY2IcqwHqyrgyvLH6udPkBMMmdJi4ZXUZP
         Jr86EbpV1QV0SGwEsgRqQCXb5t90R/Dig//Qoj+gmDUa3r+MKAPmOhYENDuCDvdeJvPF
         vrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455228; x=1741060028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36KztU5HqI7wNxhzV6WNrh7mWCrhUr2tDKJnWGxYavY=;
        b=c8FoYL2G2psGJ9UHu2tH94l+19SeYHykxmlxM5mi6aWUcVKMC+CTOSUZbFrQOqHz6S
         F+EgGepEsJpzuaaTCZ0sOzDgCZwZtqR8866bPl/5WnYeSeCeWyE1NNR3TCoSJi5LtKn8
         toR5HOgk3BnEOhX0EsAMBYDlkpvEXLGHTvkrtz3ubg0+XSINPppYyZI1eNeHCYMuZ1K0
         Jc2WltX5b0c4yfyT2Dued3x6v1VBMVuaiKSLNz3ULY2rAIc0QfBe54IxxccpvwjaxwiV
         FGLhijw83VuhBRiZ4eWMl4vfkH7P5WSPY3yMAiNrfbuGOS5xdeSkg4wklfTvUmhUCdIq
         IScQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz7Vu2uipKKgPLAP/oPLniXMRIrlsRid8kyEn6xSbPvkTFTApxRu+LrwUyhCHqdPfkCwtYsPYdBe8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1KcmmWEYTbwIEC101IsFPL3/gnSbfGFNljIPFnNTbMbExVOHC
	Sc6eBYFprWkHukduVgiw9ePmX/Y/OYnkkm4iyQmbNT4Jj0eWqub/z7fNor3miww=
X-Gm-Gg: ASbGncszYFNqM92KSGKk62DOVZufUtsFDhS1TbSebSC8yWlugbyaZqcc1xdS4lLH3GR
	QK8jKsMBbLx/7B3VEF4pbLco6r1Rbq66qBTU4bjztFHZHwmsY1ndB0M15TVj05+JtSSncGTkUKU
	Yn/ALk/dQZ4Kw4gQpKjjH66TunBQQwTfDmpO+2qgZAJ5oObjc/CHezrjgVbH7HCI/vwVywsrn08
	9zGvz/KFKEOavLzE0SWSNDFxhORa/R3UfO7qGrDvVEOuBhspq6SYqUpSFPthTXtbiUM6z+zAIv7
	oAmpOaHL3jNfqkUY2U4l36Yb9AXILTTMK8IAIfsD+eNJnpKxUbPLeQnw1A96abY/9g==
X-Google-Smtp-Source: AGHT+IHErQlNtWAOdWTcDw4ZwAn3kttLeu4q3Mf0dru9ScBNUcUevexLBEyVDaZ2sKSBMgz3Y5FwbQ==
X-Received: by 2002:a05:6a21:7a44:b0:1ee:cb9c:9dc9 with SMTP id adf61e73a8af0-1f0fc89a091mr2965600637.35.1740455228677;
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:08 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 5/6] x86: pgtable: convert to use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:55 +0800
Message-Id: <36ad56b7e06fa4b17fb23c4fc650e8e0d72bb3cd.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x86 has already been converted to use struct ptdesc, so convert it to
use tlb_remove_ptdesc() instead of tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/mm/pgtable.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index b1c1f72c1fd1b..f28ddac0f734a 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -45,7 +45,7 @@ early_param("userpte", setup_userpte);
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	paravirt_release_pte(page_to_pfn(pte));
-	tlb_remove_table(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -59,21 +59,21 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	tlb_remove_table(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(pud));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	tlb_remove_table(tlb, virt_to_ptdesc(p4d));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1

