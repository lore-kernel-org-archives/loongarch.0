Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369320;
	b=ZMVyoq5drj1o3Dq36cPZI81ZIzkKkV+nVQj9ipNu+SumZTpvigztwoUJRhYJWcc5Eqes
	 BlKQIXpxWragKu9+h+sQS1k1irF4SSr8gc+jnMxOQ9gwvqxljWa12Mi0A6V5PwKDdrvSd
	 xU2cl0c8XqIX512bS9Ajrpktqpyla1jUHPY8TBvb1URiAnUcGz9XmTwbFfsy5M8tz/ZaG
	 rI2RTlUH56t9P07yCJaw91s2eLS6pIpTM0Secrst2HHox9Q356pzLHV0BkYaaLvn3anV+
	 Nf0AmmuF/gzPtQzp7XdJomfWImTA7nz7ObPZNmjdPGm32+eCdGNcyj9M73d1NFy0HcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
	b=V0Bwhx+/hbalx8RmWnJqOsH5+lBVw62yyp2R1zk98WsLsXPpL2BAjvIsAd9RWqxTi54j
	 1c11mB9S9n+qIddEFu2KVvunyFx9aI1xLStsDHtZL2xbLg+bqsQVdPGfw9Cw06tDf2IJQ
	 o0M8QICuh3biWnloXYqAdjbNNrGBFIXtiGEkSlHNRiW0Y10NlC0z0LDW329kT7gOYav5x
	 N8k4uAdehFM7iXleEGpFVuExLc6izj+J/L8xSuuCUhvy+IS1fimahfwryq+fb88KFXyQ3
	 Ed80/Y7YfDgHXyJzA6VJzfBE+RHZA3Oau90z95ubHMwZXU9eCfWliIdlXfyzoNJxpMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BOZlza5m;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C8606A31A
	for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 14:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D47C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BOZlza5m
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea7987517aso5617645ad.0
        for <loongarch@lists.linux.dev>; Fri, 30 Oct 2026 07:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369319; x=1793974119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=BOZlza5m4Jsuv9Z31Uedw+YPDKvIBjZYnsqtn6GzZNRjskUs3+ogefXqzgtuFfTfdC
         2M7PCEDInTV49Fq9fPcUu3NW3eXELK8BsjUzyDTjub/lEoAC75fh2X5Z0y0AdTVzyU1/
         PkVsDu/piZFOXXIbAMrx2Ykd6desRsBNJLYKXYp+LIRSrna8iwxaSun4zCjqWKYdjQTi
         UNpHkXVmvv7g4zwpqXTW+eV/Mu02DTPOzq2mGl9tzO+7B46ACiVnw1Qf0ASBwbX0RXAp
         H46Q+oG4qQIkRb5/gPV5EHW0AqdSY6dwr9IvY1uFLQiAbd4hP2woQmDmaC5io3GaJvjJ
         YWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369319; x=1793974119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=14lzHlAhtsgAEIVApS2sLscw8u+VIEsgJeiYFUx8BoBQMrxCLVgWq5z/uVkKSotXo7
         fGRRMuRO3WbxCIHZ+XgjaB3v8BeIAaISrRZbs7iLcmTVl/9+qD1W1PPfPvIpEVk380Do
         q3eL5HKh1MeWXmRzyDPyqBrCltiv7ilRBpLEmaQ8XxHXhWrk7HhSCj7BX0ced9Dm5Vcw
         Ps4NyffwAFh292f+pwDna7oWmupfgkGuBJjzNvqI4D8UtlLUZdKUHHf8zym1bVTOiVdK
         ZWUxyXdADRum3pgg2hRF3iojS3YgqB/6vH7FJG8AYK/t7kLqMD7IvHWqfx/HBFkZGbT+
         WzGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSlzQkKMoGQjDmmDWwSMz4okIOV5YO/BYNTCglF5Don3uKzPhrIMx1nW5qLy071DvSkyvR4uHEsAY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwe+rYyrIL79+MY4tPXDnm0dsoV0ol0tXw4PDP17PpaYKXDTrB
	1JYzr0TvNzcRZqjNyZy1vux86Iu8XUWjREDeeOaJdzWZKhXgme6JKkIYGDGvrNX5eIU=
X-Gm-Gg: AYBFou1+FjGxlSWMetc2KdGUcswFo0r+1R/YaNF9kOmXvBUg0Ojor+UmG0kZQh1UdVa
	rdO4Ml7qe/xSaJ+P8WM8fM6/EelouDh+cnks3WNFb4/pIaHNjyrhNfG4EQ2XN5jRBz5jlBaPOKR
	ZG6SuXWd+eLe4HKKbS7IR59TwrYHLdusbWGCsDBNiK3mNRC8LyIBZOIgIXd6KkiKGIZA95c0JLO
	ivqPafRFvie3E7ElOq8QT4KOT65Sitp/BEanEYl02hFHd7V8xzBjxjqcgOGNWxiXlK+kTXARzBo
	b6/s+noWNXY/IQTnXsP4hTMYUmgQd7qPZLvNorExmUVP9QYofgmnzyW0RCiWAxLHIMGbJXz2w75
	8LywIHkueOur2p45Yjak3cUJFcQijxiiqGgfcawMj5sCG1Sp+EXFaIGwvKxgj59FYlw7N7Pp9zI
	S4KoKUQ7yJli/DdZaokTMIminoIsTEB342yb/ZF0qyswMXUX452PtzZ68bzIRB+k/JINORd77qB
	RQ5Ml90VzdRCNXjgSCafvCb/jXBsP2WhjZuNoxmBspYqI2/eT3O4UM30GCR6b82JA6uHbvOU9Tx
	dtGOJnU2s31IPqMHSxQJcj+9tIXCiidK4YhKbZbe0koGWzTn/ec=
X-Received: by 2002:a17:902:e5c1:b0:2d6:e9f3:9305 with SMTP id d9443c01a7336-2eb36414ef0mr26789535ad.5.1793369315295;
        Fri, 30 Oct 2026 07:08:35 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:34 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/4] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Fri, 30 Oct 2026 22:07:17 +0800
Message-ID: <20261030140720.1256062-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0

