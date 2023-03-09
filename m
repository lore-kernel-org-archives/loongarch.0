Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CCAC26E
	for <loongarch@lists.linux.dev>; Thu,  9 Mar 2023 18:20:19 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id be16so2388740oib.0
        for <loongarch@lists.linux.dev>; Thu, 09 Mar 2023 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678386018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hLwUdYZVk4fa1wn/PYBWT0/Ez60Eh+eQ4GrgNECg9Uw=;
        b=iQM7wyiJ0GuSSATIbBAdruoFkSON5zhK7VYiSMjaQ2dRGZD7jIVAnyk+3oSD9nIaAl
         VJH0sBDIKep2Ta0tj+vniOmKzVyhloLq8XdU0imEvXaK6d1hzDkjnTLQ5H141DZdftk5
         TE22n+YuAJu4cD1mt+tCSmqMjfbDRQzmYOd72kYdaOIpOpR1sFsAhkhnkd8jsSqLklIP
         /ISrWRIaf2wha1nKgajgM2B70nfFd5TOKtSAvZtB/Yae5xFeomZz/6EZWlwnPBbbHh6K
         5k/N6W6daCJZvZ7f3NUUAx+U3jfBetT/oQZYl2OIvrKkrjNcy14D3UO1lZq0qc5eGLbE
         blaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678386018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLwUdYZVk4fa1wn/PYBWT0/Ez60Eh+eQ4GrgNECg9Uw=;
        b=vw5/fH6/euWIG3gRXi7h0eT3OEhU45yj/6Zc23/S2JKUnlkMwU+4NIkNna8s+8BTQ5
         zNYfuUWhcwDHXxQdvf4yAJIYqblRh7UDZ3XNj9hMPsGIgIqnFbSjk5u9rSrulQjxaVgP
         An3Ry4yxx4EzUIP0Z3rvIly4rPc0Xk2lxMssw0qfz90J2w0PxDoVKJ3VZzvUC1ZZe+9D
         VYqB09ytBIKfcwWpATutJlGQ2g8zKCsIOaptSaiJkhvJlxGPXypKMKW+cTX/J6CFnA5A
         8DhO7r3M0YCEAMO6g4mELuBiNKrsFjUlbtQesCg0OLDOPOhIpU9m+Wv2io9BtzQdvAD9
         Hapg==
X-Gm-Message-State: AO0yUKXHf206QUbdWIA9g3Mv92bBz9cIisK4IpQzB/g6Bqq6GCIGf+Dm
	NRjseGEw7tElVTX2k/7PmtA=
X-Google-Smtp-Source: AK7set+4c3nl9+rQ9jKRyZq2T63iLCLjpKlTmTmbepHA9OCFWN/j9LsZF90pMEw58QAJIo5oioDNow==
X-Received: by 2002:a54:4718:0:b0:384:1c58:53a with SMTP id k24-20020a544718000000b003841c58053amr9279220oik.40.1678386018642;
        Thu, 09 Mar 2023 10:20:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v132-20020acade8a000000b003646062e83bsm7812813oig.29.2023.03.09.10.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 10:20:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Mar 2023 10:20:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: chenhuacai@kernel.org
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Song Gao <gaosong@loongson.cn>
Subject: Problems when booting Loongarch in qemu with CONFIG_PROVE_LOCKING=y
Message-ID: <8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

when trying to boot Loongarch images in qemu with
defconfig+CONFIG_PROVE_LOCKING=y, I get the following traceback.

[    7.530438] BUG: MAX_STACK_TRACE_ENTRIES too low!
[    7.530636] turning off the locking correctness validator.
[    7.530946] CPU: 1 PID: 274 Comm: ip Tainted: G                 N 6.3.0-rc1+ #4
[    7.531140] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
[    7.531458] Stack : 0000000000000000 0000000000000000 9000000000223868 9000000106a2c000
[    7.531772]         9000000106a2f1b0 9000000106a2f1b8 0000000000000000 0000000000000000
[    7.531970]         9000000106a2f1b8 0000000000000040 0000000000000000 90000000014e1210
[    7.532164]         0000000000000000 9000000106a2f1b8 c1986632e2f4a552 90000001003e1b80
[    7.532366]         0000000000000001 0000000000000203 0000000000000000 0000000000000030
[    7.532557]         0000000000000000 0000000000081ac4 0000000007874000 90000000030f5d80
[    7.532750]         0000000000000000 0000000000000000 9000000001b9a660 9000000001d35848
[    7.532944]         0000000000000000 90000000024968c8 90000000030f6148 900000000178ca40
[    7.533134]         90000000030f5d78 0000000000000000 9000000000223880 00007ffff1d2bf00
[    7.533326]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1c
[    7.533525]         ...
[    7.533637] Call Trace:
[    7.533670] [<9000000000223880>] show_stack+0x60/0x184
[    7.534254] [<90000000014d3bfc>] dump_stack_lvl+0x80/0xb8
[    7.534377] [<90000000002b1f68>] save_trace+0x414/0x41c
[    7.534494] [<90000000002b41b0>] mark_lock+0x2fc/0xf88
[    7.534606] [<90000000002b5a50>] __lock_acquire+0x970/0x2c3c
[    7.534735] [<90000000002b862c>] lock_acquire+0x110/0x374
[    7.534853] [<90000000014e5764>] _raw_spin_lock_nested+0x38/0x4c
[    7.534977] [<90000000011f55a8>] __dev_change_flags+0xbc/0x25c
[    7.535101] [<90000000011f5770>] dev_change_flags+0x28/0x7c
[    7.535219] [<900000000120ac68>] do_setlink+0x300/0xfec
[    7.535331] [<900000000120bffc>] __rtnl_newlink+0x4f8/0x8a0
[    7.535447] [<900000000120c3fc>] rtnl_newlink+0x58/0x90
[    7.535556] [<900000000120c5a8>] rtnetlink_rcv_msg+0x174/0x550
[    7.535677] [<9000000001271b50>] netlink_rcv_skb+0x88/0x178
[    7.535794] [<9000000001271130>] netlink_unicast+0x290/0x318
[    7.535923] [<90000000012713e0>] netlink_sendmsg+0x228/0x494
[    7.536047] [<90000000011b98fc>] sock_sendmsg+0x60/0x94
[    7.536161] [<90000000011ba084>] ____sys_sendmsg+0x22c/0x2a4
[    7.536279] [<90000000011bd254>] ___sys_sendmsg+0xb8/0x104
[    7.536395] [<90000000011bd788>] __sys_sendmsg+0x94/0xe4
[    7.536511] [<90000000014d4bbc>] do_syscall+0x7c/0x94
[    7.536621] [<9000000000221f9c>] handle_syscall+0xbc/0x158

Worse, sometimes the traceback is different and endless.

[    7.434984] BUG: MAX_STACK_TRACE_ENTRIES too low!
[    7.435128] turning off the locking correctness validator.
[    7.435282] CPU: 0 PID: 277 Comm: sh Tainted: G                 N 6.3.0-rc1+ #1
[    7.435380] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
[    7.435531] Stack : 0000000000000000 0000000000000000 9000000000223868 90000001076e4000
[    7.435665]         900000010021f960 900000010021f968 0000000000000000 0000000000000000
[    7.435736]         900000010021f968 0000000000000040 0000000000000000 9000000001509938
[    7.435806]         0000000000000000 900000010021f968 dfb2991c17a76ede 9000000100379cc0
[    7.435875]         0000000000000001 0000000000000102 0000000000000000 0000000000000030
[    7.435944]         0000000000000000 000000000006a4b4 0000000006848000 9000000002d45d88
[    7.436011]         0000000000000000 0000000000000000 9000000001bde0c0 9000000001d7d848
[    7.436080]         0000000000000000 90000000024e68c8 9000000002d46150 90000000017c8aa8
[    7.436149]         9000000002d45d80 0000000000000000 9000000000223880 00007ffff17417ac
[    7.436219]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1c
[    7.436289]         ...
e    7.436334] Call Trace:
[    7.436351] [<9000000000223880>] show_stack+0x60/0x184
[    7.436639] [<90000000014fc64c>] dump_stack_lvl+0x90/0xd8
[    7.436685] [<90000000002b4654>] save_trace+0x414/0x41c
[    7.436726] [<90000000002b694c>] mark_lock+0x33c/0xfa4
[    7.436764] [<90000000002b89f0>] __lock_acquire+0x3d0/0x2c2c
[    7.436805] [<90000000002b79d0>] lock_acquire+0x120/0x3a0
[    7.436844] [<900000000030d3d0>] call_timer_fn+0x9c/0x3a0
[    7.436882] [<900000000030e230>] __run_timers+0x240/0x300
[    7.436920] [<900000000030e308>] run_timer_softirq+0x18/0x34
[    7.436959] [<900000000150f358>] __do_softirq+0x1d4/0x5d0
[    7.436999] [<9000000000245818>] __irq_exit_rcu+0x108/0x138
[    7.437038] [<9000000000245980>] irq_exit_rcu+0xc/0x2c
[    7.437075] [<90000000014fd56c>] do_vint+0x80/0xb4
[    7.437112] [<90000000014fd56c>] do_vint+0x80/0xb4
[    7.437147] [<90000000014fd56c>] do_vint+0x80/0xb4
[    7.437183] [<90000000014fd56c>] do_vint+0x80/0xb4
[    7.437219] [<90000000014fd56c>] do_vint+0x80/0xb4
[    7.437254] [<90000000014fd56c>] do_vint+0x80/0xb4

(repeats until qemu is aborted)

This is with top-of-tree Linux (v6.3-rc1-19-g6a98c9cae232). The root file
system system was built using buildroot with added Loongarch support
(git@github.com:groeck/buildroot.git local-2023.02). C compiler is
gcc 12.2 with binutils 2.39.

Increasing CONFIG_LOCKDEP_STACK_TRACE_BITS to 21 did not help. Increasing it
to 25 results in an immediate crash.

Is this a known problem ? If so, is there a solution other than not enabling
CONFIG_PROVE_LOCKING ?

Unrelated to this, I have been unable to boot from flash even with top-of-tree
qemu. I thought the pflash patch into qemu would enable support for booting from
flash, but qemu does not accept -drive=...,if=pflash. Is there a working command
line that lets me boot from flash ?

Last but not least, I have not been able to build the EFI BIOS, and the only
working version I found online is a debug version. Is a pre-built non-debug
version available somewhere by any chances ?

Thanks,
Guenter
