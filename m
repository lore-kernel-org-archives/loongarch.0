Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE676169AD2
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725907; cv=none; b=VTD9nIHf5MKimGpbF03n3zLpUyswvWtOXH2xFsW22B7DUjqQZcr6JaRM1Y1s85zvYeq7MIPn6vYIUeBZ4PAScp6DLO46yWMBRCghqZvSKUQI9MiXv6jF0a8F8l6zGIFq2QaL9WRPaRBpJAPxu38tB+gmcpmWMN8Ads6j09OQLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725907; c=relaxed/simple;
	bh=KpML4fn90471dg944P+9+9FByq3Xjb/jBBYn5xTeENA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NysUjRStMlAhZhH0LcV3F3BN+7DDFvSds7x1OKObquEw6cH6TuEszzaR9gVxKAM7e9/oU7c6nDOCq8hZZE0kiahFhOJPeEDH4kfZCdCeWKJbBNSDH/HN8hYuRFqLwIM/DjNSVmoFphJG8I7TjFh/e5/FJx2tgpdyXjPPX4zGUyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+N6A+NH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+N6A+NH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3680347a12.2
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725904; x=1758330704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=I+N6A+NHneb+H8cGFgbYiaUeoD+uSn0usMG73XGAm0SrCEs3PeQPipM9r/8eOmtD7z
         suqDE+QTdENZLgN8rq20ewc4rKNC09etuF404/VYUc/dyyqPiOrA+bXqyR6pHty4qjX2
         DCsH6fdnlRhrwkujPp4ZBWJst+ih377BqRlOA+kOgtCfIs3pax1/HiHZe1k4as0dm/L2
         R30DYsYw0H64BfLZRncq4zvQXpAONrWJXvLh2oSbz5Wy7t5Wom6gL2wJZj9YKg01Msgf
         e5NlNgwjBhZd4E1mlcgh9IxjBWuHIuOuslqcCGdT+zuTKjhN8kQagZp4AgMkwGK7qig+
         ktqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725904; x=1758330704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=sVc62yhacYqSQhElVKJscDOwQV0vAVTqOY1QpWdk+1XyMtTRyGGC09t089r9eaAW1C
         V0nbVL7l7tsCj6fZppsmRcgJNjPYFBOuANuUoFnJQtXMEfz5ge+2Y61VUJ2Ol/ptLxb+
         oa0NyBIXfMEO8zC+cevmcXimsxoZvw4UaRihk+omgJqrouyvF+CxHQAmFb0ZCWmQkbVE
         GqPEOrncp/mZGeNZ9DE6huk1+j2MqLxTkTq39Og6oqQvsK1W975e00ngzh1oW1sJhpTS
         1MR6ryKs1GrlRKtIyqEsyzhOOXUYAym16Pu75cQQPxq6DqyEM9i9GiqjlNQNY+Fam8I4
         TzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVobj0Nj+l5aFLVUonf0a+jb7rpnJHsG8v1EZZsDYtkJYZTHs5dbgtf0UfbzX4QVWRpNYBxfiqgQgw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2eyhtkagwx5jFO4hw/djC3eZr00+v3udlohXpSfjYqXlTu5QU
	CcgXLI3eiEC0pONFMSS48hSknQUnH7UxxetqJacYnaFrUOcy7GWKbCh6
X-Gm-Gg: ASbGnct92EqY4XlH/y1sbZF9PiqEVxJH5uwEqqlX9BwOVilJgnJHRfu5q1gUyF8nmxF
	9fQxp/G31+YKPNbWn2QGAzRImW8wS2mawyowlwcOJo/WZZhoiDFa6XKVMGIx0ht+LzBF6wNRY3f
	XUf4QhvzIyEsqHAJigjZZnUJ6tw8nUc9iics0VOi5OByMY2XVaW5b/GC2WeLPsOtFgtSRzlULoL
	ZmY1PpwOXZGE25NoSTwnLnciYKJauBi2Uhp1HmHe/tpj/2xYFSj4F1MzMSad4s2bMsJWr6c4rHJ
	jDOf2y0LhjYE6qZn1WjcHMSbmXw38iDrV/0XgDXaYjPGlyJT79hK+yVMYK2a5wumBYgIuXwHjRU
	/usCWbSLtaRzCxVVASpA=
X-Google-Smtp-Source: AGHT+IEEs4w0VYWOrTZ2mf5mPdRdgIBBMsi5zMJEle+Jt2EK6Q+4TbCNWtdbvmdxcJfUUMXxxDwLfQ==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4990182a12.1.1757725904210;
        Fri, 12 Sep 2025 18:11:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm913566a12.20.2025.09.12.18.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH RESEND 29/62] init: move virt_external_initramfs_{start,end} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:08 +0000
Message-ID: <20250913003842.41944-30-safinaskar@gmail.com>
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

Move definitions of virt_external_initramfs_start and
virt_external_initramfs_end to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 1 -
 init/initramfs.c        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 8bdeb205a0cd..535ce459ab94 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,6 @@
 
 #include "do_mounts.h"
 
-unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 int initrd_below_start_ok;
 
 static int __init early_initrdmem(char *p)
diff --git a/init/initramfs.c b/init/initramfs.c
index 9a221c713c60..d2301cc6c470 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,8 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
-- 
2.47.2

