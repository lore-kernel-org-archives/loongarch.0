Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC091107
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 10:14:49 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n10so1380508wrw.12
        for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EUOeskYk8JSGzLRuR8c+yYpe0ox0eJPFTWhP4tD6WXc=;
        b=C9b4elgMc8A68/jlVF4cZZJ74vpGWrkLNuvpBV6K83WPdaL5abBmYbMAKJL5Gtq276
         67VgOKMfc8wrR4UZxgYJzQiGGVeKG+iqh+2/AzcQ520AglVrw8c03ak09Xfq6MHuGLEO
         IrIrO7r6aVHSrzCC98iC6GnhepMHLIcPIbqT7d3A2Gdb+HqDbNbap9mlSd3Wr3G0BctO
         RO8/vE5wUsZ4ltm8+MuuGIGAYXcoh6YjyMSiLwKecvFrlhqEPk7cPrrg3mI5qK4vydVS
         33Bp4ORsHX5/pZggqtM11bwOPQ7D6f6EwLO/I/Rivp7pstQxd8GbDhsbDep+8JaY6KEK
         DzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EUOeskYk8JSGzLRuR8c+yYpe0ox0eJPFTWhP4tD6WXc=;
        b=b/XqUADWo6xYuvy2glmlRrPi5VYm5P2ucPpeFXyeBShjmq+3oiK8fNc5aTDG4Uee3S
         Chw7q4snWeMDjhKS966fIPFeBrp00JRWt3AHxQ67KeoZyNcmrYt48Uk4fD2bdkssxXjD
         FvrOd4ACks2YUKzuDdAHHqICxFdYVz+hIn5Aaf2xzkgnrmsJfNQwWseg0733TrOi1SUC
         UaKho43ZebCJx0ZeorGerEltWzmqcBdX8GPgAA38xACqS+LVOMqjCQXur8PvTHc2muz9
         IWlGVwl6UfgXAcwTF23XLsPsZ4IixNV5kE7KbacE7H2igndAMwFZjyFxuJG3XOE7n8tg
         D2dQ==
X-Gm-Message-State: ACrzQf0SKDirRmAq4MvmMcptORECrliskd+X6q96YxWGsK1AQWuxidft
	ovjz+XImm3f/r2D4aIu6Wo0=
X-Google-Smtp-Source: AMsMyM7ka5hhgO+UAxBsuRi9mcj0F2KSX+U7l5GUxi6f2CGtW0yXYYDeR7wDT5nN5UzYDLduvuAcDQ==
X-Received: by 2002:a5d:5b18:0:b0:22a:fb91:3d6b with SMTP id bx24-20020a5d5b18000000b0022afb913d6bmr1726000wrb.56.1664446487964;
        Thu, 29 Sep 2022 03:14:47 -0700 (PDT)
Received: from felia.fritz.box (200116b826e11200b190ebfd45660ea6.dip.versatel-1u1.de. [2001:16b8:26e1:1200:b190:ebfd:4566:ea6])
        by smtp.gmail.com with ESMTPSA id bh27-20020a05600c3d1b00b003b476bb2624sm3945786wmb.6.2022.09.29.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 03:14:47 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] loongarch: update config files
Date: Thu, 29 Sep 2022 12:14:45 +0200
Message-Id: <20220929101445.32124-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Clean up config files by:
  - removing configs that were deleted in the past
  - removing configs not in tree and without recently pending patches
  - adding new configs that are replacements for old configs in the file

For some detailed information, see Link.

Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 3712552e18d3..2b4220778b66 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -108,14 +108,12 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_LOG=m
 CONFIG_NF_CONNTRACK=m
-CONFIG_NF_LOG_NETDEV=m
 CONFIG_NF_CONNTRACK_AMANDA=m
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_NETBIOS_NS=m
 CONFIG_NF_CONNTRACK_TFTP=m
 CONFIG_NF_CT_NETLINK=m
 CONFIG_NF_TABLES=m
-CONFIG_NFT_COUNTER=m
 CONFIG_NFT_CONNLIMIT=m
 CONFIG_NFT_LOG=m
 CONFIG_NFT_LIMIT=m
@@ -329,7 +327,6 @@ CONFIG_PARPORT_PC_FIFO=y
 CONFIG_ZRAM=m
 CONFIG_ZRAM_DEF_COMP_ZSTD=y
 CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
@@ -505,7 +502,6 @@ CONFIG_ATH9K_HTC=m
 CONFIG_IWLWIFI=m
 CONFIG_IWLDVM=m
 CONFIG_IWLMVM=m
-CONFIG_IWLWIFI_BCAST_FILTERING=y
 CONFIG_HOSTAP=m
 CONFIG_MT7601U=m
 CONFIG_RT2X00=m
@@ -688,7 +684,6 @@ CONFIG_COMEDI_NI_PCIDIO=m
 CONFIG_COMEDI_NI_PCIMIO=m
 CONFIG_STAGING=y
 CONFIG_R8188EU=m
-# CONFIG_88EU_AP_MODE is not set
 CONFIG_PM_DEVFREQ=y
 CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
 CONFIG_DEVFREQ_GOV_PERFORMANCE=y
@@ -772,14 +767,12 @@ CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_VMAC=m
-CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SALSA20=m
 CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TEA=m
-- 
2.17.1

