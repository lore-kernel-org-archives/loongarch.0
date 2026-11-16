Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839240;
	b=S8SNxT4Cb4Qm7YjZdkfsAUwwuMnuKuOgVxYiqWgtcPba8jbZPe2x1TpuBopg320BUeJC
	 M97/AA8i8xuXAhNVEdhf/JbPFhOrIFF2fnp7OpwJF+sbi3gn4xeKx+1bxe+W2Wg/Yd+xm
	 DDP8WeJ0L7FVE4bi06pBUCmSUZjdHkLTHCJqQzOp0nwlEXOdOI1Pum4dEf6M46Ba3DMGw
	 z0YQK/04LGqNHRtFl+cryygXf5Uze0xJXhlm88YvZl4OooeMM56qAqRKufgroL2DUhc3H
	 1XwP4lpsfKF6xof9QQYq8/lPipflhxtFVDcoiGGC6el8qHZyMh40Pmzl9Olk/mRX9Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=;
	b=TOt7+VGyjhg6EYjt4Zgwb2knW5hlkKrjxncoqDlMs6vL4VmhhQLtUuvhoq35CK3EP9uk
	 MKcg880TZ4CUxg4VjzwNz6fS6O/DsLTkwIpFN/f6NGnGJL849mi+ITUKx8DxIHZWqA0vN
	 EFg0DSBSevt83f+gS7WBhjXJabO+9WnZFIUNR+br4AnmqJVZKcPvTlQcMvmNft5igmM0A
	 rn5H3QpFAIrWcfuaJW+5o6M5+MCYKHfKFnl6wSF1or1L4amp9J0Y01/YHglFIgS63Xbxf
	 mtDy5LuIicCe1BRC9xjPyYbiPNJ7/4fbFkqRtOp44oUfemr3TgtPrmkyJXOM4D0UeAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c5nlFlRk;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BD606A334
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734BD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c5nlFlRk
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso27103575e9.3
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839239; x=1795444039; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=;
        b=c5nlFlRka23E0W0jgL3Ystj8Jph2g2QOEtvUrJamCE12ry4VRoB1D0Oci+72+apW/k
         7/jqsElhEedxWDjlirU72BonHs2fJfDEFpkYuxEhYT7MjwAugFRNhhbN4+/X3SKv7vA3
         H649T11D9frfQn1M6CVbvPRNw25qOzOyOeILY0hG/YeUEjbCCcR9erqCq8wgBTgGj1NL
         xD0R6oe8uJEwFWlWtiimgT9O8+L6u/eeMUSITvMdtPW23Q6VSpcd66uN7KTL6cKBcJv8
         acwFUpZa7TrR52SRW9Q38j1na73pBBPtVSji4aO/4oGfuRLswodu2RR+QB6dj9wXmYm3
         yhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839239; x=1795444039;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/NQHRNe6l6YOGUDkv9ZNGcgPj475MvlcuYl9auZYJY=;
        b=zQ35aQLVWbXAk1Qhc8Yv2OY9m8RN2ddsBNlbRh6LodSvUXxGff4RhfMSIHLyyaUh5u
         sx5fn30NhY74e6ufRekfSP3lG6DvvNMyenyAYnJW7KKgdo+DK6OfbEA+qnVZkYatFjpQ
         O6tfNQT3Td9GiqUepkTSwd+G2Xc1caekpTc+fZqZOrPiirMu5FCHMH+H3NzADwp7ix2N
         y/byN1UWnKhHsg/1Y3tnjvJo7JyYnfOIoYCeIOVFovKiHWK94mg+Viqv+tzpmCdeh5cl
         c3ZCcqvFe643eegvOpc5lUUZZjXkxwbOs/poqsJsu1IrsVu4m/6KjZb9oq73kTMlUoQg
         KY6g==
X-Forwarded-Encrypted: i=1; AL+hErGmFIYvpCJ3ohm47XurglQA5h3jKWPQkwpv3dvf5EwqyAJ+vzFFWN36Oa0A9dn68qAaliCZw/qSomw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Ja3hIZyGpUMXR8z60m8a4VKn4Mg2pd2xsEJztH5FnTHnmy34J
	pyhrxK8sgDSbjwnfjVLov3GI0ovBMUgdPyI7GphA2lg4f0vOEtzWZsZBAmvq9ABEUawlR2uZfA=
	=
X-Received: from wmbjj17.prod.google.com ([2002:a05:600c:6a11:b0:4a3:5d5b:9ad9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6286:b0:49f:e8bf:8f9b
 with SMTP id 5b1f17b1804b1-4bb55a23b4emr228382165e9.4.1794839238088; Mon, 16
 Nov 2026 06:27:18 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:24 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=ardb@kernel.org;
 h=from:subject; bh=gNFwqEvRPin0drZTY8vZ8X80jlSMfocbKk0VdpmbVRA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30KSg3fcv87JE2Vwx2/OUl40vW2RrsPb6oCrlHnF1u
 dmyb9M6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwER6PzEyrM+807hgHuvh1S8n
 7DDjYHotYHn95jar+8ULlgkKbOBwnMPIcDTjw5LJIe92RiypnXv/9FrZ3E0/bCS3WkXYaqwq8vY LYwUA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-22-ardb+git@google.com>
Subject: [PATCH v3 05/15] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The _end marker could point to the end of the kernel image being loaded,
or to the _end of the zboot decompressor image, and so it should only be
used in code that is obviously only intended for the former case.

So instead, use kernel_memsize and the image address to obtain the same
quantity.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 8f8dc335b3b3..b34e4599f0f6 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -125,7 +125,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
+			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.56.0.611.g1030f0b940-goog

