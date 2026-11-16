Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839244;
	b=yveCJeUYPEC+737ORfxUU/5SOJiq8ADyIASTbDYLXupACdyDso61BII/Gx3HGajyGZQO
	 LZiqwLtUOR034opzb1oT/2zAosCyXj1rp/i5Bh9QedAaG1MEyfK5U9uVD7VYj2pzzrTA4
	 cd4qalU25rc1J2I7kGZWn4bCcQwtNj1KR6DhnTuz4taN3WDY3LO8xp2XB2ZB6ZMlhbSvP
	 3vuAQprpnkvRVf8BM+k9iP15wkzkk8nUCIf7ivCASO5HVri1jKZ+i3cwVYs90fi40Xg+t
	 aZWnz1zy6P7mf7WFnvIsdru5OJpKG9yZQdNk9uFHOA9LTLUvF2PNDOSCVXMhW04GIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
	b=kMtDShCaxdPtAiOTLarPedawZra0uWxXCxeMeJGAfagvGH5000/8GAqveJLNppRCiXUq
	 GE0KDdNQWIf9UFgaUqkii94jtwQzrx59Y1rhhpDCTBT/2T/LTEezGNj2/XluzC+DDYNpb
	 2KK6ygDOhb8cxaHTgUvTFMgjrHIJOKBTtxQZ1e23Zgrmx1udjQz6acUmzMXsWjqOaHAkx
	 KulJjL5uuwgkBSoESrGZV90/pA8Cgk9MjQREvXO9uwT/P6o53vWXtQuvHFrlse9ka/gVy
	 D+4bGn/O23MB/CDD0A/0GqfdbANp49QG8uvSPfJuVnag/sFjwR02e09jPDvVA0NTS8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mk6So3q8;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276BF606A337
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276BF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mk6So3q8
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso14308005e9.2
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839243; x=1795444043; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=mk6So3q8499g1fl2CD825MphRmNMpvqLHGstmgmTjkn4o+rHxaWTBr31NmfWXDp5Ko
         N+v6yWB26XK2C0ojaYgkcDOver6jYG8RdoKFzEZmyonLGxGgxkDLIVxJF3c6zC7TXuu9
         ffQLi1Gp/s7RqVqzr/hOyPJ5WE+UQ0sQ3TXTv7Bv9b4ZJtZDw9VHMpzHcofZT70ixFTO
         rK0Tkifs7N1hwGPUxljEl/KrU2/z1yftegccjPzfx61WhHxN77wMUwqu5/90H0UnaC1/
         qjzv7/cMIYaaU8nlLCcJGSCALgCKBOMmOwdtz/r57Vy40Wuij6VLQEixJEtlzCcwl1sl
         O11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839243; x=1795444043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RVj/mwGKYiU3kSMSXzOsaOfBC4aFrCWCPIyQ/H9Zds=;
        b=HMqzCoc2V0sinfjV80UQ87T58vmKtaDs0c8KgfdJd2/pD0coBVjFvbjyg2rfuSK4dm
         iaVl/o85uuXZoGTHBVs2YOMUGMNAeJKtKZaZFKbVdyH8slzulZLHDiesXKXxD9jpBQG+
         er8CrnG0RA/0Y01SZ46jAVNiSLLyoyBlITc0t6TlVtPHAZDUTEbdt+FMiOVGFfG5ZsPX
         hkOrhF0ckRvbatzfu8IEYD8S8DO/zhfPBaA3YI7pMCbqbXRqOwYmR5E1djDpCmfRm1XE
         AsuGKXru1ihqB3WgEhidHyWKfbh3wHnosjANpvzrvlcxu4lH3LS679rr8Kgimfe+yaKV
         6x5A==
X-Forwarded-Encrypted: i=1; AL+hErFLtxhe5x+/HIXaR0r+zlUBzYNLDUV/7vs+gkydvcpN5GrAz42sNoLUUysP4JhrDxlawGPiFZRqRjM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+had+LzrVV28VjHVkY6wXXtHnaxNcCkQt89G4rIChbd8N4DtGI
	XaB0BnXfVyQ0TyXUWzW76yxaSfbx50ZZziSXjzhlqstNWMIZZ/ALhqbGgbNmGTVqSQsCYcg5Wg=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a2:853:1e95])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8905:b0:4ba:4395:5755
 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr150647045e9.5.1794839242110; Mon, 16
 Nov 2026 06:27:22 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:27 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4305; i=ardb@kernel.org;
 h=from:subject; bh=peJRMhRWVHJG8sZnjgL/vZGGMw1q+y4rvprHAO6G7n0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30LSAazPnfFGeua/tpXiBqa7GNo/P075mL5pygqdn6
 /sH+yb6dJSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJXGlgZJhnynlSWGBaX1iU
 9cqi2qUMb5pWvPm9OV2Ad+a84JIpsfaMDOcrj/9WTLmm+nezcMEfzjnxbixp9oesrniaLZ9oFSy qywMA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-25-ardb+git@google.com>
Subject: [PATCH v3 08/15] efi/libstub: arm64: Use struct efi_image_info to
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
 arch/arm64/kernel/image-vars.h            | 10 ------
 drivers/firmware/efi/libstub/arm64-stub.c | 33 ++++++--------------
 2 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..329d5e214b36 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -20,8 +20,6 @@
 	PROVIDE(pisym = sym);		\
 	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
 
-PROVIDE(__efistub_primary_entry		= primary_entry);
-
 /*
  * The EFI stub has its own symbol namespace prefixed by __efistub_, to
  * isolate it from the kernel proper. The following symbols are legally
@@ -32,14 +30,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  * position independent manner
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
-
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
-#if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
-PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
-#endif
 PROVIDE(__efistub__ctype		= _ctype);
 
 PROVIDE(__pi___memcpy			= __pi_memcpy);
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index c93ab8b6e9d3..8ff8f8651504 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -10,7 +10,6 @@
 #include <linux/efi.h>
 #include <asm/efi.h>
 #include <asm/memory.h>
-#include <asm/sections.h>
 
 #include "efistub.h"
 
@@ -22,23 +21,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	unsigned long kernel_base	= efistub_kernel_base(*image_info);
+	unsigned long kernel_size	= efistub_kernel_size(*image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(*image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(*image_info);
 	efi_status_t status;
 
-	if (image->image_base != _text) {
+	if (image->image_base != (void *)kernel_base) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
-		image->image_base = _text;
+		image->image_base = (void *)kernel_base;
 	}
 
-	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
+	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-	kernel_size = _edata - _text;
-	kernel_codesize = __inittext_end - _text;
-	kernel_memsize = kernel_size + (_end - _edata);
 	*reserve_size = kernel_memsize;
-	*image_addr = (unsigned long)_text;
+	*image_addr = kernel_base;
 
 	status = efi_kaslr_relocate_kernel(image_addr, reserve_addr,
 					   reserve_size, kernel_size,
@@ -48,24 +47,10 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	if (status != EFI_SUCCESS)
 		return status;
 
-	*(unsigned long *)image_info += *image_addr - (unsigned long)_text;
+	*(unsigned long *)image_info += *image_addr - kernel_base;
 	return EFI_SUCCESS;
 }
 
-asmlinkage void primary_entry(void);
-
-unsigned long primary_entry_offset(void)
-{
-	/*
-	 * When built as part of the kernel, the EFI stub cannot branch to the
-	 * kernel proper via the image header, as the PE/COFF header is
-	 * strictly not part of the in-memory presentation of the image, only
-	 * of the file representation. So instead, we need to jump to the
-	 * actual entrypoint in the .text region of the image.
-	 */
-	return (char *)primary_entry - _text;
-}
-
 void efi_icache_sync(unsigned long start, unsigned long end)
 {
 	caches_clean_inval_pou(start, end);
-- 
2.56.0.611.g1030f0b940-goog

