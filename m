Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0DB35FF7D;
	Wed, 28 Jan 2026 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608548; cv=none; b=tA+k2zktqEbnrQW1ctasH2RMcCuwTUkFHfijD01coLJxCB3VpiMZ/avV+2ISqOdU5OVnlV7VnkCbUb9Q/SRYpb7yQJfJSE9+rrw7K+Fw8xm9nRraMIyi+JfujOWCqNlbv2MzZ4FXlnyB1EdrNpMB5Fkcbf35qJKaNuSPNM4zY20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608548; c=relaxed/simple;
	bh=4F/Szy/Cik4u0re8XChd+PvOlhHKvV3FFCqDor4py4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saoW3jEwE2eDzUwd3h6wUzgdrlhmteq/5X+Eeg2PpCLDqcT0cbfjPwhfOHQziDNrAHY3UgnmmE1tDJz1z2Bubb+AJZJIxsyTmhAfvr9PTlmd0EYL5DzykvJzAVGpKXV5cq4+YzO25BzLnZ+ZEPgamZdI6NrtDKJ1mMSG+gSU7i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOvBHJXC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOvBHJXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612D8C4CEF7;
	Wed, 28 Jan 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608548;
	bh=4F/Szy/Cik4u0re8XChd+PvOlhHKvV3FFCqDor4py4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOvBHJXCBdEVSav7bVOSuhG08QTbWvvlM9vHrnJl5ke4zZXkKPaGxt5MvEPpy4P9e
	 QwzpK/Kr4Ua8TbKh5VKpP6sNpd+gmwJta6H/0RyVW9r2xreLLJa2vZBNKoFEjX7wV8
	 XAHIfrer1Mb0YgoLxTXS1pNWz2GQJ71g9FdzlaLMhJHvlFUrAeMA1Gy6Hgaam0seB/
	 Vn0m6dnSqwAUlkJa+9tojRlgioqXIC38CDAeknvH3XFWj/eVrnEC7h28SKuxzDW/b8
	 MbV6xOrpb5b/pO6wRE3AyBTPe07b3jUbhvWgO3R3c6n3Eo5J+G/m8E97omGPUJd5ed
	 YttuFOQuKJQ/Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 86550F4006A;
	Wed, 28 Jan 2026 08:55:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 28 Jan 2026 08:55:46 -0500
X-ME-Sender: <xms:YhV6aQXYXK4PTlTlsGsi-EXDgRriresz04zcDIqotuZmvsZtxfc6Rw>
    <xme:YhV6adyB6XEUNHcJ8K7DZOLxtSBEh36rgXKCwi9-RpGND-xRgTk2NiMsRJbMIWwIh
    nA0-rey9kH-zwWaKo85QcjpbuVpn2wu4XYje80DwncWzsGRLbOjLmSh>
X-ME-Received: <xmr:YhV6aejTlcdBm04B9Zb0ixADZ-pd27JuoZQYdmfPWkW6bKitM1aTngU2bzgCzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:YhV6aQP9MF5N76J4tglK2iXE7aytvFT2B8OFD2wMmvEQM6ISVZ-P7A>
    <xmx:YhV6aWhWq9u5KMXdTYtb8umMsbSReRRuuzZCbY3C8WNK4lOaheYJ4Q>
    <xmx:YhV6aQq-wMuxk9YdIal3rqi6WZ1EAwSdLvkzeETKdd9rlQEhRB4HMw>
    <xmx:YhV6aRhOa_W2y_xmndaioiM4BSpaB3NIJIRSWZirCBqugXLAfWoqpA>
    <xmx:YhV6aWKwASNwQ7mAJ75LFcnKUB3-Ek04FvMrOZy1jdgYEszqG0DUyZgv>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:55:44 -0500 (EST)
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
Subject: [PATCHv5 05/17] riscv/mm: Align vmemmap to maximal folio size
Date: Wed, 28 Jan 2026 13:54:46 +0000
Message-ID: <20260128135500.22121-6-kas@kernel.org>
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

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_NR_PAGES.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/riscv/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 21d534824624..c555b9a4fdce 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -63,7 +63,8 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#define VMEMMAP_ADDR_ALIGN	(1ULL << SECTION_SIZE_BITS)
+#define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
+				    MAX_FOLIO_NR_PAGES * sizeof(struct page))
 
 unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
-- 
2.51.2

