Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC237F755
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279666; cv=none; b=XgKof4+xnuMb5lAUZ5A4SyjELB/WQTLfAUPJH9g4zwiQUMZXKXF0Iddmt2WDU537xVAwKx2mntrqf1PAfJnSU8Lo52NPUnaqgZ95PP9d1GVqYMe3qvzT02rt3Q2hGYrwdkpZx1NfbLdEja6YC+I4Lo6lgQrWOwfXDZyNnfpR8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279666; c=relaxed/simple;
	bh=vnWQaMXFkKtGP6ZC1Nh1A7b0JU1COH1xk8nY4+B24jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2pgFCmdZjbySGhgM7mx69pIRfzTlTv5bPB7+SFG45cgQJf3QwiKOP/qoOWDKGk/WsMa3B8foh5q2+5tJyo+Tgwe8QtaCsqfVv9lhVopAdgLZ/hYpw1PeKyUHnGxJxu081o/jyfohfBWFovwrvEtcrpBArBfSUZ14amC3sVjLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=u+rePlfq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="u+rePlfq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b461310af5so38726945ad.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279665; x=1777884465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjfJ4whsRboDgauJW5lAp4KFfEFuATjZYAYX/3z86Ss=;
        b=u+rePlfqfQgvlzS7pKag1EDN65OGsAdK0vBvuOr7m50AqX32jp/AMZxclXdbnQVYBk
         BDcazsrxktWV5NTH3IV2uhElYDfJpzdu0/VZia1AKQfLyigED69N5vWBSSYaNR/Iyho6
         aa50XdOVwMYYmvJPwjmkyK4BsZG7RU180jzGnFn+koutItXq81inMiGdhnQvX5K0PNdC
         bdRSj9sk5vizZQ7vkWU+5ESMMv54RoZmLxjbfOnCX9opbQvm87Pesqv8beYjUhylS4IH
         /lutSW2zDzbx82ShyE/Foc/8C7wjQVdiBV/G/4/dx0n+zscsEHcye9yA9lSTy7wC8AxW
         +RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279665; x=1777884465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjfJ4whsRboDgauJW5lAp4KFfEFuATjZYAYX/3z86Ss=;
        b=EL7IdE0c7huirfrUttv/RMZE3yl5zDU2WhqNVv0DucDHQjOPfUoo3oP+hE+BrHbGuM
         yXGNiYj/t8ojO6j9olCdivTwZz+2IMG7R3IJ2YUkddn/Cm1SrkTY28jUrWgW0/5wawWc
         g6MJfUdkpocE53giOmxxuEabGuE+MnnK8n1G5wNE/c4KFZMVrhmd4b+fCX68sE/1vq6O
         MWQMOmtMDUMa1C5bJ3tzFfqmMRGj3M4GgdtZqCOksW+CIW0k2LRh6u9V8YnTB3p8eIdF
         SoWS8i1GKLpjn2yctQKxreD7uTBZYDAPwRWo5UBHKlrpfDRIHNCEeuIc40orhlIXiuyE
         rgQA==
X-Forwarded-Encrypted: i=1; AFNElJ8TS4z9wI+WrKQJEj+FMvtFN3ANFNNK4vKZRt1PeXLdee3GGUvQX4lNshSkhm/CjB1/k+xTyd4kjuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsEHtRcnTdg8ixAYkN2L8e8b0d7EnJ2IAfz9JpLEobhybUkWwH
	WAEbsnamJxnYR/TvRGDq6c2a2+sb3wIueKZo4Lt0SPxjuZGPYlaL7WJGZQTG41fShPr2ZMLBZ8x
	e8BQZ
X-Gm-Gg: AeBDiesbmT71kEVfNmYACdWjQ2/MfTcRph/y6Bx3aGjH74ZxOi7XYDrbC+iVUtCgLtw
	7j3XvSl3SZtrr9/L9+atKwA+tqHtkIkie8TO/9q7JxITNF/F6oLKnsiQcnj71plmsSwI6S2Trw3
	5W7oha9bXIWCvG9m6xbleFTMhdpaXKGW5Ufh62dxKHovbmZbh0FMzaOUIG/CTJPM6W7s6weNA+C
	X0UMNhDJFY7Z5XrW6xTYvOuOR+UFbiREUzjxd31hNORDCBCx0g0e3/sSqkbHDCieD25Of2HEnl9
	mX1Cv8mmC3Fwk/6wmfRmAjs8ZJTfBzzen472p6fsqlVz2v8RmdcSVD9LJWz4bLuTNMuXCclB+B2
	ybZd5WXRBlUtqStFTvsST3RbUfGS8bobcC9w9smvxdSq9fvmRkKKuA4eqE5CQ3qfJ+/PZaXMaUx
	cBKXlFBvpiddY=
X-Received: by 2002:a17:903:b8e:b0:2b0:b258:2a57 with SMTP id d9443c01a7336-2b5f9ef72bbmr336496125ad.27.1777279665017;
        Mon, 27 Apr 2026 01:47:45 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm291703215ad.72.2026.04.27.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:47:44 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [RESEND PATCH v2 2/2] efi/libstub: Synchronize instruction cache after kernel relocation
Date: Mon, 27 Apr 2026 16:47:21 +0800
Message-ID: <20260427084721.40535-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427084721.40535-1-r@hev.cc>
References: <20260427084721.40535-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relocated kernel image is copied to its new location using memcpy().
On architectures with separate instruction and data caches, the copied
instructions may remain stale in the instruction cache, leading to the
execution of outdated contents.

Call efi_cache_sync_image() after the relocation copy to ensure the
instruction cache is synchronized with the updated memory contents before
control is transferred to the relocated kernel.

Signed-off-by: WANG Rui <r@hev.cc>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/firmware/efi/libstub/relocate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/relocate.c b/drivers/firmware/efi/libstub/relocate.c
index d4264bfb6dc1..913b425d089d 100644
--- a/drivers/firmware/efi/libstub/relocate.c
+++ b/drivers/firmware/efi/libstub/relocate.c
@@ -158,6 +158,7 @@ efi_status_t efi_relocate_kernel(unsigned long *image_addr,
 	 * have been allocated by UEFI, so we can safely use memcpy.
 	 */
 	memcpy((void *)new_addr, (void *)cur_image_addr, image_size);
+	efi_cache_sync_image(new_addr, image_size);
 
 	/* Return the new address of the relocated image. */
 	*image_addr = new_addr;
-- 
2.54.0

