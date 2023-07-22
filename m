Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D437125A0
	for <loongarch@lists.linux.dev>; Sat, 22 Jul 2023 07:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F2AC433C7;
	Sat, 22 Jul 2023 07:22:10 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Allow usage of LSX/LASX in the kernel
Date: Sat, 22 Jul 2023 15:22:01 +0800
Message-Id: <20230722072201.2677516-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow usage of LSX/LASX in the kernel by extending kernel_fpu_begin()
and kernel_fpu_end().

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/kfpu.c | 55 +++++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/kfpu.c b/arch/loongarch/kernel/kfpu.c
index 5c46ae8c6cac..ec5b28e570c9 100644
--- a/arch/loongarch/kernel/kfpu.c
+++ b/arch/loongarch/kernel/kfpu.c
@@ -8,19 +8,40 @@
 #include <asm/fpu.h>
 #include <asm/smp.h>
 
+static unsigned int euen_mask = CSR_EUEN_FPEN;
+
+/*
+ * The critical section between kernel_fpu_begin() and kernel_fpu_end()
+ * is non-reentrant. It is the caller's responsibility to avoid reentrance.
+ * See drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c as an example.
+ */
 static DEFINE_PER_CPU(bool, in_kernel_fpu);
+static DEFINE_PER_CPU(unsigned int, euen_current);
 
 void kernel_fpu_begin(void)
 {
+	unsigned int *euen_curr;
+
 	preempt_disable();
 
 	WARN_ON(this_cpu_read(in_kernel_fpu));
 
 	this_cpu_write(in_kernel_fpu, true);
+	euen_curr = this_cpu_ptr(&euen_current);
 
-	if (!is_fpu_owner())
-		enable_fpu();
+	*euen_curr = csr_xchg32(euen_mask, euen_mask, LOONGARCH_CSR_EUEN);
+
+#ifdef CONFIG_CPU_HAS_LASX
+	if (*euen_curr & CSR_EUEN_LASXEN)
+		_save_lasx(&current->thread.fpu);
+	else
+#endif
+#ifdef CONFIG_CPU_HAS_LSX
+	if (*euen_curr & CSR_EUEN_LSXEN)
+		_save_lsx(&current->thread.fpu);
 	else
+#endif
+	if (*euen_curr & CSR_EUEN_FPEN)
 		_save_fp(&current->thread.fpu);
 
 	write_fcsr(LOONGARCH_FCSR0, 0);
@@ -29,15 +50,41 @@ EXPORT_SYMBOL_GPL(kernel_fpu_begin);
 
 void kernel_fpu_end(void)
 {
+	unsigned int *euen_curr;
+
 	WARN_ON(!this_cpu_read(in_kernel_fpu));
 
-	if (!is_fpu_owner())
-		disable_fpu();
+	euen_curr = this_cpu_ptr(&euen_current);
+
+#ifdef CONFIG_CPU_HAS_LASX
+	if (*euen_curr & CSR_EUEN_LASXEN)
+		_restore_lasx(&current->thread.fpu);
 	else
+#endif
+#ifdef CONFIG_CPU_HAS_LSX
+	if (*euen_curr & CSR_EUEN_LSXEN)
+		_restore_lsx(&current->thread.fpu);
+	else
+#endif
+	if (*euen_curr & CSR_EUEN_FPEN)
 		_restore_fp(&current->thread.fpu);
 
+	*euen_curr = csr_xchg32(*euen_curr, euen_mask, LOONGARCH_CSR_EUEN);
+
 	this_cpu_write(in_kernel_fpu, false);
 
 	preempt_enable();
 }
 EXPORT_SYMBOL_GPL(kernel_fpu_end);
+
+static int __init init_euen_mask(void)
+{
+	if (cpu_has_lsx)
+		euen_mask |= CSR_EUEN_LSXEN;
+
+	if (cpu_has_lasx)
+		euen_mask |= CSR_EUEN_LASXEN;
+
+	return 0;
+}
+arch_initcall(init_euen_mask);
-- 
2.39.3

