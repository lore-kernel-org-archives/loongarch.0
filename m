Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB086214A9B
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752115; cv=none; b=ZBrNxT9awuS15vvohdlUe4tFy0QiPcEcRUIGJPeZRKSNb/5i8YbSNTaXysGR6E73niYV4cif6XsuGNXokVfF6/fXT1h9WSla0OiwByexIC/3onPYkcG2ZEDMp3flinZLhxcZlMQJBTSFlpmMMFoyGzpZ2NkMo9lCpu63AZ1xNsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752115; c=relaxed/simple;
	bh=n/dmJcwAlYP80UgO4ZliSjWaWfoB9llr+nuRbEqyoL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ao/WEmZCzoDklrP04FLyDXk1U+c9ZYBbrD3ESx0AWqFIrU+cIFwzfmGe3WFYBkOXzCQGxcnUX5zYQZCCJ65FJ9c/ltCLOrAYKGe6RkCf/NOR6hicVXrC0ec8DBAbzniqK4s+ThGqsPKhYZIjan0zZXDYqyaGOkRln9eChKzPR8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uNDjFDHL; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uNDjFDHL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780752111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUV16/KrOSXctHytp2Z+71A3yfsDU0xkazrGXbOwKNs=;
	b=uNDjFDHLlSLfMsF6MhO2Uk1MQT/IJAARVWcK43t6pE05Mc6dkzeOyrYbJBgbuyMrThhFfa
	zVSCmPq1O0NMfpbR/xTAN581QvJr/S19SiYoX9dszqJ7Bx7WMMfC+h2uGFWSRYp/ZpN/U9
	eejBBThfIHQXtrdwsLonXKMQfFL0iac=
From: haoran.jiang@linux.dev
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	jbohac@suse.cz,
	kees@kernel.org,
	yangtiezhu@loongson.cn,
	Haoran Jiang <jianghaoran@kylinos.cn>
Subject: [PATCH 0/2] Enable STRICT_MODULE_RWX
Date: Sat,  6 Jun 2026 21:21:24 +0800
Message-Id: <20260606132126.562034-1-haoran.jiang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Haoran Jiang <jianghaoran@kylinos.cn>

Enable STRICT_MODULE_RWX on LoongArch and
Move fixmap page tables to BSS segment.

Haoran Jiang (2):
  LoongArch: Move fixmap page tables to BSS segment
  LoongArch: Enable STRICT_MODULE_RWX for stricter modules memory
    permissions

 arch/loongarch/Kconfig              |  2 +
 arch/loongarch/include/asm/fixmap.h |  2 +
 arch/loongarch/kernel/inst.c        | 29 +++++++++++-
 arch/loongarch/kernel/setup.c       |  1 +
 arch/loongarch/mm/init.c            | 71 ++++++++++++++++++++++++++---
 5 files changed, 98 insertions(+), 7 deletions(-)

-- 
2.25.1

