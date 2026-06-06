Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494073AA1BD
	for <loongarch@lists.linux.dev>; Sat,  6 Jun 2026 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780751695; cv=none; b=ZCVE+fJlMrJM6bgoNsGoAqMQZOFD7R2fY4RtPuzpZLfNwHxmbp/WWbsvW1NHRCG4IurIgFbiSgHwhew9yCv356+xuWggOFYFHwgoBFgo5bEBGVhWG2xdRGxe2WVpV9p3Varw+IO5FtuEDLPQNwBcgORH817ZR/EiMqRifAgOdO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780751695; c=relaxed/simple;
	bh=n/dmJcwAlYP80UgO4ZliSjWaWfoB9llr+nuRbEqyoL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nYT/739lBtsV8GwuKZP+lxFvMAAhEyw4Gv0fOn+UPyyy02K6JPcJVoW+MThrQnJOVmbIoWs12n3uHrVzOoBTKbKom+hBtbKKJPvqvNECTHCDCLlNuKAcHwb5IaCTXJBp5ENrWdCDhJD+LIt3i05Wkfeg3nrlMr7JrWqq9HIk63c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H7dEq5dn; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H7dEq5dn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780751691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pUV16/KrOSXctHytp2Z+71A3yfsDU0xkazrGXbOwKNs=;
	b=H7dEq5dnArukaZOqLOVkAVPtXfxTBS8ldKZrBozL384h7OdwIyNPSplHNZx31Ex1bQTEM8
	4Sg1lFNliSUalEVeehZDdmnOT8lm9l2yfkmN6U+leGvSTTf2+stHmljzYqzsS3ijVxnRFm
	79EX47W+A6cPq4LMCL1C5gtjJbbQO/k=
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
Date: Sat,  6 Jun 2026 21:14:17 +0800
Message-Id: <20260606131419.552265-1-haoran.jiang@linux.dev>
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

