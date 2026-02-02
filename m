Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509C836CE08
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047926; cv=none; b=bwMsbRfB7q/wdl6a17ntCXpN7+vKNO1Ws8auGhMaD9BTwlAPVX45e9RnL6mwxP4Qxkz0/H2hoDwICSHwoeSp9yAserTClWgk7Z4Fmf0HUasn79IIOR/2ewF5GnB0xvmURrdT5GXK2FKlaNKdnynRkSXsXYjS8e3DvyNYT5qzDN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047926; c=relaxed/simple;
	bh=hHQLWMhahxCY/meKke54BXwjoj9QXEZAW+ce8KhMydU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr+XPBembo4MudN/m5rQSb3k7wXDpLIsr6wJoWGwyFWcsXA8dvzuCcgjNhYzx3Mf1IDKJvqFdXQh6FDjv6lh6uM0GIZlU/lvohFcGqlR7nrGEuVpBBqfCzPW5vHNUrAGfJlVZlicWZzL86FUjA8lCbfv9Y/JJUwZbb4tdSn+Exc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENafFWTK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENafFWTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E885C19425;
	Mon,  2 Feb 2026 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047925;
	bh=hHQLWMhahxCY/meKke54BXwjoj9QXEZAW+ce8KhMydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENafFWTKJrbQqnV2VDvdoxkMl8FgcSSNW4aI3Cvub+S8COIhFCL/xMwClSAk4g0/V
	 mwW9MJu7DPPLym80fXqWmDIIm1HD8ZbCe9bpyliWCGKiJG1snx3D0tMVJdWS1S4Mlc
	 daXRW2AgYFJh6hL3RgQgosfH7gI852pQPBm2YhJApY3C/+ABJ0tw9P8izRje+v+5Fp
	 JGguv1GoteQ/9qpjF3o+tFhwwmfQ0FcRAUa2+u0BUecRxtIYIZl1NVx3dSnOtl7pjR
	 Czx4A83zrUcsA66ZsfE6td9heui0F43l+/NXKoT0P8RNOkZtERLpGr4M5GkvGjLHXL
	 seBC6OdyjBipg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 66437F40069;
	Mon,  2 Feb 2026 10:58:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Feb 2026 10:58:44 -0500
X-ME-Sender: <xms:tMmAaT6K18Wvd0HKkaGoE4t1MKUHqKOWniKK8Slh0t0mZVSEigY1Ig>
    <xme:tMmAaSGa0mdtPyBuNth8XS5WbywiUOE954wqqOjbFveO6Fvoi-08_rQSoxGYwJk5m
    vKnhF9tlwM6cJ2z845M71_O3s263TMrXnhJeSLceZxT7LlvFqK04mB5>
X-ME-Received: <xmr:tMmAaUknPx1N-S0kFLlVg1ElOKs4Zx8dgAQ7u5mGO9mT7KqaIEdJD84TMHSW6Q>
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
X-ME-Proxy: <xmx:tMmAaVCjnvOi37sjHrH5c2YoK5qniyc88D6-zATSoj-K260C6NAz1A>
    <xmx:tMmAaTFTwBN4w2sY2x9XHsmuLbNm77XhH562heWrOazwBYQNMv7o5w>
    <xmx:tMmAaZ_1GN-puOj1MakR2gQ_GcZ8roej8ffqPxtHQcjAswIwy94giw>
    <xmx:tMmAaYnWRueQ_UyYgaOP70c45ePncAFrZZlTzvg6i4J6oDGNdMrunA>
    <xmx:tMmAaX9OPCBnH-pK8V3B8suUm7HtyXnXY7qSHuhx3EvW4oizJzdXFCOm>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:58:42 -0500 (EST)
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
Subject: [PATCHv6 15/17] mm: Remove the branch from compound_head()
Date: Mon,  2 Feb 2026 15:56:31 +0000
Message-ID: <20260202155634.650837-16-kas@kernel.org>
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

