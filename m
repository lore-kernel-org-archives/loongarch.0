Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1AB1547CC
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725186; cv=none; b=gx1pah+CUN/xvDpkR/MtIK13aeNTvUQT24bCRkWkoWDArDvhgCBzFvycjwfbRjPJq/s1W0n9WKxZfK9U7y+s3lMb/HPjmST70FSyrUszKABRHeW9KuSIvRviKI6Hq0+jcH+nfIs4A6LoizGPyyOIE1s8UroGffLHi1r6128nwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725186; c=relaxed/simple;
	bh=96PHKpKkduNWBMWlLUmXlhnRkmSl0kWQr4vXMbTyP8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1DyqaJIqWfdZUD6clFvW1Ha3s+PlMFBJgPjUfmLXaT+DuwfdfNIiJXzQKcb6zpidY/2vZ73vrKQvEF0LlliPunTX7Rx5PMMnmjhVcIHem8L8ixiD0XTN69xyrZHtwEkIWsfcl3MiJn8Tze538f+TTJGjVRJTSA3q+valNN3iY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihUDCM40; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihUDCM40"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07e081d852so68050266b.2
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725180; x=1758329980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=ihUDCM40LDVx4GeLFp8XgdnJDIRbUsMxnZ07jWTvowKdf+yvc6NplKmUTgBTXyU5Hy
         CkW0FMAOqOzp0L/VhTuxJG4D1z5t09e9Fk+/CI6g57X/D0HJQkNMnW4xeza+WqrnXCG+
         zNKgAXJXCtp/uhbFN3pBAOnzwfBehOgLsnWLf1vyWsWsISskCw+mb3nYYXOgriHveZoS
         mIJs8I2jKD8RLcHd6LrD3aqdm3lb/7YgGY4olEysc6PUrUqxYqxmOxtKq9OQmxI7sFO6
         ch1YUXUNlwtoOQW7ZBCzM6e0fhXw1CHaTe+YjD/uh2899WaYUdeRR0MtvL+QUAQPGZjw
         RMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725180; x=1758329980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=VO4z+39rp76k2cDztftPyLOsym529HIlBxXr2SN0NvqkmU6gkIoWw2PaNXp6KzZgKc
         bHrJ9PvLDCJpqGVNo6WsuHY8XAyZVukXxyhOVMGnAW40p0wS6UlLw1x6SFMetSM8yjvq
         55UlTX0sNoc+HUAs2W3528RTg5psh5ICqy52cl/HmbPHPBw/JRd3q+JZ7Ry5wxwLSRo8
         putxh4IaM3XOL1tLF/NAP4d0T22JdnfjXw9JNVbnsr+Ha86Gge4oU017Z443fz8mFREq
         Ia+4lWqEfC0uIv/Htf5xdxJcG0ueZTYtHKcrEpA12emz1iewJKtyBOxrdx6e3+SX6gFi
         2PEA==
X-Forwarded-Encrypted: i=1; AJvYcCUUzqEFnD8EYB0TgLYg/DJat5SvIlMGLuWYac5G/XSjZxT7iIb03+5PVcB++Uq3bYDJOJFCOQi6kLA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtFQgZjs/pMMfyH3p7sUiPMhXMqOYYxeLoeIZxoyj8ztT1OTTa
	qbqstMYhxnGL6XcHO809MXDGr5GKmdyFd+5/e+0OP1EaLFhfADhP/r31
X-Gm-Gg: ASbGncvKNZTfrTzo9yvjFldUvjEuFSEJo8zmx7MmAt5rfe3SK6QaSuOPOvt0s6ctIMP
	27e5sHLX31ixOlkHFsJJ9APdwJxaoip6BTuFbwBGs6w79CXRjIx6shVVQSiaAbVCSFBaxmbU1dR
	ItyxmYgLkQGOI6nMaW6AdY26E8o94wflyTKelvdLGIZ184q8PXG3PAZkGXlFsQczTaDPXkOL4uS
	5O6SAyc+1LIDpciptbNyXFSNV1555sw4SF+QYxZJgSTtCXYejg+rLcTP3f3vgyqDZ9U6ETbHMSh
	kawIQngW4dZoidSI+Xk0Pft2FBxx95aBVRcKF0vBzNaygUy8BJo7gmPxfJfrHGBy8tny7rknAFn
	ydpG/diyoLbmkIE9NTqI=
X-Google-Smtp-Source: AGHT+IGLvsatTRrbnodGqisgzpCsfnT+5kjCyZkQGsCYdRKthq/XXLBOPdic+fyhUVGMnj7YztyCUg==
X-Received: by 2002:a17:907:3f1a:b0:b04:ae7c:703e with SMTP id a640c23a62f3a-b07c35bca5fmr458205966b.24.1757725180390;
        Fri, 12 Sep 2025 17:59:40 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347a2dsm471368266b.98.2025.09.12.17.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:59:39 -0700 (PDT)
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
Subject: [PATCH RESEND 18/62] doc: modernize Documentation/driver-api/early-userspace/early_userspace_support.rst
Date: Sat, 13 Sep 2025 00:37:57 +0000
Message-ID: <20250913003842.41944-19-safinaskar@gmail.com>
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

Update it to reflect initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../early_userspace_support.rst                | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
index 61bdeac1bae5..0ca923c1007b 100644
--- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
+++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
@@ -127,28 +127,22 @@ mailing list at https://www.zytor.com/mailman/listinfo/klibc
 How does it work?
 =================
 
-The kernel has currently 3 ways to mount the root filesystem:
+The kernel has currently 2 ways to mount the root filesystem:
 
 a) all required device and filesystem drivers compiled into the kernel, no
-   initrd.  init/main.c:init() will call prepare_namespace() to mount the
+   initramfs.  init/main.c:kernel_init_freeable() will call prepare_namespace() to mount the
    final root filesystem, based on the root= option and optional init= to run
-   some other init binary than listed at the end of init/main.c:init().
+   some other init binary than listed at the end of init/main.c:kernel_init().
 
-b) some device and filesystem drivers built as modules and stored in an
-   initrd.  The initrd must contain a binary '/linuxrc' which is supposed to
-   load these driver modules.  It is also possible to mount the final root
-   filesystem via linuxrc and use the pivot_root syscall.  The initrd is
-   mounted and executed via prepare_namespace().
-
-c) using initramfs.  The call to prepare_namespace() must be skipped.
+b) using initramfs.  The call to prepare_namespace() must be skipped.
    This means that a binary must do all the work.  Said binary can be stored
    into initramfs either via modifying usr/gen_init_cpio.c or via the new
-   initrd format, an cpio archive.  It must be called "/init".  This binary
+   initramfs format, an cpio archive.  It must be called "/init".  This binary
    is responsible to do all the things prepare_namespace() would do.
 
    To maintain backwards compatibility, the /init binary will only run if it
    comes via an initramfs cpio archive.  If this is not the case,
-   init/main.c:init() will run prepare_namespace() to mount the final root
+   init/main.c:kernel_init_freeable() will run prepare_namespace() to mount the final root
    and exec one of the predefined init binaries.
 
 Bryan O'Sullivan <bos@serpentine.com>
-- 
2.47.2

