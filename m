Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6944E05A
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220646; cv=none; b=JJB32X7UdzZDy+bwtKJS93++Kksnp9nVT1hGuUug8myHDDj6p8pr6oJSTqnGGzgxkXzdM624N7nZfNKyP4lnaiPek+2AwZAjQ1hYYYkwVbSfL4YhwbMBlyhIM13y38xsrjUTfnG77iaWo7OpJJIzxK2rUvFOmXkOqkw5yuhjbT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220646; c=relaxed/simple;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AkiTkPlj+SK9dmgWrVsVN0rExvuQeBvEp0qbBequmYYUFG6c6Th+msEWf2LJdF1RF4EnvvcLTI4JG1i6QtqvpGmsbvcqFqxabceuJmA3+fZAnewlvBWuyWe4KLUnwk+44T2slh7e0s+F9JcdpqytfWwEp52NnKnHtjhPTpGNKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHsjfnnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHsjfnnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC12C2BC87;
	Fri, 27 Feb 2026 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772220646;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vHsjfnnPPlgzLn1knlBckpC5+ecvjmWaKcM6woOewpFNfdlYQHsccQwVVnpJicu9y
	 1KWc84RxGL4gzr/FxlUKy6bBs50Au4rmj8iyx7mtqmWrXfSFMWY37zF2jy64CM3e7v
	 vVfOfypTtFu6YHCmG5yjLjOVa991UrmFOl0ieRHCmWPzjAkkLKqYG1k4CGyUTL4S5g
	 JhkOt0G9kkbh/p4RWYiLia8cdPum9vuJkuBgSA1bivmsvnkAShZV40OfBATNXWOtxl
	 vJ9PvkM+O121Tdakb7SoNXREhQCSQ7WP2POq3cvWLFElE0tciXdXJs6QGmFrV31Z2N
	 I8LKYkvH7dJtw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 730AAF4006A;
	Fri, 27 Feb 2026 14:30:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 27 Feb 2026 14:30:44 -0500
X-ME-Sender: <xms:5PChaeHNa8uVhrct1Uccqzjua5E_GWwmn_J752P2PkczmrKtz4tnIw>
    <xme:5PChaYjY-7BOCgcSVKQWUsXepNil9-KkDwWWdS6Bn0BnBWAbxgg4LrnYxoxnMG7MA
    qwF_iErrwHY4jVtptQh6_68gVyRNkqBJsaMUCTQmGzNjTspkUJMcDU>
X-ME-Received: <xmr:5PChaSRD0ypMJx_QyALMeHtwordrV1grw2N1MA7VShVI6akoZKJtEcVy0iCF0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeehucetufdoteggodetrf
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
    thhtohepuggrvhhiugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:5PChaY9BmWQg0N4t0rzE-4IKm0tjs6EPE_Nj0ERt1N_DiQcfcz7Cvg>
    <xmx:5PChaQROttwJrfc81Bs1Rq957unyIflFHFYtq9M3jwSv4ng3GUoMww>
    <xmx:5PChaXZTsqMmtCvmJ0mwH7ZMzmoqNEDYBRWQ2rSVM6-WfuL8VOzh4Q>
    <xmx:5PChaRT1Fluji9nz_lXyK0nSTBpaEPTqNVl8x7Rxz4FPF1d4KQrdag>
    <xmx:5PChaa4xbh2w2LQwUWkm8sxVKxAiXwicQ1as3hoBcQL3yMwYU6ufDbh9>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:30:43 -0500 (EST)
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
Subject: [PATCHv7 08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Fri, 27 Feb 2026 19:30:09 +0000
Message-ID: <20260227193030.272078-8-kas@kernel.org>
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

If page->compound_info encodes a mask, it is expected that vmemmap to be
naturally aligned to the maximum folio size.

Add a VM_WARN_ON_ONCE() to check the alignment.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..dfabe554adf8 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,11 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) pfn_to_page(0),
+				    MAX_FOLIO_VMEMMAP_ALIGN));
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2

