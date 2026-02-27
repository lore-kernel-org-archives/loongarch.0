Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C53444D6B9;
	Fri, 27 Feb 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220643; cv=none; b=YsapmyM6kATw+7Td6f1gQG2j+RZ2bSsdZzJFaStsC4PzOPB0+P/7X07ZGJ5U6v8z5fa3ncDdJZmacX04CY/LfBf2lezUY56aGtOud7F4W+l49hXKbrVKSXeb4TaBp7OsMXd36aSnbbZntPNNr14xhAeruMflHZH4pnuHgyFUXds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220643; c=relaxed/simple;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUl/PG1GyuBg2YrWZqKZ4uu16wMSgxRmQ9N5d1YloDX0j4VVuBdvTOQHpHxu6sLnZV3G14MJhOdqv56aiFoHzAmwww0ADUjMmK+hWdIM4lXZaqDrR+JUO/ipnX8i8l0nRf+5tkHdoWiOdLYI1RgymRVv0nbZAVAfnFRwqgITlWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iePS0/Dw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iePS0/Dw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45EFC116C6;
	Fri, 27 Feb 2026 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220643;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iePS0/Dw97YoKZqjJEs4Khp3/s0IFW65wsVvq2OfyTJ6xyUllIl9bFV+1fLPKEKDq
	 teTsJwPOnCyWZn4tbFNjwwDYriv+idQUZaDkhKRRvY9vQKxAocQZBgNAlqVbJE7NqD
	 ZEdGLjLouJED4PMaSZOuLaHYe0B02FxetIcJpJO06bx4999teuiH33vP14D4yFkcs0
	 Dn3lUw1JMn4RybxD7zq+g6YY+LhsljbpTe5gcehCCu4fxhF2mMtkdCvdi2rBeaC6qr
	 KSVJ8R2bhUw+ceCxR3MHC70qalNhpe4t4vUnat18jET6g1oA7GELCD8yhrN9VUBzSe
	 bJolX3+iez0ig==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 096E4F40069;
	Fri, 27 Feb 2026 14:30:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 14:30:41 -0500
X-ME-Sender: <xms:4PChaaxF05G3PS4ruFPeqrl4CfZBDukTsDkjkkX0ww5r7pPTOXtreg>
    <xme:4PChafc7zpnA3mTUcYsZf0M1R0ABoQtFC3Akvt5C_MlNYimapFQHKrZpXU17zhl0L
    43RiYrUFQsj-jA3NDZZe9NOLp6j6iTQerxzCNCzcikoWNkbmdo3mgk>
X-ME-Received: <xmr:4PChaWdTET4SMgY7Fn96q5cb-3D2uHdS4l2nsNBKTYt7P_ggbH4zNLPqeXiuPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehkihhrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    udeiudduiedvieehhedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgse
    hshhhuthgvmhhovhdrnhgrmhgvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghp
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:4PChaRZgZnAwpi58ZHawdb4qKlrjpKRC6V7XXsAcelIEKiye7y6Yhw>
    <xmx:4fChaX-X7WJRg904CQZJbtYqA_MlWebh8fOZoMW9hk7EdNhukRDNgA>
    <xmx:4fChadUepdxhwwpMA1572Y0TOfn8qc8d1l5mY5Nj5I9TTNuu1g03eQ>
    <xmx:4fChaYfmwppmk5aKQ8HiqnXf2GjRxuenBMHD3ghASM7TR4WX0SMCzQ>
    <xmx:4fChaaVRlQQyQl5KbWzB3Xuju6bQ3miKkNTSW-EQlpIJpfyJHls2M4hY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:40 -0500 (EST)
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
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv7 06/18] LoongArch/mm: Align vmemmap to maximal folio size
Date: Fri, 27 Feb 2026 19:30:07 +0000
Message-ID: <20260227193030.272078-6-kas@kernel.org>
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

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_VMEMMAP_ALIGN.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..ea6c09eed2e7 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
 #endif
 
-#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
+#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_VMEMMAP_ALIGN)
+#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
 #define VMEMMAP_END	((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
 
 #define KFENCE_AREA_START	(VMEMMAP_END + 1)
-- 
2.51.2

