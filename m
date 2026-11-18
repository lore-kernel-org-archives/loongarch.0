Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026130;
	b=cotagtnCHSIyLLVEI/AGO2JqAgAVMmDO7UrBwPk3STKfjmvV36gkW/c7aO42Qn5hqG+M
	 meQINgdfEMBjVJ2viWWbH/Xg4GRjBeCyy3btD7YP/2S1uYDS1J1VY6tRRDdsXO9D7NgIP
	 6tJUpPeAjSez7yflBbErzlQ7414w0/gYe7fN0quxTEsBFuwiRCW0Hk1GuE6tSvj1UWfDs
	 FXHReATCAAd5d+qY2aLus0lcut4pwdP6rUKK4HjNhE4SfmEgxNkcHcpNzPOJZeWQUQ/Td
	 wW57bW7yzdNgATOSTDchunY8n6v/mA9RIV31QjVf6skIpUm4IGHFw1mmxKibIluvaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/w24HJ5snxMHL69L/+mJ+Lj7pv3WZPo9wKgPL92/NjM=;
	b=iZ/BRexJ+JGYdh+qBuw+wKScx7fz85XnURO5mVwzJbkoE3SaBdQpfpEGkasOcw8Iac2A
	 rriHPOct13KVFSNtTkPhEuDlCml3HnG+SsN8/1fw7YOZA1SruaZzz0kMpuo5EHjhXKCzt
	 2zhb9z2RwvqWDGnB9vGBLjQukhh7hmvFJ6oXtzA8nzKTlWXtS1NnWCm5NkSEP9tJ7rxyN
	 UOhW8euQg5dt3WUOzTMHTbOZIV7so0Llc/tvSC4IkJUh1kzrzP/L6wMu3orHl49rk1DtN
	 B2EOH9ljrqN1qKNj0sVBwX2VNsa8A6N73qaInfdABehcjkjrxjSctCGZ1TFrVLjF+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mjnwXbGQ;
	arc=none smtp.remote-ip=209.85.208.198
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5735D606A32C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5735D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mjnwXbGQ
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab42f480e1so6835881fa.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026128; x=1795630928; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/w24HJ5snxMHL69L/+mJ+Lj7pv3WZPo9wKgPL92/NjM=;
        b=mjnwXbGQxnnarWTGvf62lLYueMv9wWzFGVj83iaJ++pKmh5TQYOTp6Kau7VxOIpB+D
         aX73KBUWPju4moYktNrd9h0Aiu/7BTPkTXNsc1TwG/bNKA74RqLYd9qrBmvGof2iAraP
         JbCn6XYWED5CTdjUmh0ff15DFk+QuE3gXYuRg6VkNynXdK/9/XN4aUqeR+I9JowzbbYS
         NJW83Eh1wmjQzPEvbXzJtvvm4iBal8N7POSBK1EhnTXj3KoXkkjkREr2uD+J8aHDBL24
         XQaKyd8x9K4WHpn36P+pN4NZ+dt6wkUg7F4ICcvKLLx+u75XVFXBe+2QRNdRCA7i9rCo
         7B8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026128; x=1795630928;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/w24HJ5snxMHL69L/+mJ+Lj7pv3WZPo9wKgPL92/NjM=;
        b=yjnM4MKofUWZ+eVnmml4u2pFYwqSdl8v8UbCsp9vTE1lFdiQhD8+SboRyDhrjrcnT3
         xgFejKVSbzpx3dEXQxFduHFytjaYYVvMI8yCLYqbXQckA4UrN3v2vuOb6JGEkfdhHO2G
         5BdHbmBcP0jFAPfnQnnc/85HqUXjc7uXscRX65mwhX4Lgq4fUIbJp9Vnfu53lT5lAGDa
         yinxKYL6IOxMqDbSz0wlnaPhKIZVbhl6esQPnPRSy4ZVxgahbbT+bYCEQbaWjq+sSaRn
         sJ5bkTZZCxbcVFGi+Xao2ErhdAJb2adEI2LA7sYKfsMBa0KjLOkBs3kCvNtTr8/wiCjy
         mMZA==
X-Forwarded-Encrypted: i=1; AL+hErHN5cKXS1qYawWGBX4A135tvfplkDkglXohOt5PkkMGCmdz4C+XAOORDp6mUwXLiaEZjxM9gO0a7Jk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8T0+6YMmhcl6OhRjQx56gddTRUQ2HVyt2LPi/OF4uVOwaKPh3Y
	LICkUNf8RCzsLz7ICPkWxCPWrrB2D6ufR6IrVvcN/Mahl7mflBQBBW2Yy2TVkwFNrz0e5+k9Mg=
	=
X-Received: from ljke10.prod.google.com ([2002:a2e:9e0a:0:b0:3ad:cb6c:2eac])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:128e:b0:5c1:57c0:50a
 with SMTP id 2adb3069b0e04-5c1a9a70da2mr1102294e87.6.1795026128043; Wed, 18
 Nov 2026 10:22:08 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:18 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=ardb@kernel.org;
 h=from:subject; bh=wNLIXVywodXJ9QBXpbGE8MqPkM5GL227KxQF5YBIKeY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm8UspUdmNPI807zatFKuZGFOu/OMG3lnPcRsJ5rUJ
 X++mbG6o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk219GhssVs7fNSPr4JkY6
 9cIMJd616y69vOvOc1Xs3umnGyxWl+QxMhz7evb0mumaBSbvtE8JXJ+SF/3miIWf0/QjVh27X/6 +xM8GAA==
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-33-ardb+git@google.com>
Subject: [PATCH v4 12/19] efi/libstub: arm64: Use struct efi_image_info to
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h            | 10 ----------
 drivers/firmware/efi/libstub/arm64-stub.c |  8 +++++---
 2 files changed, 5 insertions(+), 13 deletions(-)

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
index af38cf73cf01..351fcb4493e1 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -19,12 +19,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
 {
-	if (image->image_base != _text) {
+	unsigned long kernel_base = efistub_kernel_base(*image_info);
+
+	if (image->image_base != (void *)kernel_base) {
 		efi_err("FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value\n");
-		image->image_base = _text;
+		image->image_base = (void *)kernel_base;
 	}
 
-	if (!IS_ALIGNED((u64)_text, SEGMENT_ALIGN))
+	if (!IS_ALIGNED(kernel_base, SEGMENT_ALIGN))
 		efi_err("FIRMWARE BUG: kernel image not aligned on %dk boundary\n",
 			SEGMENT_ALIGN >> 10);
 
-- 
2.56.1.708.g77570a6a1d-goog

