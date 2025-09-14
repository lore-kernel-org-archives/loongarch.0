Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B726E6E1
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822377; cv=none; b=nhYI6D9eriUUR3Vp3He1idUftftIV3eA/WS1Qs+yB4dBVWHfBrb6FedEkInIGvNNaEOmR2JDLrKUgDzW4TQLG0p16qG/9yzhLOL1AmDapzmPKJuvuuzWMwNadVWIYiwjCb9EGwxuEzDr6CRo+NBShfm5+2B4G/293fG5iEXXpFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822377; c=relaxed/simple;
	bh=dWOevKs33KVPp7BfwW01lTdoAaIwqA9A0zVQ5+zAb7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlsKzOMZ78Jzvj/PmR01Oo3P5hAqqNjpdarOInRsdozRSBdqHo65/Vbkie1JxrGlbTPkkGOE1Fbc7xw3xUREqjJiYkfhtWwXD2iiW6Azr2//RItbshOoOtRAqNSYFIEbJiIqbs5D54NUAgTfkJ6RXlkSj9uAdxDKKGcY8EOzDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe+ny9To; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe+ny9To"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so479128966b.3
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822372; x=1758427172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=fe+ny9ToGnApEpgI0Bn9xFgiqiC7djZ79HeDaGN+MwgWGJYsrozbsipIst4BXuXXHn
         +nOTZFvTHaElWh0ukt6R0zHg5HRFJ3aEO6xCg158/49XVyDb6Xox4LweXxnJy+FCtsQo
         2y+gJOtmmFGXlUSAAjVMT6V6qhXzPqG2NtDdyCPPSU4MJMYhJKCmF6iY1HO8fnYoaprc
         55+z2JuErsQLWR0BuEgzdw+gBwnMw8WxR+qRZ2zY8kGULG50Mazn+rSsNERYB/hi8b6w
         6wWqaa2iu2WnS8LjdwOmcTLrLldc8x3K2yAhVgsbby3ghObSKgOK7kOAgrsk1+iPelmb
         NEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822372; x=1758427172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=lLFJlkd8jcmKy3TPDKrw+PUKbv3J8BIjRdPYNfF9N55tP4KRPBPlzRTuCsgwBS5Wah
         mi5g/MEVLVGIJrX+GNwY/VoDZ1d81vwHxwe4wNqyXPmi1zjJxlxRmEcERETWwae10ADU
         a2ZiQ6e+v5/ZKu9Ude7K6CyZdDPhdCq9jG55OY8CjGPX8Me5HQ1Ilmil3sKGZYjJfh/J
         XIgYuJWey98kVnFbmyFGTEFTGgIbyPXfQNXndXE6r28M0hGG7Je2G8D5GOSflX/B2aEo
         8wxUXnUWudT9UIgHho/A0f2eq+6mFX0A7QoHmLr173/RZ6wOJBMR1ZPpWlnV6IrZO8Xo
         uSdw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBGUOcSI0RBKFm5l/ydgB/zKug+hI8ApYEMxbdCbFZPJwPepXlkUhr9n9ux7pnKPdTnoX6Ttel2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcpkj9TMY+HEfbOxh4wp49jW394cAsT/p/kL8tju02iwHUrVKS
	rtAOksPOVYfm0E0IJPUP2sl4jqN91MTPg7XyxihjlbDyUPc1pHxZ1+9j
X-Gm-Gg: ASbGncu9sFuxFvweXz4S3c6F7vPV5Jl7X49kI9zLfK9l7VpuIIh/NJKIPTx3rZEojSI
	tT6FOnIe7lH2JipmRnBx7nU47e2sOJde8NMOgLV0Je4SNmVQvY9fj5m4BlW2GbbwgcZzbodAwvA
	rZPnobAjTFCPoucpp120r4xq3DOw9nlKg5SNwM1ppmupthtpbk9Yc4QNS5OLOgRaJuldkF7Ow4E
	qSCVkGYPMzNYdugWqARZ3fahzLbHSXfTqVY3gW7bVj1G/wdjIBiYfj0szWafiAiRqYNkqI6IhN8
	41dXjafgFlgaBAnMmtyJ4nKpfKSufPi1PbmOJvolHUbxk26O86gdGAXEx5g/xpDiaFxIkfBxsxZ
	H3K1MzMTQslXY4EU5+po=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
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
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2

