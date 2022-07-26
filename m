Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20BA4C8D
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851058; bh=eWfppxthUGL46eLmQo7TDXpk9tY00Y/kO+GS+J0Nx8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCi93+Zm7Gdu+R+hRw6gBIxAj73ckxdYJMbN2LYNFnwOEZqZeGK96ZRdnhl6QvXB1
	 pNNn8luDlIiTwiDdsE3XI9OFzskuOKEskHdcqINY+HIKBXuIzDQI2E89zt4Vae7JW2
	 H4ENGGLOhbxtAIA3d6C4I5YhAnI1/hFqIVC5XdFw=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D535260610;
	Tue, 26 Jul 2022 23:57:38 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 6/8] LoongArch: Simplify "BLT foo, zero" with BLTZ
Date: Tue, 26 Jul 2022 23:57:20 +0800
Message-Id: <20220726155722.2402337-7-kernel@xen0n.name>
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

Support for the syntactic sugar is present in upstream binutils port
from the beginning. Use it for shorter lines and better consistency.
Generated code should be identical.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/atomic.h | 8 ++++----
 arch/loongarch/mm/tlbex.S           | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
index 0869bec2c937..dc2ae4f22c8e 100644
--- a/arch/loongarch/include/asm/atomic.h
+++ b/arch/loongarch/include/asm/atomic.h
@@ -158,7 +158,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	addi.w	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.w	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -171,7 +171,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	sub.w	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.w	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -321,7 +321,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	addi.d	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.d	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -334,7 +334,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	sub.d	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.d	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index 4d16e27020e0..9ca1e3ff1ded 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -47,7 +47,7 @@ SYM_FUNC_START(handle_tlb_load)
 	 * The vmalloc handling is not in the hotpath.
 	 */
 	csrrd	t0, LOONGARCH_CSR_BADV
-	blt	t0, zero, vmalloc_load
+	bltz	t0, vmalloc_load
 	csrrd	t1, LOONGARCH_CSR_PGDL
 
 vmalloc_done_load:
@@ -210,7 +210,7 @@ SYM_FUNC_START(handle_tlb_store)
 	 * The vmalloc handling is not in the hotpath.
 	 */
 	csrrd	t0, LOONGARCH_CSR_BADV
-	blt	t0, zero, vmalloc_store
+	bltz	t0, vmalloc_store
 	csrrd	t1, LOONGARCH_CSR_PGDL
 
 vmalloc_done_store:
@@ -378,7 +378,7 @@ SYM_FUNC_START(handle_tlb_modify)
 	 * The vmalloc handling is not in the hotpath.
 	 */
 	csrrd	t0, LOONGARCH_CSR_BADV
-	blt	t0, zero, vmalloc_modify
+	bltz	t0, vmalloc_modify
 	csrrd	t1, LOONGARCH_CSR_PGDL
 
 vmalloc_done_modify:
-- 
2.35.1

