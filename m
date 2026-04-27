Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C039C00F
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279196; cv=none; b=rY73MKixgnGN6UVIH83ylSNo+ZEflXyNWDCUEX4+W00Yqhukdh8go+js5l5+xk20dV6fk9qk+/4Iwx7QklfdBS+7jgWEuI6SQPws/Fl9fGtEMI9atTTQv8x+QDOnhc5QHl9B5f+PBPDGYf/VJV0yBCvGF4eAXD8EyY5pULCN7TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279196; c=relaxed/simple;
	bh=UFnN0s+RsvkTALfr/a8OQyrxAQCThTQXJhV/kjv+G6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMZ+fBVjQhG3hIgoePxRgJmzuGild5Xn7CGzjNt0+5ducpRaGySVCnkIDiWpOa6pOi/kRdpSvZMeczXl0Hi54ydqx6qLfYpIilYI9SJeWBRXYfO3faM3C9jIfFl6H8Zm2lTCZGW6OwCJuHhMfnBh2wUyxI2xVX/Ya9k5XOkbIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=c5XT3pyt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="c5XT3pyt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b941cd869cso9937985ad.1
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279194; x=1777883994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKHydH/fhv4hYoRFTuRlPVbogNTqYgaWcyoMFBpB6F8=;
        b=c5XT3pytUMVgh8kIR4gXXzQWM450pfRWiJ64CJbta3ICuiU++UYICy8TMczHV0AtWr
         zcsYMsh+s6Ssi13nV1UgDLVcydwKFoDy2Iyvpkheb6kQurGXEmaQTU264il17j+LjrJ0
         qdox4XxLJrwoYf4nkwOEeu5cUj8JLWG+gDTr1T8nbrspANkpSg7u+cbu1cH9+JSkTiOe
         SGACfFwZckUxfSMfPJK/O6nEJOgAB++CpjdLZum3KrMNZJFQamvTWKDhFmnOvfJhfU3+
         kPfpGH8dioEOHAr0/Ux4fDvj1RhoMFeIHJYhBeKqhWgaYQwUtt9/3sN3jRj9hqaHKa1K
         IIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279194; x=1777883994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKHydH/fhv4hYoRFTuRlPVbogNTqYgaWcyoMFBpB6F8=;
        b=ZTF9XGphqaSO2cCrn0BIZL/+gxTMV4z+cmOzNG2L5mCuHyS9zA9Npf7Yg/lyuYdIe2
         xWYU59iz9+1x2usf938bMyYX432vIZesxfe8SOiyOMNV3rU8PmOlOUM60bwufqdobYfV
         L8cwNH8ObgLdNhv0+Lz5FGJF6YH2ZvyfvvThS2gzV1ypecGCr4IP0iH3AntYbO5UmBC5
         Qynu943Co+KHFCQfUDsffdN2FrSeucdh+hZgFeAXctfAWfv20/gDrnSds/lnbAoIfzJ6
         adKGsicnlGGzUsgq7eyggqZeABi2LjMjQuP0nWypAPSsfdvUjRartjHlGfyp8UJiUEsj
         bFQA==
X-Forwarded-Encrypted: i=1; AFNElJ/GL2ZvpV2ktcs/tGlXBJp9+bcp6igP/O823Hbq2l4ZWlegKfFqQJkjP8oWon5tCNeGEo/2uhVXkc8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4A93vLIG64ZtfEqT/vym0xSPuE/Osa7oSuKq061yMD92k4UdF
	F4mXG8K9jrGSkSrigUNRzC5DW/c3ErNx0/gNU4+kttOEeYA6RHW8li3vKFTLhtOXZyE=
X-Gm-Gg: AeBDievKnCPnZYwIgjcQ0v26XFfdZ6HQakwfhDzDrCeJb1EEkTRVqWSTljTxickzinL
	frhRLLgT0FpZU3d1OnUyurSmA9bP7ZMxNxi7zh1CRQFWhgrqcsLOgBlqoDnBDZSuG20oedtomdB
	gS8zyYwIVzLvYk8xqvGpqkFtrwF9xB97nmNdwaCOShUmCVwSVTuUHT/2OQ05YM5TAfh3MyrfSNy
	OmxxSzFnFkB8L8/B2/PLS1YHKF2wWrv98f8y3Rhpu4Ch+Ffx7SYcOoOqF8oOqfkOCoGS22gFPFw
	qcWcy1XGaNw6W2+37Tf5txpGRRVsS/WRA42SaRqf6iYt1mIrfmLXrhOyUMvzPU7CmxPoFC+XCxE
	H64mcVqbc5zJ04LQLv88b7XwbPzsWIpbm4TFzA3hPbWh5KvmUtyeZmhGOjJOBueHgeyo9V+H3gj
	QBzDni67w1XHI=
X-Received: by 2002:a17:903:28f:b0:2b4:5309:2c14 with SMTP id d9443c01a7336-2b5f9f3ad64mr471009225ad.31.1777279194102;
        Mon, 27 Apr 2026 01:39:54 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm276063105ad.77.2026.04.27.01.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:39:53 -0700 (PDT)
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
Subject: [PATCH v2 1/2] efi/loongarch: Implement efi_cache_sync_image
Date: Mon, 27 Apr 2026 16:39:29 +0800
Message-ID: <20260427083930.36324-2-r@hev.cc>
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

