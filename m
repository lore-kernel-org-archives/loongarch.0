Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62227B
	for <loongarch@lists.linux.dev>; Wed, 18 Jan 2023 02:01:04 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxmOneUsdjPj0CAA--.2969S3;
	Wed, 18 Jan 2023 10:01:02 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxTuTeUsdjPhYbAA--.17049S2;
	Wed, 18 Jan 2023 10:01:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/5] Add kprobe and kretprobe support for LoongArch
Date: Wed, 18 Jan 2023 10:00:56 +0800
Message-Id: <1674007261-9198-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxTuTeUsdjPhYbAA--.17049S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCr1UXrWUZF1ftFy5Ar1xGrg_yoW5KF1DpF
	9rArn8tr4rXrySvr9xJa47ur1Sqw4kG3y7W3W7GrWru3W7XryUAr4xKrsrXFy8Gwsaqr1I
	qr1fXrWagFy3J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

v12:
  -- Rebase on the latest code
  -- Fix -Wmissing-prototypes warning when make W=1
  -- Drop patch #6 "Use common function sign_extend64()"
     since it has been applied yet

v11:
  -- Rebase on the latest code
  -- Address all the review comments, thank you all
  -- Modify arch_prepare_kprobe() and setup_singlestep()
     to make the probe logic more clear
  -- Mark some assembler symbols as non-kprobe-able
  -- Use common function sign_extend64()
  -- Test 20 times about 36 hours for all the 71 assembler
     functions annotated with SYM_CODE_START and SYM_FUNC_START
     under arch/loongarch, especially test memset alone for 10
     hours, no hang problems

v10:
  -- Remove sign_extend() based on the latest code
  -- Rename insns_are_not_supported() to insns_not_supported()
  -- Rename insns_are_not_simulated() to insns_not_simulated()
  -- Set KPROBE_HIT_SSDONE if cur->post_handler is not NULL
  -- Enable preemption for KPROBE_REENTER in kprobe_fault_handler()

v9:
  -- Rename sign_extended() to sign_extend()
  -- Modify kprobe_fault_handler() to handle all of kprobe_status

v8:
  -- Put "regs->csr_prmd &= ~CSR_PRMD_PIE;" ahead to save one line
  -- Add code comment of preempt_disable()
  -- Put kprobe_page_fault() in __do_page_fault()
  -- Modify the check condition of break insn in kprobe_breakpoint_handler()

v7:
  -- Remove stop_machine_cpuslocked() related code

v6:
  -- Add a new patch to redefine larch_insn_patch_text() with
     stop_machine_cpuslocked()
  -- Modify kprobe_breakpoint_handler() to consider the original
     insn is break and return the correct value
  -- Modify do_bp() to refresh bcode when original insn is break

v5:
  -- Rebase on the latest code
  -- Use stop_machine_cpuslocked() to modify insn to avoid CPU race

v4:
  -- Remove kprobe_exceptions_notify() in kprobes.c
  -- Call kprobe_breakpoint_handler() and kprobe_singlestep_handler()
     in do_bp()

v3:
  -- Rebase on the latest code
  -- Check the alignment of PC in simu_branch() and simu_pc()
  -- Add ibar in flush_insn_slot()
  -- Rename kprobe_{pre,post}_handler() to {post_}kprobe_handler
  -- Add preempt_disable() and preempt_enable_no_resched()
  -- Remove r0 save/restore and do some minor changes
     in kprobes_trampoline.S
  -- Do not enable CONFIG_KPROBES by default

v2:
  -- Split simu_branch() and simu_pc() into a single patch
  -- Call kprobe_page_fault() in do_page_fault()
  -- Add kprobes_trampoline.S for kretprobe

Tiezhu Yang (5):
  LoongArch: Simulate branch and PC* instructions
  LoongArch: Add kprobe support
  LoongArch: Add kretprobe support
  LoongArch: Mark some assembler symbols as non-kprobe-able
  samples/kprobes: Add LoongArch support

 arch/loongarch/Kconfig                     |   2 +
 arch/loongarch/include/asm/asm.h           |  10 +
 arch/loongarch/include/asm/inst.h          |  20 ++
 arch/loongarch/include/asm/kprobes.h       |  61 +++++
 arch/loongarch/include/asm/ptrace.h        |   1 +
 arch/loongarch/kernel/Makefile             |   2 +
 arch/loongarch/kernel/entry.S              |   1 +
 arch/loongarch/kernel/inst.c               | 123 +++++++++
 arch/loongarch/kernel/kprobes.c            | 405 +++++++++++++++++++++++++++++
 arch/loongarch/kernel/kprobes_trampoline.S |  96 +++++++
 arch/loongarch/kernel/traps.c              |  11 +-
 arch/loongarch/lib/memcpy.S                |   3 +
 arch/loongarch/mm/fault.c                  |   3 +
 samples/kprobes/kprobe_example.c           |   8 +
 14 files changed, 741 insertions(+), 5 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kprobes.h
 create mode 100644 arch/loongarch/kernel/kprobes.c
 create mode 100644 arch/loongarch/kernel/kprobes_trampoline.S

-- 
2.1.0

