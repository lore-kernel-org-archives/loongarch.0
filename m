Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196991;
	b=0Egqaq9UWKZ5regVSst1W9MRPAFMxf1jdAQQ1GVsYoL+A1+xE0MFNY10UfkJTL/bHyan
	 V8WGVjW1pfUUdD+BYHARiY19ULJdXWzI+TEHvGSlcZ3JZEJJlTgI3wiWUFGs0XPE9tnR7
	 OrnFjkdFUFayMh/goGvmPEmXdpUNZu8Dolw4wsGkax8gE92PKJkQHwiLiJyToL3WhLy+G
	 PkW2ZMGatZC3wL3ui3Exo1av5vF6vwh434SA2GCA2BxM88kORZnx/+gnwnvF++R60F+vx
	 MuyD3dxFmOpxhasfyIFEnRlNH6Liyk6sUGkaKdVx90T0PxXxcqgB8yBkseOKejNi8Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196991;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=i/f88ckO3Qq3qO65j9srmB+LjpsKuGFHQJlvd3jhpgo=;
	b=xIA6+bW/YEOXStLHQC0143U8tkTSzNCLdyUVkQASUvvaPlTMMfIQA+DZgGUHcN/oOQrE
	 QZq6ZMPbwZaLAYZDMjDuJi4giiEm44R9bokg3oJV1o3HA+xET/am4jDqqrlTNCZTfutWu
	 KtQFTtzK1wpSk/dFFHV01IOkYut6Zyw7KANYJfaLOjgMs9hs96MOEbV1eia1HpAsxie0c
	 5Y4s4KZsptd2xxK/+liRQYs3EJUkGwR1ntkOIBcQkee2i3mT24UEud0ZDSvrbHyf9gJTr
	 kCX4Ze6lpcMcsYjLoZeFbLy+onX4bzTVkUrXt4sAkb2VU0KXFW1KcR0J9L1/pTVCAJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF057606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF057606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxUNH8RfFqALMdAA--.20535S3;
	Mon, 09 Nov 2026 12:03:08 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxlMz7RfFq9hszAA--.11822S3;
	Mon, 09 Nov 2026 12:03:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] LoongArch: BPF: Make arena support depend on 128-bit atomic cmpxchg
Date: Mon,  9 Nov 2026 12:03:05 +0800
Message-ID: <20261109040306.11536-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261109040306.11536-1-yangtiezhu@loongson.cn>
References: <20261109040306.11536-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMz7RfFq9hszAA--.11822S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4DWryrCry3JFWUJFyxZwc_yoW5Aw45pF
	W3uFs8Krs0qw1Sy39rGw1kWw15AFWrKrW5Ka1fAryUA3s8Xw17Jry8Cas5uF4ktrWru3WY
	9a4jyF9F9a1kCagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

When testing bpf selftest "jit_insns/cast_to_user", there are different
behaviors on different Loongson machines.

(1) Loongson-3A6000
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  Summary: 1/1 PASSED, 0 SKIPPED, 0/0 FAILED

(2) Loongson-3A5000
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -ENOMEM
  run_subtest:FAIL:unexpected_load_failure unexpected error: -12 (errno 12)
  ...
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

This is because the arena range tree uses kmalloc_nolock(), which requires
128-bit atomic cmpxchg; this is provided by not only hardware SCQ extension
but also assembler support on LoongArch. On CPUs without the SCQ extension,
or if the older versions of assembler do not support that sc.q instruction,
arena map creation fails with a misleading -ENOMEM error.

Since system_has_cmpxchg128() and arch_cmpxchg128() are only available when
CONFIG_AS_HAS_SCQ_EXTENSION is enabled, guard bpf_jit_supports_arena() with
an #ifdef block to preserve compile-time robustness first, and then safely
return system_has_cmpxchg128() if defined, otherwise falling back to false.
This ensures that arena map creation cleanly fails with -EOPNOTSUPP on the
systems without either the assembler support or the hardware SCQ extension.

With this patch, here is the test result on Loongson-3A5000 without SCQ
extension:

  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -EOPNOTSUPP
  run_subtest:FAIL:unexpected_load_failure unexpected error: -95 (errno 95)
  ...
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

It is better to mark the test status as SKIPPED rather than logging a
false-alarm failure if the feature is not supported, but this belongs
to a separate bpf selftest patch.

This is similar to commit 536b523b4073 ("bpf, riscv: Make arena support
depend on ZACAS").

Note that BPF should not depend on a SLUB debug-mode escape hatch, so
no need to consider the slub_debug exception.

Fixes: 4fdb5dd8aeba ("LoongArch: BPF: Implement bpf_addr_space_cast instruction")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 3ab039d0afb6..b845083d1d74 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2489,7 +2489,16 @@ bool bpf_jit_bypass_spec_v4(void)
 
 bool bpf_jit_supports_arena(void)
 {
-	return true;
+	/*
+	 * The arena range tree uses kmalloc_nolock(), which requires 128-bit
+	 * atomic cmpxchg; this is provided by not only hardware SCQ extension
+	 * but also assembler support on LoongArch.
+	 */
+#ifdef system_has_cmpxchg128
+	return system_has_cmpxchg128();
+#else
+	return false;
+#endif
 }
 
 bool bpf_jit_supports_fsession(void)
-- 
2.42.0

