Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3E36309B
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 08:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303743; cv=none; b=X/ZoZWp3tJrxjcsPO4HIL5hx7zxQROWWVWQnOQtD8EOzJ3osoealgSQ79Ki7EDAkmUspzwo2N2N1BlXOhpdEmQA36vNaFnD/PwZgyuKVuNruaUCD+qqJ2Pf5NMZl5XWp+Yrg6xarAZYRQjjbZMdQoPORfHqwoP+0DAOtmD6vE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303743; c=relaxed/simple;
	bh=QgZxJDmxK15glKgdwvuQXKx4II7jp/jciswRkVewa3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGWi5YYWZq3E72AJ0QatCkdUvqUW2N4wwwESSYjt9TIjZjm38yElknJTuS7dwrLhEpppclX/iYS471FbHk5L+/lqnAGbnbzIadod/1RDf1InIK3LBVarZtw6COrCFfsTTpoQQcqv3QUXoVJK2SUc3PZs3/LVsdiCYlA8HRKsLmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dyzOPTpz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dyzOPTpz"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84236f9b638so484957b3a.2
        for <loongarch@lists.linux.dev>; Mon, 01 Jun 2026 01:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303741; x=1780908541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=dyzOPTpz9K6JLeFN81rac5bCHVFTGPoIgVxY1QV3mxv4lnP0Jtp0pG4GeP5YYPF007
         NKQMbvJQoxdHGHicHC0T8j8RU3tpNfvWslHOxkfAO4oTsQFzc3RvEMzU5QSvcK5P8wND
         ouhTGftF/4hbawprLAox7VbtZDK1KU5TTTtHDD33FVNZkza4hDmZL5mckEXI/bL8HvdS
         2DSZ+n6H/sFT9hZhMsiHbSk7S1nI278eyejtiG9PcxVjOx2nB3KlFZaxjk1q9TI0ULj3
         Ad2XPWFsjDn4n127jqUsxHUlMOVf4VDACvQTsnp5/fNjL5QdKftMLELHH7j2vK+fj+Cb
         zerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303741; x=1780908541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iZQN+oxehRhbRDFp2Djf7RG6EvHlnyDB08mWf0NvrQ=;
        b=HNB1D+5ud+GRhJe09yd7N2eVF2V8uBudlVmPeA3sEfi8tvjG+ApqkzocEtGoK87DZY
         B8VWF1aGD67YQljFTypc2jMm6WLekFHJ8Lnt4nij5Vy73CM9Oqa47yy3HJ/IOlygxrPi
         vRX4uFKNdvBRuu9YRBF19dosBtGGmrgL/W1m1KxJhSerTEW5gPdpYmRYe+5vnLN2OH37
         y5ohtEqiVukGWkD3Bw4TuLqX9Vav1TCJKhzIQX+HONS2Qz4I9YwZJXjue/Tp+5KJxlsg
         eRQ8QrYS0xyxYvPqK26B8gMDU0/TeesdRgToR+cAnkIQ3ZGf4X7mEzjYRj3pdPfGa3hm
         OXzg==
X-Forwarded-Encrypted: i=1; AFNElJ9n03VZ1PdgCo9phudPz4Nr88YD7WpnLi+hpidgz1uL23s3cBl4RVGedNlUn5FgcDAzcFpDbjtu6uc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB1m0cQjIPhEn88kljn9c4qXffr+G5EXZwWtGzkRiRQsdT9Msf
	xOSHGgQh8QFNyosa+X43ZkxFi3pgYE2XOJJuLcwctoNuU1dZHurdrjbc6jh2i33vFHg=
X-Gm-Gg: Acq92OHzE1UH9fO/acc7hLTy354fjveL3xXSheoEYFPVfwp/c8gJ67kwcbvlZMKJrnW
	lZC+4Gz8EeLrH+Nns9YILVO9MnkdpsBlB/NmU26FU2rD28Mkw/6KHygxfrIWbmOCVt7dxubegO3
	NgiReCRb3Gob/rAs9ZgQlUgvH4yXJN4d6PEn4ybHvbL4M/0RCHvU+dCFO4pfLMRECv1Gi6WEtS9
	Pgc5KlfKvFTWgiSUK1yNA/HUJhDlnvMwWtuptIpguilr+drr5+OGgva8DYsJJ48Q8pfI+BMWY3/
	rfsn3Y+rcrAoZ2krov8wm4I59lwr77JZ/Mg5vTyfchTU2QfBVBpArwZeuWORtRmr/gGaAvma9tK
	A/f4y4dYfnVWOlElUGDQ7Ug5gXiocyX8m9x2Ezq49x34+VALIpAzPpfrBbEf+a1lqAVfc2VlU4f
	WIbFhQGJ/lrsNtOrfbHID/yhst1xYt7a/dD6sKKlcZSFJeDJlcQzqkvQ==
X-Received: by 2002:aa7:9a86:0:b0:83c:928:6e5a with SMTP id d2e1a72fcca58-84225376b00mr9579300b3a.13.1780303741104;
        Mon, 01 Jun 2026 01:49:01 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:00 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 1/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:40 +0800
Message-ID: <20260601084845.3792171-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two weak functions are currently no-ops on every architecture,
forcing each platform that needs them to duplicate the same handful
of lines.  Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2->v3:
- Replace BUG_ON() with WARN_ON_ONCE() in vmemmap_set_pmd()
---
 mm/sparse-vmemmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 112ccf9c71ca..99e2be39671b 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -386,12 +386,17 @@ int __meminit vmemmap_populate_hvo(unsigned long addr, unsigned long end,
 void __weak __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 				      unsigned long addr, unsigned long next)
 {
+	WARN_ON_ONCE(!pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL));
 }
 
 int __weak __meminit vmemmap_check_pmd(pmd_t *pmd, int node,
 				       unsigned long addr, unsigned long next)
 {
-	return 0;
+	if (!pmd_leaf(pmdp_get(pmd)))
+		return 0;
+	vmemmap_verify((pte_t *)pmd, node, addr, next);
+
+	return 1;
 }
 
 int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
-- 
2.54.0

