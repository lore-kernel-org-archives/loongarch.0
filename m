Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF16360746;
	Wed, 28 Jan 2026 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608649; cv=none; b=h77OqsCmTK14uFmQeMvjHq98tKtnDGbUkzwg10AJi4KvBno0Z+ZCbYkbg3Mn43Wlcn4C3+SyI9B4dlwV4NoNlGJqBQMT4W1dLGiycTGwG35XxTWnDz38hn5y1q2HptbzExf9S6rIoEx4B1SCjUMvNH4MDjgniQ6VKOfAXLCnOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608649; c=relaxed/simple;
	bh=R91tSPgHS8R3tSxlyTHy32NvxCdn2aqL9vpLNdIzhxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewKXD3G4AZjCY0M15jHdIpEvA1pIXmbuIfHL6CCjrYii27mE5naVvCDpJH0bXsPDjUVj0qCtZ8VPYZDocUeXj7DYfvMlo+B9gf28Cs1KRMTcQQ/sc0ayXZDlpZcmWEFaEk82tJrJTXzElVHBc9GwRVxwo1SJK+02EE6X9wk4uIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hA1vG5Tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hA1vG5Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B817C4AF0B;
	Wed, 28 Jan 2026 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608649;
	bh=R91tSPgHS8R3tSxlyTHy32NvxCdn2aqL9vpLNdIzhxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hA1vG5Tz6vOVAQiU0YsGs+1zGfO17BHvJRxameN2GBjn9V92QPbeegKchTpfhn1wC
	 Rf/lIoX5DrS8lm7/aAYd1+fTblvcPwJVOb7SFqsX7UQ09dLICjbFfveEGh7QQ388pN
	 iZus3O9W8W1MxsTDGmpmJCzaVtENyyLlsg9HKDZjqCYu4gboBsvGiNJUFmgdZP4C5/
	 kAqzRtLpe/PLkDqyxLZJ4UZ4+5eh9Uh2z6qvS/ip3G11UQ3+95QNFa/4u2F6wqqfge
	 GNlwDAjZgRMyOfLRHdCjOkeMvUhhJZTaD8SbeSzDY2EEI8HRG6V3GWx9BwWEjfQI5o
	 FyMbIf3TLKELQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 52CD3F40068;
	Wed, 28 Jan 2026 08:57:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 28 Jan 2026 08:57:27 -0500
X-ME-Sender: <xms:xxV6abXja8uVpWVH8OPOn0bReKc4sZFVsrpuoX6H0zMzRmSKTuYgVQ>
    <xme:xxV6acybEbyYlxjxYdDgTfhcijwH_NNskGsGOZL6We2-zsu6mWiBLLiRK8kpcSQFo
    np91_264AOcPAJXsufw5uQUsGu0UUYO1Y01oUv6EprH6UZ3Oio7bgQ>
X-ME-Received: <xmr:xxV6aRh_NmufiJL65oK1gGKIwXbKAD3IbTDDdMqt87_Hr8eQA-ZLPutaB42evw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:xxV6aXMAp9NMowzB4AXQTB_2v0ux-svSrTKQXS7ZDjpGcos7ugSkeQ>
    <xmx:xxV6aRhtQTFsqhlRbGI08wv7MUaROZDojecGBB8QxgS9HLHZgWy-iQ>
    <xmx:xxV6afqGSp8mgCnWnp--rEgjKV2lViniL8HYVojnEP68AtsvSRaGIw>
    <xmx:xxV6aUh83S4nqs2ZuXUz5Q7CYJoc_KPMZBxJkdkIqWs3OnASe6wEtw>
    <xmx:xxV6adJ6XmKpm6pXNVnSYhSUzjUz0ZvVBtmSflrUQUwi_77g1YyGLy9E>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:57:25 -0500 (EST)
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
Subject: [PATCHv5 17/17] mm/slab: Use compound_head() in page_slab()
Date: Wed, 28 Jan 2026 13:54:58 +0000
Message-ID: <20260128135500.22121-18-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

page_slab() contained an open-coded implementation of compound_head().

Replace the duplicated code with a direct call to compound_head().

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

---

I am not sure if this open-coded version is intentional and required for
memdesc transition. Drop the patch if it is.
---
 mm/slab.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index f68c3ac8126f..970a13ac5b8e 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -137,19 +137,7 @@ static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(struct freelist
  */
 static inline struct slab *page_slab(const struct page *page)
 {
-	unsigned long info;
-
-	info = READ_ONCE(page->compound_info);
-	if (info & 1) {
-		/* See compound_head() */
-		if (compound_info_has_mask()) {
-			unsigned long p = (unsigned long)page;
-			page = (struct page *)(p & info);
-		} else {
-			page = (struct page *)(info - 1);
-		}
-	}
-
+	page = compound_head(page);
 	if (data_race(page->page_type >> 24) != PGTY_slab)
 		page = NULL;
 
-- 
2.51.2

