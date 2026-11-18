Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026120;
	b=nUJbCF9Ns6CsgSoxB3lo7F1DqlaQDFgBJXqDAEoX64fPss2ikWs7hrs5VzzwoqPWSy5C
	 Nr9gTEWsfUAXuGlzQZqw8gK3P/f9aSgGs4nVOWCmjsKX144grr0F2x8f8iGVEvzJaegH8
	 CGIpFA1MRfIDN1Ws53r9guPOPV101dvir/17bfRPjo7dLKukPmMYEPD8xn1i7/cHhr6qO
	 Awr4EUVhFzLUA/6M7/U1MJDvMmbf//zc40tHc5YEe88CG++HifoYB4uBaWO0lSfGj2BeG
	 wiUQgfTQ6knkOnrrM5gHYMA0cGeEy017Q9klo7gQhKqKnJ6fyS67+Bwx7p91Lv5t9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=M1Jz1/QbPHolNpw7hViozPe0OhTh9e6urlvNZ1PN/CE=;
	b=AtevsFF0tYJyAVvF0WxWimhgdWjT5Kuroe6T6SJktvH3PgaGLH5EWYvKGLUCHpHEJuNF
	 XdIviOVq03QyInmd4y6Fl0GdodAoO3R/ltbvUXleakj87hHlrKRqu7NI/OF8bSvOAsZ0U
	 q+d20y/OhGHGsDFeEfGI0C4482HR0T40vEn6dmz9kabLk1BWBP+ffNzv83jVUlc8xNTKY
	 W8/ACsiBhT5ANxsUfjdbYF93FfDB6jS6PZVMcbJ97/lIYoFHq+6R/PllN7iuqu/yb/agi
	 u8YoxPRMC2gpGWN53iHnSupg/Rbhg9DnKP9TrtPkpEN2qD1kVR41WRe28wLOL6SPajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KHr2xF1p;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB51606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB51606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KHr2xF1p
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c50657eaef0so51832566b.3
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026118; x=1795630918; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1Jz1/QbPHolNpw7hViozPe0OhTh9e6urlvNZ1PN/CE=;
        b=KHr2xF1peBB1q3+86znoyGoNt7ShhhgdtxbY+CDbwJzED6F/fhmRwel2SpU4f2vu2L
         G8EFENwStUxwmnmq3PnbKSJTdT9ai/OBAojvYTMMgLEPLNs1KKM69gjxl5odeoahLsWj
         9iM6aECpPK1j43gRgqJeICsynokBC6XdW8jXVQvSkxuDzezEeUx2JGThx9uO1u54LAav
         4NTyCITk+Vz5i4bLfSiG4tOSxTNh1dzhyJnfIcbOPGXoBXiytNzAk1DaFQPz6hEcFM1D
         Z5ePIzXGsQQiQ4DC+BQiFxyc5vIWpjz5yiNK+uXOkmufoM+FhiRgjyJTsfOmhObZJGSl
         2Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026118; x=1795630918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1Jz1/QbPHolNpw7hViozPe0OhTh9e6urlvNZ1PN/CE=;
        b=nQqrKb/eai26+2DYUJ5fDgPqG83dIowA0RrccpD1LekcZSkDLYXh79jm5w7NbbDotB
         ZMgwD2aZjtWbtwy468NciWNjBI+jtdPKgqkKnmFbmc56Dn09fmj9r7ftaSDFKNg4uFAC
         kg5dECnGowVab6I5v5MOcSy7w+sHUoSXqhD2Okq83Gt0E14YvlFvfS1r7mu1yNnFt9jf
         k7p3MrqQXgwrEhmtMdRuBHVu1/XpS3pocvRzr34qc+P1hB5SfJKjonoD/yyN1+JeOteU
         KK2Yl1X7fH3cFoefASpKNQM9T06g2s+eiRUHSDtKks5Jm3i4ELCD1A9YYDG9BOGuCPiw
         WxIw==
X-Forwarded-Encrypted: i=1; AL+hErGS9K2JL5L4pXT0++c8M6TPW4mqzwvygidTpBy/kdKe9zjHice0XjQGk00RCq8Y2Sv9MrVL3UcUiO0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+tSAYvy5UiZypXp9PZCF3qRN2GSVjntuS0WGNG+5P/MDT9rfCD
	RqZJKObs8TIDzWSDlxyfO10YRCYnSa6nF5eIPo1yASafhcwyu9zSA7QOiF1AbKN/at34kuD1Pw=
	=
X-Received: from ejbjo16.prod.google.com ([2002:a17:906:f6d0:b0:c4d:2462:39ce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7f94:b0:c41:4d5:e97c
 with SMTP id a640c23a62f3a-c510e361646mr311603866b.37.1795026118221; Wed, 18
 Nov 2026 10:21:58 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:13 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6557; i=ardb@kernel.org;
 h=from:subject; bh=UpOlRDfxgKbTpCknhkTVYs14c9RoP6u0s/Oh13lIEDY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmzm2ncdETfvsKw8rxd7+8/mufGDvsrVFrJMOrXz+Z
 dMcgdOLOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFi5hZNibunG1wdlpO5qu
 r1/meKdsX//eQud1DGdlLrUy3SjRe+jHyDDXbGe7/YmN0aueTz2kd0pxy6GZ7tL56YaJBrPObFj oLsUOAA==
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-28-ardb+git@google.com>
Subject: [PATCH v4 07/19] efi/libstub: Avoid reserve_addr/_size in efi_kaslr_relocate_kernel()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Avoid reserve_addr and reserve_size to carry the information about the
allocated space for the relocated kernel, and instead, use a single
alloc_size output parameter that is wired to image_size.

While at it, don't use the alloc_size as an in/out parameter, but only
use it to return the allocated size (and leave it as 0x0 if the image
is going to execute in place)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64-stub.c |  3 +-
 drivers/firmware/efi/libstub/efistub.h    |  3 +-
 drivers/firmware/efi/libstub/kaslr.c      | 30 +++++++++-----------
 drivers/firmware/efi/libstub/riscv-stub.c |  4 +--
 4 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..fe0deae78e5b 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -35,10 +35,9 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	kernel_size = _edata - _text;
 	kernel_codesize = __inittext_end - _text;
 	kernel_memsize = kernel_size + (_end - _edata);
-	*reserve_size = kernel_memsize;
 	*image_addr = (unsigned long)_text;
 
-	return efi_kaslr_relocate_kernel(image_addr, reserve_addr, reserve_size,
+	return efi_kaslr_relocate_kernel(image_addr, image_size,
 					 kernel_size, kernel_codesize, kernel_memsize,
 					 efi_kaslr_get_phys_seed(image_handle));
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index f5eec8c12894..5c10815d9172 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1244,8 +1244,7 @@ const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
-				       unsigned long *reserve_addr,
-				       unsigned long *reserve_size,
+				       unsigned long *alloc_size,
 				       unsigned long kernel_size,
 				       unsigned long kernel_codesize,
 				       unsigned long kernel_memsize,
diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index b34e4599f0f6..49b05d0c0003 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -82,9 +82,8 @@ static bool check_image_region(u64 base, u64 size)
 
 /**
  * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
- * @image_addr:		Pointer to the current kernel location
- * @reserve_addr:	Pointer to the relocated kernel location
- * @reserve_size:	Size of the relocated kernel
+ * @image_addr:		Pointer to variable carrying the image base address
+ * @alloc_size:		Pointer to variable carrying the allocated size
  * @kernel_size:	Size of the text + data
  * @kernel_codesize:	Size of the text
  * @kernel_memsize:	Size of the text + data + bss
@@ -97,13 +96,13 @@ static bool check_image_region(u64 base, u64 size)
  * Return:	status code, EFI_SUCCESS if relocation is successful
  */
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
-				       unsigned long *reserve_addr,
-				       unsigned long *reserve_size,
+				       unsigned long *alloc_size,
 				       unsigned long kernel_size,
 				       unsigned long kernel_codesize,
 				       unsigned long kernel_memsize,
 				       u32 phys_seed)
 {
+	unsigned long kernel_base = *image_addr;
 	efi_status_t status;
 	u64 min_kimg_align = efi_get_kimg_min_align();
 
@@ -112,8 +111,8 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		 * If KASLR is enabled, and we have some randomness available,
 		 * locate the kernel at a randomized offset in physical memory.
 		 */
-		status = efi_random_alloc(*reserve_size, min_kimg_align,
-					  reserve_addr, phys_seed,
+		status = efi_random_alloc(kernel_memsize, min_kimg_align,
+					  image_addr, phys_seed,
 					  EFI_LOADER_CODE, 0, EFI_ALLOC_LIMIT);
 		if (status != EFI_SUCCESS)
 			efi_warn("efi_random_alloc() failed: 0x%lx\n", status);
@@ -122,33 +121,32 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 	}
 
 	if (status != EFI_SUCCESS) {
-		if (!check_image_region(*image_addr, kernel_memsize)) {
+		if (!check_image_region(kernel_base, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
-		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
+		} else if (IS_ALIGNED(kernel_base, min_kimg_align) &&
+			   (kernel_base + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
 			 */
-			*reserve_size = 0;
 			return EFI_SUCCESS;
 		}
 
-		status = efi_allocate_pages_aligned(*reserve_size, reserve_addr,
+		status = efi_allocate_pages_aligned(kernel_memsize, image_addr,
 						    ULONG_MAX, min_kimg_align,
 						    EFI_LOADER_CODE);
 
 		if (status != EFI_SUCCESS) {
 			efi_err("Failed to relocate kernel\n");
-			*reserve_size = 0;
 			return status;
 		}
 	}
 
-	memcpy((void *)*reserve_addr, (void *)*image_addr, kernel_size);
-	*image_addr = *reserve_addr;
+	memcpy((void *)*image_addr, (void *)kernel_base, kernel_size);
+	*alloc_size = kernel_memsize;
+
 	efi_icache_sync(*image_addr, *image_addr + kernel_codesize);
-	efi_remap_image(*image_addr, *reserve_size, kernel_codesize);
+	efi_remap_image(*image_addr, kernel_memsize, kernel_codesize);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 5cbc50a814e1..d0fc04d21b56 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -37,10 +37,8 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	kernel_codesize = __inittext_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
-	*reserve_size = kernel_memsize;
 
-	status = efi_kaslr_relocate_kernel(image_addr,
-					   reserve_addr, reserve_size,
+	status = efi_kaslr_relocate_kernel(image_addr, image_size,
 					   kernel_size, kernel_codesize, kernel_memsize,
 					   efi_kaslr_get_phys_seed(image_handle));
 	if (status != EFI_SUCCESS)
-- 
2.56.1.708.g77570a6a1d-goog

