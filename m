Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B75CA58
	for <loongarch@lists.linux.dev>; Sat, 26 Aug 2023 14:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E28CC433C7;
	Sat, 26 Aug 2023 14:23:52 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH V2] LoongArch: Ensure FP/SIMD registers in the core dump file is up to date
Date: Sat, 26 Aug 2023 22:23:41 +0800
Message-Id: <20230826142341.4107728-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a port of commit 379eb01c21795edb4c ("riscv: Ensure the value
of FP registers in the core dump file is up to date").

The values of FP/SIMD registers in the core dump file come from the
thread.fpu. However, kernel saves the FP/SIMD registers only before
scheduling out the process. If no process switch happens during the
exception handling, kernel will not have a chance to save the latest
values of FP/SIMD registers. So it may cause their values in the core
dump file incorrect. To solve this problem, force fpr_get()/simd_get()
to save the FP/SIMD registers into the thread.fpu if the target task
equals the current task.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Rename get_fpu_regs() to save_fpu_regs().

 arch/loongarch/include/asm/fpu.h | 22 ++++++++++++++++++----
 arch/loongarch/kernel/ptrace.c   |  4 ++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index b541f6248837..08a45e9fd15c 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -173,16 +173,30 @@ static inline void restore_fp(struct task_struct *tsk)
 		_restore_fp(&tsk->thread.fpu);
 }
 
-static inline union fpureg *get_fpu_regs(struct task_struct *tsk)
+static inline void save_fpu_regs(struct task_struct *tsk)
 {
+	unsigned int euen;
+
 	if (tsk == current) {
 		preempt_disable();
-		if (is_fpu_owner())
+
+		euen = csr_read32(LOONGARCH_CSR_EUEN);
+
+#ifdef CONFIG_CPU_HAS_LASX
+		if (euen & CSR_EUEN_LASXEN)
+			_save_lasx(&current->thread.fpu);
+		else
+#endif
+#ifdef CONFIG_CPU_HAS_LSX
+		if (euen & CSR_EUEN_LSXEN)
+			_save_lsx(&current->thread.fpu);
+		else
+#endif
+		if (euen & CSR_EUEN_FPEN)
 			_save_fp(&current->thread.fpu);
+
 		preempt_enable();
 	}
-
-	return tsk->thread.fpu.fpr;
 }
 
 static inline int is_simd_owner(void)
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index a0767c3a0f0a..9a75dc43eb29 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -147,6 +147,8 @@ static int fpr_get(struct task_struct *target,
 {
 	int r;
 
+	save_fpu_regs(target);
+
 	if (sizeof(target->thread.fpu.fpr[0]) == sizeof(elf_fpreg_t))
 		r = gfpr_get(target, &to);
 	else
@@ -278,6 +280,8 @@ static int simd_get(struct task_struct *target,
 {
 	const unsigned int wr_size = NUM_FPU_REGS * regset->size;
 
+	save_fpu_regs(target);
+
 	if (!tsk_used_math(target)) {
 		/* The task hasn't used FP or LSX, fill with 0xff */
 		copy_pad_fprs(target, regset, &to, 0);
-- 
2.39.3

