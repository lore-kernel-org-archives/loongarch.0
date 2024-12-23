Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1ED19DFB4
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947166; cv=none; b=cmXD4A7KpY7r/CUVyQ4CfbB7+OD8pGFsrWBikDXfNHc/wPyDfkOU7gIQfd7+ggR4jWpX3hATQX4rTmgl5g35XzZ60BRSax0/GJfgOShIWAPoMcIVagvTwYLfJN7MSCGPYVTsUyFy64qjrKaQAhQ9PHILpLxGhcbR9igawDGULLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947166; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KtyUibiQfAsyBRL7YFYarVwUUiVLco/Q7b6HQhUdkHMK3vgaKWiLAmgPH5aL8hWWsWblMAk0E7Xdz5vn7A6+Wree/tbmZWjtBe7SF83b/t/f+ZtUVw/r3eajyNPLVkYcoygmlzMmqczE4YI8VD2W3a0PeUSVWkgbr4iKPJsoUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YvRjUDzL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YvRjUDzL"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725abf74334so3355330b3a.3
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947162; x=1735551962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=YvRjUDzLm2koUU2GqNfD9MaN+QdioYSvJbmpqZexQcw8c+2yMtzE/nwdBrmMf49f3B
         SESgVuPGe5tfyTbzYvFrqMh5jkI9PPSRM8IgEjx/sQzHRi6S07qIWmdhb/RDzhgZ6+ZQ
         jsgPR7Uhirbjm0UDv3TucP+wA8tI85MhbauYf5V6vWw8xm0fJVUAej1zE57P/fAIEhZ5
         eQf1qKT9tfvbXkixSi6AG3lmLrkyIPRUa5OwQNPP9fQwTe1GSuTftjNuLa8W33V18vGi
         Dk/b1xWLdZsneoE7lYzYiWz8/rnMwilQ6XmfmnjGInrW2ynhLT+9i2bnWjzGfeMurOB4
         4TSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947162; x=1735551962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=DPNGXuZW6WmjftGjeTxwCVzgxv9kEfIJdRaAh4QEu4tmHk3S0ZiBOuLDKDU3AG3yJY
         TygExhWuoG5sBgOCfhmcWgucxJMAe4TYpoNZdj/vZkm7PSfTLalRZFX+UFEWNhmZq+65
         oJmrZfjgrZItjB4Lwb0p7IUy6qsU9aD4hjSsGJLgQbfl4fJnjFDxcQqinuvy2M5dtcrs
         IXDvkfkzZIsO/Hczg+EmsCd9DJr0IitNsogPvdFc6ZbB5xrxRcxAFhBLlgN+2pW7t05r
         Voa2HE3C5LsMkc0X31sRQWJTVSHMxVwJcEdBXJQDoJqGQUxCZF1+s5XP0zw3javdXcu1
         ZAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVs4lYvXaQ/Ebo5a/gSqyJQskU+bbpTIC3gOftHh0NwB6PKTsw9VihfTf2MCLrqMZ4cpTVHHxNBtc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWYlAVZCkCSVHNNFGn0Qs4zIStIQKYu3NsfMrvuVRuLWC1deEP
	7W2QRkSm8yD2JIQutwQoSe/UlOISFu0T+59wSNbpR1RBYJxG1C/6LChAYIFqVDg=
X-Gm-Gg: ASbGncvt5CrjCxgCwKWGDDTZmvTHbhvQG2hAuu0ibzSig5l7sWXlVfzA1ycTJpHgIFz
	BP++s58QYiOOsuM+jFAZVMCpBAtIt2lOgbj14QSyY0dtOvv6fzqT9AuS34b2NJleKC+g30bIt0T
	BBntYeJIHO7eXxIZdH/n73T3Kwa3uiWK1+p5VNhTBZzx+RI0kFcN8qeH50xkz9fRk2onx6sMER4
	uzSOiTfwmon87E9v4UwRVCt77/W9a2ljuuHIFhOFDy8hfUYE3+7MGUwgJgwruunQ16XCm4ye3uZ
	ukRFyMajEMz5QsNLxI0oNQ==
X-Google-Smtp-Source: AGHT+IEiKQiNoCztX+vEmXJ78+SVJHcoRjQcReSYKDpgexw8hG6RQW+fGx0o5GN+OmUz8JwpFgmgkg==
X-Received: by 2002:a05:6a20:c88f:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1e5e07f88demr18787949637.30.1734947161832;
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:01 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 14/17] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 23 Dec 2024 17:41:00 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1

