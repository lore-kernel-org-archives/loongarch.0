Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6744C86
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851057; bh=nwsv5gXGRyHy4MqNgT5W3nF1vclkTo1ZDL/OB81kdL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0k1nPqjOsL+6KaoR/L9ujaRNYKV7xAbuZ3puiwyUXpk1WZ7LiMGZx2bSD1yA1QuA
	 HXNJrJ3XI3epDzlSRhBe/ZYoZB3bSAGX/x3+CiiC6jYjvcjFdxJ80wH7Q2Y2aFErfZ
	 PeRKkGtuwo3pu6vLRc1pRSYHe6SHCxQ4kTdDYpdE=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B76936068A;
	Tue, 26 Jul 2022 23:57:37 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 5/8] LoongArch: Simplify "BEQ/BNE foo, zero" with BEQZ/BNEZ
Date: Tue, 26 Jul 2022 23:57:19 +0800
Message-Id: <20220726155722.2402337-6-kernel@xen0n.name>
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

While B{EQ,NE}Z and B{EQ,NE} are different instructions, and the vastly
expanded range for branch destination does not really matter in the few
cases touched, use the B{EQ,NE}Z where possible for shorter lines and
better consistency (e.g. some places used "BEQ foo, zero", while some
used "BEQ zero, foo").

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/atomic.h  |  8 ++++----
 arch/loongarch/include/asm/cmpxchg.h |  2 +-
 arch/loongarch/include/asm/futex.h   |  4 ++--
 arch/loongarch/mm/tlbex.S            | 30 ++++++++++++++--------------
 4 files changed, 22 insertions(+), 22 deletions(-)

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
diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index f1234a9c311f..4d16e27020e0 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -80,7 +80,7 @@ vmalloc_done_load:
 	 * see if we need to jump to huge tlb processing.
 	 */
 	andi	t0, ra, _PAGE_HUGE
-	bne	t0, zero, tlb_huge_update_load
+	bnez	t0, tlb_huge_update_load
 
 	csrrd	t0, LOONGARCH_CSR_BADV
 	srli.d	t0, t0, (PAGE_SHIFT + PTE_ORDER)
@@ -100,12 +100,12 @@ smp_pgtable_change_load:
 
 	srli.d	ra, t0, _PAGE_PRESENT_SHIFT
 	andi	ra, ra, 1
-	beq	ra, zero, nopage_tlb_load
+	beqz	ra, nopage_tlb_load
 
 	ori	t0, t0, _PAGE_VALID
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, smp_pgtable_change_load
+	beqz	t0, smp_pgtable_change_load
 #else
 	st.d	t0, t1, 0
 #endif
@@ -139,13 +139,13 @@ tlb_huge_update_load:
 #endif
 	srli.d	ra, t0, _PAGE_PRESENT_SHIFT
 	andi	ra, ra, 1
-	beq	ra, zero, nopage_tlb_load
+	beqz	ra, nopage_tlb_load
 	tlbsrch
 
 	ori	t0, t0, _PAGE_VALID
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, tlb_huge_update_load
+	beqz	t0, tlb_huge_update_load
 	ld.d	t0, t1, 0
 #else
 	st.d	t0, t1, 0
@@ -244,7 +244,7 @@ vmalloc_done_store:
 	 * see if we need to jump to huge tlb processing.
 	 */
 	andi	t0, ra, _PAGE_HUGE
-	bne	t0, zero, tlb_huge_update_store
+	bnez	t0, tlb_huge_update_store
 
 	csrrd	t0, LOONGARCH_CSR_BADV
 	srli.d	t0, t0, (PAGE_SHIFT + PTE_ORDER)
@@ -265,12 +265,12 @@ smp_pgtable_change_store:
 	srli.d	ra, t0, _PAGE_PRESENT_SHIFT
 	andi	ra, ra, ((_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT)
 	xori	ra, ra, ((_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT)
-	bne	ra, zero, nopage_tlb_store
+	bnez	ra, nopage_tlb_store
 
 	ori	t0, t0, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, smp_pgtable_change_store
+	beqz	t0, smp_pgtable_change_store
 #else
 	st.d	t0, t1, 0
 #endif
@@ -306,14 +306,14 @@ tlb_huge_update_store:
 	srli.d	ra, t0, _PAGE_PRESENT_SHIFT
 	andi	ra, ra, ((_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT)
 	xori	ra, ra, ((_PAGE_PRESENT | _PAGE_WRITE) >> _PAGE_PRESENT_SHIFT)
-	bne	ra, zero, nopage_tlb_store
+	bnez	ra, nopage_tlb_store
 
 	tlbsrch
 	ori	t0, t0, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, tlb_huge_update_store
+	beqz	t0, tlb_huge_update_store
 	ld.d	t0, t1, 0
 #else
 	st.d	t0, t1, 0
@@ -411,7 +411,7 @@ vmalloc_done_modify:
 	 * see if we need to jump to huge tlb processing.
 	 */
 	andi	t0, ra, _PAGE_HUGE
-	bne	t0, zero, tlb_huge_update_modify
+	bnez	t0, tlb_huge_update_modify
 
 	csrrd	t0, LOONGARCH_CSR_BADV
 	srli.d	t0, t0, (PAGE_SHIFT + PTE_ORDER)
@@ -431,12 +431,12 @@ smp_pgtable_change_modify:
 
 	srli.d	ra, t0, _PAGE_WRITE_SHIFT
 	andi	ra, ra, 1
-	beq	ra, zero, nopage_tlb_modify
+	beqz	ra, nopage_tlb_modify
 
 	ori	t0, t0, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, smp_pgtable_change_modify
+	beqz	t0, smp_pgtable_change_modify
 #else
 	st.d	t0, t1, 0
 #endif
@@ -471,14 +471,14 @@ tlb_huge_update_modify:
 
 	srli.d	ra, t0, _PAGE_WRITE_SHIFT
 	andi	ra, ra, 1
-	beq	ra, zero, nopage_tlb_modify
+	beqz	ra, nopage_tlb_modify
 
 	tlbsrch
 	ori	t0, t0, (_PAGE_VALID | _PAGE_DIRTY | _PAGE_MODIFIED)
 
 #ifdef CONFIG_SMP
 	sc.d	t0, t1, 0
-	beq	t0, zero, tlb_huge_update_modify
+	beqz	t0, tlb_huge_update_modify
 	ld.d	t0, t1, 0
 #else
 	st.d	t0, t1, 0
-- 
2.35.1

