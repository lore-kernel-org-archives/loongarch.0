Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0713B531B
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286865; cv=none; b=Bsu0GiOsKuaSCs3dXDUxS+N/VCvkelgMaAvWs3e1MkZl4YFYsOe7GTZ0qElxc1eBlDedqi5E+bxxf6G9fTG0CjKuTtPpYuRMz0t/wfR3rjwz3LdmQ/su3h+FF+PJonnJ04vOtmuy7WtF4VD7363A42mueBRBh/tjUEna+M5rNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286865; c=relaxed/simple;
	bh=MK9MxhznQ/DE9fRBF+ryEug0t7fwbSkm35OOxaXAc7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0AkSH4uSgjxpTRMTOve4OmxZgIte5mMHERS3FGUzPQ3VlRwmr8j2g9fSHGc10eWdOCDJCyZ/WIz6mc7p7jl4cNutGTHZtwO3T8HGxN0ILmr6umGanT+DfN3KufQx5MSAjrqOSsLY180cyqU6Yr+mykadCAtu7i9IjWSWPl3qfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=wTEJ/oHL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="wTEJ/oHL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so6559667a91.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777286863; x=1777891663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIBge1O7GywppeH3FxYzvTz5haKfwUyb1lL4zzJi9B4=;
        b=wTEJ/oHLf2G+I+8LYoBOMyu6HM7XiS2Nr7/RNC3QyoACuZ9hpF+Xy4nbx/pKcTA/Nt
         nLwAwD6jvJgB8p2/sjrqwZLBqZaEypfGfXd5WIrffsIccza/rehcAMyqwTj04PTV1JQW
         yjTnq2zc/jtiwtsUkL3Y6wRH510l58Vqn6U6E+ARIvrFhwBh7tt+K902qWOJKdkdLl6G
         wrqZBunm2vPYKJjHHE4tebUKTBHkE8WwZi8KkWfwYOjbXklmTN528TL8kkxFSyJ4l8nR
         ukk8D77eE7ua7EBv1Gr8nTEH/ycfzVtVrXupT5D107mk2sDaFUiY9MoXtST7p4jFzlMW
         aFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286863; x=1777891663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIBge1O7GywppeH3FxYzvTz5haKfwUyb1lL4zzJi9B4=;
        b=khYmQ5X/mXiydH4s+qUh2wE7kFxNlp5M91qk4U2h6yBYO/gF0ZZkIH9rFVW70ZngkW
         sWnqiI+iO3BG0BJVNmUq4FnnafxU/7+Jiv2W22b1lDMrBZESa969uf0V2gH9hoidVxRP
         IYNrQcijYyAQSDN58kvxfQy5kQGDdM7KWO7VZcQKl8bLavtU2MGS5wbl9eVS5obe7AQ3
         /D+9HkfvPVJSjcUHnUumqMMZ0LaGRX4nWZ2eFYGPiAzorUwVJRR5hz7wlgm+VweAYr1Z
         pfUlTNw47As9UmlHBxJjlHSov6R7VDQXLTccqLB1OOceaKPEmLffFfYiK+W0W2zPjjNu
         BL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ86l22EfhhxvtMAsue2UTK522tp/HA6gqz0wFRM+9yyTGi3SWKPAIDen4e/OxGXqE8LpntFfht18Jw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGJH5n7CTIDnbYR9A/JG9x5zmuC/05uObgZoRQVYPF/lK5edQS
	ee+7NfIoLBTkZHAyEA7qPLbfDmwL6Xj6LBvYLkAaHhevFZxayGVsy7pPx0gf1M2/hOI=
X-Gm-Gg: AeBDieuoxqOe+8ZkrzSQ4XXNzi4xCutBv+NAZsinf7vK4yQQHMR0iu3VzRIYci2gZTK
	nNJ6T3EbEbYWXEzCsxIx8zJb4yNMti3EH3ClobLMgjKXR1QYbmh7kZ0dPUkGiXWNijZ3f8QTAp2
	quFu1g8+0X3ZcNoiJ+f4LYzcHOE7R1x9BfpnfsrisgbEsjWJNJigHAfioj3b6tK28zCu99lIP2j
	dJgmbolpdOwLgxfQ2oUMMX9XAxCO8AYt+RwtbKTrwh7+nFpcBrKT05J7hpxmhA5TWS6DIG446kS
	yYZEWW1xGV9RNxLnOTYsqDXHCnD2el37nI+ekqig1J0GfR8dsXT9xclpMGgT+bwd/VYTI7OQtHW
	KwL7SYQTbSu95ZcC1f4Wt44dXcH5wf7nG9LtPxEhaztEPumESqkr0uFnI+9I+ybzoGHDQensoJ0
	EY+mjokrlGMII=
X-Received: by 2002:a17:90b:2e46:b0:359:8dfd:64c8 with SMTP id 98e67ed59e1d1-361404a81e0mr41584514a91.24.1777286863074;
        Mon, 27 Apr 2026 03:47:43 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-362dde4ccbfsm16227029a91.1.2026.04.27.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:47:42 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH 2/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Mon, 27 Apr 2026 18:47:20 +0800
Message-ID: <20260427104721.47724-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427104721.47724-1-r@hev.cc>
References: <20260427104721.47724-1-r@hev.cc>
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
 arch/loongarch/Kconfig                   |  2 +-
 arch/loongarch/include/asm/efi.h         |  4 +++-
 drivers/firmware/efi/libstub/loongarch.c | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 3b042dbb2c41..a5afb70f73d9 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -730,7 +730,7 @@ config RANDOMIZE_BASE
 config RANDOMIZE_BASE_MAX_OFFSET
 	hex "Maximum KASLR offset" if EXPERT
 	depends on RANDOMIZE_BASE
-	range 0x0 0x10000000
+	range 0x20000 0x10000000
 	default "0x01000000"
 	help
 	  When KASLR is active, this provides the maximum offset that will
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
index 9825f5218137..df67ef8c68ab 100644
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
+		random_offset ^= (rdtime_l() << 16);
+		random_offset &= (CONFIG_RANDOMIZE_BASE_MAX_OFFSET - SZ_64K - 1);
+		random_offset = ALIGN(random_offset, SZ_64K) + SZ_64K;
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

