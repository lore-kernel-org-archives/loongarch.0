Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026127;
	b=tXQWco9jaIxwBhRrcuRDRFYHGw55962sVPxJ9IEpaECt8rMXFtqq+7fd62+MJXuSSSWG
	 7a4jate2kOGgK42y2sjvkjbJYJAHhX7+CVBmHX9+SsNwYYuT3eNx/XCOwfTxkgGq2MRB0
	 uOdrCg6vmXloYDOnTXmO3XOWpv6oIMPbVK9C/TwAfVyMBgsGkpW82fMKDR4aGb5t1stUC
	 GGyuphmeYtq8ZFlR+CmBkIvntMCgzTuqd7ufqZjQb+9rXGFlc42+uhDYcbPWbGdE3yQWO
	 W2u24S52Lm8xreJpCxf+/vFYG32KXHOcc+oYSOO7dedqn0VhucFwbvk6Bs/lCm9DpvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
	b=qZRcLibOcJwZZjZhiwcz7WRBDGanrTbHAOViL1+TP5w9KLf2jhpkUfCvp0AsE7lUhRru
	 fKb6aU/LZT0zJv4DbtdgMJ26McfN8CjxDlIyFcH3hTKw2roDw55YMGa/NvE2MRYstKJiX
	 SAHxMHN9UDtsAPkPSfIMqVdaPx46KPhyF7lfzBIKrhqL06IhtDtgzAsDuy+4z7KeVijMM
	 thqaerSy8kfxepwIvcc0ESLAotErE9j5PSbkN01aL1UpX0xVNk4OSo6rOT4wTeK+wYo9x
	 Qc593chDfrHWm24Lg81dlB7y2U/KCCR2uvkQtx5no/b/1+4Bgm/2DcXqgwD0bN+oONQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="TR3junW/";
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD5606A320
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03BD5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TR3junW/
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0461e040so1062758f8f.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026125; x=1795630925; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=TR3junW/SGOXs1TPjf+mpdI5u4Zed3HnFLDzwMUyhEXXlRKkqFrCzDasjU6xNH80/8
         fkxp2af8OOz34mgBfheFtel9M1bISiq+72UuCuaGDDAdfK2FjRJDSekdSyG3/GztrJ0Q
         1mJbqKKhMC8Tqi80Ak/viWCIwlbyWYnZSra9ZKnNgF4JTiQ65cwB61//6vDITMDx0qL/
         9VlGshw6X/XmygRtJtHvkZUgx+4O1xGJ55pGyDT86GYyDQcj7dgvLQdsrkw7/7PPXRj0
         ieCdcFyrxeVaxxu2/z4wCwtAtuaSkJ4ia6Uy643RA0CxDLMcnMb56hZQLaxnqAoLOvhO
         UERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026125; x=1795630925;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEeaARdatv0A7mhpnidkLGUlVtXUnSTDUsZkbCqBIIw=;
        b=wsbDKo3ySyL41F6Xf+2U6WiNFGkKY8R2Uxap9isSFySZBsiFxHuCceIfgOfpGQm0ew
         fc98SXc1POQQDUGA5MS5+Vm1KWmrRuBMFLOYpTqImfwadUhBkqtm3SlwMIVrAYJzPIQ8
         GBeWMx5TNRvoMrG+ZeNXFohdriXjmAnjrhIAnGQKnN/24MqeL/g5sMOSJh8T/OWPQgIB
         awzhQPGDTlYqkS+bLAj5TuqWj0KenJtkq83uOL+xkGjoLLovGGd1/taxLslhubn93DTk
         IQQRJYUXRLBL6lVLK2dXUJN8Vmx8PVq7aELELuKUmZ1i90HfVNf0fCgEXJJ0sG8nXuat
         DDVQ==
X-Forwarded-Encrypted: i=1; AL+hErFKnbvQUmZD0PBU84gMBzpbLWlWl6i5XDr6bOs3ED7eTrFCCGlzZ5GdxU6NI9Y5o6wZk9HgllW6kGM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8S4CKMg1wGVIbCkrAHqL1hQB7s76ysgV7W3g3MZjenkEu0pBhb
	YNPDSh7+8FS7vAZhB/BSZnKke01gGNDRMRxjtbJCEW2lEsnVOEKSJNFg28WfnrnJyx/UH8E1kQ=
	=
X-Received: from wmsl30.prod.google.com ([2002:a05:600c:1d1e:b0:4a2:df9b:ef74])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e02:b0:4bb:6b59:aac3
 with SMTP id 5b1f17b1804b1-4bb7da44054mr69467855e9.29.1795026125277; Wed, 18
 Nov 2026 10:22:05 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:17 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4679; i=ardb@kernel.org;
 h=from:subject; bh=BY4lNS3U3HJqg99nmA1jm5uVn1J2yFNPSkQm9h6irHI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm4Wphpfm8/sXp+4V/dL0O9xUmSnwvrtj2M3pv1sN/
 9XOe3+po5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk6QmGX8xWJ/TOemt4m/Aw
 lk7+uOJa7ReJe6vtN6p/Fvh1Or37hwojw8dZU7T4rG8eFZ/mW9XoEuD1xad9vWilmfU6Dou6SLH dHAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-32-ardb+git@google.com>
Subject: [PATCH v4 11/19] efi/libstub: Drop reserve_addr/_size params from handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The reserve_addr and reserve_size variable pointers passed to
handle_kernel_image() are no longer used, so drop them from the caller
and from the prototype.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c     | 2 --
 drivers/firmware/efi/libstub/arm64-stub.c     | 2 --
 drivers/firmware/efi/libstub/efi-stub-entry.c | 6 ------
 drivers/firmware/efi/libstub/efistub.h        | 2 --
 drivers/firmware/efi/libstub/loongarch-stub.c | 2 --
 drivers/firmware/efi/libstub/riscv-stub.c     | 2 --
 6 files changed, 16 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 55d4fa3177a9..3ca20d2dd4d2 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -86,8 +86,6 @@ struct efi_image_info efistub_image_info = {};
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 6140def24c69..af38cf73cf01 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -15,8 +15,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
index 36ea6aa2cfcc..a2fefe1ded05 100644
--- a/drivers/firmware/efi/libstub/efi-stub-entry.c
+++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
@@ -36,9 +36,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_status_t status;
 	unsigned long image_addr;
 	unsigned long image_size = 0;
-	/* addr/point and size pairs for memory management*/
-	unsigned long reserve_addr = 0;
-	unsigned long reserve_size = 0;
 
 	WRITE_ONCE(efi_system_table, systab);
 
@@ -66,8 +63,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	efi_info("Booting Linux Kernel...\n");
 
 	status = handle_kernel_image(&image_addr, &image_size,
-				     &reserve_addr,
-				     &reserve_size,
 				     image, handle, &image_info);
 	if (status != EFI_SUCCESS) {
 		efi_err("Failed to relocate kernel\n");
@@ -77,7 +72,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
 	status = efi_stub_common(handle, image, image_info, cmdline_ptr);
 
 	efi_free(image_size, image_addr);
-	efi_free(reserve_size, reserve_addr);
 
 	return status;
 }
diff --git a/drivers/firmware/efi/libstub/efistub.h b/drivers/firmware/efi/libstub/efistub.h
index e45d16095247..4e6af37c4ecb 100644
--- a/drivers/firmware/efi/libstub/efistub.h
+++ b/drivers/firmware/efi/libstub/efistub.h
@@ -1150,8 +1150,6 @@ struct efi_image_info {
  */
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info);
diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index d57e3d3557a5..8f2145bd9ad2 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -96,8 +96,6 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 840fdd63dccf..8cd0cd9b0048 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -12,8 +12,6 @@
 
 efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 unsigned long *image_size,
-				 unsigned long *reserve_addr,
-				 unsigned long *reserve_size,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle,
 				 const struct efi_image_info **image_info)
-- 
2.56.1.708.g77570a6a1d-goog

