Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026138;
	b=17vLuzZVqIyv+Jf3HnjSJsjR0DM73iPaf/hdEPKg85eebgsz172uomgAMna40vaF+Xjy
	 2apRCbhMGYJUWyAgDRWMDLD/5pXlPARbdz1ffn3vZ1zz9mJFoSA8FX+tSXjkf5oKzra6K
	 9a8En1ypKbVhhlhwuGXFFhBkW/klrHe/dlsieVuzVH1ydqyNg9Fub/rXUNCK14PQHVtKD
	 jZseDL8x8yzL28l4LwkHyU7LcUehNLz+kj05pS8/8R7CLrp8BqOLTNlBoeI67GpXY2Bqy
	 cOIZnhNH3WwI7OIbiTqcbbg5prb1Clo4+DoFIRJQUWPgWusVin/iwD3pihTJ1Oitzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
	b=uYG6O/5PTpMbmKX0WSXj9Z9gIwyiijxd//lIdoDfO06/FcltwGpZAedXKII88iGLw5gd
	 4czKHL7xUzRKptFERBHrQC+IIdHlZUOLddOCvjYmSe2kyYheZNqb4SH+0mU/cPe1e+8Xp
	 RvoYn/qTE/ICiBSRnsjxaJveMO4afNILwR+WrMRrW7E5qXog3kN8QleU+6FBSTUPEiNsz
	 AeK48x083M+K4rxbD9dqteChHZqPnTBQtsMcIHPoOZ4ghr1o5OYOxobbVIhktHQTl7qCD
	 WIAZtczJ/VVr1Uz+jCzO6M747R+yDEMoTho4cFKRY7fyoxW1ksg+HKYz98Peku5nl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NS2tAdEI;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F11606A330
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F11606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NS2tAdEI
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso10331785e9.1
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026136; x=1795630936; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=NS2tAdEIV7t46kjZtLzlnpCIPS8RGpSoqFiPYiexCyTk1NgW9zhXwTdsRDdHZCuvva
         3SEbFYVkeUG1/zgqzMfcSAwgdUIO22bFnQi+6OskeMLlwOIKhcjmyr07/W9FaXaaOj0C
         3Gwt1VoEDWlalgQbPSstrnimOgCCdKHJ0mDloX0OtFGTfvqPeV1jqSDFY40OCjOzwi8D
         PeYHs/ZHECRFaXF6Ue8BVmLGUuDkFWJFMYZoBguu/pcbKoLLC3KzRwak09FjxAeOF8dI
         R75+jjMlv2qQwnsQVj9t+wUOZ17lfzrod2ZAymNZgAuw0c54+APKP64hgJtQtrbqzXtF
         H80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026136; x=1795630936;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sF7COacRN1vGXnrZrNazsi2/3EiiL8z1PsIPlc+wKk=;
        b=uYTKWs5k4yCTIrgJGzWzYSp9KQKXNchro/35wu9Q8lFT+zMLW56SUsL0Jj/2jI3eH+
         aH/w+LyVs6qVGf2jXf3R4WAxd+J7UC0QwUU76RzY+SVzAzsS6C0CTJIOvPDk3wFuxCG+
         9be96q2atmVtowWNXyqeIA5sTA/1AppaX92pmF9CIkTt5xgDwrIV3ZNLBOXIBDH3aIU8
         0f91nhIEyyPVFT7x0ih+HtBfRl41rVIYibeno1Y3hZap2We5l2tdy8x1zOzSmRyUWjdH
         N1SffT0gozwIzLCIMUg0aBdmrnKPWZPNu0mh1NOtN/KStjg++j2dQnLY44NAW0vUfJtI
         N2CA==
X-Forwarded-Encrypted: i=1; AL+hErGpmMPjx5az95Hew0meGRkOgOJbPS8GV9BJLSVStUY9/wxnNDDIu/60S3Ry74mDLmv9+wnlxHiOcYs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9sov0WVw34Xi6trQU7mLyBYOqOVCgZTcZ04fB6ImXFmDiJoJ8I
	ObmIr9IX48pZzit8MElQz+xHT8JF6AuktACDjwIFP4WEbMDObU8JZpjHH1kJupsP9J4EHlhVnw=
	=
X-Received: from wmxt15-n1.prod.google.com ([2002:a05:600d:864f:10b0:4bb:609a:3944])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3555:b0:4a2:150f:1601
 with SMTP id 5b1f17b1804b1-4bb7da2be68mr70517655e9.12.1795026136002; Wed, 18
 Nov 2026 10:22:16 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:23 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2989; i=ardb@kernel.org;
 h=from:subject; bh=mMy4EOR4GKL669ZECvINo54lmzHNhYmaQBvXpm8/VGc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm1UmrxnyoqPFFE209K4fZTWeG7MtSqmC6ROf9YfZl
 Xe15KQ6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETm9jAyzGPUu7r22ayNLf+V
 bb67davLvrqTphuU2Hpe0f73hFcrQxn+iosLFkU+ZtZgvOfNbiglFLlGbcbVis8FQhy1+U/E05d wAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-38-ardb+git@google.com>
Subject: [PATCH v4 17/19] efi/libstub: arm64: Drop zboot code_size hack
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
2.56.1.708.g77570a6a1d-goog

