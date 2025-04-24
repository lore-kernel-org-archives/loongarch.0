Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B42701BA
	for <loongarch@lists.linux.dev>; Thu, 24 Apr 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462492; cv=none; b=bj11NWenQAMdjc+JsMB0hBZg8pISXnVaU+r3LNh6Lp60prAcT2PX/s1BWieexB9lkv/q1g6jkZgvwMyjMNPGAm1KQs7nsLXjRAy22mpg1rCcKn2bUxYnY46UevihnHgEXkDM/N6sMZSeZK466MzMbcYGYYAfmhvJY/ECNvg4Vk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462492; c=relaxed/simple;
	bh=kYXLmezIiIazMJijPp1RAe+rBuUhRwghSKpWymQjMls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T4tUDiN/7+N0KpzX04t6ii0v+A5d+bhTKgR300ISyYu1XcY1bBbVgEielS4DNCc8hjNZxa3Fi+s8xBkcRmVIkSEjkgf0YruKc4DoIQVhzIQkad43UULZAtbcjkp1VRpzw1wU5+C1DqWdXJbWji6d0LpLZa/2IHSQbIlyzov/uVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xPA0aYhC; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xPA0aYhC"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745462488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x1FjIZj/AyeeMGzGgXylzm0lB1LG5eNGhh9CQM3SJNQ=;
	b=xPA0aYhCG2jBBQM1vIuMchJEPF81vFcdZ6hwbksf+rac1O9zx6tyHaZMw6QMgR50AVnv9M
	8RbGryREMHfJOWjj2uDAcgs9YaUlYxQk8LAQRu3VSCrvMMT7MeUM3By1+GeHXO3ZHCMUX9
	Ni1Vb06VFOGO/c1IlQQ4mwihs0Nw7Mw=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev
Subject: [PATCH v3 0/3] LoongArch: Adjust the 'make install' operation
Date: Thu, 24 Apr 2025 10:40:31 +0800
Message-Id: <20250424024034.78436-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Changelog:
  v3:
  * Add a copy of the kernel config file.
  * Some minor adjustments.

  v2:
  * Adjust the patch sequence.
  * Adjust the title information.
  * Distinguish between vmlinux.efi and vmlinux.elf in install.sh
  * Correct minor mistakes.

Youling Tang (3):
  LoongArch: Add a default install.sh
  LoongArch: Using generic scripts/install.sh in `make install`
  LoongArch: Add some annotations in archhelp

 arch/loongarch/Makefile        | 11 ++++---
 arch/loongarch/boot/install.sh | 56 ++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100755 arch/loongarch/boot/install.sh

-- 
2.38.1

