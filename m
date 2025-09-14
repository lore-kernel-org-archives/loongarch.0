Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF3D26FD9B
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 04:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822703; cv=none; b=M8KqSDW5m0GrjGJbDksQAS35WwxGXsZb82XI8fbOxN7a0WwAKf4maTlJWh3CJCjDHLca8QdbSIVARaoIGUc/4eZ8etiSusTViG2NnCIcWdwhhSGpNfPK0nCjIyVEy675UlmJqlesxwqqKjxvIZqDzTvZ5eM6dSa7CqPHhaQapVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822703; c=relaxed/simple;
	bh=K5eh5PFkTwqgMsR/pgApUC7mRgd5tIkIjFvctye1Fsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncaGdBTlgWXKUNvSpPnBiSoc+ocv33vaY2HUtQlRZQImGNgnn9XdUJZNKhuEXMypfYw4sLD6AUvuvG/anrmbFHBS4yifwBnSi78qV7FGKyyFwYLXnXrAjpiLF9eVabdQfh+3OD7v6GfoAuzTzGZxdRt3U7TeiWBRaqds0WzHPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMWFHm2G; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMWFHm2G"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b07c081660aso429398166b.0
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 21:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822698; x=1758427498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=DMWFHm2GSh/vfzUiAmn4gdED4VIemgerdlWxgFaIeYS19a9geNE80+S3s8amdhBnmm
         6/WJ/Lw94R97jLRL+ljHCfLHogQynF2w4VWbyq6kOne+wKhd82xbeavTBYPGLLo61ug8
         lbELth+HnG/+6TC/zz/axkuFwD0tOy2bF1YZwWFp9LLLG71s8fKouq62Wl+yCKiOQNP8
         dB5nFo0vnnEix/XNUcmSMCokF6m/vxkC3EZ4nTVQSuPM1+JoNOpe/OnKJKr2vm3jiMce
         Ysh7YfUJofRARZJKBfn2ahBF6NVFy1jGIDUaloVn2YWzjpTCKeSIgjDdWCl4+lVmPgaS
         YdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822698; x=1758427498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=LSkrT+6ln27p7Qe2QnBa1//RxAd0aDsOoBzo59iVvnT8EBkDXE7FaFGNbga2ub4B97
         BBz7O2MNtp+7c/BsdAncLFemBOAAqAsSXjsHq39DsLftxgjalJkYrErJQycH/Bok8/Mb
         2+7aXKD3b+CBCjMiDKKjoB9L/8i+gy68N/g4ro91I0IbrMbPGBixQ0IxW2lgg6+hm9Dp
         iJ2zBJRPeGdNjtKcuYLlyCFYJc8E6ErDlE63kD+uEIXVH8nb+3U7PgIvQYJ1/JNyp964
         z7Lp7bba0vmypjwDm2HrgVx+/MQu5hPWb8jeKNmtia6K4jbXw0+0TL+gWGosp56R08QL
         +NCw==
X-Forwarded-Encrypted: i=1; AJvYcCUhlW7Em/cN/S28WVONYjacLyJY+uQDovzi+5M+n+ht8jNlv6bXaBj2dgwm9H6UU6FcDDCPljsyogA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBibOnAXV/N7IRbLGIA4x2/VwmjSYahVzuMrIVu+VwxFSwbpbP
	03OUXmjpfSkjJ7G14jvFRzT0eHk8wbFw/qSNnom2tbdRxjNURofK8l2W
X-Gm-Gg: ASbGncvy0AfrQlcgv/x0Z/E2XfLs4CZ2OodHAO46BrwUyvRmfhAqcKwHERtuTIouKh4
	Fxz+d7xXcYTIAbyTZzjPNcKPGFLlJYjzhQciYdqk9SblKsdmU/uDzxiFyxGT0LdHZMt58dow49a
	T0QCtk/CCuGUVHkJS1rFRG5+2EwsVrENPYC35S77NSXQ/Xd2MPDk6mtHPjyDWvzoBPsyE8SUOcI
	vhv5zatXUVcTP226g/i0Lvtw5I3Apeu4Vh2ideR7ACVNtmxxHIuXavFWxKI0aaW/AuLnZuREdQw
	KZDh6voqTgTwEb5aWOKtgYmzGAKlbIjj/ihOnz1F8LzTpwO29bWTXxJhEYRMqiey3EjKMr8/iO/
	mR5DMZ0Q5/ddCH5h/nKc=
X-Google-Smtp-Source: AGHT+IEha/cEycx+vu0xF7TxjEegwfvZABBYj962u8Q3zWPEYF1LD+BxwewIqIoCpytaOJDSx3nrIQ==
X-Received: by 2002:a17:907:3d8e:b0:b04:706a:bcfc with SMTP id a640c23a62f3a-b07c37fd45cmr876333266b.33.1757822697695;
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07dbf5dbf5sm308085466b.79.2025.09.13.21.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
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
Subject: [PATCH RESEND 62/62] init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZSTD
Date: Sun, 14 Sep 2025 07:04:51 +0300
Message-ID: <20250914040451.3848715-1-safinaskar@gmail.com>
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

Initrd support was removed,
and CONFIG_RD_ZSTD has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 2 +-
 usr/Kconfig                             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 6e961256a941..68cae0496b54 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -7,7 +7,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZO is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZ4 is not set
-# CONFIG_RD_ZSTD is not set
+# CONFIG_INITRAMFS_DECOMPRESS_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 3a891a0c9ef4..06e1c1474b68 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,7 +100,7 @@ config INITRAMFS_DECOMPRESS_LZ4
 	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
-config RD_ZSTD
+config INITRAMFS_DECOMPRESS_ZSTD
 	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
@@ -206,7 +206,7 @@ config INITRAMFS_COMPRESSION_LZ4
 
 config INITRAMFS_COMPRESSION_ZSTD
 	bool "ZSTD"
-	depends on RD_ZSTD
+	depends on INITRAMFS_DECOMPRESS_ZSTD
 	help
 	  ZSTD is a compression algorithm targeting intermediate compression
 	  with fast decompression speed. It will compress better than GZIP and
-- 
2.47.2

