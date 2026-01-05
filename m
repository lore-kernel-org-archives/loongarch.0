Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686D13191B5
	for <loongarch@lists.linux.dev>; Mon,  5 Jan 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610528; cv=none; b=dWWBE9ieJOuxAH28JZAiwugF864kkz14bKHhWduZOs6aKIy6QGenGyGB57B6NHwVU9GQDZ+6AITn/mOnyoyFuoXRNKsBNkfmSbMCnw7kOjSzwqbSnVRfbTMzJ+VwggjAY9N/cg0o+gsRxzYpRflGK9Jgj8t8Kv3JJ7nAd9VpCKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610528; c=relaxed/simple;
	bh=z6Zsp4yhm/TAhu+hPdzU6Xs6nrm252Vdvd1s3frn8fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/MMwBkBY4Y7q4LMxVNzX+lDgVeDqUpRFn+bEXEH+nJJCieEG3xB8KAEY+7Q/heeOodbsaMK+qKGMAHDC57SuiUOZUiUKd8HYRJaRGSlN64RF+PmbuiMO9O5csyp7Zli5ikCgRuAXkESa0+gzw+cLsRMoJ7xVMECMT+EboSiCO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dbJrh1YG; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dbJrh1YG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767610521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wQnQfAWCUYP/2UM2nUNNETdZktGnsn4jfMUlmRZCHOo=;
	b=dbJrh1YGaFCUS1XcVbDrFbnUrMG0xA+A0Pcz+YKsLrOeLmtRojxiDLNaxDrrLlBmXrA6gV
	jFengM6gzvF9//aUeiWMy6hsiDeqXtWq8IuY1J1g/NJl8qdDll65RWjDS5hVHeUhHlcrds
	DjcX+b5NZDsGrVUTLP1eRW0F/P1AmWU=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: dongtai.guo@linux.dev,
	hengqi.chen@gmail.com,
	kernel@xen0n.name,
	lianyangyang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	r@hev.cc,
	xry111@xry111.site,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH v9 loongarch-next 0/4] LoongArch: Add 128-bit atomic cmpxchg support
Date: Mon,  5 Jan 2026 18:55:10 +0800
Message-ID: <20260105105514.76021-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

This patch series adds 128-bit atomic compare-and-exchange support for
LoongArch architecture, which fixes BPF scheduler test failures caused
by missing 128-bit atomics support.

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

George Guo (4):
  LoongArch: Replace seq_printf with seq_puts for simple strings
  LoongArch: Add SCQ support detection
  LoongArch: Add 128-bit atomic cmpxchg support
  LoongArch: Enable 128-bit atomics cmpxchg support

 arch/loongarch/Kconfig                    |  2 +
 arch/loongarch/include/asm/cmpxchg.h      | 48 +++++++++++++++++
 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          |  2 +
 arch/loongarch/include/uapi/asm/hwcap.h   |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  4 ++
 arch/loongarch/kernel/proc.c              | 63 ++++++++++++++---------
 7 files changed, 98 insertions(+), 23 deletions(-)

-- 
2.43.0

