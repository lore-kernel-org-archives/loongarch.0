Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D594657F0;
	Fri, 27 Feb 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221404; cv=none; b=r8z8O5l7b9Ggiw0ubwWxlc6xetFztTyiyQKQaOd91KVE943cKIAfTmE05t37TVtgZBWjeEXLr1a1SvdYiOcgwrZ7W18IHEQNkaN3GqAwC7W8yD/hdalDN865Ya7PWqHm762/+ZArLc8W/b1Gor3fq9dSchDlinytxszXy0X/Ecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221404; c=relaxed/simple;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtpKt4FqqGy1jwpk27E3RaMAB5+c89p5DuzDPgIp5EZ+IpYf8V5aICeESs9R2dPheBqqN1zELGgE3ZP8QcZ9UMQItvs+jzGJRenRCHOsfXxgLYzQNKrAU0WXhSwlnZulwD/KchA5iKrtT6iPQe3S36O18pm/pb/0oTUeOE7DOGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsF21Cno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsF21Cno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D7FC2BCB0;
	Fri, 27 Feb 2026 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221404;
	bh=qL/9y03XAUyVqo5OQVqiOiCFnXGU+LUEF5AtRX0sSeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsF21CnoBKn/lu9boe37TDd991flEHr2mvygK8jdP/xwI8tdRmQVyjCZER9cJ77bd
	 a+xKo9EPLTjaUm02KQbN48MIsPjUB0Bqbwc0v+DXSO8dcdiUEazkFFCvOQf7XGoD9T
	 qwc5r9YRPYTdMSGLsROHXn4Ya/jVx/CMYC7MR1I2r8h26pOMTbx0dRysIp6ErSeTHp
	 PN9tBPIfquvjX4bVSXx3fiJRgHkZKGpc0qcfEoRNzy9TAxyu7yHtoT4AWqxZRAKRpT
	 0uFnRKPN+6Zl8QErCy47zLpFS5GtwgNb8Pob4rFxCkirfbypkjwvX/q+6qB1hQKlI8
	 HqVy0HE/zUghw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id D98C7F40068;
	Fri, 27 Feb 2026 14:43:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 27 Feb 2026 14:43:22 -0500
X-ME-Sender: <xms:2vOhadyXya4yLvxIDvteB3YJYYeoMaYCq9g6E25uN0uh7yKbZoZuBQ>
    <xme:2vOhaegxw06N82H9lXQ43oKiaJudI9bL7m1bafOf5Z23YvIWdZngQwsuSrCcQb1x9
    HQHhsQZMt6JGQVDOBhsS2d-IEC418amrnc2eAhYKLCeS2WDtes8Cl4>
X-ME-Received: <xmr:2vOhaQMD9laGwgWVQMSP9q5ubihdvEbhHlXEE6v4dCIlZNnTSwq-N13i1l6pCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfmihhrhihl
    ucfuhhhuthhsvghmrghuucdlofgvthgrmddfuceokhgrsheskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpefhudejfedvgeekffefvdekheekkeeuveeftdelheegteel
    gfefveevueekhfdtteenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrih
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
X-ME-Proxy: <xmx:2vOhaWjk8lIr33h1293jPn5y6LMc3miT2U3bnD367YgKMKLx7RkndQ>
    <xmx:2vOhaQo0zMbDHINM1yEBg-pnfKaI1Mb2MqjWOK6EjD2ObcuFzGVtIQ>
    <xmx:2vOhaRiMUO1exAmM-IDCvqOhvN83Oj8h2KxUo766kyL0izRu4wwRGg>
    <xmx:2vOhaWIWUc1NsaavpYvwG39l8_Q_GI0r6oI2iHag_LZH2QpiaoDLqg>
    <xmx:2vOhae7x0N6Zdq1yCXZsP0Dh-1T8GeChfX4W3ZJwOmL57Lnp3nY0yskN>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:22 -0500 (EST)
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
Subject: [PATCHv7 08/18] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Fri, 27 Feb 2026 19:42:46 +0000
Message-ID: <20260227194302.274384-9-kas@kernel.org>
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

