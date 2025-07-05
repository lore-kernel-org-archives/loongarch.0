Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCE518FDDB
	for <loongarch@lists.linux.dev>; Sat,  5 Jul 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751702770; cv=none; b=LGfa1gsccKV6XNKLNDcZkkJ30hbVWlR83dKIi3HWu31dNn9jYNdnZ5F104Yi40YXIHa5+YFzfAlvZ4K6BzoQvl23pzFtcLqw4dnCoryfgGczy0if7m5LkfZG70Em2rxo6/WaykAUTGp/8MH2jl0M8rrLwAOT5rZ3g9KAi3NOW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751702770; c=relaxed/simple;
	bh=/inVwIYak9saPWTFKih1dwNa8gI+kgVgA0TwpJ3AEiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pc3o6T5Css0gD+0Jibwt/L8QMz572W/tuwj8w3vq9BZZs+D9dHMINiWkPDnSnMEkWKzptMy7DoQffw13tqmkRHBfU2A+HvxuD27aJBH9fPFQK4L0vLRmfFNaKgSju/dk1uGgASzWuArd6QgD3l2EWG8gymbd7gZOJLfmXOcVNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDJ/Ei6z; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDJ/Ei6z"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3121aed2435so1587494a91.2
        for <loongarch@lists.linux.dev>; Sat, 05 Jul 2025 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751702768; x=1752307568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
        b=bDJ/Ei6zoldTagUOAf49lMS/jEvnWnT8nUgYpgOrAf+3EEvnOukCGErXjBqAFK/hmu
         TaXpJ5uxsfxJiT54C/xZmNjndli0W9zX2YZ3ySVV0z0hIzbNNZwXlyQdPWHT0H0ny5GB
         TB6orBOjhKGlqx2gacaorBnE4HePdT3GTKmqJITMrZzfQwsibeQy1nIZTuz0K9IbgWaH
         vrWSk163s50fDHnnk1VhB5VC+WWM0OvCQh6UCEkwxXBVS2N+pHtIYWbsSp4/ZwxrXfFK
         Isf0rZcz8Sce6T4cCDwk29OgLpWPQ0nD0eVVskmsKI710AVvKFbKYmt6mGBz3O1W6wEJ
         QQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751702768; x=1752307568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YZ16XW5/oaudvAcjdRll9Pwcbdl4hYkpk0raAHNXFw=;
        b=EKw1tYaocUqJTAO0Vaix0DUJaSuBezcWKhwwaVIJGUCTmRkpK99R/7lqRaGWKYs7EM
         ybARH3LVcicEMofvlWH1Gp83y1Y7sr95zcUrczyfK62Lo0kHl79t5kdcdnXhI9h8zQtf
         ftCmP9NAZI0yXohIbmkT9sF4eqtehgMO8PrcZ6wtRxM13nLhISTSCDGsdz1ub6QqDonE
         uan9XIdo5VDi3saMUFQkQhuvU1Nbqs2rpsaEGr0iRPeRoXsQ1TBCOoXuPujGJxfsVifa
         LQJyz/bZPuv4OZ9RBCT8E/4C6uB20jDNvU/7hJ4xAZ9sxCmcvdYX5SDOPe8eFrZ+BfwZ
         gJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxb5D7OeE86YyKQFAUnw1+1qbFmPEDnGQeUPj9l//E4BqXpVrO6xvSMW/VER622oLZ7iE/HiTyizk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR3snKd/NspMmdKLRUI3W2kfPsWr5ymKes5H9CJ/K/fpSxyvlM
	rB9ar7Qd1ByJ4H3ZDnh5KQJaK6ixjj/zE2yAWEApSmUZyWZYw1LBkikI
X-Gm-Gg: ASbGnct7RhduJdZ0+egidR0Nmi2TTeCg54MdNfOJ1BMvr6Mbru5MrwZmkK+uIAGA8ch
	3naPzaNuXT/7VSC8+BsyW96gWg+WUBTGOikjGQwXAXca7umm0rGlAf+CRHAByWENRkXpOJyrk03
	vZba/UP/B7zrRuYBJpb7e0kxXikKlB7lVJgy0ylxt6U8QWv1XBRVxyH3qJJNGqVePRDYsehS4lE
	TNsOX+I9r3dY4/ZIo0kqPVqk8AA/GjU4ftRblKHrPreVZGL5sScx9n8mI+mwvKcWd96bys3iEY6
	w5JZwf95Mq1IfUdtQ60a040nNDVd+C4cz4K9ueFtBt1+yFQTzkfut+zWqltEyd3J/8icko3HruP
	GzeI19dc=
X-Google-Smtp-Source: AGHT+IGTWL+LXaCE0s7SVZTJw0Dw926iGaq0yWHgQOoV3X86xxB0l6u8NCO6LtHsTJv7Lmyc64Fp3Q==
X-Received: by 2002:a17:90b:1f87:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31aba8d2954mr1758967a91.23.1751702767425;
        Sat, 05 Jul 2025 01:06:07 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e3a3sm4010095a91.4.2025.07.05.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 01:06:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Han Gao <rabenda.cn@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH] drm/amdkfd: enable kfd on LoongArch systems
Date: Sat,  5 Jul 2025 16:05:40 +0800
Message-ID: <2b83380bf64a424b9cb902a20a244c3e106c4bb8.1751702072.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KFD has been confirmed that can run on LoongArch systems.
It's necessary to support CONFIG_HSA_AMD on LoongArch.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 62e88e5362e9..b2387d529bf0 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -5,7 +5,7 @@
 
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
-	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT))
+	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || (RISCV && 64BIT) || LOONGARCH)
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.47.2

