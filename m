Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07CA192D8A
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725580; cv=none; b=LJAmr2rmYvEwLolHJd2r+ViUmYaQkSEwGT8Lo0DGYLko2KkmosBDACHRtIuzt/aYsgSlcMNR0ztJvSzrz7QOvttkQ3h24EhwofvfEkcVdrZa90vmR1Y25owjnfWDFv7x5t67vFrGlitlS33VIb9U8EbQ4vvOTysD6LlCYUFElCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725580; c=relaxed/simple;
	bh=vklOel+wSCjK4qNA3bbVH6akiUZ5v6h3w1mLbg32yHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLYgiHAWJDxNzOrSWLa+eRS0nwsvMkmpnbDxUN4V301EUkHu3ZlEsXH5DzsQuWlAH+FLNPOln9zJaXTJN/dgs0o7zogIu+b/ugSwX45pd8LMcCvABrdks1g4527v1VsJk1E36Xo4mtmX6gHkSclK6mMwYSTZGyOSp/0WgRccrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzkrObfr; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzkrObfr"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c38680b3so227348066b.1
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725575; x=1758330375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=SzkrObfr38bbcAVWOCPzarS8V0w9NkvuFzoT9uutBkJtVIhVOjtL4PsSUfY3VzKKkE
         tN9zWzXRqjSWnohwG6GPdkPFUXPJqytjuuZB3f9duQcWgbpK8fe+MuaucSqvDZUePewx
         X9qXdMk8C3i/UXRfr50znXJtDN2XSQ/cQbjdeLzgaW1C3+ItgdYeNu5qF1WiNvwdyubd
         RBOVK8jCi7ILCWSp9m94shZRInouulR7DG1/wh5dgevjm3eSL6juiHKij58EKkSZLg18
         ZvfOLVtdkx5seHpi/ARcZfKTZDEfroceSr/Yp0j8PZfF9dXoVXMvM+BlRugzlQd5/ms+
         d8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725575; x=1758330375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRKyxFwRI2Qz0k3ZoQpZ3VLrtZiB303jicB3H5rLu1o=;
        b=GpdjVC5Es/uVbDoRBYGijMmbXPEih6fHjlMWriwS73cJqqHutlp/aORauKIAHYulFU
         dIH9pvX62COdI8zFOy6ML1m/T/Zdl2s8bbpGP3xv5yM8Qi1x3SVPk8yr5ebPH624EEYg
         oXOQfSnAquxG9nOuipYAxO8Y+ys9ttLUHWoi2eJFnAJ7QZNL9ypvTiuxbRDYEpmPTka8
         xQGtPAz7b2lHksveWhsqUw22qPTv7wXzk5Tk1phVnA0herq77RtcLH+FIvjUNIGhl8+a
         JXfoS1Bip4BE+wPmyBqoy2hFEhw7WaalexPTS3eiI7gRUm51Sx3/P8ATsXENKjZsbfEu
         hGUw==
X-Forwarded-Encrypted: i=1; AJvYcCVNLWbLGPWeRzuMPbNT8gNx0B1GnK1h+ss4LGGfEvXQa8IDwCR7TZo2XqsDLTHYZdg03eephOsGbWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGxlH4/fnnZv1uPH36MExE6WzXQlSWlO8dGciu6cNNq/nfo1Es
	mfKzNCQICTWIfJO7Zj+CTK7CRe4ZBeju8gOCaFyW+Vn3tZUK7vdh6O1f
X-Gm-Gg: ASbGncveUoye6anMLFeeLhXIHdlAWTS8YgMi1ya3tLiQYwHyZrkf4t9KlJqhmUrHUDB
	/dv+feJOslemkC9jbMg0Td0O2AX0V4i3oiIuLutlcILZ2IKuLNerjr+bKoHHh0xd3HuPgBqNpet
	wL8UCVy4E0xlGw/sKteFUAjEavrS0kgnlkRbDFF6SohsijxUZubXx2mBuzqVWSLTMMWykIr6r2C
	Zc7zx6LLpWzdZuZZQxGhB1TAQwzixOeY8zHYj4b6g5J7KyyacH5vieWdOI4HWo6Ewstgj4lNckx
	JWiGa4n+GSwdm/7ltHB6QwS7WVpoRGF12mu+QKyt3lsRfrvaZNOG7DIggn2ajSnNzdB9ZDi/JNU
	k2wpHYdBuQ9LC3lwUlzN2qkwSI44hkA==
X-Google-Smtp-Source: AGHT+IFUls6LXsrCLze7uCxm9gIrKR+0qjIy+VauG9zkpfPwn7RwHzjJtZF9/Fq3L/RMfRZn925KxQ==
X-Received: by 2002:a17:907:c09:b0:b04:35c3:40b3 with SMTP id a640c23a62f3a-b07c384b024mr492655366b.15.1757725574734;
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d9e18c24sm112553466b.61.2025.09.12.18.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:06:14 -0700 (PDT)
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
Subject: [PATCH RESEND 24/62] init: remove wrong comment
Date: Sat, 13 Sep 2025 00:38:03 +0000
Message-ID: <20250913003842.41944-25-safinaskar@gmail.com>
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

This comment is wrong. free_initrd_mem may be called
with crashk_end and initrd_end as arguments

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/initrd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index e49c7166dbb3..4080ba82d4c9 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -6,7 +6,6 @@
 /* 1 if it is not an error if initrd_start < memory_start */
 extern int initrd_below_start_ok;
 
-/* free_initrd_mem always gets called with the next two as arguments.. */
 extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
-- 
2.47.2

