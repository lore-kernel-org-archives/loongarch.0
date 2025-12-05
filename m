Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CA8634C
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 06:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764916167; cv=none; b=GAr+DlY9tuZtpaunb/Z66gnwyYJkZRHVORDQCLjbP7rxVogNu/EFpHSIXnrvrQPALvx53ulq6Y5zGIpuoVetSLnkrrz756Kk/ZrGhkUQtJ2SnH0ZT+qei8ToWeoaDN1a+OdWJuzGissSE+QqdSZtQ9RaGt9IQRggeUijsM7gWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764916167; c=relaxed/simple;
	bh=J/V1cy97Od7N87LqWrCBO3XeYkmp/dvr/BxMoxcw1Ao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aP9CEvgxmTVO9EMOm22VOR+1fH4jc/+tDZUrhyWljbCJt02b6tzMN5eGEU8mR3j7bqK73q/YP4GB5L0WIkXqpU0GnAPQhkduzr7Hy72fdCd6VAvx3ez8q9sW6YnwB7nZW22EIMArccZzphP9bcinqcGvax+V/mWAaa4pTIG1vuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mue2pCNo; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mue2pCNo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764916163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wLdfKdCsQXfKjNr4n7OwRT0+p2xB4EdKm94AWJyNKLE=;
	b=Mue2pCNo7WG5fzygifcRSst1lQZimazeop/YmKbysCjhdVkNV9BRbtHYiVgboNqkuZhZIJ
	Pu7P7z6IZr/gazOeyS6rK5niMGct3XtpnhXQRe5GT3mVtQjJxjx2ET7NCVip9xN6pubbdf
	yZSFO1hoZLApkbCpfk4H4m2CGv6UFnA=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH v4 0/4] LoongArch: Add 128-bit atomic cmpxchg support (v4)
Date: Fri, 05 Dec 2025 14:29:03 +0800
Message-Id: <20251205-2-v4-0-e5ab932cf219@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK97MmkC/13MQQ7CIBCF4as0rMUwA4PVlfcwLkqhlsS0BpTUN
 L270BVx+U/meyuLLngX2aVZWXDJRz9POdShYf3YTQ/Hvc3NUCABoODIrZCtRoP9oC3Lf6/gBr/
 sG7d77tHH9xy++2SCcq11Ai74SZCxvVKCSFyffvosR+sSKzphLVQRmIWRLYJ2SIM9/wtZC12Ez
 KIlMNQR6FZALbZt+wHSiA089gAAAA==
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>, 
 Yangyang Lian <lianyangyang@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764916159; l=3291;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=J/V1cy97Od7N87LqWrCBO3XeYkmp/dvr/BxMoxcw1Ao=;
 b=mMwET2Pbw96wc/OKFA/dAV72X6ziLZuPcYZhkHHLdrUW8xsMFGkpxZFTGtUnUzJVT3tQHYU+L
 UYoqx3r6p26AEw1WttkrZIb5Xtyk729H0Qee6RCCZ2unxK09k7zJSxY
X-Developer-Key: i=dongtai.guo@linux.dev; a=ed25519;
 pk=yHUJPGx/kAXutP/NSHpj7hWW0KQNlv3w9H6ju4qUoTM=
X-Migadu-Flow: FLOW_OUT

This patch series adds 128-bit atomic compare-and-exchange support for
LoongArch architecture, which fixes BPF scheduler test failures caused
by missing 128-bit atomics support.

The series consists of four patches:

1. "LoongArch: Add 128-bit atomic cmpxchg support"
   - Implements 128-bit atomic compare-and-exchange using LoongArch's
     LL.D/SC.Q instructions
   - Fixes BPF scheduler test failures (scx_central scx_qmap) where
     kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
     leading to -ENOMEM errors during scheduler initialization

2. "LoongArch: Enable 128-bit atomics cmpxchg support"
   - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
     in Kconfig to enable 128-bit atomic cmpxchg support
3. "LoongArch: Add SCQ support detection"
    - Check CPUCFG2_SCQ bit to determin if the CPU supports
    SCQ instrction.
4. "LoongArch: Use spinlock to emulate 128-bit cmpxchg"
   - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
     the SCQ instruction on 3A5000), provide a fallback implementation
     of __cmpxchg128 using a spinlock to emulate the atomic operation.

The issue was identified through BPF scheduler test failures where
scx_central and scx_qmap schedulers would fail to initialize. Testing
was performed using the scx_qmap scheduler from tools/sched_ext/,
confirming that the patches resolve the initialization failures.

Signed-off-by: George Guo <dongtai.guo@linux.dev>
---
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
George Guo (3):
      LoongArch: Add 128-bit atomic cmpxchg support
      LoongArch: Use spinlock to emulate 128-bit cmpxchg
      LoongArch: Enable 128-bit atomics cmpxchg support

george (1):
      LoongArch: Add SCQ support detection

 arch/loongarch/Kconfig                    |  2 +
 arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++++++++++
 arch/loongarch/include/asm/cpu-features.h |  1 +
 arch/loongarch/include/asm/cpu.h          |  2 +
 arch/loongarch/include/asm/loongarch.h    |  1 +
 arch/loongarch/kernel/cpu-probe.c         |  4 ++
 6 files changed, 76 insertions(+)
---
base-commit: 2061f18ad76ecaddf8ed17df81b8611ea88dbddd
change-id: 20251120-2-d03862b2cf6d

Best regards,
-- 
George Guo <dongtai.guo@linux.dev>

