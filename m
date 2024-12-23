Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65B1A8F6F
	for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947100; cv=none; b=DidhzpRq9XYR5gWtU/Fq3S0dlSrhUyUHCebstd+xSdtnpihXK6V4cgKN7FsAlPZqZpi5+fKo78XRXpOatWiU+hG2R3sWBZC/mOK/nLpV0Y/vos605CXAI8fSwteSjL7vF51niUF8T4QaPYx0ntfKvo8mPuZbz0eRf3uE0KcSy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947100; c=relaxed/simple;
	bh=w9Tb6kkg2Q49UGEfUZpSUyo28N/wow0+21NvTYUEzY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4n1J2Jg9HPAH7v1thKXXRBuEMKsjfQdpGxgi/azZOjVVX0fbfR2KyMpLf8npA/e9Pg3tiBn7Iv/EKgTAfU2FP9HpdGsAmo9WcJoRNvSTRdKPQU9BubcNJ0ghyRk8W4TM7MpVt3TiaZ8EnbPR7qSoWDhT6zT3bu2blT78AQBKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DBqmpICN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DBqmpICN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-728eccf836bso3361982b3a.1
        for <loongarch@lists.linux.dev>; Mon, 23 Dec 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947098; x=1735551898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=DBqmpICNVEzp5mVIIC7J41hjkc2/iXyaOxVHmdMcLBixle6iFVNnp2S47D3AIE5mDa
         Iz7VS6WzoMD0Ih/+NJTgNrPucBFaZUgsAxRzAg+s5rRrQzVcreifhx9PFIxgM+Y9oC+h
         +kwVM/hak4AS/7Nbnv+W2FEvw5O8+kPvKE3Pzlh6PNDcd/Ult2WXULOziCW3xabMkfgO
         YDOHPOfUXQTbTOxWYwZGSLEjnhfczHq/iEp2pxAx4Qj3ZZjCFDP1XHovWRZNpkGNmWKp
         nUL1rup1oMAYyBniWBwE2Wv6kgUp4EL87BTYlraXL4Ai+VfzE8NgS0NrM4P/3AGe2rH9
         AR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947098; x=1735551898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=aTdqCIZ/P/iftG1Ej4qEJ2eJ+xyeKTmhv7kU9sl2iIvCmHMmj9SM0ucF8es3Q+MjND
         E7Rsk8qTRZsYKQk/NzgSsKSTCmdX0pnoBIELuhebx3SMJ+hKMHlXnZ+u9ml927Aau5NQ
         WBCPNpGClbEgOn3JiI0AYGQSoWraS9yxfBgnofPQn/b2/zryKo2eh/+z7RMDXLA1CN3b
         5aYb8GIFD9FuGcQ9NK4sp7wzYVPou8Zii20WTjN4GI9XYhJPVLjLa9LbrP+K5Pf0Jt6F
         V+zTV8ak1PMoFM7d8klEMIHOrfSd5kDLzdeEPY9mODueumTceyLmQltbZCVDHmgwmEip
         IXAA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VfmPvJwaf9VNY0Tqea+hOFlBB1YsP6tmi4HPloaHiG9m2Gfu4uq0WTc8L2iD5GpMb4uMJ4NORpY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5NdyyYgqsiWCRwTSlvnWEU2GgR51gPkmyp8pt8kNdvMKtfmn5
	k7YaM2RkqiHIAnaIlX4OU0svxnSlJgOWdpPDLyp710p/nSMewc9Zy9WzBJs/3oY=
X-Gm-Gg: ASbGncs6pBpVCyXOR7gQ8OCtzIOfwQ43CzUUUlnnRqLzC95WN0XrLFpjlbF2n2ONn2g
	v04mDMZ2VUAZv7ZNu2UOrZqAdHhpl+F2UhRgAroh2TasKM+Zjulm2e/NHvOdq2AS8R+Bhz7QwqA
	lt5HyAJfJ18PPKQvbqN13xsHLlHHrIp/3WBrn0NXPUtG5xpjDlicMvyZwzroIOfPloyq5N45Wri
	Y7hXJjgaaQKUD9BRRRNh/duZW502SgiI3TKBgTT9uhyrEcHaqfFzGCekhQ6k6E7y28wd4xUOk1c
	IOistrSR3DmHEU7vjoiPPQ==
X-Google-Smtp-Source: AGHT+IH27a1l8kT42WYYi2KTFhW6smXjjCcrkYYj/EF7HLDGUXcMfllZ3ayHCCSFU+IsHMUxZvkRwQ==
X-Received: by 2002:a05:6a21:6f87:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e5e044b1c1mr19165305637.2.1734947098042;
        Mon, 23 Dec 2024 01:44:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:57 -0800 (PST)
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
Subject: [PATCH v3 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:55 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1734945104.git.zhengqi.arch@bytedance.com>
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1

