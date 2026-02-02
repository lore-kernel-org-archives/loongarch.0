Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C17F26CE33
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047840; cv=none; b=DVvYuNV4ZgMzryH3reW4HNdudWLGnl0An6IRuJ3HlD82SsH0FqkLgn+j5Gf2kJrkn+4A0/5nCFyIw7BqIfLNZvns4NiRk/xja9BjBah3LzYdLZM6zXIIi8o216T9TH+becd+IoCHdLiUBQT5/0Vt+6t7Z+G2yxz4E+c0cTGtfh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047840; c=relaxed/simple;
	bh=IBF8LKGHv8lxiBFV8UfHPvSAlGIc6Qys2WBMHwwJVg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ueI2OB0Qbw31lsuUdber/1yXC71CWt/sztp7DzmLcm7vVt/hYuLumZtjV680oGoemN8H+ZNm80L/Gx1+EYGv/qG2ulm98TUfX1Nm4o7CYmir//a6qCA/BFFWzCKONUjQSuc2Q+HHU0v6AWE7lvx5E6Eo7P2h/803s1K2o4mpqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uz5tNLTg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uz5tNLTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B28C4AF09;
	Mon,  2 Feb 2026 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047840;
	bh=IBF8LKGHv8lxiBFV8UfHPvSAlGIc6Qys2WBMHwwJVg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uz5tNLTgTVAvqd1WVnF6NR5OtPTnAHFnBwE7A2vIJwz6tPUh8EaIJbKWj6i1rkKAi
	 B2eG7fBhM/2fMnemzjuuTrC2TPdCnDkebVVofIi8u8myppnYLOGj4x+H8W9K76EbPW
	 zI9gdR7Jb7W351NIi7dXA4bWamxHCk6pGnZJ3yNrfckiqLs+SefglFGEohgHsLMZF8
	 mWS9Wr5N3NVm3tPcWAdxXMRSD91fWz/4kvEQHqxCNhofDyznh0E9jXxVHSmN/eTcTH
	 WZu9voVWjU90YGOPuR7xbI9xrTlPZRxwXubxkoWHvlIzeHlN/khCYANHPdzYjJE4Cc
	 O7i+QYStvsf+Q==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A677F40069;
	Mon,  2 Feb 2026 10:57:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 02 Feb 2026 10:57:18 -0500
X-ME-Sender: <xms:XsmAaZ8N7sRBFacFfLWK13Ue8N6iCEOIUyBKkoBm6B2qEy29XeyjOw>
    <xme:XsmAaW6w3XnKVDwrmP53pkBrzNH0kPwGD5djm1jP2l7fNlkeuljlmSeLiBvQAj-RN
    8kH9vKV4uxnghg8HFB3jlFUYqPtQks8jEFXDDwq4FCcKvaY2eork5Q>
X-ME-Received: <xmr:XsmAaRLU_Bb7pbehAr9C94xhE2TepA20ZmiTQxko2AWD3GSzOCpgqmFs7GwENw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:XsmAaeXK6Ulq9xSuV1Fe1W8lKZh40n4Vh18Lo85oJ_aa2SVlvjb54g>
    <xmx:XsmAaaILrAokZPLEJ-okksvlwcJuSj8xqBbLN0QhXKUlCSW46L9tsQ>
    <xmx:XsmAabwDWM_7ZNYuh_qbv3zxFwhpPd5c34plUfYXwu-4cyfF_I905Q>
    <xmx:XsmAaeLmiQHe6CStLnXUwh9Uqg-GtVdOxvC7Bg5bVtH0QBE9Tnc6ow>
    <xmx:XsmAaWQ6hs_dYIYE26JrtJqW2_VAoQXXbs2kAZJYabhvNwhdxfNQYcq->
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:15 -0500 (EST)
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
Subject: [PATCHv6 04/17] mm: Move set/clear_compound_head() next to compound_head()
Date: Mon,  2 Feb 2026 15:56:20 +0000
Message-ID: <20260202155634.650837-5-kas@kernel.org>
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index aa46d49e82f7..d14a17ffb55b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,18 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *page,
+					      const struct page *head,
+					      unsigned int order)
+{
+	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
+}
+
+static __always_inline void clear_compound_head(struct page *page)
+{
+	WRITE_ONCE(page->compound_info, 0);
+}
+
 /**
  * page_folio - Converts from page to folio.
  * @p: The page.
@@ -865,18 +877,6 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page,
-					      const struct page *head,
-					      unsigned int order)
-{
-	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
-}
-
-static __always_inline void clear_compound_head(struct page *page)
-{
-	WRITE_ONCE(page->compound_info, 0);
-}
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline void ClearPageCompound(struct page *page)
 {
-- 
2.51.2

