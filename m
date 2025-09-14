Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C225B2FA
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821946; cv=none; b=bwCdwydtM5Yb/bCd5Z2OCQFUi+vd6MsgHXrDi16Cj0Yg0e8VBRO19YwQbYiXoxlp0SUGm3X7As565i0bA1OpmPNR1VErNPq3ZbpFlhusRLCasrlSdTDoL83cV7UpVGoKaiE3nV/PpfH0MT2LqckF8SvNCK16SbANv+dJd+g8zC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821946; c=relaxed/simple;
	bh=UZLn6ULQgc/FnEmwCGdDgCcEQNlktPyYM0GENq2QFck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uyx0z96NvsWSCxMIaSR8mvaFWJHp4B79tesl9e0Zu5PrR2W3D5tlkCGWpxOrLknVH1J6x34+JDp7xJMlUd+R6h/JVLZrtQUt1BEE3AoEHTFBDqI72w2i+UjNlh0rwqQ6anxTY+CATqm+tsWZtIxZ7Kjt4j9MHOJFEgA+kR2nC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1DYyHe7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1DYyHe7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b046f6fb230so609575366b.1
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821940; x=1758426740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji/7LeyyXA3A1wf+r0NloCDgCP9kYwAbhvqoNAjAUZw=;
        b=S1DYyHe7f5n1p3uLqmCw9ygs8nRVhTewUykU0hz44WW/hU3ftyhMvGHiyuQo5Xs2O1
         ZOeNJ5PkkfPlFZty61FkDTdwtNFHNjcuPumipT94cdgAh8UL+Te2cH1keX7rGc3oigfd
         YptECLa3wFaLoaG/Y9HPtkRuJqUb/E8/HJOpM60iUztxMyHfzAv+IZ+WiFc4oKG/QDEF
         gueSuzn8Q1VSyaBZTFu1vJEX6lNdk1aIQwhEi7gUHOK1uvkLNCnwGJymuHo9PaYLLHtN
         NDjfjCGQZbbA2CHhc1YxLvgflyLVazep2UArmW9Agu6t5L88iklo339sg7q6cVeL63eG
         0coQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821940; x=1758426740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji/7LeyyXA3A1wf+r0NloCDgCP9kYwAbhvqoNAjAUZw=;
        b=wlbEg638TL4ahhXPOkS5ILsLoTklrUM/dOD1LXr6s+e413O071ThQICvvoHYkFEWgV
         CD9iBW6vRmasFFqHd9YEktMnPgs6KqZ1ZxCJVm3GtS4fUVlB699pyvuPnB7VRSnp+Ntp
         avjHhE3CimuIM09Kd2e5tuaEpWYYULVNSiAOm/WgBU9aWD9bdAvbBFdSMA4noAjZVVxy
         +2Q6Gb03TK4arbIhnvN8zezkQ8Af1jz1/D6vW+06EV9yWrKKkAF6lTn5KAA4bZOid0mi
         M12S4yBfC86IMyWKMjvGX2uo4jD20lQNMZASH+cJYpHfoMIm+5NuGpizu9IOkQPHPUdw
         sdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT/W9gVwB+UiXLa/R6DUvoW/5ZSPKvf4faHrqf1AYp5WrCE1kl6CRpcVQxH17jy7ul7LsecznoD44=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuNDNxIJfoBuno6/yRpTco/5P6rNxQ8mgruhJ5TkpP66NLWe5G
	Jc8qfWIQQaZP66MU8C2hBhoJnIY4Ulq3BUv3P+FoVX0XrZ8J9ZZI/jO7
X-Gm-Gg: ASbGncuJpDj/2XmNadx24D9uj6iv7TK7cGQMpRDsS58rl+z5vBwu3lvCvib01vBuEG+
	R8r/e2yU5XNwx/hztF0tnu9Zc7TlaDgBPTlvnMcv4k2elDITRIR8v46Hm53RVFyDess7304vyh9
	9kQL+QoLAmNmQIF6+KZerfxOAN49ZbuaVfj2o2ajHtRSPmAZaCDIsKlmjmxsMOY6kZCfrw4zEPe
	yN1wsQbZvGPVMPwBLighB0ncFrXLeSlsgFPkPX0ZLCSYc6Mo/BNqk7rTWpkC98mWYzVk34A2fDW
	MF1DzuoElY+dB2sQLrrVRTaFLkSMEElO31s5FMeIJx3tHdZYC75bYUe3scUyLUModlegAzEQMS+
	TgjLvqEDrfKvNeJLXFdA=
X-Google-Smtp-Source: AGHT+IFrowlqfzYJmQGTHyfqsFCL1BbKqEywr8+/6hRK49j3T1AOHulukHNAqoGa7PMdZRPYrPs7MA==
X-Received: by 2002:a17:907:3da2:b0:b04:6157:43b with SMTP id a640c23a62f3a-b07c2544bb9mr854247466b.25.1757821940418;
        Sat, 13 Sep 2025 20:52:20 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd88fsm669745266b.51.2025.09.13.20.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:52:20 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 41/62] init: rename reserve_initrd_mem to reserve_initramfs_mem
Date: Sun, 14 Sep 2025 06:52:15 +0300
Message-ID: <20250914035215.3641628-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/mm/init.c            | 2 +-
 arch/loongarch/kernel/setup.c | 2 +-
 arch/riscv/mm/init.c          | 2 +-
 include/linux/initrd.h        | 4 ++--
 init/initramfs.c              | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 290e9f9874c9..a564cbc36d18 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -186,7 +186,7 @@ void __init arm_memblock_init(const struct machine_desc *mdesc)
 	/* Register the kernel text, kernel data and initrd with memblock. */
 	memblock_reserve(__pa(KERNEL_START), KERNEL_END - KERNEL_START);
 
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	arm_mm_memblock_reserve();
 
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 075b79b2c1d3..226262f35dc1 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -602,7 +602,7 @@ void __init setup_arch(char **cmdline_p)
 	pagetable_init();
 	bootcmdline_init(cmdline_p);
 	parse_early_param();
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	platform_init();
 	arch_mem_init(cmdline_p);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15683ae13fa5..b1c4876dadae 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -295,7 +295,7 @@ static void __init setup_bootmem(void)
 
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
 
-	reserve_initrd_mem();
+	reserve_initramfs_mem();
 
 	/*
 	 * No allocation should be done before reserving the memory as defined
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index b2a0128c3438..51c473b6a973 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -10,10 +10,10 @@ extern unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 extern void free_initramfs_mem(unsigned long, unsigned long);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-extern void __init reserve_initrd_mem(void);
+extern void __init reserve_initramfs_mem(void);
 extern void wait_for_initramfs(void);
 #else
-static inline void __init reserve_initrd_mem(void) {}
+static inline void __init reserve_initramfs_mem(void) {}
 static inline void wait_for_initramfs(void) {}
 #endif
 
diff --git a/init/initramfs.c b/init/initramfs.c
index 7a050e54ff1a..a6c11260e62b 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -631,7 +631,7 @@ early_param("initrd", early_initrd);
 
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
-void __init reserve_initrd_mem(void)
+void __init reserve_initramfs_mem(void)
 {
 	phys_addr_t start;
 	unsigned long size;
-- 
2.47.2

