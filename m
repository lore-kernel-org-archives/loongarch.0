Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B1D186A
	for <loongarch@lists.linux.dev>; Thu, 27 Oct 2022 11:12:52 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxjrexZ1pjJt4CAA--.6038S3;
	Thu, 27 Oct 2022 19:12:50 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuCuZ1pjOdQFAA--.20808S2;
	Thu, 27 Oct 2022 19:12:47 +0800 (CST)
From: Jinyang He <hejinyang@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3] LoongArch: Remove unused kernel stack padding
Date: Thu, 27 Oct 2022 19:11:49 +0800
Message-Id: <20221027111149.27414-1-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuCuZ1pjOdQFAA--.20808S2
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJF4fJryxJryDCFWfWF13CFg_yoWrWFyfpF
	9rAw1DGr4jkF1vyryDtws8ZryDJwnrKw12ga13ta4rCrnFqF1rXryxAryDXFyYqa95Kw40
	gFyfKwsIqa15J3JanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
	kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
	6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIY
	CTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU

The current LoongArch kernel stack is padded as if obeying the
MIPS o32 calling convention, signifying the port's MIPS lineage
but no longer making sense. Remove the padding for clarity.

Link: https://lore.kernel.org/loongarch/1662130897-13156-1-git-send-email-hejinyang@loongson.cn/
Reviewed-by: WANG Xuerui <git@xen0n.name>
Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
v2: Remove TOP_OF_KERNEL_STACK_PADDING
    Remove 'init stack pointer' in head.S
v3: Improve commit message suggested by Xuerui
    Add Reviewed-by tags

 arch/loongarch/include/asm/processor.h | 2 +-
 arch/loongarch/include/asm/ptrace.h    | 2 +-
 arch/loongarch/kernel/head.S           | 3 +--
 arch/loongarch/kernel/process.c        | 4 ++--
 arch/loongarch/kernel/switch.S         | 2 +-
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
index 6954dc5d24e9..7184f1dc61f2 100644
--- a/arch/loongarch/include/asm/processor.h
+++ b/arch/loongarch/include/asm/processor.h
@@ -191,7 +191,7 @@ static inline void flush_thread(void)
 unsigned long __get_wchan(struct task_struct *p);
 
 #define __KSTK_TOS(tsk) ((unsigned long)task_stack_page(tsk) + \
-			 THREAD_SIZE - 32 - sizeof(struct pt_regs))
+			 THREAD_SIZE - sizeof(struct pt_regs))
 #define task_pt_regs(tsk) ((struct pt_regs *)__KSTK_TOS(tsk))
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->csr_era)
 #define KSTK_ESP(tsk) (task_pt_regs(tsk)->regs[3])
diff --git a/arch/loongarch/include/asm/ptrace.h b/arch/loongarch/include/asm/ptrace.h
index 7437b9366c3b..59c4608de91d 100644
--- a/arch/loongarch/include/asm/ptrace.h
+++ b/arch/loongarch/include/asm/ptrace.h
@@ -133,7 +133,7 @@ static inline void die_if_kernel(const char *str, struct pt_regs *regs)
 #define current_pt_regs()						\
 ({									\
 	unsigned long sp = (unsigned long)__builtin_frame_address(0);	\
-	(struct pt_regs *)((sp | (THREAD_SIZE - 1)) + 1 - 32) - 1;	\
+	(struct pt_regs *)((sp | (THREAD_SIZE - 1)) + 1) - 1;		\
 })
 
 /* Helpers for working with the user stack pointer */
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 97425779ce9f..84970e266658 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -84,10 +84,9 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 
 	la.pcrel	tp, init_thread_union
 	/* Set the SP after an empty pt_regs.  */
-	PTR_LI		sp, (_THREAD_SIZE - 32 - PT_SIZE)
+	PTR_LI		sp, (_THREAD_SIZE - PT_SIZE)
 	PTR_ADD		sp, sp, tp
 	set_saved_sp	sp, t0, t1
-	PTR_ADDI	sp, sp, -4 * SZREG	# init stack pointer
 
 	bl		start_kernel
 	ASM_BUG()
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 1256e3582475..2526b68f1c0f 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -129,7 +129,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long clone_flags = args->flags;
 	struct pt_regs *childregs, *regs = current_pt_regs();
 
-	childksp = (unsigned long)task_stack_page(p) + THREAD_SIZE - 32;
+	childksp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 
 	/* set up new TSS. */
 	childregs = (struct pt_regs *) childksp - 1;
@@ -236,7 +236,7 @@ bool in_task_stack(unsigned long stack, struct task_struct *task,
 			struct stack_info *info)
 {
 	unsigned long begin = (unsigned long)task_stack_page(task);
-	unsigned long end = begin + THREAD_SIZE - 32;
+	unsigned long end = begin + THREAD_SIZE;
 
 	if (stack < begin || stack >= end)
 		return false;
diff --git a/arch/loongarch/kernel/switch.S b/arch/loongarch/kernel/switch.S
index 43ebbc3990f7..202a163cb32f 100644
--- a/arch/loongarch/kernel/switch.S
+++ b/arch/loongarch/kernel/switch.S
@@ -26,7 +26,7 @@ SYM_FUNC_START(__switch_to)
 	move	tp, a2
 	cpu_restore_nonscratch a1
 
-	li.w		t0, _THREAD_SIZE - 32
+	li.w		t0, _THREAD_SIZE
 	PTR_ADD		t0, t0, tp
 	set_saved_sp	t0, t1, t2
 
-- 
2.34.3

