Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026137;
	b=J671XYVSsPICKXhp6KoAhfpCaCA8Vvj5dFIuOsqq0ocjaGnk5qdaRuLDji+wTvJn2IYz
	 loaEE/7FlPsk4zhxptC8NVRg44pwWU2MUj+DSfOePC9lcJWAdY7tguwOLkdtrtD9TwCwX
	 3JRBx65DFuoKm+dBoH1hlZQYUgB7C0Tx9cOKaDJZYbWZ00NHLpcG7q6O9PCCQcdw8R9ce
	 kBux1x4DOwzAhzMZHTRo8V299zgIAnljoWw020Am6j3xPFpLl+j0gJopZ3HD0YnIhqsw7
	 3Dya9v7h5LabmOp3Cjnt53SsShgpRaQssbL6Qtk4YN051FwkZgV7tgtbnFQStx8/mmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
	b=g+JYD7f/Xq7SmMH/kWSFPkZy0YHaiBfOSa3sE0pnrsSIDIbHSvGMXcbqbBd8150Fi4LC
	 vYZxtrbDiQQKqWLkkkmRn+yvf/3fzNw6C9UzvGx2vRlDAXEyQN4SZ2I7boCkJGA+z2I33
	 Xyq8Z88WMZmdi1xSHasaRHYzBrMH5QKj4lp+MfN7qIxVR62swIRv0Q0MYEYKpn5Ctulq7
	 isALdjyGJ93PlWSPRoEILQ6V716m8VbxRfsz117KlhSga0mlu6yTDfcplq1BuJHnDPX1d
	 OGBLzA7WJ1bT1wMMmWw4C9mYCROe1nmnRYzE8/J/cg4oeeoVtFJwU7ySbdlpweHihoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OKW8IlPQ;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42A606A332
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D42A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OKW8IlPQ
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so1292559f8f.3
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026134; x=1795630934; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=OKW8IlPQ+8vCn5qLOjhiAS4uOBrwRP2MmDMwABTzdjtRvObHhBGfudI/UaH9DqGXHe
         ceW4cL5h1EMMRuGpZiOVU5YOHY633yKuiAJ7TkPdm1pCKrogEf9HbxNVw9L+yL5HIGT9
         yNmt53QNUol7MMDVBMgtUFJz7fGtHQlMX2wkFEbUDYgogReV2+R10xEtWJoNkwlrg6ai
         uGxMmiGP2ltCWmA0P8dPB5EPNj41uQnvNTQyQnq4b3NRR9w9rD6/qzVLpzivFRaIY1PY
         JLua9orHdw7M8zMZWdtzyG+pmtFaTyvv999EXXlK8fHuw1+iLr06r9Dx6/nlUX059cuv
         d5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026134; x=1795630934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbvVNrqGe63WaCDhQx3Sv7CZ2HUvzt7iMpy1FWtb+xE=;
        b=f7xYVzhuY0vRRlqSCj9+d6QvVMXKYkxl2qlSfYzXC8/ZXxP6A0+dNRUmvkRGWzz79P
         8F3b9tdZ4lWqLnBrmNydzDHkL2cBMDWIOAIFeSUkFt2OHcaFSTi6Lr9P303NXIbpP4e3
         NsnpuI1TQgVk/DUP8TgHBfQGK3bCVE4HWJrmDh/I5bVihbJm6jimF6G5jXPvfYBfaqvK
         BLmzgn8X0M87qf1TXn7xGK9iAD2+SKk8qiypwGdDIR5oGjDBhkgc22of69eJD3INTkZv
         3DRPHe0gn4Edv9cUyrVdn52xajWiA687zZI1KnmvzWWP/3IpwkcIlXJiKzbwftWEU0J2
         Y66Q==
X-Forwarded-Encrypted: i=1; AL+hErGkXmdBFgnqyg/X2E1vcsNDrXwU5UuM7TmF2akZYJNApPyQeBFQUg8g4DRWk6Je52BWSGbcOf4l9fU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9qo4RBV+uyBLcj6BMjIcEbpZ1kNLmxgtjiE3Bgm3RmL1gO3pYI
	A6dGYzc5vUevXWH4904hhH2FY+ahQTotEDfMhcai7jEQeSbOLOLl9dDwS/2IjSQR4x7xuHPGLw=
	=
X-Received: from wmcq6.prod.google.com ([2002:a05:600c:c106:b0:4a1:b721:2a42])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a55:b0:4b1:2026:6b41
 with SMTP id 5b1f17b1804b1-4bb7da2bd37mr65014595e9.30.1795026134131; Wed, 18
 Nov 2026 10:22:14 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:22 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ardb@kernel.org;
 h=from:subject; bh=JdUM/iQUeD0oJbWCV6TTeOpr5VeNWaZWfcnI9fEnIyM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmxVzhTeaiPgdOv59tuORKzfu67fZ8M+NyVqZmvl2/
 pKvPjJqHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiNlwM/1Mt+iTFuloPxcy6
 5OZ/+M3kr+/VedYcu87aXuZXUfdcxISR4S3DKTM1X/aMueVnPD/f6Joxs3mJt/nLR5sn3pZ2avr JzgIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-37-ardb+git@google.com>
Subject: [PATCH v4 16/19] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Refactor efi_cache_sync_image() so that it is not in charge of calling
efi_remap_image(), which is really the wrong way around.

Instead, call efi_remap_image() from the primary zboot procedure, where
it is more straight-forward to obtain the code size from the loaded
image.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c                 |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 --
 drivers/firmware/efi/libstub/zboot.c                 | 14 +++++++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e892302f4189..f8bb890b9631 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -113,8 +113,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 void __noreturn efi_enter_kernel(const struct efi_image_info *image_info,
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
index e97a7e9d3c98..79cf8c48b033 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-gzip.c
@@ -62,7 +62,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
index bde9d94dd2e3..dd7f11238154 100644
--- a/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
+++ b/drivers/firmware/efi/libstub/zboot-decompress-zstd.c
@@ -43,7 +43,5 @@ efi_status_t efi_zboot_decompress(u8 *out, unsigned long outlen)
 		return EFI_LOAD_ERROR;
 	}
 
-	efi_cache_sync_image((unsigned long)out, outlen);
-
 	return EFI_SUCCESS;
 }
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4cff756902ad..9c7de225b39e 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -40,6 +40,17 @@ const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
 	return (void *)image_base + efistub_image_info_offset;
 }
 
+static efi_status_t efi_zboot_remap_image(const struct efi_image_info *image_info,
+					  unsigned long image_base,
+					  unsigned long image_size)
+{
+	unsigned long code_size = efistub_kernel_codesize(image_info);
+
+	efi_cache_sync_image(image_base, code_size);
+
+	return efi_remap_image(image_base, image_size, code_size);
+}
+
 asmlinkage efi_status_t __efiapi
 efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 {
@@ -107,7 +118,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+		 efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 error:
 	efi_free(alloc_size, image_base);
-- 
2.56.1.708.g77570a6a1d-goog

