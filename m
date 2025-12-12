Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B17D27E
	for <loongarch@lists.linux.dev>; Fri, 12 Dec 2025 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511751; cv=none; b=XtMM+A+xcGkvEWswBUhjAmSYDfTaZUixGMcN1ZkyZYeqvg2OCsyL95APkCs3ozkE0eiQHbe7UN3Ukvj4JK66o3hQnO0fHeLyY7ZkNabeEVW6QqzOtdqMdiGgSWXsGHOsNLBc+ae1gqG8MsppxkIeuJZ6DvnR7TlDYI/wvgKPuIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511751; c=relaxed/simple;
	bh=aBpouqqFq3RlW156AdjtLIFvfQo9y6QEH/JvkPh3ImM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M05Uc7p1Mw4IxANYlb9qvu/5+rIiJKeqqtLJZanKV3fe+80VB7cc6rdeQrq+YcRsp6+Q3gwWE44zNgfg/reJMNBfn6gaT2DUQjOU3ivRALGPjzYPx86Lhgmj6DVx+SvYVaKYrlSUlmoWP8qIentKpcVZ2wUymbFArREgBxgSDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gULj+NvT; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gULj+NvT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765511745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ns44vnQryQp7e7QQcG8h71b+Sum4wpSt+oG1OXmkrVo=;
	b=gULj+NvTLlKR75ZucBR8wJc4UD5CnnUEJVjvzd8GF0BidagMNelBYl7aCZz2pDmiE9nVnD
	hrUIdi4KPZr6Yp9jmVNs20mFNmCAglO/sSRb0vXJqtzi1esb9YpkmIttnAwvadigT1YyF+
	BwId617fi7Pe+y3M+o+VoA5rc3YuNp4=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH v5 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v5)
Date: Fri, 12 Dec 2025 11:55:20 +0800
Message-Id: <20251212-2-v5-0-704b3af55f7d@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACiSO2kC/13PwQ6CMAwG4FchOzvTdusET76H8cDYkCUGDOiiM
 by7GxeR49/0+5t+xOTH4CdxLD5i9DFMYehT4F0hmq7ur14Gl7IgIEYkkCQdqNKQpaY1TqS9++j
 b8Fo6zpeUuzA9hvG9VEbM07WOKEEegK1rtAZmON1C/3ztnY8i60hrobOgJKwqCY0nbl21FWotT
 BYqiZLRcs1oSsCt0D9BwFnoJDzXtlLpL8K/G/M8fwGWKivIKAEAAA==
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765511741; l=3403;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=aBpouqqFq3RlW156AdjtLIFvfQo9y6QEH/JvkPh3ImM=;
 b=WqklDMHgA/OOURA/EvOe69WwPaQ3FAdmIJ26zKfMkx9Y09mVihAqKP5aS299nSZzAtMWoOXvk
 MZA7THvgs55DWW7FN4LiIZMAsT10LFwGH0zqPi7ARPcgSSF4nBNrNIn
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
X-Migadu-Flow: FLOW_OUT

This patch series adds 128-bit atomic compare-and-exchange support for
LoongArch architecture, which fixes BPF scheduler test failures caused
by missing 128-bit atomics support.

The series consists of four patches:

1. "LoongArch: Add SCQ support detection"
    - Check CPUCFG2_SCQ bit to determin if the CPU supports
    SCQ instrction.

2. "LoongArch: Add 128-bit atomic cmpxchg support"
   - Implements 128-bit atomic compare-and-exchange using LoongArch's
     LL.D/SC.Q instructions
   - Fixes BPF scheduler test failures (scx_central scx_qmap) where
     kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
     leading to -ENOMEM errors during scheduler initialization

3. "LoongArch: Use spinlock to emulate 128-bit cmpxchg"
   - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
     the SCQ instruction on 3A5000), provide a fallback implementation
     of __cmpxchg128 using a spinlock to emulate the atomic operation.

4. "LoongArch: Enable 128-bit atomics cmpxchg support"
   - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
     in Kconfig to enable 128-bit atomic cmpxchg support

The issue was identified through BPF scheduler test failures where
scx_central and scx_qmap schedulers would fail to initialize. Testing
was performed using the scx_qmap scheduler from tools/sched_ext/,
confirming that the patches resolve the initialization failures.

Signed-off-by: George Guo <dongtai.guo@linux.dev>
---
Changes in v5:
- Reordered the patches
- Link to v4: https://lore.kernel.org/r/20251205-2-v4-0-e5ab932cf219@linux.dev

Changes in v4:
- Add SCQ support detection
- Add spinlock to emulate 128-bit cmpxchg
- Link to v3: https://lore.kernel.org/r/20251126-2-v3-0-851b5a516801@linux.dev

Changes in v3:
- dbar 0 -> __WEAK_LLSC_MB
- =ZB" (__ptr[0]) -> "r" (__ptr)
- Link to v2: https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linux.dev

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
George Guo (4):
      LoongArch: Add SCQ support detection
      LoongArch: Add 128-bit atomic cmpxchg support
      LoongArch: Use spinlock to emulate 128-bit cmpxchg
      LoongArch: Enable 128-bit atomics cmpxchg support

 arch/loongarch/Kconfig                    |  2 +
 arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++++++++++
 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          |  2 +
 arch/loongarch/include/asm/loongarch.h    |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  4 ++
 6 files changed, 76 insertions(+)
---
base-commit: 612df905d7404450696e979c806ba4cdef8684f4
change-id: 20251120-2-d03862b2cf6d

Best regards,
-- 
George Guo <dongtai.guo@linux.dev>

