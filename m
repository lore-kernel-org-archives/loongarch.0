Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065692560
	for <loongarch@lists.linux.dev>; Wed, 16 Nov 2022 08:07:31 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxPLc7mnRjD7IHAA--.10869S3;
	Wed, 16 Nov 2022 16:07:23 +0800 (CST)
Received: from localhost.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VY6mnRjQ54UAA--.36317S2;
	Wed, 16 Nov 2022 16:07:23 +0800 (CST)
From: Qing Zhang <zhangqing@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/9] LoongArch: Add ftrace support
Date: Wed, 16 Nov 2022 16:07:13 +0800
Message-Id: <20221116080722.4745-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx9VY6mnRjQ54UAA--.36317S2
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFyDuw4UKr1ruw17XF1UZFb_yoWrGFy8pr
	W3ZFn3Gr4UCFs3KwnxK34rurn5Ar1xGryag3W3JryrCr47Zr1UXw1ktrykXa45t393Gry0
	qF1rWw42gF4DZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b2kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26F4j6r4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU13EfUUUUUU==

This patch series to support basic and dynamic ftrace.

1) -pg
Use `-pg` makes stub like a child function `void _mcount(void *ra)`.
Thus, it can be seen store RA and open stack before `call _mcount`.
Find `open stack` at first, and then find `store RA`.

2) -fpatchable-function-entry=2
The compiler has inserted 2 NOPs before the regular function prologue.
T series registers are available and safe because of LoongArch psABI.

At runtime, replace nop with bl to enable ftrace call and replace bl with
nop to disable ftrace call. The bl requires us to save the original RA value,
so here it saves RA at t0.
details are:

| Compiled   |       Disabled         |        Enabled         |
+------------+------------------------+------------------------+
| nop        | move     t0, ra        | move     t0, ra        |
| nop        | nop                    | bl      ftrace_caller  |
| func_body  | func_body              | func_body              |

The RA value will be recovered by ftrace_regs_entry, and restored into RA
before returning to the regular function prologue. When a function is not
being traced, the move t0, ra is not harmful.

performs a series of startup tests on ftrace and The test cases in selftests
has passed on LoongArch.

Changes in v2:
 - Remove patch "LoongArch: ftrace: Add CALLER_ADDRx macros" there are other
   better ways
 Suggested by Steve:
 - Add HAVE_DYNAMIC_FTRACE_WITH_ARGS support (6/10)
 Suggested by Jinyang:
 - Change addu16id to lu12iw and Adjust module_finalize return value (7/10)
 - Use the "jr" pseudo-instruction where applicable (1/10)
 - Use the "la.pcrel" instead of "la" (3/10)

Changes in v3:
 Reported by Jeff:
 - Fix unwind state when option func_stack_trace (10/10)

Changes in v4:
 - No comments. Just resend the series.
 - Rebased onto v6.0.0-rc4.

Changes in v5:
 - Modify the indentation of Kconfig and small changes

Changes in v6:
 Suggested by Huacai:
 - Adjusting the patch Sequence
 - renamed mcount-dyn.S for consistency

Changes in v7:
 - delete redefinition

Changes in v8:
 - remove useless macro judgment and modify the return location
 - move some code to Patch-3

Qing Zhang (9):
  LoongArch/ftrace: Add basic support
  LoongArch/ftrace: Add recordmcount support
  LoongArch/ftrace: Add dynamic function tracer support
  LoongArch/ftrace: Add dynamic function graph tracer support
  LoongArch/ftrace: Add HAVE_DYNAMIC_FTRACE_WITH_REGS support
  LoongArch/ftrace: Add HAVE_DYNAMIC_FTRACE_WITH_ARGS support
  LoongArch/ftrace: Add HAVE_FUNCTION_GRAPH_RET_ADDR_PTR support
  LoongArch: modules/ftrace: Initialize PLT at load time
  LoongArch: Enable CONFIG_KALLSYMS_ALL and CONFIG_DEBUG_FS

 arch/loongarch/Kconfig                     |   7 +
 arch/loongarch/Makefile                    |   5 +
 arch/loongarch/configs/loongson3_defconfig |   2 +
 arch/loongarch/include/asm/ftrace.h        |  59 +++++
 arch/loongarch/include/asm/inst.h          |  15 ++
 arch/loongarch/include/asm/module.h        |   5 +-
 arch/loongarch/include/asm/module.lds.h    |   1 +
 arch/loongarch/include/asm/unwind.h        |   3 +-
 arch/loongarch/kernel/Makefile             |  13 +
 arch/loongarch/kernel/ftrace.c             |  74 ++++++
 arch/loongarch/kernel/ftrace_dyn.c         | 264 +++++++++++++++++++++
 arch/loongarch/kernel/inst.c               | 127 ++++++++++
 arch/loongarch/kernel/mcount.S             |  94 ++++++++
 arch/loongarch/kernel/mcount_dyn.S         | 154 ++++++++++++
 arch/loongarch/kernel/module-sections.c    |  11 +
 arch/loongarch/kernel/module.c             |  22 ++
 arch/loongarch/kernel/unwind_guess.c       |   4 +-
 arch/loongarch/kernel/unwind_prologue.c    |  46 +++-
 scripts/recordmcount.c                     |  23 ++
 19 files changed, 919 insertions(+), 10 deletions(-)
 create mode 100644 arch/loongarch/include/asm/ftrace.h
 create mode 100644 arch/loongarch/kernel/ftrace.c
 create mode 100644 arch/loongarch/kernel/ftrace_dyn.c
 create mode 100644 arch/loongarch/kernel/mcount.S
 create mode 100644 arch/loongarch/kernel/mcount_dyn.S

-- 
2.36.0

