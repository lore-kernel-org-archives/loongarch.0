Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D687A48
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613589; bh=eftmRP/uuGCXDMpS4CR3oIU6nH8VqvBDOls1G8JYlqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UJ93+34iwNli3rWCMcavlXUVx6phJbQj+HIQTEYW5iBQQaIGhvmTzxBswZLphC7XS
	 fgUEMn+8XWJpxWdbdMdunNN/tLuaw4E4uFrAUVX1lDsF1+ZDKDE6GOd2SWd0n2TZuD
	 tqyoRfiwcDFwM7L6A8fk6b9csIHIpRSlyHbP7n2E=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 87EC86018C;
	Mon, 24 Oct 2022 20:13:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 02/13] LoongArch: Rename CSR_ESTAT_EXC -> CSR_ESTAT_ECODE
Date: Mon, 24 Oct 2022 20:12:54 +0800
Message-Id: <20221024121305.381776-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024121305.381776-1-kernel@xen0n.name>
References: <20221024121305.381776-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Clean up more MIPS leftover, where exception codes are named
"exc"-something instead of "ecode".

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 10 +++++-----
 arch/loongarch/kernel/traps.c          |  8 ++++----
 arch/loongarch/mm/fault.c              |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 534352d6ed18..ca01d04c784e 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -318,9 +318,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_ESTAT_ESUBCODE_SHIFT	22
 #define  CSR_ESTAT_ESUBCODE_WIDTH	9
 #define  CSR_ESTAT_ESUBCODE		(_ULCAST_(0x1ff) << CSR_ESTAT_ESUBCODE_SHIFT)
-#define  CSR_ESTAT_EXC_SHIFT		16
-#define  CSR_ESTAT_EXC_WIDTH		6
-#define  CSR_ESTAT_EXC			(_ULCAST_(0x3f) << CSR_ESTAT_EXC_SHIFT)
+#define  CSR_ESTAT_ECODE_SHIFT		16
+#define  CSR_ESTAT_ECODE_WIDTH		6
+#define  CSR_ESTAT_ECODE		(_ULCAST_(0x3f) << CSR_ESTAT_ECODE_SHIFT)
 #define  CSR_ESTAT_IS_SHIFT		0
 #define  CSR_ESTAT_IS_WIDTH		15
 #define  CSR_ESTAT_IS			(_ULCAST_(0x7fff) << CSR_ESTAT_IS_SHIFT)
@@ -1194,9 +1194,9 @@ static inline void csr_any_send(unsigned int addr, unsigned int data,
 	iocsr_write64(val, LOONGARCH_IOCSR_ANY_SEND);
 }
 
-static inline unsigned int read_csr_excode(void)
+static inline unsigned int read_csr_ecode(void)
 {
-	return (csr_read32(LOONGARCH_CSR_ESTAT) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
+	return (csr_read32(LOONGARCH_CSR_ESTAT) & CSR_ESTAT_ECODE) >> CSR_ESTAT_ECODE_SHIFT;
 }
 
 static inline void write_csr_index(unsigned int idx)
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 7ea62faeeadb..8d959e853ec3 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -194,7 +194,7 @@ static void __show_regs(const struct pt_regs *regs)
 
 	pr_cont("\n");
 
-	exccode = ((regs->csr_estat) & CSR_ESTAT_EXC) >> CSR_ESTAT_EXC_SHIFT;
+	exccode = ((regs->csr_estat) & CSR_ESTAT_ECODE) >> CSR_ESTAT_ECODE_SHIFT;
 	excsubcode = ((regs->csr_estat) & CSR_ESTAT_ESUBCODE) >> CSR_ESTAT_ESUBCODE_SHIFT;
 	printk("ExcCode : %x (SubCode %x)\n", exccode, excsubcode);
 
@@ -436,7 +436,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
 	irqentry_state_t state = irqentry_enter(regs);
 
 	local_irq_enable();
-	current->thread.trap_nr = read_csr_excode();
+	current->thread.trap_nr = read_csr_ecode();
 	if (__get_inst(&opcode, (u32 *)era, user))
 		goto out_sigsegv;
 
@@ -520,7 +520,7 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
 	irqentry_state_t state = irqentry_enter(regs);
 
 	local_irq_enable();
-	current->thread.trap_nr = read_csr_excode();
+	current->thread.trap_nr = read_csr_ecode();
 
 	if (notify_die(DIE_RI, "RI Fault", regs, 0, current->thread.trap_nr,
 		       SIGILL) == NOTIFY_STOP)
@@ -612,7 +612,7 @@ asmlinkage void noinstr do_reserved(struct pt_regs *regs)
 	 * caused by a fatal error after another hardware/software error.
 	 */
 	pr_err("Caught reserved exception %u on pid:%d [%s] - should not happen\n",
-		read_csr_excode(), current->pid, current->comm);
+		read_csr_ecode(), current->pid, current->comm);
 	die_if_kernel("do_reserved exception", regs);
 	force_sig(SIGUNUSED);
 
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 1ccd53655cab..062632205020 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -78,7 +78,7 @@ static void __kprobes do_sigbus(struct pt_regs *regs,
 	 * or user mode.
 	 */
 	current->thread.csr_badvaddr = address;
-	current->thread.trap_nr = read_csr_excode();
+	current->thread.trap_nr = read_csr_ecode();
 	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *)address);
 }
 
@@ -100,7 +100,7 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
 		current->thread.error_code = 1;
 	else
 		current->thread.error_code = 2;
-	current->thread.trap_nr = read_csr_excode();
+	current->thread.trap_nr = read_csr_ecode();
 
 	if (show_unhandled_signals &&
 	    unhandled_signal(current, SIGSEGV) && __ratelimit(&ratelimit_state)) {
-- 
2.38.0

