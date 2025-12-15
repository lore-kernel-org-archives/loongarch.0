Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539A1CF7D5
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786958; cv=none; b=h51hOgeiFPWqm4DoO+5CNcct6Lu+LlXUMijqyk8qDm19UQZtZqqr4a6zpc3xdg0ouHPUb9svMB7ih6xnlf6C8Cy8lDrfCMUjVEBrQvD4dW+1Y81vQgewrwzTzWedRZm5iNbnNalgJjJe2TvwZDnbkl1KGXl4l4AICih7Ifg0n68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786958; c=relaxed/simple;
	bh=Hd84eTaanEcxZiV+PretsKZlnONdbdl93VYU6KWFius=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IK/Kcyf7nmm5Ar4NFXPTZAW1qIWvyxIUWPYOWysy0GvBMMUTPi6NrkcPI7zIiy8jKTVYuKJAeP8LPQbkIEdD6OJBe2YKzp+Nkr+QbCV0jLxYXr6SU4xIaJPm1LniVZs3u1gNFsSZN+amIqQ1aiq1q9/DQIaWjob+9cCBOVZHkGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ekgsDF69; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ekgsDF69"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765786952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1K4zEPDRDMYMdi2xCl35yRWVX4/M4MCPPrB3uzXZsk=;
	b=ekgsDF69tdh7Uuq1rKl3gWMokZ9ARFJ2877cNabQluInZ5Tu/0yJYlIjIR9T6BqszVZv/H
	v61ZurDFpkvSjJNhVgqPPeaamS8XNngxrpkuTFRVY23cGQ+vm/+2o8jZUhqmN6fxj0cXB6
	iEsa/Ao25PupjInA901b6SN/RxgIsaE=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH v6 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v5)
Date: Mon, 15 Dec 2025 16:22:00 +0800
Message-Id: <20251215-2-v6-0-09a486e8df99@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjFP2kC/2XPwQ7CIAwG4FcxnMW0heL05HsYD2OAkphpNiUzZ
 u8u7CLR49/0+5u+xeiH6EexX73F4FMc463PwaxXoru0/dnL6HIWBMSIBJKkA9UYstQF40Teuw8
 +xGnpOJ5yvsTxcRteS2XCMq11QglyC2xdpzUww+Ea++e0cT6JohPVQhdBWVjVEBpPHNzuV6ham
 CJUFg2j5ZbRNIC/Qn8FARehs/Dc2p3KfxH+3eBKIBXByx/aqjYwh62rxTzPHwuKubtaAQAA
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 hengqi.chen@gmail.com
Cc: r@hev.cc, xry111@xry111.site, loongarch@lists.linux.dev, 
 linux-kernel@vger.kernel.org, George Guo <dongtai.guo@linux.dev>, 
 George Guo <guodongtai@kylinos.cn>, Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765786949; l=3583;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=Hd84eTaanEcxZiV+PretsKZlnONdbdl93VYU6KWFius=;
 b=M3ywobYC3JlpKYqgxQ+tKybicVQNYN5Sql3Btgbv6BTi2/clYcWJRkbldrelIPUrRtbgWZU1w
 y6naFICV68IAdo57KFuh+blLvt8vsTQ+9Pei8yS5KyP1D/Hpn7/kZ94
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
 arch/loongarch/kernel/cpu-probe.c         |  2 +
 arch/loongarch/kernel/proc.c              |  1 +
 7 files changed, 75 insertions(+)
---
base-commit: 612df905d7404450696e979c806ba4cdef8684f4
change-id: 20251120-2-d03862b2cf6d

Best regards,
-- 
George Guo <dongtai.guo@linux.dev>

