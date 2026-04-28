Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A16133F5A0
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 04:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348951; cv=none; b=Nk4YV8LcusXEzc5eJ6zzZDlJEvjAW5j9cS0P5WwgsZALMUVjI9eS0R8ywoztN8iekOwFmwoOZ7s3nXqFUWxKJdorXAvLF194WwJntRDeh2miYTUGPKzpioOMNYB8xa+HeRXLLufs3/kbtIWV7rOFmyF9P/6vsLYOp9HREammJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348951; c=relaxed/simple;
	bh=BBDy81e7f+H5HTwVt9xBxcupTBb51CUnDJ6rTPApRes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkLC1VrNeSAgqK8YampUVC9L5q+993Be+gBBdNDpsTlCWXqY/X4Ud+seS0bjb1V2UQufvwt4JYP73TFJFwK+kfaWHTQPjoBxvf+3/eJQiSDRu3OtXikyz5NDHSDM75gnXw7KrPRjqaPvB1iSTcvblx809x1dFo8hRwydy9JVE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=CaDlRHYm; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="CaDlRHYm"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c795f441ff7so7548289a12.2
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 21:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777348950; x=1777953750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+xcb2ORv56/m7G9kcRuXp28eD7jaH11XygDbCbx8JY=;
        b=CaDlRHYmLIaSiLd2D7TErJYva/Ygmtr4uOwTUoAJ/exZInhMf63bLr1Xh/I0/BXxDz
         /DronsA96tpzbbyQaICi49ESFQKFKtjkP4cz3US1DeQhefaR51sp/zIo22O/vTG+ylMp
         XwRpOxvTVHXsnB9nHvEouri0cqat0kQs3xJ7EAVo9zs+djii8t8inM+/kKTqOpzJwTgV
         zm9wxLM/5Jqd0R9gh3773+yT0kCgcDnsMtScIDhZ586SAdCIDceKbkHqEearYmjnRate
         Betb1RwIRCFOttdhgqKW8Aj82/vrs2cj8oqAdhwMHYnbLQSf3cTOaoQ236+ofMFD8kn9
         VjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348950; x=1777953750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+xcb2ORv56/m7G9kcRuXp28eD7jaH11XygDbCbx8JY=;
        b=MNiaOuYJDW1r4O3iDmQq/q4vkvMCik5uiLrG3XqlDO/OsNg6OfNx4FAE/nEsOyEwb9
         sGmcq/D3a3tthvRn8FfeWbxHshc29FI2rgV4ft9Gzxref/G6QiO/Dq6J05A76DsSbIfX
         KtlurOLbYuzeV2PFOItWDhtZYGsJ4sqgfMVEzInEnBrCkEpkdkj39ymUUfajs3FClx6w
         Aztjx60WOHsDC4KTMa2P0Quk/I7OQQ+xvM66KoCP8j6foQ9cn1TzYD+DHgu+TCq6RJ9K
         PXT6Soyeft7LhmnHz1d/F3bmfEMtd43Eax9Ryafz2n94L7PUI8XmV+cI6etslYxI4bXd
         ITtg==
X-Forwarded-Encrypted: i=1; AFNElJ9p32cEjiSpEF1UqH13wXotIs9JtuJLMjPu8UjWmpesV+m3sEnWmYsOl7Civ7ZwAh76EOAnNKop6XY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh5NNH2HUCJ9git4u9bYH/nS/3UktddXwSBNxc4ArV0wN8Pej0
	SSSoP6/4JrU/d1P9OWCiQNK2M4nNQAUcVt61aAmV8yqYeZdV912hNBt5hinYfZJqQtE=
X-Gm-Gg: AeBDiesZgK1unHke5yJIj+3MSSpprpd1xaEQJtvtn1zBAE/p8oXokFuRG6CCZMCf4sQ
	P9YFHpcGYOCtSwtcbAOfs3QGxkrmt8uF65WEIeA3RGD3PbjALDmrU7NsL+dLMtksxgfvma2q9aD
	x9nUe3s3D0c2SsucOnhAN0sQ84LGJwKAVNVvPj/Cu04w4xX0HvR3J5qnJ9qEDLxtQ21MHPn9xk/
	wELUFptED337frFeoVKo1KoME7sp3lUpiRPXni+ImBUHAu/DKQl7ZUDDAbIH+288xKbJ7ahq6aG
	MG3a4OpfaujLfBdNsrE4D4hd6bIFLhhgwnbDgAw+jcB1wzs2iKjnQy7FtIT/tbjYdaOQBecTbMi
	bRQ1f7QpvKdVpIT5Ko85+iptkuYe12Kwu7Vze86q9Jgq7m6noySGqvCG/nnqtZIrTGZxEISGrqT
	UaguXTW4NIa69+w4gyjQ==
X-Received: by 2002:a17:903:1aa4:b0:2b9:7051:2c18 with SMTP id d9443c01a7336-2b97c039e5fmr13515095ad.0.1777348949793;
        Mon, 27 Apr 2026 21:02:29 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cd29sm10131365ad.61.2026.04.27.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 21:02:29 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v2 1/2] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Tue, 28 Apr 2026 12:01:58 +0800
Message-ID: <20260428040159.1065822-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428040159.1065822-1-r@hev.cc>
References: <20260428040159.1065822-1-r@hev.cc>
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
index 9825f5218137..c44be5d3dc04 100644
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

