Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0531C3A
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 14:49:55 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 136so2655948pfy.10
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 07:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqMb0KOfCroCHzZCRJBLoaGqIjZaAOZQcoQFpuniEAU=;
        b=iqElCf2nLVHzYVAdYWrLj9kQextoXw5/lM+F1TrQfsSfGKjgi8lnLpOwnB8oGPInNS
         2HbTjmKn9yHrrg4564kJ9H4NSE5IoLMmOcinGFBOdE3zHBUvPC3BElf5rulEJAr/uxZn
         sSDg7b29yWNE8Xt/PNkP44W69DRPmYl+3GYLoIF95//PIE2BKJSGnMRWMVQYbEnzGC/u
         u1qdEeaWdnUT5d3H+PnT+SHZ3SOG9iJLIwShR2K5Xp9yfJR3m0vxjVvacRYVV81TN4We
         aE+tdwu2GLaud/0R484BiVW7Viil9KBY896PDMiV3wDLU/BfmkSt5m/otBS09eIWBZD6
         DZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=pqMb0KOfCroCHzZCRJBLoaGqIjZaAOZQcoQFpuniEAU=;
        b=vTZTBqUqEn+PjzB/Zt+eAEb0Y++kxBwgKnNCoEDDpl/QP1QzKh/W6uQ75+PeShyFP9
         ha38q9WEyful6FGlb63VhcpRhxdNvyOeR+oLFUhj1rQ9QrYn14HTwvMh68USvGRneHjL
         2f3fk90lj2Ul27cEf4yaE1IphLNv8xhzIiMtbVeL0vlaCWyRQIr4U/wrfx/kyFduuJEG
         3AEO4WZqy9GoMC1ZLxQo1pX+ofJgyVHRHcVkC8SoGUI4LNtWRRMc5wq63+Ea7+6BiFCw
         rYuNOFYHDrykkHzfWjNuy3acLBUgKB5wNKNbCliq5wR0Y/LBBCs8xGCmRXOArEursN1k
         sdkQ==
X-Gm-Message-State: AJIora+0I9hqPUHAjj6FACcrmGUTNPO5EffpziiRbf5vZBW2tQdTuO8J
	rDPrI9FP5RHvS/1Z7rQnupc=
X-Google-Smtp-Source: AGRyM1ujzX4+2snf9JEZCHKobVnV3AXYNXLy92oxBVRgTjHFoVbs3ApNGjl8YMTkNld0kiTaPllBbA==
X-Received: by 2002:a05:6a00:3486:b0:527:ca02:8e24 with SMTP id cp6-20020a056a00348600b00527ca028e24mr19200977pfb.34.1656686995529;
        Fri, 01 Jul 2022 07:49:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 70-20020a621849000000b0051bb79437f7sm15747872pfy.37.2022.07.01.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:49:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/3] LoongArch: Always select EFI
Date: Fri,  1 Jul 2022 07:49:46 -0700
Message-Id: <20220701144946.2528972-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220701144946.2528972-1-linux@roeck-us.net>
References: <20220701144946.2528972-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building loongarch:allnoconfig or loongarch:tinyconfig fails with the
following error.

loongarch64-linux-gnu-ld: arch/loongarch/kernel/env.o: in function `init_environ':
env.c:(.init.text+0xe4): undefined reference to `efi'
loongarch64-linux-gnu-ld: env.c:(.init.text+0xe8): undefined reference to `efi'
loongarch64-linux-gnu-ld: env.c:(.init.text+0xe8): undefined reference to `efi'
loongarch64-linux-gnu-ld: env.c:(.init.text+0x108): undefined reference to `efi_get_fdt_params'
loongarch64-linux-gnu-ld: env.c:(.init.text+0x11c): undefined reference to `efi_memmap_init_early'
loongarch64-linux-gnu-ld: arch/loongarch/kernel/setup.o: in function `platform_init':
setup.c:(.init.text+0x228): undefined reference to `efi_init'
loongarch64-linux-gnu-ld: setup.c:(.init.text+0x250): undefined reference to `efi_runtime_init'
loongarch64-linux-gnu-ld: arch/loongarch/kernel/mem.o: in function `memblock_init':
mem.c:(.init.text+0x24): undefined reference to `efi'
loongarch64-linux-gnu-ld: mem.c:(.init.text+0x28): undefined reference to `efi'
loongarch64-linux-gnu-ld: mem.c:(.init.text+0x28): undefined reference to `efi'

Since it is mandatory, auto-select EFI support to fix the error. Drop the
EFI Kconfig help message since it is not needed.

Fixes: fa96b57c1490 ("LoongArch: Add build infrastructure")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/loongarch/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 1920d52653b4..4ed8d0916be7 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -50,6 +50,7 @@ config LOONGARCH
 	select ARCH_WANTS_NO_INSTR
 	select BUILDTIME_TABLE_SORT
 	select COMMON_CLK
+	select EFI
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
@@ -296,13 +297,10 @@ config DMI
 	  DMI to identify machine quirks.
 
 config EFI
-	bool "EFI runtime service support"
+	bool
 	select UCS2_STRING
 	select EFI_PARAMS_FROM_FDT
 	select EFI_RUNTIME_WRAPPERS
-	help
-	  This enables the kernel to use EFI runtime services that are
-	  available (such as the EFI variable services).
 
 config SMP
 	bool "Multi-Processing support"
-- 
2.35.1

