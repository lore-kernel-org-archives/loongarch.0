Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C5846AEC8;
	Fri, 27 Feb 2026 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221399; cv=none; b=gfsx46AvyJNLk4jlngxMuzvhPgombhtJZMu5KaCobU3xG8uK4JQt1J3xR3xj8e/5kD/hCTQEFwO/eTI3E4YMb1vDnhIkOh+iITA60sBpE9thesDCuq9MOr+mlrE1ImArRge5e3/oNvXXt4yz+ddTRl5+n+SIvHLbk3lJcgzqbX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221399; c=relaxed/simple;
	bh=Qa3n5VKBU/DN+usEuz8+Om7G9sqmqxUGPeiY6zJ/Qrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Amj+cIoH3pVg4Id4wccRPp19JA2gdgnbgxvtWFkoZyA4jT+Fw5BlPEKo2P2Hp9ApjVsoPHOhBLUb0I0fyctJRffYvi1LfbUAgR70GnpEuW+LFba7pfzZJuDBVI1vaBSR8uFQqb5UUcX5NDUH68R2pULetoDknEvD+AviVuAZgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pz7x/zeR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pz7x/zeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE576C4AF09;
	Fri, 27 Feb 2026 19:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221399;
	bh=Qa3n5VKBU/DN+usEuz8+Om7G9sqmqxUGPeiY6zJ/Qrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pz7x/zeRZhQ6xZh/JF2PLBA3UVxYt5R7fliDJqQsrA7EWawCcDrq6rzktU+2Xknfo
	 tlAd7MbWAstB6zD7YDLt40LYBwiyBPtk/5130dQdxkHsr+jNi6oGQySAvmpDt3qVmf
	 s19NFBZCsIh3k5ZDvNy4BUsvYkbTDpxXcqw3ONh/PgxkXxAbPpQQCRZE1xaiz/mlHK
	 qmfkudr2BHhOHDDcJAFG8InHd4JESRAMaS8xCUrqhKkjlhhtSXUK647GOpOI4CgAHC
	 2FjqjqC9OPN+yaDqpOYnL2vnDhijVJ8ie2lehbduuMxeQ4TjgqWr4dEq46b9Xiyci/
	 CgMe6S4W/Rq3Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 167ACF40069;
	Fri, 27 Feb 2026 14:43:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Feb 2026 14:43:18 -0500
X-ME-Sender: <xms:1vOhae7YFFAxZXh3_N19WWfb2lBzOwlSxqyevDM4BtfJ-BidljQ59w>
    <xme:1vOhaRE734JhlpbsLxbnczaJk9g1Lhp3aCegQ1fJ8EFJ4sJbA-M1y887CyhX4tiTo
    y-9nZD5a4huuGeV22LOqmIFkpBvSzEa3FJr1hUinhqyphyszHF_cplS>
X-ME-Received: <xmr:1vOhaXlNd3fqpGJtnHBHpj_4sS5cx8LORSG1Zdqhuxo50BCkCNKJSopNR9EFxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:1vOhacAFFqSOI4885Zy7Iqo0us3SXf_Rk7cqi7_GkheLV8lhkcXWpQ>
    <xmx:1vOhaeHcRVjpp47P7EB6ZOgUrov8X3dLllIUEtUN8eJcPa6fKn8mKA>
    <xmx:1vOhaY-16JPOoDp2IoZQcFlovyvM32cGRyMZpOu_Xa4yYLoeawolRA>
    <xmx:1vOhabkvbZv7ZqtIx-vd9H6Q44WMt4kD_MgZLhDFouQyirDnHmfbCA>
    <xmx:1vOhae9n8SDoKW34ApDWeA6Vz33Dgkc3q7pqQGTX0-uJGpGArdUeqCRt>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:17 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
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
Subject: [PATCHv7 05/18] riscv/mm: Align vmemmap to maximal folio size
Date: Fri, 27 Feb 2026 19:42:43 +0000
Message-ID: <20260227194302.274384-6-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to the newly introduced MAX_FOLIO_VMEMMAP_ALIGN.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/riscv/mm/init.c   |  3 ++-
 include/linux/mmzone.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..e8fb2239a0b5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -63,7 +63,8 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-#define VMEMMAP_ADDR_ALIGN	(1ULL << SECTION_SIZE_BITS)
+#define VMEMMAP_ADDR_ALIGN	max(1ULL << SECTION_SIZE_BITS, \
+				    MAX_FOLIO_VMEMMAP_ALIGN)
 
 unsigned long vmemmap_start_pfn __ro_after_init;
 EXPORT_SYMBOL(vmemmap_start_pfn);
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index be8ce40b5638..492a5be1090f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,6 +92,17 @@
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
 
+/*
+ * HugeTLB Vmemmap Optimization (HVO) requires struct pages of the head page to
+ * be naturally aligned with regard to the folio size.
+ *
+ * HVO which is only active if the size of struct page is a power of 2.
+ */
+#define MAX_FOLIO_VMEMMAP_ALIGN \
+	(IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) && \
+	 is_power_of_2(sizeof(struct page)) ? \
+	 MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
+
 enum migratetype {
 	MIGRATE_UNMOVABLE,
 	MIGRATE_MOVABLE,
-- 
2.51.2

