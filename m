Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4D32A3C8
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766039963; cv=none; b=Lut90KNJi9YeuTEUytQ6g2liZpkJtbL/iIMh6VMzzCwjiBl9Q1IIvUTiWOizdZxvg5lHtYQE/1ssbGZG21h2mSjr1pdl5VXxvXHmCTqlwQSZbSLSyYMvxlstmk3coKTAaYdfmUiZjslzmW4/6PGFWRAyjfLqgw/uQ56MfZoCBxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766039963; c=relaxed/simple;
	bh=kqqGpZJvETk5VgeuM8owEKYBHlA4uDZLwRKjbsztfMM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RkYQ0Td+nD/fkzk3HzEVmaGtxtBk5j7AGRbO7N9C9W5aF9G8p3g59ta5kfAF2iVkeMMGdFDQx/e9PbmIVcc/N/hghXaiGpYvqUU6ZE3q74VhUcfbjcVKTYCgxJQy3J7cxJNowI8ucav0PiBnMNUd4KRYsLDYf3XUBSNvqtwaZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=DtwNyro9; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="DtwNyro9"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=RURcNCeCYd6BsieRLTf6v+zeOuKA6NvzwDD7Kc6byDw=;
	b=DtwNyro9PTaw4nhSkXQejzfAqp+HqjhtOrAViG4+R1UC0mO7kCHVdmzlGFgfRsv1YizLXWDhJ
	RXX1Ovsk3xLzSF4lELvWYjXXp6+ME2dT6jKWhIGmFW6H1DUN6pV5WGcU/yNNPvk+Cz3xlBn8Umi
	U4O2riFcdS4gUjUk1ewXwCE=
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dX1Db2T2YzYlQ6R;
	Thu, 18 Dec 2025 14:37:19 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 14:39:18 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 14:39:18 +0800
From: yuan linyu <yuanlinyu@honor.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
	<loongarch@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, yuan linyu <yuanlinyu@honor.com>
Subject: [PATCH v2 0/2] kfence: allow change objects number
Date: Thu, 18 Dec 2025 14:39:14 +0800
Message-ID: <20251218063916.1433615-1-yuanlinyu@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To w025.hihonor.com
 (10.68.28.69)

patch01 use common KFENCE_POOL_SIZE for LoongArch
patch02 allow change objects number

v1: https://lore.kernel.org/lkml/20251218015849.1414609-1-yuanlinyu@honor.com/
v2: remove patch02 in v1

yuan linyu (2):
  LoongArch: kfence: avoid use CONFIG_KFENCE_NUM_OBJECTS
  kfence: allow change number of object by early parameter

 arch/loongarch/include/asm/pgtable.h |   3 +-
 include/linux/kfence.h               |   5 +-
 mm/kfence/core.c                     | 122 +++++++++++++++++++--------
 mm/kfence/kfence.h                   |   4 +-
 mm/kfence/kfence_test.c              |   2 +-
 5 files changed, 98 insertions(+), 38 deletions(-)

-- 
2.25.1

