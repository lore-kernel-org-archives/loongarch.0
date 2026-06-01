Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290B126BF1
	for <loongarch@lists.linux.dev>; Mon,  1 Jun 2026 03:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780285111; cv=none; b=BQezBs+5VmN4oeuUrKCGX1fHjDZ3eqMrKP+VM63u64Odv+13jDac50UChOTO3Ghh3Byc/lqRwLSVQ4a87AAtmCrjzaI/B0kjsGHegPTfyJuuXRiCaOZVin6y8xRlfcj2Ro5HsFr4U6tsinYPSvM5qgauunX4k9/QbSmpiPcTld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780285111; c=relaxed/simple;
	bh=hX7YeNV+tlVu6hFYV2q/ghjgWKnIOE/N3vKPs6ge5mw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gmHC7yVjSKmgH4ZPfm5aKX4uIMgyP2pNRKOZuerNVTw6Zu3O/923sno9QExsh4hDKXUXtDBx36xsx8k0MlKnHfzNBP9HP9LA8R8EKJiLpJwzTB4pA4TnPGbMHwujcIZuvL5RJZXn8E955Lw6QEOMFFHBmBNAuCxMEqwoSAI1gq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SMRF28DS; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SMRF28DS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780285107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjOOek1jXJNGLoHTKTFHOBhzT19+PhzaWLUjOm5HmR4=;
	b=SMRF28DSZdsSL+4S9apJyEL0x27Xzzj2mD32PCzMcMu7WiLmkCAFUeQ7kbWff/MU3c8Zog
	HAM2BWOeSv2jwnCNbQoT3ZN2bapZuL4TM1OcL+42aWeu8hOJwtht1u1SBVaw14OAWq7r7y
	2aA8SP+h4/VKyT2iLv7AB2Z1/QJHqqM=
From: George Guo <dongtai.guo@linux.dev>
To: maobibo@loongson.cn
Cc: chenhuacai@kernel.org,
	dongtai.guo@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v2] LoongArch: kexec: drop hardcoded addresses to avoid QEMU FDT conflict
Date: Mon,  1 Jun 2026 11:38:20 +0800
Message-Id: <20260601033820.38805-1-dongtai.guo@linux.dev>
In-Reply-To: <dbcb280c-9929-b084-0f2b-4f712a85d17b@loongson.cn>
References: <dbcb280c-9929-b084-0f2b-4f712a85d17b@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

KEXEC_CONTROL_CODE and KEXEC_CMDLINE_ADDR were hardcoded to fixed
physical addresses (0x100000 and 0x108000) in the first 2MB.  QEMU
places its machine FDT at 0x100000 when booting with '-kernel', so
machine_kexec_prepare() was overwriting the FDT with the relocation
trampoline.  The kexec'd kernel's fdt_setup() then found trampoline
code instead of a valid FDT, causing earlycon to fail silently.

Fix this by dropping the hardcoded addresses entirely.  Use the
control_code_page already allocated by the kexec core for the
relocation trampoline, and allocate a separate page via
kimage_alloc_control_pages() for the kernel command line copy.
kimage_alloc_control_pages() registers pages with the kexec core so
the page-copy loop skips them, providing the same safety guarantee
without depending on any specific physical location.

This follows the approach used by arm64 and riscv, which also rely on
the core-allocated control_code_page rather than fixed addresses.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
Changes in v2:
- Instead of moving KEXEC_CONTROL_CODE to a different fixed address,
  drop hardcoded addresses entirely.  Use the kexec core's already-
  allocated control_code_page for the trampoline and allocate a
  separate page via kimage_alloc_control_pages() for the command line,
  following the approach used by arm64 and riscv.

 arch/loongarch/kernel/machine_kexec.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index d7fafda1d541..ad27fef098f1 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -21,10 +21,6 @@
 #include <asm/cacheflush.h>
 #include <asm/page.h>
 
-/* 0x100000 ~ 0x200000 is safe */
-#define KEXEC_CONTROL_CODE	TO_CACHE(0x100000UL)
-#define KEXEC_CMDLINE_ADDR	TO_CACHE(0x108000UL)
-
 static unsigned long reboot_code_buffer;
 static cpumask_t cpus_in_crash = CPU_MASK_NONE;
 
@@ -43,19 +39,30 @@ int machine_kexec_prepare(struct kimage *kimage)
 {
 	int i;
 	char *bootloader = "kexec";
-	void *cmdline_ptr = (void *)KEXEC_CMDLINE_ADDR;
+	struct page *cmdline_page;
+	void *cmdline_ptr;
 
 	kimage->arch.efi_boot = fw_arg0;
 	kimage->arch.systable_ptr = fw_arg2;
 
+	/*
+	 * Allocate a separate control page for the kernel command line.
+	 * kimage_alloc_control_pages() ensures the page is not overwritten
+	 * by the kexec page-copy loop.
+	 */
+	cmdline_page = kimage_alloc_control_pages(kimage, 0);
+	if (!cmdline_page)
+		return -ENOMEM;
+	cmdline_ptr = page_to_virt(cmdline_page);
+
 	if (kimage->file_mode == 1) {
 		/*
-		 * kimage->cmdline_buf will be released in kexec_file_load, so copy
-		 * to the KEXEC_CMDLINE_ADDR safe area.
+		 * kimage->cmdline_buf will be released in kexec_file_load, so
+		 * copy it to the control page before it is freed.
 		 */
-		memcpy((void *)KEXEC_CMDLINE_ADDR, (void *)kimage->arch.cmdline_ptr,
-					strlen((char *)kimage->arch.cmdline_ptr) + 1);
-		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
+		memcpy(cmdline_ptr, (void *)kimage->arch.cmdline_ptr,
+		       strlen((char *)kimage->arch.cmdline_ptr) + 1);
+		kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
 	} else {
 		/* Find the command line */
 		for (i = 0; i < kimage->nr_segments; i++) {
@@ -73,9 +80,7 @@ int machine_kexec_prepare(struct kimage *kimage)
 	}
 
 	/* kexec/kdump need a safe page to save reboot_code_buffer */
-	kimage->control_code_page = virt_to_page((void *)KEXEC_CONTROL_CODE);
-
-	reboot_code_buffer = (unsigned long)page_address(kimage->control_code_page);
+	reboot_code_buffer = (unsigned long)page_to_virt(kimage->control_code_page);
 	memcpy((void *)reboot_code_buffer, relocate_new_kernel, relocate_new_kernel_size);
 
 #ifdef CONFIG_SMP
-- 
2.25.1

