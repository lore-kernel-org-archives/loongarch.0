Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313072;
	b=5h7fHEwbNi13/M1dOLDn6Np4Y25u80BpzAfIt7OzqVcRZujWF0nkulaVkPnWOmCCT0OT
	 E4Jhi1+kWFBBWcfRBT3jF2nR2S1dikJGRpDoowqT34Rrs5CDvOgDuwCjUfDK5nFxn7/e4
	 M/RQTJlmjcDn+5TgIjbOOCoS+j+PAu3NYhFr96mcOagy81Gf585t/10nI4gfpemhMcBtI
	 v1XmW73VzKkn9TMlSMDrFN/k8ghhNj03QZ/rZz6E6e3qFbC2IPwI5+cqkXdWE40n0OqhD
	 1ykFGCKu//8vuYH5gWv7eyofOG1uSlPkKdTqdd7jTTuQPR6n+ORc5rPyPekJmpeZLOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=;
	b=Fr6Ka2tkb1nDvmxPagm4C+bS8LG/uUdBpZv++LXnje/U/2gQ+KbDeZciB6D21twfsdzT
	 beawzZ6QP+25r19KEdYByUs4fjJXeueAYRwoNDTRxBBdzEGKhgACdcnf4/xaNOHdv8E+c
	 +g4RuATMdCZzZnI/CuFoGSiaYact/xTCh8RyU2QZ6D8eeUX7/AmyK5t3GA6CN+lsQcrzP
	 Mp3Lz4VVQWM1fbpVFkAHeDNnO6MJUhQ2vZWKEbERGIsZlcjL7AX4gWvNf1e+q47L/HZ7k
	 SRWDo7Nsr/8+4uGaypVFBo5a6VQOeHaEkxhv0kNZyuslh/l5yRGpABVNveVBVk0aJqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MXneGRQ2;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFB606A321
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MXneGRQ2
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a17741243eso11417545e9.0
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313070; x=1794917870; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=;
        b=MXneGRQ2zVWUkXUdJ2EOBPeJlybZhnXt4oTnaS+CDBQLcaKLimdShkufKG5hTTdkA0
         rRlu4zBQKKsBnGMfPlLchOtqXpd8D3JJW2zCYQYzrFpTXpSD0Ov3Gya+/J6k9ZszE+7Y
         yp8KNH0sm3Ce3LW1cF2JRYaJwfkn2v2FuNP8znGGsPCi3UpjtudwJv5WSSTsCOr3JGyS
         mpK2/C0ZeEZ8lyZoRsnTgb+TJTytD0VGGSDVWeQN8u/DYk3DAuAec9CgxKKY8EzUKBly
         Q7kj1Gw0VLUWowtO4IzBes38POmegOmlaEQsnWi4s3kg/XIREntKgVjDO/vK7GqAgg5H
         1zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313070; x=1794917870;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NOGXHiMglGNlkAHWoIUlx58rvJ+/z9H2Q0oQTuWMl4=;
        b=rk7YhRazD/k7UhfPKMBa2qmGQ7DjWcPzS6gjH9uyZLvpR6o9fmEYd0+0DP/Y8aHcdH
         2T3tmV+kpYisz2GMwFCo967pudqrkFraPPQO4VilYMbRk5w5lzjNMW9sp3OSrlHSqISI
         5IDq4ski5AbEI4sNLVFogwY4mYUmyG0LlmUVltqayY+sjPE5WUgqV5enkhUrcmz+k3pH
         ENg1PMslvXSmyV7biMrVrQ/LJaODNXViRls4M+YJ9xFsAStLtU4m/+dmPzjeQGw6V8QX
         chFSgdDhuDG4v7CxlsPDNu34SgDmkbbBZR1w+zh86OAcpaPIWRCRZauGFRcJb9dFvX/9
         M+NQ==
X-Forwarded-Encrypted: i=1; AL+hErHySoeTzZ7sBHwBkvl2gMsQQUNO1st1wqvMJRwO65dy7ZrGPN6XyDOpRb8p9WsfCD9sR9R7qLhNbUw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NUbrU201OF4Hhcz0ImxjBKc61SB/PKB9tefhM46nZpXa0qntL
	ba7qg18FnQ2cwT7un2PSiTpWYk4JTX2W1CAlzRBVREmYslBUSZVeumIVnvd8e/kT4X6w6arfEA=
	=
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1392:b0:4a2:1e1:d55
 with SMTP id 5b1f17b1804b1-4ba02355ab0mr37537145e9.28.1794313070010; Tue, 10
 Nov 2026 04:17:50 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:41 +0100
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
Message-ID: <20261110121731.2728824-21-ardb+git@google.com>
Subject: [PATCH v2 09/10] efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c                 |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 --
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 --
 drivers/firmware/efi/libstub/zboot.c                 | 14 +++++++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index 62fc8e53c8a0..fdd48ba0f9f1 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -114,8 +114,6 @@ void efi_cache_sync_image(unsigned long image_base,
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-
-	efi_remap_image(image_base, alloc_size, code_size);
 }
 
 unsigned long __weak primary_entry_offset(void)
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
index c6071b0e8f1a..25ff5960771c 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -38,6 +38,17 @@ const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
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
@@ -105,7 +116,8 @@ efi_zboot_entry(efi_handle_t handle, efi_system_table_t *systab)
 		goto error;
 
 	auto image_info = zboot_get_image_info(image_base);
-	status = efi_stub_common(handle, image, image_base, cmdline_ptr,
+	status = efi_zboot_remap_image(image_info, image_base, alloc_size) ?:
+	         efi_stub_common(handle, image, image_base, cmdline_ptr,
 				 image_info);
 
 error:
-- 
2.56.0.542.g3ef89b7020-goog

