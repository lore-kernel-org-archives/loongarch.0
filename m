Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88233451AA
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 13:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768050705; cv=none; b=cKmZYnMQT4DDiAgUZqmW/sjEl0dGj6Bboivoa9lYpw/UPqAbvuiNCzfZPHGRIHfW6W1hw4a3VjsNilb+C1gKj1afFiBtBDCSXJAwBrxt7p+a9mvWj4u6XwDsii3Z3gane+UVMfWJQoP1lErnL8MhJ612nVQWBGSDI46460eWcgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768050705; c=relaxed/simple;
	bh=J2IVgzJ6blEy63YKWcSWqTmVo7lMKAhKlXsN2aNI/lM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+C9nAMLGrc5Pc72QbL1hJNj8FuL5glLrWKi+AtugKagz2ktPPRCarhN1/ambhDnSMN4P2r7qKdsZVdzC74zTcrjB7AUyBwJziq9GzIUG8Mmit7P62BenBsMNl5iETBrg/awjlFC0Mx7bjTYgB2meg6lwp4/OiKCrYVkvTX9mSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ncZirBkT; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ncZirBkT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768050692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AUOmZhlzJcqXzIqUoj+1yn+oO/ziUdSpeO4uzCbP690=;
	b=ncZirBkT5kwRYvITMDUedsjLzEJePN3uWbxUvBY+tdCY7dF7XO3OkDEZOgdgkPrbJLWftA
	rCoVZixaOV4UzS08f5zwrvfIP/37zDfryNbwp4vZrpkWH6M0ZqFWcFL2h32k69JcRxu3ur
	DxCFVYJo70NDkVTUWEGaSgEKa0Gme9k=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site
Subject: [PATCH v10 loongarch-next 0/3] LoongArch: Add 128-bit atomic cmpxchg support
Date: Sat, 10 Jan 2026 21:11:21 +0800
Message-ID: <20260110131124.99866-1-dongtai.guo@linux.dev>
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

---
Changes in v10:
- move "scq" to be placed after "lam" 
- squash last patch 
- move patch: "LoongArch: Replace seq_printf with seq_puts for simple strings" to the end
- Link to v9: https://lore.kernel.org/all/20260105105514.76021-1-dongtai.guo@linux.dev/

---
Changes in v9:
- Add patch: "LoongArch: Replace seq_printf with seq_puts for simple strings"
- #define system_has_cmpxchg128() (cpu_has_scq) 
- Delete __cmpxchg128_locked
- #define HWCAP_LOONGARCH_CPU_SCQ (1 << 15) in hwcap.h
- Link to v8: https://lore.kernel.org/all/20251231034523.47014-1-dongtai.guo@linux.dev/

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
  LoongArch: Replace seq_printf with seq_puts for simple strings

 arch/loongarch/Kconfig                    |  2 +
 arch/loongarch/include/asm/cmpxchg.h      | 48 +++++++++++++++++
 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          |  2 +
 arch/loongarch/include/uapi/asm/hwcap.h   |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  4 ++
 arch/loongarch/kernel/proc.c              | 63 ++++++++++++++---------
 7 files changed, 98 insertions(+), 23 deletions(-)

-- 
2.49.0

