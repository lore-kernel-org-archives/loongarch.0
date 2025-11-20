Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA37A92E
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624772; cv=none; b=atGwrCIqxnb5xbWW2nDH5p6MloPCl1Hilt9N5lJoEj8O+yV8edruScLIET7gOZ5ZayWHKo7DB3FbqJaloRivwc2PU8YqKObLWzBORbve/l/n3A23JJ81YnNmc1ErZbjSbeTBiTs/Nk86vq6emgBKDRRm8fFxA0bimZOaKze22qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624772; c=relaxed/simple;
	bh=p5XiOVhym3OuRZaS8Dmic/3wN5baDwTiofnmYEQWhFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ILSfKVl2cjbFDvgSmbxT7HWQbJhD5sn2PbVEHbRIGjbIU5jCVpDyEU5eVA9TzkH4IrH0gwQFDenXFAIZvMy3bJ2B2riPSGKqyOYQIVub6yjkdVGgakYG0++ZTta2VNXzx6GPr9IdlzM1YF0VzG9JtlJRqAxbJpkFwlDcaXhk3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MdYHbV73; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MdYHbV73"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763624764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=09ux0ObWAtSprUQ6j3/PUauALBoIBJ5o1DLyjVAcnmE=;
	b=MdYHbV73QqectavjlUz6Oran7dLON82jn+wytINAEJLNW9wElw5jHDRyVj9DIozsbVXkvZ
	JWVmuUfZv+QJPPcJ/OBb043YoNcDUyKmzzOQog/9pR3Tj6K2Ch6DBVOZDS12nntA63yQyE
	TtMDF5amUIUUaocFf4gwnUXaXAUOM/k=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH 0/2] LoongArch: Add 128-bit atomic cmpxchg support
Date: Thu, 20 Nov 2025 15:45:43 +0800
Message-Id: <20251120-2-v1-0-705bdc440550@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfHHmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMDXSPdFANjCzOjJKPkNLMUJaC6gqLUtMwKsBnRsbW1AEnU8gpTAAA
 A
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763624762; l=1549;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=p5XiOVhym3OuRZaS8Dmic/3wN5baDwTiofnmYEQWhFs=;
 b=Dn8lBiHYsgDoL8T0usGs/CJIKfGmFjfk3Dprs8qdI0imt/QqSqQq7kSJXHonqODqIgmdlUL8W
 JZrEM0W1QrgD2HBjQaKragVga8Vd9NzqVm1v5rfyorPFBEH7RmA4GqP
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
X-Migadu-Flow: FLOW_OUT

This patch series adds 128-bit atomic compare-and-exchange support for
LoongArch architecture, which fixes BPF scheduler test failures caused
by missing 128-bit atomics support.

The series consists of two patches:

1. "LoongArch: Add 128-bit atomic cmpxchg support"
   - Implements 128-bit atomic compare-and-exchange using LoongArch's
     LL.D/SC.Q instructions
   - Fixes BPF scheduler test failures (scx_central scx_qmap) where
     kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
     leading to -ENOMEM errors during scheduler initialization

2. "LoongArch: Enable 128-bit atomics cmpxchg support"
   - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
     in Kconfig to enable 128-bit atomic cmpxchg support

The issue was identified through BPF scheduler test failures where
scx_central and scx_qmap schedulers would fail to initialize. Testing
was performed using the scx_qmap scheduler from tools/sched_ext/,
confirming that the patches resolve the initialization failures.

Signed-off-by: George Guo <dongtai.guo@linux.dev>
---
George Guo (2):
      LoongArch: Add 128-bit atomic cmpxchg support
      LoongArch: Enable 128-bit atomics cmpxchg support

 arch/loongarch/Kconfig               |  2 ++
 arch/loongarch/include/asm/cmpxchg.h | 46 ++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
---
base-commit: 8b690556d8fe074b4f9835075050fba3fb180e93
change-id: 20251120-2-d03862b2cf6d

Best regards,
-- 
George Guo <dongtai.guo@linux.dev>

