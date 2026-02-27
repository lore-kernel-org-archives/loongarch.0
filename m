Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2BA44D682;
	Fri, 27 Feb 2026 19:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220663; cv=none; b=cbQhNbP1DW+AS9Ca9SxH4zZs6tVZ7DmFZFHxH0pabNgzx4somZzOhqfddiV6FRDLqsNLhLI1PwAJrUvnJ0vz1K2av/2dUaTzhknV5TiqDeLGEyVT+WGB+oEndsxV5fuLApOKU3PMOlP6cFmv+G+XkAIWh5k5wLbQd4Y2tDTGxFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220663; c=relaxed/simple;
	bh=ZAx3R9GqRsOU9srbTUp+FvCts3Vk9aVQHLhkmRYHaUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZjmrMlzvD7iYl6UUhE+2BsKVnW5g3BYpWcLDz9pGWeSFkDUi95sqpt2wSRiJ7WXC1zbK2K4FOnfTM1MSFPnIeJ9mahiW3f4Qhpb+Su7z6x2Ebg/EcWTIJbqRHAndqV5V1rfv393nM7pLCut2yqiNp/8s5S0bBa00tGi1ouqCJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/CVW6HM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/CVW6HM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D26C2BCB0;
	Fri, 27 Feb 2026 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220663;
	bh=ZAx3R9GqRsOU9srbTUp+FvCts3Vk9aVQHLhkmRYHaUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/CVW6HMplEXh/CaKI4txvDVOAX/dF+GHRWQIbfic3meSWwB6asFDUf4lf3R7q+XT
	 8Epw+rY13eRtWHl5sQOD0wNHx0VPUCAx+4bPf5R2eWl+6AARabe5hsYeRQsXP+WnNX
	 0U1adi3sup8r7ZAS4Lr0k0nfTT+PcQlHaTRN4+cozz3y2fVzt5108kWP9jl3MOk3ZQ
	 GwxmvY+On+dPeSfroEuElzANWtZeaeeItAcT02fgNnMnIKFr+Oo+c0iJG77KQu9j0+
	 RgCkXudzqrx0xhCFJ6b55s9q8wqZ3127e/4BTogyRQ7JWIZYFVKfEYbCWHiIO9kbO4
	 CCoUIiGA7VLCg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 56CACF40069;
	Fri, 27 Feb 2026 14:31:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 27 Feb 2026 14:31:01 -0500
X-ME-Sender: <xms:9fChaQhVopWkZjWOMOQnBwWhehF6ytvntKXg-pIdJqoDWT-pNYu4Dw>
    <xme:9fChaZJE60_pYl5aLKKlUfNdFNcHlYVfCZu9rSif9V15khcd0KSvR6-yGWTIi-jwt
    OTljHoeiCv_Y0IZAVIUxlFgATzwioUQOLTRM16dJIS2iiOUAnszVXE>
X-ME-Received: <xmr:9fChaV68NTTscTord4Ow0WZvfiFxhEH-dmDSKAdaTTsr4D4C5uP6zD8dw8I0pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvledpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:9fChaVjnukCmVwfcvm5KjVi5U0Uayf3jdsyZnupzXdvTC4iPmh-Bww>
    <xmx:9fChab8-p2o6Xa2pyFQZtKG1t3xjUAU8NCmJOR0tmXaa7j6WnaxtOA>
    <xmx:9fChafdEL9XjLjNzFe8DZCvfR0sCqgyWf74Vj0-sj2_6RUKX52COoQ>
    <xmx:9fChaXltPObyp-Dtr57gwPqeWx8QYYxQHbDegrKRA9-JcnYtnkW9Ow>
    <xmx:9fChaRxUNCXbgsg-vF0gmO1UBY5xKW38xAsslC0DhFwnqJQDU12rA4CU>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:31:00 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
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
	Kiryl Shutsemau <kas@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: [PATCHv7 18/18] mm/slab: Use compound_head() in page_slab()
Date: Fri, 27 Feb 2026 19:30:19 +0000
Message-ID: <20260227193030.272078-18-kas@kernel.org>
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

From: Kiryl Shutsemau <kas@kernel.org>

page_slab() contained an open-coded implementation of compound_head().

Replace the duplicated code with a direct call to compound_head().

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slab.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 1a1b3758df05..7d3b929019ae 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -131,19 +131,7 @@ static_assert(IS_ALIGNED(offsetof(struct slab, freelist), sizeof(struct freelist
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

