Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2CA466B45;
	Fri, 27 Feb 2026 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221401; cv=none; b=DLRm+qjf5DnrsrE+w6vO2A032XETVrVEBnWQ9J61NhGt2dAD1Hs5lq5Llsx1Cv/qxKx4B7lbTTARqQiu1DtuDCEmhtmetsWcGt38QwEdSO5nGi5WKPmYqpy/oeRiI/yyyE/Gz4sHDkzSUJ4/vbN+3MYlS8RGKbzRdj7T2xXpAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221401; c=relaxed/simple;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOypO7Gv2gU6V5DlJV4DuDH07WhDNrJkXG5HPW1BhbM8xQK59zX8J53wg23Ih6yiJU1r+Wmu/LEgt1nO9djFAJQZ9OBdw6KlLYd48C6Ew4v2ujV4KUobmuWpYcRIfxVRZFdYaTsUqz9PXgm1VqdGhUPO58ht9Q+JVc92R1/yBBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZEn3CfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZEn3CfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AEBEC19423;
	Fri, 27 Feb 2026 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221401;
	bh=dDlhIg1ZurYJ03ybCvzQ/8rd/HYYP+ChnQ3pTqezzmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZEn3CfYySJZGovC4vlaxPB3NGKdzK4+qhUkwHQsXqtdKtDp1jKJKJk5eWrgLnfPN
	 0IQmtBctXrgxdAKCwcd0vfhBmfFsLhf0bnwz4P6X0OGvMaRVbOAnuES08WK108aBvN
	 7ivHob/OdIeAxsjuAkTZ538lKFXcbm5VQZ5LgMEcJp7QZF84YwjgD1Obmoevivsgnn
	 5cJBYdM6rTM2qZsmZx6aEjs6KxqQp9YS/9TG9agDbVWs0y9wok7oLd4mowRA04Yj40
	 Uod4rqvakpYgr8DG6eSJHU6hAt92Ea6OltOQ3r5YhOuJhQrqx0X3Ifr+mKMjj+VS/R
	 mAjDhOOHiGOEQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9FE40F40068;
	Fri, 27 Feb 2026 14:43:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 27 Feb 2026 14:43:19 -0500
X-ME-Sender: <xms:1_OhaRPXUM6uHC6-8JSTmW2LGRPmB3J2vh9PEUOyJ-gO2y7bKfxa6A>
    <xme:1_OhaVOG2DbkytU37ZM3MFun2NppW0vI57Y-oJtduP2SLgjrFD019Qbw6eYOmTHEM
    KZQLs7DNhlL_rWdrxGYeVLmOfU6pQGx_bTIwgMCTYNot9tneUeg7u-C>
X-ME-Received: <xmr:1_OhaZIWh-6Dgf5OGz2a7QMtZ7DP5BxvO8_H5Rpir0oDBMunxxDxSWBS3MKLbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
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
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhm
    rghilhdrtghomhdprhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpth
    htohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:1_OhaUuyHj0uktem_Qy4Rv3xLvqDvP0Et7PmVpH6YrtlxG55VEaJ9Q>
    <xmx:1_OhabHPsH1nxKzqwO_9f4pN9emiZR0PmAQtS5SG-Nh46TnpGH1JTA>
    <xmx:1_OhaTPccoA7PJ2IVYn_eQY9CS8RQTMMoVUrJU8xNOEJw_cl8tJBNQ>
    <xmx:1_OhaeFzyYlI2_8HqwvUL95FggnLcWjVMJaqwL9zVzAsspl38sOQ7A>
    <xmx:1_OhaQHbJJWNI6fzoZiRO6KTyVyl8wRCv-YCrxTNmsqZJ1Eo-TgQ8DHT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:19 -0500 (EST)
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
Subject: [PATCHv7 06/18] LoongArch/mm: Align vmemmap to maximal folio size
Date: Fri, 27 Feb 2026 19:42:44 +0000
Message-ID: <20260227194302.274384-7-kas@kernel.org>
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

