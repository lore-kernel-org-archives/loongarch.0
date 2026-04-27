Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A27363095
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261528; cv=none; b=a3p8QkAVO8yU3COFla0toUZfm2vIptOTO9x9IPZEfOZ3ym5rADYKnXw8RqZGohpkOdRSAJzHcHiZiotPu+7hzfFt6KEH7VCwzjDyTslqKkOvjsyxnCnuoRiofpkX9ERhmQRfzJwSQ4Jv8FK0Cb9nHZjFcK9UNY4ZOSBrodSQUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261528; c=relaxed/simple;
	bh=GQxbjViAq937qxPVb6aK5SarlLun1y1QS/zeWJMo7J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3YIefn/kw1P9E0LemCnJ6WefiD8wMRIxCcU9xKWpran1PkzxKLm0x66DnEDoeunvAxMLEvhuy/zM/RLmfnLDT1EGeBzeKxAb1U5vLplLTsQ+uVvdDf3+QMlq8FpJDMN09N+8GN1yywaWEiBiA/UcFehOjhQBJ4jZkVVXH3+3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=FKfUdLp4; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="FKfUdLp4"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso7413085a91.1
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 20:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777261527; x=1777866327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj2Ks0SGF50ciVTp9OSJTi2f/jET1S92yU/1nIOqmmo=;
        b=FKfUdLp4rGlHgBI2aHPK6jSo0wrDjS5FNAuGTptVRW0RjlzlUW2XDCmuPgi2lV8NZo
         eoGfT1ezqUJI2G4mziKpj8YsHCGXk+NhWjhVdArm/xGwkjJe6vkp3RvNEKR1KMl7bvX3
         8g+qV1WKcAL3wNo5bVZrRXZotOxvYRoI31aDZqBEagbl6XB6KxDU52BOfNy3lul1pPzI
         L3d+2/Xm7bPt/ibGGyUrx6J8ynUGz5zmg1lHokByv2+Y2UFyTNEnVAHKSjARak/CEJlV
         9hapnP24UVoSdzdx5Wq8O8fvhtE5d82p/GOF2xhyXaoHMRNFTyMpxq/sx0MQ+gom/8hM
         9czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261527; x=1777866327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yj2Ks0SGF50ciVTp9OSJTi2f/jET1S92yU/1nIOqmmo=;
        b=im4NFJGE7rvNaJexyzxoq3PiBBJCUvb1oRi6ZeVU5j3PgjWzZZzCn53G/DzKLeckhT
         WOzYhP1DTsmTLGEAfShXNkvqH+tHgZ+YzW/X1XHaTJojlFeuVmOGG6g6GB95RixZhx7q
         yVVUsbBPy11JGdWkJMHd1vILc9kuylcDpTtS/kZ5aiWTqUoVNWjKHamU9rPJg40LORTs
         qWQ2JBB48eU2gT+3BsFd7F0X3NnJtj6W493YyMRp4uY8Nsz6yiQFmyG7W+30efgkPmAU
         fUAH1sKDXobf1CgTfuH0w0mMC3xItCs7We9otQqw4myuAwmC/z2h++jKpz/zFuaiH2xA
         lShw==
X-Forwarded-Encrypted: i=1; AFNElJ8russXMWq+EJDqsSYwTD5kv2LJeggCqF78+asECr+q8abLZNgmOqx88owybb8k1zQjhZ8gZfSDnso=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOqNiW2b5jvUmiLJXtxsgUvFrOLycbsojjqG2CXw0OtcPMTPvz
	X/n42ZPG7XT8xMSrmjD9DePInfkg4wXGYWEqoB2dQkDUfO/oDsTUmwmNgIBqP3pG1jk=
X-Gm-Gg: AeBDietKrOC5L/4m8brKJeG1U0aun7/J8U4WITb1qkoUgWJJiwSRNVkHNFi/1CEBMb0
	qVxGo6HJAih8UgTc4fgISESApJdi2wMwvqrkQfEa5wwNHOTVYfsjs8+iWrdU06znag2uN1bDoaF
	JBDAgMeFoTxfSzJTwJZjK228nm8Wm5U/GhxUBzCkh5gvpl3gp/qv6IgAg4Mdx8n1K6fN0SuJONX
	Ok73ohAQVsKG/eEa+yDHzWjnsCcSylnsSWk7N6uvlOYts/acdcAZUUXYo7AFd9Ilu7OyvcNE9rA
	K1iCVpb5Ijfi+wo4YSUbcJbBWhnrC13lowU0TXb0LxmZrlYcJ91zRrvt+zP84AX0aaXuXRUEG35
	yedYVSZq641cnB/tmeYUbN6vx9E5C1HMADGgN1jDFZDsQP+ab5NjKkOGtjmsG0wOH3YP1fEjnvz
	bfXHYC0vWhlyq71hjbElY=
X-Received: by 2002:a17:90a:74f:b0:361:4720:af84 with SMTP id 98e67ed59e1d1-3614720b0e4mr27755933a91.20.1777261527135;
        Sun, 26 Apr 2026 20:45:27 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa3073asm279061375ad.27.2026.04.26.20.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:45:26 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [PATCH 2/2] efi/libstub: Synchronize instruction cache after kernel relocation
Date: Mon, 27 Apr 2026 11:44:51 +0800
Message-ID: <20260427034451.717817-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427034451.717817-1-r@hev.cc>
References: <20260427034451.717817-1-r@hev.cc>
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

