Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F3180
	for <loongarch@lists.linux.dev>; Sun, 24 Jul 2022 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658669471; bh=4qbT8DoyoHLREdovm95KF4jkTAcraPcmvTA9Tz5uBwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctecu93lTkBCQlahNpsHTIIvLVBMUhAtUdesi7xRVlcu+qeAlgxxKs7uxGtwHkj71
	 njMH4WEZxgBNQM4cP99ETbLbkQFBaqe4CtF0bmdJybhktCk/I7YIeK1L8daHIlcV+T
	 zsh/SMhJz72YzVbsXJkfOt/cN2HJDWuj6RCp3POs=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3AD260680;
	Sun, 24 Jul 2022 21:31:10 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 2/4] LoongArch: Use the "move" pseudo-instruction where applicable
Date: Sun, 24 Jul 2022 21:30:50 +0800
Message-Id: <20220724133052.1872885-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724133052.1872885-1-kernel@xen0n.name>
References: <20220724133052.1872885-1-kernel@xen0n.name>
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
 arch/loongarch/kernel/head.S         | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

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

