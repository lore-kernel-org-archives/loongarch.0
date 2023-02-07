Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D515B5
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 04:32:20 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id v3so9664676pgh.4
        for <loongarch@lists.linux.dev>; Mon, 06 Feb 2023 20:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QkepoEAYp/J89jUPrS5oHg3j1T019gvhCzsSu6FD+kI=;
        b=O39ezPj19M+Qu5q4eJcsWzydaF4LNch4zKj3xren1V0sFywnOuspOVNAH9kkdIo52O
         GbsN6BaVXpotF/X0a+3LGS+wQXGQjrLbNLH8OCaYOv8Wu26u0u/udqcixMUkwvY6HQbR
         sCJDmI7dl7IwrDLpr6lsOcsi3wB53ARxreY4ds5/nEci6BSbYfo1BcQETOh04zViLdN6
         KpC5aldGztHba4D8bRYZWjx1v4fKKYAkccesZ7zjtpAhfPP/D4FIExs1uv7TWetaCWeP
         Z5xIMzChSr1JvjaTwu2wj3VHSG76kpc8eZtAjhDhVo/FfvFqEPZGgHEcLjMxcrROjeS/
         nR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkepoEAYp/J89jUPrS5oHg3j1T019gvhCzsSu6FD+kI=;
        b=I0CYMu12w/NbK/o9EzzxZevWq16GCn33iEy3Q1F+27wfCWZeVXsSH3m0LkS1RrwN/y
         YYSVPaGPPgd1tz/7O3x5/4/l5WKE8FzSMrKDR83y2bJHtY4fsk7qv974H+db0DYiNtGM
         xukbLKywbvWTVvJcA2zarqnc2kcbAvmVOgFKNmvg/9B1NACrmex/KlmxHFVXh7mu2sdg
         vgkZA/5m5eN3SoNJ/bF/1lCInk1sKyftR4V5xcFpjvXcsU84XG4UW9abrUBM3WLmsIPC
         wY8xhvfuxppHdyEuDJAKDzVvstptfkerJFVW3uC3mnt6kw5Tc+pMO22SXoCqSQOGHKR1
         2FbQ==
X-Gm-Message-State: AO0yUKWRf6Jbo6SsSEC2QgWIezVFjJhbADUktrKMUhnNJz8Purg490vH
	i2fJv+HU7rmkln+ndSg3NmYbHegSHe0pK0Zbr0o=
X-Google-Smtp-Source: AK7set88ZNfy9bBNKnCwkgZwRfcPCe3OXDdfFGwm1IPbBUnqScHbMzm4e9um+pOIF3kt+Bd9P/xfg6/nWf52JEOQJcw=
X-Received: by 2002:aa7:972b:0:b0:593:dc7d:a31d with SMTP id
 k11-20020aa7972b000000b00593dc7da31dmr440938pfg.23.1675744339811; Mon, 06 Feb
 2023 20:32:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1674007261-9198-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4aTd6_cSy45KKjv-KrLTiwT4iG6+fkb84KfCrL3Y+hpg@mail.gmail.com>
 <CAAhV-H5WN5E=0Z9wpbXDc6VO7Nc+j7PGvnyAAGOmCRMJkdwSYw@mail.gmail.com>
 <CAEr6+ECO-=jfhzHrcdKGx0MsjMBMiN6wsBPCfv7CaXo_amAWWg@mail.gmail.com>
 <02806f85-bc09-d316-f058-3947353cb190@loongson.cn> <CAEr6+EBYF2xqZWEuZaz5un5FF3Jb-rSAQp3s3uojsovm9RcUYA@mail.gmail.com>
 <CAAhV-H5dJGrL3kEwzC-XwMqJTCsYHq-YVDTDRntGcYg9RMz02w@mail.gmail.com>
 <CAEr6+EDvaqpfvyJhe9TpDbhzrgu9aPPtePi2Vp=vAB5xgMNhXQ@mail.gmail.com>
 <8f306f68-7517-7c45-b2ef-668af9cf5f6a@loongson.cn> <CAAhV-H7O-R33AQvCXmZQXDb-ACjZ5MYdWULHuKXYdnvt+UPjJA@mail.gmail.com>
In-Reply-To: <CAAhV-H7O-R33AQvCXmZQXDb-ACjZ5MYdWULHuKXYdnvt+UPjJA@mail.gmail.com>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Tue, 7 Feb 2023 12:32:08 +0800
Message-ID: <CAEr6+EDRciZc1_QB7VZO8dhw78U_LZPAnkG24z5cY-oZJEQiLw@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Add kprobe and kretprobe support for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Masami Hiramatsu <mhiramat@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 12:03 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Jeff,
>
> The code has been updated here,
> https://github.com/loongson/linux/commits/loongarch-next, you can test
> again.

It looks good to me.

Tested-by: Jeff Xie <xiehuan09@gmail.com>


> Huacai
>
> On Tue, Feb 7, 2023 at 11:14 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> >
> >
> > On 02/06/2023 08:48 PM, Jeff Xie wrote:
> > > On Mon, Feb 6, 2023 at 8:13 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >>
> > >> Hi, Jeff,
> > >>
> > >> Now I add kprobes on ftrace support in
> > >> https://github.com/loongson/linux/commits/loongarch-next, please test
> > >> again. Thank you.
> > >>
> > >
> > > When using the kprobe example module kprobe_example.ko, I haven't seen
> > > any errors.
> > >
> > > But when using the ftrace to probe the symbol + offset, the kernel will panic:
> > > e.g. probe the scheduler_tick+4 is fine, but when probe the
> > > scheduler_tick+5, the kernel will panic.
> > >
> >
> > Thanks for your test.
> >
> > We can see that the instruction address is 4-byte alignment,
> > this is because the instruction length is 32-bit on LoongArch.
> >
> > $ objdump -d vmlinux > dump.txt
> > $ grep -A 20 scheduler_tick dump.txt | head -21
> > 9000000000279fc8 <scheduler_tick>:
> > 9000000000279fc8:       03400000        andi            $zero, $zero, 0x0
> > 9000000000279fcc:       03400000        andi            $zero, $zero, 0x0
> > 9000000000279fd0:       02ff4063        addi.d          $sp, $sp, -48(0xfd0)
> > 9000000000279fd4:       29c08077        st.d            $s0, $sp, 32(0x20)
> > 9000000000279fd8:       29c06078        st.d            $s1, $sp, 24(0x18)
> > 9000000000279fdc:       29c04079        st.d            $s2, $sp, 16(0x10)
> > 9000000000279fe0:       29c0207a        st.d            $s3, $sp, 8(0x8)
> > 9000000000279fe4:       29c0a061        st.d            $ra, $sp, 40(0x28)
> > 9000000000279fe8:       2700007b        stptr.d         $s4, $sp, 0
> > 9000000000279fec:       24001844        ldptr.w         $a0, $tp, 24(0x18)
> > 9000000000279ff0:       1a02edd9        pcalau12i       $s2, 5998(0x176e)
> > 9000000000279ff4:       1a034bac        pcalau12i       $t0, 6749(0x1a5d)
> > 9000000000279ff8:       02f56339        addi.d          $s2, $s2, -680(0xd58)
> > 9000000000279ffc:       00410c9a        slli.d          $s3, $a0, 0x3
> > 900000000027a000:       28aae18d        ld.w            $t1, $t0, -1352(0xab8)
> > 900000000027a004:       380c6b2e        ldx.d           $t2, $s2, $s3
> > 900000000027a008:       1a022fcc        pcalau12i       $t0, 4478(0x117e)
> > 900000000027a00c:       02f20198        addi.d          $s1, $t0, -896(0xc80)
> > 900000000027a010:       00150317        move            $s0, $s1
> > 900000000027a014:       004081ac        slli.w          $t0, $t1, 0x0
> >
> > So we should check the probe address at the beginning of
> > arch_prepare_kprobe(), some other archs do the same thing.
> >
> > $ git diff
> > diff --git a/arch/loongarch/kernel/kprobes.c
> > b/arch/loongarch/kernel/kprobes.c
> > index bdab707b6edf..56c8c4b09a42 100644
> > --- a/arch/loongarch/kernel/kprobes.c
> > +++ b/arch/loongarch/kernel/kprobes.c
> > @@ -79,6 +79,9 @@ NOKPROBE_SYMBOL(arch_prepare_simulate);
> >
> >   int arch_prepare_kprobe(struct kprobe *p)
> >   {
> > +       if ((unsigned long)p->addr & 0x3)
> > +               return -EILSEQ;
> > +
> >          /* copy instruction */
> >          p->opcode = *p->addr;
> >
> >
> > Thanks,
> > Tiezhu
> >
> >



-- 
Thanks,
JeffXie
