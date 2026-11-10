Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313069;
	b=TldURGmWoG823nLLH4TEMqUUhpS3mYYPQMOZo4xZUshXo9tanTIL3wGlKBjOq45j0DAs
	 lwe2xzE4bWHL9TbnoiOe+8cVLUenpmxovlytH3pjxbHytqktBezSrKFOzsfVeV//XR93a
	 FSNl4vNwSmfspqWHNwij2eKvok3cQPCwC7Phckcxm5KGQykbtYXvCeLXrv5jTJ+3M3RLq
	 fyKuGPxUl3Oh2qNFYy1dkWyMIn4mnc4857eOiYtcKAGayqRDdqfcp83TiXXLGWUOgZRT1
	 t92R3NkjGOFTL9T/piyMewSd1HJuNxkS3AfFwgRLpDFDbcwZqe6+z0lQJvsp43auZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
	b=RYwA9GVokIgChRwimEJPBm/KeKkBzLAm035QodErIIzso+Jgje4ruoQ2Ej0n5ETI8A3J
	 LSixotTrV61HgeC+/a+ziE5s3o41/nBdHK0aYBX3vMU5zK5F/slzaLJg/aE+iH82GmWbM
	 1ssz6l9weJ4MLV0neMANdiuKBYKKH5fPRqW0VuzGcQEKwbPJWU736JZlw/NchUlGNU0zD
	 XxB/iwkXNQmcGjmpJoqy4BJdtvFemajv5FvNMT/jXEh3iozFIIc1w8xKzNCylIaRxjJ7f
	 aepPWepBTmCoRE0tRbrYnR7sl6hM698qCwjfzCT5QNcjnJiSgnxR1nAFMu6TzqHF2Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tt4erqsL;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C0606A31C
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tt4erqsL
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso1184312f8f.2
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313067; x=1794917867; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=Tt4erqsL4gerLKKN9KmAKoPVoG0CU6T6jtZHLZuLXDm2kB3UentjpeUwGXAkiAhbp7
         Nc4M+PTaEBUXPIiy8FvNHSHo3bV13Um7fX6cAsytSMxMZPQMqW4myQSsrQTqNYu8anMk
         TSGmvjMF4aw7LzvG5FZMV21iRdpkDyyz4nNPOI1GpdB3sfph1CWm8mV1/wcroL6hJYSx
         SZ0NVaPuHMUt1wBOS5+XRAOWfq6mcBAfpCrUaiiiDs/e0JGJ5yBOgQPb3S2Ov/gT4+42
         v6GHV9EyJ27llhPmVAwSy3ugWRvpIoOP4OZjvcYcdUmzbEBJu8z6C2nBkm/CzJIfwv/V
         1deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313067; x=1794917867;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NfbOn3Kflbxnh3F008n5JJpxbmKMRJyc/lu3FOPZxo=;
        b=g14aCd2vWSNaPzj4qdoKZoNBjpWAvHoIudtpzHlw1b93+uLDksTh6bddSv/n9bpXEp
         gYDOvsdjuzbegFWBY4+wS9vh0qywR08hH/Xqm0zXHqwRcWez3W8GsapIeFqDlsYBkL6V
         1P6KOHr60yAmg3URRtYK3UqV7vR3MMoBjH4IHfvdxXA7zDw5O0i4tIBWwh4DVWfCZMUn
         Zd/fmWC3ZMl3LUyUhWyx0jA2wlgKj+uFLNM5xiEDI3/HBh0DcC8XxBRU6lonjpeMCUvN
         wcLgilQQTcZgtkwpQPLGOKUDgVl48Ut6ceqFkCcZOA2SL830u5MtLLG0TccrkCNp3LvQ
         aIEA==
X-Forwarded-Encrypted: i=1; AL+hErFuc3t6J7rqI74SX2+eKPxnBF+GkFD5fzm4Ai6blC6xYNf8LqLJw80kkMaDIHvCyF2cPiOyi5RTBW4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+munP8TNbPzz9d99lopXN0ro+vp9hGaXTxC88DOhUVkuzWZGTJ
	zvDHL/MMPMUtw12COtZBt7nlx5lDT49x79H9Eogig9K9xd6qwekRTNaA4pHfdavQifVn+YpWjg=
	=
X-Received: from wrnj18.prod.google.com ([2002:adf:ea52:0:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:34d3:b0:4a1:e6c5:e44c
 with SMTP id 5b1f17b1804b1-4ba0233e7f5mr39656725e9.10.1794313067235; Tue, 10
 Nov 2026 04:17:47 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:39 +0100
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
Message-ID: <20261110121731.2728824-19-ardb+git@google.com>
Subject: [PATCH v2 07/10] efi/libstub: riscv: Use struct efi_image_info to
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
 arch/riscv/kernel/image-vars.h            |  5 -----
 drivers/firmware/efi/libstub/riscv-stub.c | 14 +++++++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index bf703eba3fa5..27efb990da43 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -23,11 +23,6 @@
  * linked at. The routines below are all implemented in assembler in a
  * position independent manner
  */
-__efistub__start		= _start;
-__efistub__start_kernel		= _start_kernel;
-__efistub__end			= _end;
-__efistub__edata		= _edata;
-__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 5cbc50a814e1..e8d66f6fe8e0 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -6,7 +6,6 @@
 #include <linux/efi.h>
 
 #include <asm/efi.h>
-#include <asm/sections.h>
 #include <linux/unaligned.h>
 
 #include "efistub.h"
@@ -20,7 +19,7 @@ unsigned long stext_offset(void)
 	 * of the file representation. So instead, we need to jump to the
 	 * actual entrypoint in the .text region of the image.
 	 */
-	return _start_kernel - _start;
+	return efistub_kernel_entry_offset(efistub_get_image_info());
 }
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
@@ -30,13 +29,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	unsigned long kernel_size, kernel_codesize, kernel_memsize;
+	auto image_info			= efistub_get_image_info();
+	unsigned long kernel_base	= efistub_kernel_base(image_info);
+	unsigned long kernel_size	= efistub_kernel_size(image_info);
+	unsigned long kernel_codesize	= efistub_kernel_codesize(image_info);
+	unsigned long kernel_memsize	= efistub_kernel_memsize(image_info);
 	efi_status_t status;
 
-	kernel_size = _edata - _start;
-	kernel_codesize = __inittext_end - _start;
-	kernel_memsize = kernel_size + (_end - _edata);
-	*image_addr = (unsigned long)_start;
+	*image_addr = kernel_base;
 	*reserve_size = kernel_memsize;
 
 	status = efi_kaslr_relocate_kernel(image_addr,
-- 
2.56.0.542.g3ef89b7020-goog

