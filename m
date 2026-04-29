Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AADD37E2EB
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777439643; cv=none; b=MVFnu6oOVwzLjDeok8uGH8KG54CpqANrklAhg5ILHvdZ2RcEne2QExfbjjd773tykJKCWleC3rbZLlvOc9wW9EF8gYMytWKglFE0Es9HKugti1as58u4xSlM77n8mdKn7UAy0JxHbOZfnA0fVs1WRM1d4zcTBEVCouwHdOUMTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777439643; c=relaxed/simple;
	bh=ZtZZjU14tH4CI7Qi3EwJbsIUSfhgGfNFvjX3BbzBTUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJHTRn80MmVTUXS0siUOVQZ1u2oQG8quIoLCB8oe+vK3DDMOhOoGDwaOc2PkG8AdRv+CZsv3jb5VlqFoadImavkyaVzC5jeQ+9yLafuo3wLiYMHlxNEah8Rh21F5mRRqsMSQSAW7R0Ot2jDY+9mgVUwI+OFHNoxtqe3gotE+MnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=UrssEQYm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="UrssEQYm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab077e3f32so53102985ad.3
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777439642; x=1778044442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c434K46vhUUFgUVT8fa10pxpFGP8ckGFIv5A6TmNO0w=;
        b=UrssEQYme89lXwxfQQsJkqePqIgmj+7szd9vIwKakmhd2TH/qHvnVUZRA2cijbVGSl
         Iew3NuuuJS37LXjLYoJ6SaBbLARjseSH8ySZ2apKHqQRNP29ruP4Ds9G3mFUEYj592Xl
         lZlGGBs3TMxo98FRzNdhRlNVV5YK+A7vbon7gIRCkJGjgGbToJS3eDVv+RuiGgtBHqbM
         cn1QJ4MeYMDouymJ2Tv+/iMwcYlXNG/z0c2Kkw7z7gNzCn4owQwb09ZsdZHTpAol46pR
         a1JdQqN7uCyf5Bcml62yVLZOz7AGATXSFCvnL8g8TjwepvBkb5lSXxfuF3S6BMN0KQYF
         nq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777439642; x=1778044442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c434K46vhUUFgUVT8fa10pxpFGP8ckGFIv5A6TmNO0w=;
        b=SVcO2q47fPiCx9t7siEkoq6osNXusCbBdARXZrv8HOOBZ/X//0Zu3GQp8jmjVdggwV
         01gnFXtQul8BzOBtthhpFGALWu7PQYbbzDTYqLdYee74Rue+gY0KxfVYrWBjBL96J9c1
         fPor+V/Jpc7Ja4KEJUosWEgZ241lBYfZO1NnGE8O0IOb6whYmdujhQqUezRLX66H0FvB
         B0CVRCaLbgQZ6oLuY/1wyVq6TsnJ1mwhZjRvOjiuHMGQmfVnQxY+X4d3IfgQBVWufS0w
         6a46C2IQZBUCwU0LiNvEcz1LeFyGnYMZ6JDiRuhxW1dom6Uic87AncASGz6N9OyByqNv
         US3g==
X-Forwarded-Encrypted: i=1; AFNElJ/5QAfD4byqhCJtWzClblPC3DLzJMuLwJ9kyG03FQIeE/Q9eLcyONSc1ZhxuETRAbkE8/OsCgS+qwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8OyvL9hYGy6Bx6ZXIrU217lbUo+Xm1nNlbgDVblbWYN1f5NG2
	t3bFawiX1HHF0SYGI7dtkizc8fFJBwHhIiAdS4MwGKTchqyVgoMex/ETFKq6qejf5T4=
X-Gm-Gg: AeBDiesLDBpDfD+LOXzTSxOw5U5SUB+HcwZCYVGuEKwhOazNotHnHK9tt6J96lYF1LN
	UFU1sIzecOTwSiByQG7mlM51qELc5YnIhyvcgGN/+y71g0ZpDU4hNJ30fFSHIwoCZXoYAWXjb3G
	Gqrj4EfteepddBStrL8hvJuGeZBCuue9Pf6rp2yhW/NY6UdXUmPj1SWC4EsuFAi7RgZCMKsYakp
	SuuU6I0nyYoJ91wUWl91W63TPkKiaNd1tjXR/dNGfBdd434Qei9Nwrp71sFEPwsrRJMCUy7osRD
	KfTQv5Nf3LG9dEF+aEw8uvg65kLu1GzAmPVIhv6uHa7xMrvNfxHmK8io+i0L9D6itOhTeRGxooY
	BuanXkAgorfZsTyzND0CUJZN/d3CMVlUP7s4ymD+/lSAFcmYp/wPXJtYv/4KjjGtzs9BwBoUvBH
	/rZoLFa3UpYQaHeVu5G+R8NiaZAOk0
X-Received: by 2002:a17:902:d591:b0:2b4:460e:6fa8 with SMTP id d9443c01a7336-2b97c4dd4b6mr55225105ad.34.1777439641576;
        Tue, 28 Apr 2026 22:14:01 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988787360sm8846935ad.20.2026.04.28.22.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:14:01 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v3 1/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Wed, 29 Apr 2026 13:13:16 +0800
Message-ID: <20260429051318.1581350-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429051318.1581350-1-r@hev.cc>
References: <20260429051318.1581350-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce efi_get_kimg_kaslr_address() to compute the preferred
kernel image address dynamically when CONFIG_RANDOMIZE_BASE is
enabled. The function derives a random offset using EFI-provided
randomness combined with the timer value, and constrains it within
CONFIG_RANDOMIZE_BASE_MAX_OFFSET.

Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the
EFI stub can select a randomized load address when KASLR is active,
while preserving the original base address behavior when KASLR is
disabled or nokaslr is specified.

Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/include/asm/efi.h         |  4 +++-
 drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
index eddc8e79b3fa..f831320efd41 100644
--- a/arch/loongarch/include/asm/efi.h
+++ b/arch/loongarch/include/asm/efi.h
@@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(void)
 	return SZ_2M;
 }
 
-#define EFI_KIMG_PREFERRED_ADDRESS	PHYSADDR(VMLINUX_LOAD_ADDRESS)
+unsigned long efi_get_kimg_kaslr_address(void);
+
+#define EFI_KIMG_PREFERRED_ADDRESS	efi_get_kimg_kaslr_address()
 
 #endif /* _ASM_LOONGARCH_EFI_H */
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 9825f5218137..51997a0e83bd 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -38,6 +38,22 @@ static efi_status_t exit_boot_func(struct efi_boot_memmap *map, void *priv)
 	return EFI_SUCCESS;
 }
 
+unsigned long efi_get_kimg_kaslr_address(void)
+{
+	unsigned int random_offset = 0;
+
+#ifdef CONFIG_RANDOMIZE_BASE
+	if (!efi_nokaslr) {
+		efi_get_random_bytes(sizeof(random_offset), (u8 *)&random_offset);
+		random_offset ^= (random_get_entropy() << 16);
+		random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - 1);
+		random_offset = ALIGN(random_offset + SZ_64K, SZ_64K);
+	}
+#endif
+
+	return PHYSADDR(VMLINUX_LOAD_ADDRESS) + random_offset;
+}
+
 unsigned long __weak kernel_entry_address(unsigned long kernel_addr,
 		efi_loaded_image_t *image)
 {
-- 
2.54.0

