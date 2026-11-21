Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795284837;
	b=kTcP6x3FTPa/jur7K1p9aKQs8jmfJ4fUohAypLeQZmxpcfWQAVCAhz9LyQ+x4SECkgbW
	 F+4OmmW8WOJeUTjURdsBN1MxogwPqjtanSZCJDdSG3E5b6NTxc/qme41sz+7w22jJI5k+
	 I0AwquuGYbJusDyHtrtts4KGE77GmWmcd4gcd4nPCajqG08zkZUFE63c/NONUj4zSbZ4X
	 N9iyFGjFLxNZDJgX/wBF45FlP08V/SzwRxFEcJxyczEapi7/MG0cROL/m+yXXlBEJ0r7g
	 Iy8xUcVpkuV3F7EoSB1+DQPuT0FG0OS+bnzvp9E/X34wkmK1/Z6nG7VDFm0mqsLK0/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284837;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=6bkrtyevoYSQBBHxSmlCzsD0kdOIPCxJGVLyXOpEk/M=;
	b=Su6EkghW+9g3N2fa5nYvd3YwOhdpQdKZ1Xhs9oDSZ4q606SgmSI2RVfc5+iTnTVYQlXc
	 JknftEc/gBEyzeTSoigpxRJ02ZrhsjdiUAYyphWeYn30KfQkNloODzZ51M3r2vDb+Agcq
	 0D4DdxJJrstVqduJ4H+Zvkwng1zAYCYBruCBWC6gSH0N7IiQArPlm6NbhAdn+8tJ0xZZh
	 wbBRnmvG9tm0oJrO4d+0RQxVlS3TDVgxrAiw8rIMB1S0ONW0QJIhQqfGsqfNu39Y2BMRh
	 mm3sO+X0xfI3V3dwUItNx6ceYv6LSprsgPZFLITUq27F7fXxKFWnnMHVYaJ5g8dJ6jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=hanbings.io;
	spf=pass smtp.mailfrom=hanbings.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.104
Received: from sender5-pp-e104.zoho.com (sender5-pp-e104.zoho.com [165.173.182.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E94606A320
	for <loongarch@lists.linux.dev>; Sat, 21 Nov 2026 18:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E94606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hanbings.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hanbings.io
ARC-Seal: i=1; a=rsa-sha256; t=1795284822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i5xn0413XcAlCKFR6h0Far/q4Cibn5AlgfnomTmvA7pwBY7c5VExWj48Jd085c52PRkaz48w2bd/RcAbqsUPoU0Xa2nh3gD+e7bdKwY0qBfYYtwTh4nknzyN+GDsFqCylmb4bT1r8bQcxVX+yU+pFDtRkPFYZIzoznt2i+QJVIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795284822; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6bkrtyevoYSQBBHxSmlCzsD0kdOIPCxJGVLyXOpEk/M=; 
	b=gwWPqfASjyX5frcbPCXn8ybbbF1VYRnvkx7PkigbW2oLqfGodu84YUyCO4fd+43U1tpW8MxK7M1H0Oc/Zbg8chOXlp8OFwvqTnzLq5PKuk1bsdsNtHGMYnfO3TjqhU/b7sVvxeG3Z4TQk4x1+BUVQyIPgMhOAucKjS7Ufuph9oU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=hanbings.io;
	spf=pass  smtp.mailfrom=hanbings@hanbings.io;
	dmarc=pass header.from=<hanbings@hanbings.io>
DKIM-Signature: a=rsa-sha256; b=VB8jSN+1ucqZLzXMjWovN6Wt9dQe0vXHdMSFo3afwNKCq/3cIHg0oj6AFTn6JvOa2QXIi27Fngor46YrHFnBw7IWnC/m0Z1JRWv3YNU1oauWm0X56aIViBtedvTpvM1af7UYRI45+XmMzuIimvBTVwqElx4QZ5DtDF4pb6IHIAI=; c=relaxed/relaxed; s=zmail; d=hanbings.io; v=1; bh=6bkrtyevoYSQBBHxSmlCzsD0kdOIPCxJGVLyXOpEk/M=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795284817804675.349651293514;
	Sat, 21 Nov 2026 10:13:37 -0800 (PST)
From: hanbings <hanbings@hanbings.io>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception vector check
Date: Sun, 22 Nov 2026 02:13:28 +0800
Message-ID: <20261121181328.1892266-1-hanbings@hanbings.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <575cc834-aca1-a38d-3db9-deea93d0d2f6@loongson.cn>
References: <20261115193107.571674-1-hanbings@hanbings.io> <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com> <575cc834-aca1-a38d-3db9-deea93d0d2f6@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Tiezhu,

Thanks for looking at this.  I can reproduce it deterministically on
QEMU with vanilla v7.2.9; the machine here runs 7.2.9, so I used the
same version for the test.

The important detail is that vector 78 is a real, installed vector:
trap_init() copies handle_vint into every slot from
EXCCODE_INT_START (64) through EXCCODE_INT_END (78).  In the
handle_vint generated by this build (GCC 16.2.0), the call to do_vint
is at handle_vint + 0x154:

    ...
    jirl    $ra, $t0, 0        # handle_vint + 0x154
    ...

So when an interrupt enters vector 78 and do_vint is running, the
return address left in $ra is:

    eentry + 78 * VECSIZE + 0x154 + LOONGARCH_INSN_SIZE

unwind_next_frame() subtracts LOONGARCH_INSN_SIZE and calls
bt_address() with eentry + 78 * VECSIZE + 0x154, which is exactly the
address the current range check rejects.

To isolate this, I used the small out-of-tree module below.  It sets
state.pc = 0 (which selects the NULL-IP ORC entry, so the unwinder
consumes state.ra) and:

    state.ra = eentry + vec * VECSIZE + 0x154 + LOONGARCH_INSN_SIZE

then calls unwind_next_frame().  It checks three vectors:

    77 (last - 1): must succeed on both kernels
    78 (last):     must fail before the fix, succeed after
    79 (last + 1): control, must fail on both

The module returns -EINVAL from init on purpose, so it is discarded
after printing; the results are in dmesg.

Both kernels were built from the same v7.2.9 source and base
configuration.  The only source code difference was the one-line
patch.  The module was built separately against each kernel.

Unpatched:
    unwind: vec=77 ok=1 ...
    cannot find unwind pc at ...
    unwind: vec=78 ok=0 ...
    cannot find unwind pc at ...
    unwind: vec=79 ok=0 ...

Patched:
    unwind: vec=77 ok=1 ...
    unwind: vec=78 ok=1 ...
    cannot find unwind pc at ...
    unwind: vec=79 ok=0 ...

The patched vec=78 result maps to handle_vint + 0x154, i.e. the
do_vint call site.

To give some background: this issue shows up intermittently on a
3B6000 machine that I run as a NAS.  In the end I only saw the kernel
log line, without a stack trace or any other context, for example:

    [470049.376195] cannot find unwind pc at 9000000004e09d54

or, from journalctl -k:

    Nov 14 12:19:30.400918 Lihuas kernel: cannot find unwind pc at 9000000004fc9d54
    Nov 14 16:17:12.068835 Lihuas kernel: cannot find unwind pc at 9000000004fc9d54
    Nov 15 03:53:19.899813 Lihuas kernel: cannot find unwind pc at 9000000004fc9d54
    Nov 15 22:38:45.406173 Lihuas kernel: cannot find unwind pc at 9000000004fc9d54

All of these addresses end in ...9d54, which is the vector-78 slot
plus 0x154.  But the log lines do not identify which software
triggered the interrupt, so the reproducer below simulates that
return address instead of actually triggering an AVEC interrupt.

On the real machine, which runs 7.2.9 with the fix installed since
2026-11-15, I have not seen the "cannot find unwind pc" message
again.

If you want to run the exact QEMU A/B, I can send the kernel build and
qemu-system-loongarch64 commands and the full logs.

The test module follows.  It is test-only and not part of the patch.

// SPDX-License-Identifier: GPL-2.0
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <asm/unwind.h>
#include <asm/loongarch.h>
#include <asm/inst.h>
#include <asm/setup.h>

static int __init unwind_boundary_init(void)
{
	unsigned long base;
	int i;

	asm volatile("csrrd %0, %1" : "=r"(base) : "i"(LOONGARCH_CSR_EENTRY));

	for (i = -1; i <= 1; i++) {
		struct unwind_state state = {
			.task = current,
			.sp = (unsigned long)__builtin_frame_address(0),
			.pc = 0,
			.stack_info.type = STACK_TYPE_TASK,
		};
		bool ok;

		state.ra = base + (EXCCODE_INT_END + i) * VECSIZE +
			   0x154 + LOONGARCH_INSN_SIZE;
		ok = unwind_next_frame(&state);
		pr_info("unwind: vec=%d ok=%d pc=%px error=%d\n",
			EXCCODE_INT_END + i, ok,
			(void *)state.pc, state.error);
	}

	return -EINVAL;	/* Fail init intentionally so the module is discarded. */
}
module_init(unwind_boundary_init);
MODULE_LICENSE("GPL");

Thanks,
hanbings
