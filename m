Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47288309EE5;
	Thu, 20 Nov 2025 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626834; cv=none; b=k+0Came3VXHFy/Rz/gbkahJb1n+3pPenyFyeXOvztS4b9YkfD37f8Rhf9kkuZGKqm3YhDq60d9XyJ0zKCLQkpuyo4eryVTmtmeQTcTJ0pby4e4zV0+RxYt+tIgtae3MU4gFjVtnpyzmW+lE3BjxKs/i6WA5icvA0e8VfUoWFW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626834; c=relaxed/simple;
	bh=g7nemdZcR/ov53/CkXDCB4KEBPe64AIvOuIwlXLd47o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/OEPf/nxf/0mXD3mwTinApi8vP9UZEMcoAneWWM/aCtRar9f9SusbBmI2DuMijvXSovEUee4JE3M9xzUtpUw6klPpv7cx3k+MzUALyYAtS2DPiDlW5w8/nG8dynPwcanaDOb08GfytnOv5kViDAa1+yFdJwvdrSlfhGqk5dIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94274C4CEF1;
	Thu, 20 Nov 2025 08:20:30 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH] LoongArch: Mask all interrupts during kexec/kdump
Date: Thu, 20 Nov 2025 16:20:17 +0800
Message-ID: <20251120082017.2292498-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the default state of the interrupt controllers in the first kernel
don't mask any interrupts, it may cause the second kernel to potentially
receive interrupts (which were previously allocated by the first kernel)
immediately after a CPU becomes online during its boot process. These
interrupts cannot be properly routed, leading to bad IRQ issues.

This patch calls machine_kexec_mask_interrupts() to mask all interrupts
during the kexec/kdump process.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index 2d64b7c81e5e..d7fafda1d541 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -237,6 +237,7 @@ void machine_crash_shutdown(struct pt_regs *regs)
 #ifdef CONFIG_SMP
 	crash_smp_send_stop();
 #endif
+	machine_kexec_mask_interrupts();
 	cpumask_set_cpu(crashing_cpu, &cpus_in_crash);
 
 	pr_info("Starting crashdump kernel...\n");
@@ -274,6 +275,7 @@ void machine_kexec(struct kimage *image)
 
 	/* We do not want to be bothered. */
 	local_irq_disable();
+	machine_kexec_mask_interrupts();
 
 	pr_notice("EFI boot flag: 0x%lx\n", efi_boot);
 	pr_notice("Command line addr: 0x%lx\n", cmdline_ptr);
-- 
2.47.3

