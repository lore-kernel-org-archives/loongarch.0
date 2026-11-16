Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839250;
	b=j+KRRk+oC7ehop4PcxtEuC9H4V7c0tYTTujQT6wNslDyYpwh6ANgTMpjGjcX0wKOBA+q
	 3HtDmepSgssmvXJ+B/iIvMBhZdpsmZb4sAhFskZUXNfOhHjiNqY2LCIZH4iIPWfWB2aZb
	 GeMVg9Cn9ae5T5pTqLFjpWySr8xP8bvo5K6hL3MvetB56XslkAsudKAxMekty671h+HhS
	 Gr3glN4g/BzroYFPOp3mbJkMUgw2614sLnBRC3upCjC1FPbdnRdE/D+sfZmj2A2Dgp6eo
	 Fv+XnJpIc2ffKeJPEzN543Xvsutb4zoPapCTqrUgyMZ3GNcWdIWPIuPV4kw3zTAXpFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
	b=0jsp/ByZmzIZD90N63Q3zPg17y7BDmENz2wmUbKN3zCb5BTp6aYFn+058me8RQzgVIJK
	 DT56Hm3t5N1dzkKeJE4a5P3IjDIeXjGcFof6VsSPwtSeqECgIaI92/MPZbBAZMBvFSj5q
	 2tBqc/eZqx8VVD8Uu0TnOMXzLrl2JSXIzSH4anGiHaJkvAsFiBoiwOat7khv/EfaCsCO5
	 OGTeXdecE50hwwEqGsxbwmEuBrpfQrCAgi8sF8aDr9TmziMR9HX6LVSXhUm5MQmITZE44
	 xXFDBBiZTL05k3N9IXzQLTtIVSl0wakJo2bDBKKFX1wTDG/GG12+tsGbouN+lnV7ZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OUoAFUWc;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBED606A31C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OUoAFUWc
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4916bd6e3baso2744483f8f.0
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839249; x=1795444049; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=OUoAFUWc8u8GLLKmWpytAz6WcQKe9vr9LG9mlfFJltWyX/mOwvQ05lndr8xoBPimZ4
         l3RNtSxqjhMwqqXN2+Zkf0ZNXBqDKzk6p7PJZpDvh4+vIx1fqtCS96uY9Diw6JeMKPBT
         0Kqe5Ow+cCRwDdDs7u/gh4nwmmQ0w7iP/GhYsFuUvuPEUvvfgy5eem5A3DGLuOh6iFAy
         k/Gt0aWdQhbdBNj8PtBvdop5dozSBNO2cpO5cwNhwJKjc8LV4i4qe+W6uDNdOd8OpSsz
         QySr0c3PtCHAHFkByN8U1oVaWnb4fPgsWtRlD3LugS8BLByfY3QEmpMZqtbbx0K4H/GL
         jBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839249; x=1795444049;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7Sgz3ld+ZNxi0hBngHAfrUu3ksDDoe/zQYxMmRp/T4=;
        b=zg8NVYESdJw9s3vBdQBxFjCujgmP988SLxB/SFD9WI5VB9OhblzaMDM6jAimtfvzQl
         bxwYyc0kbFncrLbxgTb6D3yDsAktq/gRV9i8sI4gZzQOHmfJTEBJ1xoUUvg/R54g0Tvn
         KW+voPYzOFj948y1UehbTFbq9OR/h5byXWYEjPNtp5SxA6YoVC3K5m3Q5HdHrkFPl8gI
         hUDpAgMMkTmbbzgD7dZDFU4lCBg5FNDA4Adpa2VmwKDytuHJpJKP7oGEWnAxx+R2VAIt
         cXsWNbSCtfdrEI3DbEetHm3yGRI4Zldhh4wpi2JAdV26D6Q6gKEBLAhYrCToRAu3MpeW
         9yHA==
X-Forwarded-Encrypted: i=1; AL+hErGSzjzwkgY5b+3qBUXpzyo7LPQoIJT3HZ1rZ5Dhmyhin8+N8cLrKCKuvPtCgzdo6QKaSca9Wjkgk+Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z8e4qq8dJ7azV08bXdLRi2KJlJv4VOr8hmNpf7DFse6yKGUQ611
	fMiwqWZX/b4+UrN4+gUeWPFBdJBaml5S3nPayqVYX4EKFTXnLbJlOH2woSW9CcWrv8r67wX5pA=
	=
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:49e:f4c:b427])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1863:b0:48d:ee35:b3fe
 with SMTP id ffacd0b85a97d-49c6d45308fmr26905295f8f.8.1794839248438; Mon, 16
 Nov 2026 06:27:28 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:32 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=4MxOZY/YO/IfVCPcb3Gx/rGT/ia9EZpFm+NWrw0PtxI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30NxgLubf0xQ07M/eeqe3zGcCp+jmF29ORL2NFuXwt
 i/67svfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbybR4jw/nQ2UEqc643yObG
 rA9QLvcJyRBNPt8bxfdWLcddfyXPZUaGNfL7Zygavslr9X+589e/CNN5vJ9VM3sTb22bPiPb6k0 RNwA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-30-ardb+git@google.com>
Subject: [PATCH v3 13/15] efi/libstub: arm64: Drop zboot code_size hack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that the code size can be obtained via the generic image_info
struct, there is no longer a need to inject it explicitly during the
build.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/Makefile               | 3 ---
 arch/arm64/kernel/image-vars.h         | 4 ----
 drivers/firmware/efi/libstub/arm64.c   | 4 +---
 drivers/firmware/efi/libstub/zboot.lds | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..509b59518818 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -51,7 +51,4 @@ EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
 EFI_ZBOOT_MACH_TYPE	:= ARM64
 EFI_ZBOOT_FORWARD_CFI	:= $(CONFIG_ARM64_BTI_KERNEL)
 
-EFI_ZBOOT_OBJCOPY_FLAGS	= --add-symbol zboot_code_size=0x$$( \
-				$(NM) vmlinux|grep _kernel_codesize|cut -d' ' -f1)
-
 include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 329d5e214b36..ca634cedcf63 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -140,10 +140,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index f8bb890b9631..8a051412814d 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -88,8 +88,6 @@ efi_status_t check_platform_features(void)
 #define DCTYPE	"cvau"
 #endif
 
-u32 __weak code_size;
-
 void efi_cache_sync_image(unsigned long image_base,
 			  unsigned long alloc_size)
 {
@@ -100,7 +98,7 @@ void efi_cache_sync_image(unsigned long image_base,
 	/* only perform the cache maintenance if needed for I/D coherency */
 	if (!(ctr & BIT(CTR_EL0_IDC_SHIFT))) {
 		unsigned long base = image_base;
-		unsigned long size = code_size;
+		unsigned long size = alloc_size;
 
 		do {
 			asm("dc " DCTYPE ", %0" :: "r"(base));
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index e1365907f805..e0f0bf005854 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -2,8 +2,6 @@
 
 ENTRY(__efistub_efi_zboot_header);
 
-PROVIDE(zboot_code_size = ABSOLUTE(0));
-
 SECTIONS
 {
 	.head : ALIGN(4096) {
@@ -22,8 +20,6 @@ SECTIONS
 		*(.rodata* .init.rodata* .srodata*)
 
 		. = ALIGN(4);
-		__efistub_code_size = .;
-		LONG(zboot_code_size);
 		__efistub_efistub_image_info_offset = .;
 		LONG(efistub_image_info_offset);
 
-- 
2.56.0.611.g1030f0b940-goog

