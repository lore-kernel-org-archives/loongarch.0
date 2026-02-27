Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815C44D012
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 19:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220639; cv=none; b=Z2LJKmAEQ3UX1Kv0oCZxRQwZVZpA19d1omK2IJqNkuP2Ni6dIwkV/N4hxn8Jfho7qv3x2Et3JSSxAP0LdkXL7E207+qbO6xKQtxFYC5OtXnbJrNBHe/boIQvUxv1Of2veahmXXRuQeXi4yiH/AaE9Sf8t5edK01P6TNpXUYqcx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220639; c=relaxed/simple;
	bh=SAMYtAvGiq2l3siqpeP/HjyvgvsrRuVBB1mTlVx3THc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIRx11pcExG02RDoe186jil5yeR4NmMikyVs702p9ILH+7qm/7QctYdpdaKoOhy8+4gf6HQYjMldzluRWo5epEdDNORmiCJIk0ZJONh6e/luDxOcO9mUvp1d1DN7Ndw1C36qfCdZOkhgcXVN3Xxx1oI5CAZj310bJWBZNu6CD6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWDP316C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWDP316C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92024C19421;
	Fri, 27 Feb 2026 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220639;
	bh=SAMYtAvGiq2l3siqpeP/HjyvgvsrRuVBB1mTlVx3THc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWDP316CPXO/9KAo9G7kURhF/pb29KNRJqRv8kTvTBt2Tl4DndSNbq9CE353SQqBe
	 qjj0CgyDip/VSl54DMadgZWcssiRU4eqq+zl9IJ5aio0+LdulkcBjD50ccwUmDqvls
	 5tuE+AgufRKl/SKuLK1vw/FL+3J8DK20ouR8M94LWPr84oYBt4iKjFXwb/gisHKzUP
	 OufxPIzp6dbtnLH2Arbp08gAMNCq05IhNL/dIeNnqR6bkpSyfabhojPV/NPtn/GzPH
	 3pBsaioH9QColcMTxWerbO1L95Wgvpt+XtRqx+wCGVkmBpyEodALkvLgFUtWFFbZJo
	 xdMIA3aOdDrJA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BB486F40069;
	Fri, 27 Feb 2026 14:30:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 14:30:37 -0500
X-ME-Sender: <xms:3fChaeeAYh5ldia37PihNJNfMiM9NY0qA0Fr6FK-ZcKj7-TA8f1kBg>
    <xme:3fChaYVMvAQ8t2MVlwt3813GmSgNxj1fyW1LaE_-UDDCW5HmruVRX5F3u2XjWQgRQ
    VYLfCt36np3GNaKW4s-PHLSK7w6e6spcwHyLYSWRcXtMFwAh59ZVrM>
X-ME-Received: <xmr:3fChadVwXgyK1HzO-2YHtR1f2V_003DgvaXs_pkT9CWATUUA7XMOhkFjk4z0fQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
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
X-ME-Proxy: <xmx:3fChaQOo5msdLx59Njr8X0fwQwrTfIbPuLtbF2_65bor02BE4vH9Zg>
    <xmx:3fChaY7pBQO7Drmc07c2ajWUVo8tPYWipnWSxdK9pVloShiwuZfhGQ>
    <xmx:3fChaRr5x7tyCHNLDbtVprfiVREklkdNl6C6N75inS96bdmqPojFYw>
    <xmx:3fChaWCSXLHqExDyY9g8OsMX0joMlZuDlIHJil5VS2pczidaluTw9Q>
    <xmx:3fChaXeU_9l5z0yc_1u_8rY6NoJL6I-ZXMD9eOh4Inq4-XpMuQp6CajA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:37 -0500 (EST)
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
	"David Hildenbrand (arm)" <david@kernel.org>
Subject: [PATCHv7 04/18] mm: Move set/clear_compound_head() next to compound_head()
Date: Fri, 27 Feb 2026 19:30:05 +0000
Message-ID: <20260227193030.272078-4-kas@kernel.org>
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

Move set_compound_head() and clear_compound_head() to be adjacent to the
compound_head() function in page-flags.h.

These functions encode and decode the same compound_info field, so
keeping them together makes it easier to verify their logic is
consistent, especially when the encoding changes.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (arm) <david@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page-flags.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 70c4e43f2d9a..42bf8ed02a29 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -290,6 +290,17 @@ static __always_inline unsigned long _compound_head(const struct page *page)
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
 
+static __always_inline void set_compound_head(struct page *tail,
+		const struct page *head, unsigned int order)
+{
+	WRITE_ONCE(tail->compound_info, (unsigned long)head + 1);
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
@@ -865,17 +876,6 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *tail,
-		const struct page *head, unsigned int order)
-{
-	WRITE_ONCE(tail->compound_info, (unsigned long)head + 1);
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

