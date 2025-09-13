Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4751022
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724595; cv=none; b=kDzglEq3R2J5YdP9EG/RBlMCUjOh22RwrUkSfcKRfuf8djIMD6w97gliGL0/m7ivqNfKApbXeL2aNfgtbl3lSbIZzhGQ9k0uc8ne/G95sgtO8XzhiNUP5KwqzOGF+mOC+/VzMO/A9LkKpluqA+sVDqoH2DD0Olo2F1own2mgspc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724595; c=relaxed/simple;
	bh=aIH0UEBp9jrH7zT+VD2BpCtGu5L0ukANS11y+zY/wiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USr4RZMgx1BbSo9A07bOMP9052cyxSVd4mN3ATerTYjU1DSXo4xBL8U9xkLxNDJaAvRRsizOdQ3/iKOdsGjr7JazjpfVBeHZ24pah+nMKL2aa/niTqiIVQTIH0RBFYBT7AqpVyYUK+T+IsQb7R6IGWff/++gKGJHFAW1Y5ZBlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izSGQOQd; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izSGQOQd"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso4441880a12.0
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724592; x=1758329392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=izSGQOQdCZ7cbznz0tI4FfgOfIR25Y3QeszP2sJhL7MHlDes8BpOcSVWdApqOTACUa
         oWzFmnlWwZH3gGKh3mdcwzDPLnaUgwypMEHdOeAL7f/FCKftcE4qx/kxJH3R0YwCzNqT
         5PoNMgu8h0ppYzcaLAVmOsQ96Cwty4Rr6oEGzPmV6QIHb9mbiEkasFlq41K/e4nWlPFH
         ds21XKma6UbCue4oaZrE/1SM47SsEtD/5hwHkMpdfmCfBTX5CIp6hyf0GlStGkJVOJCA
         ukQuPQbJ5s+GAK4QqZyw916LxhUQVm65fzd7SY1ufyNbdbDaEBLnNQdVfmCbPu9pD9Gy
         +7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724592; x=1758329392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=gxR8zh3Qx9pDy+oS9xWniBltPCudGBt7fEuGaQUk6ZbIYc6VqODuaUblew3WtJuX1b
         VqG52PU8l8p8+o6EoWH8dPSGZIVafu30B5NA4yVQDpt1QW6xXG/L9SEYe5QjdiacGjbB
         xhv88djCnC0D5He0B6FOZVMFYa/cWZo7IaZ+Y1T2nGBX3mXwUjyrFu1SuXHwKg/d3i1v
         K4RoXmCU2f7P+gmHgdE9/O8+m+lRUNXFw5cSNZwdr7XVKn8xhzox5q6GosMN5SQe4p9g
         YVrb72V5v6P+/iEXh9k06qQaq1TmW5ZG+xkaKvXpyJH0s1KLbdNRKPabFhrmK5o3rXi0
         7B+w==
X-Forwarded-Encrypted: i=1; AJvYcCVMV0yU3ppNYaxZetWDEiv+GILPr5f2/+kK48xTC5FuH8Y5G8y2NgqaAfh7tfLSLvIgfM4V9gHaMbc=@lists.linux.dev
X-Gm-Message-State: AOJu0YznYkWEs+sBjwbkPwOva5UPnTdf8Ie6oqXM/fcPb4GV8vPVOaGl
	I5OWpOKLYRh/8WafSA5sSlWECXXBx4EjNxkrfy8jC5c5up7LTjh/rtJ+
X-Gm-Gg: ASbGncvsLrUh/ODOKincmD6e9gCT1HYkVPQa9IhxpQwF+Jex6MZyBxSS41N4KR3LM3a
	jR0T4HG2kQ69N6hlUI/YTwHLDShXbJaUvLZel6CtjEGxH1A4esWGr2vhC0SdGVUA1guYzeEXF0u
	ytJ4ivy43G29+ad8yPIr2vwXdK0WMQ95ck3jArcNUTwLvVnMWrMLCybCFkMUk2xUCODY8haI/6n
	Qag8heKBB9mAKp0daWFm+kr+nEJkder3Xa3xY+4Ntym3Z8A3glWJTQaSoQ/BkEWWLk0PfAn6dSg
	BL/7Bafirj9lAxXmE/fy7TByHVcIuDwGeIIFbTSEoBEu8NZFKwo5v6ntmdLU2j87zQSKWHg/g4I
	wekCIfZ3F29H0Lq3nG2WN2FHgq1oeVA==
X-Google-Smtp-Source: AGHT+IFuaD6uE53o0kMUFqkBYFUIpIv4YZNYfnndGaXs7B0K4+B96SRU2dTVgEWhisS3xuLKgCtRtQ==
X-Received: by 2002:a05:6402:4316:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62edf3b81cemr3814693a12.1.1757724591635;
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b6csm4149162a12.32.2025.09.12.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
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
Subject: [PATCH RESEND 09/62] arm: init: document rd_start (in param_struct) as obsolete
Date: Sat, 13 Sep 2025 00:37:48 +0000
Message-ID: <20250913003842.41944-10-safinaskar@gmail.com>
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

It is unused now

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index be77d4b2aac1..01257f30d489 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -86,7 +86,7 @@ below:
    initial ramdisk.
 
  rd_start
-   Start address in sectors of the ramdisk image on a floppy disk.
+   This is now obsolete, and should not be used.
 
  system_rev
    system revision number.
-- 
2.47.2

