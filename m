Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA5627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:24:40 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id be8so1468180plb.7
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOMPizwvZIOCZuA+NM2fq3lJj7qsjRo1bnIWUyEuTFc=;
        b=o1Uf3DsOGh6S5T1HAbrl3mkVjPE7Kw+LSrW0bJOrDNIDEIqSEmqugn1WJqRSA4KC7e
         sqprHEDA8gjvoaGRJdgrMzv6gM80VOhmmCPDawO7h9uc79dtG2t1njmIB9JOhxZrICYT
         O/tcYaCnKyj7Tw8IFpnMUUN+YFVh1V+6eI0QTKdwpNRNeB3zWH2t1LORLBxYoYqrKq4M
         nacSpZcLuGTlCiyatI3sIDPeqfSs3sg0WVXQB5rfRwlObJgIw6z5AMrC22eVvx39F2gG
         gSEzKtf1NtZbZJNs0xLZJo7CWlPovEjk1f1lXCGx3XhHEh8eAlXUrHzP0twstNbiiltE
         2RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOMPizwvZIOCZuA+NM2fq3lJj7qsjRo1bnIWUyEuTFc=;
        b=KFULFCq+BaLLSvLJCwCyWI8ScE47wpunm9MqNbGXus3tqmwN+eTVqwg21KeiYXkuxd
         s7/vcTX6MN9mJgcoUJoRy2cCnFxR+mGLGjJMTHIdVKDJ8f35dLvyiTzXYELgonaAxL4C
         PwNuBF7RR/6Pl7Co0dfyPoWVocgFkzLNBRkkdH2hf0Efh4mskC279piVWDWgr4gob4LD
         67G2bLFOxA6EIxWpJYgeKu8mB9sOsyUBiOieQaaCI4rMQm6zm0jU7vpKFD5Vk+himGDB
         DkKTauGqGjLJhlonv0RNz7WxI3jBgJKVi0ZlZoKZOiDJW9TOZ8ljwSVG/6RDafp8lqKN
         Vntg==
X-Gm-Message-State: AO0yUKUcaulySLskOcDXIFWfntRWpkVUOMyrWsLUpAo6xqChwFJsfl/O
	5Wy446U1lNU0iuaTi7w1OgE=
X-Google-Smtp-Source: AK7set9IW9dd0zqTW0WPNVAsRnNIusXUPZS6AKEuE7obiFC731NxJlbQIzdBGmcpaMK38sXh+pzZkw==
X-Received: by 2002:a17:902:e1c1:b0:199:6abd:6a71 with SMTP id t1-20020a170902e1c100b001996abd6a71mr1405586pla.68.1675913079720;
        Wed, 08 Feb 2023 19:24:39 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm216086pld.120.2023.02.08.19.24.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:24:39 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	arnd@arndb.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] selftests/nolibc: Adjust indentation for Makefile
Date: Thu,  9 Feb 2023 11:24:16 +0800
Message-Id: <546afedaf92ad1ae95a79a99d15bdb359fd1410d.1675907639.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675907639.git.chenfeiyang@loongson.cn>
References: <cover.1675907639.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

Reindent only, no functional changes.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 tools/testing/selftests/nolibc/Makefile | 74 ++++++++++++-------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index e9c4a9d011a0..ea2b82a3cd86 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -13,56 +13,56 @@ ARCH = $(SUBARCH)
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
+IMAGE_i386       = arch/x86/boot/bzImage
+IMAGE_x86_64     = arch/x86/boot/bzImage
+IMAGE_x86        = arch/x86/boot/bzImage
+IMAGE_arm64      = arch/arm64/boot/Image
+IMAGE_arm        = arch/arm/boot/zImage
+IMAGE_mips       = vmlinuz
+IMAGE_riscv      = arch/riscv/boot/Image
+IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
-IMAGE         = $(IMAGE_$(ARCH))
-IMAGE_NAME    = $(notdir $(IMAGE))
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
+DEFCONFIG_i386       = defconfig
+DEFCONFIG_x86_64     = defconfig
+DEFCONFIG_x86        = defconfig
+DEFCONFIG_arm64      = defconfig
+DEFCONFIG_arm        = multi_v7_defconfig
+DEFCONFIG_mips       = malta_defconfig
+DEFCONFIG_riscv      = defconfig
+DEFCONFIG_s390       = defconfig
 DEFCONFIG_loongarch  = defconfig
-DEFCONFIG         = $(DEFCONFIG_$(ARCH))
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
+QEMU_ARCH_i386       = i386
+QEMU_ARCH_x86_64     = x86_64
+QEMU_ARCH_x86        = x86_64
+QEMU_ARCH_arm64      = aarch64
+QEMU_ARCH_arm        = arm
+QEMU_ARCH_mips       = mipsel  # works with malta_defconfig
+QEMU_ARCH_riscv      = riscv64
+QEMU_ARCH_s390       = s390x
 QEMU_ARCH_loongarch  = loongarch64
-QEMU_ARCH         = $(QEMU_ARCH_$(ARCH))
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
+QEMU_ARGS_i386       = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_x86_64     = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_x86        = -M pc -append "console=ttyS0,9600 i8042.noaux panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_arm64      = -M virt -cpu cortex-a53 -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_arm        = -M virt -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS         = $(QEMU_ARGS_$(ARCH))
+QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
 
 # OUTPUT is only set when run from the main makefile, otherwise
 # it defaults to this nolibc directory.
-- 
2.39.0

