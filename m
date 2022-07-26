Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A3812
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658838575; bh=HoBJTAdW2N4EMm26i7Zsev5CtXykN63/jyjzu+JPMao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pCNTAVgtT9QlYfyKb3+Rtu/e+wmKNmA5Y7NUGlyXPCg4AEtP/KoAw4YlPYak0HLaT
	 1n8VXcb7+7o6RbxzOZvxOCmZYYhUH/oL/H8AlcuD0Qy8/Y9332MxGX6yWt0wXTWSeZ
	 NGkm2c/7mHutD4XHSWD/ZAJ0qgTKp1fZu5wDP1hI=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C886360685;
	Tue, 26 Jul 2022 20:29:35 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 4/6] LoongArch: Simplify "BEQ foo, zero" with BEQZ
Date: Tue, 26 Jul 2022 20:29:18 +0800
Message-Id: <20220726122920.2291947-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726122920.2291947-1-kernel@xen0n.name>
References: <20220726122920.2291947-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

While BEQZ and BEQ are different instructions, and the vastly expanded
range for branch destination does not really matter in the few cases
touched, use the BEQZ where possible for shorter lines and better
consistency (some places used "BEQ foo, zero" while some used "BEQ zero,
foo").

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/atomic.h  | 8 ++++----
 arch/loongarch/include/asm/cmpxchg.h | 2 +-
 arch/loongarch/include/asm/futex.h   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
index a0a33ee793d6..0869bec2c937 100644
--- a/arch/loongarch/include/asm/atomic.h
+++ b/arch/loongarch/include/asm/atomic.h
@@ -160,7 +160,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.w	%1, %2					\n"
-		"	beq	$zero, %1, 1b				\n"
+		"	beqz	%1, 1b					\n"
 		"2:							\n"
 		__WEAK_LLSC_MB
 		: "=&r" (result), "=&r" (temp),
@@ -173,7 +173,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.w	%1, %2					\n"
-		"	beq	$zero, %1, 1b				\n"
+		"	beqz	%1, 1b					\n"
 		"2:							\n"
 		__WEAK_LLSC_MB
 		: "=&r" (result), "=&r" (temp),
@@ -323,7 +323,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.d	%1, %2					\n"
-		"	beq	%1, $zero, 1b				\n"
+		"	beqz	%1, 1b					\n"
 		"2:							\n"
 		__WEAK_LLSC_MB
 		: "=&r" (result), "=&r" (temp),
@@ -336,7 +336,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"	move	%1, %0					\n"
 		"	blt	%0, $zero, 2f				\n"
 		"	sc.d	%1, %2					\n"
-		"	beq	%1, $zero, 1b				\n"
+		"	beqz	%1, 1b					\n"
 		"2:							\n"
 		__WEAK_LLSC_MB
 		: "=&r" (result), "=&r" (temp),
diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index 9e9939196471..0a9b0fac1eee 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -57,7 +57,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 	"	bne	%0, %z3, 2f			\n"		\
 	"	move	$t0, %z4			\n"		\
 	"	" st "	$t0, %1				\n"		\
-	"	beq	$zero, $t0, 1b			\n"		\
+	"	beqz	$t0, 1b				\n"		\
 	"2:						\n"		\
 	__WEAK_LLSC_MB							\
 	: "=&r" (__ret), "=ZB"(*m)					\
diff --git a/arch/loongarch/include/asm/futex.h b/arch/loongarch/include/asm/futex.h
index 170ec9f97e58..837659335fb1 100644
--- a/arch/loongarch/include/asm/futex.h
+++ b/arch/loongarch/include/asm/futex.h
@@ -17,7 +17,7 @@
 	"1:	ll.w	%1, %4 # __futex_atomic_op\n"		\
 	"	" insn	"				\n"	\
 	"2:	sc.w	$t0, %2				\n"	\
-	"	beq	$t0, $zero, 1b			\n"	\
+	"	beqz	$t0, 1b				\n"	\
 	"3:						\n"	\
 	"	.section .fixup,\"ax\"			\n"	\
 	"4:	li.w	%0, %6				\n"	\
@@ -84,7 +84,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr, u32 oldval, u32 newv
 	"	bne	%1, %z4, 3f				\n"
 	"	move	$t0, %z5				\n"
 	"2:	sc.w	$t0, %2					\n"
-	"	beq	$zero, $t0, 1b				\n"
+	"	beqz	$t0, 1b					\n"
 	"3:							\n"
 	__WEAK_LLSC_MB
 	"	.section .fixup,\"ax\"				\n"
-- 
2.35.1

