Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839243;
	b=pnyxmUV51TjTDj4yz6B0ScjOfJyfKZ9bZBDkJhA72PcGT/Pec7lBmiV+2TzCx2ic1KQs
	 JwoFjA/WxUOBZCIKpdAzYd3kA56XN/eOTkvEdlVvTcICkia7zHSkFxUFl587249BAi0RY
	 Zjiz1Rlg1X/9dBmsAYBpSTQsHD1ZC3I3M+G6rhAZ6TMrH/mNkTORkO5b+cAo1HKLnL66U
	 QyeyUVIibUNP99OjPV81j2cMOP+q6/CRjBYOs2y2qkAMBe86c5qBXn1xt8ef/mJ4txkTL
	 c1F7Tb515P+Oo2X92/1UvwKP12JGYxcA293+wvrDxM5wluTmzd6VtAzA4t7EcsBfCgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1+y6MXetiY5pCIsFiRqfrAZwgakffoWvR1I9Ffs4CVI=;
	b=bZYlRX1fUbwl+qPzhVfCkfnCMtvd3eYFMVR5fU18nigP+b6iSUHcH/IEeG1kmky1qExf
	 DY10uNVIOWezfGy/PaeQVCGY+p+cRLtaRlDsA4o3Wyt0X9weJyxAzogTJmlFmlK519ggt
	 riHjGu8DiBboAQTSDUhxPIxy/0mN7ZbHOkJNGXWAZooTAOLo86j+fVw337QNsFRBc7BTJ
	 9uz6qe5KAP/RZHEVpuVbzuKsA+s+ouyIKxxOZeSorqplzYjXxn8Ulg+Hg7NfCXJaWchHF
	 0DsZqh5dGlX1DPMepQgkbdiS/KKmvWJl2Ij0fBNvkuTHTveVIh0V+7MGXBfwtish02w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="TEDR/MdF";
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27F606A329
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA27F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TEDR/MdF
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0ea6so3979392a12.0
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839241; x=1795444041; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+y6MXetiY5pCIsFiRqfrAZwgakffoWvR1I9Ffs4CVI=;
        b=TEDR/MdF+IVH+Q2+k28P1YoJ+gMDH/pzVqedFhG+zbl0ylf5hmZ27mUxqMwyU5WAuc
         lTKhvv7B71pEw+QNyDIbPeZD1yvCxzhgYTOmnTwr1Lvzh3FAyCgNP0/pYsJ5lG3p5NGs
         RLHETiWi7OdYs7DBLNByVVBATlGzGKAlSNe/3Vrm6BvDAptd1jZ/n/P2DJ7MwLTPZ98X
         Z91PbXF8mdWAcelwaClPu7hJdqCMpmB3UHkoUzlTfwS93Adw5QozY4h5Vvhja5z+Z4Qj
         yhrY8255h4Aek6XRIFNkPlVLOh8jzjAhlHI3aDmrzz9RfAdL+B6y2PBFhH9sNNrRwTHf
         dFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839241; x=1795444041;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+y6MXetiY5pCIsFiRqfrAZwgakffoWvR1I9Ffs4CVI=;
        b=q98zQQwo6+jnzsEi7mx3LV/BFdc8pUPPMfArZptgq0et5NX48qW249jeKdS3ZL4/Kb
         1+NuiEtMFv2kLz1zNG02HTlBw0gJtzLkzwqNEn7j8eNTTjJ4TMFn4rs0/V7bJotkwF0e
         YYEer1b5oQtsn+vjzL4h/WE0OIXEgke1gevbWb99xjOg/m2a8pZ4/mAEizjOFB0MgVUP
         i1xCNdGLISrrIPqgJcoR+WQXpF+dv2bVs74P/8SdyFJjquNkg3pmoOGZEboHcYDG7J2c
         MgvH2/Bvb7irmjsp4vDqnHyqRtFc0jBFd00aCXSkG41NXqdpLH8YXrfSAQLlKYop6FK4
         mLVQ==
X-Forwarded-Encrypted: i=1; AL+hErGdiyMRjvxNv3JTh1CMfYT6cnBeOWmBVt8m5JHQRY6+sGoHZhisp+fyjwRW4UDbrhVQx1VRADhfUeg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+tQb+9c4dEbla7E2k2WgGHZAN4w+2C4+4lVh8wMCvHkWcehrqU
	lyZMSEyftr8Yf5jAoVqWmYVJUcOuPTUcm/CbjHGgUVFRRfIsGxu/AvSm4ISsfUgcealONb99lw=
	=
X-Received: from edbbe27.prod.google.com ([2002:a05:6402:1a3b:b0:6b5:70b7:1fdf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:540e:b0:6b5:6c41:2508
 with SMTP id 4fb4d7f45d1cf-6b7c0c725a1mr8915159a12.36.1794839241097; Mon, 16
 Nov 2026 06:27:21 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:26 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8384; i=ardb@kernel.org;
 h=from:subject; bh=aH5bYyxM3Yx0BvZZdg7Qz3nUcRZACek2m3cbvmQkHNs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30NSyyFjH6jyGlp9T1zK1/wmzFmOS+5zQF29cruQUv
 js3saWjlIVBjItBVkyRRWD233c7T0+UqnWeJQszh5UJZAgDF6cATMT8JiNDg+KdsFju5Kao2ad8
 i7ryWnT382zpjSxek+81MTJYK/Ahwz+ji3LOCx9rbBLecCB+KeuXxXOrHwRvuc32tmDLbu4MXWY WAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-24-ardb+git@google.com>
Subject: [PATCH v3 07/15] efi/libstub: Pass kernel entrypoint down to efi_enter_kernel()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Update the EFI stub code shared by arm64 and RISC-V so that the kernel
entry point is taken from struct efi_image_info rather than from opaque
arithmetic performed on linker symbols.

Notably, this results in EFI zboot to enter via the actual kernel
entrypoint rather than byte 0x0 of the loaded image on these
architectures. Beyond that, it is mostly a cleanup that will allow
special linker exports for global symbols to be dropped in subsequent
patches.

ARM is a special case here, as it combines the EFI stub with its legacy
decompressor, and so the generic image_info carrying direct references
to vmlinux symbols cannot be used there. Instead, it provides an empty
struct efi_image_info, which is passed directly to its implementation of
efi_enter_kernel(). So on ARM, populate this efi_image_info with the
base address that the callee expects.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/boot/compressed/head.S           |  2 +-
 drivers/firmware/efi/libstub/arm32-stub.c |  2 +-
 drivers/firmware/efi/libstub/arm64.c      | 16 ++--------------
 drivers/firmware/efi/libstub/efi-stub.c   |  2 +-
 drivers/firmware/efi/libstub/efistub.h    |  9 +++++----
 drivers/firmware/efi/libstub/fdt.c        |  5 +++--
 drivers/firmware/efi/libstub/loongarch.c  |  3 ++-
 drivers/firmware/efi/libstub/riscv.c      | 16 +++-------------
 8 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6..a7f58dfe41bc 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -1450,7 +1450,7 @@ __enter_kernel_from_hyp:
 		b	__enter_kernel
 
 ENTRY(efi_enter_kernel)
-		mov	r4, r0			@ preserve image base
+		ldr	r4, [r0]		@ preserve image base
 		mov	r8, r1			@ preserve DT pointer
 
 		adr_l	r0, call_cache_fn
diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index f7151a4915ba..b73a0b4fcd10 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -127,7 +127,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efi_bs_call(free_pages, *reserve_addr + MAX_UNCOMP_KERNEL_SIZE,
 		    (alloc_size - MAX_UNCOMP_KERNEL_SIZE) / EFI_PAGE_SIZE);
 
-	*image_addr = kernel_base + TEXT_OFFSET;
+	*image_addr = efistub_image_info._text_offset = kernel_base + TEXT_OFFSET;
 	*image_size = 0;
 
 	efi_debug("image addr == 0x%lx, reserve_addr == 0x%lx\n",
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index d35c6dd76601..e892302f4189 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -117,24 +117,12 @@ void efi_cache_sync_image(unsigned long image_base,
 	efi_remap_image(image_base, alloc_size, code_size);
 }
 
-unsigned long __weak primary_entry_offset(void)
-{
-	/*
-	 * By default, we can invoke the kernel via the branch instruction in
-	 * the image header, so offset #0. This will be overridden by the EFI
-	 * stub build that is linked into the core kernel, as in that case, the
-	 * image header may not have been loaded into memory, or may be mapped
-	 * with non-executable permissions.
-	 */
-       return 0;
-}
-
-void __noreturn efi_enter_kernel(unsigned long entrypoint,
+void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
 				 unsigned long fdt_addr,
 				 unsigned long fdt_size)
 {
 	void (* __noreturn enter_kernel)(u64, u64, u64, u64);
 
-	enter_kernel = (void *)entrypoint + primary_entry_offset();
+	enter_kernel = efistub_kernel_entry(image_info);
 	enter_kernel(fdt_addr, 0, 0, 0);
 }
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index bf9a9f53a95c..55bf7ed50c81 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -191,7 +191,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 
 	install_memreserve_table();
 
-	status = efi_boot_kernel(handle, image, image_addr, cmdline_ptr);
+	status = efi_boot_kernel(handle, image, image_info, cmdline_ptr);
 
 	free_primary_display(dpy);
 
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index bb8e360fee7b..b985ababbe66 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1054,9 +1054,6 @@ typedef efi_status_t (*efi_exit_boot_map_processing)(
 efi_status_t efi_exit_boot_services(void *handle, void *priv,
 				    efi_exit_boot_map_processing priv_func);
 
-efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
-			     unsigned long kernel_addr, char *cmdline_ptr);
-
 void *get_fdt(unsigned long *fdt_size);
 
 efi_status_t efi_alloc_virtmap(efi_memory_desc_t **virtmap,
@@ -1189,6 +1186,10 @@ void *efistub_kernel_entry(const struct efi_image_info *image_info)
 	return offset_to_ptr(&image_info->entry_offset);
 }
 
+efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
+			     const struct efi_image_info *image_info,
+			     char *cmdline_ptr);
+
 static inline
 void *efistub_sysfb_display_info(const struct efi_image_info *image_info)
 {
@@ -1205,7 +1206,7 @@ efi_status_t efi_stub_common(efi_handle_t handle,
 
 efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr);
 
-asmlinkage void __noreturn efi_enter_kernel(unsigned long entrypoint,
+asmlinkage void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
 					    unsigned long fdt_addr,
 					    unsigned long fdt_size);
 
diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
index f01450b49975..09e9e5bc831e 100644
--- a/drivers/firmware/efi/libstub/fdt.c
+++ b/drivers/firmware/efi/libstub/fdt.c
@@ -344,7 +344,8 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
 }
 
 efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
-			     unsigned long kernel_addr, char *cmdline_ptr)
+			     const struct efi_image_info *image_info,
+			     char *cmdline_ptr)
 {
 	unsigned long fdt_addr;
 	efi_status_t status;
@@ -359,7 +360,7 @@ efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
 	if (IS_ENABLED(CONFIG_ARM))
 		efi_handle_post_ebs_state();
 
-	efi_enter_kernel(kernel_addr, fdt_addr, fdt_totalsize((void *)fdt_addr));
+	efi_enter_kernel(image_info, fdt_addr, fdt_totalsize((void *)fdt_addr));
 	/* not reached */
 }
 
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 2b0c87dc9908..7f21e79384d3 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -66,8 +66,9 @@ unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
 }
 
 efi_status_t efi_boot_kernel(void *handle, efi_loaded_image_t *image,
-			     unsigned long kernel_addr, char *cmdline_ptr)
+			     const struct efi_image_info *image_info, char *cmdline_ptr)
 {
+	unsigned long kernel_addr = efistub_kernel_base(image_info);
 	kernel_entry_t real_kernel_entry;
 	struct exit_boot_struct priv;
 	unsigned long desc_size;
diff --git a/drivers/firmware/efi/libstub/riscv.c b/drivers/firmware/efi/libstub/riscv.c
index 49db47c05bfe..7be2774dea90 100644
--- a/drivers/firmware/efi/libstub/riscv.c
+++ b/drivers/firmware/efi/libstub/riscv.c
@@ -72,20 +72,10 @@ efi_status_t check_platform_features(void)
 	return EFI_SUCCESS;
 }
 
-unsigned long __weak stext_offset(void)
+void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
+				 unsigned long fdt, unsigned long fdt_size)
 {
-	/*
-	 * This fallback definition is used by the EFI zboot stub, which loads
-	 * the entire image so it can branch via the image header at offset #0.
-	 */
-	return 0;
-}
-
-void __noreturn efi_enter_kernel(unsigned long entrypoint, unsigned long fdt,
-				 unsigned long fdt_size)
-{
-	unsigned long kernel_entry = entrypoint + stext_offset();
-	jump_kernel_func jump_kernel = (jump_kernel_func)kernel_entry;
+	jump_kernel_func jump_kernel = efistub_kernel_entry(image_info);
 
 	/*
 	 * Jump to real kernel here with following constraints.
-- 
2.56.0.611.g1030f0b940-goog

