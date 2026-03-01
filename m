Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A4285C84;
	Sun,  1 Mar 2026 01:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328454; cv=none; b=MPm9A0dgNiN7flveWQrnpXl1XjTHstwezfKmyz/7HBLgTVruqc7EAlrhtSn+RLHB35Nz8uBJz6r7rrq7NHVSEs6F4rUAI+iAUyLx7EsL8H7CIxPMb9QGWpX1Q8nCl7A+2O7RV6hIGSJMhU2QiMq8dHbbhkVaeDfavDCyeawLFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328454; c=relaxed/simple;
	bh=Ez+yC1hvMRvZjnfxUg2X26xj5RoQS51Jad7159fXQsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bi8+/5LcRY5StwyI/YQKZiLnAButEWTDFrm36z2TNUHdl2aP1g50qP3prIWsc3rSvJ687L+Mxs3f5u9Fhv7l4MF2TuOWiGoOkisz5y/KgLij6g7qJnil8NjHeLtOnFvasAghIfiUHKDf3oCloCMBiY2dR9zDGe9yJ60c2XgFZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCXzVa82; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCXzVa82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414E3C19421;
	Sun,  1 Mar 2026 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328454;
	bh=Ez+yC1hvMRvZjnfxUg2X26xj5RoQS51Jad7159fXQsA=;
	h=From:To:Cc:Subject:Date:From;
	b=PCXzVa82kl0/W7qOc+JsfcSJrQJvBwEdkSAsqQC1yiudGpg5qnfn2TBGrNaAR/5Q1
	 EhPMr1JQN2RhFsacAp4ZUslN2oXtZQMsiK4EmMYEETWWvfAR2a4msUWDLMOBm+OkaZ
	 ZBQps4YDfU7zvDW5HwS98gijnurHTgMIjkaNykwXgI3sbSkipGhzfjcvx0Bgz65cjP
	 OHbRZy9Ml8QKvwUlm9EWwKIq0a8YewJiLurbd5HSsAHY090NFbtTg5uAV2jCqpCyrU
	 fqQlw0FdwFRdg7dG/g3e6Ar2CvMce8NeVYnPE4YpdS1PPSoPpwKkBIyqOPlVMFizcu
	 GmWFyfOC13RgA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Prefer top-down allocation after arch_mem_init()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:27:32 -0500
Message-ID: <20260301012733.1685068-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 2172d6ebac9372eb01fe4505a53e18cb061e103b Mon Sep 17 00:00:00 2001
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Tue, 10 Feb 2026 19:31:13 +0800
Subject: [PATCH] LoongArch: Prefer top-down allocation after arch_mem_init()

Currently we use bottom-up allocation after sparse_init(), the reason is
sparse_init() need a lot of memory, and bottom-up allocation may exhaust
precious low memory (below 4GB). On the other hand, SWIOTLB and CMA need
low memories for DMA32, so swiotlb_init() and dma_contiguous_reserve()
need bottom-up allocation.

Since swiotlb_init() and dma_contiguous_reserve() are both called in
arch_mem_init(), we no longer need bottom-up allocation after that. So
we set the allocation policy to top-down at the end of arch_mem_init(),
in order to avoid later memory allocations (such as KASAN) exhaust low
memory.

This solve at least two problems:
1. Some buggy BIOSes use 0xfd000000~0xfe000000 for secondary CPUs, but
   didn't reserve this range, which causes smpboot failures.
2. Some DMA32 devices, such as Loongson-DRM and OHCI, cannot work with
   KASAN enabled.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 20cb6f3064568..2b260d15b2e25 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -421,6 +421,7 @@ static void __init arch_mem_init(char **cmdline_p)
 				   PFN_UP(__pa_symbol(&__nosave_end)));
 
 	memblock_dump_all();
+	memblock_set_bottom_up(false);
 
 	early_memtest(PFN_PHYS(ARCH_PFN_OFFSET), PFN_PHYS(max_low_pfn));
 }
-- 
2.51.0




