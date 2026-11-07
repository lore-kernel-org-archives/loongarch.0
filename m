Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025944;
	b=Oa2s3IB6AqtKqVwTJTi0RDsNEE5K6RkBxiltLXo2Q6wu31VTDWdAG4tY/dqjqCIX68Yl
	 Nth/RMXFaQwj+GA3QFcsFxUAq9B5CkdGvEaqLqsJA8rJCPqeUgde7v3YGAJskDjCiRozO
	 kkN6r48C0hkJS2S0pQgIiof6BoD82S2aeZ1AEOzXRF16JWkXFg13xS9Ns4i+8qGFwlVda
	 SK7RtAy6ppqPdE+YGdPOCByr7KvpsEA9TSo4yFK2j7HG3qfFjcwHopGWdn4h82eM0Vb+B
	 0krlLaVf4xUdU9mb/FYlpD2Jklv0pxf9u1YBSt0IROvBxB5xYlKKFOZbNk5isDcgZjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
	b=EvpIRyLC3HuVQq4TpApWS8+CqlOyZp0NfKw9ZoFR5dCk3nfR9rtQL/xYp5maFC0ub9Kr
	 CYImF6oZ1Q//TLGfOpFg14bl3qaohgtAHg+5y5g5AB8+0r1wAQRSzhdtwhY5I6+xrVI/L
	 s2BgoR9dImHS9nqMQBsTSO/bLVKxVM8+6z3HdnYTa/TXGa+/X6n46+S4DGWBIvPSHG8Fu
	 wRbcmM4KoyZXYs19YaPdeNg9jASSmePlwYCgcz9hFTAh3DC9Oq6aPAfRFbRfJ0Rmck7Ym
	 LHNfKcWQLHq4XPqlGjK/0e6khyifsQhr+qCLz5lIF1tSiOAJj0UADyDJpnGSNB93hAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j4KQxKV9;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8027B606A331
	for <loongarch@lists.linux.dev>; Sat,  7 Nov 2026 04:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8027B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=j4KQxKV9
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso841684a12.3
        for <loongarch@lists.linux.dev>; Fri, 06 Nov 2026 20:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025943; x=1794630743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=j4KQxKV9RNl8QVTOGkpsPDutXGwkawO5JcqHb8lqx1A75Dl6vYJThR0MvKTRIumcKJ
         EJs3ddI0WVta/WLv0d10HGA64jTNu2Q4QQxA9jXwfYn4yQEE0eNWCbP1uUoH0jdFMGgy
         n3yj16u5tjW//S/yCVND+gM/0U8G0VNYS6Fz1MdD9Xo1SeJoA5yAxYHi6PY8h5+W6/T9
         KYCh5reR+QSrDRCsm+83i9UMtuq2XHfqrMQfi4yir2Eq0z3m7/adAPQa5OUrL4ZpKq20
         DRwimoDCRroqktuqrV6EEQs9hibnS2mK7U3ngIwWkDnWO6Okm2VXQp88CqWNJCmQr57i
         /zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025943; x=1794630743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=oa35cyDbrcTVgQWTI8P+mvXAa5sTBfLHcqYPrA0kw8AF8ykn8OFgepfq/aNVtjqEmn
         KOAYNH3g8fgHZ0Pgyyc/OaT6DddVmazMyf1ndNNGGa78bi0Le22GVhcKB+VlCkCdpWKh
         5Bg38X88tZN5bl+tHQcLBHBVgxoel6hv0rF/GaWvMWDrqs9o7fK1Vli7oXhOYHlvd9+1
         4LivR9sDgyZqRZjyeMRg57mORPYvIBNHdMyXJgoWFMY+JKGZol/iLt8wgE6qcXNdrBKJ
         MrpmwbVbyyqqnfuqPgdfNnoUWJ0+4iGIZbnTutDqr1F5fQ9GaA6iFUidT9LtC+uu0+rl
         MoPw==
X-Forwarded-Encrypted: i=1; AL+hErHoAstsKu0qhlCsDANwy3oa8R3EXDg1Or3FGmPFvoSXiVe7CqB5vYBa/2yNRvlSE/j2M3OIYSI7Alw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+KyfYvHlw+DETRtKJVgQX1Kc2m08NM25r1tVR4Cc+Gib4zXkhd
	Y80gzh5PIcjq5Shp5qXS2CWXJBbsvHGJb9uoLktk+eHhgyhIt2gS7Lg/umlnsykuTfM=
X-Gm-Gg: AYBFou1QkmptQuusJfMtrMZHkA7kILQ9FHGPvUKeShfD+BdvFuD+7L7OND1gcRNyx/v
	ulkvhAKhxN2ebxkYL84BwvoZ9ZHYU7TCAvl2OGSlNmoK79/5JmeRAppryzxNf9CVsNltM+u2Q3J
	zu4ylAw33Cgewd9/GVoHpRI8DUUuMSijpj9NnKhAi+FTRVhmMhDoWhCTAw5aUHRveTxZMJaikip
	+51P+TabSLt8i9ckuMHp+AgoZrcwYqBj0c8zIFzdGwT9lVY9nuDj6jG6pHVl7jzlEKSJzRmU6bz
	bw46YLT3GxNS9b9tLrmrjBxy4J2s4MTVfW3eXIbtP40gSzXoi7pqXTNXqKZsAX67GA8gqmBrfTv
	kjzf/Rfk1m844cvE1lHwUu5YmMkWPSJOprK1inAXChtZYCGfJT0VWhRb+pdgb1hIY1dO+Rn7CON
	un2BHOippUA8bf295dDdVlPsS/s4+EJ4EgJLMkEy8U4F9ETczcHIhsxCHNBp1+rZDj1yRWxQ215
	iQ//IbFdUD/V9AFQOhXEez6Lv/nul59P8MV4Xpgu6wTwoL9Q3SzrwnsvF2vONofVA+J8VSnNmT7
	YEo99kTxGrD20GBX+L1o+dWoCzHtR58vGSFSYXUu0oue3AFhhSlxJ/dT1xhJ
X-Received: by 2002:a17:90b:5608:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b0db605906mr4825186a91.9.1794025942667;
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Sat,  7 Nov 2026 12:31:20 +0800
Message-ID: <20261107043122.25650-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
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

LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
empty, so it cannot tear down optimized Device DAX mappings.

A later change removes the generic Device DAX architecture gate and lets
vmemmap_populate() decide whether a section can use optimization. Clear the
section compound order in the LoongArch path so Device DAX keeps using
unoptimized mappings.

This does not affect HugeTLB HVO: LoongArch does not support gigantic
pages, so HugeTLB does not use section-based vmemmap optimization there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch using section_vmemmap_optimization_disable() to keep Device
  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
---
 arch/loongarch/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f801f7097f03..ea769e479241 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/memremap.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/mman.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
+	section_vmemmap_optimization_disable(start, end);
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
-- 
2.54.0

