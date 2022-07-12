Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094257A
	for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 08:34:09 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-fe023ab520so9509365fac.10
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 01:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+RlgqyNyozIyqu+u+nphr5l00NXcM+jNZnu9YO/k+k=;
        b=0Hm1sApMjBhkCmwQmbslNZv0WR4Pd6muVj+xu9zNl0b/LdPjCz11yDZX/+CRualA/T
         hvsnco0fH65wnR35hwj/QSbHf4cyWdCHTTvTUVenXN1e0WzCsAIRYDmyJ5n4CzGayTqp
         VUmx+lOwpsD32P4glRejBA26bYeyaZaepz6ZMAoEpFuEXlme5/jue0sUKfrhCRkaCX+T
         yWvFJouPJydf+5UHEyOrdHgz9BLO3k8867CsErAZOvRhEg75jdhjt0wYw1PgFRfB70WE
         nDNvNUx68NDaH/BPA74ShF0P/8gktIlcAVu0/MfmHSGB95eyqD7SjnID17KJCAjLv6Z0
         eqKw==
X-Gm-Message-State: AJIora/4guaY2yWR1wtwOlrkyPxzvA1QQC4qePg+XDRt4olFTVs+4h6V
	G7zBcnNk3RBWypDhq7YTgaW5nnM/cymjSg==
X-Google-Smtp-Source: AGRyM1s28J08joHy31BxkRKz/FG6mJ+ZGF+ZnyrL+RrUHZkPpuyrmuCZiS1iiCmF8hXapXMQORQ9nQ==
X-Received: by 2002:a05:6870:d215:b0:f2:5fc9:6492 with SMTP id g21-20020a056870d21500b000f25fc96492mr1156968oac.112.1657614848844;
        Tue, 12 Jul 2022 01:34:08 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id t32-20020a056870602000b00101cdb417f1sm4298982oaa.22.2022.07.12.01.34.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:34:08 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id s16-20020a0568301c7000b0061c283d6c37so5636841otg.12
        for <loongarch@lists.linux.dev>; Tue, 12 Jul 2022 01:34:07 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr23492652ywd.283.1657614516494; Tue, 12
 Jul 2022 01:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn> <20220712075255.1345991-3-chenhuacai@loongson.cn>
In-Reply-To: <20220712075255.1345991-3-chenhuacai@loongson.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Jul 2022 10:28:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
Message-ID: <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
Subject: Re: [PATCH 3/6] M68K: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, loongarch@lists.linux.dev, 
	Linux-Arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huacai Chen <chenhuacai@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
	stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Huacai,

Thanks for your patch!

On Tue, Jul 12, 2022 at 9:53 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,

DEBUG_PER_CPU_MAPS depends on SMP, which is not supported on m68k,
and thus cannot be enabled.

> cpu_max_bits_warn() generates a runtime warning similar as below while
> we show /proc/cpuinfo. Fix this by using nr_cpu_ids (the runtime limit)
> instead of NR_CPUS to iterate CPUs.
>
> [    3.052463] ------------[ cut here ]------------
> [    3.059679] WARNING: CPU: 3 PID: 1 at include/linux/cpumask.h:108 show_cpuinfo+0x5e8/0x5f0
> [    3.070072] Modules linked in: efivarfs autofs4

efivarfs on m68k?

EFIVAR_FS depends on EFI depends on !CPU_BIG_ENDIAN

> [    3.076257] CPU: 0 PID: 1 Comm: systemd Not tainted 5.19-rc5+ #1052
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

Does this need a Fixes tag, so we know when the problem was introduced?

> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -201,7 +201,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> -       return *pos < NR_CPUS ? ((void *) 0x12345678) : NULL;
> +       return *pos < nr_cpu_ids ? ((void *) 0x12345678) : NULL;
>  }

include/linux/cpumask.h has:

    #if NR_CPUS == 1
    #define nr_cpu_ids              1U

so on m68k, both evaluate to the same value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
