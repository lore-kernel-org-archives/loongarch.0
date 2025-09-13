Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22D502BE
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 00:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724204; cv=none; b=pLooLQ0qSh+cOC2dv1U9t1KcrQyGOprJBPIRqioYVu0LLinOqGZBXJuTJ9+aUjE6HoaXDL/BoxN1RNRF31Y/nLiU47IXUtY+s5GkyDaOfbLOZDMm5dilbcedbnA2UfdG/jNMl+pmYt00mnMFNoH7BGQqPOhH5hjMA9kxLmKEO2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724204; c=relaxed/simple;
	bh=YJ3HeYdgmHPacx2K6CLagA34dvdD+umyj49eLYi815Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoyjQrHaoGm+FwfO+zz70d7U7ei6fJ6sYr8GS+qIp3g5FZRVAgqnOOjmkMMc0y1ab9BkuGpXK2yfmFeATyS5oKzFYNXxplRpnqllMFWDQZNhtIEVUKDkA2ndtr42TAenuq0Lu4DbiJV0lsLCW+fmniVbfDh3tYqu1Gpzyk6jPZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpwfF8w9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpwfF8w9"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so146808a12.3
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 17:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724198; x=1758328998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=CpwfF8w9Ee5+/eI/DvaomE/Eih1NsbVFF+7BvKnV4IZMk7i4uuvXNG8uquKHUx5JpI
         jlJ4OUcE5Et9NOg8o0ZvZjUCblUEdPTxdHvSUtg8WujmyOCXMMuoRqqDaBsBiawQJtkW
         iedmDv40K/JPG9MBreceFSw37rk25i0E0+CsqXkwlS7E7j52NVsVfk9Mpgs52X3++3JA
         Mj+RNvK12EGtWNT2UkWPNT53dTcYGJu+gye50cWeoEeWJ1XS9wTeLHyheQbYHPaEz9vL
         Y+MtlT3DW8TxWcLmOTcncYBCNlB+FgZvBRCasG02c4HRB+YSG1dMDAlAlM3sKrMkCEnj
         Sh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724198; x=1758328998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=nMxxCkZ0yYUdgYJU34k0umiuimaf1IP1Uz7FZOuAoE+mAZ8ySQwItj2AMaGFYxJVAL
         KRWfILcQL1BsW/8rNbZ+iNFNtG+DQ0PdLmE3KPpgD4MwlR5/qR1AAEYxqzrYGMz7yLxe
         kPO3sxykPOW61S500YtZXt0qf3q694xZeFxAOPAss7MHYig4y8MNlhP376FkrUtNaDWo
         ryGGboBlUvNs3N7N76MrBHYH96yy6YOnqSdZR0JRlexGEzLVmB1zi/wPuA33mOesXlpr
         WiATj81GBUo8HMNBHAFerr8dv3YJSI9rH+ywo+AuBtbwNJ4oDaAkypwNN+EzNjFG/c+z
         wiXA==
X-Forwarded-Encrypted: i=1; AJvYcCV2OfBI14ab8MGWzqu+eUuolGPEN2JI1VOSHU+xbY1Q3FsTs1YJEBXDWJLv+JoXSXndl863w5psD0U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzfBECH95FOw1mxJk/8qGeT89tcOO30ERS8l/GThJ4p2Ie+Nou
	L9ehku9LfOeosAEkO6FjL1ixH/vsi5epLSJh72D4z72Z1N6iIuR52zf8
X-Gm-Gg: ASbGncu0UOC8xv1MEMTcgtlxmkieKGeoGSrnWqMjd7Qbx/CWSGJnZaoiMMahnCH3wRP
	3bHmrufoc26xbs2QGRevMQUiczBlX8e001PVp6tbSBAZJbc9sDwdAP+RlHpEOIRGsYzovTWSPs0
	Z7TkGCCW/CCKEKZPeiRIRt5JcMiP1Zm1ZKV1drUObVqCuMFOXgK4uBmQzIR33RC92q9iTCn36Vd
	mvYnaAf/MrgnYCel97owqkv79//SQsrVPLmvycZiUrtOJf4R0re6X/FOY3JsixLgTCSAIodPz01
	LVnC8OHYQoV0kQ1v2KytsCNuioQyun+5UQIp9rZnbSTHpi+XoGm9vwtJ4mDf471dFsaxrxZIDWn
	Y50MfSBkAxYTSd4KrNMg=
X-Google-Smtp-Source: AGHT+IHHzjbduKroQCN+yZXT2xkuDjXRSEwS3nHiIMvASVJIn5ZPiks4NchkJZtKdw5/XwXcHwo3Pw==
X-Received: by 2002:a17:907:9405:b0:b07:c9b2:dbd with SMTP id a640c23a62f3a-b07c9b20f2cmr456569266b.4.1757724197720;
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07cd14268fsm196477866b.3.2025.09.12.17.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
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
	patches@lists.linux.dev,
	stable+noautosel@kernel.org
Subject: [PATCH RESEND 03/62] init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
Date: Sat, 13 Sep 2025 00:37:42 +0000
Message-ID: <20250913003842.41944-4-safinaskar@gmail.com>
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

They were used for initrd before c8376994c86.

c8376994c86c made them unused and forgot to remove them

Fixes: c8376994c86c ("initrd: remove support for multiple floppies")
Cc: <stable+noautosel@kernel.org> # because changes uapi headers
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/sh/kernel/setup.c                | 2 --
 arch/sparc/kernel/setup_32.c          | 2 --
 arch/sparc/kernel/setup_64.c          | 2 --
 arch/x86/include/uapi/asm/bootparam.h | 2 --
 arch/x86/kernel/setup.c               | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 039a51291002..d66f098e9e9f 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -71,8 +71,6 @@ EXPORT_SYMBOL(sh_mv);
 extern int root_mountflags;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
 
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 704375c061e7..eb60be31127f 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -172,8 +172,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index 63615f5c99b4..f728f1b00aca 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -145,8 +145,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index dafbf581c515..f53dd3f319ba 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -6,8 +6,6 @@
 
 /* ram_size flags */
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 /* loadflags */
 #define LOADED_HIGH	(1<<0)
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..6409e766fb17 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -223,8 +223,6 @@ extern int root_mountflags;
 unsigned long saved_video_mode;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 #ifdef CONFIG_CMDLINE_BOOL
-- 
2.47.2

