Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053821A256E
	for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549897; cv=none; b=RpU20EvcxBtG7KGUN+W+xbvterRVCEtVL0WJio9ARkTRPsy1B3AI56hNtXLIrWFjcxr+hrePEo8LADNEHnUdts5jvq1Y7kAXsXQYgCEcOPqlf5qo6+5UnIGJ27DWRZi5u6cCjejgoM6MnscNm3LfINISfQTONe2EuGfnmwOhJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549897; c=relaxed/simple;
	bh=AOHzYz3e0W68bypaywk5PqwWiTbsh7X+wa84FHfFzTo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8382/qePinJs2nEtikd9mmcTpfbcR/z/6SvC/1v4yj5dR0OFZb4qPSxCWIWq+rblYHVFxcTrdnIV2KkpYcYOtjW4v4hNKXUbhVpaTUMjZOjsLInST6ZegykN+sConWECZB5Cs1kuaRFF27gt6R42GIjm7tzS1M/U3ULu1PpRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LZRm27xV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LZRm27xV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216728b1836so101133305ad.0
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=LZRm27xVPC8Nh6RBgqfYBjThx+h8Mo7JuFUG7FT3I7knfadQP2i45+3nND1xbbOY/2
         Vzl2D+FXgVSodb8m648oXdRnOukK4woNpbp9H6qbO2LOQCtTpIA57QKZ+8MByt8DKoG+
         cvKcQiSrlX1mzFvF/Sdz7umhBH4i1d/5Al4xl7iBrqr+H2F6tzyKJARc5Ob0wHnOFagq
         BdYVq2EdecchI8cBUGI0oJKtAhoOiiuApBeac3ZbgztY5stA7gp9Z4lqfzfTjz0fuC5O
         QXgdgk4n1fxaBHcIqZGLXut7CnEUKFQc7sLDB1Fz5i62rZhb2gnRum8uXlBe3Ja87QpC
         SNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=mnZwFqzuabbKA2X/a+F1Nw8CUtf5i+NALXBCq6CGjGLSu1Lm3FTnbiqqKcn2VwMYb/
         /shxKdmiT19BctyhYz7j5E+lXjmCQ3fqNCnmuN6gRVGkWfw+EBCYm5vOnZNHtsT6k5qV
         9tJZP+eEZQ1okLCQwcTcpv/627sNlpl0pQ6kmAfGrCn2PBVMlr3TLF7s7Jfiavs0pihZ
         Tpn+gGWlm/sgitwBQGsM/M06CVdO33SKy7PSXXUFLxBcy07Rmc4uznul0ZUsjP0iMGaJ
         J8IHxfj3t82qL816MexfwSOTT5TaxVrYLO/4L+Ya0zjp//tCvlPV1KFp3qG4LVPrH/Mr
         bVsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/cqOyIUaDl7YKWuoNsZIExBP1y05G+owYFintyofgXUa5B0cIxn1WDBYo6Jm/AyNuTjlr32+SWAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjS1pO8ySg08LfrvzzEufiRpOMk/J+MO6OnSXT9FR/pzXEmIFY
	fly6PJXplzNGInLYHmESJpbUA/P/1YG4ZsqhVVRrPcNnYhEHNAwyh81qPd0tnt8=
X-Gm-Gg: ASbGncuF6KScw3wKlJZHpoN56LYvN9T31K0vao7UoeuN8Nm5woCp+eoFkv5J5AuXmdB
	/t9TfMFlivRDnaS/5+AlWaD2OYZggAIpBqWyx4GFRtWveViyhBQ/tt3v+22FdfXQgPn1z32HNv3
	8lwZTW40/QCWzchiVljuKc6jSfbhfC6KtMSugtodq4drbwAKgu+Rweux0RDyVsX2cuvUmO5w9h8
	JoxD5UXHXPEfjf5coon9cE1gerkWpqvrCzpTshb706rSfFFOFi/ez6xZF8LTFCq4aR4Jz9OrjX9
	aajjvWGr+zRAvdpJvBhFag==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
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
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
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

