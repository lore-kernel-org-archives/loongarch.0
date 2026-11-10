Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313071;
	b=GriayHezFtdB4l4ZLwukSFc1ai7DKpgSaqdQ8AkTf+xwwYNgVxNafIBgbdLoGAOxIkk1
	 t4uPPZ6WUsAQaEzUirLx6XZAxo5Dg63S8Ctfe1MAY8QH+ZYcIRwaz8X5307zb0lpPzB5q
	 YlW+CLhcToYPQ5f3+vfLq4oexcHGiYGtG0mcZKlcLGtvfRLMIOzjWVM73RReUXeLpKJJm
	 PcM+dT4x+CnmB7YbpJoXxoEFvAESiLchPl8HrEc+ljWwWWCB6bme69qHF/lwD+loo9ZSD
	 5Vu6yPAXdcPVKMOBtMdbXthLM3fIpT1f7vIuPcDxtrTyY2gQOUmvTsIQnVYjIze6JRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XeENm8YGI/YCcxTaf8fM3RRrPARxs0Acfc/5LAWqFwc=;
	b=ITwajtxmvcY7+OUkNCbF5jr5/iTIdFxuKn++Suk9zdDIqgfeqXEYWepYlfDs+YnEQ+LC
	 HDwoKyYdNVYym8xNPKWJ4jWiLgRwXDuUisofyj9ufcPSeE65NLYyOgJdqVXj3n0aqkugU
	 2sY6Dgp2XLKQGH063x/nIIdX7OQ0fCzj3sRfWg7XWgSjGEo/cutSnoGUsWdicLcPZeLWV
	 6V/kaZVojN4kFsIzNNRfBKD5E8xIhyrZMVKx/ac2NUeJJnL0dir4YDlLmJSEuGq5AlPro
	 QKIAb6/kihjacKK1LAA4bYr3vF3bFc5yPZ8TzmHdT4EbQ6IK231GEVsZeoPUtww/DQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fiuXTFa/";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB03C606A31C
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB03C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fiuXTFa/
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a2065a2ef9so15415615e9.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313069; x=1794917869; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XeENm8YGI/YCcxTaf8fM3RRrPARxs0Acfc/5LAWqFwc=;
        b=fiuXTFa/lGRW9SUlOFHjnzRTlBt+pl3m6j+iJon5lmLaqQQKGXhGKAyf4b3DSayNNt
         YO+szxsfW0hRN2DUDtR4wxbTo3IGyCCd+a8X8T4GbPtMx+qT9vQ5Zm39BIWvskNyb0dd
         FBdcWvUmNva9k0luYHiKOvmT04qevIKPX+wfQAQ9z9vypoxOQHFT5N9LTtGMVpSNZL2F
         7rf8LACsoxAoCGRH7wVsi8oWi8Vcg/TQhHYotUROVMicYR2U4lWFSldhvK3wXv1NZ8c2
         GLoEOZzeV0XGvBhTAdl7ERM/R/03yfSBtqn5v+MFHUuhtqAJAxAbYUlFj3yCKzoJgyZg
         b+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313069; x=1794917869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeENm8YGI/YCcxTaf8fM3RRrPARxs0Acfc/5LAWqFwc=;
        b=RnOq/2L9D6z5+xI1cgHGsPAV8vY0OJPTfLGhLp8TEM51YbLuje6Tfn82ODp+2chnu+
         1VBj3sAw0bbLncWQdGddUHBj0a/y+kuiK4AJYHxEm1QYUmuZq6ZA7G8Lv9cS1fzxHn9T
         csITQgcAabudYOjkQ7z5hhu4z38CxyHVGgBLyVijdFAMY0WPkBnfwmEDYzEYidmWEo1I
         eJ5Ed6Q8xZ0yWLVJjc4mmAHF+RP9jyv5glZi9RRdLDyOjC9HeBlhWrtZT8jk/MjW3l0A
         THaiWiQEAIkDt+qO9fQo6Q7nAD296fmfhtVQR2Nt2HAlTNO0x7M+DH4aIMiNdhqiHsY8
         3u0w==
X-Forwarded-Encrypted: i=1; AL+hErEYSaWD3dmYyY+5c1cV2t+HKzkwT3KdwEPERExkDJ0oDqzzvfGSW5VggPkgBIq5qJnB+UTH9ZUyOsk=@lists.linux.dev
X-Gm-Message-State: APuU4Z84C3wA52b59yxsMdx8Li+6kCi4QItcpfBw8EqFzaEfqLQp4gwD
	UvaRA5q7ToSXtulDtcHaC9R7+qZvJMX5G4Y/NUdELjdqoRY3oBv2HD1veEf8F2fg1JgvJ4Iw1w=
	=
X-Received: from wmpj1.prod.google.com ([2002:a05:600c:4881:b0:4ae:2747:b6c5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b33:b0:4a4:4d57:8487
 with SMTP id 5b1f17b1804b1-4ba0233684bmr40944525e9.5.1794313068535; Tue, 10
 Nov 2026 04:17:48 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:40 +0100
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
Message-ID: <20261110121731.2728824-20-ardb+git@google.com>
Subject: [PATCH v2 08/10] efi/libstub: Make efi_remap_image() return efi_status_t
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

efi_remap_image() uses the EFI Memory Attributes Protocol to remap code
and data regions with the appropriate permissions. This could fail for a
variety of regions, all of which are currently ignored.

So relay the failure status code if any occur when invoking the
protocol. Locating the protocol itself is allowed to fail, as remapping
the image is likely unnecessary in the first place if the protocol does
not exist.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/efi-stub-helper.c | 15 ++++++++++-----
 drivers/firmware/efi/libstub/efistub.h         |  4 ++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index 8e43eb3f418b..e50deec99686 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -697,9 +697,11 @@ efi_status_t efi_wait_for_key(unsigned long usec, efi_input_key_t *key)
  * region of the loaded image read-only/executable, and the remainder
  * read-write/non-executable. The code region is assumed to start at the base
  * of the image, and will therefore cover the PE/COFF header as well.
+ *
+ * Return: EFI_SUCCESS on success, other EFI status codes on failure.
  */
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size)
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size)
 {
 	static efi_guid_t guid = EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID;
 	efi_memory_attribute_protocol_t *memattr;
@@ -710,10 +712,12 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	 * If the firmware implements the EFI_MEMORY_ATTRIBUTE_PROTOCOL, let's
 	 * invoke it to remap the text/rodata region of the decompressed image
 	 * as read-only and the data/bss region as non-executable.
+	 * Don't bother if the protocol does not exist: it means all memory is
+	 * read-write-exec anyway.
 	 */
 	status = efi_bs_call(locate_protocol, &guid, NULL, (void **)&memattr);
 	if (status != EFI_SUCCESS)
-		return;
+		return EFI_SUCCESS;
 
 	// Get the current attributes for the entire region
 	status = memattr->get_memory_attributes(memattr, image_base,
@@ -721,7 +725,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to retrieve memory attributes for image region: 0x%lx\n",
 			 status);
-		return;
+		return status;
 	}
 
 	// Mark the code region as read-only
@@ -729,7 +733,7 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 						EFI_MEMORY_RO);
 	if (status != EFI_SUCCESS) {
 		efi_warn("Failed to remap code region read-only\n");
-		return;
+		return status;
 	}
 
 	// If the entire region was already mapped as non-exec, clear the
@@ -749,4 +753,5 @@ void efi_remap_image(unsigned long image_base, unsigned alloc_size,
 		if (status != EFI_SUCCESS)
 			efi_warn("Failed to remap data region non-executable\n");
 	}
+	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index 394796472cc0..e2a9339f3e2c 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1283,8 +1283,8 @@ struct efi_smbios_type4_record {
 const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 				  const u8 *offset);
 
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size);
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *reserve_addr,
 				       unsigned long *reserve_size,
-- 
2.56.0.542.g3ef89b7020-goog

