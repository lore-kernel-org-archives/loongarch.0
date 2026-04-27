Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F453A1A44
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279664; cv=none; b=A343qKtnMi1hhqbxsROxVwPFE6vB3b9S8TN3LYnOuT0I0hSo0PqCnbSNBax6T8mlSdBIdB8Iyz5l+58FBiTw6asu0lbhKtMjtuxyeby0O7xRwgl3odolQoKS0wMdvjtXA6Ly2/HcBcy5LVhtobyeDYBEN8yMhBaUAkNLHc4L+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279664; c=relaxed/simple;
	bh=UFnN0s+RsvkTALfr/a8OQyrxAQCThTQXJhV/kjv+G6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwfZE2S0Ia12ChnGx5RdRwIBsXqSUzMr0ZE1SpPz9d1oTedRobXtp4xFjgpw1AEoOafd9Y9cY5fsvZewHRkTtyc5xPKHN0g6eC83vR1SprjkvDdKa0Cczi3wUNGa/21VE4tJzdPe16082YJh9+Fklp6dNF/IXjdj8PysQ+fjss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=cw2GF0FP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="cw2GF0FP"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b9705613ddso1831005ad.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279662; x=1777884462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKHydH/fhv4hYoRFTuRlPVbogNTqYgaWcyoMFBpB6F8=;
        b=cw2GF0FPvUWRmzE7mTvXJ1mk2WCoD8EKxx2H2uBAjZjNH7IEz0vP5X+mSLgBT5bqXY
         pvIL+Qe4cWDtyhjXAeMBnXfQWMaEVQiTnIdHXyH5eskBrmmrTTW3oh8EFLAQlt+hdqVD
         KzBPndH9X2ds7O+6+4UP4+kpayHdnJGL6MwiiOsBc37XafVcC9iAVUFQNuwzKvfkVf+o
         9KcZbHP/2avZ0DHTa9cVBNkjPN+ruBzZnSoGcbuyfQKkBnwSC5oUPLDWcJmpxCmE6lbe
         1HmhKi4FBjMnSUP6YJlGwuhp+F65NfeO8mJapr+soUabICgSYikAS/i0bjALU0WXhJ9W
         jLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279662; x=1777884462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKHydH/fhv4hYoRFTuRlPVbogNTqYgaWcyoMFBpB6F8=;
        b=CxHUKhC4fAFyK82KKdVdI/8Rwg1LpgcPlHr+kd3WGG2XaOBF9Y3nQM/7MZAndkofSQ
         jyUOh4KZvYid7ufJrthDmu+XhuylaRP8KcGUKpHmq97gjLdB0eTD9lKFm/27K6Ckcqks
         RY2DgBA2hfzJBRO8t95GQCelHDdYe+sqUupCDgh8+4a4J6ZWtHtc176o/n9xjPpPdri6
         0wl/o2dr7Ib2lZQpzKto3yfY40Bu43FBM9Ll/ELTrLzuDYLGHbg2pvZ8yx+8XEQU80fU
         AMoJ7Dn3hgGEfRxMlKU9fS+bXTa3qSBsFMC2jphrBrHTEPoInpXX3DWsR3GTV++RNCMD
         Bdrw==
X-Forwarded-Encrypted: i=1; AFNElJ/v3E3Y2k7fAsV+MoRr834Qcz8b/Y07FH6myoieC52VzayzI4+GVFdTCXrhEF9HLTQvYXzT/y5E8nM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMobaHZDPzXOYhzdv8SuXB42cKOSLGXXl+TbzmJogQWsCZHH0S
	5IKWJCbBq46pqOHH/E7SCpwwmRj8GtIux7Omac1F2tvTaNb6ufamFuebELEQVTjUUt0=
X-Gm-Gg: AeBDieudPa2yzPlDfQ4WVxz+uSp73zTGocWe2LymPSk2Ldy8ZpGMgZzIeY4uPE8RLnt
	rus3rvrrDK6TPNBLMjw0O+0qr9kYlSX4YDRcR+/hN7bVphbdOqrhf8l34qMOxnrFRXc8oRhigTr
	3JQAPc/0dOot5j9bVyFEvsJVKaj5uCdRpEx/gu1ufefEbthRlBYVovNB2/fI9e0ix64BVbnFPaV
	VOZdy46HGxaTMJxBGBXETFuG7l2mvBs6GV6Z36jlZr6hezczA55+rnvr70n1PtTDH8G6Md166NS
	9TKLLMRnRXwrv07Vfvtv5BGYA9UXtMqQPHqo91hOQmumgqdpy14RTt1ePAfxyv7TGnF+O5J1Sl2
	wHMZeISzLAUG/Z+aY+Z9KsurQKm6Sh7RV0Wu1S9r+LHGydd/jOVzcmN+rCrHENxxYPSIjd/ws+Y
	hge+w2jtT2aGV74QxIzMmHpA==
X-Received: by 2002:a17:902:cec6:b0:2b0:917c:bc4 with SMTP id d9443c01a7336-2b5f9e8e3c0mr473300875ad.4.1777279662059;
        Mon, 27 Apr 2026 01:47:42 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm291703215ad.72.2026.04.27.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:47:41 -0700 (PDT)
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
Subject: [RESEND PATCH v2 1/2] efi/loongarch: Implement efi_cache_sync_image()
Date: Mon, 27 Apr 2026 16:47:20 +0800
Message-ID: <20260427084721.40535-2-r@hev.cc>
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

Provide a LoongArch implementation of efi_cache_sync_image() to ensure
instruction cache coherency after the kernel image is relocated.

Signed-off-by: WANG Rui <r@hev.cc>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/firmware/efi/libstub/loongarch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/efi/libstub/loongarch.c b/drivers/firmware/efi/libstub/loongarch.c
index 9825f5218137..f7938d5c196a 100644
--- a/drivers/firmware/efi/libstub/loongarch.c
+++ b/drivers/firmware/efi/libstub/loongarch.c
@@ -18,6 +18,11 @@ efi_status_t check_platform_features(void)
 	return EFI_SUCCESS;
 }
 
+void efi_cache_sync_image(unsigned long image_base, unsigned long alloc_size)
+{
+	asm volatile ("ibar 0" ::: "memory");
+}
+
 struct exit_boot_struct {
 	efi_memory_desc_t	*runtime_map;
 	int			runtime_entry_count;
-- 
2.54.0

