Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C97631
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 06:39:14 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxQfEPg31k7QUAAA--.203S3;
	Mon, 05 Jun 2023 14:39:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axa9YPg31kHQcAAA--.72S2;
	Mon, 05 Jun 2023 14:39:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v5 0/6] Add uprobes support for LoongArch
Date: Mon,  5 Jun 2023 14:39:04 +0800
Message-Id: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8Axa9YPg31kHQcAAA--.72S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrW8XF48Gr1kKr18CF4Dtrc_yoW8ZF18pF
	srurnxGr45GryfXrZxta43ur1Fyr48GrW2qFnxC34rAw4jqF15Xr18KrZ8CF98t3y5Kry0
	qF1rG3yYga15A3cCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxU7fMaUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v5:
  -- Rebased on 6.4rc5
  -- Like arm64, add user_enable_single_step() in arch_uprobe_pre_xol(),
     add user_disable_single_step() in arch_uprobe_{post,abort}_xol(),
     suggested by Jeff and Huacai offline

v4:
  -- Rebased on 6.4rc1
  -- Fix problem about "perf probe -x /lib64/libc.so.6 malloc"

v3:
  -- Check atomic instructions in insns_not_supported()
  -- Remove five DIE_* definitions in kdebug.h

v2:
  -- Move the functions to inst.c in patch #1
  -- Pass around union for insns_not_supported(),
     insns_need_simulation() and arch_simulate_insn()

v1:
  -- Split the RFC patch #2 into two patches
  -- Use larch_insn_gen_break() to generate break insns
     for kprobes and uprobes
  -- Pass around instruction word instead of union for
     insns_not_supported(), insns_need_simulation() and
     arch_simulate_insn() to avoid type conversion for callers
  -- Add a simple test case for uprobes in the commit message

Tiezhu Yang (6):
  LoongArch: Move three functions from kprobes.c to inst.c
  LoongArch: Add larch_insn_gen_break() to generate break insns
  LoongArch: Use larch_insn_gen_break() for kprobes
  LoongArch: Add uprobes support
  LoongArch: Check atomic instructions in insns_not_supported()
  LoongArch: Remove five DIE_* definitions in kdebug.h

 arch/loongarch/Kconfig               |   3 +
 arch/loongarch/include/asm/inst.h    |  42 ++++++++++
 arch/loongarch/include/asm/kdebug.h  |   5 --
 arch/loongarch/include/asm/kprobes.h |   2 +-
 arch/loongarch/include/asm/uprobes.h |  35 ++++++++
 arch/loongarch/kernel/Makefile       |   1 +
 arch/loongarch/kernel/inst.c         |  54 +++++++++++++
 arch/loongarch/kernel/kprobes.c      |  75 ++++-------------
 arch/loongarch/kernel/traps.c        |   9 +--
 arch/loongarch/kernel/uprobes.c      | 152 +++++++++++++++++++++++++++++++++++
 10 files changed, 306 insertions(+), 72 deletions(-)
 create mode 100644 arch/loongarch/include/asm/uprobes.h
 create mode 100644 arch/loongarch/kernel/uprobes.c

-- 
2.1.0

