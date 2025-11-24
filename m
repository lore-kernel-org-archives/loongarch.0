Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A82F5A30
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976433; cv=none; b=a+u57+FOXYJQicoXDheU2AQRrn28D1Z/IvtpMu3x0Lzg8xnJPcT2xlaE4Gqi8JaJIk5yB3N1RXUKHbeMBAEWdu8lVq2yuKE/CXsDCavXtw+U0dkc0kKWezuJudHz6TPFZzT/Y90irWp+59RfZSVeBQldA5c2WYMCSoaybXEufN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976433; c=relaxed/simple;
	bh=DA50pH/bH7RkpXFI/IVMIlEZTs3ulo+9xZt4InyaF8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BfOauqXOAHDPS1wH4OpmHzLDl6p5VenYiCZL/rpvwg8V3lUetmmUlf1DU7MKqZPxe+RzYkC8Mk7HB+TCZg33wHV6oG5x20ZTyEK75G1s1flHdu9Fikp2Zzp0gxgqS3pBrZvzDiNB0uZyrJAVyj3qQbMFVYGq1AHGhz7yZMff5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZQfTV7FJ; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZQfTV7FJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763976428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c2MmwLtyNn3QPKov4Wt478LY9eJ7kFXDOMhNB2ZB3vE=;
	b=ZQfTV7FJ0iCAOcpiaP+ajlMKrMphtDsVC7ggc2WWI/lMhOEmtPjG6lb6ddXtnAZgnpWA4q
	0V/d4bAkNa19TtcPR7zwgun1PVGDCmOvdAvH5r/MEc04KfsUWkALSOGaqraqyKVnL/I60P
	FLuhkdOHUp89NKSxD6Zj2xUPilICsyc=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH v2 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v2)
Date: Mon, 24 Nov 2025 17:26:28 +0800
Message-Id: <20251124-2-v2-0-b38216e25fd9@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQkJGkC/02MQQrCMBBFr1JmbWQyNlVceQ/pwmamdkBSSTRUS
 u5u7Mrl+/z3VkgSVRKcmxWiZE06hwq0a8BPt3AXo1wZCMlZS2jIMB5OHQ3kx46h/p5RRl22xrW
 vPGl6zfGzJbP9rf92tgbNEd3Avm3RObw8NLyXPUuGvpTyBcp6t1CSAAAA
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763976426; l=2242;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=DA50pH/bH7RkpXFI/IVMIlEZTs3ulo+9xZt4InyaF8g=;
 b=zQkTj1f5lawY/7uZKqJbSGUb3tTBFvJsNIbHy9B3asj1ZR0OVurqzq5AYz+WLiiPYvzFHbDaD
 eRv2hTgHdu6CrHq1GYeKIBSJti+1OZXHEZC8W5n3VpLPainOl2WNtWC
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
Changes in v2:
- Use a normal ld.d for the high word instead of ll.d to avoid race
  condition
- Insert a dbar between ll.d and ld.d to prevent reordering
- Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to __cmpxchg128_asm(ptr, o, n)
- Fix address operand constraints after testing different approaches:
  * ld.d with "m"
  * ll.d with "ZC",
  * sc.q with "ZB"(alternative constraints caused issues:
   - "r"  caused system hang
   - "ZC" caused compiler error:
     {standard input}: Assembler messages:
     {standard input}:10037: Fatal error: Immediate overflow.
     format: u0:0 )
- Link to v1: https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linux.dev

---
George Guo (2):
      LoongArch: Add 128-bit atomic cmpxchg support
      LoongArch: Enable 128-bit atomics cmpxchg support

 arch/loongarch/Kconfig               |  2 ++
 arch/loongarch/include/asm/cmpxchg.h | 47 ++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
---
base-commit: d5ae5ac32615e4af729f0610fdc11ff4f4798aef
change-id: 20251120-2-d03862b2cf6d

Best regards,
-- 
George Guo <dongtai.guo@linux.dev>

