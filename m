Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD219E968
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726111; cv=none; b=UGA76DU2gpzggPD4urGfGkw0hxwzgSs770+IiyY5zxkLkOL9MObpZVPSis1yO1pD+iz7fg9XbmR7fgWECIuNd51TnkslT5ceWjTp7zv5LOYFazkTbXMM+oGw75X58NlsTPwkbX3vyQOJfZEIhB2nO9NDoKzyMhhzJ86DncWjI4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726111; c=relaxed/simple;
	bh=YCPpMauct/lx0d7FW5hIc0XQ6n2+DOQok3eBS/uAsZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jj0+9dEG+EPL6jFgfqyIqCPWEmEXERW0xMFDPx0izQxDURakxol+H4G5onqnfXLp3etju+YQ1jJ+M7De8kmtUlf7IX3ffQkmSmv02a5Q6Zn6dIkb9aAExrtlbYiuRJKtiJuYzgSdtwcPunBaiKKkGJJEaw4yG4NdnakXO5ENfNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BG6mqw05; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BG6mqw05"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b07dac96d1eso101248066b.1
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726106; x=1758330906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=BG6mqw05mf2w+x72wBDBqOMSYx6RewcQMBCZDZk3J7vt6emWEimYmfTZ66icEEk5jj
         euDV7OFTBVeDP9PWsB5n/tLSB5wTwAL3Lb7BqQJDCzclfLOk+vk3ENc78fyxIopQ6FtO
         DPKT4i/6+sonf/UWq0TBLw7LsqdV0Y78/n//jXXPEZESs0/q7pPuRq+Aj5sChk1gU6aT
         hdsJSrIIBCi8dIFacocId7aHJ6VKb7gieAPe+4MLn6CzwevQxj3xuo1SQ0Js5hSFCNr3
         xO1l6ZTzI6XqcghzJ84WeIkrg+TOSiUYFoSL7acOkvSsKYvOXtK/4UvrtVvqI3Dedyr+
         ue4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726106; x=1758330906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=nrroLq4LJaIushtNJaEQAhlfIEUuCiaXK2diiz6bQJlmW+m8F8b+gcY5FNLU8ueTQD
         rvgvGztEL9z7kgxr+eEn3FFI5rReEDJmOSbj5/Lu/x0aUotnLsu/EEEg+u+6z0nDWvlH
         603t9cuJZyj7vj6gh+Iex+DvSuJFCtJy7s2TVFWR2TnEes5RcUkwrZyJCrg9F/HgMUdW
         yRd832cQmc7jt7jNbSMP01LWmqWRsXSVMEd5HETxErBYf84FutFjZWkyKXoJ9Yk3d2/i
         Sb9Tzr5dwmQxbw/nPGM0epMI/L26rcdxCmwZsTFm63LqoBh1OMVRa2hwFwNdHUXYVRaJ
         xUsg==
X-Forwarded-Encrypted: i=1; AJvYcCX52N9hN1ws9J37OQeE7v8wLOnSMVevY3p4QlVE7+emfUJDve1IXZzkiGMKFRIYiRXeAIsgOVetLhw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2VkZDlilh//S3ObGuq1gE+lKScBpqMilV+HmO/tGnizsbUrea
	Ornl/u1jeNwChl1yW0OEgtFN+pv5AOaIHzFxrQmKnJNppWM9UtCKyP6j
X-Gm-Gg: ASbGncsQbkyCz9hkJdpAprPxPoY8hrEdTJJ6djM1OIkmEimgwvDE5mPTplZsjPslLki
	RRlJ3pDJpCSgt5HvXSiHEE7IHX4HgCGmbErEI8Wxa2VnqksOLSmjPzAaE83rMbyLSssxRA98VhJ
	kuJWwfMXhXxkR7osE5Qo/uw/59LfiiNDoEnIQlLb2p6NgTRx9hrzT5giZF0e1tN8u93408I7c/i
	IPKKc9jA76W3Z+N2ykoaDWBn9DQsrsoMxN2HUgxO7zCg/3d4FYyhlq0TKz0tVW59Q1pP3j/3qi5
	d2/bEHFX6M6dmnHrMGmPdPmVIObdNzGGqkYhk2hnj/fTdig1VIZB7LHQT9BIPh1teKmUtPlWTSx
	UMm99NniG4AVIJULaarg=
X-Google-Smtp-Source: AGHT+IF9BfFXzJCfAH1j6Whgn4db4w3JHUdrGBSr/SBtjDaVKK8KXKnwXgawQKNvW2//sA4Wp0ETBg==
X-Received: by 2002:a17:906:794f:b0:b07:b19c:1389 with SMTP id a640c23a62f3a-b07c2543931mr499914966b.23.1757726105874;
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e4fesm475799966b.106.2025.09.12.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
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
Subject: [PATCH RESEND 32/62] init: move initramfs_below_start_ok to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:11 +0000
Message-ID: <20250913003842.41944-33-safinaskar@gmail.com>
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
 init/do_mounts_initrd.c | 2 --
 init/initramfs.c        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d8b809ced11b..509f912c0fce 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,8 +12,6 @@
 
 #include "do_mounts.h"
 
-int initramfs_below_start_ok;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index a9c5d211665d..90096177a867 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -601,6 +601,7 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/kexec.h>
 
 unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+int initramfs_below_start_ok;
 
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
-- 
2.47.2

