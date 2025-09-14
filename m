Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93142459F3
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757821873; cv=none; b=FBVyZxnwBoK47LfO62h2yiEIbuzYuya+w9BiXuwRU7KngGbx43BnKttSkJeyihyTYqQnkAuXr51yEnArN1Bw9dI6OGELU42QQWPlRmK2v3HnwzmH6aZvC+cg+ZRIS2tRirhLTntqV/XudmInVM4hUS8bz6m5TlrBGOF9tqRt0jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757821873; c=relaxed/simple;
	bh=0pa06GJsqjKCCDz/UM3o5nwPqkgP4CqvzP324rR3v40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+Qf2KqQ6H7LhFaPET+9CXi6f3H+8ybOtrm7PiHZAnel9S7dBpFV4puokuYWZiPbBTJAcDnX01fVkR8bxh25x2v3AlIh3F6BoQFIIXjSV/m9mxzrUN7sMuQG/ej9wv7ncpB+bEpIxJRViJq9aigVC8X77IfufXje6yi0fbHqeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHtLk7Cq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHtLk7Cq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62733e779bbso4537383a12.1
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=mHtLk7CqPGiovHx3XNy1qynbjY+AFbHwDUuv768AhuHgOI0R2K79SvKDildoA0uRxG
         icYqQ7KXNtjZ8TtMTyT1QTYuNQDDBqljzYN/v8OsJLxarKiPz6y8jzWZNsUifG+zM3Y5
         tkS5DeFM8AuYG4xPXzsjAXcrX1gcocWYmXiemq+XYOPFS6V0l3vGQ+51uNm8ptnG3wyJ
         Rc5WmPwQ/QnKmxR5BsZRWq4JeD8jaLISsRFOfah+hLveNjTG4SbGzxKV/5OWmcRfc7nu
         eh0lmyotl1uh1GbuTXZaK3sljhbiEyDpWPL2fuikbPboRVUj+j3RJcWjuL5rMw08amQk
         KThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=kX548T2Pru9laR+jsc6E0jN1MLP7ndMR0JoZ1Nyu6bD8hRoRV0XgnjlpfCmp8McbxN
         i2oHzYX2xts78lU2OFhTzksQ3iXLB9lgFMgaGfC2z/LQ15IrK2QCnl3m7TG6BHEBG4YE
         +lJH1bHljO9pLKplh2iSceoNt8/foSCqi6nJnvKI+GwcxpK7dPxgl2ly6ZI0Lcbg1JJx
         BZZEu5+vA6r6d2ptHDOYeDOTP79d1yNtMLfgI1CWdhkO9N7xQ2CrO2QKHvAEQ5g+lXdk
         eykQs9ahNyVy9l/QvVjSHZn7qNn3l2teXVju4AzTmv19eh1TwPUOjILbeZ+4ILm+wVmE
         glrA==
X-Forwarded-Encrypted: i=1; AJvYcCUheB28so/H+xDMVjgj9s0izOCibGo7/SvPR/YEsyneh8wbADXTShrSsXmeyxbueWHA97BAvfqegDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaZYARev5pJirYF5mjQneyNST5aHJJr8FVbX7VTCrKQyzvG9mp
	tjsOJnWdPYyrEN3+CMbQTiwUUo2qCHxDb0WVxn+084fqoM0FcZkjU9J0
X-Gm-Gg: ASbGncvFeaoMLKvVhGSnoauNJG+IndQVPikCRRtJSg8y9rDVh+sdDQJa8TCcmgHp7B3
	kiq1NrxUooDx2Sp3kJr6hF5+4LBF0mtKrMcuu6PmL3cqVY3mnNgUQCc6SPMSO7W9f7aKFVtDkLU
	WASIZ+XN8TZt6yiryC2emDsAXuUOd2DptkNpqKDgk59pb+OPkCQHYRc1c3kV6TxaIT7vcpe+AgQ
	73pbzqFFS407pZNGwmRhDODfT9H5R52NPQwSC+6EOexUdywvYc1MdEjjCFbVK7Ml5hur1iakYec
	4TDQAALXttsOf5dxIa3k4iKKQEWK2i+eKneW/FFSAIdxThgJ4rNwefeXzjEI5Vlqv3metZYGwyM
	rIkfYqyoPsxnOlVwMnm4=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
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
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
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
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2

