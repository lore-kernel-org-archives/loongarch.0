Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107D54C8B
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851056; bh=UTjL3AkBhih4nagKvLFj+cPKxcs0YUgLvIbMJ1itsBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lT78SswhyzoEzkIX3+TaNXICY5NHLSZeOVCV9EZXx9uE6mrkuRx0Fu2ZjwXZYKr4v
	 W9enfNFoaMXnb1LMEoHryCyxkTJa8/UnxuO9KmCIxPTWIGxpWhZONidXao2BUPFUY5
	 te9amPaLaH9LsUx44600q5TF1vGClh75/HXpnHBs=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E25ED60689;
	Tue, 26 Jul 2022 23:57:35 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 4/8] LoongArch: Use the "move" pseudo-instruction where applicable
Date: Tue, 26 Jul 2022 23:57:18 +0800
Message-Id: <20220726155722.2402337-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726155722.2402337-1-kernel@xen0n.name>
References: <20220726155722.2402337-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Some of the assembly code in the LoongArch port likely originated
from a time when the assembler did not support pseudo-instructions like
"move" or "jr", so the desugared form was used and readability suffers
(to a minor degree) as a result.

As the upstream toolchain supports these pseudo-instructions from the
beginning, migrate the existing few usages to them for better
readability.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/atomic.h  | 8 ++++----
 arch/loongarch/include/asm/cmpxchg.h | 2 +-
 arch/loongarch/include/asm/futex.h   | 2 +-
 arch/loongarch/include/asm/uaccess.h | 2 +-
 arch/loongarch/kernel/head.S         | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
index 979367ad4e2c..a0a33ee793d6 100644
--- a/arch/loongarch/include/asm/atomic.h
+++ b/arch/loongarch/include/asm/atomic.h
@@ -157,7 +157,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		__asm__ __volatile__(
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	addi.w	%0, %1, %3				\n"
-		"	or	%1, %0, $zero				\n"
+		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.w	%1, %2					\n"
 		"	beq	$zero, %1, 1b				\n"
@@ -170,7 +170,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		__asm__ __volatile__(
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	sub.w	%0, %1, %3				\n"
-		"	or	%1, %0, $zero				\n"
+		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.w	%1, %2					\n"
 		"	beq	$zero, %1, 1b				\n"
@@ -320,7 +320,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		__asm__ __volatile__(
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	addi.d	%0, %1, %3				\n"
-		"	or	%1, %0, $zero				\n"
+		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.d	%1, %2					\n"
 		"	beq	%1, $zero, 1b				\n"
@@ -333,7 +333,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		__asm__ __volatile__(
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	sub.d	%0, %1, %3				\n"
-		"	or	%1, %0, $zero				\n"
+		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.d	%1, %2					\n"
 		"	beq	%1, $zero, 1b				\n"
diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 75b3a4478652..9e9939196471 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -55,7 +55,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 	__asm__ __volatile__(						\
 	"1:	" ld "	%0, %2		# __cmpxchg_asm \n"		\
 	"	bne	%0, %z3, 2f			\n"		\
-	"	or	$t0, %z4, $zero			\n"		\
+	"	move	$t0, %z4			\n"		\
 	"	" st "	$t0, %1				\n"		\
 	"	beq	$zero, $t0, 1b			\n"		\
 	"2:						\n"		\
diff --git a/arch/loongarch/include/asm/futex.h b/arch/loongarch/include/asm/futex.h
index 9de8231694ec..170ec9f97e58 100644
--- a/arch/loongarch/include/asm/futex.h
+++ b/arch/loongarch/include/asm/futex.h
@@ -82,7 +82,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr, u32 oldval, u32 newv
 	"# futex_atomic_cmpxchg_inatomic			\n"
 	"1:	ll.w	%1, %3					\n"
 	"	bne	%1, %z4, 3f				\n"
-	"	or	$t0, %z5, $zero				\n"
+	"	move	$t0, %z5				\n"
 	"2:	sc.w	$t0, %2					\n"
 	"	beq	$zero, $t0, 1b				\n"
 	"3:							\n"
diff --git a/arch/loongarch/include/asm/uaccess.h b/arch/loongarch/include/asm/uaccess.h
index 42da43211765..2b44edc604a2 100644
--- a/arch/loongarch/include/asm/uaccess.h
+++ b/arch/loongarch/include/asm/uaccess.h
@@ -162,7 +162,7 @@ do {									\
 	"2:							\n"	\
 	"	.section .fixup,\"ax\"				\n"	\
 	"3:	li.w	%0, %3					\n"	\
-	"	or	%1, $zero, $zero			\n"	\
+	"	move	%1, $zero				\n"	\
 	"	b	2b					\n"	\
 	"	.previous					\n"	\
 	"	.section __ex_table,\"a\"			\n"	\
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index e553c5fc17da..fd6a62f17161 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -50,7 +50,7 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	/* KSave3 used for percpu base, initialized as 0 */
 	csrwr		zero, PERCPU_BASE_KS
 	/* GPR21 used for percpu base (runtime), initialized as 0 */
-	or		u0, zero, zero
+	move		u0, zero
 
 	la		tp, init_thread_union
 	/* Set the SP after an empty pt_regs.  */
-- 
2.35.1

