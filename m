Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4626CE2D
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822306; cv=none; b=Afypobr7MqbQ8ymb+g2r/clXNngRLihuN1nHJpyl4JtiX836z9NpFi/SfjGGmth+RWEMlBVmbwMHNRnoB95haIGe95dO+3rnDXAJOxb9i45bzsMKdPkYxSt9CSEkm1KLCUySD+3IPov/sDUqslq371oWKc2XhSkZ+iW3txgPheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822306; c=relaxed/simple;
	bh=FYF9OqnW1oqjULxwM3aAWnQiXFUGSps55/Nt+hFxJ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZEe2dRCDvUtX3z2J46SAZclIz76UiofzB15GvhMB+ta0BFBHLPz/APIjG0L1XW+TN54csEnTVBQmljHenNtnifvGM8niawTS9judyMnIdTVnLOQsM8FsLZYOJE1fS69Owjw499z43d43KvbxmdZOtvMhbtZDn/j8C28hNOkBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SARcVLzO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SARcVLzO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f28da25b9so366164a12.1
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822300; x=1758427100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=SARcVLzOykzeV4WlDLWAwPrYzSZx3gZNRuw1MNFuMgpRYWDhYsmAxuY0WZfLWcj632
         QCKAx4d+76xpzvA3MQ0DGTO2YJ0WcEUezwoWBM78cvWZYVY8jcpKiZ8OBUFa9YGII8DS
         8eKKNcMhHUJ6ucbgbvURdwbPDi2sLRzxfTE1OPuzycluf2WMHJvgBXTV+9xIYP/xDzae
         z3TzhMnXUyYzySOwxPe+8pVLytWNjEyqpK/3gJ6TuYsMz8v9bNWRGJbamc1FJlpQPERf
         nQjKA5MF/UY9uMN/O7YMbKSiFzDfSuo7IvjFzPrKY406xWYyR1vCUuMVxc7XYSDI/YFb
         qCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822300; x=1758427100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=RloprC+SMDSoFvpz1b87+lJC4rIP5RLn+77LzD0KhTCeLPvhHl6bvj0XZZ8WNxaNYh
         9tsQIYLKJbEjHVUQSZAa8mYLN7x2fMNmZL7WQMjJrq1Pb1/j08jHhU3Zs/FvjRzPDaSx
         uLf8P5Urayp1TNkMJYKn/+2lExClogWG8RnZtKEvDqc3kq0fkH26oLjqMtbHSNd5Rp+9
         Qw09E+l/0cU/hTfQsbdVJ2tVI+la+Isy9I9YmC4LHGwtvqgfhg4gaol9h7C6xgwzUMsO
         KR9ALbImzkZW9mKExR0RbQpO2M5GUPtj7KR3ZUts3dvZqLtrmjuDpkdJQ82abrV1GUDg
         m9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf03IxHB5PDp6S7+reqWID7uzUEiZaDpfTSUyBa2fVJf+HT5fNlst+3BaJrQxvKGeDQaYsmQGfDhw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4dwY48BVU+enIbTUbwp7vXvSQFcjBgt/ELbKy4YZHQ+7S53DQ
	nL3in0wZH9AX/KHhNQTMWzwWWAE6eD886bXFSXIZzFqSUgrp7Y9LDAw1
X-Gm-Gg: ASbGncsSpzj6P1ejJEZdW6Zh/FjwtVk25yiSlLpVL9MCvnxOGQb5yrHLhNRCsXHkK3K
	lJy9GR97EKzZl+riiZt0E5k6GhkM569ifGdghdDHDLjf0H7MIUZ2M9CtLv53DlPw+Pvs2ZVtyp+
	aUjbGG8BJKxZsIAOr8SlZvXXiKG58Nl697bgdflfbEgE3jLq7PG4HlXMQAB406GJLaMpaO4QKWm
	20KvIQV3GH3UKzgpFgd7Gfz3RXRS36+/cmrWyCRnZGiAEfIuxF0lng97CHQywA0R/eIcsGvRSJY
	7WbDtzc+T/MnXLpaJUwdc72DhU2FTUv5SlOkbzw2FtiBbn3mqF3YSj+5k/SwSaaJCR4p2FClZWA
	uI2SyhqH10XkaA7rEq8k=
X-Google-Smtp-Source: AGHT+IEs7a72WksMtWatD4lSFnDxnNg7+5MS1D9GOkH6MKg4k8K6DTsXjCx54xq6hKPtDzIS4c8/bw==
X-Received: by 2002:a05:6402:42d2:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-62ed82599f7mr8759493a12.8.1757822299751;
        Sat, 13 Sep 2025 20:58:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62edb7d9cbbsm4735738a12.15.2025.09.13.20.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:18 -0700 (PDT)
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
Subject: [PATCH RESEND 51/62] init: rename get_boot_config_from_initrd to get_boot_config_from_initramfs
Date: Sun, 14 Sep 2025 06:58:14 +0300
Message-ID: <20250914035814.3752803-1-safinaskar@gmail.com>
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index a42f1f0fce84..c535e0613df8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -264,7 +264,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -311,7 +311,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	return NULL;
 }
@@ -420,7 +420,7 @@ static void __init setup_boot_config(void)
 	char *err;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size);
+	data = get_boot_config_from_initramfs(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
@@ -479,7 +479,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL);
+	get_boot_config_from_initramfs(NULL);
 }
 
 static int __init warn_bootconfig(char *str)
-- 
2.47.2

