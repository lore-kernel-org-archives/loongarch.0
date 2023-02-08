Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A82113
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 10:18:24 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id i2so5326766ple.13
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 02:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq3h6NGHFAxHZ5DLcg6qPLA20/eRYQpYkN3wnk0IEiI=;
        b=aI8k4UFkjpEuClZ/YCcgimxe4z73Kt9OcHFahkgUnhnMecQ9PNdRGPS2gYQ6MHm+po
         Bq2plDHND7AlLt3dfoyXb5RJdn4Zz1Z+B4wTnhE7xRRp921JaeXpek5VoDxOTDIFswpm
         P3hsPa6R4dVHAbICYJkwAuFwf3p0swhdlHIfo98uS/nH/G1JcZTMTC9CUCk2OcpDpLC0
         0AyS6tCqLHsYC37tn/pT3M8R7KvhVZuJsLOJGlF45wK5eXC6aNvbJo4R5O3o0PzascYP
         5LUY4F0FdRCzDnnWCJMhVtAn3rYbBKcQGUFK8wFgDlVnhv8+rYJ4gWSFMQ88pBZnNfyU
         SYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq3h6NGHFAxHZ5DLcg6qPLA20/eRYQpYkN3wnk0IEiI=;
        b=zeKHqDuGp5jm7LBOXMH68xKNG3s+wDq95W5eC176q3LDyrzJy4Ww/kjM4W/9t+AklJ
         R8kH0/m6KXJoj7OikBf4I3jEm/rPQcQv5up0KqsBkXdXBPQgACF1ESrLpvR8fqceqBd3
         00mei+Okz61iV/7YJKdN9iOZH9sr2JUMRgEoGXSkh4Co0KT9Ijheth2vyJw9KOEdxS9d
         XARFExdHF1W+/sNWItqhfmjM2HqYi5DOUU+WISbNWA74SWigM7kpuMMBoWYpLnHD5cnf
         KpwUxh5nZFmJGc2SHXn0+zdwg6vmSh2yjOazmcx/V1Alxn7jUp8aR2zL+KDQFYW+0ZkT
         07jg==
X-Gm-Message-State: AO0yUKXbbOMiAOk9+ZBJ8NjN7kmJTNbLkmY8WfaCrZhrWNfy09SK3Pin
	urtVre1kDRXaNU577g+HXTY=
X-Google-Smtp-Source: AK7set/FfeYbxbkOAj+M5ndUKEczPf+wcyYb9OC9Vx/qSjjYchGNqTfzPraz2U4R3e1to9J6qd5CRg==
X-Received: by 2002:a17:902:e285:b0:199:109e:829 with SMTP id o5-20020a170902e28500b00199109e0829mr5454679plc.30.1675851504549;
        Wed, 08 Feb 2023 02:18:24 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709028d9700b0019926c7757asm3991058plo.289.2023.02.08.02.18.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 02:18:24 -0800 (PST)
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
Subject: [PATCH v2 4/5] selftests/nolibc: Add support for LoongArch
Date: Wed,  8 Feb 2023 18:17:53 +0800
Message-Id: <d3fd493792cd7fa432843691d86221f5ad2ef32c.1675851111.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675851111.git.chenfeiyang@loongson.cn>
References: <cover.1675851111.git.chenfeiyang@loongson.cn>
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
 tools/testing/selftests/nolibc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 8fe61d3e3cce..e9c4a9d011a0 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -21,6 +21,7 @@ IMAGE_arm     = arch/arm/boot/zImage
 IMAGE_mips    = vmlinuz
 IMAGE_riscv   = arch/riscv/boot/Image
 IMAGE_s390    = arch/s390/boot/bzImage
+IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
 IMAGE         = $(IMAGE_$(ARCH))
 IMAGE_NAME    = $(notdir $(IMAGE))
 
@@ -33,6 +34,7 @@ DEFCONFIG_arm     = multi_v7_defconfig
 DEFCONFIG_mips    = malta_defconfig
 DEFCONFIG_riscv   = defconfig
 DEFCONFIG_s390    = defconfig
+DEFCONFIG_loongarch  = defconfig
 DEFCONFIG         = $(DEFCONFIG_$(ARCH))
 
 # optional tests to run (default = all)
@@ -47,6 +49,7 @@ QEMU_ARCH_arm     = arm
 QEMU_ARCH_mips    = mipsel  # works with malta_defconfig
 QEMU_ARCH_riscv   = riscv64
 QEMU_ARCH_s390    = s390x
+QEMU_ARCH_loongarch  = loongarch64
 QEMU_ARCH         = $(QEMU_ARCH_$(ARCH))
 
 # QEMU_ARGS : some arch-specific args to pass to qemu
@@ -58,6 +61,7 @@ QEMU_ARGS_arm     = -M virt -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_mips    = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_riscv   = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_s390    = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
+QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS         = $(QEMU_ARGS_$(ARCH))
 
 # OUTPUT is only set when run from the main makefile, otherwise
-- 
2.39.0

