Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACB20FAA6
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638951; cv=none; b=c88bZa8mHiP5/x393oCt/cyr1z7CmRjTNI1wZ+Sr9glHPZBfcxzn0M5fqC06IK4FUUMHRY1WMHKfZcl0WLoUq/6NVA/S+isaASQnvgJieSSHWwzdgP67zdZGrnlqH71mRDosAVDWHU9F/LLK3qyygyvzDnYaWHkCvgr+6vAWhyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638951; c=relaxed/simple;
	bh=xyoxab241Xbf++2pkWevGXAMdg+Lltm4zD7nrlxitWM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwLnWibbngrIMFNJyaVUecXKEWWym9YGTu91JVfpM4eiDA4n5t4FOyegcFIMPZlIdmdB1tP0xqbeWWBs9XghTc+Eo9EJHLUJl7uvu1QpNxpq6hfgqI+z4OTS6Ds3qJiC65hWEk2cL6AlUVLoRLabvOlFaoyGNqgKdU66X4FKWTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zfy6TxlO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zfy6TxlO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso15088055ad.3
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638948; x=1738243748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=Zfy6TxlOXh0RfVlUYufrdX0WZCLkO2r2A5xVPqzZwL2pXYuo86MRcTBZY+Cms+r6eX
         Gfuny6UGN9nzhPJBq0Gxl1YHE6LeWIvAfC92qal945IgGzE0X4maYmgLc/ga6Qa8fQgZ
         pNM+qaVoYFeRDMxdJkeF+hYB2ymUYiHwiT/LY6wOof189WmIwLxlFDmv3PSadxQPkwAF
         suQ/W+J3VYCHYwc6KFmDwuDrXZ+QfPtddCpiBOE+tQLPjFaMYET2LzjttipJqPZJJ8vd
         5QobtKrH1ekcn8y9WBrVRx+SzYUSfCaTRJadS7s7/C8Wpw4G8dgDuwDEKZUagKFHLfha
         Qv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638948; x=1738243748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C94XB4BAC98f0nzKDfhip6ZZIJjZtAIgTVlkxB/zEY=;
        b=aJd6bfPAe5PJ7GlhDOcC0RGM9yXyY7uHQUAz5Ru7ZGSLgZextrebZt45T3uDa38Dsk
         ifd6tzmOVQuXdBseuFBnzFLlZo6HjOsl40csinwo3Ek2mjkpfZiJdBWMV+lITy4J9ElR
         fi28SIkqDUZfVUCEKaWkudW4zCd6ZzW0q4fFw+8WwVORwsljfuUk5P/1WzlNmeEPhNRa
         KZBBEQYvCoM9aEDCmdL18cd2OtHm4OZVwA+7J4r5SWtQhcAe9ZebeN+WUrVyQBfrPGd1
         DGyw9Ax85wxfMD18V26L/OI7By9qH+M4SbcBkJTO7879KuYPs9qK0VVNisxB1JAAGALn
         MKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgG2FFl0QiJs8VYOALULcpY/1NGIV8Ll9GjQt3wiuZeRBjZg1bDDfB4hzls+b4JgfmjfI0f+G+c+E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy7GI6+uGt4LljsjtpczHHdOCvpjmMEV+dijzl9GZVUKBz8jxw
	I2VvRGCHEnLsBxwh6RhSnidKN2CBNursaJn08dXWmVWW8Yd9sQezpPhbPCLZSAE=
X-Gm-Gg: ASbGncuSZCyQRTWr1Cizbq/p5ySjICvoBJP5smPJ+FCnIClY0O1r+YPzqg18hpsjXcw
	SfnnUK+Hmwxwg3HnEY+sp7hrRRYMo68U5knOPj2Mr/Pr2px9wWX2GHS9mXgHEKGJyJXBE6vi8M7
	/1eMH1xDIqdOm/FdhFLPfBH6gasm/KzKx/xPx2RPOo8FZ6kwRbVqSA40P5VYzxUZhJUWEPVtwcJ
	0sozFbzZWTxNR+NHo52lM7Y0PGvF2Ay4F7UiSkHGCamvvGrMfWkrmDnsiz/twClGOs+fN4D60WB
	GO21U6DLj8LtNY33FY0qg5E2+x9lZK8MuAonS7zqgWaA
X-Google-Smtp-Source: AGHT+IFkSdO3UtmG5jKkAJtanqQZSHufZoNoVtMFPHl42HZUz79kP6iB5Pw4LWGczfrtYHtt4kZUXA==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr376126085ad.4.1737638948337;
        Thu, 23 Jan 2025 05:29:08 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:29:07 -0800 (PST)
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
Subject: [PATCH 5/5] mm: pgtable: remove tlb_remove_page_ptdesc()
Date: Thu, 23 Jan 2025 21:26:18 +0800
Message-Id: <62d6a04c3a0e70efd435cc2c8a4d9d07d94e7ece.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
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
index 10cdbe0e7adfe..dec030cb12108 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -509,12 +509,6 @@ static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
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

