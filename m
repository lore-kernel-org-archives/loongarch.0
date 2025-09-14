Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692D267AF2
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821838; cv=none; b=rmsQEUggRDH4odjEQJDBPMA1uEiCUnM4QBTB3hRLbnikbrNuUiC6rCUHwZ4iSNiTDFuDGvySpPv9FvaBAlAIT0kRn7/XlaAxOqLihNxwvnywcW6PByMzmqqtT5l1cteXR8z4gLRi9AjVOWlF8LtNyny/nIR2TLG6hdzV21/0s0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821838; c=relaxed/simple;
	bh=UKYo3sZQHTOBTzj/ZrSKU3L73PiTPpOmU1LUHeX039A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UgHqHrklACbl9+4px1LnqvaUJP1miVP7yKcaVYfBwwFFc2MVQL8F9gKec/Bdi9Yv76LS5CoHFwaj3vjwG4ct7+7XXMPS+HiLQFNKjUIS9QerSs964glxPu8QuKF7cRBzVcEyy62ixEIafA5/7Ej6pZZVRdt5n81OQL7x+X3nxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPhefUIY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPhefUIY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b079c13240eso507235466b.1
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821833; x=1758426633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=jPhefUIY1RDqWgc1k3TBipGKjv6iqU3aaIq5MRK3iQ6cES6whfEag6TiyhYHhDFREz
         6ZJhYR7C6P6OBaBYueCrbUpBbU3KYXXnGIh82zh1t5HJWUeYs6uu/uSd1RJuTUEGNSLs
         6I60wW5j1Hl/666TakFclh3gqqmGmmpwUV+jh9d7ccX9HQkaYkcGxXAOFlxXi2C3969G
         6sYYXbFNKZlTuJCSz2cxh/AW0MK/z1U23nYaNWzJJqRf2pM9sYN/WtiA0pYXDP+3bNyf
         CUfjeD1djGaftztDnESq60PNjcbV44TFNclJANOYV2hDu2Y8/l63yQlPZNQdxZv4xfT3
         /srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821833; x=1758426633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=DZSl95IQ1cPqorw5P2B9wktyiv3ZA2MvmqXPy83eVqKJv4adG+DPCi20un7lbPuqn0
         MlK48bB9UABzcp3/vKtm53VX5NtiRsgjdz0AEbykXV6ztvOXxaHx8WT45ugnTDdNiWC0
         kXWUWps+iG+LjpQg+jqhBrpoUZ6WgQv3ZQy9NjZtlz5apHEI+mo9xkJEJiGFNWIyLdaV
         zDw+tmVOU6hHp8olekDbWVWUIMQtpRHxUmht3rDCiu+axLOd2ZJ5C5tFCO/gpAEzQsti
         j4bhijEKTc4IWzwKd/lSeesT4CuDH97rIJRpxXVz6P8F7qRhRsVV0Ayf5WA5m0g4sIYO
         Kumw==
X-Forwarded-Encrypted: i=1; AJvYcCVhK6qbFNn5G98lJLrBocXQeJsmYuPamgXerMUAK63U6Vnkt0I5VRxJJqFCl96hOOEjDQJWd7qqDaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTXKgh+rFU0FXwVfDGWA+Mxm+ZO0NztOybAKqNPoWgUVcskE30
	L4rEFqtMDSh+EYxA5ZYhxFK53aDDA089KA3ziG9SBNddKQlXhzRbdzAP
X-Gm-Gg: ASbGncvveSS8s6oT4uMEJvSBvDle0/sbw4FqjP/biNRwCAxhiRjbH62j8LGO8ilQyly
	iNmTeZ3RPZcDoHs1vwZ7yMg/lV0EfqBvPmHWaH5pcdwkhMMuIV3YI+1vjjlD62VGGvAtn2YBtBO
	Ogk+nlTYPy7KEK93SPxRcDbsphEhAEkMmvitMMJCECxTWxUPEE2ptsvOKCfLtg/6hrDWyD7ZIwM
	htk9X0ZZu35l21HLeffzT30lhzwht4WGHWVArMQRzHp8Vema9XlKbIXl2Y8Qs8a7+OxK7eH2jYE
	Owsq/Lrmk8ExJDbs6AWqkWVax7nsnsxLVTQYdoW2Kf5eAlC1aORCs5beE5aHXitNO910NVYw9vQ
	DJWG1UiuTP175//9OmlqktBrafo0tLw==
X-Google-Smtp-Source: AGHT+IHE3K7efxQ+hk8pVBE6YY31PD4G3LjwwPuEi1DqCDNI+Ud0foCSPIjpPnt40T661VaNMc1/Ow==
X-Received: by 2002:a17:907:3e8c:b0:b07:8836:dea9 with SMTP id a640c23a62f3a-b07c3819dc5mr855439466b.39.1757821832889;
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd3efsm668828766b.55.2025.09.13.20.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
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
Subject: [PATCH RESEND 38/62] init: remove most headers from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:50:27 +0300
Message-ID: <20250914035027.3609569-1-safinaskar@gmail.com>
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
 init/do_mounts.c |  2 ++
 init/do_mounts.h | 10 ----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 7ec5ee5a5c19..5b55d0035e03 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -5,12 +5,14 @@
 #include <linux/fd.h>
 #include <linux/tty.h>
 #include <linux/suspend.h>
+#include <linux/blkdev.h>
 #include <linux/root_dev.h>
 #include <linux/security.h>
 #include <linux/delay.h>
 #include <linux/mount.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/init_syscalls.h>
 #include <linux/fs.h>
 #include <linux/initrd.h>
 #include <linux/async.h>
diff --git a/init/do_mounts.h b/init/do_mounts.h
index e225d594dd06..53e60add795a 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -1,14 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/kernel.h>
-#include <linux/blkdev.h>
-#include <linux/init.h>
-#include <linux/syscalls.h>
-#include <linux/unistd.h>
-#include <linux/slab.h>
-#include <linux/mount.h>
-#include <linux/major.h>
-#include <linux/root_dev.h>
-#include <linux/init_syscalls.h>
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-- 
2.47.2

