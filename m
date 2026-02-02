Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01126C3BD
	for <loongarch@lists.linux.dev>; Mon,  2 Feb 2026 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047846; cv=none; b=U9uPDXJ7dI89uN3EJqQtWRJ8VyLgBBwxMzlbo22OozPuMZAv0FTSLdTjs0dcbTtVSUPN13ttWSZTZ6IZ0m1WjUszs89X4KQhzJJ9NyJARv3+E86gF06oo9FXQ2VlmKRglMiELnEmMKggzYLsr2itgjxqhDtt3zX6c3x22Vlhxbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047846; c=relaxed/simple;
	bh=4F/Szy/Cik4u0re8XChd+PvOlhHKvV3FFCqDor4py4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrQCnHDIhF+nD3HrDnSW9ovRujGOsVxhLhvNMz/UbXstjGjj28MZv6Kr0M4aj9r2Jn3pcvvkj4gRNNnzQGlUtXa+giLwrgNBSojI3I2sdl/UTH7MZpj0wSQ4GMY3pr62oA+aqdnt25go/OO96zMeoUBakAG9++Dy2r408RbL+00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZGjfjok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZGjfjok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6187EC116C6;
	Mon,  2 Feb 2026 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047846;
	bh=4F/Szy/Cik4u0re8XChd+PvOlhHKvV3FFCqDor4py4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZGjfjokPDSHnlpjqwSQdtVHGGa61a3RZjUGN2GocdWA+Oe8hFb9IlHe13igYNXt5
	 as45sEuzodDB8j3uv727voExdfh1yDdL4EH8gJtlMNf+LzDtkCnAcXtxVKa2ADbl8d
	 xCgwh4GKiy6d9dpeuqSQ0Nm2AgFje01Aqxd/QcOmsVC52Anb93ChtzexC90UG9xTiV
	 CpFCGVELbyNKnrJHWkkPMvMR2Brow6+oLXAdPJpYG6BaqtlfQn4wc3BzlvjjIpC3wj
	 wC6qaUiJbMT+y7017wa/GjCQ5Fh3XL2fNpJhqA0WLzKJ+N1g4OCXcn3avVi53pUwIT
	 mrBnx1DMgdr5w==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 87AD9F40069;
	Mon,  2 Feb 2026 10:57:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 02 Feb 2026 10:57:24 -0500
X-ME-Sender: <xms:ZMmAae_3pbGsFF7v_MZEmDRgDY2f7GMkRejfgptjcQ21sK8zJTSYYQ>
    <xme:ZMmAaX5UcOLdks_v7i1vRWtO88mrYxHbW_-fJNidyFhLw5yrbfK5Lg3QklRof27o7
    sglVk5chSgpz4LC87bfKGEh_R-ZdQ-uVYtcrqU2yS7p7bE9BFsKmts>
X-ME-Received: <xmr:ZMmAaeIOk3utiWzPI8eF_K1lpuh-ER9c1IXPRqjS2R-Fq02N-UrDfq0bqwhcFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:ZMmAaXW1d65pS8ihA67wf_hRBqAR18KdW0Mev4RAVm5fV6tgKi7OgQ>
    <xmx:ZMmAafJKlnjoDTLfBd38lQaRXg0lCilqWOKaSvUULjJftWd4fIXF8A>
    <xmx:ZMmAaczYts7r83g26Mell3b26W_mF_v-eF1S_kNRLdn9JMEVbOCXUw>
    <xmx:ZMmAabL-FjuRVRpS65ikPOX_oDGGSrBR3c_HvDzbHaC_MiJXf78cNA>
    <xmx:ZMmAafQ9vmeZ028dJBC8OeVsAc-CW9C3OdCX0Mn9hsCgNbY_nmsxO_vs>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:22 -0500 (EST)
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
Subject: [PATCHv6 05/17] riscv/mm: Align vmemmap to maximal folio size
Date: Mon,  2 Feb 2026 15:56:21 +0000
Message-ID: <20260202155634.650837-6-kas@kernel.org>
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

