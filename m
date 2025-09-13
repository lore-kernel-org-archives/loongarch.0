Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCB2C1A2
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726243; cv=none; b=K6nnnhoEd7D7OOzrAdDpZ7TFStXJpI++RlBJodwZ2yMeyYKnxSGIx0GoRSutSNvnyCPawIjT/e3ORgoJWRgvwUrM4RBm0dNWePPvyqVHFM+8WDq1gKXhjLShjm2kfb3YDWJuPlwNGSEQG1z7K6/3ZdEKfHhvHHeYX1qN+/Z9wMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726243; c=relaxed/simple;
	bh=oyncyjaLrzPFmjkp22Lh+fbFcypfHWy3Ry54UY3bgvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uM+165t/HDi97veVi+gKsCjpQcfhWZfLghwNDRmDI47AEdJvGbKiQNjflx9wRHsevwCm+wIhKzKbUScsLTSYVBBpiC8NiT2fv3Eiw2DaGdXUkHDtrQcYK43Mjx9dpu17RvuzIY/yv9lGtuz6Q0xGI3X46dT76LbxMkWfN6VNliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMUYk7lG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMUYk7lG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b07c081660aso314123966b.0
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726239; x=1758331039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=QMUYk7lGtsZXevu6tpmwNTNkEhiI3s1Rv4CfIaDKtgkUB5oAsNUaTdlaTbRTdUofP0
         uuxZ5k8d3lFaYneuCOiiUh8us4NhkCdu+wt1APqF/uyQIZnudekBetaHwfMjKUNjrGAV
         dY35tm1sEdNs8pLr5iIpBu8OlS7dYTfmlIQQgAKoKyIXsx6LE5/KWsymQculM/5zgpFD
         YU+H9EC7wwQHp2tIcrNuoWlCoZj8ql2Gn86nygDdFKyCspzIbrsODdQBSAICyp2rZmAg
         pFaxl8ILCiISijLkGtLHx147BRWiYtOIk/HEjng0RFzHENe62Z932ammUA9tgJYCsDsg
         mtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726239; x=1758331039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=iQd1COGnSr+rSywYsWh3icxVaOKyD10qgb1L5SFJrrsW2qW73kIRME6ovuka0K5Rvp
         xYPUhy2WSg0yy9XRJ7WGn8e+nziNPggGyJDpkLqKBs19VyzO7qb1Bv2xDFFhBOW6H7hO
         fBZCPlzLbMexSFZfORiZ+/Q3bTQYzSFNhJuuV3TQtjNIFLWguun1j3rRbPN25OjI6x8m
         jcnTvIWWk1B4rs77sBnCMtqNNFpPzcjUyUk+pJcxVPi5ME7oYKPwbnoSgJbzW5CeBFVE
         D9v0h4Zkt36iKdtTREFeKqFNIty8QZDppbbgZ48eGiHmS3aJ1Iv6JBnvv5A0uapH4mEE
         QP+w==
X-Forwarded-Encrypted: i=1; AJvYcCWXHPZfVoqzBsJKWcN3/CJ4DL4BPIOYj3tJqkdiEVZ//C/iDKqKU9mfwLwGI8bgN2VoIIOAnhGtFMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YycfbsKQ+NepC/GJ5thPYsYWcCC/jruacMWmGk9frAJ9l7ACcDT
	adtWrVdRd3EVgQazsY+3wG9khxrfPvfXwthB+G+/yv8rJop+KBfEryac
X-Gm-Gg: ASbGncv2OuVOmgQLNXX+HD6ZRQO5dQFilIvUtD1zqxvTdi/uLkykt+cYriVV+XV0TUr
	i56yv/qMAMM5nxgRrrYe1LhwDpd+5hy/bUs6lqA1PLcC9gHBwCVjEVMOkw518lwbIujeYBgJJnw
	9W4b6ZIq7Hx8lwFdFlb28JDmGyArukEz51ZSZJdRtuOmsRg6VyYT/D1JL7X0piFCqIibjSbo2bm
	6Vfe8XW1oyxusHa09Lt7suJ4nvLANgTabdFGgE/1jo+qP0tDXLggDZaJSoW/otiGH82doyLKa+h
	jVfseq+fD42t4w/Bv6dMgQrz9P4ZASoeUVhJ+8AGP7sNR9aKQgCkzTbEkdoNkNgYyahrqjBcvUi
	VydJtFTZpMO+aNSdo5Y8=
X-Google-Smtp-Source: AGHT+IGWcEC7VhNjJKZzReFkWP7F1gkqH4tvvChKQBMnzdm+44287e9kqOEvM9aYYFOmJE4OYY5/Qw==
X-Received: by 2002:a17:906:4788:b0:b04:b435:fc6b with SMTP id a640c23a62f3a-b07c3a79fefmr497358466b.60.1757726238469;
        Fri, 12 Sep 2025 18:17:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ae181sm4478774a12.22.2025.09.12.18.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:17:17 -0700 (PDT)
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
Subject: [PATCH RESEND 34/62] init: inline create_dev into the only caller
Date: Sat, 13 Sep 2025 00:38:13 +0000
Message-ID: <20250913003842.41944-35-safinaskar@gmail.com>
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
 init/do_mounts.c | 5 ++++-
 init/do_mounts.h | 6 ------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 5c407ca54063..60ba8a633d32 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -366,7 +366,10 @@ static int __init mount_nodev_root(char *root_device_name)
 #ifdef CONFIG_BLOCK
 static void __init mount_block_root(char *root_device_name)
 {
-	int err = create_dev("/dev/root", ROOT_DEV);
+	int err;
+
+	init_unlink("/dev/root");
+	err = init_mknod("/dev/root", S_IFBLK | 0600, new_encode_dev(ROOT_DEV));
 
 	if (err < 0)
 		pr_emerg("Failed to create /dev/root: %d\n", err);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index 6c7a535e71ce..f3df9d697304 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -16,12 +16,6 @@ void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-static inline __init int create_dev(char *name, dev_t dev)
-{
-	init_unlink(name);
-	return init_mknod(name, S_IFBLK | 0600, new_encode_dev(dev));
-}
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2

