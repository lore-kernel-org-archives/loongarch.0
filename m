Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB21EBA19;
	Mon,  2 Feb 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047940; cv=none; b=qC7YBqBlKsjaj9sua+/PZNe0zBADsFY9dLexc6oGcJDik4XFsip9ly0U/XcdoS3gxLb8bb5BW+8YVHWsBeF6rWSjsQu2x0KZyS3jXBpdV3qggKgcTGe+42lbAhdy1S2F/QBSL5+AabeupOAw06QwKmguoPgSzAn0LtqoCliFO/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047940; c=relaxed/simple;
	bh=R91tSPgHS8R3tSxlyTHy32NvxCdn2aqL9vpLNdIzhxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nY/M7HNTc/AfWOFZUCsLFCJCAUk4Afe6J2kO3T93C6PCgD9BT/7Xh2T93K7l5x2xpNvuxST9agNMrbDv7d0usFC+9h4agLQI6QOFnjn0N6V3nySlnpfP1BYFkIh94OxEGgG18KaoMu9EzFYyRK+TCBnRWaD09gvt9rjYAsoofr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpOydMld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpOydMld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33DCC2BC87;
	Mon,  2 Feb 2026 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047940;
	bh=R91tSPgHS8R3tSxlyTHy32NvxCdn2aqL9vpLNdIzhxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpOydMldGE3vDSIAxvLL8F4Uesmjk16CJnSt4BkLpAEbEehvSWDSw5uNDFNksUp18
	 T+Vhq/vg4cKq54yC9K+zru9IALS87gEyR4pIsdDo3a2VQb0175M+lIWA9Ociu1O6B1
	 +F+MXbDe5knkmEArn+geGEJ7lPbijY6/l0VB7BMWFsrDKhvSuKYsuPEJ/4saalpu+8
	 VxZkmCMe3tPtiK1Two5OYiK2pO1aGQJzBXfJdn3iWCGQ4WtQyRFLmA63V1767hHJbd
	 Cbcgu0rA8ITNYPIVllDHwrM+0XlhQ/jpKzGk0BC32mxa37i2ttf8kIuVroYp2CgvVo
	 rLl4FA2pL5ZlA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D8F90F40069;
	Mon,  2 Feb 2026 10:58:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:58:58 -0500
X-ME-Sender: <xms:wsmAaZ-Fkqltl_3qylb1vz37HPIPxk1JPI-ZnH3HZk5CdPtI9mP1Ng>
    <xme:wsmAaW7ItDfYu1Pl2SR_PZsIM-nfn_BcLi_AzhtWLYZQv3ImgbkOYvn-eh_C--w03
    vAUOn0PsOS3-Jqp5DW9fDiwGNkBcCUXBOvUegTvj7dBrhr_rQRlgEkD>
X-ME-Received: <xmr:wsmAaRIMIkuVYKXtGFlAfcedkVr4PgylWT0_pkHCwq3DBXmmQyey4GoZ-WIXCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:wsmAaeWiEo4nm2mdVTK69Z7O-jXyHtKv-JEBbfjE4aEPINXH4pAwCg>
    <xmx:wsmAaaIDIOIylVOh6IhDCHd5ij_mCIy1UV_CRx6XlAZxMmdC7S6xig>
    <xmx:wsmAabybiFyot6eW-nXctPYFcRv2NSZ0NvrH3f7SfknhvPLsZOpKEA>
    <xmx:wsmAaeKeyuedVcg4MeKgE4jwA6WAbW8ML2cGXY4VNJQX82XDU7r_cw>
    <xmx:wsmAaWSSZJ7up1Sfzq7D9w41W_ggM4uBIdlN14bHIZwl9Q2fOYFd0-8_>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:58:57 -0500 (EST)
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
Subject: [PATCHv6 17/17] mm/slab: Use compound_head() in page_slab()
Date: Mon,  2 Feb 2026 15:56:33 +0000
Message-ID: <20260202155634.650837-18-kas@kernel.org>
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

