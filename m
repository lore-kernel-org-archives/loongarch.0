Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313066;
	b=J7jEx+sReZK1aDUuPg9HmgtuXLAYKDeJTI6jqAScMJVYYIjdLnNzNHrQolOk05rfqdnN
	 8W0kkKlBGVsznsD4KkvEZlm6FSxXAcPn4p/Y+KbxHBuzPdKS/VrphAxkWJURr7rNHeJjC
	 IhfiMOB8xzx7YhJ7umYu/RV15bR3/PyuZ4trwIGD3m7Ny3eBpfTX+dQx8ihGgF7Wp07M5
	 MIENGb1TNBoquA4/oS5fmaVXxRpQ11j/k1bYMYB/1ppg24o+bUUuYUTIRi/+xWVbFIPkR
	 tLg0G0EBSSJQsmMJXt5D+0x89asUkMi75yKNSfhJi6r4RRaNx2ABmh7qBCzDBzd/hJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=s3QC/0gK2OClsDHJrI+qx7+T7UXE2mSOvFr6ntlSSRU=;
	b=k6oL3B6LRNwKiQrV0oP6YmKU0eDnwRLR1fTtq41xF4FnxKSj0GQRN4Hxc/Y4FukRFV8A
	 3NiLJEMxvjZRK1PdaHpyCpBAIIkW8Y/KTQ1i7/zp2vlHBlHFjUr6NSK9/WEKGQpL/J+G/
	 KymZ5SGjnxYcvd6WTo3wpqy+0LerPtF2GXY6SfFdt7yAtSkdiVVFPxSjNbFUfqVT91iCj
	 fXWwMG0MzDREvY0Amq+wWZ3TFeohKnb79U5hPAZb9o4gNx4PMeqR6376m3CbLbcAcHnBu
	 PuTb2EYo+TRmewCOY3EjSJpAOIFrYXL2QmdUj2eFex9laOm0kAE2IhKTr1VjUhZe9JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AYvDrPtt;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B80606A333
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B80606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AYvDrPtt
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1864221f8f.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313065; x=1794917865; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3QC/0gK2OClsDHJrI+qx7+T7UXE2mSOvFr6ntlSSRU=;
        b=AYvDrPttlyxBA2Old5hrXJ+u9SAlB34CePMd2Q4mbOlBKiQHUAxl4E8eWXXwizapuU
         +cQD5mQkDHLCg/KHhdkHSx6rPyWptijNsYCi+oH8tMdm1f6etu+mfs5H1vcDltaMXWiT
         ly1BdAl5fv2vEtL6HZjhkaxzstg/BZobfRujjBloH+iXBNRShNiaHif0IPHx2TSQndKC
         G0hmSJXTxRzLQTIYEr2TCyVnEvk7dekKaIvWpHVZlRGxCHCUfvUZA9j/+RmWqsbqzqGv
         HNYK2SQDY3gp6JWx2Afq07U58TClfFqW+k3Fjk259FK2BFcf/fBu66IjrCCTb5pZ8qZl
         2fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313065; x=1794917865;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3QC/0gK2OClsDHJrI+qx7+T7UXE2mSOvFr6ntlSSRU=;
        b=dd0d7pb++2T6cmpFnQdwy0o8QMi9SblsWjEoSHrC76Ft+YXat/uQLr3r2i0l4LblQM
         qj8NhWxd8mYhEc2v++PrcLginJArS7Ay8usOhtUrD5h4+E0XeiXk5DDfNSSn+QUbRsSf
         IjEfis+2xXkQB3Hi1FrHemiBKPe2rqPMbTVnFtlBmrpSWq//gQc/Ta1Q7XChozjmFnz8
         BRyERgGkX/QSKuzj1UJ+TwUiN3osPFI/cFIImnWHt3EBhRg6Hl5vsiWvKnG2wq9h662A
         wXCx2RMjPLq19NKJWR4gKDxL3kSPUA56VCDcgaQmA9w+ZPT4sfhISHGXya7boPb3HWIN
         xyHA==
X-Forwarded-Encrypted: i=1; AL+hErGMw8tCsQvPOV62ISXfBOfCrgcWk49/aO+fnow9xgS+OzqSErImA69vOruliYW05fP82kvzq6HMRPk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/4jneWUIRisYob58IhqVNA21kd/Q8td4SEz//KjRL1wZrAe9eL
	tzgtyevnWfzLrg7W4QsIB4zedKUlhurOIWOyP0JHdz4gPT70Sywz+QdV68VBzHortmq/e46hfw=
	=
X-Received: from wrod4.prod.google.com ([2002:adf:ef84:0:b0:48d:f014:9e3c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:268a:b0:48e:c84:5be6
 with SMTP id ffacd0b85a97d-4982ecf61e2mr4261257f8f.14.1794313064491; Tue, 10
 Nov 2026 04:17:44 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:37 +0100
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
Message-ID: <20261110121731.2728824-17-ardb+git@google.com>
Subject: [PATCH v2 05/10] efi/libstub: arm64: Use struct efi_image_info to
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
 arch/arm64/kernel/image-vars.h            |  6 ------
 drivers/firmware/efi/libstub/arm64-stub.c | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..9ab71d103f64 100644
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
@@ -33,10 +31,6 @@ PROVIDE(__efistub_primary_entry		= primary_entry);
  */
 PROVIDE(__efistub_caches_clean_inval_pou = __pi_caches_clean_inval_pou);
 
-PROVIDE(__efistub__text			= _text);
-PROVIDE(__efistub__end			= _end);
-PROVIDE(__efistub___inittext_end       	= __inittext_end);
-PROVIDE(__efistub__edata		= _edata);
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 PROVIDE(__efistub_sysfb_primary_display	= sysfb_primary_display);
 #endif
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..8184b345af69 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -10,7 +10,6 @@
 #include <linux/efi.h>
 #include <asm/efi.h>
 #include <asm/memory.h>
-#include <asm/sections.h>
 
 #include "efistub.h"
 
@@ -21,22 +20,23 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	auto image_info			= efistub_get_image_info();
+	unsigned long kernel_base	= efistub_kernel_base(image_info);
+	unsigned long kernel_size	= efistub_kernel_size(image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(image_info);
 
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
 
 	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
 					 kernel_size, kernel_codesize, kernel_memsize,
@@ -54,7 +54,7 @@ unsigned long primary_entry_offset(void)
 	 * of the file representation. So instead, we need to jump to the
 	 * actual entrypoint in the .text region of the image.
 	 */
-	return (char *)primary_entry - _text;
+	return efistub_kernel_entry_offset(efistub_get_image_info());
 }
 
 void efi_icache_sync(unsigned long start, unsigned long end)
-- 
2.56.0.542.g3ef89b7020-goog

