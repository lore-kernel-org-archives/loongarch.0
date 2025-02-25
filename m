Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BF2837B
	for <loongarch@lists.linux.dev>; Tue, 25 Feb 2025 03:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455191; cv=none; b=cM2tw8SvSRFQ/fSZNIrfMo4gR0M95PA1HgWKpL2D65J4HGaZR8qDOgrZRcV4KPf+vbF/iiGXrDzbNqTHsBFk/atHg9pxAqZQfKRmF/9HestgQlFVCxY6pEO8RL4CItQPd1iJgvAyirQ9e99f3VAkeSauF6/DaRqsFIG4fMe/2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455191; c=relaxed/simple;
	bh=+Ao5l71m8R2KBR4pKhSeuqtrK/FFUTZNCirhHcI/U+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QdVmgwMxw47F0LU0UZLjWllPCsi+X2s3Bf0REKL/x2pMC4W3fzR0B3ZSX4syV5G5atEuJPBduK9zXkIThSUmcaxvM4apYaGKMpcaUmzCb1xFHL3UX9NoAw7Cli93mTb4jwh5MKYPjZXcIPkoLQJ0SpBVbdxIFd2jnuIwAfg19dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=S2VY8nEv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="S2VY8nEv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220e989edb6so139802055ad.1
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 19:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455189; x=1741059989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=S2VY8nEv0LFLc6Hh/9r+MoOS+bflJN1/Ikj7z58CHqNF4OM+LNVtWmNyCDD1l8+E1D
         wdP7g+HvA5IqGRd2mlBmriQysJTjHuv6VYr24FqR1gJpsJqbfuX82mwMeP7Yvq0WvrUb
         4GB1BpYLaZjLJsH456u1+VnjTLfboadZ+9gHpwTdiVk/o0mrimPQQYLA6vPjNYZ5z4He
         3Er0QDuL7Q7t4NYDQmk/P5+O9IybFtljzIoAsv/lOBjF0ncr7icVsBE+7gHMcJzAmNxZ
         7qWPxUl1fWr+pQbPg8oi1sMoNuYmXYBIVA+V9In3Sf0z4kN4sguqcv37ci3edPeMPFr3
         ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455189; x=1741059989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0Ocxe5/W3x8AaSNUp1nmQA6Ns9xuyK5JD/uD9z0OJg=;
        b=H2MZiPt45AriBXBn3bIhwF8FsKY4qemKBe/8bl3BWjVos+Ll32bWFo5jdkxPu365Ar
         lm0fwQveX4DlVTUq0xFcQExXiG2vgFxwE2xZ2yNR70HHvrRfI7ea3nXypp9+g5y1hWdM
         bGcrLpn0/VzGqDgQq1xrCnbb8Ec8N5zy+/YsFz2Ygdyc8OLN1u4idrWZSvq19nJHC2O/
         1Rjj5cqz+pFH7b7ptFPUj3IVVAN6LmGYM5O31eFgwlJF7QJ2Xs+KgiymQeox321k0lg6
         7nVExctM1VUcIMTx7jMNV/Xmw/6gXHP0w68zjs9cZE6Cy1+bCpqTOEMInEH20y/AXffY
         gVPw==
X-Forwarded-Encrypted: i=1; AJvYcCVsdnVIWUrFOLZNInnRaB8CchaQYDpUV1pWNbd+ZvCk07wcPXbg5rwFuA9bJYaJ9ECGBYv3kFnYi5k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx/8xBiAsClDxxaIAoSQ8sF70J89WUSO1NH/o8XqAGuTDsEqP/
	JaykO3UQthSy32ZKXQ5YZZSjKiU3GH+w9A1G1jbJTochXiN7FXukcp0K7FYvljk=
X-Gm-Gg: ASbGnctQIc+VIo7MmLS00Ys2q+27fbBHLE7EPP6e6ZuFWREkIRIrv5xhlnd7ViKcxX8
	vTAj0ZBeOY7UPXzK9gjWAys5xic71w2aemHG8VLNPt6rx617/LED40STqBDKScCYlzfwoxLWsNS
	2qcryVlE8uemSVU+v/LTqTF+rXtZxjT1CNECrjseWJF5XCLkX4Z1cB0lVJBuyjKkgyWVo9PQD6q
	4sAfDLFuxWWjzY3XeD3Vj4BIPU+VzCmEFhaF6r/TPCOwLP3ccYz871HxGviPE32vBeS3dw23FJH
	EpS0c5owRNZrIUTkXXYe3ITyR0gO5QnUarLgIuExv8+CAlkvsIDa4ySgA1F4TAh9cg==
X-Google-Smtp-Source: AGHT+IGBfXw23ytiI6FvQDqnu6HA+6X81xKlY5Cdi/AJkyrR2YGvsG8wye6vZ+K3tNu1qHLJYKOiEg==
X-Received: by 2002:a05:6a00:22c9:b0:731:771:38f2 with SMTP id d2e1a72fcca58-734790de607mr3427312b3a.8.1740455188892;
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:28 -0800 (PST)
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
Subject: [PATCH v2 1/6] mm: pgtable: make generic tlb_remove_table() use struct ptdesc
Date: Tue, 25 Feb 2025 11:45:51 +0800
Message-Id: <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
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

Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
table parameter is actually struct ptdesc * instead of struct page *.

Since struct ptdesc still overlaps with struct page and has not been
separated from it, forcing the table parameter to struct page * will not
cause any problems at this time. But this is definitely incorrect and
needs to be fixed. So just like the generic __tlb_remove_table(), let
generic tlb_remove_table() use struct ptdesc by default when
CONFIG_MMU_GATHER_TABLE_FREE is disabled.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/asm-generic/tlb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b35b36fa7aabf..54f579750c8e5 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -232,10 +232,10 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
  */
 static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	struct page *page = (struct page *)table;
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
 
-	pagetable_dtor(page_ptdesc(page));
-	tlb_remove_page(tlb, page);
+	pagetable_dtor(ptdesc);
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
-- 
2.20.1

