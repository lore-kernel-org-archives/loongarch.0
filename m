Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708232;
	b=fdeVGqSi8XANw81e3ubCL8sYhV5wl0KGES1MDTg4f3MJ9hJxH7nVQh9O0McRGj51ipMJ
	 FXOX1gSXViCJ38qyEJ504Ce+aRSgA7n8/EG7Nja9hkoUqoLFqnYfr04/8eyVDw4XuaGM/
	 VbJDOFEA6A5/a9KmzG2A3rr/32RhyHFgEWY6mnnl0ILw4j4yfkJOrIe5tg/3G+iWsfUvB
	 bjQkoil+H/gZWWPTpIbSlNcI60P6ZsZmKGGRuRna4GfXo/Rcn/rSfuvsMZiBDrxSy9FaU
	 HaJo28zLO8MaEMXTxHqp3W1MGWTDkJkvNV5eo4DH0H8/O3+m6WIXmKyvuoOycnJgS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=hNEp+EpSuoAWa2FOWz91EgctBS3DkBjcKeuPq9ixcGY=;
	b=uMLsnOaJBcExNryZAz/NtgR8pwwCGYGrR6b6flTBbHGLcfmdRPPbkiKfz6dToksiAQmR
	 J+UzdwFRsDyaxpLreGC+j6cpN864zasaIBl0dvX2x6+Mu+i7f2jLiaSJog8B1wh6xJnLf
	 jjz0flOc64sXKzQrYJ03BZRMaMxiUjiRlleeMi8QTMdBkuy6cue5NKfDfIYLpFJfsaNGt
	 AToVDxgpBDaHRbp5ZU1NJeFxbxCst5GzmtEgUxEObPf9/yEGlTnkWIbIy8jmMzo4p5QZB
	 jLWHWAkv26gS82QPZg7M7qzXyD4KKX3JBEtNNs9+welzoq7DkLR/XRgZ12WEwdMnQ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FP5G9FB6;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DF3606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 15:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FP5G9FB6
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50713860c0so604976166b.0
        for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 07:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795708230; x=1796313030; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNEp+EpSuoAWa2FOWz91EgctBS3DkBjcKeuPq9ixcGY=;
        b=FP5G9FB6kaZ1WR05/LGz9TbcfILvM4drHm8u/XgHF5cskdoQct/0vfQAO7Vke2OOWu
         GKJn98i29aqeFMPJqQtUAY6EWhMaL8M3aI5UhvpdhURmdZAmtGaRMzjYNfplarEur/Qh
         xJ1VPQonYULTJ1uDEPqVwolhYNslxs+v0E/9aG6VWEzrOVCF/Ts577VeRDMbFG5Kh8Ef
         87Vkx2cQ5DDyHuzpD3Gz7joPbJvJh/bqwgWr8fWkKt7IhjvxgRAwpgQ+6B8dzAl+/gIy
         wPItxxaz6INQd6KlGV79cUaZ7c15gn5gn1gOGf58IAyIBSCR3NANArblhkw1Ow1pzQdW
         P27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708230; x=1796313030;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNEp+EpSuoAWa2FOWz91EgctBS3DkBjcKeuPq9ixcGY=;
        b=CKuK/woP8grGamITC+JimeRAd0fsBK6qCgN1wqXKQkS4SN0ZcivQFXrzTHKHIRR9Es
         OuxXz2STOqHIAzQ5DGFonTlXcrKJ3ewQP9YurukJN6ojkYcP5Zs+XwzSlrj7uyFJ04MB
         2jFz3OauJdZuDC0QT2kSxwqXQDr3KsVh39GGPcZp9FHDvCxR/eJUBqld6Pf4uDgd4MK+
         gYRyV1tbUZ3r/bY5SM+FJ+plRiPDldhvUOUaMBQwzKw39pk8rqtDn9gGLBtm73cr1zeG
         L2mUsh27jCjrU+7Twzijz5RGyJjwE85FiuMwMY5XfDoeGUqJOVL+3crpD5SNbv22MRvw
         zxww==
X-Gm-Message-State: APuU4Z9Q8FJZs3lRIjZEXUD88gdBk2PwtJ4NSgkGJdsOGxJunYwWanhW
	X3ZloORFPQQDnA9p4r6fnN8v7ZmoV8X7n2YrpSyYBVB3z50ugZiOACeo9yXU4s9tlfWhQaohKw=
	=
X-Received: from edtp10.prod.google.com ([2002:aa7:cc8a:0:b0:6b7:f191:fc17])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3e88:b0:c26:1648:a06b
 with SMTP id a640c23a62f3a-c513aae0416mr1833079566b.38.1795708229939; Thu, 26
 Nov 2026 07:50:29 -0800 (PST)
Date: Thu, 26 Nov 2026 16:50:20 +0100
In-Reply-To: <20261126155017.2401147-5-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261126155017.2401147-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393; i=ardb@kernel.org;
 h=from:subject; bh=OyxyYmp5MYEMKS5makgvGF9LLz0+mYsT5yjjcBoZU4U=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsj1NZt/vriuO1yQe3ub23qv2nzxl8QPrryo61Ot67rR
 H37BO2OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJHPBxkZNos5T3t9eIZfx5rJ
 x3IvFS0WY+J4F6x1e/4n/Y2sb7T48xkZOlYVi4SWLq69HHz+ls2VVQEP9DdzByhv2vb4kPQ5Rm5 VNgA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126155017.2401147-7-ardb+git@google.com>
Subject: [PATCH 2/3] efi/zboot: Eliminate unused code from the zboot executable
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Wire up -ffunction-sections and --gc-sections so that unused functions
are dropped from the build. This saves some space, but more importantly,
will allow us to get rid of library routines that are never called
(64-bit shift on 32-bit, clz/ctz on RISC-V)

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/Makefile       | 2 ++
 drivers/firmware/efi/libstub/Makefile.zboot | 3 ++-
 drivers/firmware/efi/libstub/zboot.lds      | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index ba6c9e763862..20b5b77956d1 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -34,6 +34,8 @@ cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
 
+cflags-$(CONFIG_EFI_ZBOOT)	+= -ffunction-sections
+
 KBUILD_CFLAGS			:= $(subst $(CC_FLAGS_FTRACE),,$(cflags-y)) \
 				   -Os -DDISABLE_BRANCH_PROFILING \
 				   -include $(srctree)/include/linux/hidden.h \
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 52baacf3e9d9..3b827e4b571d 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -50,7 +50,8 @@ endif
 
 ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
 
-LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
+LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds \
+			   --gc-sections
 $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
 	$(call if_changed,ld)
 
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index a785c0123749..f3d4342c8a08 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -16,7 +16,7 @@ SECTIONS
 
 	.rodata : ALIGN(8) {
 		__efistub__gzdata_start = .;
-		*(.gzdata)
+		KEEP(*(.gzdata))
 		__efistub_payload_size = . - 4;
 		__efistub__gzdata_end = .;
 		*(.rodata* .init.rodata* .srodata*)
@@ -31,7 +31,7 @@ SECTIONS
 
         .sbat : ALIGN(4096) {
 		_sbat = .;
-		*(.sbat)
+		KEEP(*(.sbat))
 		_esbat = ALIGN(4096);
 		. = _esbat;
 	}
-- 
2.56.1.839.g22a8290db9-goog

