Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839249;
	b=C8vOOFyIQd03pk+glAgNgN3f/uIOO2eR2HRZ6F3pF7kzPq1cyTkIiaSBVU0BEH7Fkj0f
	 6Qo0r40+a8SZbu8SJiWKWKBz6NtFIqucim+yckMKWGHSEApkXuIxFIVYBG7wY8EUpKoDB
	 cZdpUJVYgA5UOLe42LB7D89DcYQWcYxs0Q2oAL3OmH4GYXj+ZDXlChLUYHgC2y4nXqFIr
	 KPv4J5BbeTwW7E67B7+XuwZjTnCqKs7foLGxDbrRo+z+b7M4M9NX9sgEV3IlDWESb5l/R
	 Gub1VgeismRwNlLFhXp9kqaa4VBX2r3Pj+Ar4E3Hr9XcRLGXz6nBdGIYc+RMezn/rCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=;
	b=DVZFxFa4oPmcScw9gee3Z64RUMRUYWGcczJrNmGpqyprV7c8Z3Q57xn6146JND9Qg3tE
	 evSnsEXXOIC0cQvHzZQ2ZfKHVZ7nX7BXa85SjHxO+/eWHO61DgJRQOa/0FVxgFSD3yUUZ
	 ac8VL/VCHT8/U1Z3GgpVhnd72CcRSgHudm9hzWqTKW/1uL0c4/JvKpjY1N3LyZ4nINGE9
	 hVHgOTi2nbwui3SyCPsCsAimxAKX89XYWvSHBKqxxcYHbV9NFjYNYnQpLJ9vVp9dHgppM
	 29V4DvTUh4j6mcquZ2l3FZ2x8IpD+6c6WrBm5iWk4Bul5NQ9EOIkNKGsUX46v84pi9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LbMlJ4k5;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A74606A32C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A74606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LbMlJ4k5
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso16521945e9.1
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839247; x=1795444047; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=;
        b=LbMlJ4k5LT/I5BlyV1uoYuztDBrg0CO/DnPXaCALgkXTWrkXNiBI973YGYTJrNi9Ex
         28xWbbZVyikF8GTVaYJD5JfL5nJ04SgpkTc94QJ3GzbKHWxEi2Eo5NOGarMOsWkYcQgS
         UCWcuFpEHiWxgk25WoG336gHcknDZuyPq58U341gaeT02BwPGhQw0wVeZDZxiVqd9oOR
         s7F7Kja+xscJgVAPQ5YCv6QpTZ23+kuXn4eyjSnFc7LkMmcQYgrYmeU1D7xD4OWf62ha
         VlhiKPKrCk7Kfi+GjJhrWVUxbSgygschOg405PjR/W9wKPSz1/JYIlNXtULyAHnthLRE
         6/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839247; x=1795444047;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n6m3/52gay8f6Ej6cOhY6hNu8E9Pz3qti51eQ1NNTQ=;
        b=MYsPfG9XH38D9xTbRCAS16j6CKYrw52rY86sXRG959B9DTV1bwaUIAft562O1DomXQ
         HwZR6xb8ctHiudkOUeD5t81+gMg7nPv7lvE2s9+aFYTcgCo4EjCalI7cj5XYrRQhIdRk
         N9wnJu4RvlbeRU9jgM/GGmU9Qza5T6X6DIsQD+5hBOTEShy2Kpyyp9e1356YbY34t9VT
         2Jdkpf2JXNyhy0l9Z/I/hdW0R/ytp3Sj7tJM7OpSMao9qHmzICnyTGPcQ0rJBnnPLU8c
         6Ct+l6eB6f1c9hqIUOdxwykdrsyecO9LyG38wkOBFxPHleG10TzHf0UyclcBHgvcYm+r
         hmKA==
X-Forwarded-Encrypted: i=1; AL+hErHs2MLOYIVzX9fENeweAssHE5Ymy7W0Yf7mbEOuuz5cKskpRVOLWPTNdzm+wqKABSFyw8wrYIEgENA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/AXhv33vjAbx4Teq/+7vLb05hnsEIhMsawdiG3wzLpOb3mxNzc
	b0Yfmx6R3TVX0Ym00obgFNCAaIEjVEQqWpw30Otgeczl211C24MtDkfZ0pSdiOwMP7NoLGlXuA=
	=
X-Received: from wmbh17.prod.google.com ([2002:a05:600c:a111:b0:4a1:e44e:ffd0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1daa:b0:4a2:59:f568
 with SMTP id 5b1f17b1804b1-4bb55a481ccmr219045695e9.14.1794839247128; Mon, 16
 Nov 2026 06:27:27 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:31 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=ardb@kernel.org;
 h=from:subject; bh=QYWgT8z+L2wxd3Su7/3zae0d2A2rWFJt5EArtqIjNsc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30Jye2Nizu51WtW9hsrE+dFh033rbbWcDfH+5ebw0m
 /Rta9m9jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRS/MY/jvO3iD6djGz4BvV
 2LrozT0fqyuDj7NyHJj14vqh8nlTF3YzMvyt2qy7QXBh+O6ensTDtfeDZ6z92X/cXt1489atzIt DS/kA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-29-ardb+git@google.com>
Subject: [PATCH v3 12/15] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
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
2.56.0.611.g1030f0b940-goog

