Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3153ED113
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372199; cv=none; b=puzEZw62QWnsUKsbNMsjpdaMWts8ibzhHcDTdk2tdCdDg5W0xze+hYu7QArTfiJ9XvXKjthNpHH9dNh4e5+ZqmJ1nasTjma+Bg/2wYT++WdTbRHsV4HWmzt8Ck17qY1zMujSm4JtINOqtXKvv7G3PMn674LrzSmHMgybn233ZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372199; c=relaxed/simple;
	bh=9o5wPyff6tzhKrGGB+GM5v55e5yo5DeWFklj9yIHuag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dboz/9CIUeObOjHi3YP/t8I95vECk0vubpQy4GdzYGaylnWotMENSvqc24tl3e3bilQ4RHz/NBpbCnKDBWwSgepbF7QxJTswwfW9BeKMJwhNX43TW709BL5Ji0GcrEzPfZJ+ekD2HEXNqRaDdVHyemU1AnjHBBrx4gNx1Lnb8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDiWJiz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDiWJiz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0006C2BCAF
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372198;
	bh=9o5wPyff6tzhKrGGB+GM5v55e5yo5DeWFklj9yIHuag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZDiWJiz5ReasGMXjDSpfkNNLTCUvJ+UWhagiFxztt/DxeRHQ/nAgLbUBUE/Lhc0Jk
	 NBTqrpqfXRYRUX4NqDiVLe461uWePfZ25CqX/2V+2XF0jmqscDOqpCM04EKdExKyAP
	 AuUY0XRkIRFffaFTTKcjEkELT2yJqkvehJlllPCOAKQiMvYyDgPc5mMYNijCt2VAHN
	 WSSgpsxPof0468/ui2kbNotNO6wgF0y56il6g71gUvnWE0SiypcULEh/6bIdstJKs+
	 3EFrlZY1Z41WEKm1/KkyOzOpoSaZzKe/Z5MBDoxSgal70af8wjD35LNOYkCcw7caJj
	 HkVv+RrcWnxXQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67785ef88feso9070460a12.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 03:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RBeBarvoKICaB23YbTpBLyN4Vzc6p/cHubOofix438IPScHWqL+fBCERRGxHF5RK/t6YX0TY4xPA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgMzWtWUsySQiDpg+gzbB/EHPLa1HCB+Qc2QRlwDwV+Q4PtirR
	Q6yF90KeEMFsmJsr3JoL5WaCicqjbdbo/t+UaWY6GUZLwfbmNE1qfQJHNmj9e5mO5qE5wUoyDVb
	cczHtyAlKzkonbOopHhP3fUMuqxYiH3I=
X-Received: by 2002:a17:907:7295:b0:ba8:ca25:e6ab with SMTP id
 a640c23a62f3a-bb801ad6b78mr170299166b.11.1777372197399; Tue, 28 Apr 2026
 03:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428075231.2283151-1-maqianga@uniontech.com>
 <CAAhV-H4i-0-yTsb9UZh3M0rr_bd-FO66wK9Q85RuDmH8M2ZArQ@mail.gmail.com> <31529056B7CF466A+6fc02cf2-cb43-4047-90ec-cd5e412ca5f7@uniontech.com>
In-Reply-To: <31529056B7CF466A+6fc02cf2-cb43-4047-90ec-cd5e412ca5f7@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 28 Apr 2026 18:30:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7mY47EVcrLA08NRWbjM87G66F0P-W9UPDrL3=t276T8Q@mail.gmail.com>
X-Gm-Features: AVHnY4JNpxWZTuujL23BQQmDQtn0CZd91SSMT0IN4Gp1Vg3J2zVlFLeAaO8C680
Message-ID: <CAAhV-H7mY47EVcrLA08NRWbjM87G66F0P-W9UPDrL3=t276T8Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Refactor the Features output in show_cpuinfo()
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 6:08=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
>
> =E5=9C=A8 2026/4/28 17:37, Huacai Chen =E5=86=99=E9=81=93:
> > https://lore.kernel.org/loongarch/20260228102946.4045-1-dongtai.guo@lin=
ux.dev/
> > https://lore.kernel.org/loongarch/20260428075231.2283151-1-maqianga@uni=
ontech.com/T/#u
> >
> > What make you modify here again and again?
> Sorry, I didn't notice that the relevant patch had already been submitted=
.
> > Is this function ugly?
> > Is this function has bugs?
> No
> > Or for some other reasons?
>
> I noticed that with the addition of new features to the LoongArch
> architecture,
>
> new features can be conveniently added without constantly needing to add
> if statements, keeping the code concise.
cpuinfo are not always the same as hwcaps, stop please.

Huacai

>
> >
> >
> > Huacai
> >
> > On Tue, Apr 28, 2026 at 3:53=E2=80=AFPM Qiang Ma <maqianga@uniontech.co=
m> wrote:
> >> 1. Adds an hwcap_str[] mapping table, using KERNEL_HWCAP(x)
> >> (i.e., const_ilog2(HWCAP_LOONGARCH_x)) to map HWCAP bits
> >> to corresponding strings;
> >> 2. In show_cpuinfo(), iterates through hwcap_str in a loop,
> >> checks the bitmap of elf_hwcap, and prints the corresponding
> >> feature names;
> >> 3. Maintains the original output semantics (still printing
> >> the same feature names) to facilitate adding new CPU features
> >> in the future.
> >>
> >> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> >> ---
> >>   arch/loongarch/kernel/proc.c | 60 ++++++++++++++++------------------=
--
> >>   1 file changed, 26 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc=
.c
> >> index d4ce5b585453..1188bffd66b6 100644
> >> --- a/arch/loongarch/kernel/proc.c
> >> +++ b/arch/loongarch/kernel/proc.c
> >> @@ -12,9 +12,32 @@
> >>   #include <asm/idle.h>
> >>   #include <asm/processor.h>
> >>   #include <asm/time.h>
> >> +#include <asm/cpufeature.h>
> >> +
> >> +#define KERNEL_HWCAP(x)  const_ilog2(HWCAP_LOONGARCH_ ## x)
> >> +static const char *const hwcap_str[] =3D {
> >> +       [KERNEL_HWCAP(CPUCFG)]          =3D "cpucfg",
> >> +       [KERNEL_HWCAP(LAM)]             =3D "lam",
> >> +       [KERNEL_HWCAP(LAM_BH)]          =3D "lam_bh",
> >> +       [KERNEL_HWCAP(UAL)]             =3D "ual",
> >> +       [KERNEL_HWCAP(FPU)]             =3D "fpu",
> >> +       [KERNEL_HWCAP(LSX)]             =3D "lsx",
> >> +       [KERNEL_HWCAP(LASX)]            =3D "lasx",
> >> +       [KERNEL_HWCAP(CRC32)]           =3D "crc32",
> >> +       [KERNEL_HWCAP(COMPLEX)]         =3D "complex",
> >> +       [KERNEL_HWCAP(CRYPTO)]          =3D "crypto",
> >> +       [KERNEL_HWCAP(LVZ)]             =3D "lvz",
> >> +       [KERNEL_HWCAP(LBT_X86)]         =3D "lbt_x86",
> >> +       [KERNEL_HWCAP(LBT_ARM)]         =3D "lbt_arm",
> >> +       [KERNEL_HWCAP(LBT_MIPS)]        =3D "lbt_mips",
> >> +       [KERNEL_HWCAP(PTW)]             =3D "ptw",
> >> +       [KERNEL_HWCAP(LSPW)]            =3D "lspw",
> >> +       [KERNEL_HWCAP(SCQ)]             =3D "scq",
> >> +};
> >>
> >>   static int show_cpuinfo(struct seq_file *m, void *v)
> >>   {
> >> +       unsigned int i;
> >>          unsigned long n =3D (unsigned long) v - 1;
> >>          unsigned int isa =3D cpu_data[n].isa_level;
> >>          unsigned int prid =3D cpu_data[n].processor_id;
> >> @@ -60,40 +83,9 @@ static int show_cpuinfo(struct seq_file *m, void *v=
)
> >>          seq_puts(m, "\n");
> >>
> >>          seq_puts(m, "Features\t\t:");
> >> -       if (cpu_has_cpucfg)
> >> -               seq_puts(m, " cpucfg");
> >> -       if (cpu_has_lam)
> >> -               seq_puts(m, " lam");
> >> -       if (cpu_has_lam_bh)
> >> -               seq_puts(m, " lam_bh");
> >> -       if (cpu_has_scq)
> >> -               seq_puts(m, " scq");
> >> -       if (cpu_has_ual)
> >> -               seq_puts(m, " ual");
> >> -       if (cpu_has_fpu)
> >> -               seq_puts(m, " fpu");
> >> -       if (cpu_has_lsx)
> >> -               seq_puts(m, " lsx");
> >> -       if (cpu_has_lasx)
> >> -               seq_puts(m, " lasx");
> >> -       if (cpu_has_crc32)
> >> -               seq_puts(m, " crc32");
> >> -       if (cpu_has_complex)
> >> -               seq_puts(m, " complex");
> >> -       if (cpu_has_crypto)
> >> -               seq_puts(m, " crypto");
> >> -       if (cpu_has_ptw)
> >> -               seq_puts(m, " ptw");
> >> -       if (cpu_has_lspw)
> >> -               seq_puts(m, " lspw");
> >> -       if (cpu_has_lvz)
> >> -               seq_puts(m, " lvz");
> >> -       if (cpu_has_lbt_x86)
> >> -               seq_puts(m, " lbt_x86");
> >> -       if (cpu_has_lbt_arm)
> >> -               seq_puts(m, " lbt_arm");
> >> -       if (cpu_has_lbt_mips)
> >> -               seq_puts(m, " lbt_mips");
> >> +       for (i =3D 0; i < ARRAY_SIZE(hwcap_str); i++)
> >> +               if (elf_hwcap & (1 << i))
> >> +                       seq_printf(m, " %s", hwcap_str[i]);
> >>          seq_puts(m, "\n");
> >>
> >>          seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has=
_watch));
> >> --
> >> 2.20.1
> >>
