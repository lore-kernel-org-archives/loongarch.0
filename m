Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839248;
	b=TRrGtZongqulBP1fasEyq2Kr2mbSto8GytF5gsrL/565awHoRnNCZkbQkROQL36styou
	 bNnDJME61Gf2IapXRk+3x6YyNAiXyURW8P9ffmieHZnd7GWeX7z1fYpbi0fZqB9qh8yb2
	 1uWUi14+a4yI3Y838jwqIn9oT6MrI5G23UD3yu6B7HXJ4q695ONtblVb24zp2eH3aVfzP
	 M6Zi5m8XMz0tLi95SFdpFF5AKJsbexsBsgQiw9q7IXhYLOAlSmAeP+eRA1TIJWjbTa6LR
	 haB86X4dSJ6dankJY88I2YItuCwnM227C/Q5zHrRCopvMdMPZi8KxbN1fhkhznrxUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cV64o3SIMgxbdBJ/g1LGVun+1S1o6sl5wdO0gO6pEOs=;
	b=S767OfGloVyl2Yg8BtfPFcBOXCXidb/W0ZLqtj/pjRXoNRulprvf/ACwWSocrxTFgr4c
	 HbAE6WpaVDQW0gwYxTBF9kYLZ0GJDC37KWLDqEyVh4xWoVkdQphx/tr1QP6o2jdzLxT4m
	 hY/FphAwefy0Gt/mgvJ8GRhlmogoSITLXKXx3achYWlXIMV3GssvARxdG65J9ipyD7PAV
	 aRillutFB1/ad5CCeY5Ezx+3EbBAfoMq8HufIpU1OQJBzGqGG8c7fyc+nMBj8rAQcXxF8
	 WTddsDdLjK0rMDWV/yLc51ei3LjhwybYYV+4pnUngNTC4LJeQBpMDXJFcFIgG9aEJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IXCaNETT;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA4D606A332
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA4D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IXCaNETT
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso10959345e9.3
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839246; x=1795444046; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cV64o3SIMgxbdBJ/g1LGVun+1S1o6sl5wdO0gO6pEOs=;
        b=IXCaNETTsR5dCTIwm29m9CKtzFoXEJ/Mj6g8Y+pevq0ouisNOBTPvjTtP32n96ZHWt
         n+g2BFUO++dEuWH9pbwZJk4kabGW7kTOMVLh3mxaTb9qPoCxgGLuaZuoxbQue3qZFo+Q
         CM0WylhX4Le7ZvBc6bfkmSzllfZly5nRtKcYPAde7N4o90pyfiLyZ/R025nUOYmxCdBD
         bXzmU7SzBuys4DSdWjE5rQ1SVetIV8NXVNuG0D2JsirzxL2slr0s9luvhnuiVfg0Yaw2
         W+MFZL/tSb0INQ1ZhtqArfIbBAB6k0vxDpXhLKPBbyuQTeTo0QiF/FgVVVFua223kpMX
         ftmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839246; x=1795444046;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cV64o3SIMgxbdBJ/g1LGVun+1S1o6sl5wdO0gO6pEOs=;
        b=Ex/CjoBGX43IPmUJwaYl5gdxphDwhsyj44BdAHhccFVdeNKSGIHhIDn0pQjk/lPhDX
         AqF3mw0Jhqa9E5UNe1UfGM10did7q/+gvYhC7vmAL1MVgkguECW/PfAUE+W477eZKnLl
         khR/v9YhOmq+IoEJNOHBlcCmZMWT0g7BipFLpl/aH3v7rSfG8Y2bHYLFmgzGEqJdzjs+
         MPlIVKb03H+cEDUVuB3CbFNk1oAnRkc6fa9OTlrQDPnymhubMlepyuBERrZHPXjcGhbd
         zjod7NJX/Jopad0G3X1+cxTXGJ1vBTJ8Xmeob8DV5eWpowlyF2gu/EKxo9kDyOWc6l8m
         +M6g==
X-Forwarded-Encrypted: i=1; AL+hErGwf6HHBldDuIyxVuQRIai8W+cq7U04QWIAdyulXfY9/EsnF8SNewOsG/u5hUEiA8WcFIdqLPxl/58=@lists.linux.dev
X-Gm-Message-State: APuU4Z+EpYvpqgAv9X+sRMn9v6zY+oBoY4LQ+gLrdqaSPoXuH7fkDbmI
	duwdhXuiCo0TdLd0+Ig+FfI7h6D7LzOqXjoAv7S4K9nDgEGQTWwl0SBfnXwPBqSgky7Yz7WjCg=
	=
X-Received: from wmaz14.prod.google.com ([2002:a05:600c:6d8e:b0:4a2:1459:4ee8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d91:b0:4bb:6861:657d
 with SMTP id 5b1f17b1804b1-4bb686166e8mr129134925e9.21.1794839245593; Mon, 16
 Nov 2026 06:27:25 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:30 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=ardb@kernel.org;
 h=from:subject; bh=1pJ9yJPUym3K5Fr1m3ICy12CXT7e7//ufFV5i6KSJ2A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30Cwpb4e+Lf8evjZ7eOlnnp2IcFf6/W3Hd5+4l/F6y
 4aQnccmdZSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJnDBkZLhnZrt++mGzFxlG
 gs4HJd4s9ivede5g+IVn8TfkjXinfbNk+O96vXDW6o77TO98ur/w36+Zc/bk1Kubmw4+s+dROh6 ysoEJAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-28-ardb+git@google.com>
Subject: [PATCH v3 11/15] efi/libstub: Make efi_remap_image() return efi_status_t
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
index b985ababbe66..634e52aa6dcc 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1293,8 +1293,8 @@ struct efi_smbios_type4_record {
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
2.56.0.611.g1030f0b940-goog

