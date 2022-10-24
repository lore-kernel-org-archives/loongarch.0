Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101C481E
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666613589; bh=nd+uoCi1+TkaP1Kqw57+Otc7ZKzVAM/F0DEm+scyey8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9Rtx8Bz7trXzj8ScfqMok+AFs7lEahXVao5Z/QTBc4Y9rRK/YB+eeNQzQr/eRoll
	 ijjqZu4dTXU5ivPaeAXxM4n06GVJcYTYHaE1b4QWyvUIYHRuvQe10HX0mnKZ7zaDQy
	 v0KxVU5BM9h0cjbzKn2q3thlCJXK6zEUtH890Y4k=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 599B260111;
	Mon, 24 Oct 2022 20:13:08 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 01/13] LoongArch: Unify CSR.EUEN and CSR.ECFG bitfield names with the ISA manual
Date: Mon, 24 Oct 2022 20:12:53 +0800
Message-Id: <20221024121305.381776-2-kernel@xen0n.name>
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

The current field names of CSR.EUEN and CSR.ECFG are not consistent with
the LoongArch ISA manual v1.02, and seems to be leftover from an earlier
time. Change to the ISA manual names.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/fpu.h       | 10 +++++-----
 arch/loongarch/include/asm/loongarch.h | 22 +++++++++++-----------
 arch/loongarch/kernel/fpu.S            |  2 +-
 arch/loongarch/kernel/process.c        |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index 358b254d9c1d..a5015b6536bc 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -37,13 +37,13 @@ static inline unsigned long mask_fcsr_x(unsigned long fcsr)
 
 static inline int is_fp_enabled(void)
 {
-	return (csr_read32(LOONGARCH_CSR_EUEN) & CSR_EUEN_FPEN) ?
+	return (csr_read32(LOONGARCH_CSR_EUEN) & CSR_EUEN_FPE) ?
 		1 : 0;
 }
 
-#define enable_fpu()		set_csr_euen(CSR_EUEN_FPEN)
+#define enable_fpu()		set_csr_euen(CSR_EUEN_FPE)
 
-#define disable_fpu()		clear_csr_euen(CSR_EUEN_FPEN)
+#define disable_fpu()		clear_csr_euen(CSR_EUEN_FPE)
 
 #define clear_fpu_owner()	clear_thread_flag(TIF_USEDFPU)
 
@@ -56,7 +56,7 @@ static inline void __own_fpu(void)
 {
 	enable_fpu();
 	set_thread_flag(TIF_USEDFPU);
-	KSTK_EUEN(current) |= CSR_EUEN_FPEN;
+	KSTK_EUEN(current) |= CSR_EUEN_FPE;
 }
 
 static inline void own_fpu_inatomic(int restore)
@@ -83,7 +83,7 @@ static inline void lose_fpu_inatomic(int save, struct task_struct *tsk)
 		disable_fpu();
 		clear_tsk_thread_flag(tsk, TIF_USEDFPU);
 	}
-	KSTK_EUEN(tsk) &= ~(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
+	KSTK_EUEN(tsk) &= ~(CSR_EUEN_FPE | CSR_EUEN_SXE | CSR_EUEN_ASXE);
 }
 
 static inline void lose_fpu(int save)
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 7f8d57a61c8b..534352d6ed18 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -295,14 +295,14 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_PRMD_PPLV			(_ULCAST_(0x3) << CSR_PRMD_PPLV_SHIFT)
 
 #define LOONGARCH_CSR_EUEN		0x2	/* Extended unit enable */
-#define  CSR_EUEN_LBTEN_SHIFT		3
-#define  CSR_EUEN_LBTEN			(_ULCAST_(0x1) << CSR_EUEN_LBTEN_SHIFT)
-#define  CSR_EUEN_LASXEN_SHIFT		2
-#define  CSR_EUEN_LASXEN		(_ULCAST_(0x1) << CSR_EUEN_LASXEN_SHIFT)
-#define  CSR_EUEN_LSXEN_SHIFT		1
-#define  CSR_EUEN_LSXEN			(_ULCAST_(0x1) << CSR_EUEN_LSXEN_SHIFT)
-#define  CSR_EUEN_FPEN_SHIFT		0
-#define  CSR_EUEN_FPEN			(_ULCAST_(0x1) << CSR_EUEN_FPEN_SHIFT)
+#define  CSR_EUEN_BTE_SHIFT		3
+#define  CSR_EUEN_BTE			(_ULCAST_(0x1) << CSR_EUEN_BTE_SHIFT)
+#define  CSR_EUEN_ASXE_SHIFT		2
+#define  CSR_EUEN_ASXE			(_ULCAST_(0x1) << CSR_EUEN_ASXE_SHIFT)
+#define  CSR_EUEN_SXE_SHIFT		1
+#define  CSR_EUEN_SXE			(_ULCAST_(0x1) << CSR_EUEN_SXE_SHIFT)
+#define  CSR_EUEN_FPE_SHIFT		0
+#define  CSR_EUEN_FPE			(_ULCAST_(0x1) << CSR_EUEN_FPE_SHIFT)
 
 #define LOONGARCH_CSR_MISC		0x3	/* Misc config */
 
@@ -310,9 +310,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
 #define  CSR_ECFG_VS_SHIFT		16
 #define  CSR_ECFG_VS_WIDTH		3
 #define  CSR_ECFG_VS			(_ULCAST_(0x7) << CSR_ECFG_VS_SHIFT)
-#define  CSR_ECFG_IM_SHIFT		0
-#define  CSR_ECFG_IM_WIDTH		13
-#define  CSR_ECFG_IM			(_ULCAST_(0x1fff) << CSR_ECFG_IM_SHIFT)
+#define  CSR_ECFG_LIE_SHIFT		0
+#define  CSR_ECFG_LIE_WIDTH		13
+#define  CSR_ECFG_LIE			(_ULCAST_(0x1fff) << CSR_ECFG_LIE_SHIFT)
 
 #define LOONGARCH_CSR_ESTAT		0x5	/* Exception status */
 #define  CSR_ESTAT_ESUBCODE_SHIFT	22
diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
index ccde94140c89..7b1691f67509 100644
--- a/arch/loongarch/kernel/fpu.S
+++ b/arch/loongarch/kernel/fpu.S
@@ -175,7 +175,7 @@ SYM_FUNC_END(_restore_fp)
  */
 
 SYM_FUNC_START(_init_fpu)
-	li.w	t1, CSR_EUEN_FPEN
+	li.w	t1, CSR_EUEN_FPE
 	csrxchg	t1, t1, LOONGARCH_CSR_EUEN
 
 	movgr2fcsr	fcsr0, a0
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 1256e3582475..b88a5864e03d 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -79,7 +79,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 	prmd |= PLV_USER;
 	regs->csr_prmd = prmd;
 
-	euen = regs->csr_euen & ~(CSR_EUEN_FPEN);
+	euen = regs->csr_euen & ~(CSR_EUEN_FPE);
 	regs->csr_euen = euen;
 	lose_fpu(0);
 
-- 
2.38.0

