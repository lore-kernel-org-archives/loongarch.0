Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0093E7C
	for <loongarch@lists.linux.dev>; Sat, 27 Aug 2022 17:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1661622938;
	bh=aWS3z7K5q+R4s35cYvJ4OdynNgvtS0vSuzHZvho9eZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GYDlhfYBlTndeTYinokoJH/Qg8GwOAhpEqGEYEEHzUiBLYYe17K2cQInkrQWkHbr6
	 u+pR5JsigNRPCOjKzhXJhl7VqiPyOTVS7pQyWMXVFE3ELcZlhKHE/egjz87aZ5hawL
	 KulvSHTpAwMnPr98q6GRrWa6E+eMjBDn4TlbTPyM=
Received: from xry111-x57s1.. (unknown [IPv6:240e:358:1157:dc00:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EC82C66800;
	Sat, 27 Aug 2022 13:55:33 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Youling Tang <tangyouling@loongson.cn>,
	Jinyang He <hejinyang@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH 2/8] LoongArch: Only use -Wa,-mla-* options for !CONFIG_CC_HAS_EXPLICIT_RELOCS
Date: Sun, 28 Aug 2022 01:54:30 +0800
Message-Id: <20220827175436.156464-3-xry111@xry111.site>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220827175436.156464-1-xry111@xry111.site>
References: <20220827175436.156464-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If explicit relocation hints is used by the toolchain, -Wa,-mla-*
options will be useless for C code.  Only use them for
!CONFIG_CC_HAS_EXPLICIT_RELOCS.

Replace "la" with "la.pcrel" in head.S to keep the semantic consistent
with new and old toolchains for the low level startup code.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/Makefile      | 15 ++++++++++++++-
 arch/loongarch/kernel/head.S | 10 +++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 415e09bdf31a..bd0ea6623245 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -40,10 +40,23 @@ endif
 
 cflags-y			+= -G0 -pipe -msoft-float
 LDFLAGS_vmlinux			+= -G0 -static -n -nostdlib
+
+ifdef CONFIG_CC_HAS_EXPLICIT_RELOCS
+# GCC may have -mexplicit-relocs off by default if it was built with an old
+# assembler.  But with CONFIG_CC_HAS_EXPLICIT_RELOCS we are sure explicit
+# relocation hints are supported by the assembler, so force it.
+cflags-y			+= -mexplicit-relocs
+else
+# Likewise, disable -mexplicit-relocs if GCC enables by default but the
+# assembler does not support it.
+cflags-y			+= $(call cc-option,-mno-explicit-relocs)
+# With -mno-explicit-relocs, use assembler options to adjust code generation
+# for symbol address.
 KBUILD_AFLAGS_KERNEL		+= -Wa,-mla-global-with-pcrel
 KBUILD_CFLAGS_KERNEL		+= -Wa,-mla-global-with-pcrel
 KBUILD_AFLAGS_MODULE		+= -Wa,-mla-global-with-abs
-KBUILD_CFLAGS_MODULE		+= -fplt -Wa,-mla-global-with-abs,-mla-local-with-abs
+KBUILD_CFLAGS_MODULE		+= -Wa,-mla-global-with-abs,-mla-local-with-abs
+endif
 
 cflags-y += -ffreestanding
 cflags-y += $(call cc-option, -mno-check-zero-division)
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 01bac62a6442..eb3f641d5915 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -55,17 +55,17 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	li.w		t0, 0x00		# FPE=0, SXE=0, ASXE=0, BTE=0
 	csrwr		t0, LOONGARCH_CSR_EUEN
 
-	la		t0, __bss_start		# clear .bss
+	la.pcrel	t0, __bss_start		# clear .bss
 	st.d		zero, t0, 0
-	la		t1, __bss_stop - LONGSIZE
+	la.pcrel	t1, __bss_stop - LONGSIZE
 1:
 	addi.d		t0, t0, LONGSIZE
 	st.d		zero, t0, 0
 	bne		t0, t1, 1b
 
-	la		t0, fw_arg0
+	la.pcrel	t0, fw_arg0
 	st.d		a0, t0, 0		# firmware arguments
-	la		t0, fw_arg1
+	la.pcrel	t0, fw_arg1
 	st.d		a1, t0, 0
 
 	/* KSave3 used for percpu base, initialized as 0 */
@@ -73,7 +73,7 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
 	/* GPR21 used for percpu base (runtime), initialized as 0 */
 	move		u0, zero
 
-	la		tp, init_thread_union
+	la.pcrel	tp, init_thread_union
 	/* Set the SP after an empty pt_regs.  */
 	PTR_LI		sp, (_THREAD_SIZE - 32 - PT_SIZE)
 	PTR_ADD		sp, sp, tp
-- 
2.37.0

