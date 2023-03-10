Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979958838
	for <loongarch@lists.linux.dev>; Fri, 10 Mar 2023 16:08:03 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id p13-20020a9d744d000000b0069438f0db7eso3196680otk.3
        for <loongarch@lists.linux.dev>; Fri, 10 Mar 2023 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678464482;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LzjrJfhQDiBWDjeTCdVa9+io1C/N0NqmQ1c0dY/OJG4=;
        b=Ttc8Imensw1Mc9bB+rp7wdbxTGpipDjpMUnEBT7EealM2hqQ796QuwhNSJJiHh3RTh
         xg9JAR7B3j0DYMKrr3UBwbtFcEOnASdcUt5nlOOsAYRzEVfw9xcEcKe9LBXH8S3rMe1P
         7cbMItnipQaKg0Sd6yUQfvcphe3xxAHqMVb4j/PS4Z5CtFv4y5GkyVM4aBL5s4eA35ct
         24QmUXoH1ypD/6y/Pg0G8NL0H2KMFhuR+QeaUQubTV4DAU8757WSjWjBacWp7Rxe7dgF
         WS2yfAcAAZWyCCr0jHa9gSwWb4qyQv1X5OIvZqDyIfWKWw0oiZiKrTRt+xv/DmA81DBR
         agNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464482;
        h=content-transfer-encoding:in-reply-to:subject:content-language
         :references:cc:to:from:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzjrJfhQDiBWDjeTCdVa9+io1C/N0NqmQ1c0dY/OJG4=;
        b=YM+f8tusbRJgZP/vlmsRMoXtTDkyD6ied7FH6Qe26D4WycYDGf54u/p2KXUyWgaFCM
         YpzrQEOtLZhe96Fpky2tHs/dPWzu/zqt6AXuh4lBwRbd+SO/Dss+MhStu0G0ul2QRHRN
         DrtK9bCrs9+NJkYTgjHca8trk6GmZ24Bmn1fcKy5xHQWolp82D6rQcNc9IzoNgW9Qjrv
         ds4BovqdieVARfTS/P2jLyOLMNWg6+sAGkVcJrnQ2vVs9SD+b3USQYRr8k2mfYc7W/jo
         tzDElXxess1/VwDQJ6EGa352Gb/9zVWA1wxkt36X3+EtoAlplEG5ZIA1BWmzF5clvfjU
         1SmA==
X-Gm-Message-State: AO0yUKUqP8l6YV9fWiusxyz9Q1G48Ml/nUToTEUg3NNrX5dlA0wMA7d4
	yK57D08bSZC18dC8+X9WHn0=
X-Google-Smtp-Source: AK7set/VAk64bVvB68JrgjYSwhUs5tO8tqRHI0ZM5JVBlQJyFqd3s2TkWLYt9tq18Uj9A6HyNSrdiQ==
X-Received: by 2002:a05:6830:2338:b0:693:c3bb:8392 with SMTP id q24-20020a056830233800b00693c3bb8392mr1209809otg.7.1678464482349;
        Fri, 10 Mar 2023 08:08:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d3e5a000000b0069426d0a19bsm205714otg.12.2023.03.10.08.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:08:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <26cf4e42-53de-8215-acb2-5ad7989da7ea@roeck-us.net>
Date: Fri, 10 Mar 2023 08:07:59 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Guenter Roeck <linux@roeck-us.net>
To: gaosong <gaosong@loongson.cn>, chenhuacai@kernel.org
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <8a44ad71-68d2-4926-892f-72bfc7a67e2a@roeck-us.net>
 <8d270191-6c18-11fa-2ba2-7870b3f12379@loongson.cn>
Content-Language: en-US
Subject: ...
In-Reply-To: <8d270191-6c18-11fa-2ba2-7870b3f12379@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 3/9/23 18:01, gaosong wrote:
> 
> 在 2023/3/10 上午2:20, Guenter Roeck 写道:
>> Hi,
>>
>> when trying to boot Loongarch images in qemu with
>> defconfig+CONFIG_PROVE_LOCKING=y, I get the following traceback.
>>
>> [    7.530438] BUG: MAX_STACK_TRACE_ENTRIES too low!
>> [    7.530636] turning off the locking correctness validator.
>> [    7.530946] CPU: 1 PID: 274 Comm: ip Tainted: G                 N 6.3.0-rc1+ #4
>> [    7.531140] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
>> [    7.531458] Stack : 0000000000000000 0000000000000000 9000000000223868 9000000106a2c000
>> [    7.531772]         9000000106a2f1b0 9000000106a2f1b8 0000000000000000 0000000000000000
>> [    7.531970]         9000000106a2f1b8 0000000000000040 0000000000000000 90000000014e1210
>> [    7.532164]         0000000000000000 9000000106a2f1b8 c1986632e2f4a552 90000001003e1b80
>> [    7.532366]         0000000000000001 0000000000000203 0000000000000000 0000000000000030
>> [    7.532557]         0000000000000000 0000000000081ac4 0000000007874000 90000000030f5d80
>> [    7.532750]         0000000000000000 0000000000000000 9000000001b9a660 9000000001d35848
>> [    7.532944]         0000000000000000 90000000024968c8 90000000030f6148 900000000178ca40
>> [    7.533134]         90000000030f5d78 0000000000000000 9000000000223880 00007ffff1d2bf00
>> [    7.533326]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1c
>> [    7.533525]         ...
>> [    7.533637] Call Trace:
>> [    7.533670] [<9000000000223880>] show_stack+0x60/0x184
>> [    7.534254] [<90000000014d3bfc>] dump_stack_lvl+0x80/0xb8
>> [    7.534377] [<90000000002b1f68>] save_trace+0x414/0x41c
>> [    7.534494] [<90000000002b41b0>] mark_lock+0x2fc/0xf88
>> [    7.534606] [<90000000002b5a50>] __lock_acquire+0x970/0x2c3c
>> [    7.534735] [<90000000002b862c>] lock_acquire+0x110/0x374
>> [    7.534853] [<90000000014e5764>] _raw_spin_lock_nested+0x38/0x4c
>> [    7.534977] [<90000000011f55a8>] __dev_change_flags+0xbc/0x25c
>> [    7.535101] [<90000000011f5770>] dev_change_flags+0x28/0x7c
>> [    7.535219] [<900000000120ac68>] do_setlink+0x300/0xfec
>> [    7.535331] [<900000000120bffc>] __rtnl_newlink+0x4f8/0x8a0
>> [    7.535447] [<900000000120c3fc>] rtnl_newlink+0x58/0x90
>> [    7.535556] [<900000000120c5a8>] rtnetlink_rcv_msg+0x174/0x550
>> [    7.535677] [<9000000001271b50>] netlink_rcv_skb+0x88/0x178
>> [    7.535794] [<9000000001271130>] netlink_unicast+0x290/0x318
>> [    7.535923] [<90000000012713e0>] netlink_sendmsg+0x228/0x494
>> [    7.536047] [<90000000011b98fc>] sock_sendmsg+0x60/0x94
>> [    7.536161] [<90000000011ba084>] ____sys_sendmsg+0x22c/0x2a4
>> [    7.536279] [<90000000011bd254>] ___sys_sendmsg+0xb8/0x104
>> [    7.536395] [<90000000011bd788>] __sys_sendmsg+0x94/0xe4
>> [    7.536511] [<90000000014d4bbc>] do_syscall+0x7c/0x94
>> [    7.536621] [<9000000000221f9c>] handle_syscall+0xbc/0x158
>>
>> Worse, sometimes the traceback is different and endless.
>>
>> [    7.434984] BUG: MAX_STACK_TRACE_ENTRIES too low!
>> [    7.435128] turning off the locking correctness validator.
>> [    7.435282] CPU: 0 PID: 277 Comm: sh Tainted: G                 N 6.3.0-rc1+ #1
>> [    7.435380] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
>> [    7.435531] Stack : 0000000000000000 0000000000000000 9000000000223868 90000001076e4000
>> [    7.435665]         900000010021f960 900000010021f968 0000000000000000 0000000000000000
>> [    7.435736]         900000010021f968 0000000000000040 0000000000000000 9000000001509938
>> [    7.435806]         0000000000000000 900000010021f968 dfb2991c17a76ede 9000000100379cc0
>> [    7.435875]         0000000000000001 0000000000000102 0000000000000000 0000000000000030
>> [    7.435944]         0000000000000000 000000000006a4b4 0000000006848000 9000000002d45d88
>> [    7.436011]         0000000000000000 0000000000000000 9000000001bde0c0 9000000001d7d848
>> [    7.436080]         0000000000000000 90000000024e68c8 9000000002d46150 90000000017c8aa8
>> [    7.436149]         9000000002d45d80 0000000000000000 9000000000223880 00007ffff17417ac
>> [    7.436219]         00000000000000b0 0000000000000007 0000000000000000 0000000000071c1c
>> [    7.436289]         ...
>> e    7.436334] Call Trace:
>> [    7.436351] [<9000000000223880>] show_stack+0x60/0x184
>> [    7.436639] [<90000000014fc64c>] dump_stack_lvl+0x90/0xd8
>> [    7.436685] [<90000000002b4654>] save_trace+0x414/0x41c
>> [    7.436726] [<90000000002b694c>] mark_lock+0x33c/0xfa4
>> [    7.436764] [<90000000002b89f0>] __lock_acquire+0x3d0/0x2c2c
>> [    7.436805] [<90000000002b79d0>] lock_acquire+0x120/0x3a0
>> [    7.436844] [<900000000030d3d0>] call_timer_fn+0x9c/0x3a0
>> [    7.436882] [<900000000030e230>] __run_timers+0x240/0x300
>> [    7.436920] [<900000000030e308>] run_timer_softirq+0x18/0x34
>> [    7.436959] [<900000000150f358>] __do_softirq+0x1d4/0x5d0
>> [    7.436999] [<9000000000245818>] __irq_exit_rcu+0x108/0x138
>> [    7.437038] [<9000000000245980>] irq_exit_rcu+0xc/0x2c
>> [    7.437075] [<90000000014fd56c>] do_vint+0x80/0xb4
>> [    7.437112] [<90000000014fd56c>] do_vint+0x80/0xb4
>> [    7.437147] [<90000000014fd56c>] do_vint+0x80/0xb4
>> [    7.437183] [<90000000014fd56c>] do_vint+0x80/0xb4
>> [    7.437219] [<90000000014fd56c>] do_vint+0x80/0xb4
>> [    7.437254] [<90000000014fd56c>] do_vint+0x80/0xb4
>>
>> (repeats until qemu is aborted)
>>
>> This is with top-of-tree Linux (v6.3-rc1-19-g6a98c9cae232). The root file
>> system system was built using buildroot with added Loongarch support
>> (git@github.com:groeck/buildroot.git  local-2023.02). C compiler is
>> gcc 12.2 with binutils 2.39.
>>
>> Increasing CONFIG_LOCKDEP_STACK_TRACE_BITS to 21 did not help. Increasing it
>> to 25 results in an immediate crash.
>>
>> Is this a known problem ? If so, is there a solution other than not enabling
>> CONFIG_PROVE_LOCKING ?
> 
> I am not sure ,  qemu use the 'loongson3_defconfig'.
> 

That is not the point. My defconfig == loongson3_defconfig.
For testing / verification purposes I wanted to enable
CONFIG_PROVE_LOCKING as well (om top ofloongson3_defconfig),
which resulted in the above behavior. I guess the locking
correctness validator doesn't work with this architecture.
Never mind, I'll just leave it disabled.

> See:
> 
> https://github.com/qemu/qemu/blob/master/docs/system/loongarch/virt.rst
> 
>> Unrelated to this, I have been unable to boot from flash even with top-of-tree
>> qemu. I thought the pflash patch into qemu would enable support for booting from
>> flash, but qemu does not accept -drive=...,if=pflash. Is there a working command
>> line that lets me boot from flash ?
> We not support  '-drive = .. , if = pflash',   you can use  ' -blockdev '.
> e.g
> ./build/qemu-system-loongarch64 -m 8G -smp 4 --cpu la464   -blockdev '{"driver":"file","filename":"/home2/BIOS/QEMU_VARS-pflash.raw","node-name":"libvirt-pflash0-storage","auto-read-only":false,"discard":"unmap"}' -blockdev '{"node-name":"libvirt-pflash0-format","read-only":false,"driver":"raw","file":"libvirt-pflash0-storage"}' --machine virt,pflash=libvirt-pflash0-format  -bios ./QEMU_EFI.fd ...
> 

Complicated... I think I'll stick with booting from nvme.

> The QEMU_VARS-pflash.raw is from QEMU_VARS.fd.
> 
> `cat QEMU_VARS.fd  /dev/zero | head -c 16m > ./QEMU_VARS-pflash.raw`
> 
>> Last but not least, I have not been able to build the EFI BIOS, and the only
>> working version I found online is a debug version. Is a pre-built non-debug
>> version available somewhere by any chances ?
> See:
> https://github.com/tianocore/edk2-platforms/tree/master/Platform/Loongson/LoongArchQemuPkg#readme >
> To build the release version of the bios, set --buildtarget=RELEASE,
> the bios file path: Build/LoongArchQemu/RELEASE_GCC5/FV/QEMU_EFI.fd.
> 

I tried that. Unfortunately it results in:

make: *** No rule to make target '/home/groeck/src/edk2-workdir/Build/LoongArchQemu/RELEASE_GCC5/LOONGARCH64/MdeModulePkg/Application/UiApp/UiApp/DEBUG/UiApp.efi', needed by '/home/groeck/src/edk2-workdir/Build/LoongArchQemu/RELEASE_GCC5/FV/Ffs/462CAA21-7614-4503-836E-8AB6F4662331UiApp/UiApp.offset'.  Stop.
make: *** Waiting for unfinished jobs....

I had also tried to build with edk2 tag edk2-stable202302
with the same results. I now tried with tag edk2-stable202211,
and was able to build an image. Unfortunately, it does not boot
but reports an assert.

ASSERT [VirtNorFlashDxe] /home/groeck/src/edk2-workdir/edk2-platforms/Platform/Loongson/LoongArchQemuPkg/Library/NorFlashQemuLib/NorFlashQemuLib.c(56): !(((INTN)(RETURN_STATUS)(FindNodeStatus)) < 0)

I then tried the top-of-tree of Loongson's edk2 repo which reports the
same assert. After that, I reverted the Loongson pflash patches from
edk2-platforms and finally was able to build a working bios.
I guess that either means that something with pflash doesn't work
as intended, or that the above complex pflash qemu command line
is now mandatory when using an EFI BIOS with Loongson pflash support
enabled.

Thanks,
Guenter
