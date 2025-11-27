Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B453A2C0274;
	Thu, 27 Nov 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258777; cv=none; b=Sg+Q0J8qzf4lagie4vO48GK6flvp5aDfvfx3N6PxG26/w33bIRv7vwWfXAMz87w4FL4wiIvWkQcJJX1Uhsq5+CGVf7OrBqFtdz0ogz9Z5zskVn1Xz31nMW0e+A9hZuf4Fzzm9ZSyf7/JWq99YrHtED0vKNFNJTNUJCZvEU7J4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258777; c=relaxed/simple;
	bh=H9oagXPUlnj4v8+KtBtzEi/ls2DQKmjaq14rxQeDbXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSipSj2sOrGjfbDzcNdJG92E1sFNvQtTewhu5eriTff1+7t0gO3wAjMsha3oGfuTieKF6PxhtJxYlimqaIs9IgwOE94c2xQy7Kedne+4nP2WQh6zElDbCD9rAbZkQ3ElPVN+7bRNZCLLbv2xR0e0CvEjpq42dVh/jaWwSRvHV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F240C113D0;
	Thu, 27 Nov 2025 15:52:55 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH V4 06/14] LoongArch: Adjust process management for 32BIT/64BIT
Date: Thu, 27 Nov 2025 23:48:24 +0800
Message-ID: <20251127154832.137925-7-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127154832.137925-1-chenhuacai@loongson.cn>
References: <20251127154832.137925-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust memory management for both 32BIT and 64BIT, including: CPU
context switching, FPU loading/restoring, process dumping and process
tracing routines.

Q: Why modify switch.S?
A: LoongArch32 has no ldptr.d/stptr.d instructions, and asm offsets of
   thead_struct members are too large to be filled in the 12b immediate
   field of ld.w/st.w.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/elf.h         |   1 +
 arch/loongarch/include/asm/inst.h        |  12 ++-
 arch/loongarch/include/uapi/asm/ptrace.h |  10 ++
 arch/loongarch/kernel/fpu.S              | 111 +++++++++++++++++++++++
 arch/loongarch/kernel/process.c          |   6 +-
 arch/loongarch/kernel/ptrace.c           |   5 +
 arch/loongarch/kernel/switch.S           |  28 ++++--
 7 files changed, 157 insertions(+), 16 deletions(-)

diff --git a/arch/loongarch/include/asm/elf.h b/arch/loongarch/include/asm/elf.h
index f16bd42456e4..1b6489427e30 100644
--- a/arch/loongarch/include/asm/elf.h
+++ b/arch/loongarch/include/asm/elf.h
@@ -156,6 +156,7 @@ typedef elf_greg_t elf_gregset_t[ELF_NGREG];
 typedef double elf_fpreg_t;
 typedef elf_fpreg_t elf_fpregset_t[ELF_NFPREG];
 
+void loongarch_dump_regs32(u32 *uregs, const struct pt_regs *regs);
 void loongarch_dump_regs64(u64 *uregs, const struct pt_regs *regs);
 
 #ifdef CONFIG_32BIT
diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 55e64a12a124..f9f207082d0e 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -438,8 +438,10 @@ static inline bool is_branch_ins(union loongarch_instruction *ip)
 
 static inline bool is_ra_save_ins(union loongarch_instruction *ip)
 {
-	/* st.d $ra, $sp, offset */
-	return ip->reg2i12_format.opcode == std_op &&
+	const u32 opcode = IS_ENABLED(CONFIG_32BIT) ? stw_op : std_op;
+
+	/* st.w / st.d $ra, $sp, offset */
+	return ip->reg2i12_format.opcode == opcode &&
 		ip->reg2i12_format.rj == LOONGARCH_GPR_SP &&
 		ip->reg2i12_format.rd == LOONGARCH_GPR_RA &&
 		!is_imm12_negative(ip->reg2i12_format.immediate);
@@ -447,8 +449,10 @@ static inline bool is_ra_save_ins(union loongarch_instruction *ip)
 
 static inline bool is_stack_alloc_ins(union loongarch_instruction *ip)
 {
-	/* addi.d $sp, $sp, -imm */
-	return ip->reg2i12_format.opcode == addid_op &&
+	const u32 opcode = IS_ENABLED(CONFIG_32BIT) ? addiw_op : addid_op;
+
+	/* addi.w / addi.d $sp, $sp, -imm */
+	return ip->reg2i12_format.opcode == opcode &&
 		ip->reg2i12_format.rj == LOONGARCH_GPR_SP &&
 		ip->reg2i12_format.rd == LOONGARCH_GPR_SP &&
 		is_imm12_negative(ip->reg2i12_format.immediate);
diff --git a/arch/loongarch/include/uapi/asm/ptrace.h b/arch/loongarch/include/uapi/asm/ptrace.h
index 215e0f9e8aa3..b35c794323bc 100644
--- a/arch/loongarch/include/uapi/asm/ptrace.h
+++ b/arch/loongarch/include/uapi/asm/ptrace.h
@@ -61,8 +61,13 @@ struct user_lbt_state {
 struct user_watch_state {
 	__u64 dbg_info;
 	struct {
+#if __BITS_PER_LONG == 32
+		__u32    addr;
+		__u32    mask;
+#else
 		__u64    addr;
 		__u64    mask;
+#endif
 		__u32    ctrl;
 		__u32    pad;
 	} dbg_regs[8];
@@ -71,8 +76,13 @@ struct user_watch_state {
 struct user_watch_state_v2 {
 	__u64 dbg_info;
 	struct {
+#if __BITS_PER_LONG == 32
+		__u32    addr;
+		__u32    mask;
+#else
 		__u64    addr;
 		__u64    mask;
+#endif
 		__u32    ctrl;
 		__u32    pad;
 	} dbg_regs[14];
diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index 28caf416ae36..f225dcc5b530 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -96,6 +96,49 @@
 	EX	fld.d	$f31, \base, (31 * FPU_REG_WIDTH)
 	.endm
 
+#ifdef CONFIG_32BIT
+	.macro sc_save_fcc thread tmp0 tmp1
+	movcf2gr	\tmp0, $fcc0
+	move		\tmp1, \tmp0
+	movcf2gr	\tmp0, $fcc1
+	bstrins.w	\tmp1, \tmp0, 15, 8
+	movcf2gr	\tmp0, $fcc2
+	bstrins.w	\tmp1, \tmp0, 23, 16
+	movcf2gr	\tmp0, $fcc3
+	bstrins.w	\tmp1, \tmp0, 31, 24
+	EX	st.w	\tmp1, \thread, THREAD_FCC
+	movcf2gr	\tmp0, $fcc4
+	move		\tmp1, \tmp0
+	movcf2gr	\tmp0, $fcc5
+	bstrins.w	\tmp1, \tmp0, 15, 8
+	movcf2gr	\tmp0, $fcc6
+	bstrins.w	\tmp1, \tmp0, 23, 16
+	movcf2gr	\tmp0, $fcc7
+	bstrins.w	\tmp1, \tmp0, 31, 24
+	EX	st.w	\tmp1, \thread, (THREAD_FCC + 4)
+	.endm
+
+	.macro sc_restore_fcc thread tmp0 tmp1
+	EX	ld.w	\tmp0, \thread, THREAD_FCC
+	bstrpick.w	\tmp1, \tmp0, 7, 0
+	movgr2cf	$fcc0, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 15, 8
+	movgr2cf	$fcc1, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 23, 16
+	movgr2cf	$fcc2, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 31, 24
+	movgr2cf	$fcc3, \tmp1
+	EX	ld.w	\tmp0, \thread, (THREAD_FCC + 4)
+	bstrpick.w	\tmp1, \tmp0, 7, 0
+	movgr2cf	$fcc4, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 15, 8
+	movgr2cf	$fcc5, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 23, 16
+	movgr2cf	$fcc6, \tmp1
+	bstrpick.w	\tmp1, \tmp0, 31, 24
+	movgr2cf	$fcc7, \tmp1
+	.endm
+#else
 	.macro sc_save_fcc base, tmp0, tmp1
 	movcf2gr	\tmp0, $fcc0
 	move		\tmp1, \tmp0
@@ -135,6 +178,7 @@
 	bstrpick.d	\tmp1, \tmp0, 63, 56
 	movgr2cf	$fcc7, \tmp1
 	.endm
+#endif
 
 	.macro sc_save_fcsr base, tmp0
 	movfcsr2gr	\tmp0, fcsr0
@@ -410,6 +454,72 @@ SYM_FUNC_START(_init_fpu)
 
 	li.w	t1, -1				# SNaN
 
+#ifdef CONFIG_32BIT
+	movgr2fr.w	$f0, t1
+	movgr2frh.w	$f0, t1
+	movgr2fr.w	$f1, t1
+	movgr2frh.w	$f1, t1
+	movgr2fr.w	$f2, t1
+	movgr2frh.w	$f2, t1
+	movgr2fr.w	$f3, t1
+	movgr2frh.w	$f3, t1
+	movgr2fr.w	$f4, t1
+	movgr2frh.w	$f4, t1
+	movgr2fr.w	$f5, t1
+	movgr2frh.w	$f5, t1
+	movgr2fr.w	$f6, t1
+	movgr2frh.w	$f6, t1
+	movgr2fr.w	$f7, t1
+	movgr2frh.w	$f7, t1
+	movgr2fr.w	$f8, t1
+	movgr2frh.w	$f8, t1
+	movgr2fr.w	$f9, t1
+	movgr2frh.w	$f9, t1
+	movgr2fr.w	$f10, t1
+	movgr2frh.w	$f10, t1
+	movgr2fr.w	$f11, t1
+	movgr2frh.w	$f11, t1
+	movgr2fr.w	$f12, t1
+	movgr2frh.w	$f12, t1
+	movgr2fr.w	$f13, t1
+	movgr2frh.w	$f13, t1
+	movgr2fr.w	$f14, t1
+	movgr2frh.w	$f14, t1
+	movgr2fr.w	$f15, t1
+	movgr2frh.w	$f15, t1
+	movgr2fr.w	$f16, t1
+	movgr2frh.w	$f16, t1
+	movgr2fr.w	$f17, t1
+	movgr2frh.w	$f17, t1
+	movgr2fr.w	$f18, t1
+	movgr2frh.w	$f18, t1
+	movgr2fr.w	$f19, t1
+	movgr2frh.w	$f19, t1
+	movgr2fr.w	$f20, t1
+	movgr2frh.w	$f20, t1
+	movgr2fr.w	$f21, t1
+	movgr2frh.w	$f21, t1
+	movgr2fr.w	$f22, t1
+	movgr2frh.w	$f22, t1
+	movgr2fr.w	$f23, t1
+	movgr2frh.w	$f23, t1
+	movgr2fr.w	$f24, t1
+	movgr2frh.w	$f24, t1
+	movgr2fr.w	$f25, t1
+	movgr2frh.w	$f25, t1
+	movgr2fr.w	$f26, t1
+	movgr2frh.w	$f26, t1
+	movgr2fr.w	$f27, t1
+	movgr2frh.w	$f27, t1
+	movgr2fr.w	$f28, t1
+	movgr2frh.w	$f28, t1
+	movgr2fr.w	$f29, t1
+	movgr2frh.w	$f29, t1
+	movgr2fr.w	$f30, t1
+	movgr2frh.w	$f30, t1
+	movgr2fr.w	$f31, t1
+	movgr2frh.w	$f31, t1
+#else
 	movgr2fr.d	$f0, t1
 	movgr2fr.d	$f1, t1
 	movgr2fr.d	$f2, t1
@@ -442,6 +552,7 @@ SYM_FUNC_START(_init_fpu)
 	movgr2fr.d	$f29, t1
 	movgr2fr.d	$f30, t1
 	movgr2fr.d	$f31, t1
+#endif
 
 	jr	ra
 SYM_FUNC_END(_init_fpu)
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index d1e04f9e0f79..4ac1c3086152 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -382,8 +382,11 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, raise_backtrace);
 }
 
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_32BIT
+void loongarch_dump_regs32(u32 *uregs, const struct pt_regs *regs)
+#else
 void loongarch_dump_regs64(u64 *uregs, const struct pt_regs *regs)
+#endif
 {
 	unsigned int i;
 
@@ -400,4 +403,3 @@ void loongarch_dump_regs64(u64 *uregs, const struct pt_regs *regs)
 	uregs[LOONGARCH_EF_CSR_ECFG] = regs->csr_ecfg;
 	uregs[LOONGARCH_EF_CSR_ESTAT] = regs->csr_estat;
 }
-#endif /* CONFIG_64BIT */
diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
index 8edd0954e55a..bea376e87d4e 100644
--- a/arch/loongarch/kernel/ptrace.c
+++ b/arch/loongarch/kernel/ptrace.c
@@ -650,8 +650,13 @@ static int ptrace_hbp_set_addr(unsigned int note_type,
 	struct perf_event_attr attr;
 
 	/* Kernel-space address cannot be monitored by user-space */
+#ifdef CONFIG_32BIT
+	if ((unsigned long)addr >= KPRANGE1)
+		return -EINVAL;
+#else
 	if ((unsigned long)addr >= XKPRANGE)
 		return -EINVAL;
+#endif
 
 	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
 	if (IS_ERR(bp))
diff --git a/arch/loongarch/kernel/switch.S b/arch/loongarch/kernel/switch.S
index 3007e909e0d8..f377d8f5c51a 100644
--- a/arch/loongarch/kernel/switch.S
+++ b/arch/loongarch/kernel/switch.S
@@ -16,18 +16,23 @@
  */
 	.align	5
 SYM_FUNC_START(__switch_to)
-	csrrd	t1, LOONGARCH_CSR_PRMD
-	stptr.d	t1, a0, THREAD_CSRPRMD
+#ifdef CONFIG_32BIT
+	PTR_ADDI	a0, a0, TASK_STRUCT_OFFSET
+	PTR_ADDI	a1, a1, TASK_STRUCT_OFFSET
+#endif
+	csrrd		t1, LOONGARCH_CSR_PRMD
+	LONG_SPTR	t1, a0, (THREAD_CSRPRMD - TASK_STRUCT_OFFSET)
 
 	cpu_save_nonscratch a0
-	stptr.d	ra, a0, THREAD_REG01
-	stptr.d a3, a0, THREAD_SCHED_RA
-	stptr.d a4, a0, THREAD_SCHED_CFA
+	LONG_SPTR	a3, a0, (THREAD_SCHED_RA - TASK_STRUCT_OFFSET)
+	LONG_SPTR	a4, a0, (THREAD_SCHED_CFA - TASK_STRUCT_OFFSET)
+
 #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
-	la	t7, __stack_chk_guard
-	ldptr.d	t8, a1, TASK_STACK_CANARY
-	stptr.d	t8, t7, 0
+	la		t7, __stack_chk_guard
+	LONG_LPTR	t8, a1, (TASK_STACK_CANARY - TASK_STRUCT_OFFSET)
+	LONG_SPTR	t8, t7, 0
 #endif
+
 	move	tp, a2
 	cpu_restore_nonscratch a1
 
@@ -35,8 +40,11 @@ SYM_FUNC_START(__switch_to)
 	PTR_ADD		t0, t0, tp
 	set_saved_sp	t0, t1, t2
 
-	ldptr.d	t1, a1, THREAD_CSRPRMD
-	csrwr	t1, LOONGARCH_CSR_PRMD
+	LONG_LPTR	t1, a1, (THREAD_CSRPRMD - TASK_STRUCT_OFFSET)
+	csrwr		t1, LOONGARCH_CSR_PRMD
 
+#ifdef CONFIG_32BIT
+	PTR_ADDI	a0, a0, -TASK_STRUCT_OFFSET
+#endif
 	jr	ra
 SYM_FUNC_END(__switch_to)
-- 
2.47.3

