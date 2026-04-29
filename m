Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326B3F65F2
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464221; cv=none; b=UjvLPpdL4hh5ofLpKUY42CH4f6ehQmh/ItQFDLPMzWixQhfB/fEu73+AiwTADJyFO+N1SV6zvz4HJiyeLCazEwoeGCfpmY4XFiQw6bzAfa3sxg2cFPeJSUmG+3FJ2jUktMVBdUbh/R882aiqLse4Hc++9KvGxE+ayMvOPjXSkD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464221; c=relaxed/simple;
	bh=B2X2RPQv8ZrL3d489WU0ngl6i9tgLyFWZKtm0iXeYVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dL2blLls73w3CyKfcIYj1JYHR6XkTpOiWojFbNEyUSvpW1RE6E7tSBLmcuMkOcixYvq47XfF5i/+9HqElJL5p6rtf1vQR5rIi7mtj0Npv+5e3jcDet5kYlV/NRPK7aLMQ08jVURo60ANmQdLSksnsHdQ92j/ieMoc20DE/B5EBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=vxRlef/n; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="vxRlef/n"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f8cebc935so5433071b3a.0
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777464220; x=1778069020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj3F3gFjpGG2RrkSlaKuTLLorI2CDb5ydvcn8Xu7mtk=;
        b=vxRlef/n2ka2jjWXK8fYmxMgVipF3btn5mx+pWM2WciGEC+0UurcBnyBKe0fbUa4/A
         EDRrOYTvJLBLYmufz3GdUyhqncQLOgpXBlvO+Y51Z5gIOxST6DRnO/dJjLXTw6Jx9u/f
         YtIg4gzDsurYelkvbE+uqpNSxdw/RtHZ4nQ6GPhP3GG3GHe0NFvF/KNrEoR1YucYPNWf
         X2dzM0w4ZnmrmJFGEYzxFh5fpCoXqMpRfdc8BGt24sk9dBv6FHwzy+vZZGCm+YOpn952
         d3wkdqDr7MnBCOSnE+fBkVddqzQnVyc9Z05bEyC4QCa4oykj1fO9+apYPv+cfe5iuxC4
         VgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464220; x=1778069020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yj3F3gFjpGG2RrkSlaKuTLLorI2CDb5ydvcn8Xu7mtk=;
        b=a52Jmu37BHNAHMze+bCOemc1hhAUKZFNslmh/3b1Q64o0u5nHjYk0yl5wmkeDWfp5Y
         GJRItr0atHokea4drQ4rh8t23BoOzlq13pUkvFOhFful9l6IwnO+2Jb43bHmdkrDwduT
         Ocy4BkOK26hWVZBczMuaOhEAdEOR+5aWgybCQ8gaAYpVQ2rLn5k6iOHhWgSsl+qabJfl
         aWhhqVdY+2JvMCFroTNDkzleGvZbAXxQOvyHGKV5hZVaaXM+6x8STe/0eJU/KIhSFDvO
         9j8BEYbKyQF3n1oL/P3rvWrXWSg7PlkQj96Gc7BQRJQSDSPiTJsrUN3bxsgH67cuKfKW
         jYiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GXOP8b5wmGtzdS+mAcvErEzNUV83s504pWcuLLF0l2vDzWYsXUMVI0MFPhzWw7wraxDKVmSXrrTU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvFG8faEMZ8aefzs1ndqg1WBQRYfKs6aLiTVRkNFagMei9isZV
	U1y+dBhYpajN842ZjKjeiDv4+PNz4b0saL45Jj5wEZLkeJE1v2thtXcjz/tDbRzQi8MpKIqVpVd
	LxvJzXcw=
X-Gm-Gg: AeBDieudP13JGgl3IlX7AZG4n6UtF2dsAWcfo0moN5iOyisj65qDCPZ9Tk91jrlXxJI
	YvN81+z8itepe8VjgqastgsEc0t4rBGaVoAaO5I12vgbg6bbJBRdEywYSknWPbOY9LIpJdeR92u
	u9Gw1/OkuhiXBAB3+e33DiBZmHkoqgJePKm7UPYGrRnytgsGu5pQWALRt0tFVFPmSuH8dk4JXbD
	xiLJz9lX3VEW6mBAX06S85QthEFbxY7SU8+IusCFMxI1dcaAPbJgbLkWuz68A3KhuSNrLk9ODNF
	X5ipA1hmkRuRMb0YcduaGwHjSYMfmzbVWN9QAdgSkkY5cVFGQ2XYLZfHv8dBpTvfVxQXyjlvoWe
	pOAdBGrH1pMCJoKLt49be9/mD2gMH5quFHxznkGMzd15Mqo2F0ZfJc0xr2V1ew11PM+/6U6DZ7W
	vE0C1YIufAXwIh8d9L9Q==
X-Received: by 2002:a05:6a00:408d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-834ea5688acmr3462864b3a.9.1777464219832;
        Wed, 29 Apr 2026 05:03:39 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5efaaasm2016493b3a.27.2026.04.29.05.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:03:39 -0700 (PDT)
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
Subject: [PATCH v4 1/3] efi/loongarch: Randomize kernel preferred address for KASLR
Date: Wed, 29 Apr 2026 20:02:58 +0800
Message-ID: <20260429120300.1786210-2-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429120300.1786210-1-r@hev.cc>
References: <20260429120300.1786210-1-r@hev.cc>
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

Acked-by: Ard Biesheuvel <ardb@kernel.org>
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

