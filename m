Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712E7A3F
	for <loongarch@lists.linux.dev>; Fri,  9 Dec 2022 08:53:12 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxnutw95JjD2AEAA--.10358S3;
	Fri, 09 Dec 2022 16:53:04 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxV1dt95Jj7xUpAA--.16661S2;
	Fri, 09 Dec 2022 16:53:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/4] Add kprobe and kretprobe support for LoongArch
Date: Fri,  9 Dec 2022 16:52:57 +0800
Message-Id: <1670575981-14389-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8BxV1dt95Jj7xUpAA--.16661S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJF4furW8Xr1rJry3KrW3Wrg_yoW5XFyDpF
	9rAwn5Kr4rWrn3Zr9xta4Uur1Sqw4kG3y7W3W7JrWrZ3W7ZryUAr4xKrZxXFy8Gws0qr1S
	qr1fXrWagFyfGa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x07j8sqAUUUUU=
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

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

Tiezhu Yang (4):
  LoongArch: Simulate branch and PC instructions
  LoongArch: Add kprobe support
  LoongArch: Add kretprobe support
  samples/kprobes: Add LoongArch support

 arch/loongarch/Kconfig                     |   2 +
 arch/loongarch/include/asm/inst.h          |  20 ++
 arch/loongarch/include/asm/kprobes.h       |  59 +++++
 arch/loongarch/include/asm/ptrace.h        |   1 +
 arch/loongarch/kernel/Makefile             |   2 +
 arch/loongarch/kernel/inst.c               | 123 ++++++++++
 arch/loongarch/kernel/kprobes.c            | 364 +++++++++++++++++++++++++++++
 arch/loongarch/kernel/kprobes_trampoline.S |  96 ++++++++
 arch/loongarch/kernel/traps.c              |  13 +-
 arch/loongarch/mm/fault.c                  |   3 +
 samples/kprobes/kprobe_example.c           |   8 +
 11 files changed, 687 insertions(+), 4 deletions(-)
 create mode 100644 arch/loongarch/include/asm/kprobes.h
 create mode 100644 arch/loongarch/kernel/kprobes.c
 create mode 100644 arch/loongarch/kernel/kprobes_trampoline.S

-- 
2.1.0

