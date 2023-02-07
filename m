Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8A7F
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 02:09:59 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 16so34510pfo.8
        for <loongarch@lists.linux.dev>; Mon, 06 Feb 2023 18:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twi5qezXVrXvljZR32CwVOgUlBky4yiX5EIZlBsZGKM=;
        b=H605XTSNckRPIcJCYwimDOMlVudKiTi3+wYiqZL2TXofzkKxZDWCZxGHdo5/HU9qV+
         8ocrTdl9zRCSdKqDWczP7TWC7jEuq1foTSiVvsDPWkZIdJJCY2BT1dmoo2B9D2tdb89p
         Iuxr+UlYRvU3cl5QjB6VtKxs5AGSimX/1IGND4oJh3Gaie09kOvxHNRX6eDvgkXsDHDk
         DcMJMpgPcitw1yfjucm3NwMjtadnFBmNYrIOgPrk8IWKvnTuPTVgb7Rh9ZeKOX0cepB4
         rrCb1m6Vzi9hL2cALqfqMtT0YO6eZXG48bhJ4GlLMvzsJoabHeoQVczI+bxybF1tU7CB
         JDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twi5qezXVrXvljZR32CwVOgUlBky4yiX5EIZlBsZGKM=;
        b=N2jWu0PtNZIEVpxsxq5kl2QMoTb4quGp2uxJAastkABH6dFMAmzRCwcPBOOuye5jwD
         2OgUKSyJOuz+KWemYdafB9RUls59v8dNuidIfkPiNS/Lm/gTwCaFm+OAK1sVdm4MU1tE
         ay2BKubWV6S5kI53MBaW7I5NLnffqavTUmRZ0pxbCVbiyk2QDkdxLDdDVSfxyTXYdjSY
         HGBIGpjNB19DiBMveQ0YLkDlCYMS8G/+GP4iViUXg+QyjWShDHel1YPf/LeddwDxyfUU
         8W3YZw5Z/23eynIyaH5VVqNknd1de5euZtcSFaLq0+yX5MQ85aezhxhRrE/hefSM/UwJ
         /Taw==
X-Gm-Message-State: AO0yUKVIopRV9OatwTB4ets+N6Y+B3qikBEeh2HjbNlx0A9496QIM1qd
	jr1l7+Dwq/SzQMQ+azSEDUI=
X-Google-Smtp-Source: AK7set/fGSroEhUgOMyTAVPr8nPJA37BY6oLlQW0JU++IFPWLNG8tgzXMupiCjYdYAYQfblhN8SYWw==
X-Received: by 2002:aa7:94ad:0:b0:58d:95aa:88a0 with SMTP id a13-20020aa794ad000000b0058d95aa88a0mr1373510pfl.24.1675735799379;
        Mon, 06 Feb 2023 18:09:59 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id d198-20020a621dcf000000b00593225b379dsm7843765pfd.106.2023.02.06.18.09.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Feb 2023 18:09:58 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	arnd@arndb.de,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] selftests/nolibc: Add support for LoongArch
Date: Tue,  7 Feb 2023 10:09:42 +0800
Message-Id: <2d77fe4e895847ae1ea09088dcfa411ce2f57f5f.1675734681.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675734681.git.chenfeiyang@loongson.cn>
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Add support for LoongArch (64 bit) to nolibc selftest.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 tools/testing/selftests/nolibc/Makefile | 78 +++++++++++++------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 8fe61d3e3cce..ea2b82a3cd86 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -13,52 +13,56 @@ ARCH = $(SUBARCH)
 endif
 
 # kernel image names by architecture
-IMAGE_i386    = arch/x86/boot/bzImage
-IMAGE_x86_64  = arch/x86/boot/bzImage
-IMAGE_x86     = arch/x86/boot/bzImage
-IMAGE_arm64   = arch/arm64/boot/Image
-IMAGE_arm     = arch/arm/boot/zImage
-IMAGE_mips    = vmlinuz
-IMAGE_riscv   = arch/riscv/boot/Image
-IMAGE_s390    = arch/s390/boot/bzImage
-IMAGE         = $(IMAGE_$(ARCH))
-IMAGE_NAME    = $(notdir $(IMAGE))
+IMAGE_i386       = arch/x86/boot/bzImage
+IMAGE_x86_64     = arch/x86/boot/bzImage
+IMAGE_x86        = arch/x86/boot/bzImage
+IMAGE_arm64      = arch/arm64/boot/Image
+IMAGE_arm        = arch/arm/boot/zImage
+IMAGE_mips       = vmlinuz
+IMAGE_riscv      = arch/riscv/boot/Image
+IMAGE_s390       = arch/s390/boot/bzImage
+IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
+IMAGE            = $(IMAGE_$(ARCH))
+IMAGE_NAME       = $(notdir $(IMAGE))
 
 # default kernel configurations that appear to be usable
-DEFCONFIG_i386    = defconfig
-DEFCONFIG_x86_64  = defconfig
-DEFCONFIG_x86     = defconfig
-DEFCONFIG_arm64   = defconfig
-DEFCONFIG_arm     = multi_v7_defconfig
-DEFCONFIG_mips    = malta_defconfig
-DEFCONFIG_riscv   = defconfig
-DEFCONFIG_s390    = defconfig
-DEFCONFIG         = $(DEFCONFIG_$(ARCH))
+DEFCONFIG_i386       = defconfig
+DEFCONFIG_x86_64     = defconfig
+DEFCONFIG_x86        = defconfig
+DEFCONFIG_arm64      = defconfig
+DEFCONFIG_arm        = multi_v7_defconfig
+DEFCONFIG_mips       = malta_defconfig
+DEFCONFIG_riscv      = defconfig
+DEFCONFIG_s390       = defconfig
+DEFCONFIG_loongarch  = defconfig
+DEFCONFIG            = $(DEFCONFIG_$(ARCH))
 
 # optional tests to run (default = all)
 TEST =
 
 # QEMU_ARCH: arch names used by qemu
-QEMU_ARCH_i386    = i386
-QEMU_ARCH_x86_64  = x86_64
-QEMU_ARCH_x86     = x86_64
-QEMU_ARCH_arm64   = aarch64
-QEMU_ARCH_arm     = arm
-QEMU_ARCH_mips    = mipsel  # works with malta_defconfig
-QEMU_ARCH_riscv   = riscv64
-QEMU_ARCH_s390    = s390x
-QEMU_ARCH         = $(QEMU_ARCH_$(ARCH))
+QEMU_ARCH_i386       = i386
+QEMU_ARCH_x86_64     = x86_64
+QEMU_ARCH_x86        = x86_64
+QEMU_ARCH_arm64      = aarch64
+QEMU_ARCH_arm        = arm
+QEMU_ARCH_mips       = mipsel  # works with malta_defconfig
+QEMU_ARCH_riscv      = riscv64
+QEMU_ARCH_s390       = s390x
+QEMU_ARCH_loongarch  = loongarch64
+QEMU_ARCH            = $(QEMU_ARCH_$(ARCH))
 
 # QEMU_ARGS : some arch-specific args to pass to qemu
-QEMU_ARGS_i386    = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_x86_64  = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_x86     = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_arm64   = -M virt -cpu cortex-a53 -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_arm     = -M virt -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_mips    = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_riscv   = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS_s390    = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS         = $(QEMU_ARGS_$(ARCH))
+QEMU_ARGS_i386       = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_x86_64     = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_x86        = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_arm64      = -M virt -cpu cortex-a53 -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_arm        = -M virt -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
 
 # OUTPUT is only set when run from the main makefile, otherwise
 # it defaults to this nolibc directory.
-- 
2.39.0

