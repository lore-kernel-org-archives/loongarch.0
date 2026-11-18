Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026117;
	b=3iDReUo9PAGx6X9Eqj6Gghu6OcQyFXM9IRVGQ9dfrzvwBjQV/e2fVxx6rJsQvb+pn0G4
	 zo+2Afjip7WTm8eMXvUXC63Vq+eNb8/QyLbjpMZwwAt2WNm2EbjKAZevsQmFwM9xLwzCM
	 W2Vzb55MTBsNKNXi12m8NRNoUdHQVc/ruO10QgMArtWIPREnDEem4y0xmrO+Jw6U3ZRXW
	 RSHSl2W8+sUDFnOVqRTl2coJ+KhpD+7sJ1i/LLIh+RoeLWaNcaLTLP2JZPKrZVWkFCV8N
	 TTt18rb1H8yGg9Gqa4VZnz/R2EgjQgRE36qSa1Kbl2mhMZhYda5pXBmkVp1GE7/4LiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
	b=N413nNGNd7nItbXg0PHRkmsESSKNuva0ikhOAfJoerusFUvbN+V0Ujn2F6UzjLNf+LSm
	 HmYSsa0m4iupmcNwMo/sAKn/c/emNDB5EiHdUKvKbVcaefhlWnWQ94P+kinR8jna1/N9/
	 E9OVQLCbGTs4YD2TgLYXA+293bS3lH0CNkfEGq7F8dufxhUbf9pZY+nfc5V5yoXxFP2hQ
	 4BQas8TQAk9Ikpbpa5VHumfTDpjw8lOgX+MZxWc393FVEL6zlNXIqczzDJUQP1ABsCksc
	 A6VRmfsqpMK0MYNupkiijOiY4J3sCK64A9fwwO22wXotkGWDXQGPRCfmrSE0SQCEmuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLeAljoM;
	arc=none smtp.remote-ip=209.85.167.72
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C356606A330
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C356606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLeAljoM
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5c1af1ee7c0so253954e87.1
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026115; x=1795630915; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=kLeAljoMt4IqvB+aJHD0n3q5pLMB8ngZL70Gw+/D3LLRKBZRoidsfr99WnxKDgKPo8
         OT4eQIUKsjSP9eGBi1EZAps1I5uYBxvU9j6+XX9plee3Fnpfh93ZPA76t802eVwqdajP
         LJsUVwd1nKwCTGaD3pN0DOidz3ZCaj92cWfJCAULe+zS39C5F/cVi3jFd5sRfNTAsVlt
         ulYn22OexmSJi714Cqq0SZaVNQiixtPdSeGHw5kRdQVw82oqO+GuUrUaCDTmOcmfaZq/
         kbgqvYIC16x7hIKdHZ7WhaQzXkFf3eHExvzCl9kSjGqqDXydveX0jd1l5V0GKVy2M3Qu
         6SuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026115; x=1795630915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHVLK8gN3JGtLR47/Vi3zFfCL1k2jq913taY3VtB1LY=;
        b=lB5Bs8RN3vmA/ikOn60s7Z+AoCJI7gO/nTWOOIP5KVlFSSOlmi3QEOoBXtgkWJbKkP
         eELcAYxOqtRlNR1Z+Z/4ZtDtjLqjrwxdgAf6ZdHybuA4dAEutpFcLkolCKtkzcvn81wy
         g1qzBSzisWaml2rhXgfufb9FuWqS4UFaW5rg+lz7Zs/LGWRVOE6a2IJ30HUhGqkKVDrm
         qgpT3eYzENJq21Ctht/9bjkTgD+yQP5MeG/MMcXap432wPqU3+NS8b9epepPyDT+EkVz
         49zM2ZcobqbUQmkdAk3FedmIm1GhnTJ8RXL6mruHH/m3EyczSGaZCZ8K9hLVvuWSDARd
         +9LQ==
X-Forwarded-Encrypted: i=1; AL+hErFNucrwNJWqL1v+K8+uGjXgsIfTtjgUPnrx9fzt7Vk5uN5Fhvx4KcU1QT9JfLL4GR1/e99t5g491rQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9VwQdU33bmFDPNXcNB50U7svJWAhFjJCyquMhl0ULB6xUfaUHJ
	fgLovsBg4eTTZ0tT451WxcyO8QRT4VlrVnUctvh9j9s0yJMbv4z41QIHMR1lNsjP3PtZOEkHog=
	=
X-Received: from lfbey12.prod.google.com ([2002:a05:6512:678c:b0:5c0:343:63d0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:1322:b0:5be:516f:1b4b
 with SMTP id 2adb3069b0e04-5c1a9bfbef6mr1173325e87.28.1795026114420; Wed, 18
 Nov 2026 10:21:54 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:11 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=ardb@kernel.org;
 h=from:subject; bh=tASZvRhKDOWjZ60RkT+IntWFeW/Kh2vWRn/QEfDreKI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm5msC79deuT9dVvP9cSTiye5ZGrz/fDZqu98+9iRb
 UvzA0OTOkpZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEFrAwMrz4aNTAevTAi5Xn
 a25PrLxmp6L9PXJNuGF4uKXwH+9Qzj6Gf7Zph5fNXC5YYXDQuCF/wTRJzW9dDzv6xZuPvubr3b+ ngQ8A
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-26-ardb+git@google.com>
Subject: [PATCH v4 05/19] efi/libstub: Avoid _end section marker in library code
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
2.56.1.708.g77570a6a1d-goog

