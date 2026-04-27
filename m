Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A585939B962
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279199; cv=none; b=dAtdG3GJYI48UA0QvQ9M0Mr/h+p7Z3bM/meI+fqFCkgamfTIVFMi4wRXPn1V0DREncx67rk/H/nWTTdX8+z5Aptp27GPsPFiGwfwnD2Ch7pdAkI6k5lqOfhq0QF9RZoOMsergkVPhupzJvfKjZ/6N3drhhUVisu9FLuMhIIwvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279199; c=relaxed/simple;
	bh=vnWQaMXFkKtGP6ZC1Nh1A7b0JU1COH1xk8nY4+B24jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ov69heitZA1IlVAXKtqrqL24xIuOWibxSKaoJlTMiXbzI4/bH4PsOTsJrcc74d7HlASO54NmW5wncdYTo22gLGtp8JUeswWHVc0u8DaE7lqfrWLIK5kDoyyi4PcFqv1mDpemur5ACfhWnejWJykcjL4Yt6ofLeYr9RY0iYdbXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=meQGhB4A; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="meQGhB4A"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9a9be502so61579415ad.0
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279197; x=1777883997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjfJ4whsRboDgauJW5lAp4KFfEFuATjZYAYX/3z86Ss=;
        b=meQGhB4AKTC+cTmV+e0UMVauejh/emDfZvlmthN++vF5Fp+WGHJ248CtUG/h7ZMht0
         jhHFG/RAdH11wAUJ5KmrYAwg3UnSRgf6oPD436vC4K133Y3dHHMuWzAq5N3Nk48lGaTi
         ccERhgoH1+IslAfJA9FG0cqpX0+snxCa8zzsJqyMUsYq2ba7uP6vhz80c1zNYZCxhxGY
         rMD1otJxbRxUVpKsmrVyBlSFXp7/fjXicTAJdRzv8nOhSrNO8YM8KsILXJTuatzznJiW
         i+IAm9adIRBg2UJS1Kos8Ql5QsiHqZyYMx3ByhZSgM/Ocrp945HVNRD3IGIqfdbGpMh+
         XoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279197; x=1777883997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjfJ4whsRboDgauJW5lAp4KFfEFuATjZYAYX/3z86Ss=;
        b=ObJ4oGbK9cMHyu8xw25d8kqorxSgf+p4CskO1sF/832PK9jR85VfYEo4UY7M8vnmfF
         v3OhbXIAmx1gFpq4EQAqe/TxfVt2U5p3hnPzTL+VgvPBKx2Y83jnF64o2co5tBGFLALE
         nH2zPo103Docfx6BjCX54p3QHXlolS2K9cLmW7DcVcbEkZ0dGJCOBBnvR34razfIGM4e
         IIQFkFHDbldWlQPewmQpDBKHqPITryz8aYIKbdNxVKWQCAHMEIUsW2Bld9h+kjC1yCyX
         Mo4Jf7z41KPkOwMSo3C9Vey/8BhAI8wy7ihuyAcMdTIwpmEGRG5izQ9h6vVb75I8oRED
         QChA==
X-Forwarded-Encrypted: i=1; AFNElJ8QRRpjo3iYnuIMW4lfQ18Hl2MBiD8DUJWr4pl2TcwY8zzn5BdPoLEGtzs0sQlmjitVHE70+ssOXzs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfbFSYV5GPYm9ZSKQCCNPXgmx8Y+6N28ADRAxWWiLBIoF2PDbb
	kgz8lrO4b8M0APz8V/U0vOJgEZ6Zucv5K9piiBvWBXIXAVc4HPfiVU59HKrn1SUYuAa4pr36/Uf
	J8WRlqWI=
X-Gm-Gg: AeBDiesc8Qag3pze8XV4KZ1f3/KjbQfjxrpWU+GejE+M82Hj6qrDB+1jBqeWJYyLb0C
	ejNBW9rBLlJ9/TW1N/E2n65SZWIqo6Ot4y3TEewee7dhokO39SWa5MyS0NXwAr4Vg7vJGIy9MU4
	yOb7252wuOxafQ1vKUOx+gPODQDcQUvODBMUWS/ifWS6ONwP4oy6qfUSZwn7xEJyqgF47QDwz7n
	h3cRIJdHgqSuD7yCKjI7I2dKan6Gc80r28jYzvFWXte/CYdSyNqGFfd8Sxv/WkHDkZnEozcrrja
	DziVb7eqZgo7JfXvuw16foELGVsYARSI9rVPKwQdYYepe0BTt6DWN6LpgMcvDeyuzX8KPML2Kbr
	AgHraMZ7S+CLmeV+bd229rrio0fc0WJwFDSYdOrul/DIJZKtq0CcTU48JAyJzrPFCeARbF3drcB
	N37k1aD6gMr7Q=
X-Received: by 2002:a17:903:2406:b0:2b9:4c05:5417 with SMTP id d9443c01a7336-2b94c0561famr79798515ad.32.1777279196945;
        Mon, 27 Apr 2026 01:39:56 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm276063105ad.77.2026.04.27.01.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:39:56 -0700 (PDT)
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
Subject: [PATCH v2 2/2] efi/libstub: Synchronize instruction cache after kernel relocation
Date: Mon, 27 Apr 2026 16:39:30 +0800
Message-ID: <20260427083930.36324-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427083930.36324-1-r@hev.cc>
References: <20260427083930.36324-1-r@hev.cc>
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

