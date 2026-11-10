Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313065;
	b=Pz3RPNvkhjXKrbu1+lgCjKt9ztoK2chby7ASfTzN/8feDAKFaroVbmO1bfhaom9r9DoE
	 VPmhgHX7V4LaMI7Yryaa7k6FoyuK2saHyhDmyU6+lUgfItjzW1UDMEFzSrkfcnUW5WeVj
	 9OXZPJXoUEoJAvSrU3OWgEMbYI8ruFOrfYmNIealdvCV3O8QCGa/GI0Q0dMeBhCiS3qc5
	 Z3xYh5TgMPLW5jrp6gWsLVF6QcHHsjAkJZi+lR02XM7F1Rq8yzf4eGbWQ+6sVhhtFkKCI
	 xBzxejr3syUolyBhhjvmTkoNYyxGGLGWJ9PnUS5pO8Bs6wHZdPAwCnzW3zz1wqq1/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=;
	b=mRbklAEMbT2vj2wEzB9qBPnfHfqMTcISDWM+G8Y+R2w0xUEQbLnAMU+QssbhgTDFwv7l
	 tphCJDyquUBb1MbIMdkk1UAKYPl/gaa5hWeqMF3IgPZvJeKuT6WWzMJhsYJmqGgyu0wR+
	 81ycpRWa6RrPoXAb9HrP35tAcGz6MuGp2yV2Io0q2/ya0AWkVcgi6L4kYabJrtkkQIyQG
	 XyLO31WRPJ52l/xR4j+cbKTKkIsL5VyHjTbEauN+UOxaSnU7rJPBlE107VQFl7t7uCf7g
	 XxMq4NgI8P0gfkHXxM78yexozgE7XKJPldVjvuQJ1Sj2e6Z5Uio5z1BkFP3TTenSBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjwkv0Cn;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A241606A333
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A241606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cjwkv0Cn
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e011829easo1297902f8f.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313064; x=1794917864; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=;
        b=cjwkv0CnRP77gsDrzNckT9E+mF7OftZXLC3xv45DhL0WE3Nls0JLV/by8XjDuL16aI
         4hS/EXrr3X5+T0bSmG5zwytW4JPCQJJE0veFHLk/PM7PM2xyYmQ1ZVQEweIIJtshVH3V
         piSyAiNbfHnawiqXrzy8tc0I4+inTWaRnlEFNmCgGOUD7tCq3uFcG01acaeJl25UJRDO
         bW9SGiJ5zRhmZ1LpnJGppOJ11pEXi/kj/qbDOAsmnBUeF5SpkvkJ96ovBBO5ma28ZBXq
         K2WMVRjIYSG9mVyWA/HN/tggqrVQJXsMEhxG1DNc+Z6HDAc+CCl6okozWZm5ZWhroMFy
         qB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313064; x=1794917864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPBeufobmuc6RIQJ83QzjXbUu8OMDbjvKvPLOTqlXsk=;
        b=u7+xXYvT+632lhG3QdtSSs84C7U+TFSRszYLt3alb30WCRAQ3WrfpGYxwYrVpi74TN
         QdMN8Vlv403L/sL92YuFtVrmCxbD62dsoGTdbSG2pAyeU9PcZY0fjseUsDhQaLV5O/+T
         0d8L7dipbYjOfN1Pm69b4mbIW6mVeo/GLH2tP3WAeXmrAE3SCilTVUsAxZmwyC8K2twK
         2i6rNQRL0BEEpQGblXYJAzrc63oT8848U96nxUIdBtHiiIlXLadDyB2m+LLclM2WycBy
         0QlBQNaMUuk6ielIyV1XnRrY9tZyslmkNZN0PT6pxubOG08MTLQO8hLCmdax+nSupxm+
         C6Ig==
X-Forwarded-Encrypted: i=1; AL+hErGUcfg67dIeN7Xf+ddN52MdP06AoqcVb2+IzvXPqi2Shgb1iqTtg6UZURi43M2ubEQIZhnJVdlGqR0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+FUmtrksRMQcN3QHIDyTiJE1s9UIlGXBWoIEAn77JvJncby+bA
	Fy2A5FJcEBR86B2qxMj9MdbquB7YRzir4eHiFjCJRZKj05kB1dxvVZ1ke03ait8Kq2ct1VIw3Q=
	=
X-Received: from wrsh7.prod.google.com ([2002:adf:fd47:0:b0:493:19d2:af6a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:993:b0:491:4e13:fde3
 with SMTP id ffacd0b85a97d-4982e7379d4mr4015466f8f.13.1794313063487; Tue, 10
 Nov 2026 04:17:43 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:36 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-16-ardb+git@google.com>
Subject: [PATCH v2 04/10] efi/libstub: Capture loaded image information in
 struct efi_image_info
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Define a struct efi_image_info that carries properties of the loaded
kernel image, and pass a pointer to it to efi_stub_common() so that EFI
stub code can access there properties in a consistent manner for both
the uncompressed kernel and the EFI zboot image.

Note that zboot can only access this information after decompressing the
image, whereas code that is part of the EFI stub that gets integrated
into Linux can just grab the efi_image_info pointer as needed.

ARM implements neither, but -like x86- incorporates the EFI stub into
its own decompressor. It has no need for this functionality, so emit a
dummy struct to satisfy the linker.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi-header.S                |  2 +
 arch/loongarch/kernel/head.S                  |  1 +
 arch/riscv/kernel/head.S                      |  1 +
 drivers/firmware/efi/libstub/Makefile         |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot   | 11 ++++-
 drivers/firmware/efi/libstub/arm32-stub.c     |  3 ++
 drivers/firmware/efi/libstub/efi-stub-entry.c | 10 ++++-
 drivers/firmware/efi/libstub/efi-stub.c       |  3 +-
 drivers/firmware/efi/libstub/efistub.h        | 44 +++++++++++++++++++-
 drivers/firmware/efi/libstub/image_info.S     | 12 ++++++
 drivers/firmware/efi/libstub/zboot.c          | 17 +++++++-
 drivers/firmware/efi/libstub/zboot.lds        |  2 +
 12 files changed, 101 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/efi-header.S b/arch/arm64/kernel/efi-header.S
index 329e8df9215f..54ca61d03403 100644
--- a/arch/arm64/kernel/efi-header.S
+++ b/arch/arm64/kernel/efi-header.S
@@ -7,6 +7,8 @@
 #include <linux/pe.h>
 #include <linux/sizes.h>
 
+SYM_FUNC_ALIAS(efi_primary_entry, primary_entry)
+
 	.macro	efi_signature_nop
 #ifdef CONFIG_EFI
 .L_head:
diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
index 601ddd78b233..69c31b0b65c5 100644
--- a/arch/loongarch/kernel/head.S
+++ b/arch/loongarch/kernel/head.S
@@ -35,6 +35,7 @@ pe_header:
 SYM_DATA(kernel_asize, .long _kernel_asize);
 SYM_DATA(kernel_fsize, .long _kernel_fsize);
 
+SYM_FUNC_ALIAS(efi_primary_entry, kernel_entry)
 #endif
 
 	__REF
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..6c81f32be70b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -28,6 +28,7 @@ SYM_CODE_START(_start)
 	 * that expects this header format!!
 	 */
 #ifdef CONFIG_EFI
+SYM_FUNC_ALIAS(efi_primary_entry, _start_kernel)
 	/*
 	 * This instruction decodes to "MZ" ASCII required by UEFI.
 	 */
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..9dc6a707fd79 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -107,6 +107,7 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
 targets				:= $(lib-y)
 lib-y				:= $(patsubst %.o,%.stub.o,$(lib-y))
+lib-$(CONFIG_EFI_GENERIC_STUB)	+= image_info.o
 
 # Even when -mbranch-protection=none is set, Clang will generate a
 # .note.gnu.property for code-less object files (like lib/ctype.c),
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 52baacf3e9d9..e2769bbec963 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -26,9 +26,18 @@ zboot-size-len-$(CONFIG_KERNEL_ZSTD)	:= 4
 $(obj)/vmlinuz: $(obj)/vmlinux.bin FORCE
 	+$(call if_changed,$(zboot-method-y))
 
+# subtract the two symbol values to obtain the offset of struct efi_image_info
+get_image_info_offset = $(shell $(NM) -n $(objtree)/vmlinux |\
+			grep -E ' _text$$| __efistub_efistub_image_info$$' |\
+			awk 'NR == 1 { a = toupper($$1) } \
+			     NR == 2 { print "obase=16; ibase=16; " toupper($$1) "-" a }' |\
+			bc)
+
 # avoid eager evaluation to prevent references to non-existent build artifacts
 OBJCOPYFLAGS_vmlinuz.o = -I binary -O $(EFI_ZBOOT_BFD_TARGET) $(EFI_ZBOOT_OBJCOPY_FLAGS) \
-			  --rename-section .data=.gzdata,load,alloc,readonly,contents
+			 --rename-section .data=.gzdata,load,alloc,readonly,contents \
+			 --add-symbol efistub_image_info_offset=0x$(get_image_info_offset)
+
 $(obj)/vmlinuz.o: $(obj)/vmlinuz FORCE
 	$(call if_changed,objcopy)
 
diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 1073dd947516..53ade94f4bdb 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -132,3 +132,6 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 
 	return EFI_SUCCESS;
 }
+
+/* expose a dummy struct - ARM does not use this anyway */
+struct efi_image_info efistub_image_info = {};
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index efa3ab8ad1c6..c173c0dd8454 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -27,6 +27,13 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return NULL;
 }
 
+const struct efi_image_info *efistub_get_image_info(void)
+{
+	extern const struct efi_image_info efistub_image_info;
+
+	return &efistub_image_info;
+}
+
 /*
  * EFI entry point for the generic EFI stub used by ARM, arm64, RISC-V and
  * LoongArch. This is the entrypoint that is described in the PE/COFF header
@@ -80,7 +87,8 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 
 	kernel_image_offset = image_addr - (unsigned long)image->image_base;
 
-	status = efi_stub_common(handle, image, image_addr, cmdline_ptr);
+	status = efi_stub_common(handle, image, image_addr, cmdline_ptr,
+				 efistub_get_image_info());
 
 	efi_free(image_size, image_addr);
 	efi_free(reserve_size, reserve_addr);
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 6db10590f89b..ee5931eed59c 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -161,7 +161,8 @@ efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr)
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr)
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info)
 {
 	struct sysfb_display_info *dpy;
 	efi_status_t status;
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..394796472cc0 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1148,11 +1148,53 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle);
 
+struct efi_image_info {
+	s32	_text_offset;
+	s32	__inittext_end_offset;
+	s32	_edata_offset;
+	s32	_end_offset;
+	s32	entry_offset;
+};
+
+const struct efi_image_info *efistub_get_image_info(void);
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base);
+
+static inline
+unsigned long efistub_kernel_base(const struct efi_image_info *image_info)
+{
+	return (unsigned long)offset_to_ptr(&image_info->_text_offset);
+}
+
+static inline
+unsigned long efistub_kernel_size(const struct efi_image_info *image_info)
+{
+	return image_info->_edata_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_memsize(const struct efi_image_info *image_info)
+{
+	return image_info->_end_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_codesize(const struct efi_image_info *image_info)
+{
+	return image_info->__inittext_end_offset - image_info->_text_offset;
+}
+
+static inline
+unsigned long efistub_kernel_entry_offset(const struct efi_image_info *image_info)
+{
+	return image_info->entry_offset - image_info->_text_offset;
+}
+
 /* shared entrypoint between the normal stub and the zboot stub */
 efi_status_t efi_stub_common(efi_handle_t handle,
 			     efi_loaded_image_t *image,
 			     unsigned long image_addr,
-			     char *cmdline_ptr);
+			     char *cmdline_ptr,
+			     const struct efi_image_info *image_info);
 
 efi_status_t efi_handle_cmdline(efi_loaded_image_t *image, char **cmdline_ptr);
 
diff --git a/drivers/firmware/efi/libstub/image_info.S b/drivers/firmware/efi/libstub/image_info.S
new file mode 100644
index 000000000000..3d3dded0f451
--- /dev/null
+++ b/drivers/firmware/efi/libstub/image_info.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#define REL_REF(sym)	.long	sym - 0b
+
+	.globl		__efistub_efistub_image_info
+	.p2align	3
+__efistub_efistub_image_info:
+0:	REL_REF(_text)
+	REL_REF(__inittext_end)
+	REL_REF(_edata)
+	REL_REF(_end)
+	REL_REF(efi_primary_entry)
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4a5ffe164873..c6071b0e8f1a 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -31,6 +31,13 @@ struct sysfb_display_info *alloc_primary_display(void)
 	return __alloc_primary_display();
 }
 
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
+{
+	extern const u32 efistub_image_info_offset;
+
+	return (void *)image_base + efistub_image_info_offset;
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -93,9 +100,15 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 	}
 
 	// Decompress the payload into the newly allocated buffer
-	status = efi_zboot_decompress((void *)image_base, alloc_size) ?:
-	         efi_stub_common(handle, image, image_base, cmdline_ptr);
+	status = efi_zboot_decompress((void *)image_base, alloc_size);
+	if (status != EFI_SUCCESS)
+		goto error;
+
+	auto image_info = zboot_get_image_info(image_base);
+	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+				 image_info);
 
+error:
 	efi_free(alloc_size, image_base);
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 367907eb7d86..e1365907f805 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -24,6 +24,8 @@ SECTIONS
 		. = ALIGN(4);
 		__efistub_code_size = .;
 		LONG(zboot_code_size);
+		__efistub_efistub_image_info_offset = .;
+		LONG(efistub_image_info_offset);
 
 		_etext = ALIGN(4096);
 		. = _etext;
-- 
2.56.0.542.g3ef89b7020-goog

