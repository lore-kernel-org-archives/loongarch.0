Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0426B2A5
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822053; cv=none; b=l9QpZvJKXu+6gMUbmqteSjkoi1LMo1uUbr2c39OPssuj6jaAlYFvEhYQrkPNmJZE1fYgoDk0ATxqzoJIoW5EOc24uWNvuoBwSRZGx3eXYQFIDjbm9W2F56oh+uK4N+d55IltlpWoAGehLy80ec25s3RXKgN4/6FAtS/1pv22O0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822053; c=relaxed/simple;
	bh=E3G8T/3zLMm3x5kad8USEbJCkxfjt487WTCm3NfxUQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WHE88A4baxXREE7zPpmJ3rPPuv6/Z8Hyq45eY/XeDKAbhf6/kMRqCS8ijJZu/O1D7xBwyHVvGaf61UZCfWjS67cIdqrb5kTVzOFirUKiv+MeJWYG5/+CFr4dy4QTcJYPmrfZ2vrUthhDQcyFBu/5ikDpR7iD/keDDl+NIN64jvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoM5F09v; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoM5F09v"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042eb09948so660048466b.3
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822048; x=1758426848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=SoM5F09v4YlMQE9Bx98uPE9YLCBrlmLQV/JgNq3vNMqRiGg/Oi6N6Kd13oA6ag/AGQ
         Nvp+7CnkGrt6odN+yUcPUwINR9fF3D7PVSgCbI/YodZfOIQRgTHXydUl6c+GKVPWBP4X
         2Zi6nXv4cYo1oQRdPLEuZsimRWK8v0fUG6dpNgNhNHiqnwIKUbUksLi5JqFIHR02PksF
         ECx075KTHgKhOxzsx7REONC8haoVeSkIjU13mzI7hdvxoI9hJX1XOftIqK7bX3A7+A/T
         FGKhwai8mxWHEp7h+VK3cRnsGVuccxGViH6hpMCnPO1Vo880weaCY2QtHvNxTByB0Qk2
         bmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822048; x=1758426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=iHgAxihJiFMv7rQKMHlM0LXPw+Y06Y31eKmF454RdVSu37cKv0JO6XHsntNZNkuskx
         pJSxZTgbOJGb65LiA4oSCNnt20LIQd0Yh6xf/0tXsQw+tSlvDIatTSs0W+cqh1k0TMlu
         OksCOHT9YDnYtprhhpQYAL+Fk0vT/S4bOLBAI8PWDUy70udFUAPXqgs5/kOByLgkNLdH
         cYs359O1T9vNqiEeEwAYHFpzpfQqS9k4CJcsp9GrE/KWguhosWWfYGcUEeXjwO+Lvw+/
         MsG4fXEEXTnYe7iYUGaZ22ruQS+Qr4S8Y15Pv+LoT3pm9XmzaLmBX31KVHmaxguGgggf
         xeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh7NfYEpfkpAgbIsxFIIOP8al+lr1Iy6hlkiwZ08TEcUOxj4ikXiuL7Ih6gqcXQCv1WPXQEZVe5cU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWef2QRXIwKU9McFDCxL2+uzlPfKgko0pxr/hwhqeJ+VNbeKzi
	hSouTd49kOsxf6m3tYB/a8P+vdvLyAFWcqBrmgqgc8jWFSgZv0BG8u7y
X-Gm-Gg: ASbGncvoxe7rFLziJHXvfWD68vtOc8wS+ysc7p1WYh/JPhUf1+0Gaq6FRQTKZhpl1lN
	JanfmkNn3162j0uxW13yPqfOk4Cpihr4jM93kmVFAUlpxrcHWwSilPzOXL2I+Oi5rfy9kRho/zK
	BARdSBt15R2nwScNletRidc3ylMrB7qwD8OTHZZjBjL1fmnwXX23cRFxH9IowTvOPaesFOas9NC
	rFzhCSz6lhaafSMxKKFO0SqJcNILPNHL+R66hr13hhWHRcKSexmd05x7sXsqaqnKJ4pBXNHmUbc
	ffx+UGFPP1ded+OtYr9rfRee97RivRqSwzc+qKIKvHahKhw61Vh6upGHWujX/daXkPhK0sokLcx
	x4SvzR2IeHW8KABCc+2FE12nF8lalUg==
X-Google-Smtp-Source: AGHT+IEVLkeZlLSkzoTpPLzlBRvNTQ9m/bl133jXYp2zZldNvB+tlYKH8pXYzZ5ISfOO2+UjGM6RFg==
X-Received: by 2002:a17:907:e8d:b0:b0e:3d88:27fd with SMTP id a640c23a62f3a-b0e3d97e027mr75192266b.8.1757822048020;
        Sat, 13 Sep 2025 20:54:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm303079766b.56.2025.09.13.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:07 -0700 (PDT)
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
Subject: [PATCH RESEND 44/62] doc: kernel-parameters: remove [RAM] from reserve_mem=
Date: Sun, 14 Sep 2025 06:54:02 +0300
Message-ID: <20250914035402.3670906-1-safinaskar@gmail.com>
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

This parameter has nothing to do with ramdisk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a259f2bdba0f..0805d3ebc75a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6277,8 +6277,7 @@
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
-			Format: nn[KMG]:<align>:<label>
+	reserve_mem=	Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
 			used for systems that do not wipe the RAM, and this command
-- 
2.47.2

