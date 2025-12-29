Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3732690D5
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766990058; cv=none; b=uhYc5KvasoSUjZACo0vG49lqgJiFCL0Bez/QJblfET2TIGz9HtGzOpkn4E3Tzx9qLo3VJ7z/H7td9VTfKEvArHzAsNCGV4xOxvkgcYxKbC5h+B9BVekZHMx8vWqkIHKd0eG9EvjhjHF0zeNlvxO6syM3F3gBe/mbWWq4IKcwf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766990058; c=relaxed/simple;
	bh=6boA3ZWB9oJFiDIyxkcqSh7TvGT8YUsUKBRP6gaUXaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAkwOG0jIxOd5mVwp/iIqbG7yXOyt2JiIlKIPmG73Fougr/PaoxV+ratuVp8K48BdqyWPVuiae5TXcGiFqCuADoZO1F3DM+cF2FPpVjD0yhJk7NE5LoKjjIDso0RmgbxOzszH8qzdTrM/wHum3panw2E/UH59Zv7GyZjgJkEDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dTuyAego; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dTuyAego"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766990054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W9CQvd246sBg51rNnipTH/lFzsQHUXhZOLDbZlYaRw0=;
	b=dTuyAegoJbg+Q+tPnZoJf4a6MF5nPBCYg6lL+V5a/vNwM0QOXm1pNeCoMaN1xpo2A3PHEy
	BJrVyktEwWELWg9FwHD1poHn+W2EUd1fVzfgWSejvoPHDm5V0NfRKQj8swak+q+ypPHV2p
	4zmczcOvVzAxHZ+xCxNSwT0B4GlRgN0=
From: George Guo <dongtai.guo@linux.dev>
To: hengqi.chen@gmail.com
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH loongarch-next 0/4] LoongArch: Add 128-bit atomic cmpxchg support
Date: Mon, 29 Dec 2025 14:34:04 +0800
Message-ID: <20251229063408.34340-1-dongtai.guo@linux.dev>
In-Reply-To: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
References: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

---
Changes in v7:
- Create patches based on loongarch-next branch(previously used master)
- Link to v6: https://lore.kernel.org/r/20251215-2-v6-0-09a486e8df99@linux.dev

Changes in v6:
- Put SCQ information in hwcap
- Link to v5: https://lore.kernel.org/r/20251212-2-v5-0-704b3af55f7d@linux.dev

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


George Guo (4):
  LoongArch: Add SCQ support detection
  LoongArch: Add 128-bit atomic cmpxchg support
  LoongArch: Use spinlock to emulate 128-bit cmpxchg
  LoongArch: Enable 128-bit atomics cmpxchg support

 arch/loongarch/Kconfig                    |  2 +
 arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++
 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          |  2 +
 arch/loongarch/include/asm/loongarch.h    |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  2 +
 arch/loongarch/kernel/proc.c              |  1 +
 7 files changed, 75 insertions(+)

-- 
2.49.0

