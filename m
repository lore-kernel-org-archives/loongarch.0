Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E51DF72D
	for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 23:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022301; cv=none; b=ODR/gyRWExQXlq56yiy5xkNLvrQYQhyB+SppCwo0sziz/1ND0dAU+yz1UqZRfoFzWoxEAJTZOpNYQVyK4mWSBt7mtkRLFJEJONue5Ho6GXF29VjCk5qfMnQjHrg5M/IlLBHiZFa87PlZIzxvGABVUaowrYvizMiTR8mBIJsZJgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022301; c=relaxed/simple;
	bh=UKyBrHzuIfWiaRVs0//lIDtbpI80WUrNR7tZEChC66Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apVma7+rEyTZipwDn80d+F18rPol8yqG7cUC/Sb8RZxMeR4ydp4yItcSO4uIcZs/H8MlEb1xU8eJBSWag+JqInHEMDmyA08D+KvXQaie2GjA/RNYB1ekAxDvGsfoAkgaG1VVV4+Jr9IpOkqrDwopFXaQVN0DJaKDlK61yFa/k3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z0RWBRk1; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z0RWBRk1"
Date: Mon, 27 Jan 2025 23:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738022297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=EdcGtkZze7tE+pVbcTlvwrlzFbSwx6R7VoVNVkfrHss=;
	b=Z0RWBRk1qCHt/pyblBGpbatZZ5gpJ8JvlY/Ad7eSnhnjIv+ydvjvBFRe34x+eU+h9VRE9D
	KIwY16UdTJ9O/d8MowNdXtOoF4ohR/Ybs78VJ68dweqrJIiYI5Kger2aa8DhMIQHerGhxJ
	VTs0Lbin9AUfzHmA8RGK3OBOxTISIXw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: [PATCH 0/2] mm: zswap: deprecate zbud and remove z3fold
Message-ID: <Z5gdlO5pOu9XeGce@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT

After 2 cycles of deprecating z3fold, remove it and mark zbud as
deprecated for removal next. It was initially thought that zbud cannot
be removed because it has no dependency on CONFIG_MMU while zsmalloc
does, but CONFIG_SWAP depends on CONFIG_MMU anyway.

Yosry Ahmed (2):
  mm: zbud: deprecate CONFIG_ZBUD
  mm: z3fold: remove z3fold

 CREDITS                                       |    1 +
 Documentation/mm/index.rst                    |    1 -
 Documentation/mm/z3fold.rst                   |   28 -
 Documentation/translations/zh_CN/mm/index.rst |    1 -
 .../translations/zh_CN/mm/z3fold.rst          |   31 -
 MAINTAINERS                                   |    7 -
 arch/loongarch/configs/loongson3_defconfig    |    3 +-
 mm/Kconfig                                    |   47 +-
 mm/Makefile                                   |    1 -
 mm/z3fold.c                                   | 1447 -----------------
 10 files changed, 17 insertions(+), 1550 deletions(-)
 delete mode 100644 Documentation/mm/z3fold.rst
 delete mode 100644 Documentation/translations/zh_CN/mm/z3fold.rst
 delete mode 100644 mm/z3fold.c

-- 
2.48.1.262.g85cc9f2d1e-goog

