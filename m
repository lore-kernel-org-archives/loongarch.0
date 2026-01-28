Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326DB35FF68;
	Wed, 28 Jan 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608584; cv=none; b=Sxab8DLGMbpW+sMVOXLP6TSCZgfHqqRVgxjuQiJEfeNaNwkylnKO1T8osnlZvjvLV1uVwqr/mSfNliB0fjfjbBmtz20d3uEiM2ABk29K+cu6P0ukwujdYenIS6M0Xc7t7WuSygMyRB4zFQi1LHp5+oDFm3PPFl0Udkd7uHVJCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608584; c=relaxed/simple;
	bh=b91kl2Y7wNS31vuKwPTA6osyXzCzrCdA/U3fWgaFpvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYBpKD8gZPTarr1Z/ehEMWQ7bVggx31PuTEWOaiVZTFXxzJMpsdCloxRkcrfJxVdNSbhuaoqV7FUbRpPr2VlpoyXgKtMNCRMAeCVSE3+S1tHCHxQDDVfC54hMosisaI8Z610tz4GhmCm1UfNHBGx6nWtG8vh8ec/bB82vLiOFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fp6j4ESW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fp6j4ESW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA28CC4CEF1;
	Wed, 28 Jan 2026 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608583;
	bh=b91kl2Y7wNS31vuKwPTA6osyXzCzrCdA/U3fWgaFpvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fp6j4ESWls0g4guXmBtJsetkvINSeuu/OyesPMPmy8o3e+WqScuTVci2ECveqONti
	 LXFyxZ8a3XF3N62st3LxSktINQc/fCHXdNRxtP9nVPOFq+uQORS1bacaG2MLO4hDJh
	 Xf11dSizLpArTYmLiaODHds2NmwSkN4CtxuL9zkLsynE/X24FExn5uLN2AmrpsEVZw
	 vTTMKnr4Xk4L3T27yjpTHOb+D2iksejzQh/xP7AUzRbmQ5Tvtl19BM+OTEMjwkTl60
	 5puOfunCE5kYKdRYE5e1oec2JMNdKRe7Ea1X9fX+wwGI2eEFs2cAyi72d1gDNBIQLm
	 Mvb7/gx4ZdEEg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0BD5EF40069;
	Wed, 28 Jan 2026 08:56:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 08:56:22 -0500
X-ME-Sender: <xms:hhV6aQJVBWYjeWHryXDJ5O2cOW1PVek3og8rYHzYpLSJ2lf2gdoy-w>
    <xme:hhV6aZUHLqTRmG7AUfDcX1BGWm5uikU7S8KP36t4kXQa5eANwa6oM0SoiHoYy008P
    NUBfWOYXZusMUsRGQI1GbTolzLXtyTBGvlgKd-HUdjvYOBAiYhH3Q>
X-ME-Received: <xmr:hhV6aa35cnPVojD9_OXPu_6GoUMYMMWLDrz8mpJJs3QZ-4In4yA9wFoh8tmEuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:hhV6aeQP5eLhTx4zu1ETQKwbDMOmhXDMX8l5FsxIgJiSwhZRGvLs_g>
    <xmx:hhV6aTWGuaoLyGuETHuIz0W1MuqRjjgVJAQoSihAGGlj5HXSHh16hw>
    <xmx:hhV6aVNGuYpQuoEwuiYPN61HNkM3MpC-TOZAADE63U6IkXveRaSIUA>
    <xmx:hhV6aS3r-oD0bU3ng8lxZnNiKzMiwhNQDyr5qgnRUdX-Re2A5zmkdQ>
    <xmx:hhV6aVNwpJsNaS6NncEgFNEDDJvYk6Q2P6s8eJV-rDt2zUwtBpTwQEKy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:56:19 -0500 (EST)
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
Subject: [PATCHv5 09/17] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Wed, 28 Jan 2026 13:54:50 +0000
Message-ID: <20260128135500.22121-10-kas@kernel.org>
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

If page->compound_info encodes a mask, it is expected that vmemmap to be
naturally aligned to the maximum folio size.

Trigger a BUG() for CONFIG_DEBUG_VM=y or WARN() otherwise.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..9c0f4015778c 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,19 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		unsigned long alignment;
+		bool aligned;
+
+		alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
+		aligned = IS_ALIGNED((unsigned long) pfn_to_page(0), alignment);
+
+		if (IS_ENABLED(CONFIG_DEBUG_VM))
+			BUG_ON(!aligned);
+		else
+			WARN_ON(!aligned);
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2

