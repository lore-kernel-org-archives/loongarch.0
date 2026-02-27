Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30313478844;
	Fri, 27 Feb 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772221419; cv=none; b=pzWloWaaSxIE/qNhAN3ZT5JxpfDXN62DroHwtUvj6l3Bhqsg5xkCVvAcEhgcyzotRMJuEw16nZZ6l/wrIST9Ib4iBnvGF5KB3L5MXqeTl+WyvokM9utMOS+yjcezBxAG6JtGam+EMJ7Z2wqwPxdJ6krDNDcuK9oMKLCE+LGY+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772221419; c=relaxed/simple;
	bh=AzObIjwfDWqBbZbwfrWx+NLWeNrw3OUfYcbmIl3qAkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUSTUNH0Sp9zPPKjxLPJuIMD6od7xY+tzYNYF6dXLa77/KFVQPrjiT1XKPmdi0UM6hzOhXpkKViprm4zK4iUXtF+p7te1KTdzmfzRCd32ecATguhGa8py1jrQM1zyLuLdUY0OnRSVCiiUHXxgOi99q/7XqGypMxuOjtRCPBAvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQ9L8TAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQ9L8TAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE9AC19421;
	Fri, 27 Feb 2026 19:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221419;
	bh=AzObIjwfDWqBbZbwfrWx+NLWeNrw3OUfYcbmIl3qAkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQ9L8TAevUp19BUTu3H5CwRLn63CozmuhJwxHIdNPoh5Ay/uPpydhJzy2rN2m4cmV
	 NIgm9f2EGb1shxYYIF186GHjpZNXowKdVbKNKg+uGIh+6PcwavA8BrWsJc9xIYKEzT
	 3lygGVuwKZMznJ5rnGWbqtRLq9ED6kKIcHFBzwPb3Ceb49LDmm5Dp+ahQVqTo737mZ
	 wrKvILDagJe0KCjWOl5g+rrKFdL11GKAnZTzjwbmQE6TRW8OMTsEnlnrQCe23gumxI
	 pz84vcMNjHyhIsxcPk1BAjGca1YBckyXlvTqgYAwoy4IZGDOkWr2apP4eAv5D7cBzv
	 HfTV2dsf2xJ0Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4347EF40069;
	Fri, 27 Feb 2026 14:43:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 27 Feb 2026 14:43:37 -0500
X-ME-Sender: <xms:6fOhaRljmtwCladvdVdTs1uKNBlldPgkpxj8iEjd6pRszwIE2LaaSQ>
    <xme:6fOhaWCxgfvqj23kCSp1LLpbdMxNPTs-KSaEMHjY89SU2kIdVg2Nc9s4nmKbMyLkb
    BP7xSOjfKZrAOa8Mq_R7D5RfGLQ9M_h60kia4SRprqJXTfpVlMsnik>
X-ME-Received: <xmr:6fOhaRynwl0l9IvW3dBXKdzlRB8psU4IbyBZGWiQuggEG1HD7ezP0vRRD4hrhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpedfmfhirhih
    lhcuufhhuhhtshgvmhgruhculdfovghtrgdmfdcuoehkrghssehkvghrnhgvlhdrohhrgh
    eqnecuggftrfgrthhtvghrnhephfdvfedvveejveehhffhvedufedujeefuddvkeehledu
    hfeihfehudejffffiefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepkhhirhhilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithih
    qdduieduudeivdeiheehqddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrgh
    esshhhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrd
    horhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgt
    phhtthhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihse
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:6fOhaSei92AxKtDSNk7Tu4HEencE9E1hM3NnIzVlSUiaScfXq2KIpg>
    <xmx:6fOhabz-zfd_LnAY0kPWAbgOFi1iGlLBMYMJtyc2SOKL5rBUCEwkAQ>
    <xmx:6fOhac7hLe_myt9C81Hr2MqDxemPf7c3adCImg4mGg8cPUqGBMHmgA>
    <xmx:6fOhaYygtQki3TFoxrt9HX5uwY_MfKcXs6RTkRi3fkF_oWQLsLttcQ>
    <xmx:6fOhacYDqyd3Loj4RKa6CSF_PSzT8QpEqlmack8arkoZz8Twf1w2JHAk>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:43:36 -0500 (EST)
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
Subject: [PATCHv7 17/18] hugetlb: Update vmemmap_dedup.rst
Date: Fri, 27 Feb 2026 19:42:55 +0000
Message-ID: <20260227194302.274384-18-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-1-kas@kernel.org>
References: <20260227194302.274384-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

Update the documentation regarding vmemmap optimization for hugetlb to
reflect the changes in how the kernel maps the tail pages.

Fake heads no longer exist. Remove their description.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 1863d88d2dcb..4aaef36d8971 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -124,33 +124,35 @@ Here is how things look before optimization::
  |           |
  +-----------+
 
-The value of page->compound_info is the same for all tail pages. The first
-page of ``struct page`` (page 0) associated with the HugeTLB page contains the 4
-``struct page`` necessary to describe the HugeTLB. The only use of the remaining
-pages of ``struct page`` (page 1 to page 7) is to point to page->compound_info.
-Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of ``struct page``
-will be used for each HugeTLB page. This will allow us to free the remaining
-7 pages to the buddy allocator.
+The first page of ``struct page`` (page 0) associated with the HugeTLB page
+contains the 4 ``struct page`` necessary to describe the HugeTLB. The remaining
+pages of ``struct page`` (page 1 to page 7) are tail pages.
+
+The optimization is only applied when the size of the struct page is a power-of-2
+In this case, all tail pages of the same order are identical. See
+compound_head(). This allows us to remap the tail pages of the vmemmap to a
+shared, read-only page. The head page is also remapped to a new page. This
+allows the original vmemmap pages to be freed.
 
 Here is how things look after remapping::
 
-    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | ---------------^ ^ ^ ^ ^ ^ ^
- |           |                     +-----------+                  | | | | | |
- |           |                     |     2     | -----------------+ | | | | |
- |           |                     +-----------+                    | | | | |
- |           |                     |     3     | -------------------+ | | | |
- |           |                     +-----------+                      | | | |
- |           |                     |     4     | ---------------------+ | | |
- |    PMD    |                     +-----------+                        | | |
- |   level   |                     |     5     | -----------------------+ | |
- |  mapping  |                     +-----------+                          | |
- |           |                     |     6     | -------------------------+ |
- |           |                     +-----------+                            |
- |           |                     |     7     | ---------------------------+
+    HugeTLB                  struct pages(8 pages)                 page frame (new)
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +----------------+
+ |           |                     |     0     | -------------> |       0        |
+ |           |                     +-----------+                +----------------+
+ |           |                     |     1     | ------┐
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------┼        +----------------------------+
+ |           |                     +-----------+       |        | A single, per-node page    |
+ |           |                     |     3     | ------┼------> | frame shared among all     |
+ |           |                     +-----------+       |        | hugepages of the same size |
+ |           |                     |     4     | ------┼        +----------------------------+
+ |           |                     +-----------+       |
+ |           |                     |     5     | ------┼
+ |    PMD    |                     +-----------+       |
+ |   level   |                     |     6     | ------┼
+ |  mapping  |                     +-----------+       |
+ |           |                     |     7     | ------┘
  |           |                     +-----------+
  |           |
  |           |
@@ -172,16 +174,6 @@ The contiguous bit is used to increase the mapping size at the pmd and pte
 (last) level. So this type of HugeTLB page can be optimized only when its
 size of the ``struct page`` structs is greater than **1** page.
 
-Notice: The head vmemmap page is not freed to the buddy allocator and all
-tail vmemmap pages are mapped to the head vmemmap page frame. So we can see
-more than one ``struct page`` struct with ``PG_head`` (e.g. 8 per 2 MB HugeTLB
-page) associated with each HugeTLB page. The ``compound_head()`` can handle
-this correctly. There is only **one** head ``struct page``, the tail
-``struct page`` with ``PG_head`` are fake head ``struct page``.  We need an
-approach to distinguish between those two different types of ``struct page`` so
-that ``compound_head()`` can return the real head ``struct page`` when the
-parameter is the tail ``struct page`` but with ``PG_head``.
-
 Device DAX
 ==========
 
-- 
2.51.2

