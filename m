Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C881662E7
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725974; cv=none; b=TakVhUYE8SgTrGqd4ATGYW5nb+XYEKtpGAyboiYgBwh38mffMUdErA5NmsHpu22ZZpOZmv1jfCQZZo41oDeF0zGRzHeOoBiYi9fHq6PgsZeQ3bXvHjYgXA60znp9/X9XA0viEMWYnTTKyI6J4iBBRMvLhgt5DNe+c3p3g+Yu+WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725974; c=relaxed/simple;
	bh=5w1rh0L6NznGkqOB1ptiKwAFOGZfY5CoA2D4m8g2/Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYYU3mxeYCXWjts9ecL9Zpb+PkrYczwRzP9V2ASln+BLf0i52YOcL81DX8Zxg2tRTG0tAK/0ptVHEFyotxaUaFP2z0x7yW/yFZf34R4bco+4tSCWPqUtCjoB6wc83Tb5+IOhlRBPo4ebsGxvdymp2pTkYGlAbc2dJWvhCEaGXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo08DUDi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo08DUDi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a16441so374603266b.2
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725970; x=1758330770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=Zo08DUDijRaBZTyrM25w2p0S2cce/XwzNJL+mh3sbE/Bju5vZWj629prqoXLxUxWeM
         FYb0X/a2QB3zRgfim6vBZKOkOk47+akijPGK9o05p/fW7ZlQP8fzIGa3/QRQ/7g4YBf9
         Q+xrIZOK3v9JpyQK+6kUrP9kBZ64g/Be4varMx5ZZ/hck7fAxF2VGChuqCZZerWvra9C
         6D1uyL60pBBV2KDfaeD4Py3E7VkMLwmUJsw7WOOdMntQMxug+yHudiVglvGG7juNWDhS
         1mp4oL2erb0joXaV9a4gjQncWrMeNV4bhC1Pvp96rzH/0eWsawexE1pLOP2uTcyRvjr7
         JGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725970; x=1758330770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=fDzJfzH2v8RG9sAmMr8B7RMI+DPV+gVrLBhzanyXC1XcsWI4mJf6gNHqIHb5qQqCWV
         moQYBA3eQt/WkVTZmPJVIVZv3ImwcXkuw+SAP2EKFPj37i+YYllrg0+quHH74aRcB3RU
         5urKHn9KeasPafDlBU8t0J3ebgDvd8pE26p2Rt+EI7ovhjPtPTcMhG8ZPipejQuLFx+2
         pqJ7UlqALFzXZrDUbIsWR9YF1Lwy4HcH8nvg6WzKxMbHlfLPfyVf/nqKgBctI1c+zl+o
         RBvw6Cy7vKJFuh6TxM7qqtaiX8+u0ThpFaxYwUre1+KJFSa2liOEspaxXi0pQ2WC/G0+
         5pVg==
X-Forwarded-Encrypted: i=1; AJvYcCXAbCgZHGwelGGu41/AJmPwrHpyGeaws4q6mf1oIXbo3VWQl7snVWXLtoQ/BMB2jN2rVxn29x8fdyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSgmjTcpyHfZmYwTHtdmF0AOD49kzh9g5cw7JDpYQQlPXe66I1
	y4P0Sa1juxvZ57QDbY+n4F2fFV++VQ4hjYHeCsfOBjMYVNoE2T7W/7LL
X-Gm-Gg: ASbGnctYmpanr4XY45UX2swJmoaYIv6GGK87wVoSGUFuev5E9iBAfz80UJRhLI2eZnN
	NmkrBI+4sOaemyeCJsX6gKDCMcn4ckeppP2oHf9dvVNiW39pQSDc58fIzGxXIAKFOKGl4KUEGMv
	UQPvUNB3p0P09PDQT/fjoIn1lkZbOA4BszZND8UapzDA9nXJUQZU5nDAEYYwWBGFt9CkbMdLqGn
	NIIddmJg3aKbTzL39HIS//U2bdNL49JhZo/z4ZmjTL/MzN464XSpMaLfyuVZWV3cnC9cwL6HZV3
	ljXUK9xLguKf1hPGphwyrQj7KvhxhWwO52qwabw3rX8TsP8fqD8o3Q4YX4P8XgaF91GmBUbJjx1
	TWzlmr8E9nfeNg78rYMptDAxdEAVbnQ4HYsauYet2
X-Google-Smtp-Source: AGHT+IExCbHobezsJZBylPatDCb3rXiTmvHjuHynF55nxxCc14bpP2oPLB71sx+Li40Hkl4GjqRelQ==
X-Received: by 2002:a17:907:97d2:b0:b04:31c6:a434 with SMTP id a640c23a62f3a-b07c324cf12mr467235966b.0.1757725969783;
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da327sm479612566b.11.2025.09.12.18.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
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
Subject: [PATCH RESEND 30/62] doc: remove documentation for block device 4 0
Date: Sat, 13 Sep 2025 00:38:09 +0000
Message-ID: <20250913003842.41944-31-safinaskar@gmail.com>
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

It doesn't work. I tested this both in system booted
using initramfs and in system booted from real root
device directly

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/devices.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 27835389ca49..6ce0940233a8 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -138,12 +138,6 @@
 		number for BSD PTY devices.  As of Linux 2.1.115, this
 		is no longer supported.	 Use major numbers 2 and 3.
 
-   4 block	Aliases for dynamically allocated major devices to be used
-		when its not possible to create the real device nodes
-		because the root filesystem is mounted read-only.
-
-		   0 = /dev/root
-
    5 char	Alternate TTY devices
 		  0 = /dev/tty		Current TTY device
 		  1 = /dev/console	System console
-- 
2.47.2

