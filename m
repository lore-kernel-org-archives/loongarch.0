Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA01399
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 12:42:49 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id b67so1507231vsc.1
        for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 05:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jg5lIrA1Nmh5UvhPYy2QWqb9BuZ3z6KhgX1vk09dz9U=;
        b=j7gGVeWa7IKZYsj05ig/vAcIMFEYG/zKbqMHKlDAcg/dGOiWPgVmby6Y6VzMKdgOeh
         nGg33aFwhMtFOq/bcKB7Y0ISqBeho4vrfqCs91vh5lvxpwK4+Aei2eGunNRcW8x1Pung
         wlIRgBybj3Ap/GA/NZt1Yx6syqcCJCrcd5H3jYfEK1/5yLMM8iJDkwRHE2dTzO0rHpZZ
         7IvyQG4XpnTTYN2GykTh1oKCSIGnmcc2kek75GtemfAMVeBHrTRLCIylfmEDF6Yxww+v
         lep5xuZjMeX8fmpRbzJ/rqe9i4cOZKkqiHMcgCpfEM6ei3FYkSHv4scpxadtVD7GfFfl
         2Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jg5lIrA1Nmh5UvhPYy2QWqb9BuZ3z6KhgX1vk09dz9U=;
        b=eOCJbYfhwuhKo6MKQV1hqWXCimM1r8aQ8Fun3hxI9nsVn1lAceVBHp2+h64EQX4Ass
         fpKFOLi+nL61p+2D+FOHGZHxI3Ay3Fx/gfClHDT1x2+KE1y1ijy74FkQxSziuujYC2FE
         DQDnEC3PfBBoV+cBEoTCJrnKYE+9qVahsoK/Ku0Mj9zRbYVi+lvG901BeSH1XBgEEjmp
         XyF3o7XOtrQyBdLyheG9IOv6IqV4U10JErqypO6x7asEp8LJx5hdhg8SkIFkzzBM7pAg
         SRvGkxIZbIYfLTjRu5SbXLdauGJqNtdX9rQ9cpWdPSGMl2kZEXDEGyiIP76Ig3rrzzVA
         Xa8A==
X-Gm-Message-State: AJIora9sqQTCSah9vDj6ciYXFB7+kASpc+6NZ1jEGd/74OUSOGPZ5aeg
	esTUCx7j7pirRoRFJrqzlP3p2P4sJYBRX6tUJ0A=
X-Google-Smtp-Source: AGRyM1t6xQ7l9gz0UG1rjgaRRZ0gfywDfvIoZKHm4fUPan868K5+fzofemzf+hOPVqIL8yJYJUGU414xnZvYkZqKzNk=
X-Received: by 2002:a67:e307:0:b0:358:5896:c0a1 with SMTP id
 j7-20020a67e307000000b003585896c0a1mr6752177vsf.70.1659012168634; Thu, 28 Jul
 2022 05:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714084136.570176-1-chenhuacai@loongson.cn> <20220714084136.570176-2-chenhuacai@loongson.cn>
In-Reply-To: <20220714084136.570176-2-chenhuacai@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 28 Jul 2022 20:42:35 +0800
Message-ID: <CAAhV-H7W8V8XdJXX5FvyvvSCAbeTSgLEKhHLivm89T-Nd59Umw@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] LoongArch: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Arnd,

Since the SH maintainer hasn't responded, I suppose it is better to
let both LoongArch fix and SH fix go through your asm-generic tree?

Huacai

On Thu, Jul 14, 2022 at 4:41 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
> cpu_max_bits_warn() generates a runtime warning similar as below while
> we show /proc/cpuinfo. Fix this by using nr_cpu_ids (the runtime limit)
> instead of NR_CPUS to iterate CPUs.
>
> [    3.052463] ------------[ cut here ]------------
> [    3.059679] WARNING: CPU: 3 PID: 1 at include/linux/cpumask.h:108 show_cpuinfo+0x5e8/0x5f0
> [    3.070072] Modules linked in: efivarfs autofs4
> [    3.076257] CPU: 0 PID: 1 Comm: systemd Not tainted 5.19-rc5+ #1052
> [    3.084034] Hardware name: Loongson Loongson-3A5000-7A1000-1w-V0.1-CRB/Loongson-LS3A5000-7A1000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V2.0.04082-beta7 04/27
> [    3.099465] Stack : 9000000100157b08 9000000000f18530 9000000000cf846c 9000000100154000
> [    3.109127]         9000000100157a50 0000000000000000 9000000100157a58 9000000000ef7430
> [    3.118774]         90000001001578e8 0000000000000040 0000000000000020 ffffffffffffffff
> [    3.128412]         0000000000aaaaaa 1ab25f00eec96a37 900000010021de80 900000000101c890
> [    3.138056]         0000000000000000 0000000000000000 0000000000000000 0000000000aaaaaa
> [    3.147711]         ffff8000339dc220 0000000000000001 0000000006ab4000 0000000000000000
> [    3.157364]         900000000101c998 0000000000000004 9000000000ef7430 0000000000000000
> [    3.167012]         0000000000000009 000000000000006c 0000000000000000 0000000000000000
> [    3.176641]         9000000000d3de08 9000000001639390 90000000002086d8 00007ffff0080286
> [    3.186260]         00000000000000b0 0000000000000004 0000000000000000 0000000000071c1c
> [    3.195868]         ...
> [    3.199917] Call Trace:
> [    3.203941] [<90000000002086d8>] show_stack+0x38/0x14c
> [    3.210666] [<9000000000cf846c>] dump_stack_lvl+0x60/0x88
> [    3.217625] [<900000000023d268>] __warn+0xd0/0x100
> [    3.223958] [<9000000000cf3c90>] warn_slowpath_fmt+0x7c/0xcc
> [    3.231150] [<9000000000210220>] show_cpuinfo+0x5e8/0x5f0
> [    3.238080] [<90000000004f578c>] seq_read_iter+0x354/0x4b4
> [    3.245098] [<90000000004c2e90>] new_sync_read+0x17c/0x1c4
> [    3.252114] [<90000000004c5174>] vfs_read+0x138/0x1d0
> [    3.258694] [<90000000004c55f8>] ksys_read+0x70/0x100
> [    3.265265] [<9000000000cfde9c>] do_syscall+0x7c/0x94
> [    3.271820] [<9000000000202fe4>] handle_syscall+0xc4/0x160
> [    3.281824] ---[ end trace 8b484262b4b8c24c ]---
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/kernel/proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index e0b5f3b031b1..b12a1f21f864 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -106,7 +106,7 @@ static void *c_start(struct seq_file *m, loff_t *pos)
>  {
>         unsigned long i = *pos;
>
> -       return i < NR_CPUS ? (void *)(i + 1) : NULL;
> +       return i < nr_cpu_ids ? (void *)(i + 1) : NULL;
>  }
>
>  static void *c_next(struct seq_file *m, void *v, loff_t *pos)
> --
> 2.31.1
>
