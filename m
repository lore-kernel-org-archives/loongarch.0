Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9152D13AD0
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 08:15:14 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx6eqPhL9k7qMJAA--.18569S3;
	Tue, 25 Jul 2023 16:15:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLCOOhL9kAFg6AA--.7611S2;
	Tue, 25 Jul 2023 16:15:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v1 0/6] Add objtool and orc support for LoongArch
Date: Tue, 25 Jul 2023 16:15:04 +0800
Message-Id: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8CxLCOOhL9kAFg6AA--.7611S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF1kuw48KFyUZrWfuw1kXrc_yoWrAr4fpF
	9rurykGr4UWr93Awnrt34UWrWDJan7Gr12g3Waqry8AFW2qr1DArsakryDXF9Fqa1rGFy0
	gF1rGw1aga1jyabCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8PfHUUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Due to work adjustment, it is my pleasure and duty to go on with this work
from now on. As discussed with Youling offline to reach an agreement, I'll
make this patch series as simple and clear as possible, maybe this is going
to progress in the right direction.

This version is based on 6.5-rc1, the patches apply cleanly to the latest
objtool/core branch of tip/tip.git tree too, most of the changes are under
tools/objtool/arch/loongarch and arch/loongarch.

To be honest, there still exist some objtool warnings, I will try my best
to fix them in the later versions or the other separate patches.

Tiezhu Yang (6):
  objtool/LoongArch: Enable objtool to be built
  objtool/LoongArch: Implement instruction decoder
  objtool/x86: Separate arch-specific and generic parts
  objtool/LoongArch: Enable orc to be built
  objtool: Add skipped member in struct reloc
  LoongArch: Add ORC unwinder support

 arch/loongarch/Kconfig                             |   2 +
 arch/loongarch/Kconfig.debug                       |  11 +
 arch/loongarch/Makefile                            |  16 +
 arch/loongarch/include/asm/Kbuild                  |   1 +
 arch/loongarch/include/asm/bug.h                   |   1 +
 arch/loongarch/include/asm/module.h                |   7 +
 arch/loongarch/include/asm/orc_header.h            |  19 +
 arch/loongarch/include/asm/orc_lookup.h            |  34 ++
 arch/loongarch/include/asm/orc_types.h             |  58 ++
 arch/loongarch/include/asm/stackframe.h            |   3 +
 arch/loongarch/include/asm/unwind.h                |  22 +-
 arch/loongarch/include/asm/unwind_hints.h          |  23 +
 arch/loongarch/kernel/Makefile                     |   3 +
 arch/loongarch/kernel/entry.S                      |   2 +
 arch/loongarch/kernel/genex.S                      |   2 +
 arch/loongarch/kernel/head.S                       |   1 +
 arch/loongarch/kernel/module.c                     |  21 +-
 arch/loongarch/kernel/relocate_kernel.S            |  11 +-
 arch/loongarch/kernel/setup.c                      |   2 +
 arch/loongarch/kernel/stacktrace.c                 |   1 +
 arch/loongarch/kernel/unwind_orc.c                 | 586 +++++++++++++++++++++
 arch/loongarch/kernel/vmlinux.lds.S                |   3 +
 arch/loongarch/power/Makefile                      |   2 +
 arch/loongarch/vdso/Makefile                       |   2 +
 include/linux/compiler.h                           |   9 +
 scripts/Makefile                                   |   5 +-
 tools/arch/loongarch/include/asm/inst.h            | 159 ++++++
 tools/arch/loongarch/include/asm/orc_types.h       |  58 ++
 tools/include/linux/bitops.h                       |  11 +
 tools/objtool/Makefile                             |   4 +
 tools/objtool/arch/loongarch/Build                 |   3 +
 tools/objtool/arch/loongarch/decode.c              | 406 ++++++++++++++
 .../objtool/arch/loongarch/include/arch/cfi_regs.h |  21 +
 tools/objtool/arch/loongarch/include/arch/elf.h    |  30 ++
 .../objtool/arch/loongarch/include/arch/special.h  |  33 ++
 tools/objtool/arch/loongarch/orc.c                 | 158 ++++++
 tools/objtool/arch/loongarch/special.c             |  15 +
 tools/objtool/arch/x86/Build                       |   1 +
 tools/objtool/arch/x86/orc.c                       | 169 ++++++
 tools/objtool/check.c                              |  16 +-
 tools/objtool/elf.c                                |   6 +
 tools/objtool/include/objtool/check.h              |   9 +
 tools/objtool/include/objtool/elf.h                |   1 +
 tools/objtool/include/objtool/orc.h                |  11 +
 tools/objtool/orc_dump.c                           |  69 +--
 tools/objtool/orc_gen.c                            |  93 +---
 46 files changed, 1949 insertions(+), 171 deletions(-)
 create mode 100644 arch/loongarch/include/asm/orc_header.h
 create mode 100644 arch/loongarch/include/asm/orc_lookup.h
 create mode 100644 arch/loongarch/include/asm/orc_types.h
 create mode 100644 arch/loongarch/include/asm/unwind_hints.h
 create mode 100644 arch/loongarch/kernel/unwind_orc.c
 create mode 100644 tools/arch/loongarch/include/asm/inst.h
 create mode 100644 tools/arch/loongarch/include/asm/orc_types.h
 create mode 100644 tools/objtool/arch/loongarch/Build
 create mode 100644 tools/objtool/arch/loongarch/decode.c
 create mode 100644 tools/objtool/arch/loongarch/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/loongarch/include/arch/elf.h
 create mode 100644 tools/objtool/arch/loongarch/include/arch/special.h
 create mode 100644 tools/objtool/arch/loongarch/orc.c
 create mode 100644 tools/objtool/arch/loongarch/special.c
 create mode 100644 tools/objtool/arch/x86/orc.c
 create mode 100644 tools/objtool/include/objtool/orc.h

-- 
2.1.0

