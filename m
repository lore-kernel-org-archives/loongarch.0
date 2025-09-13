Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A9015687D
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757725775; cv=none; b=odE3X6jozxnNV944GjkpsZqtRkYgFdLOsow24xTtP75qZ9NuO7Jk3ZD86aqbcTCz6FAhxGQPqWkrFUIIgEahydsA0DOr8Uje9KTPBwCXGuq8Qx6V2JW5nYaZrayo6cWiWRR2FgyXH/YR8POHKMtCm+ko/viBAMaMpCYgpoM6G84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757725775; c=relaxed/simple;
	bh=OB8rvKJ/i9Py5pg6KTYPvKorTOVHkmUl23UIALP6A5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UArl4q3JZIBEB9QYd5Xo66JWDreyLpRigQ38uY6W8pQtFwSMMIpOGcHFBo65adGHjY6ILLKDJjP4iT94yt1Lt7yDLbIHtpPc/j6I6g4jI66PKesw7gLrf51dBx+vwQodqNB3dwcxVU6OqmuAwYPYaWVggSm50DV7zPC0+LkbnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNHgwDOx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNHgwDOx"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso428925166b.2
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725772; x=1758330572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=JNHgwDOxXuANJM51xIfYasFiKh+5I1hgBvh83lDIeSgFrSx+mBCTqjDRaSYkqs6ZO+
         WP1xjPG+KTHAjvZvW2uw3EZN+CsvSooxEKn6hk7BhQKS78eaxQZhKKCtIer06C1wWmep
         UUqaSJChsuNNZMgf7Sa6xUiFAQ5HcolxNmzpsvCCht3uN6xrmOeOBPPH2eaBmCVFd9z7
         XcyPn3epOjFr7MljIV1/S7KJVzKuPqMWuLlBopg0ep1mmdKs7mpUvmP8AKCLtQDdX379
         RbLFAmUZS7kF3r63zlUxWUTBaifCj0SMWbeMJixTu47huqO5Z3bucoFOpwf8mVYAuzfh
         fFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725772; x=1758330572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=qlBB/Kcd7jeqvIDDqTVIUeMCJmkfEOzi7ATLPm600ISQzcGZmCbLFbxybL2+lCtQo+
         e9DkuA5FkYRLreBsM81FRrLMVA7eMVVD25DFuVQJkzJLrBNaqRpGDVSKhvmysa1ir4ZP
         EuIRQRQwrVzzecnisHNA0Vp3M+3Z7P1BdQsxY2OpI612HxXdhvDqHP4Ily0HZZ/AD3Qn
         JeMJ88lxSTic7UhQ/v6Pvy7zBe583t/wAHSZZmT5XUAZSB+PJF5l9EbXOmh2dxaz0XX1
         yQeT0HuJMmTz/0rj/8ATl/18EiKUfo1T1r863SQE2pBzwX2trUB7ljGcWYF0feStkkV6
         lG4A==
X-Forwarded-Encrypted: i=1; AJvYcCWNEk6y4m8e24AlisgO3GvRljCcAUGn9kKWVGs/BbfwRYdBtRFtVeeTpeAWP5ifI1SwI/KWFIfuVFk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6iVpO4qxCRchSqlt5/Hvka75C8EB1F/SsagUYc9SESirSlItx
	+qDznQP7X4MWQnQPdXao4Bb23l6VOp63TSRWaybYOi888SNiLu1By8sy
X-Gm-Gg: ASbGncvoftwBW7ovxu4VsJmcrKsqKpijnT/aUgdtzYVjFRzADi96VNjNWQDSr7gDpBR
	EqfpycRWMEReG4fDYklmWUmxLHPyPgId3sRPFeMqdUlw9sDHbeqdCB5YephV5QjVclqq1O1w3T2
	7gA5VObQDjZQNR3wBc/TRtggb20HOkG+WMiPuG6At346qSZGZyTrgSAFSFPUmsvDsxbBJVrt1+T
	YWCCyteYW6HksCcHuxoiFXUjBP6ACEyVdYnn/huVfK4zg0KHYm0MegzTHwwybUrxR4A+GqE8aj5
	QhjcJmzFGlt2BtVOmtYAAhDruF/wiOsc9yyyIly+dsOo4L4Xac8qt6a0peVax03zUjm2N79W1Gp
	O5ufp/LR6OUIUzH16P34=
X-Google-Smtp-Source: AGHT+IHrHcZIQpP/M06nOcq3Snl8FXkxUTmgmKKbhKMXWfrO9iWe4P5Ilwjf7ocqvFrLGTk9+k818w==
X-Received: by 2002:a17:907:3d0c:b0:b04:250d:ee7 with SMTP id a640c23a62f3a-b07c37dca1emr487688066b.31.1757725771595;
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm104574066b.56.2025.09.12.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
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
Subject: [PATCH RESEND 27/62] init: alpha: remove "extern unsigned long initrd_start, initrd_end"
Date: Sat, 13 Sep 2025 00:38:06 +0000
Message-ID: <20250913003842.41944-28-safinaskar@gmail.com>
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

These variables already declared in <linux/initrd.h>, which is
included

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_irongate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..3411564144ae 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -225,8 +225,6 @@ albacore_init_arch(void)
 	alpha_mv.min_mem_address = pci_mem;
 	if (memtop > pci_mem) {
 #ifdef CONFIG_BLK_DEV_INITRD
-		extern unsigned long initrd_start, initrd_end;
-
 		/* Move the initrd out of the way. */
 		if (initrd_end && __pa(initrd_end) > pci_mem) {
 			unsigned long size;
-- 
2.47.2

