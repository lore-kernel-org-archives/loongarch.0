Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA3558BC
	for <loongarch@lists.linux.dev>; Mon,  2 Sep 2024 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725255113; cv=none; b=auaem2dMycrEjy5620VxOL41FpBAQhWcMKev12ukx83F8jaxl3UG134nQ5D/xi3H/EyVK6010L8eXBTiY564MHFXmQO4QIh6JJnTTIkQNo+Za+tn+6uhDDgBH/YEj1lrckhvTYuKMP6O1EkmJd+2CJEpJ4GgrVbS3ZtWpU6Nmp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725255113; c=relaxed/simple;
	bh=5Rn0V/8ZeyYgBzK2mBBk0Pm1r5gB+gcHQhhVn4FRMRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJiJbKV9603quDJI84iACOmgKk9Za3NEtSxnbKQok4yEjviuqdTP2eerMdKiBtJ8RYR4uNcarmXIVfgMtLkpwwUtTgYQLfOD9WUbX/yjvQqnmMLbNiLzp0s/b3A7bKfCmsvckwUCn3t3HulsHBlTIc07+mm7+KG6svuNYy3Kv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Io9Zf1iZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Io9Zf1iZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7143c9e68a3so437705b3a.0
        for <loongarch@lists.linux.dev>; Sun, 01 Sep 2024 22:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255110; x=1725859910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGf5OeNLuW8N0+HtKDB4O6h1a0pvH1iiorPowhbhX1k=;
        b=Io9Zf1iZ4DJKcelqYgLM03SMGN2nTsG39T5zc+dqAh9plQjV1eUFydZXEvF4Sx15B7
         vK7aO2WfUtYkyyWnGtoFAoICns0T5k/6DJwWg5627P+XceFSAEDZ+zsAewRRjW9T9CgN
         ryqc2qAIVo2ypUErZkdHQ6r/lPO9OKHwvX7f63xMyvgc6vZkB/nUabIAkJJuusKiYSkc
         izqoaCsTdyvRRMq3cxCneAeh/GJVXcFO0licghPdXbqZj5xhN6ewnWNq9dnGIzMpRQvx
         rlw1y6pe8hnPn0/dXoOnokjYwGNWM7OkJ4aYAztbhE10NSUne6j25UgA2qTf1i7qEwBz
         NKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255110; x=1725859910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGf5OeNLuW8N0+HtKDB4O6h1a0pvH1iiorPowhbhX1k=;
        b=g0dzQEmFxLM4npwp9cjtOm6pg0fe1cfKYk9SVuZ9yf7bDsFRZMy9pK/ND/Yy5q+Dq2
         xfWocxCCXBr89aPAWAVrRDsDVp2knJ2hkjkcpkBJQ/gqtba8MzW/eB6eiz4Y78NYTUDA
         nkPVRlXY1ZYUGYl2Es4oshCI8TXLYiS4uAB6Pzm0LnwjOJcgi6nW+17/uEdQz5UFNC3Q
         PTemjg4KukSeNcCJEWGwSMB+N2rs151IQlnWEHJmKC80cnVQ9VWJBisofqd2knETH3k4
         CMgXBBd7Ef86X07xbbsXgk9LqYpGYW7lXBO2rinfDxLAejg1voP9vPwRpaFN5dweQn+W
         CLMw==
X-Forwarded-Encrypted: i=1; AJvYcCXrmiuJhPdRuMg4+1rDGcvPTZRtaR6W1c88RZGnRnhvAFXVJ0rjp7Rp9lYnzvWJajY67jrrCQD931U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt7rnnj0swVt6KDH21BgQGYrsm/ub82Y7WX+qF8aB8coOI7q6o
	PSqQnxbnl9MTSfTcmhJD0gshG9MV27SF3i8jDlr5K7zlGfd3CLdFo/ev+AlDyxQ=
X-Google-Smtp-Source: AGHT+IHSXT1zDdfdFgGYC0SrD/pcgNSgiiEyyPyOddsLA1njvCrWFZrUbt+epCA0PEHogZAdapDSkA==
X-Received: by 2002:a05:6a00:2d18:b0:70d:2289:4c55 with SMTP id d2e1a72fcca58-717307cbc90mr5477602b3a.5.1725255109933;
        Sun, 01 Sep 2024 22:31:49 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:49 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user addresses
Date: Sun,  1 Sep 2024 22:31:29 -0700
Message-ID: <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
References: <cover.1725223574.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

I found that on x86, copy_to_kernel_nofault() still faults on addresses
outside of the kernel address range (including NULL):

  # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
  # echo g > /proc/sysrq-trigger
  ...
  [15]kdb> mm 0 1234
  [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
  [   94.652481] #PF: supervisor write access in kernel mode
  [   94.652483] #PF: error_code(0x0002) - not-present page
  [   94.652485] PGD 0 P4D 0
  [   94.652489] Oops: Oops: 0002 [#1] PREEMPT SMP PTI
  [   94.652493] CPU: 15 UID: 0 PID: 619 Comm: bash Not tainted 6.11.0-rc6 #11
  [   94.652497] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
  [   94.652498] RIP: 0010:copy_to_kernel_nofault+0x1c/0x90
  [   94.652505] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 65 48 8b 0d 14 9d 72 4c 83 81 04 1b 00 00 01 48 83 fa 07 76 18 48 8b 06 <48> 89 07 48 83 ea 08 48 83 c7 08 48 83 c6 08 48 83 fa 07 77 e8 48
  [   94.652507] RSP: 0018:ffffa4a640b1fa48 EFLAGS: 00010002
  [   94.652509] RAX: 00000000000004d2 RBX: 0000000000000003 RCX: ffff8a8251020000
  [   94.652510] RDX: 0000000000000008 RSI: ffffa4a640b1fa68 RDI: 0000000000000000
  [   94.652512] RBP: 0000000000000000 R08: ffffa4a640b1f9f0 R09: ffffa4a640b1f9f8
  [   94.652513] R10: 000000000000000a R11: f000000000000000 R12: 0000000000000000
  [   94.652515] R13: 00000000000004d2 R14: 0000000000000000 R15: ffff8a8251020000
  [   94.652518] FS:  00007fa9c15f6b80(0000) GS:ffff8a895f7c0000(0000) knlGS:0000000000000000
  [   94.652520] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [   94.652521] CR2: 0000000000000000 CR3: 000000010ff72004 CR4: 0000000000770ef0
  [   94.652522] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  [   94.652523] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  [   94.652524] PKRU: 55555554
  [   94.652525] Call Trace:
  [   94.652528]  <TASK>
  [   94.652534]  ? __die+0x24/0x70
  [   94.652538]  ? page_fault_oops+0x15a/0x480
  [   94.652543]  ? kdb_msg_write.part.0+0x3e/0xb0
  [   94.652547]  ? vkdb_printf+0x1a6/0x8b0
  [   94.652550]  ? exc_page_fault+0x72/0x160
  [   94.652555]  ? asm_exc_page_fault+0x26/0x30
  [   94.652564]  ? copy_to_kernel_nofault+0x1c/0x90
  [   94.652566]  kdb_putarea_size+0x15/0x80
  [   94.652570]  kdb_putword+0x72/0xc0
  [   94.652573]  kdb_mm+0xdc/0x130
  [   94.652576]  kdb_parse+0x2b7/0x6c0
  [   94.652578]  ? kdb_getstr+0x40a/0x910
  [   94.652581]  kdb_main_loop+0x4a0/0xa40
  [   94.652584]  ? module_event+0x10/0x10
  [   94.652590]  kdb_stub+0x1ae/0x3f0
  [   94.652594]  kgdb_cpu_enter+0x2a8/0x5f0
  [   94.652599]  kgdb_handle_exception+0xbd/0x100
  [   94.652605]  __kgdb_notify+0x30/0xd0
  [   94.652610]  kgdb_notify+0x15/0x30
  [   94.652612]  notifier_call_chain+0x5b/0xd0
  [   94.652618]  notify_die+0x53/0x80
  [   94.652622]  exc_int3+0xf9/0x130
  [   94.652626]  asm_exc_int3+0x39/0x40

Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
still faults. This is because with Supervisor Mode Access Prevention
(SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
address from kernel space _before_ checking faulthandler_disabled().

copy_from_kernel_nofault() avoids this by checking that the address is
in the kernel before doing the actual memory access. Do the same in
copy_to_kernel_nofault() so that we get an error as expected:

  # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
  # echo g > /proc/sysrq-trigger
  ...
  [17]kdb> mm 0 1234
  kdb_putarea_size: Bad address 0x0
  diag: -21: Invalid address

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 mm/maccess.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/maccess.c b/mm/maccess.c
index 72e9c03ea37f..d67dee51a1cc 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
 		align = (unsigned long)dst | (unsigned long)src;
 
+	if (!copy_kernel_nofault_allowed(dst, size))
+		return -ERANGE;
+
 	pagefault_disable();
 	if (!(align & 7))
 		copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
-- 
2.46.0

