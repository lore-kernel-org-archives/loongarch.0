Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE383201
	for <loongarch@lists.linux.dev>; Thu, 11 Aug 2022 13:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F0AC433D7;
	Thu, 11 Aug 2022 13:03:00 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Jump to the link address before enable PG
Date: Thu, 11 Aug 2022 21:03:01 +0800
Message-Id: <20220811130301.2431582-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel entry point of both boot-cpu and nonboot-cpu may be physical
address from BootLoader (in DA mode or identity-mapping PG mode). So we
should jump to the link address before PG enabled (DA is disabled at the
same time) and just after DMW configured.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/head.S | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 7062cdf0e33e..c60eb66793e3 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	csrwr		t0, LOONGARCH_CSR_DMWIN0
 	li.d		t0, CSR_DMW1_INIT	# CA, PLV0, 0x9000 xxxx xxxx xxxx
 	csrwr		t0, LOONGARCH_CSR_DMWIN1
+
+	/* We might not get launched at the address the kernel is linked to,
+	   so we jump there.  */
+	la.abs		t0, 0f
+	jr		t0
+0:
 	/* Enable PG */
 	li.w		t0, 0xb0		# PLV=0, IE=0, PG=1
 	csrwr		t0, LOONGARCH_CSR_CRMD
@@ -29,11 +35,6 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	li.w		t0, 0x00		# FPE=0, SXE=0, ASXE=0, BTE=0
 	csrwr		t0, LOONGARCH_CSR_EUEN
 
-	/* We might not get launched at the address the kernel is linked to,
-	   so we jump there.  */
-	la.abs		t0, 0f
-	jr		t0
-0:
 	la		t0, __bss_start		# clear .bss
 	st.d		zero, t0, 0
 	la		t1, __bss_stop - LONGSIZE
@@ -74,6 +75,11 @@ SYM_CODE_START(smpboot_entry)
 	csrwr		t0, LOONGARCH_CSR_DMWIN0
 	li.d		t0, CSR_DMW1_INIT	# CA, PLV0
 	csrwr		t0, LOONGARCH_CSR_DMWIN1
+
+	la.abs		t0, 0f
+	jr		t0
+0:
+	/* Enable PG */
 	li.w		t0, 0xb0		# PLV=0, IE=0, PG=1
 	csrwr		t0, LOONGARCH_CSR_CRMD
 	li.w		t0, 0x04		# PLV=0, PIE=1, PWE=0
@@ -85,9 +91,6 @@ SYM_CODE_START(smpboot_entry)
 	ld.d		sp, t0, CPU_BOOT_STACK
 	ld.d		tp, t0, CPU_BOOT_TINFO
 
-	la.abs		t0, 0f
-	jr		t0
-0:
 	bl		start_secondary
 SYM_CODE_END(smpboot_entry)
 
-- 
2.31.1

