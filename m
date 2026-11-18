Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026125;
	b=4AZLscx+zM2+B2lRzzpto3ylL+W+48qFH09UcvDm/IVozgOIIaGImnvtMJhqImQtksrs
	 pe/MoiK5XpMneHXygVoLbi+1YnOp5RXPDhal0ZIrGai3oivxt1lPoRRU3zsorrLiAHFLl
	 RJnCdHAowmnJfnUJEflJzx7+/TjmaitBwNCHziMdzQFizva32BtGizfKgDLfiX1Q7B5uA
	 yh1XmGDBccsRxoduPHx+U41RztWC7kud3jA8VC97Or2TTwpH7FdqvwsXX5lL7UWVxigET
	 uzLdNgHhFl8FyJGh+sRiCt6buN11z2AEffmcvE0ODMR3O6WU3EJvVVkuJHNAgPtsFOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
	b=zTZjpiywQTFFFW2uGpNwNeHLP5a9FQyURq9yAtevfM15o+9T7oBAahr/Z9ggAeneX/HQ
	 /H7ldCuJOTic9l2FhW2eV5JpVy4zSwQZxWgGgi7IV+VHxgMRWHF8YDNDRBGlAkqziya3q
	 Ut9SroLzyLgEEcheOrW+FIIE4wFKlx3/hFDgTlisEtIBBSVRyUlIrhDFhdjX8iKOOTcXB
	 io9Y2z7SgvWsebTR1meNOx4boOlf/C9zFFHareITK6CvxpPPIHXTzMMd1EGxEZBodrkzy
	 Rj4FfJwS+lyF052K5FN2aT/A8Vq6w554b74yI/oY4Xom+IQKMk/7RyG1bdYE/JNAqqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZmM+X8p;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D1606A32C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZmM+X8p
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c50713860c0so110496266b.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026124; x=1795630924; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=ZZmM+X8p6DPDCI9GXSK7f7X6e5iQCkUNTADLXh2ftJMEQVuAQbwyqvYGzfI4FS+aVv
         nid6/bdJmXAEOs3V5QE3s2xQlOvwmND9UmrKLGyIL8zfTcPBTfaQ7+V8FcGWjNPz0PHY
         rB9XBs962nE3U0XH1n6w9G2RHGpUYjnFBQjo84ENhskB4WTdjZWfzdXPXd2i7/+RvGSI
         KVqesFVtm0rhW4GQAmBVbwpBh/yJY1GpY7UBSik8auUuguF9RyP3S+fRlSLdJRqh6C3H
         8enTrbibJHF77lKK3bMkCYTXHT2qwhRYIjXfX7HZiG4wygBYY+P2wdb/VfLbT/JJori2
         XIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026124; x=1795630924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2HAR1/QIm7cbi9gzcaeZomwRblEdyJ34MRcnIFpfbg=;
        b=P6TM7FWhqNCbTAqbxxGpUYgnkqnacHwnqa3U8alTdBuZGtOxTjXxinxhd+J+jGVyd/
         /9wzaWnSdcVyZn5t8rL09TA8/ScYMGkyVOPc0uRD0WNxp4PFO0y+0J8OtW9JdNNDIagb
         u6jqWyJSRDsXH5Avz2FXQ9Gxqux9UZ5mlzMFkhMV3xzGNk5dzQEsHDTEc1ND5C/lxaA6
         7tpVXXUKmo77Tik+3guWnhaFeMptSrnZ1n3lrUSCm9b6lVrBRF3Shy5Eo0pFfbDfR/j8
         gmQmcy21d7vWwBPuLWy/qbQ+cPKi5fTJu+vFxub0sFMkfolXudVGcWnEhuEdO4lGs9Jh
         zHkQ==
X-Forwarded-Encrypted: i=1; AL+hErEOxkhpEVzIFo1EIJVjkHKAs2PwIeWCm1BhBayVtPvjzy9vw3vTyNLehG/JHHL9Lue1mRqrv5+Do/I=@lists.linux.dev
X-Gm-Message-State: APuU4Z9VeQfZi2AcQLSQOmfUc/kTclJnJMhnw5bZkED2uaOsL4HmHNFq
	4S6G3Fbh0nbzZlPsmcnHbVv/T8F6XnOczhmghEK0Z+ql+NXmm1QCByz4dflweQQspssUcEle7g=
	=
X-Received: from ejsj16.prod.google.com ([2002:a17:906:4750:b0:c50:9014:5739])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9490:b0:c31:c767:ae0b
 with SMTP id a640c23a62f3a-c510dc46093mr335886766b.0.1795026123628; Wed, 18
 Nov 2026 10:22:03 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:16 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=ardb@kernel.org;
 h=from:subject; bh=VIsLiroKmQWhjV/hmhsESRfVSQ8Kw0tSPcHO14prx9s=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvmwWvvm95e17E9K2NDbPkg+j/ukJRfPtiH+Q4JSYcv
 PmxdH9kRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIZgWG/2E7fT4eu39zRh1f
 83dNmbx5TW5zrrkcP5aX7OzzbWmoeCLD/wDLYM3ApSk3e8R+/VvhvkTocrniAeuGitNi00ISZ1g WsgAA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-31-ardb+git@google.com>
Subject: [PATCH v4 10/19] efi/libstub: arm: Simplify handle_kernel_image()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that ARM moved to efi_image_info for obtaining the base of the
decompressed kernel image in efi_enter_kernel(), it no longer needs to
distinguish between the image address (which might point into an
unrelated allocation below the decompressed image) and the reservation
address (which is what can be freed upon an error).

So use image_addr/image_size rather than reserve_addr/reserve_size in
handle_kernel_image() to return the base and size of the allocated
region to the caller. This will allow those parameters to be dropped
entirely from the prototype in a subsequent patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm32-stub.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/libstub/arm32-stub.c b/drivers/firmware/efi/libstub/arm32-stub.c
index 798b2ae3bb03..55d4fa3177a9 100644
--- a/drivers/firmware/efi/libstub/arm32-stub.c
+++ b/drivers/firmware/efi/libstub/arm32-stub.c
@@ -128,18 +128,14 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efistub_image_info._text_offset =
 		kernel_base + TEXT_OFFSET - (u32)&efistub_image_info;
 
-	*reserve_addr = kernel_base + slack;
-	*reserve_size = alloc_size;
+	kernel_base += slack;
 
 	/* now free the parts that we will not use */
-	efi_free(*reserve_addr - alloc_base, alloc_base);	/* no-op if 0 */
-	efi_free(alloc_base + margin - *reserve_addr, *reserve_addr + alloc_size);
+	efi_free(kernel_base - alloc_base, alloc_base);	/* no-op if 0 */
+	efi_free(alloc_base + margin - kernel_base, kernel_base + alloc_size);
 
-	*image_addr = kernel_base + TEXT_OFFSET;
-	*image_size = 0;
-
-	efi_debug("image addr == 0x%lx, reserve_addr == 0x%lx\n",
-		  *image_addr, *reserve_addr);
+	*image_addr = kernel_base;
+	*image_size = alloc_size;
 
 	return EFI_SUCCESS;
 }
-- 
2.56.1.708.g77570a6a1d-goog

