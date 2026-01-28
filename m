Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB47A3612F7
	for <loongarch@lists.linux.dev>; Wed, 28 Jan 2026 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608625; cv=none; b=svWUlNMYuuzBbCWBYjf5KxGBpoGmJu7LTk1CDbet+fnyz+zUeD0RMSOZCPWQaae/I4+W5VMBEmRBQ3hZ9PsguANT1Cl5/LoLnhtKpkh7DM8hprCNPTN7TGa76a+RK5n/A5YCX/Tk6TNa0LgOXOUiOK+fQnA5dmBP+ZcdLDhapC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608625; c=relaxed/simple;
	bh=yZZwgfqhBoB+VgGRm27UrMryetC9+LjML7284/gAEmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KItQvZ7+lZO/lRExAOqI913wr9KWmiAZJXEgwhcmaX9AEJAt0tX5n7G7sbUzU9rQz866IcVP4wlxFXQttmrHDIl5X+/Iba6sebBYHQaWYcyCkINWZEPv2QFYYMSeqmhIFMa/tmWc6LObhuek1CpEGocek7RtWNrf5iwXP/fzH2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlE7J7Ds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlE7J7Ds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097D7C4CEF1;
	Wed, 28 Jan 2026 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608624;
	bh=yZZwgfqhBoB+VgGRm27UrMryetC9+LjML7284/gAEmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HlE7J7DsdNqUWIc1XnDd+VFzZdsxUKIEv2sxe2PHHFD8R4JE8YMFUylR07DiXnxE4
	 UjfKSFRr86Grc+rt8JVASkHit7IsBiei6lwG7AZ/qRgONcdWcGvJklg0oJqc5I/cf4
	 h/XIg6NxyRtYUgJgOT25kXSr2QGXxFXVkWtMVpjFORSmPoGQcs9WLDcLvKQkAl0neV
	 N3/JcriEnuCCqY9ILRBklb0FYp4VFHKEEjHXpSbogVoj3KkRykCX/xVoIV+NmvlghN
	 pqMh7qJeQcpG18YIHfkYlbNXfZvogEYQClcqs6IPfVaPzTUWKE0FJWkgFcDbvgkV+h
	 hFgqFPoWHQSDg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 33F58F40069;
	Wed, 28 Jan 2026 08:57:03 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 08:57:03 -0500
X-ME-Sender: <xms:rxV6aXnQoYORUEJfWcMxyo8Utbdr1nnqK_e9Dt2yNLa2kFQN4bDZKg>
    <xme:rxV6aUCDb9qtBGo6vgkCStkEVFgMd5BqCb4yuZvNXObkd2NQGOJGAw3XpLie7Zron
    Y5cea1nPq5SkzgxIpqxtlDDTq5zHPuHJm3fy4wlNoWHhtjpOINs>
X-ME-Received: <xmr:rxV6aXxDFK4qRDtI2uYHwCd5WuTe3f8CUFgxxZPO7EGvJp8cb0cu6G3p31_Swg>
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
X-ME-Proxy: <xmx:rxV6aQd3tU6CR3495l0k4R55iRhA-KACa-z7zffBlWbsS5Ox-_q5MQ>
    <xmx:rxV6aRziYj08uSGDwixjzQ_3baNols0S8cT7Ow-TVWMGM1QZty_CKQ>
    <xmx:rxV6aa7xWjAHv-sRdAyvYGQ7mymmsVjQlvC_YuCk4q75ZUVfUzpCGQ>
    <xmx:rxV6aeyiqCgqSZlh_Pp9_MA7VMCcPdMxL8v3fYfISp1lON_P-nEPlA>
    <xmx:rxV6aaZGxRkppOlYDSXS1gs-3kBwwg6tyHWUhZtbi9eJIC9Zfetyg5XW>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:57:01 -0500 (EST)
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
Subject: [PATCHv5 14/17] mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
Date: Wed, 28 Jan 2026 13:54:55 +0000
Message-ID: <20260128135500.22121-15-kas@kernel.org>
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

The hugetlb_optimize_vmemmap_key static key was used to guard fake head
detection in compound_head() and related functions. It allowed skipping
the fake head checks entirely when HVO was not in use.

With fake heads eliminated and the detection code removed, the static
key serves no purpose. Remove its definition and all increment/decrement
calls.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 include/linux/page-flags.h |  2 --
 mm/hugetlb_vmemmap.c       | 14 ++------------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5a8f6fab2255..1aaa604f4b9b 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -221,8 +221,6 @@ static __always_inline bool compound_info_has_mask(void)
 	return is_power_of_2(sizeof(struct page));
 }
 
-DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-
 static __always_inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long info = READ_ONCE(page->compound_info);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fd74a164c494..63e7ca85c8c9 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -385,9 +385,6 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 	return vmemmap_remap_range(start, end, &walk);
 }
 
-DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
-EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
-
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
@@ -419,10 +416,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
 	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
-	if (!ret) {
+	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
-	}
 
 	return ret;
 }
@@ -546,8 +541,6 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	if (!vmemmap_tail)
 		return -ENOMEM;
 
-	static_branch_inc(&hugetlb_optimize_vmemmap_key);
-
 	/*
 	 * Very Subtle
 	 * If VMEMMAP_REMAP_NO_TLB_FLUSH is set, TLB flushing is not performed
@@ -583,10 +576,8 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
 out:
-	if (ret) {
-		static_branch_dec(&hugetlb_optimize_vmemmap_key);
+	if (ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
-	}
 
 	return ret;
 }
@@ -652,7 +643,6 @@ static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
 			register_page_bootmem_memmap(pfn_to_section_nr(spfn),
 					&folio->page,
 					HUGETLB_VMEMMAP_RESERVE_SIZE);
-			static_branch_inc(&hugetlb_optimize_vmemmap_key);
 			continue;
 		}
 
-- 
2.51.2

