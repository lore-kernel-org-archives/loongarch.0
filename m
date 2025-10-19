Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8071FE455
	for <loongarch@lists.linux.dev>; Sun, 19 Oct 2025 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760854147; cv=none; b=pXBLod3OWU6LPUSJuUlp9SFAeihL2RLM5Q4D7mNzS5yvV1jjMCs4Tjg5+C0EvgQ6RJcQXS8tgWroryhRnpmEC1qaxNpb3EGQ8KowS5MgF2QY88fN9PxviJluEF7ppOwMoeZq1sqIza6FQ2GTAHm+AgoCf62nKzguQZNWg5O8lUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760854147; c=relaxed/simple;
	bh=QbgwpdTyi8DYwUUDm609KswE/m2Q+kwHqpRNMxhZtOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QE9pSYWWlN9EoA/f4IraXitvXtHwcyp6QRgyJ71A3SEzQjfZ1+pyDBpMXPdnkuvQ6vgouv76OGtboL9KKDqw0NZJKDPtnaNWSEBp5aYAF+Qypw0rxX8Br4PTD1XUKctGmRlRuMXBIA54YlkDqbDFt85UdSTOJV5oAdTFo/QX6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOoyLOJY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOoyLOJY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso29428685e9.0
        for <loongarch@lists.linux.dev>; Sat, 18 Oct 2025 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854143; x=1761458943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=TOoyLOJYvxgVCaNSSNrbT6nXTJaG4IFr/+vVemu5maKvgVkrnvD4EV9QJ1hZ3K7TgY
         OC0o8QNdQiH5D2rYOKRF+XSJXZeeba/1xiMUglLr+44UMTB8mApZVlxsPh5z8o/4E1mm
         Wm/Ein85ml2olzcD8O5lcOWllUP/bKrv72GG+yoSyt587MG/qhgf094SgXGfELbD98ri
         So9HbOExuL6vpXwrgft6LDg2IbZdzuEUfoOOmaUF8vCCitylon4i1qU1Ns5/H8+0Hip0
         b1YmxEcuuLLyI+V5uoVSU3ZscT/Kjh0YXAf/vSiSSOkQTnUZ4ngPFX2/S3BByJVMnTna
         dJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854143; x=1761458943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=qH/r4mc0orAfh6HwkIL6U9XAtux2/4awNQcvldMC8wsr0HXdJ792g484YLtgFJiKHP
         5BrM/5bB/qbyMed2os5WIMv03aA5WcvIHnCoLcUzI95h5oq9gVVcQVf+qw8EnRNQR+2l
         n7QAu9phVEUT+/QjPM/K3zvN7Xglrvh4cA+2GQ0+lkI4bgCi9vtivEpJxykdMWiD8qyB
         Bpei5eAcF9mHZ29WCQABk5enk00KKrbpXNaAdFal7adKOEsTx5E98sFIg7oXlF7+itZl
         pGsZn1qkVhSTCUt6XomMam5Yg/VB4z1WbyO6cwfIXRyg7BoyG8sAkhyzMeQ+S5YpLAKK
         IizA==
X-Forwarded-Encrypted: i=1; AJvYcCUD1HLw6u8fbeDMHV5TcgqfxIzH0U8wBzVSjcqLea5XB4weMgr1VTRulZC5GCm0iXtmnVexs+N0eHc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq4qgZ5sPXS7tO8klHtLbYs7j0XSLNSLEgamlrDGhBAmn/MpPW
	bTceh4qSKMncP5R1HRGMw8uXZI9oUGksmfO2RriR44g1Mebf0bVNSZa5
X-Gm-Gg: ASbGnctuEIkEcBgrnwEBzWjDGJ61oqsztWjEgQdKg/L2QcglDA5bP252Ub8PMsOnaji
	INZvGpklNvFBGoyR0Wdr/H1jSX1YU4+Bo9ewQWWIIR+VyuiFxf5yXs+5lcqvP0LxkGZNcYOrY1Z
	CTYcjrHSihVMWyx2cY0my127OsTbbTwr3B/fTlOSLUo8eXx2YmVY1lPSvKcSq28h+95ijUMIQpl
	BkOsIOgpNTSB3FLbsyZNFonJjO48r5yuqlj1kQchbtccqkFrfVOpCj5iKHCWjITTlfpwA82Kswn
	cLlYiJT9azFsXP1SxAzEMgLBwnIS45Vov0cl15rHZtwu/QNSm8rN7+B4u9LebWbLip3geACBTsz
	v5ddwvqxn5shDfn2wHZM4Kig/RlsOHL1KLO2/4Pwta7DDNCxbdOcFKq9enXaWgU7SLqc+O/AAdd
	+A
X-Google-Smtp-Source: AGHT+IEZ5upR5rvq2pYeoFEK0g1VqqLoHFsnsUnK8lryUbaHf4IrN1h8fWBgNccm4eIUhXw2FJ5z5w==
X-Received: by 2002:a05:600c:820f:b0:471:176d:bf8a with SMTP id 5b1f17b1804b1-4711791cd3dmr68834905e9.35.1760854143309;
        Sat, 18 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4710cdb9d4dsm83976805e9.5.2025.10.18.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 23:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Date: Sun, 19 Oct 2025 09:08:45 +0300
Message-ID: <20251019060845.553414-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20241202010844.144356-16-ebiggers@kernel.org>
References: <20241202010844.144356-16-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eric Biggers <ebiggers@kernel.org>:
> Now that the lower level __crc32c_le() library function is optimized for

This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
solves actual bug I found in practice. So, please, backport it
to stable kernels.

I did bisect.

It is possible to apply this patch on top of v6.12.48 without conflicts.

The bug actually prevents me for using my system (more details below).

Here is steps to reproduce bug I noticed.

Build kernel so:

$ cat /tmp/mini
CONFIG_64BIT=y
CONFIG_PRINTK=y
CONFIG_SERIAL_8250=y
CONFIG_TTY=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_MODULES=y
CONFIG_BTRFS_FS=m
CONFIG_MODULE_COMPRESS=y
CONFIG_MODULE_COMPRESS_XZ=y
CONFIG_MODULE_COMPRESS_ALL=y
CONFIG_MODULE_DECOMPRESS=y
CONFIG_PRINTK_TIME=y
$ make allnoconfig KCONFIG_ALLCONFIG=/tmp/mini
$ make

Then create initramfs, which contains statically built busybox
(I used busybox v1.37.0 (Debian 1:1.37.0-6+b3)) and modules we just created.

Then run Qemu using command line similar to this:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -initrd i.gz -append 'console=ttyS0 panic=1 rdinit=/bin/busybox sh' -m 256 -no-reboot -enable-kvm -serial stdio -display none

Then in busybox shell type this:

# mkdir /proc
# busybox mount -t proc proc /proc
# modprobe btrfs

On buggy kernels I get this output:

# modprobe btrfs
[   19.614228] raid6: skipped pq benchmark and selected sse2x4
[   19.614638] raid6: using intx1 recovery algorithm
[   19.616569] xor: measuring software checksum speed
[   19.616937]    prefetch64-sse  : 42616 MB/sec
[   19.617270]    generic_sse     : 41320 MB/sec
[   19.617531] xor: using function: prefetch64-sse (42616 MB/sec)
[   19.619731] Invalid ELF header magic: != ELF
modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

The bug is reproducible on all kernels from v6.12 until this commit.
And it is not reproducible on all kernels, which contain this commit.
I found this using bisect.

This bug actually breaks my workflow. I have btrfs as root filesystem.
Initramfs, generated by Debian, doesn't suit my needs. So I'm going
to create my own initramfs from scratch. (Note that I use Debian Trixie,
which has v6.12.48 kernel.) During testing this initramfs in Qemu
I noticed that command "modprobe btrfs" fails with error given above.
(I not yet tried to test this initramfs on real hardware.)

So, this bug actually breaks my workflow.

So, please backport this patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
to stable kernels.

I tested that this patch can be applied without conflicts on top of v6.12.48,
and this patch indeed fixes the bug for v6.12.48.

If you want, I can give more info.

It is possible that this is in fact bug in busybox, not in Linux.
But still I think that backporting this patch is good idea.

This busybox thread my be related:
https://lists.busybox.net/pipermail/busybox/2023-May/090309.html

-- 
Askar Safin
