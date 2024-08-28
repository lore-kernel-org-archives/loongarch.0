Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0015B992
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724824213; cv=none; b=VT6275msdmSCMGyb0e0+mFssPP17lYNKavHAqqqWYSkeLu45Xu3D7QtzcpiR8c7lTiYQOEAyoE+/p1fW4UqJS9F5DuEJFu3VhpotzaZV3iNq1TJMG/yqPWzeJy6tt6nS8vdle1xzsr10iSmw1wKcYyB7V0dtL7xGl5AV9MULe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724824213; c=relaxed/simple;
	bh=LDlOb3puh00G9LsastMFHCdP3tuzGW5CWMac22J4/f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uy2BDmbzcdDt9HS9JeJuxr7J9knPe0q83CUZR7Rzgcbqzw2renT3l5mb/OvrPrprLWRCiRKcQQgL68ehn3c9UgeWAOtBJKoUqkcECEyaCRgZIKL92Pmpj7pKIqo7c327G8XJTYTr3PS9b3DQVwDeBk7lU+B9E2tt2VAVYJt02+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KaB7YgVj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KaB7YgVj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7cd895682fcso2352454a12.0
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 22:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824211; x=1725429011; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AarzQWw7jN5pNetRW1c1iMmZVGfhSNhFxAvdf8X4j7o=;
        b=KaB7YgVjEBat0PgOgSmSzWvs6Bpub0B0IZOiAb3/U+eySzejiXMtD+cBWNxSAZm5yx
         XoHfHMIrNkb+XrcNaG+mOxoosDcJ+hhukf9VhhCfzdUNVKhle5Su0ExyvGRZA+9gYWER
         TxeKDbWgs5/ggoS/4KqMmOuiwB4YmVDXr/8a0eTe4FgGbvcptOMv7E3gD7jSXOgf024H
         2CNd9jaRU033UzHhKyyaZwnqT5BZxxcKCDs4W0ZwW1io7Li7qNjs0y0qxd+L60k/dxcJ
         BUJ1mnIyVRJs+FjwPHBApBopUCQm2f5njWI8LynA3u/znlXMKaQWEfOcJPEhyt2x2WnK
         hMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824211; x=1725429011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AarzQWw7jN5pNetRW1c1iMmZVGfhSNhFxAvdf8X4j7o=;
        b=AU05EZuYE0cuUq362GZmsGPY9qGZ+L4GmPw/0OhztupRsgiBKuLJj3HU/OYbSnGVB3
         icLZ03hhGlVCKr2nYL/sAZU1n7HVC9AwlHz2JhY29f6HvDP33Dn9z5W+Y07dJhLX1s1d
         9CsBmyYvwXwctoa5B3uiwpppfUbIAaLZIB3R5S7pjLO/MA0BKIOlVdpHKkBOKbOTyWBC
         WxqeQd4xEefmJjY3wIPLxAnSrbjuDi753jZPXLHNUoAwvwDWtPXHGL6X/XFHkmMFtsww
         2N5GJ0Ji992bm5yI6rfxsZDmTIItA/tuyNOAeBemZj2OwVIKxRd4nwFasjFVeGDKwsv4
         xOXw==
X-Forwarded-Encrypted: i=1; AJvYcCU9wGRnJxB57s/7s7no8A3BOJbeKZRZ+oREJ7DfwiiXhwsZpTgC93JYmu/5fexo1QReKgMU/lcUS1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4K+K9Q9XlnT7PnhCjyFc9Er9ygpfArSxVrmPMbnLjCjH826X7
	jRw2PBMqplucrcM13LmjfczJ9C3RTO24dKhGQB0p2EXrcSTJTpIojGbiERcoR7o=
X-Google-Smtp-Source: AGHT+IGSDxOLe5G0EzaI75j/pi3mF3L/KyOur/N+gUKJdt7aHyrcvZDzyi6uPsaAVyWSE2f/rnhW5w==
X-Received: by 2002:a05:6a21:2d8f:b0:1cc:cdb6:c11a with SMTP id adf61e73a8af0-1cccdb6c913mr2470861637.24.1724824210534;
        Tue, 27 Aug 2024 22:50:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:50:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:19 -0700
Subject: [PATCH 13/16] s390: mm: Support MAP_BELOW_HINT
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-patches-below_hint_mmap-v1-13-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LDlOb3puh00G9LsastMFHCdP3tuzGW5CWMac22J4/f0=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XQkTzp+9JuBqJbUp4CZHz86P7jsl/+dUPtx28/aiw
 uJ/F77s7ShlYRDjYJAVU2ThudbA3HpHv+yoaNkEmDmsTCBDGLg4BWAilewM/zPyq60vOxt27XXL
 PhSUqxi9dMWuaSXlSf4nvq4JmxBdu5+RYfa1r9wzZq5YzaDtGr2m541pUMtOl1Xnuf/rbZGaqVf
 Eyg0A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to addr
when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/s390/mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 206756946589..29e20351ca85 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -105,6 +105,8 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
+	if (flags & MAP_BELOW_HINT)
+		info.high_limit = MIN(info.high_limit, addr + len);
 	info.align_mask = get_align_mask(filp, flags);
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -143,6 +145,12 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
+	if (flags & MAP_BELOW_HINT)
+		/*
+		 * Subtract (STACK_TOP - mm->mmap_base) to get random
+		 * offset defined in mmap_base() in mm/util.c
+		 */
+		info.high_limit = MIN(info.high_limit, addr + len) - (STACK_TOP - mm->mmap_base);
 	info.align_mask = get_align_mask(filp, flags);
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
@@ -158,6 +166,8 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 		info.flags = 0;
 		info.low_limit = TASK_UNMAPPED_BASE;
 		info.high_limit = TASK_SIZE;
+		if (flags & MAP_BELOW_HINT)
+			info.high_limit = MIN(TASK_SIZE, addr + len);
 		addr = vm_unmapped_area(&info);
 		if (offset_in_page(addr))
 			return addr;

-- 
2.45.0

