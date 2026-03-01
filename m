Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B861190664;
	Sun,  1 Mar 2026 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330687; cv=none; b=cLae2l6JnMngFVJcg5WI0LExWu8lHj4+on3576jzIIVuK7KFnbY2Sx1ntz6CX6v4+t4swNEhRH0LXXEwwZuapA0aOP7sQGATm1OhrxMfUmI1KKCTMG1TVma2NJ1+mKtsaT3msbYHuNjnV/9fpqCHwSNZHhCKb4reYAFRLCJqDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330687; c=relaxed/simple;
	bh=hjLn9EXI0Fw+QclW6rEZPEsdo9yUjI7qMP0eDAg7CGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lETPdh+0UXDTGzG/A609t45LlnMtyvLa/dmeBCr96ETR3FKXK0yxbLpOY2QC5TQWfTRfsToiTp2+btHIgJk47e51zqSHlZdwmcfF3WlJ5ON9gMlgNBFmoiyX3uG9nBRa+gkuOz+ovU1TmuJZ6BWhq0tRCwW9c3cVd3rsLwdWdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMYpQSgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMYpQSgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B831C19421;
	Sun,  1 Mar 2026 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330687;
	bh=hjLn9EXI0Fw+QclW6rEZPEsdo9yUjI7qMP0eDAg7CGU=;
	h=From:To:Cc:Subject:Date:From;
	b=lMYpQSgIWJupfP5mnKOjlXEjcIW2uw+MAzB3GvxlVPUKo+46mGh+VghSN/6g50I3h
	 rJACdkc5vcyQIIoBTGISLHdXEjQJ9MSRHTZixkTZ+m1pOHJkfonK7L/8xaCcOI6jcy
	 Ex1zt2/QASHvuYQ9wjirZfQ8v0JTi1I1HmFtlAUlJk1IV18XN7oPJvObKiacUthMib
	 KfEIsNb2EWla6p+A2DONVF7rN2oc/C/uDFD8XUReZhjpDk8Bh98IL9nN6AfL8jCLbg
	 kIqGOd6kRwu9JlG1ZdjZzBIAx0RFTO8cP+BXp1FSHWJsVQ3tAmm7cgtsu9yMiQFaK7
	 SRYbHLLhW1d/Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chenhuacai@kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Prefer top-down allocation after arch_mem_init()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:04:45 -0500
Message-ID: <20260301020445.1733262-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




