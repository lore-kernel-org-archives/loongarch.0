Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D236CE08;
	Mon,  2 Feb 2026 15:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047870; cv=none; b=UfcuWywNJ/jG0l4sZT67gLwS3L/ufbFM11HvguutFxpdFPGVN/yTPqES5OBfEwlwMORGxUamg/+B6WPKLVMXRWnYILhjlWb89sdJgvg+44cZaP7SujeSqpEBHGRgOJmspHPjkiZOuRf85n/FmEpDcllAkSL3DLyezzb+Bm3QkUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047870; c=relaxed/simple;
	bh=VrUiLq75DGzOguYtbXE6XDIwgQv8ey6yUw/4kWmprNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ha9B51d3Ntfa99/jeiJ+4LWqOzCC6NvvShpxqs7gknNgCHffKJXoVj4qGOn5etNNfRjJHyN+pT+Q11G+Des24Nstt32VCLFBLB2+cnyZKC5cSFyEKnoZNWFeBCBRY0tLOobEogOpRJYPyxboJoitcyWIQ9XJtSAm9hsu/gErHDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvtcO+aQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvtcO+aQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835C9C19425;
	Mon,  2 Feb 2026 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047870;
	bh=VrUiLq75DGzOguYtbXE6XDIwgQv8ey6yUw/4kWmprNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvtcO+aQ9OQr4h7jVSo1frzhSOxnbEFza5TzKINdvokRgHhzCFihUKNirsH5eRqQI
	 o+nHAnSP3Eoi0bhKqFBJ3u2eSv+qnLcMX9Vd2tQiKRGw4ttIeXYOU/ERlhl5MqOJul
	 PsuLlBgmcEFXn0AuZ32ZOEVEX45Clr5tA5fO+yadkQQj6G6HdMqxFhw3mFdUjHHBXr
	 myrGdBa3SKJ4aSeOQEMvIpP8bh9ers08+Fo6MriW9fAD03sNqBn+9zezmIGd4gom+G
	 jyzYK0M9VwIuZH5OcQeH0iR1bKf5iuEY+RTC0/SsnYMbsljNln0//btttmiAeZNY0x
	 c5pO5QBbZGNjQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id AE3FCF40069;
	Mon,  2 Feb 2026 10:57:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 02 Feb 2026 10:57:48 -0500
X-ME-Sender: <xms:fMmAaRmSarQtSgkJL9ElgoWpBN4BS4MNEmLnHRHV6F99rZKMtNTTBw>
    <xme:fMmAaWC0Xz2TieQ8kW0LBdV-hQQhv6v2aDnvjoEeS8YkOBLp3bjHiuklagKlCPa9b
    dWwlqPSveHajPxdOf6gFL3XuztwNv7CRGxmfxMKjoKNaXQmsC2yTAc>
X-ME-Received: <xmr:fMmAaRzu-6Ov4o68ZrAs1fsMHIkekcEygHLprxa3NZwsSl9ugG7hi-6TLMrNdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:fMmAaSfdJDEPUUayeRq0_IedMJFA63QZZDNwuXMpIlsxg_PtDbT70w>
    <xmx:fMmAabwdEqLjU_0sxb900rKtA_5hXCpvTfDBPBc7EdbygooWNN7YqA>
    <xmx:fMmAac4UCTbwO-KzGoscML5ay9adm1RDBg-oUftUQLU47tQtNdtsuQ>
    <xmx:fMmAaYxX3Ch1V6RubEzj8Zil73pfO2J9zLr5vSfJug1YDdj_fvfEzg>
    <xmx:fMmAacbukOcaweQH080ju9vu0XhOswAzy5C2A4J3UVL_JveQqEs5iY8B>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:46 -0500 (EST)
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
Subject: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Date: Mon,  2 Feb 2026 15:56:24 +0000
Message-ID: <20260202155634.650837-9-kas@kernel.org>
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

