Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40916267AF2
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822161; cv=none; b=haxx/Mwm762F79ZQoMD/vyJphbkPFYkq4o+m01Ow5gXVoHVTVGcukYBSHNMQ7eKCHJclYJSL4AdfSOsF5YvBmjs1boOzXYFc9BjbeJzbAKN5xGrvuYCQgfB3eMqmky8bb9AvXAjzWNc/A4FBwgwwjYCDoZgupKH/GnIU0CHsh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822161; c=relaxed/simple;
	bh=n+mmy3PjKTU6Jj1te3ZtONq7xS36QH+38sfXYxmW5ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2RGs/rIpbOepxdDfM3KgV2/+ok/KBTjCS5dqDL6YdyRvCE3D+fa6dkUrjmHMROY2IIsjuGmN9si5y7SE/9rtRphJ/Y8l+6v0v/L+1Aqpg9nJkFfqSNpKoUM9LiOVZf/0qObW34KZnJYX7dSeQR4EyRIq2EQs4IfMOAVG38w/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWSJAY3t; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWSJAY3t"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62f1987d44fso903892a12.0
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=JWSJAY3tw3mbJwvrlVsXM9qG3uNi8FviXx2pDoJGJlvFSCgpYMFEnci31YG+TV4Jhw
         ScEE8eVqI/OlirSXP0l8BPDQhwc1RmSZ5bIA0DRUijJpMf3V2rLl9B2tWgjeshdO1DGD
         KIC/CVX2KvkbF2cgCGiL5Ke09fiCdCMijfc9Tl3vI2/vQpyxU7QdHCCS79fif9zGkhEC
         ofjsnj9pe91SA2+QZJpckSnxBVQvgTy/HINdTeCqj0IaKfatnaaDT0JjossoS4BdXr3B
         5GIxeFF+UqLngqvpDnhr/2aJPAeuPc3baMWm6zZvKXhqp4zjYMKs/wwYyHY1eH7Z88YZ
         akfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=IBsBUSQuLW6xWpP5zwQYWloF86YKjY+PAxdde8ixk01F9+w8i6THayn6yTcuKZB0MD
         W++rGCV/+ghsPsnvoMDlz3j/iuR7xQ/4B6RvSFVn+Hf7zDie72oXs7o6lOR/i1Te/B1r
         784znezE5AGPVkocQwtjVauaFne2iMp8+IYwJ9IRDy8AE+cfRNXwTpJ2q82seC/k42mb
         k21qoHXD2lJrtvMvyO9hrvd6ykdAYRc4TQaJ6CsWYJqW/jyRR3LmO6Jhj4RdNHqwxp5e
         v2Gu1KOqwkYaOHGv7lzvMM9zwFsmjq/HayVAfxXOr8rcqIP7CCko056WE5IXcesEFnti
         Juhg==
X-Forwarded-Encrypted: i=1; AJvYcCXHNJ/wO+UEY1vc5X/LLU2q3m1kZHThZEdKc/ayAg+mgbc3JMGAc+LChgW9zAYSDmQMTuFlK8ODaPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz83qyYmN7N7suOp0Nce3B8PLoVtVTIBJb9MbVBLp3e9//2noVh
	inCZTUFCKYaGkwBq/lM4Tt8AwUX+j1Jif4zQF55cKYur5EeV6JuVz2om
X-Gm-Gg: ASbGncvnOL5uXDiwWemxhKg4OGNpP9GMqZC+5cGCwEqkszjAvNftAkYn7W4ZnG2CSHI
	/lVleajurCw7PDNUw5XNCAxejLsIwiIffYcwXcwr8kupdd/KbJOIoebWQDPkL6KS2qzLuBk6z7r
	HQ7iTRgB0mVrhDzucSu6IBWZopW1ZdTko80VNE8gdEEbloGQ2SHw94km3FUWwhNzn0fnpjno01t
	JlMHZcUAlRSpksP/aEd1UgTk7sxQJ90f2dcANOoOTDocbv4fI3gwQHxIOG9YX6HnqkaIPnbNR6p
	qxMLxYr9OBcq5Mo3HQALl9TDDv36NtelvlCkWoyU96hjLwKMSGP41tA6W0sKFXF7ZQrXRuONNm9
	xBkHu8nVezk+G2JaYxHBMeAwy+R8DdQ==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
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
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
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

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2

