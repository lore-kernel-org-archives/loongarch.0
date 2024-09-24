Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527F8770F5
	for <loongarch@lists.linux.dev>; Tue, 24 Sep 2024 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727159237; cv=none; b=VFB9h/8pEgvFxoXUPZwtB+jFU/7UDhJoNPV1PBNVETdg9PHoKBNlagMpdopfF6Ve/gJuNiUIVytouWDqJUg48q/4+nuyt7cVhb9OEVTHNQjKNPtOHApvV86pUB+bo3P8GAOdzd58LIRG9QfOJu7ypI1hFtUKOOubbgPV0HOmQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727159237; c=relaxed/simple;
	bh=pkIADc2o+Wa2YtBSR4SF6m7MEBBU+Gki0tVYNX/dZbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IW86Et7+Vjr4tnnpLTG6pthH4sC3AL8//o4s1vnNMVFrWF+wwwfvqym84Yr47T7cvZ/WWozWllcRhzOfVn7SYRMG1C0s7b/s6Hk+lN06H7yLV4lV9tn8PFv7nYm4bj2aTKgsKsINBfq6nNu5Rc/+ebHTHCLQqBb5EyX1x3vg2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxPOrAW_Jm_r4NAA--.31978S3;
	Tue, 24 Sep 2024 14:27:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxSsa_W_Jmzn0QAA--.1714S2;
	Tue, 24 Sep 2024 14:27:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Andrew Morton <akpm@linux-foundation.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] compiler.h: Specify correct attribute for .rodata..c_jump_table
Date: Tue, 24 Sep 2024 14:27:10 +0800
Message-ID: <20240924062710.1243-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxSsa_W_Jmzn0QAA--.1714S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw15CryxJFWrtw1DWr1xZwc_yoW8KFy8pF
	4DCryqgrs5Zr15uw47Xw1akr13Aw42yF1UCrWDtr1UAw15JF1kG3WktrsxKayUKry5tr4x
	twn7tryUKa4xZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1LvtUUUUU=

Currently, there is an assembler message when generating kernel/bpf/core.o
under CONFIG_OBJTOOL with LoongArch compiler toolchain:

  Warning: setting incorrect section attributes for .rodata..c_jump_table

This is because the section ".rodata..c_jump_table" should be readonly,
but there is a "W" (writable) part of the flags:

  $ readelf -S kernel/bpf/core.o | grep -A 1 "rodata..c"
  [34] .rodata..c_j[...] PROGBITS         0000000000000000  0000d2e0
       0000000000000800  0000000000000000  WA       0     0     8

There is no above issue on x86 due to the generated section flag is only
"A" (allocatable). In order to silence the warning on LoongArch, specify
the attribute like ".rodata..c_jump_table,\"a\",@progbits #" explicitly,
then the section attribute of ".rodata..c_jump_table" must be readonly
in the kernel/bpf/core.o file.

Before:

  $ objdump -h kernel/bpf/core.o | grep -A 1 "rodata..c"
   21 .rodata..c_jump_table 00000800  0000000000000000  0000000000000000  0000d2e0  2**3
                  CONTENTS, ALLOC, LOAD, RELOC, DATA

After:

  $ objdump -h kernel/bpf/core.o | grep -A 1 "rodata..c"
   21 .rodata..c_jump_table 00000800  0000000000000000  0000000000000000  0000d2e0  2**3
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA

By the way, AFAICT, maybe the root cause is related with the different
compiler behavior of various archs, so to some extent this change is a
workaround for LoongArch, and also there is no effect for x86 which is
the only port supported by objtool before LoongArch with this patch.

Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 include/linux/compiler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ec55bcce4146..4d4e23b6e3e7 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -133,7 +133,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define annotate_unreachable() __annotate_unreachable(__COUNTER__)
 
 /* Annotate a C jump table to allow objtool to follow the code flow */
-#define __annotate_jump_table __section(".rodata..c_jump_table")
+#define __annotate_jump_table __section(".rodata..c_jump_table,\"a\",@progbits #")
 
 #else /* !CONFIG_OBJTOOL */
 #define annotate_reachable()
-- 
2.42.0

