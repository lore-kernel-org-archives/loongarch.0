Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688140;
	b=pkdovMaDIToy/Zf/5WYlZsYfmHrTjdQnbC4KmMCxgHdMxfI+4K7IEe23SSip1Ezh8CN1
	 EIQGWVkMpboffyeNlNRU1uJ0ayQvCDPeqgPj1A7EYSEUJAnfbet7nnAZZZ+AUukmoVpGG
	 Xg0n1RZU4ryvgUKRHKhXm02uFDUPgIkS2oyGVSb5HrKea9BZjClUMp/XQLVL6UdF0m2GO
	 7bsnvd0pB1mgTkh2KAT47hUkP5R7bAGcM0RKZEm6bz7RoLCWsibO8uiT9H4aZVFtTgqul
	 MzIRbYnBb7wdcxDIzxnFbxa1FwByqfp8X683Q7+fblaFDxdvsLeyDjFBCD4L0TC+pWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688140;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6VTmwgM3jPKMLJbdQSkA0PURopOAUivqXzDuEiYHuBc=;
	b=Ft/MQc6JvjtJa1dvQN5YRoh3LbNJSO4pxw39lRasfr7tkE/SDW8mB4VVDWDLdT1crXtb
	 gfYhO2gKGbGRFJuhZ3Nhmgv9YhUCMY9xI1RvPlH5veoq3wDLF7F3YfuPIyHgBI1PUQNDU
	 ommUCGdErSTkvTHm+7PJ5xPr4YOT5QIuVvxMtUiIK1kwk9Viiwxjwjil5vx2Ft9smKW7S
	 hU0rAPsdtfiz58l0246L7w8cmKHvTxvGNsuHBTRKET0b1fOLqAjp1hU/3/jI0agp+LGnJ
	 RwhNJFl0e6uCYNWqKdQmjkTDf7k1uZd/iq0AWkYRyKosOoQKNs1ltKkOLQblvQTQmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=St3o9qMW;
	arc=none smtp.remote-ip=93.77.172.68
Received: from forward104e.mail.yandex.net (forward104e.mail.yandex.net [93.77.172.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0A606A31E
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 10:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF0A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=St3o9qMW
Received: from mail-nwsmtp-smtp-production-main-65 (mail-nwsmtp-smtp-production-main-65.yp-c.yandex.net)
	by forward104e.mail.yandex.net (postfix) with ESMTPS id 31936C04DE;
	Thu, 26 Nov 2026 13:15:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-65 with ESMTPSA id LFfZVbOZPKo0-3Nht8b5V;
	Thu, 26 Nov 2026 13:15:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795688128; bh=6VTmwgM3jPKMLJbdQSkA0PURopOAUivqXzDuEiYHuBc=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=St3o9qMW7b6FGt3QVXZ+sR5crQHhMxjWWD8KpmP+YUgHArLoHAOSj8atGzyDYbGHK
	 DXlV9v7nq/Wd+BTGJ4AhuYJ+N2CU2kLvLX8+X5l6CpMcIkzwKI1c9TKqLHHxGG0SAc
	 igH0K59CQHb9qPK71TzLgvw8jAFFAe4z3FLlUVT8=
Authentication-Results: mail-nwsmtp-smtp-production-main-65; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] efi/libstub: fix building loongarch32 without zboot enabled
Date: Thu, 26 Nov 2026 13:14:52 +0300
Message-ID: <20261126101452.590895-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel test robot has reported the following error observed on loongarch:

loongarch64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L47':
__efistub_cmdline.c:(.init.text+0x258): undefined reference to `__efistub___ashldi3'
loongarch64-linux-ld: __efistub_cmdline.c:(.init.text+0x268): undefined reference to `__efistub___lshrdi3'

Since this happens with CONFIG_EFI_GENERIC_STUB enabled but
CONFIG_EFI_ZBOOT disabled, tweak loongarch32 build to hook
extra library objects on the former rather than latter. And
this quirk seems no longer neeeded on riscv32 because it has
architecture-specific implementations of ashldi3() and lsrdi3()
which are aliased to corresponding EFI stubs via
arch/riscv/kernel/image-vars.h.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/firmware/efi/libstub/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..77f0d3047b95 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -97,11 +97,11 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
 
-zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
-lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
+extra-loongarch-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
+extra-obj-$(CONFIG_LOONGARCH)	+= $(extra-loongarch-obj-y)
+lib-$(CONFIG_EFI_GENERIC_STUB)	+= $(extra-obj-y)
+
+lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
-- 
2.56.1

