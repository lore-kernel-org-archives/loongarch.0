Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF77360723;
	Wed, 28 Jan 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608574; cv=none; b=I9OEngt35Oim/3+wZChGi34agRSdi2STR9Oa5kx92XnyjupdIYQJSEXY3edIsxJXXxXZ4CIieCwXzM8xJ7iJFTB29rJu5Qv++Ivbcn//hqzPOrvpeDznlGAsSqJUHQu/EHoHdpNiYBHe/I1yoWPIMmKeq+EpMEK8JflkAOeAdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608574; c=relaxed/simple;
	bh=VrUiLq75DGzOguYtbXE6XDIwgQv8ey6yUw/4kWmprNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBp2tO93x73uLvlIUhh1LaXsXPCVL5psTnN+jNDe6ayWWnHIrZFKoyDnZbBrlwyVa13RxloaPfRatZQaafMQJTHdIx297xm7+JtP6C07NNnXjhDW/fF+TjRxv6iX4RdtT9Gh1WxZ9Hn+Zlsb8rAndTwzCe1dv/DP2wOr+gObVkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CesdToCi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CesdToCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04E0C116C6;
	Wed, 28 Jan 2026 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608574;
	bh=VrUiLq75DGzOguYtbXE6XDIwgQv8ey6yUw/4kWmprNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CesdToCiZOfNgCfHGdBNPDTXWSuQ8JYshl9rWWXFZciejbqYb6/4f1yV7bVtzEkyW
	 zXhjvhbjCo+wqNlrPh3B3Ts1wKbTfY3CwIpMcqkb/bXtIIb43bWFzssN+iKukSLzHY
	 beWbHgr41d/+cd2QlLmm2hE7oHBDUYhFPPzbKUQLDyvCV+aD+KFoQnDMZ0fg591RNF
	 CXZkHIqt0ogufNaUDmPNsrOWdzgOiVlefvxLwQY5rMHdJIZxzueUB5OshQvdX7GUXY
	 oXQXq/hbusN1KKHBKjuiv/Th0fzFe3AyYf0p0nKdOkiguY/7ZIgT2pb/ZQ4o6RbkWR
	 Duf7Tdrt2BZcA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id C8C43F40068;
	Wed, 28 Jan 2026 08:56:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 08:56:12 -0500
X-ME-Sender: <xms:fBV6aYNDf-l6Wp-0p5Rxt6rle6FfVnGj8Hj1gVpgi0fm1Y_NexZeEQ>
    <xme:fBV6aYJ6TOhqNi9JZbX2fkg0w2cvPp_gOrtdkJMMaJnchaMHfCz7urrtaM1rr-iM1
    auDFCXnKP7ALO9xgw3rge0eBuq2ef7z1-5ebSwsz-s7fTsJWVq47A>
X-ME-Received: <xmr:fBV6aZbWJkhclum-ZYcIzBk2uXa6l_Oa7ZFIrvpm8cQW3NdjKFd9bw738VmMkA>
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
X-ME-Proxy: <xmx:fBV6aRl1v8AVKSsqAqM5yGyp6qvoorfMCqgMyQmhGZSYlNRyPaTH_w>
    <xmx:fBV6acY7gJoG88XxhixLUdmboNl4eFnBYdOkvTXu0mGuiOxXqLA-cw>
    <xmx:fBV6aRDbIEmSL5ukcuIGiJkKzeYXwo9K8JHg15JHW1y6FZPlDxjXCA>
    <xmx:fBV6aaYN86aFFiDOrh2ZE8HHsB6ZdQkTj1Ya2GZYdOHsgLj13gIMPQ>
    <xmx:fBV6adjTz2q8JbYQyOSrZH6cfM8V7XejcbT3uPo-4Y-8sYSeKU3uSYAY>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:56:11 -0500 (EST)
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
Subject: [PATCHv5 08/17] mm: Make page_zonenum() use head page
Date: Wed, 28 Jan 2026 13:54:49 +0000
Message-ID: <20260128135500.22121-9-kas@kernel.org>
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

With the upcoming changes to HVO, a single page of tail struct pages
will be shared across all huge pages of the same order on a node. Since
huge pages on the same node may belong to different zones, the zone
information stored in shared tail page flags would be incorrect.

Always fetch zone information from the head page, which has unique and
correct zone flags for each compound page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index be8ce40b5638..192143b5cdc0 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
 
 static inline enum zone_type page_zonenum(const struct page *page)
 {
+	page = compound_head(page);
 	return memdesc_zonenum(page->flags);
 }
 
-- 
2.51.2

