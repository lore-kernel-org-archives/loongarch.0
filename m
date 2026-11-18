Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026141;
	b=K5zAh+IDlqDjQ6CWwMk4lJjK0yqPIyR3DVJA8x01xfSeHbCLbueF0YcUl0HnfBpZpamy
	 xD/sNxpuSM6N9hkpWXorXlRVKghBtbGtT0l08W8aiXm116+iuYdpw3AloCt1ekWPecdlc
	 F4zeB7ETrX2ABG6oTMpaySs6RYzU2Oi2MisMZmxtwBSvgx7AUoSyHDFimbY8CP3Rk9/3m
	 HnXFcwqzvUHvwLHTjhObjXHWKDFX/5OtbSTJ80Zx7xsAhuppMk7T2ksx+9as5rV9HAy8F
	 lFyxjkY9kIi3qubC1nfoALv5Ftahc+YtK3TVQWCFaF1VlgznZgmQZB7y1Jwd3+OeyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
	b=DQ2qG95w9NfDCbYi42MZWrASZfM7GC8mWld8f2xB7hpfFrUo21+njcbmrbEUv+XIue9I
	 hShsKqP9Yef90ylo2jShXZiDrxb4tzwSlY7iapjiydbe9vl5ic4EysLe5+iMcPGIfxMxQ
	 Z2pZVZF6yYCqwDbnKbbUHCWFUJCwOBW8fA8bkhbTX0abOimszU4GDapam477UIiK70sus
	 OzxlwRYREirYEo6W03zh3TN7c2/tJoqDewIwMzAWhknFVuWEJHsNhUa/kqhLNrxUdWsGz
	 plwYAXyxzx/uq+YMxvsMeotPwQRdD/tosZQDi/AaJhpn5WICr5YXqe0Up1Q9DvHavEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXyQSkGS;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A133606A32A
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A133606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXyQSkGS
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb818d8dcfso2969395e9.3
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026140; x=1795630940; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=VXyQSkGSc7ohkYfn6nZRUax6ZFDOU2ylquOydoCggb+xmLLkU/A3LHrIyornvBA2Zl
         EdM1jlKNZc0IueAIu3EcSZdMDsZDD/mDJGACsnLuOArpJE471P2v3TqXpn7PHhlK4Ew2
         IsH9a7NqVveD1OO55rBne8a8ZdpkUtDGO4JuM3aZytnU/rLukFBbcRwGEuMjOLByZJQY
         Qz8IdaV2aGvnSNvGDcKjA5yQpz8SUPRj6ijHrVjrAmb+nPEuHWcyJxwO6XrxaqgyxMOG
         IRo95yj2+f+AZVSZ6KK+3nzaPTz3fiOjPF2wGOMavelflbzJZA1d/AJugbzW9uOxfgeL
         MsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026140; x=1795630940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uw6eSasL1b/vj1BX3jiErELTDd2rhnZAcbAAr5FXR4=;
        b=JBfpH0QDRM4hT3w2b/cyD/3EDcKpqdJnohhRotiXV8bAv+Qt3zfvzR0A87YHbCTfI0
         kDjM0LttoO6m0fXGj/AcDN7dexzMdLCwyemVnRrpBuxfUZJ292EoKdCNVxm02BYXYAd2
         XmIKTC9zKMH9Z3Ge1+7JtJxS0x32SKRQtsYGwPegvDd22Myrkn/IRlg3BJnqUPOT7dtD
         rPhruGWBfQKuwZKv379OUhNPYNWszyiCV5gZ9hOKUiyGKlCWovXdZ9+fNO005lHStINh
         KChNY8yUDSCTr+FUER/tkKPxZIL7lON0nO81OXpMhc3BJQEsAXgNIIZSHYDv4Jm/rL28
         e3ug==
X-Forwarded-Encrypted: i=1; AL+hErGRClsPYnnA/YgoXztXVwmAYntUdVkR6ava4SQ2hWrHsVopqszH+YbcFi0mlZ3TYssmZ/BN7Z9yU7g=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NmxJDmMZOtf9ozk4oKAHQPh0r7GuoAgoUgeA9C3ZhyicDAqBB
	dB00hlzyYF6V5OXIDt2bwKq++kU3yjrFUGufPlUYy1tdMNe86OVLYs4yLhvO5+AsGMaOsTnfMg=
	=
X-Received: from wmdn7.prod.google.com ([2002:a05:600c:2947:b0:4a2:8ef:a5af])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a4b:b0:4a2:59:f568
 with SMTP id 5b1f17b1804b1-4bb7da12963mr69266665e9.14.1795026139303; Wed, 18
 Nov 2026 10:22:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:25 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=ardb@kernel.org;
 h=from:subject; bh=iMPCb+Keab2MgLv3M4zpVvDMgTGioYSkOer/TnS5abo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm7XCHZeeHX8f+DPD6s/EiYutrt4v2FF5+G3G5ovFp
 gkTt/vzd5SyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJrGViZNj06n4gj8DV5D38
 0+a2fkhoXPTgWswsFkENBVf2sAsbVv5j+CunwqFvkPC1JSbr9sY1t0SfFbxp3j7/ep6t8usHajm MT3gA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-40-ardb+git@google.com>
Subject: [PATCH v4 19/19] Revert "efi: earlycon: Reprobe after parsing config tables"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit 8b3a149db461d3286d1e211112de3b44ccaeaf71.

That commit added logic to probe the EFI framebuffer earlycon again after
the EFI configuration tables have been parsed, as the primary display
information may not have been available yet when the earlycon= early
parameter was processed.

Now that only ARM uses a configuration table to pass the primary display
information to the core kernel, and the EFI framebuffer earlycon is not
supported on ARM, the reprobe logic no longer has any callers. So revert
it.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 16 +++-------------
 include/linux/efi.h             |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..997f69ce46cb 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -216,14 +216,6 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 	}
 }
 
-static bool __initdata fb_probed;
-
-void __init efi_earlycon_reprobe(void)
-{
-	if (fb_probed)
-		setup_earlycon("efifb");
-}
-
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -231,17 +223,15 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	u16 xres, yres;
 	u32 i;
 
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
-		fb_probed = true;
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
-	}
 
 	fb_base = si->lfb_base;
 	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
 		fb_base |= (u64)si->ext_lfb_base << 32;
 
+	fb_wb = opt && !strcmp(opt, "ram");
+
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..4a809c6ae724 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -719,7 +719,6 @@ efi_guid_to_str(const efi_guid_t *guid, char *out)
 }
 
 extern void efi_init (void);
-extern void efi_earlycon_reprobe(void);
 #ifdef CONFIG_EFI
 extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
 #else
-- 
2.56.1.708.g77570a6a1d-goog

