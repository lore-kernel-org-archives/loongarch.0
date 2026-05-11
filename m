Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF73D9DD7
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496401; cv=none; b=hCp1TgBEImNNBsjtpGXW/gZWsaSqnsyjp08zYyIyOcsGhxEk8h2r40bswL9ahq1sFEbSSKX8fiU2fl511Lhe5wnCgdE1kt5W+ZQKc/jEdB7Hm5X+uU/t34DBJJ6h6tq6QPKr4a+1E4+KnKnVbZ6vCcuHEiR72cT/wXy36/K8uTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496401; c=relaxed/simple;
	bh=lYLyGpAeXXin55IC09xdRLP7QiJRBHgecdSl2/SXufI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSHTzL91jnwdjPGBf1t3stgwZScRTyf3PvnL33H0tZlLDP9Hk5N7IAaX2UE2U6/m0XfYgj2AMWKqkCqGtYKpI+Dx1eZGMEHB+28mxQUCIM1Wd3TBTin4FZ6TkqGBzbT7mt2m9Gw3MxbXfnOOELk6FDOv6M2UHheB4k58QdGMBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=B8E/vtxo; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="B8E/vtxo"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-837dfccd950so1886217b3a.0
        for <loongarch@lists.linux.dev>; Mon, 11 May 2026 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1778496400; x=1779101200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS+655jFZPiMsN9BL5hVT9EfmcJYrhGbTVgUqy03Zy8=;
        b=B8E/vtxoXabniqvQBqhEzwQfkSO3DyGhnT8N6UG0ZMTPrGvR2Eb01o+BZbgnfu68zG
         h6M9sc5myc1OsRdtoDmK6PU5D4Z3Hp7fLZaUvd8LSs4aY8ADrWlcp+r83LGap5lFi2xY
         v406AiZMBFEif3N32r/XWP6shR49JiGPMk+B7kWMcysEbGPaLQ0yIWFgQZNw2iSwJ/0x
         141n5nCPcWF6Ap/7Cfh7WXe7cLz5heDfoQA9bCZFT84RYJRx14pM2/bMJ3+6WGY0a9pr
         qatHDskQFgg0Pv/ZTqXbD8acDSXzFMJG2gmzsXd38vOVD9Df3RLcjNplRqebvWRV0vhX
         EkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496400; x=1779101200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hS+655jFZPiMsN9BL5hVT9EfmcJYrhGbTVgUqy03Zy8=;
        b=Aq9WTK7lCECnomqyGX3iZVUeJNRNo0OGM0+6RPGJrcHv74T4cenFsRSxlfRDI6NJKv
         FKlOy4KMcoBrU55JwdaM8FbcgqfXp6F8ecmwzXWG7Fwo6rsvqvu31zmOAnZiP57nFYJs
         sZZGn1+6s/V4ruCmRnMMz5tIVTfH98Q/6tNIjUFvEEmDg2gMWHcSOnLpa/4fL5wvvyPk
         YsXBufRgKOSVTfRfhTOMclHnY5rQUam0yT6PaWCYgZuu6qQ5K5Oz7VoXGL5DA7Wyb6eF
         CN5aGAxCtFIcJxzwTVfitLlPdIV9HB8BlndvVWhUYJcbr0i4T8wBPn/vGjdr0VaSPF7b
         xLWA==
X-Forwarded-Encrypted: i=1; AFNElJ+BsrDGC5/BPYsuA5J0c9Gt6cWMu2VSFKEU+caOAbvBXvtCyXtW4r6nRZRRE/SsLAzDLRqP+NcKtpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO1PK0PKx445/VJeWBs1zIaHpCURHU3rrBRoPJiK617abFtAKA
	7JkhaaMP/Y/aIdzEqIjz8kZm4ZCrz4FtsgKbybTn6yNAwaLwsBlYgFhZ7aSozrH3G6E=
X-Gm-Gg: Acq92OHqKRuci7+ME1peXA9VC0yXEEszGHPxtd2ZucmR+IPPF6FlcuL2yt1tyJZDxw9
	YHXg9N0iNXnL6AUSDCkNulTQmhCYOP54HaFqYY/O6fmiY1bvzskOp5ZS6GiuOPulnzI6g14NvAV
	Mg6OVvYFCAe+B0DFY8J3pq4inkKnXQoBCF07B2IwNjswcgfQNPJFo5sepDmYK+XFRMWVN6h/XyE
	GFce+11VtnuHy1D9AxyL8tExXedcm/95wKp06Rs/DrWVQxJf4K0BjbU+xK6ieuL9aBoeCsPaKMB
	WNiGx6+Bxq2Hbq1LBG27L1kBrvhS/MU1CNgM+TC3P6RgjERJ7vIYVtuDIWOCQF/MXsrhZAPpB23
	retYola2VBdmns9qAJcqNgJKcRUn44zwrf1o6M1wo0EhToVrLhbJPz5oX1ptxIY4RiQV0lmZKQX
	YXcXH135CJlSRQtZDtnW8=
X-Received: by 2002:a05:6a00:368f:b0:82f:6e7:1527 with SMTP id d2e1a72fcca58-83a5d09a84bmr23434499b3a.23.1778496399633;
        Mon, 11 May 2026 03:46:39 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3f:344e:4435:2c77:3920])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c861esm24927599b3a.30.2026.05.11.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:46:39 -0700 (PDT)
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
	WANG Rui <r@hev.cc>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v5 1/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Mon, 11 May 2026 18:45:53 +0800
Message-ID: <20260511104555.196270-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511104555.196270-1-r@hev.cc>
References: <20260511104555.196270-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce efi_get_kimg_kaslr_address() helper to compute the preferred
kernel image load address dynamically when CONFIG_RANDOMIZE_BASE is
enabled. The function derives a random offset by using the EFI-provided
randomness combined with the timer tick value, and constrains it within
CONFIG_RANDOMIZE_BASE_MAX_OFFSET.

Update EFI_KIMG_PREFERRED_ADDRESS to call this helper so that the EFI
stub can select a randomized load address when KASLR is active, while
preserving the original base address behavior when KASLR is disabled or
"nokaslr" is specified.

Note: LoongArch can't KASLR for hibernation, so set efi_nokaslr to true
if "resume=<devname>" is explicitly specified in cmdline.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Co-authored-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WANG Rui <r@hev.cc>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/efi.h               |  4 +++-
 drivers/firmware/efi/libstub/efi-stub-helper.c |  4 ++++
 drivers/firmware/efi/libstub/loongarch.c       | 16 ++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/efi.h b/arch/loongarch/include/asm/efi.h
index eddc8e79b3fa..1ad764b18c3e 100644
--- a/arch/loongarch/include/asm/efi.h
+++ b/arch/loongarch/include/asm/efi.h
@@ -30,6 +30,8 @@ static inline unsigned long efi_get_kimg_min_align(void)
 	return SZ_2M;
 }
 
-#define EFI_KIMG_PREFERRED_ADDRESS	PHYSADDR(VMLINUX_LOAD_ADDRESS)
+unsigned long efi_get_kimg_kaslr_address(void);
+
+#define EFI_KIMG_PREFERRED_ADDRESS efi_get_kimg_kaslr_address()
 
 #endif /* _ASM_LOONGARCH_EFI_H */
diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index 7aa2f9ad2935..f27f2e1f0019 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -79,6 +79,10 @@ efi_status_t efi_parse_options(char const *cmdline)
 			efi_noinitrd = true;
 		} else if (IS_ENABLED(CONFIG_X86_64) && !strcmp(param, "no5lvl")) {
 			efi_no5lvl = true;
+		} else if (IS_ENABLED(CONFIG_LOONGARCH) &&
+			   IS_ENABLED(CONFIG_HIBERNATION) &&
+			   !strcmp(param, "resume") && val) {
+			efi_nokaslr = true; /* LoongArch can't KASLR for hibernation */
 		} else if (IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT) &&
 			   !strcmp(param, "mem_encrypt") && val) {
 			if (parse_option_str(val, "on"))
diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index f7938d5c196a..2b0c87dc9908 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -23,6 +23,22 @@ void efi_cache_sync_image(unsigned long image_base, unsigned long alloc_size)
 	asm volatile ("ibar 0" ::: "memory");
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
 struct exit_boot_struct {
 	efi_memory_desc_t	*runtime_map;
 	int			runtime_entry_count;
-- 
2.54.0

