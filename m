Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DA2EFD90
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 03:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767152735; cv=none; b=YHPkSjh4SdOig4MLWCAd5rGY5UiGr+P2krx0pMOhnOsCSPd/LQgp5H6Fc93+ME1nIfU7ZuyRUK27EUZR1jmuPdWhyuRBerOpkAyIWIB1gxXyyHz9twE5zgc5sTw0yUR3YyNpAu36OQiEzaphMXOcyKpQJ6WnWRvpP2srLVyp2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767152735; c=relaxed/simple;
	bh=dHY8vuDc14Qz5Y3O5TXS9xeQrDUVtZy2CW0aMZbYpRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTYyewYRz0D9Jf/JIYTvsyYI+EGRLeuGAMGFvcFhimagmLT1NJUwxNzqqFLSCx+dA/w2RnBQCbXOsPrKHKzIHXr+/7NrRlnzn1i9261IO+AfBjQ6mDl7euznrSETWYj+e3J/F/yEoOkOOKEfR+oOPt1sOJ1ZgoS9DD6Dhlhwd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PW9LXDPM; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PW9LXDPM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767152729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QPOqYkSWtbtYlR2mfyJRRqstoYEJTm9ILg51phHuluc=;
	b=PW9LXDPMCR9KJyqAdoIeGyj4cYYpwyA1oLHT2sPU1fihaBoaz1surK+ufXvpWuXl8j//Z7
	sqTJNznOJdNxAQD5DmTDNpKBWT7fQNHVCtClX+1ZiXtXEfJuHbBwiieo/b7jvdFxPzEKgl
	oNKKuntAPgMEtxR2bWhvLoApYJfupPw=
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
Subject: [PATCH v8 loongarch-next 0/3] LoongArch: Add 128-bit atomic cmpxchg support
Date: Wed, 31 Dec 2025 11:45:20 +0800
Message-ID: <20251231034523.47014-1-dongtai.guo@linux.dev>
In-Reply-To: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
References: <CAEyhmHSi1LPW75Ovt=M8-8sv1S2LRmZw_YduJt9OUoy+OMSjKg@mail.gmail.com>
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

The series consists of three patches:

1. "LoongArch: Add SCQ support detection"
    - Check CPUCFG2_SCQ bit to determin if the CPU supports
    SCQ instrction.

2. "LoongArch: Add 128-bit atomic cmpxchg support"
   - Implements 128-bit atomic compare-and-exchange using LoongArch's
     LL.D/SC.Q instructions
   - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
     the SCQ instruction on 3A5000), use a spinlock to emulate
     the atomic operation.
   - Fixes BPF scheduler test failures (scx_central scx_qmap) where
     kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
     leading to -ENOMEM errors during scheduler initialization

3. LoongArch: Enable 128-bit atomics cmpxchg support"
   - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
     in Kconfig to enable 128-bit atomic cmpxchg support

The issue was identified through BPF scheduler test failures where
scx_central and scx_qmap schedulers would fail to initialize. Testing
was performed using the scx_qmap scheduler from tools/sched_ext/,
confirming that the patches resolve the initialization failures.

---
Changes in v8:
- Merge patch 2 and patch 3 into one patch
- Put HAVE_CMPXCHG_DOUBLE in order
- Link to v7: https://lore.kernel.org/all/20251230013417.37393-1-dongtai.guo@linux.dev/

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

George Guo (3):
  LoongArch: Add SCQ support detection
  LoongArch: Add 128-bit atomic cmpxchg support
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
