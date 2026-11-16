Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839247;
	b=OW7fikbGqQDwZldcn+FeEFyEqIERmXXVMZAT70moTIz2OltIcWeFIsyMRxo9ap65P0aC
	 ZeEeG+SYxNlv3bLMg5UPcg5cLp9f9BcelBh6Pzkt6eUiAPT1k37RnoLxjC0L+/wY/zFdw
	 thymCBiKhTjUlDBZOvkpr/HG7yVFwXHa4lYOqMc8YNurajLmmqOTq5cQalXPyDRx9I4FK
	 R1hQh+YuHuK88DXgR8jUHRuN+Wfr9RDsxRjnSK48xK3eaWID1D0AZ+vJMCOu1uL1hOmwd
	 zCUfRxorS9abNQah/I1VQcjDa36JzQSFAOloEffoWyyu6slVQpdHOgNvxKERhC4SYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o11hgmvCCkoqVQmKB/Ee34WO8eez+JgS5dBD2M+SoXI=;
	b=hpXyWjn/k3IzcD5G+OWgrFo6BtA1C/EPIqNNHLeUta/a3GeMX4yQp04GVky8kuAoQvoE
	 mn7c87vDa6WhE4vmIzDvGPOvmovp++F+HdiyRJsNjfjw+jiFqavsA5enXui9K84a9xhvz
	 QqTyijyAvE1ROGDGZRjL0ESqkbZSXu71wpkDZgqbi4dz7JaWLltMfodgG0mzDwaB3iJsa
	 HC+pmZOCiEAGjJpgFJYcctpH67bD7+aEBCosmGEnJsHBq7Rczh8qJTdNRT8zOj76+Qfkm
	 AG5UdeSFS8KTvdUmP2LJbxt1UvICufq+04Jj01xoZc7ACpFUEKQo0C0p033EiVIZ1Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="N5838cb/";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA794606A33A
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA794606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N5838cb/
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492b5408dedso1951693f8f.3
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839245; x=1795444045; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o11hgmvCCkoqVQmKB/Ee34WO8eez+JgS5dBD2M+SoXI=;
        b=N5838cb/kiiwkuy4j7xndsTrjrAoie4i5E81YfxuBYhDbsXaTL115ZXg7rjl5XObHu
         C5tQq+NKS8EJVFi/Yh1B99An5unMjyRMyuiaXufP3J0zp+I9tP6UyOWvaIY8pdqxV5eq
         +RK1VxByE4VUA+y4DPA3vfOhNgj8Z2lBHd5ynJBNeMqRrgbKfCLmq8Wg2RQW4JhVUTc2
         SCG5ALt/JS8RKvcwAxtvJmmDyUZ9L7O938+ylYkrZh9BNMqXDHM7U4m/rxhSYrY+WA6n
         xTeelctTVKpexJjaAS2FA8IrGcExunx9GbJ7PLGPKNbUqeoRbUUKWR1o3TLJf2aWWxim
         c1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839245; x=1795444045;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o11hgmvCCkoqVQmKB/Ee34WO8eez+JgS5dBD2M+SoXI=;
        b=azpYWfuUiWh/YF6rX16eV/k37eXGXlw1Q7gf1iS/YvSDN1OQDTBGu+Z28AeUVhDsW1
         rm4qy5kHY52pY7pyc9sNKHUyEhryMpTJVqOtYA43WOAR3ptPAMJ/pBitwrR+XHCgzJJs
         SSKYMyLWX8EXHtaIyL8gidFCQA/rbXHbPuD835HmNX2Oj0Wubixd1nQbGgF6lL2S7eOZ
         2kzENDw4MSXPOCYoY/DA0iAr/mEpyQT6R6ombnj6GMPOVTmCBQ1uugyUdb1TKQ0qxpd5
         ubG0XutlD/bHlNI8KSqQA3MkYSDhPEn7aZnevaBFv3WIVFDStgji4EbMOtmaynakmEtD
         Q/rA==
X-Forwarded-Encrypted: i=1; AL+hErEMcJru3izNtja4fOIoybs8lI5FENkSFlXlyvEV910sJgq/FpB1Xm5KjqIWcI5+TN9g0Tf8e4tAxkg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8LUZtZnZKeYMiKOapJs5Q/qxVFCFEcv2npHVJrCyAnwRFtH1fG
	mbuD75jfUaoPFX9sqoMKRSgb0x3RBUjTiGhrMeNEt06Jgy4kQiZdsICQVNq37Mv8sjk0BFEFRQ=
	=
X-Received: from wron1.prod.google.com ([2002:adf:f081:0:b0:48a:f42f:f171])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64e4:0:b0:487:6f2:1a4c
 with SMTP id ffacd0b85a97d-49c7381b46cmr25352969f8f.25.1794839244204; Mon, 16
 Nov 2026 06:27:24 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:29 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3411; i=ardb@kernel.org;
 h=from:subject; bh=0nt34/MyeHyViz+7a3rT70EnJHsQtwP3I7KaD72gSz8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30MwW9bOfZvZ9yNX/vfrllKK/Sb621ld3cr94vuZPV
 XKIj2JiRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIaRojw6VFJQo7Lx1UX/bw
 Z4Lt9mypXpbEfDaVbsdzMx+zxa+ad4iR4fPSijBDhm9f1SV53q4o+TLnofCRLzvWVE9J4bisvO3 uXU4A
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-27-ardb+git@google.com>
Subject: [PATCH v3 10/15] efi/libstub: riscv: Use struct efi_image_info to
 access image properties
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of exposing individual symbols to the EFI stub explicitly via
the linker script, use the generic struct efi_image_info, which accesses
the original symbols via PC-relative references from the stub itself.

This improves code reuse across architectures, and makes it easier to
add new references in a generic manner.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/image-vars.h            |  8 -------
 drivers/firmware/efi/libstub/riscv-stub.c | 25 +++++---------------
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..c18b24792a29 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,14 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-__efistub_sysfb_primary_display	= sysfb_primary_display;
-#endif
 
 /*
  * These double-word integer shifts are used by the library code, and
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 0ddbe7cc8628..58581ccb4cc0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -6,23 +6,10 @@
 #include <linux/efi.h>
 
 #include <asm/efi.h>
-#include <asm/sections.h>
 #include <linux/unaligned.h>
 
 #include "efistub.h"
 
-unsigned long stext_offset(void)
-{
-	/*
-	 * When built as part of the kernel, the EFI stub cannot branch to the
-	 * kernel proper via the image header, as the PE/COFF header is
-	 * strictly not part of the in-memory presentation of the image, only
-	 * of the file representation. So instead, we need to jump to the
-	 * actual entrypoint in the .text region of the image.
-	 */
-	return _start_kernel - _start;
-}
-
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
 				 unsigned long *reserve_addr,
@@ -31,13 +18,13 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
+	*image_addr = kernel_base;
 	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
@@ -47,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		efi_err("Failed to relocate kernel\n");
 
-	*(unsigned long *)image_info += *image_addr - (unsigned long)_start;
+	*(unsigned long *)image_info += *image_addr - kernel_base;
 	return status;
 }
 
-- 
2.56.0.611.g1030f0b940-goog

