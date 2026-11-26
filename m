Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696924;
	b=IsQVt6O5CRJoFVR6szUdkXWOweKga72Toyag8bzuZlzJxYqGafZlebF9JEvURNV6FXUH
	 eLdlNr03cdmoIi5rGTFubaTvahR6DdoXS1EBHjOnz1of9GtrxufePX2i+0e8dYdiTjMgY
	 EDoU1qZ5sNqpUKZUIjM9VCRMDXE4gnQi93TmfHp7a2BSdZXBXBnBs01Cg2OQxlxKsInKT
	 Nk4F2eScOH8/k7JlPR3AH1fp/+U0R5vc3+zIKwf4IXX6C/sYauCJDg+gW+W5ZMBBnhEsQ
	 LqxUJQM4HhKTv+FIuxQZlooWfHBFhbR8uS+LrCzhI2pIidPjSIFhr7uG53BOSvyDlDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696924;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JneyGuy1qh+xtE++6pF4sbi6Wsm8hasIC9ikeIhpHCU=;
	b=E6ohXlkLSX4Z3973CoPQIJ0fqE00derVs5/5lYSCLTxTs0NwmBnGonPOOZmSIR4lGFiz
	 oCZ9h/EBR5e4IhcR/9posswm5SCnQrSR9X841suahs+nc72s6gqecF+pKS9+tbyjDdvfl
	 0wdqqZgcAzV10iMeVgrO21s5Iox0tOlDZsS7fvTkGiNxU9/cj2YtVMWvqR2E9UQ67Umwy
	 MCwvbS8icuEk2ZFEj++4v9ZSZ6e/3V89fD6U+mymfjIt6iWvAAzda5l/glFTVXSLy63TT
	 GO3/ZCQkYDAYinOSpQa3BgvR3JDoNESE/ESkzaP/3DVqt+R8cKdZN7u6m01O92DUZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=CH6+PKjZ;
	arc=none smtp.remote-ip=51.250.60.162
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [51.250.60.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2032606A327
	for <loongarch@lists.linux.dev>; Thu, 26 Nov 2026 12:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2032606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=CH6+PKjZ
Received: from mail-nwsmtp-smtp-production-main-58 (mail-nwsmtp-smtp-production-main-58.yp-c.yandex.net)
	by forward102d.mail.yandex.net (postfix) with ESMTPS id F05BCC03AD;
	Thu, 26 Nov 2026 15:41:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58 with ESMTPSA id lfhVEFQXeCg0-BoDN5UTt;
	Thu, 26 Nov 2026 15:41:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1795696912; bh=JneyGuy1qh+xtE++6pF4sbi6Wsm8hasIC9ikeIhpHCU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=CH6+PKjZQzevZN+sT1po4LCM4WeGWy9GVETvf1uN1vvwewh+sfrRF5ehqeITcaM8A
	 i+bQzHZjiIBf44Hebnr43VoiX3iQOE8+p45UGouX6JGhJRNDz43SWbLs2iaFl7QqyE
	 NMZSUr4ZQPNZc+JkS42EmYB+jxb6X08RBWOmrMRw=
Authentication-Results: mail-nwsmtp-smtp-production-main-58; dkim=pass header.i=@yandex.ru
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
Subject: [PATCH v2] efi/libstub: fix building loongarch32 without zboot enabled
Date: Thu, 26 Nov 2026 15:41:45 +0300
Message-ID: <20261126124145.876953-1-dmantipov@yandex.ru>
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

Following the approach introduced in commit a354b8de9ad6
("riscv: add platform-specific double word shifts for riscv32"),
define EFI stub aliases for __ashldi3() and __lshrdi3() for
loongarch32 as well, thus making the related EFI stub's Makefile
quirks redundant.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261122125352.gAcg5yLx-lkp@intel.com/
Fixes: 442082297e3d ("riscv: fix building compressed EFI image")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: define relevant EFI stubs in image-vars.h (Ard) 
---
 arch/loongarch/kernel/image-vars.h    | 2 ++
 drivers/firmware/efi/libstub/Makefile | 7 +------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/loongarch/kernel/image-vars.h b/arch/loongarch/kernel/image-vars.h
index e557ebd46c2b..19202f4f84c2 100644
--- a/arch/loongarch/kernel/image-vars.h
+++ b/arch/loongarch/kernel/image-vars.h
@@ -8,6 +8,8 @@
 #ifdef CONFIG_EFI_STUB
 
 __efistub_strcmp		= strcmp;
+__efistub___lshrdi3		= __lshrdi3;
+__efistub___ashldi3		= __ashldi3;
 __efistub_kernel_entry		= kernel_entry;
 __efistub_kernel_asize		= kernel_asize;
 __efistub_kernel_fsize		= kernel_fsize;
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..bcf2a5981678 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -96,12 +96,7 @@ zboot-obj-y			:= zboot-decompress-gzip.o
 CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
-
-zboot-riscv-obj-$(CONFIG_32BIT)	:= lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)
-zboot-loongarch-obj-$(CONFIG_32BIT) := lib-ashldi3.o lib-lshrdi3.o
-zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o $(zboot-loongarch-obj-y)
-lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
+lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o
 
 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
 
-- 
2.56.1

