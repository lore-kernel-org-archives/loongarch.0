Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02FA4C69
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851054; bh=Zs1qQMzujkHCYLQZgou9bdHb2W7oZeO7e2wgV34DOmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=spSKAvbgLQZvgAkmX9wxwFSPM0xz/rFdheZyaT8nUJTBUTnMOsVcRqMT8Y8M9OeOg
	 2OYz0qJnCYK2mQ0rctZmDaayjZQ0RuiVPeJCm8WDbmo9eYGyOtGLYm7CGzyky7E6Yj
	 sGqrxDjgN9767UaPXZn8/J7CFpfEosraPjQXQHwc=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3EE8560685;
	Tue, 26 Jul 2022 23:57:34 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 3/8] LoongArch: Use the "jr" pseudo-instruction where applicable
Date: Tue, 26 Jul 2022 23:57:17 +0800
Message-Id: <20220726155722.2402337-4-kernel@xen0n.name>
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
 arch/loongarch/kernel/fpu.S   | 12 ++++++------
 arch/loongarch/kernel/genex.S |  4 ++--
 arch/loongarch/kernel/head.S  |  4 ++--
 arch/loongarch/mm/page.S      |  4 ++--
 arch/loongarch/mm/tlbex.S     |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index a631a7137667..e14f096d40bd 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -153,7 +153,7 @@ SYM_FUNC_START(_save_fp)
 	fpu_save_csr	a0 t1
 	fpu_save_double a0 t1			# clobbers t1
 	fpu_save_cc	a0 t1 t2		# clobbers t1, t2
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(_save_fp)
 EXPORT_SYMBOL(_save_fp)
 
@@ -164,7 +164,7 @@ SYM_FUNC_START(_restore_fp)
 	fpu_restore_double a0 t1		# clobbers t1
 	fpu_restore_csr	a0 t1
 	fpu_restore_cc	a0 t1 t2		# clobbers t1, t2
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(_restore_fp)
 
 /*
@@ -216,7 +216,7 @@ SYM_FUNC_START(_init_fpu)
 	movgr2fr.d	$f30, t1
 	movgr2fr.d	$f31, t1
 
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(_init_fpu)
 
 /*
@@ -229,7 +229,7 @@ SYM_FUNC_START(_save_fp_context)
 	sc_save_fcsr a2 t1
 	sc_save_fp a0
 	li.w	a0, 0					# success
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(_save_fp_context)
 
 /*
@@ -242,10 +242,10 @@ SYM_FUNC_START(_restore_fp_context)
 	sc_restore_fcc a1 t1 t2
 	sc_restore_fcsr a2 t1
 	li.w	a0, 0					# success
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(_restore_fp_context)
 
 SYM_FUNC_START(fault)
 	li.w	a0, -EFAULT				# failure
-	jirl zero, ra, 0
+	jr	ra
 SYM_FUNC_END(fault)
diff --git a/arch/loongarch/kernel/genex.S b/arch/loongarch/kernel/genex.S
index 93496852b3cc..0df6d17dde23 100644
--- a/arch/loongarch/kernel/genex.S
+++ b/arch/loongarch/kernel/genex.S
@@ -28,7 +28,7 @@ SYM_FUNC_START(__arch_cpu_idle)
 	nop
 	idle	0
 	/* end of rollback region */
-1:	jirl	zero, ra, 0
+1:	jr	ra
 SYM_FUNC_END(__arch_cpu_idle)
 
 SYM_FUNC_START(handle_vint)
@@ -91,5 +91,5 @@ SYM_FUNC_END(except_vec_cex)
 
 SYM_FUNC_START(handle_sys)
 	la.abs	t0, handle_syscall
-	jirl    zero, t0, 0
+	jr	t0
 SYM_FUNC_END(handle_sys)
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index d01e62dd414f..e553c5fc17da 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -32,7 +32,7 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	/* We might not get launched at the address the kernel is linked to,
 	   so we jump there.  */
 	la.abs		t0, 0f
-	jirl		zero, t0, 0
+	jr		t0
 0:
 	la		t0, __bss_start		# clear .bss
 	st.d		zero, t0, 0
@@ -86,7 +86,7 @@ SYM_CODE_START(smpboot_entry)
 	ld.d		tp, t0, CPU_BOOT_TINFO
 
 	la.abs	t0, 0f
-	jirl	zero, t0, 0
+	jr	t0
 0:
 	bl		start_secondary
 SYM_CODE_END(smpboot_entry)
diff --git a/arch/loongarch/mm/page.S b/arch/loongarch/mm/page.S
index 270d509adbaa..1e20dd5e3a4b 100644
--- a/arch/loongarch/mm/page.S
+++ b/arch/loongarch/mm/page.S
@@ -32,7 +32,7 @@ SYM_FUNC_START(clear_page)
 	st.d     zero, a0, -8
 	bne      t0,   a0, 1b
 
-	jirl     zero, ra, 0
+	jr       ra
 SYM_FUNC_END(clear_page)
 EXPORT_SYMBOL(clear_page)
 
@@ -79,6 +79,6 @@ SYM_FUNC_START(copy_page)
 	st.d     t7, a0,  -8
 
 	bne      t8, a0, 1b
-	jirl     zero, ra, 0
+	jr       ra
 SYM_FUNC_END(copy_page)
 EXPORT_SYMBOL(copy_page)
diff --git a/arch/loongarch/mm/tlbex.S b/arch/loongarch/mm/tlbex.S
index 9e98afe7a67f..f1234a9c311f 100644
--- a/arch/loongarch/mm/tlbex.S
+++ b/arch/loongarch/mm/tlbex.S
@@ -198,7 +198,7 @@ nopage_tlb_load:
 	dbar	0
 	csrrd	ra, EXCEPTION_KS2
 	la.abs	t0, tlb_do_page_fault_0
-	jirl	zero, t0, 0
+	jr	t0
 SYM_FUNC_END(handle_tlb_load)
 
 SYM_FUNC_START(handle_tlb_store)
@@ -366,7 +366,7 @@ nopage_tlb_store:
 	dbar	0
 	csrrd	ra, EXCEPTION_KS2
 	la.abs	t0, tlb_do_page_fault_1
-	jirl	zero, t0, 0
+	jr	t0
 SYM_FUNC_END(handle_tlb_store)
 
 SYM_FUNC_START(handle_tlb_modify)
@@ -525,7 +525,7 @@ nopage_tlb_modify:
 	dbar	0
 	csrrd	ra, EXCEPTION_KS2
 	la.abs	t0, tlb_do_page_fault_1
-	jirl	zero, t0, 0
+	jr	t0
 SYM_FUNC_END(handle_tlb_modify)
 
 SYM_FUNC_START(handle_tlb_refill)
-- 
2.35.1

