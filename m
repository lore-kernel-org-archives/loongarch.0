Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4915B18BC26
	for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 03:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455241; cv=none; b=tEpq/5TxsqjxI0XL9Ekoy4jeB/yHpSiGP6UcgDUlVPKFQNYiSZLsMD3VRWf5q+M50ky9laXqq1r3EVdVxHH5G8IGKBZ5zDbyxdVnAPGB2Qq25ZMGp9/Jxz8i2hd745r+aVN2HL05BqLRBtxtLQeJkzlzdUF424dNz+DJXqIYl3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455241; c=relaxed/simple;
	bh=007QVVVFe489JDQoxvXq6IPNtqGHUmY/RQmaczrx98Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSIvU5c0o7G55WxoK11yo+roUvhyg4h0BQoEX8R6oGCoucQzB47U1p+gS1dBJ8RdKsB7C75aL9pNgyUQhnlAzaCtM8Ef6XTAVp/gH4r3fq2XaxQV7+ReGRJMkENRcl8zjc8iS9yIitvqYgiokwszAi/MdNO4UCvlMx7uEDcfccQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XmB4/iNy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XmB4/iNy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220dc3831e3so95477895ad.0
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 19:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455238; x=1741060038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=XmB4/iNyrXq3g5OiNl4rD45qrM1632YrhtP5nfgqB5RjxgEm3QmDKGjecs6Q7HinNP
         G4vNOHst2Y5JkKPg121wnZdtYPRRhhvMl4al5CNU03pTQOJ9QXWol+WhW2fS57iV5CKR
         xGpM40KCfWPzOskDwDQlVsDWbuZ8xJWCGXHE56uYxCd77eJMkgULaBG071cmTCj2pIiP
         g1iuaWGo35ZIBTLMeW9gZZwMNhVTlTU9ZIGE0Fi5AS30P1uGrlN/UoPa1J8zGCRbDZjf
         cdvs265DpC88yWKyxbT5sZo3kbaee4YJtCuLWfRs/nrzouvbTVnOO3Oy/mAKg8W0Ubag
         HqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455238; x=1741060038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+AOLMBHyoEBsAHQDRMLfrp+DU3rIi9C1hjH+u4umGY=;
        b=HyRFAXgAb4xEEhWqbr+s91h5NCapn31IwSo1oBCoHmbxZu31SS+HPv5/Fx3/EQ25pm
         WAbUI243zaF2Ai7Zx24iDZfTDyhtgMJ607ByfR4/82LkFiLXe+WcYq2+Q7SWKkzRaS/3
         +p+LJOGhoFKoFARdw+FHFXVXgy1xkMUClp4Z4h4ry7FV6a+4cEHmlpMwVuMIvJasw8bw
         KAGn+W8Vr35xiVhNy8cKbjqITSHeVsvzApFcISKtE7ZA2LSErWCcKJFb/Btf+U/YNh1s
         Iu3shsSqrrqUXHYgUdmkdqZe3SQlcFbjG+PfjjCdSaJFC6FMjxCpLQ94tB4lPrzW250M
         Fcug==
X-Forwarded-Encrypted: i=1; AJvYcCX8olYJ+kZfl7PXJRM4Jx5Ot3Ca8ZQPdV4Be0uUj9GYJMbq12rUYNNCHoAJzxmQGPoswmeGrDd3pLE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzISVnBUbtnBNY6AMy+tI3wynR6YVmkeZWZdwoyGe7I1rwvCqRS
	7IAs9bvjW9bQJwN/8CgmE+gTPNB8RRS7qb3dd/r6mOIBPsztP0bsajPhHyHHBW8=
X-Gm-Gg: ASbGncsTJC31KhRdrEZZj+eINqUfH/cb7rsYiXopjIs5TVZQTeJjD9K0so+VA/cqlDV
	Tvf3X5l8wxefpdBxM3iRTzW9xr8woO7h+Vrbb9CUmre/NeCAXmHdCAHvqRjRZLPncbG0bOkPhiJ
	rh/dAf9tGW85KMYogzH+jihaSt9uPfFNZ9dhasU3FubfoOw29LrBtZgGcYLt3CFd8XBlhu1IjbR
	si3EYpc2Pq37AOy8md0cBLexmPiY/ad2xrYty8bWfuJ4joCt0xElB+42ItxgLMjdshUDQeZ+aE5
	I4KDhRRz3MxIzKC+jQidudfGiRtE7tqfe7D4EJfHhgJIQI0R/fwYiyV/FuE5vXClWQ==
X-Google-Smtp-Source: AGHT+IHDwvQZzbKv24vEjKNvLJNI+R1iJ4OqsIlmXN9p1d6u9OWq0+ZfVfD6gOTuv6xGQ3OntwSRRg==
X-Received: by 2002:a05:6a00:6f0e:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73426c62969mr26062579b3a.5.1740455238550;
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:47:18 -0800 (PST)
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
Subject: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Tue, 25 Feb 2025 11:45:56 +0800
Message-Id: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
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

The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
table pages, and now all architectures have been converted to use it to
remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
currently has no users and should not be used for page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/asm-generic/tlb.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 18bf499ef8801..dd292c6d3ce88 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -511,12 +511,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
 	tlb_remove_table(tlb, pt);
 }
 
-/* Like tlb_remove_ptdesc, but for page-like page directories. */
-static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
-{
-	tlb_remove_page(tlb, ptdesc_page(pt));
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
-- 
2.20.1

