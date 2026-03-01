Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC22FD68B;
	Sun,  1 Mar 2026 01:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330099; cv=none; b=PQMur3EoMI517Tisj4sf+Gb1/zfgXASYvNHmaDpitOJF86EQNDuoUy8h3j0zx/VN8FPi+5YRsaXdCAc8jHQQobswcCDjvrKORJ5IXxFXFZM9koB5ojK0RfIPR/ocOfLQ+OEtHH/+lz+OEkZEVWnJA5oUcJ4FtuCf5YrRPD28x84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330099; c=relaxed/simple;
	bh=C92N5s+BsPNaUgBw3CxKzhrJeNjbWIBnnrLqbqdHiHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzMaxk4vrCsPeVaC+uta/R5Km0XDARYl6+P86ClUv11awvndTOVEIHCZeyNOrhZ0sXEzd3z4EkC2BfbDL4QQ2s55Mv2ltGuZiMJu8IgE7GYHTMhWyg1cmJ+7QU5FNByha92JZ3mISpOjsALCTm7kGYOpQsB+GIXmreu5lefDZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVDTDTt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVDTDTt7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3E1C19421;
	Sun,  1 Mar 2026 01:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330099;
	bh=C92N5s+BsPNaUgBw3CxKzhrJeNjbWIBnnrLqbqdHiHM=;
	h=From:To:Cc:Subject:Date:From;
	b=NVDTDTt7890YKEJFfaxtSVnCdII/9Vdca21eP3nGpGZIZ9tce03NvYRMUWAYsNnxT
	 6LLxMu97S2zGQoashTKeOPUq8WH4E4lcDoMx1Pmvkvdh3l+8H/79ocG7vMV+B6qT98
	 HsWanAZ+lOuJKMgxsr2oYJCJBaeAOYo8enC1gfQjQyQlGIKaUTJvO2qbOVDP3Tqcfe
	 nG3tUa12tRsaj/pRmqRyzq/mcdej8JdoFjvIpVQtg4BpF/qqIWR88NkZk8XoqYxDCb
	 YhKKd6PZy8Kg4lK5pAQs5x3ghH+DErgbN8qvd0cVImCCPIi3H3OaB+JB7xBnphOe7h
	 0PHRkBk82FdNQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Prefer top-down allocation after arch_mem_init()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:57 -0500
Message-ID: <20260301015458.1722056-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




