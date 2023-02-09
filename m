Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46994627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:24:37 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id gj9-20020a17090b108900b0023114156d36so4357420pjb.4
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fq3h6NGHFAxHZ5DLcg6qPLA20/eRYQpYkN3wnk0IEiI=;
        b=qKKR+nM2DTUL7pQBTtfyKhJ24S9DZe3DNHuR8Ij2bMaR9SuFBiFmkF6S7Hn64PYOz2
         4Ct67ZxnBBtXAXD+aIWgUCDMMZr9Tt8e+b7tCep8lnGPvNOdMlVcBSUTdXI/FSWwV9vm
         RJkuVkQyxsNyvPCh3XN8fhZvWkZ2hGMGl2BP8KMn9j/6hCiWTDUPikgNexGTbQ2CwAj+
         8l4VQP+NhnDPAW8P0RMAdSIRMxctxxfw3EKhlH5rklcijobSfRSDl6xCKQ4tRJx+Sc8K
         2pYNdO+CHXkc5YxF3W6MX2OioIrfRDQbxnVxFA+8STVbQkA65Ou4c1D4zFPW8Dylt5YF
         86XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq3h6NGHFAxHZ5DLcg6qPLA20/eRYQpYkN3wnk0IEiI=;
        b=2Z1uPxYGHXHjxnZABikFWyK1eUz/LGnzx6qWrDNT20wXW6CVb1niZn5wEizqL0twbB
         Hw44fWO54sbf8U4cJQbVp6/bNTez+4LVDik7cqvjbYFUxsnA+SjOD077cphiu05AvbgP
         VomeBjUYFr6OVLfK00vRV7IyJhtekZFOYzJDl6W0jMAekl+6Bmu9YNfDMV+jZwxvHZf2
         qYDpPj5siMxG+chONgC2s5muisYcsSU9Pkm5eDM93W2062NdSJTX7oycLFv37oJuqN+P
         2rOk+fctPOnY/W4JYSNQPmPUU7f/UD7IZ8lgS2Gl7+h54+In3niGiv9cAA7NM3R9FiT+
         qdow==
X-Gm-Message-State: AO0yUKWeKN6yzfhmVoK/kT/SqPmTpYX+4mmNtFmhRfBKQVGHzzW/JCPa
	Pnd+k9A2m/8Grl2BEoLdZQk=
X-Google-Smtp-Source: AK7set/m+uaObsdqOItdbS8+U6+7ncZOtQaKpOmizfo0FxDkFaOYzS+LS5jKPGFYF4eF0G0XG/ITXw==
X-Received: by 2002:a17:902:f20b:b0:199:aae:7569 with SMTP id m11-20020a170902f20b00b001990aae7569mr7344524plc.28.1675913076773;
        Wed, 08 Feb 2023 19:24:36 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm216086pld.120.2023.02.08.19.24.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:24:36 -0800 (PST)
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
Subject: [PATCH v3 4/5] selftests/nolibc: Add support for LoongArch
Date: Thu,  9 Feb 2023 11:24:15 +0800
Message-Id: <f3745536049397cfac4cb28afb4d09785e771d52.1675907639.git.chenfeiyang@loongson.cn>
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

