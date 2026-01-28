Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB95360752;
	Wed, 28 Jan 2026 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608633; cv=none; b=HnUwkBCNhdau8VFlDnkPJBbVhFnrb4/6UpBY24ReJQ5HXKOiOxyytQzOsGHDpKbzSmtWkiRlrYCz0Gr9u+Fa6CwF0LC6zNRXgF6CXDpdL7Vi63eikQrtKa97BYXkYcLpMOdjv/IR9zOTP2UxePjGcXwclHhky7EIpYP1btHZBAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608633; c=relaxed/simple;
	bh=hHQLWMhahxCY/meKke54BXwjoj9QXEZAW+ce8KhMydU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzSTxIUBpft46GzKRXuH1AX9HoHwG4P4aIp+tuvjBM9gB4dLDgKq0CzWTDe/pVq655cNfrly5FEAA1IpZpEqYveMRUbCyikU8e9uMnQWtfpDsMEgOm0IyIVogDdhPJNx4rC9OAfKY8KvuuWspbaTw6ved5Q9y73HqmFf4lbDxus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTZQ6R98; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTZQ6R98"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8F9C4CEF7;
	Wed, 28 Jan 2026 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608632;
	bh=hHQLWMhahxCY/meKke54BXwjoj9QXEZAW+ce8KhMydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cTZQ6R983vdQ23cB680GoXRU6UtfvRZtA5nJ91sXhdrW2W07PXFBFkMNGrbDSGwQh
	 7FPOdS4mWFiijQTd5baeR/XRUZZHE2b86en9jJejM/AsJVuTsswcIfh+a8XMN/pYzt
	 aua6hs79qeX8tbDWq8U+kIDtCkE7JL26HpWnpa6hdB2h2znOQgtOIV3a71P9C14JfR
	 CtV4U0UeyULoxG6svBRDnv5PfU4rnKCh22hvtOkXzLHv+2IaH9THWgT4ThQQdXpBeF
	 4TYkCvAyoFD5vp1Y5Wp7EZfkpXRIOs3Fu9p7N4BrUPuIwov910Ddz7GpkZnTtI5R67
	 NdQ9QQNGQ2GQQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4D1C8F40068;
	Wed, 28 Jan 2026 08:57:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 28 Jan 2026 08:57:11 -0500
X-ME-Sender: <xms:txV6aVRQZB4KG2aHpYfJYJZOXXC1PLooJs_GaKWCkx5U9eVU7GuktA>
    <xme:txV6aX-1AkaQZPx4bmd-EZWZ97Chz7YcWia9gZQMX_-Xcv9_dmDVRFg9qha0N88aq
    139xyLybL-eWMOs3KUp6mZVGh_TxJmo8SN85KepyDzCfBuXcRaZu3M>
X-ME-Received: <xmr:txV6aU9C-a4GNq3QgjgIL0c3RPvS0WtekJ0mUxni5vZMDwkuSc5QEXzkZ6QPbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:txV6ad6Iq1E8Z3yOgvdgcQGabzVFq4WqGZTzNUYrbGvZNX6_lbnc9g>
    <xmx:txV6aaekY3jMEFwcYD1bdHuxRNRqyhmgT2rKY65aOFebDcEf-mypIA>
    <xmx:txV6ad2omuBPGobjaAntywEg1ficwRHQ4I72jGRwB9V1RFxWQ_b2VQ>
    <xmx:txV6ae_bsROEWyoLL4qunHwLOYp_FSpOe3wiCl-sTtJ-Nq-yh0qifg>
    <xmx:txV6ae0-r54FlGDx1kyuxUrT0kia0bwlzouGrOGwzXDZ4CHA9S9hsovv>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:57:09 -0500 (EST)
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
Subject: [PATCHv5 15/17] mm: Remove the branch from compound_head()
Date: Wed, 28 Jan 2026 13:54:56 +0000
Message-ID: <20260128135500.22121-16-kas@kernel.org>
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

The compound_head() function is a hot path. For example, the zap path
calls it for every leaf page table entry.

Rewrite the helper function in a branchless manner to eliminate the risk
of CPU branch misprediction.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/page-flags.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1aaa604f4b9b..16384cb6f962 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -224,25 +224,32 @@ static __always_inline bool compound_info_has_mask(void)
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
+	unsigned long mask;
+
+	if (!compound_info_has_mask()) {
+		/* Bit 0 encodes PageTail() */
+		if (info & 1)
+			return info - 1;
 
-	/* Bit 0 encodes PageTail() */
-	if (!(info & 1))
 		return (unsigned long)page;
-
-	/*
-	 * If compound_info_has_mask() is false, the rest of compound_info is
-	 * the pointer to the head page.
-	 */
-	if (!compound_info_has_mask())
-		return info - 1;
+	}
 
 	/*
 	 * If compoun_info_has_mask() is true the rest of the info encodes
 	 * the mask that converts the address of the tail page to the head page.
 	 *
 	 * No need to clear bit 0 in the mask as 'page' always has it clear.
+	 *
+	 * Let's do it in a branchless manner.
 	 */
-	return (unsigned long)page & info;
+
+	/* Non-tail: -1UL, Tail: 0 */
+	mask = (info & 1) - 1;
+
+	/* Non-tail: -1UL, Tail: info */
+	mask |= info;
+
+	return (unsigned long)page & mask;
 }
 
 #define compound_head(page)	((typeof(page))_compound_head(page))
-- 
2.51.2

