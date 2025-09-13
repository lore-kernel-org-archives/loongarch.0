Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB421A83FB
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757726375; cv=none; b=grwhzU1X5+O9jIoe6YEuZvfPR8WYc4Tho8mN9jJM53iSnApQA4Zfewh4UvPKOJEjxfXObt9Z1dYfPUcCBW4n7+ZWJH+1QYUC4gjKnJDSFWWiZf3nRAoQPZL4sd0aXpNtUg7Yb+xuZmh0gTJlNOyP0TK00YrKryftTrreq8I4ZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757726375; c=relaxed/simple;
	bh=0dZBfgRsarIoSXxUVt0yhSx8VT0ilXZcRzH3UEVxVxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E68ljv0wItd3NHhW7Yf2NO4FPE/SbGYwvOcSiXkiuVprey53+ZUUSdwkt+LT2tne/zTPQdfIHOVm6l3wVEn2mDLYAYd4j6mnniDM4z+Ihkgebe1TeqAGRUx//h0u5GKJeo8Utzypumq27RyWr6TxJ8CbpI+h/VK/Pp5tZaHKhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwCpg5J9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwCpg5J9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b04770a25f2so358756466b.2
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 18:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726370; x=1758331170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=bwCpg5J9z/KucHBBO81BLLBHMaMyK5b/GzFJp8k0Df0lhnOHrHT/Qj+BJHxDfwEYzH
         XlFFf/610h994MoWA0ut0RABxMFdOOkGsBs2DMIrpvFxd5vm8m7O2vPIk/mtNA2z8XOS
         I+L2jVpzRA0LZfmcXO/IWaS5RiVj26+SnMYgLh9H3k/Pw7pPikjbDL2DHDyecwNHPrN6
         QuryKUqEGUsEO6XmnqhqB6mnX0OcALnJk4M5ZpeSzQN7n6bLo8TPTqvF7auKuKiftxIi
         d17eiXdEOIcvwI95cua7GglZzfdPloOmMGgHplK6EQktFMvRKD9zF0Kd7GSDi4FqauDy
         vEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726370; x=1758331170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=RMrTH4UfyUIMGrubgZ8r2CbzC1d7shTr4qZf8y0bWzqQ2SripKiskIbilE40zBBDHI
         TM9sOW63CwlKakd6FkyIyCSrJ2vyfE480ZKHp762+uyMX7y5ulJJoE+hYaf3XSjWuDOl
         h6aIM1c5trDUxEkr19SJ5Vz02uTw0Ds2K8u/cOicpOlvc2O5vIH1TVnQiPEAS9T/Kgsf
         ZTULAtgT6hSFbxNmr7SpeHTz47DzdZiS0R4ZgJutgvYBPDJAJmsC6/XsSlpHlEsemH4B
         GJntOqiEvzblkep/fM4pHUlELIMrb1RRlP91mYNPNgJca/dqlCnLe8fBE5NjcmMypJj1
         tBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw2cUkC7fQXVv4PvEiKNwhTCdN0F2zpYuKriiCYE5ZXHnjH8GmXyDtuV2dNl+pKISWeYBGQUAl0nY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvp0WBfMFkYFq0b2tNq0Yx8jc9B06tRgLwMMmAfUQwwmEPM8lX
	XXOFnajWVr1F4pcTGse4Z/UwyD9xUixQpFP2s2SbittceNbggir48PHW
X-Gm-Gg: ASbGncsmJMDj0rfI24J405v8KM6fxvsjwmcRyeU9HU94V3KsBSkXIL8lNdGM9a4lDPG
	Ldk7UALh5ilqNPUYrSALsuHNnxhnDQbIQO2O57tPTNhn8GH8i59vMf6sv8m4gMycyJsu5S/Ykbi
	P/J+QBLxAIR1b2yHL78Slgi6+F5bahIco6lHdPdADn2TDWNJxWXRikgsb8WvCW5PCVPE+uWo9IL
	ytoRMyzz/iRo4RE3pD0lCOWDT3hEmRNzb2FvyNgxSx4hUS4xQ6lZZNi/2qqnt17is9loT3E4TBS
	GpF1pkY8ME6iamTlpkqG/Fnjc1DjF6OChzpbmNM8kaR/7/Q4gZyHEW41W6wl25Wc8DysTSvBpWb
	EWsk1Nl/E3WvCFhdNKqMPVXyulERMuQ==
X-Google-Smtp-Source: AGHT+IEzeVwYKpSq5hVwsza+AqQmwMGGceGxnApLyMFPwDCsoulMW4PoMJQ37ACnH/5BZ1euJLookQ==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr458597866b.27.1757726369974;
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm465661666b.63.2025.09.12.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
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
Subject: [PATCH RESEND 36/62] init: make mount_root static
Date: Sat, 13 Sep 2025 00:38:15 +0000
Message-ID: <20250913003842.41944-37-safinaskar@gmail.com>
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
 init/do_mounts.c | 2 +-
 init/do_mounts.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index c722351c991f..7ec5ee5a5c19 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -381,7 +381,7 @@ static inline void mount_block_root(char *root_device_name)
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(char *root_device_name)
+static void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f291c30f7407..90422fb07c02 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 /* Ensure that async file closing finished to prevent spurious errors. */
-- 
2.47.2

