Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F72EA480;
	Sun,  1 Mar 2026 01:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329604; cv=none; b=dkLnBHQQ+CWxjT3mXOJ1ZpZ1DCBhGP0ZW6pAJXgXp5ClaMtPvtQfBRLOoxnskiUIxTokSQlJY3X2dsES7yxxPmUtjuUrL17XvG4JgohsX81Nouep60W3NITnQTFqzJUXpcvuKzFMQyECea577lU0MnVhoPLLa3EJb8b7PILpDao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329604; c=relaxed/simple;
	bh=/ESP39iXWkJ34gV5s/WtaQBZsFZmDzvzo9LjJyBY9UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TqdMlvtg0EUxZMU9CQo4hsAZx5oJJN+EqGTHxNsbA7tY0bxu3BC40LvmRloV3diSsilKn5JwbzkF4bL9IKWBsbBPd7E3jVArs/LNDjeAo58ewNoWlvpO3oRkeueqIpTZbs349jV6fqcfpKHNBO/PPc3FGC35XW7bC9xu4nFr1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzzioFi+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzzioFi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C3C19421;
	Sun,  1 Mar 2026 01:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329604;
	bh=/ESP39iXWkJ34gV5s/WtaQBZsFZmDzvzo9LjJyBY9UM=;
	h=From:To:Cc:Subject:Date:From;
	b=gzzioFi+FJXaaYW2dekXrFlZ/agpi8ix7jwukdWk2ENBFPL3QDkW5C4HYNp/yzcdN
	 rnhREwR5VMu0wceWc5YtAbb1/YzQ/TZpeOM2e82rlcri2C+gK+TTF/18XT36+VwwYL
	 O8VSqvNqlbJZFS4lqOtbuu/G3aHWLZqUjWh/iq+fph/fB8ciFa+jEMth6QTncNsDvw
	 Wp/NkkoHRfrMI0BZg2zh8JCrn7o5/lcbgMOBhJjPLFsCuASrG7Hkk7+qXh5i2WWTTh
	 en4/+srJnfmGI+pT8JgzHTbVd7rHFxIcuLjJTm4mBvkl3F5e7mP7nUbuKlwYKs8pO0
	 RnZtXok7g5Y+g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Prefer top-down allocation after arch_mem_init()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:46:42 -0500
Message-ID: <20260301014642.1709744-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




