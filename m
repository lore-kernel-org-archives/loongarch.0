Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026135;
	b=BeiqU1uSrWjOIyzZkhZv2P6ZJGm4KjsedpCPd0B5ln9UdTCgeZiDoi2CUWYqXDbVbcnP
	 1I8zrWpvE9xPpBP0OIe9S43HXPvimVsbeI7NRrd4dgEMOwrwXrTGeMC0OX6zWgv9+JCU8
	 wZzalmWDA/JGM9zIHkwCl5htzpupaE1vtBenK7BMLh0hMeixW1OvkjZ0LWg3MViBfpyZk
	 TrEb8r4tka4QkMnkoNFEbHXqbIUXOIGP7cglP/yqiSV2pA6RnCPllNxYv8AolqgaYlJ7f
	 PCy4kvb0g8DfjWdGvdyhIh+yQaOsJ1eFhBTnDGubFDbNluzDCFDeTMIRB/vj64y1tIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6V1QA3P52x46nv3P41ByzMEuwbndT8/SrZmGlBnbrBs=;
	b=rLPefaQL05UeDCO/sNKwWxF4N1sI9eqEbvRNg6CEaxbu8KusOqq+b4XxDQ7FdT8scoiq
	 f8X4b7iDoaGgt6kD63/I4ItBBFfUR0PIbfhiv050Ks5Hj/WsXLVRNdhXhd2Y/ta6nqC/g
	 l7v+ohS8a3JqJCPvLCmqAoY+9z0/lUHJMmVuf7Sbi4jR8HIcrcY3WHL7JgFITV5PNZQmg
	 lwQWXqaRByumTrr0U5HwiYC7iQZAwri+bi6xLbrUiu8nAKPgVp9SbfUZq81n1vKr6otEG
	 CCTyeKBHHF9EN0rZFe/PsGOyOGoiZ3dnLxN7mKJAZm4k7brTeuKVG7Of/Q1vGFqPpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZYgaOdv4;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F39606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZYgaOdv4
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b87e864811so1373422a12.3
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026133; x=1795630933; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6V1QA3P52x46nv3P41ByzMEuwbndT8/SrZmGlBnbrBs=;
        b=ZYgaOdv4Z7hKJ88vmbrN7dD4msOA0o2fmjXrfVoj3P6CI7X4szLgYajyI+zCHHVrx2
         hlnNiBy/8DLArygBx6d4vJtZQDUMp5WWOjrhQSZenX0NLuQH7TiSLCKiM6JSHjuIOohi
         hjMoaZ8yREMN9GfDotb10ZKZPsRW3FCgFyMWE2QSNJJhGOJQrYfJwXQh1t5CaQCnhdrr
         AC6rQCD16b7flZwU0F+vPuYkXv8P3GmTIIWNsfShi+Hwf7jzOVKaK9RIWOPHbCOzzedD
         c6qsphqnG9dmUR+XMkhtBQWjtzHX0uBwhjvIx71I2keYPrFg+fYAUEQjE1Mzwm3lda0x
         ySOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026133; x=1795630933;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6V1QA3P52x46nv3P41ByzMEuwbndT8/SrZmGlBnbrBs=;
        b=Wqb6weGiCCOWtOMMihYI9f5e3I98GcGKb2LmaCytnTGlOMsjafCcmTmfe/oeSPTTVX
         eMczHBIldy2K7/Cgos7N0eJde+Lzl0IspPjsJ5T/9DX4uyB2ukUbD2DQAGFQScjqEPr7
         SLHBxaTkBkGaspjoPucFpQCRSxTYbHYKFcVgck2VxNG04wTRShF9dmBO8u/I+NAXwvDu
         ktGl9WlA5hxH32nXZllodN54YnH90utrcssDaA7YS0O+gWFY9SBCXFCZKzPJnn3PiDHy
         77lXmfLqGsugstCKBCkmJJnbpBEP6RESvBZna73lnqOQgnyK1u+avZaDUrUjDHvv+twO
         immw==
X-Forwarded-Encrypted: i=1; AL+hErHlhhE5N9OvgiJ5QwWIk9o+mDyAdIhqVVDUpX2xMpB1mpYASa8ug0WWJdKXm76AsoOgVs+1xErgZUA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pk8Z4wjSNpYP1Igd70quIL7BHNUSEwo6GAf3DustON6HJ8537
	MQcMygnAmZZMlx06KgzlpSJ/rhzSmPNd5QYrMiqBxKPJIrn1G1VURvtjoVnieNuR9HFygKFhSQ=
	=
X-Received: from edew2-n1.prod.google.com ([2002:a05:6402:a202:10b0:6b5:71b1:5396])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1f14:b0:6b5:8719:6d51
 with SMTP id 4fb4d7f45d1cf-6b887ebcae0mr3272336a12.32.1795026132980; Wed, 18
 Nov 2026 10:22:12 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:21 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3998; i=ardb@kernel.org;
 h=from:subject; bh=ScJHVhvjJW7cZodEmI3s6Cu3UVcx7Ou1mV7bexdNsCg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm+XHVDP+rDqpPevtwVUH9HN5H0z+4TiXyzef2ytjQ
 WGR+pnWjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARgTiG/26JnzVEZXSTBTIv
 WAWbGX+pc2v625DpGBy5NU8yO96ameGfAdeGb2bd6xq27tfckbBu19bz8pZxd/nDMva/DQ7bf/A kPwA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-36-ardb+git@google.com>
Subject: [PATCH v4 15/19] efi/libstub: Make efi_remap_image() return efi_status_t
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
index 4e6af37c4ecb..27b60ad81264 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1291,8 +1291,8 @@ struct efi_smbios_type4_record {
 const u8 *__efi_get_smbios_string(const struct efi_smbios_record *record,
 				  const u8 *offset);
 
-void efi_remap_image(unsigned long image_base, unsigned alloc_size,
-		     unsigned long code_size);
+efi_status_t efi_remap_image(unsigned long image_base, unsigned alloc_size,
+			     unsigned long code_size);
 efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 				       unsigned long *alloc_size,
 				       const struct efi_image_info **image_info,
-- 
2.56.1.708.g77570a6a1d-goog

