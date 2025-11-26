Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED430BF7E
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 02:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764122776; cv=none; b=qCPcrfnmVqg/l0EEWOXW9LK90feguEV78uhGbMD6g23a2s6QeJQ8AI5dBpjdyDQKo3VGSUFlMaKkx5TVD2umrtZ+4aUtknXKP0h2xWMMhhYWNgZluYeZUscbRAc5rgprCsrSsx/A1+RFCfxDCm6MpThxXYvAyD8rGmdUoSGv/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764122776; c=relaxed/simple;
	bh=RyAId0GM4YN0ArTmhHUKslKPznhLpV8Z15TRDwNgIi8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4SoZrMTVlt5YINmWP4Jj8uy2j5EkUv6FwqKRoBpKCRyiBaNT6M1y5UxxvVnKZQXcatcep2K194Wvqhv9HaCGlIwr5/Wsrdit86B/tRZAzvzUvFpw8BlORwsqiE0EdRTTEa7BGBxjiZGIML8j62Gv4VFdpO3mQgPas019nK5aaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wh1foxUw; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wh1foxUw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764122762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EJ/Ue5Qky2MtwQsGNeb6W8oWcDHKfS+NJnISi7Fqbec=;
	b=wh1foxUwpvUFW06sb6lX2q8JNoYsnZ8Y4AqLkF1tXKThDtjs15debHalFusl8gQfnTSh68
	per6vLxql+jl9SPUSLdISiyCh5EtMR516sUbcwhNzMX/xNJVYedYk1+pVtstq34KxZxcb+
	JLGGgs5jqHKZIXDUH9vMY9jZ4+mxDF4=
From: George Guo <dongtai.guo@linux.dev>
Subject: [PATCH v3 0/2] LoongArch: Add 128-bit atomic cmpxchg support (v3)
Date: Wed, 26 Nov 2025 10:05:49 +0800
Message-Id: <20251126-2-v3-0-851b5a516801@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1gJmkC/03MwQ6CMAzG8VchPTvTFYboyfcwHhwr0sSA2XTBk
 L27GyeO/6a/b4XAXjjApVrBc5Qg85SjPlTQj4/pyUpcbiAkozWhIuWw7lqy1A+tg/z39jzIsm3
 c7rlHCZ/Z/7bJqMt1r6NWqE5orOubBo3B60um73J0HKHoSHvRFEFZ2Loj3TKZwZ33IqX0B30Zh
 RTEAAAA
X-Change-ID: 20251120-2-d03862b2cf6d
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 George Guo <dongtai.guo@linux.dev>, George Guo <guodongtai@kylinos.cn>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764122759; l=2402;
 i=dongtai.guo@linux.dev; s=20251103; h=from:subject:message-id;
 bh=RyAId0GM4YN0ArTmhHUKslKPznhLpV8Z15TRDwNgIi8=;
 b=dOheip3SDPcVyZXvBgHYRdE4Adfy/snvPf2qQ3yFLrTTkFXBghMMt4ZHi7g/ceSG8K2fVRCnA
 WPi7bnE6fcXBWVwhDheDzsvtlPuQs7NxFoYofikYL87d9A/prcCaKNZ
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

