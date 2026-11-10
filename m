Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313073;
	b=rMTOyMjJ74FUw+0RzAM29t06hsPr7kz2R3wHSWzwrSgQ9UCAPwVuARzHfm8+n3hvOh32
	 rOpz/BvDQyo6Qv/KTRVSkE+1o5d1jX8lCzsXJsLZrnIbPDJxqggFMYg1q+dVjA36x8Ktt
	 IMSPyfCswZq0TcMN5jw/O+/99SYZill0d950XvnmYmDoc3nSGnQNaF9RCwulM4MApjYLL
	 SIT1ovvXVknFke99/46DudULuhxeg/U5GMheo0Jvk6hB2Mdps+BrB64a7tBwxXC39YoAJ
	 Y0H62Xxb4N8CwaD0sWEzQgRVegjElBMKv0QYF1+I6e88ICSMaOLbo3D24EnrHi/Bkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HdvBqOsbdSb+5XW1VvJy1N+JD/q5Zf64Jcn34ls18MA=;
	b=yZukyG4DBWdCKfQf3jZFBX7nRqeRIHYy/JjgJsbpoLlP72KlbXzzN+o+CKXnaiDpVaY7
	 NTzIwmJciCu7bPIq7EALXuu6b6P+zcLgI0C2UGcvPkBzMJUQwTglL2LwfxlxgwWuJyuh2
	 U9dnVUNEkwTfBeW/sUYlOmjRt4jsuafQ/9+ag19H8m6ICy3ZcxPIUpSaHeLDx5uTx+hTn
	 FY72PJxhyeLoqffC82U25QjYBAhdMRs09NDuEIZP3bxQFr6gmYQ5FzXYXFhm0bIpNQ7EC
	 Owolwc3ukRCJ+bi23jZ9K7xxMQnYbiaYcKctLIAj7rp9oIiSkMI6zbZGq/jvShMXiWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i62SMoQ8;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F72606A325
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F72606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i62SMoQ8
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-492e3189fc9so1499299f8f.1
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313071; x=1794917871; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdvBqOsbdSb+5XW1VvJy1N+JD/q5Zf64Jcn34ls18MA=;
        b=i62SMoQ8gefICkqhQ7E5NxNTed0yKM5vJgzvbdP7VYXSekxbdwjJhgNiNFogJInR+i
         vf6QCsNOSnYpAwh6qVsgCJEqE0GldPl0OyDaDcrTSyvlCNMh3npq5Q5ChoAtjvKkIgjf
         kcedYkbqq89wszS3bNX+PV2B2+BwFiltm2+lW37HeU9KjOtoICvd7XQC5eWnSYuUkQCa
         qEWv6i12z/Xy+V+tMf7ZoMrBWJhKjPW68dHQj9H6WU1m+K2ZBhnybSuK5iUfHDWjzexL
         pSflwuateaX674UPyoMQqdYnNacUEzEz/uajGrFjDtjyx3Zi9fNRkiQAVUI8zbVTYl8Z
         wjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313071; x=1794917871;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdvBqOsbdSb+5XW1VvJy1N+JD/q5Zf64Jcn34ls18MA=;
        b=o7m0/VyZww62nw9daNl27wHd1UIkZBtOzwdbYGkxvSE5NPgJFkYrczPVbFtSJNvGOK
         8Q16BKdQDBgFQ7fNoPWruL1aUP+veYMCNMovJHhwg3xfl/R/e3oABA2ETS+x1FylYqHu
         kp9oM1xPeADvEKjOpTt83kxumMW7czJTmMDFiAICEV44UuVdGZPjuXZAt7tdJrHWoRXs
         NofPjZDZ+NlhPDZaCvkeQrGRgX7qCBMePoAm/yNA+K2b6+5xER/pxH6ah2wI0s6aJzOO
         Ri6NhbhybuRL0Iu/AAZnElCS9MxsZNJ1wGz9mXWfUmmRIadqHtLboeCULd/c52ICvLZw
         5Eyw==
X-Forwarded-Encrypted: i=1; AL+hErHmSU1VGPiztAEj3cJr4S23xSgMSFuZUtgt27/4Xdd3uqg14RQOPFA2Ez/5+JwTGbRsyV5JyQxPk90=@lists.linux.dev
X-Gm-Message-State: APuU4Z+mtMpt2MNUxN8fiq/iDM0i8deRrbjP5KliEpXubXohSieK3wqw
	orLmFumGfFfbXMi0HZx/snJc6dinXZSZ44MlgLRvOI1vAaJ7cxZFDFsu0xUxWzlKbbZgBhm2gg=
	=
X-Received: from wrso6.prod.google.com ([2002:a5d:4746:0:b0:497:913:6e4b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:468b:b0:48f:e879:5890
 with SMTP id ffacd0b85a97d-4982fc49566mr3226218f8f.32.1794313071241; Tue, 10
 Nov 2026 04:17:51 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:42 +0100
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
Message-ID: <20261110121731.2728824-22-ardb+git@google.com>
Subject: [PATCH v2 10/10] efi/libstub: arm64: Drop zboot code_size hack
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
index 9ab71d103f64..22b242a7a21b 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -144,10 +144,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index fdd48ba0f9f1..4399b23fa237 100644
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
2.56.0.542.g3ef89b7020-goog

