Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDC926CE33;
	Mon,  2 Feb 2026 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047854; cv=none; b=pudRTG+BHqRLFWKkUDNn/nPAMyAm/uXNyxPT6h5CiVBD3BkGA2ysUN3+vzkZ7bwc0iLpB0+CeqNOvBF71pM4TKlKO/2KVrJoppifuRuQX5yrNgaI3ysbwc0NUzpWDq5K2+HIotsVf9eI7V1rMzluqu/tsdOaKoQeh/Z4q/E9j60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047854; c=relaxed/simple;
	bh=gSmvqtqPx9nfy8Fha/oZ+Wj5/HcAhp/Bj63bLn9BVgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxG7vxe+PoMyeUNcs/Sq2RI0Z4XaH70U3NdTlAETOaPY6ICU2aW936rgUpQjOZtKZ840USzLRIUddn9pCCZXbB9tNfE3Cx+UxZ2fD8BiZG00e4BMELoy4NaE7CXoFH/1mkzQlvlGJLnX+X6vF3cAZoKo4puvmUopHYEAdmlHuEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izIKUzYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izIKUzYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90BAC4AF0B;
	Mon,  2 Feb 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047854;
	bh=gSmvqtqPx9nfy8Fha/oZ+Wj5/HcAhp/Bj63bLn9BVgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=izIKUzYLZJXR2WeI7uakNi4F82v5uaw2wWsdekl5LIQe0+3irnuxFOcYsokeANFo9
	 BPGBTFZMJSJvMo9l2pb8k1Abi7RceVpX9l47L3Z+bNiLmqU/Xye7n8Ca6JIexgKrIr
	 XRL8CXHQFDOoiGGbVKi9t6KRSFv/nBd/6Lb5PRcyy7YO/T5oP0T1ciz1HZj/sd+uZj
	 dKZjkR8DkNj8JhEKW0CcR6taomqmuLh05966fvdr1/j8OWPYUY1Q90isGr2/XR7C3R
	 F+qiKwajZNl6SI1IReH43XujW3Ap8dcdNlEqscYmvyuMCvgxdCHt8wvSk+qUbWGEi/
	 oHv4gcHyg2S9A==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id CEB09F40069;
	Mon,  2 Feb 2026 10:57:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 02 Feb 2026 10:57:32 -0500
X-ME-Sender: <xms:bMmAaSCzcV5HuR7RJqpanDvjJDdNlFkuvC94IELMOTza9EKqNR1nFg>
    <xme:bMmAaVsOiY6uEI5blRsby8H2_uZCVHiouoW2HGLLXwZnQljYs9d30uBBB5wRKAqf2
    iQfgQpu_YvmiZinco7_EGakCrzBA9U0KBVRdYiEwDxJ-M0ZzjBwJcs>
X-ME-Received: <xmr:bMmAafu_0vbGRSJSn8kPuLq1vkF2ltv2YTvHV6V7PZrvaOec4UCCuhP6CSCQEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:bMmAaRqTvlKVGJza3f8bEETEcQLhAkukYXxBppzgmGFAd86GXAyhWA>
    <xmx:bMmAaTPoAIB0vrAQLwY5_OjpT2zjbCkRyT1kdRJZ60qw1SnxmZ_Emw>
    <xmx:bMmAaXkzUBbNOvaDtlQfdJVWpos31RDXba8S-nesVoJyPQEwkakqug>
    <xmx:bMmAaVsIVhxfdkZFBh5YITP170M0Lxfh_rPnpeQ4XzAhcu74dCyr8w>
    <xmx:bMmAaekwD2iLHzTQDSNSC9gfE4-g0rjO0kM1JEZhdAY3GGOLZBodlnru>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:31 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
Date: Mon,  2 Feb 2026 15:56:22 +0000
Message-ID: <20260202155634.650837-7-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_NR_PAGES.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..f9416acb9156 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
 #endif
 
-#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
+#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_NR_PAGES * sizeof(struct page))
+#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
 #define VMEMMAP_END	((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
 
 #define KFENCE_AREA_START	(VMEMMAP_END + 1)
-- 
2.51.2

