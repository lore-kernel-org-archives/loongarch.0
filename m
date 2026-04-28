Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E333A6B7F
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369052; cv=none; b=uQAQZFqGKSu0pW9kMv6drPRW3MOZjgq7RdHIlP54JrCWyMojNRUGDBwaIX3seDOuBFwPPnmBWiEeKmYej2rY+6yoaVt8RvvsCPbGuiYAuB+0NOUW7vGjLGElEpa4WxD8FBogYu0l2QnredwVDHhDmLQcovZKQFPIWOJlrmGSe+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369052; c=relaxed/simple;
	bh=qfx28yQjVoxASipigdX9q6aKPnZEzTiuv8HJyHxBKok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ornpt2dmx+ZdPRIn9SgtojTFTLzPrbq2iizscCtIwoMAcXvC1jcKO2ohLVLD2B+uCqUcsnjb688emnnAEri8h+E5vsyzVKdnNJPMLabvZbVbNvNB2ip6rrkG3aXJX6fInNGgwHwhaRuuU2IR38x0PPaukEtt3+eSk2P8F73yCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJXa9UTV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJXa9UTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED20FC4AF09
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777369052;
	bh=qfx28yQjVoxASipigdX9q6aKPnZEzTiuv8HJyHxBKok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dJXa9UTVcoRSMb2ebfX0adpUE8y6cAsXicvVP+HCHo6s8jruWN2oK1HVyybuBBZhO
	 Pex2kIkFTudB8AB/6nVpYajEwFfqO5SC/w8GKTmZrJ7b6rEi/VNWi+5c+cH+1PbLit
	 ySDIjc40CMAkTpgHIrVHe8Dph4NhPtphzfzy0cECNAaqJQqt/8CZ9Ttr3iSyZ/gUvK
	 KshNdmAps8SqSCtjMFk6flkheAFPxj3Yzi4xSajkLqQ9C4FTSv1xjLynYsRBjNhruy
	 XqdFQHMo45cwHincHJEnd7TXqLs32sTH94BQ55i0OL+8tA15u3C/0fmoba7KyIKGV6
	 0bWUkfEY20aow==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1880454066b.0
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 02:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WlZa1/R9p4fLZHW8ZTS/AGNYpu9UjqRzTDM/50GAdURuugaQJSI7r8moRyvsYb/qPr4oGVXpReKA=@lists.linux.dev
X-Gm-Message-State: AOJu0YybqrXg/CNFv8cKY1rSkSA4h8ELOmxco1qNSXWOn/RRC20NwC3Y
	zbXJi4zvttZLHqdWiwO1y6bXNEtH09kGwEXysdb9V4xLTMchpPHUEU0RMOOPOTQbB4MKDZyBNf+
	bBWqFi5BtYYJpi0p+UaoKCuU9caOCIuw=
X-Received: by 2002:a17:907:6b85:b0:bb5:8592:b9bb with SMTP id
 a640c23a62f3a-bb8028bd6f8mr144248266b.17.1777369050557; Tue, 28 Apr 2026
 02:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428075231.2283151-1-maqianga@uniontech.com>
In-Reply-To: <20260428075231.2283151-1-maqianga@uniontech.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 28 Apr 2026 17:37:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4i-0-yTsb9UZh3M0rr_bd-FO66wK9Q85RuDmH8M2ZArQ@mail.gmail.com>
X-Gm-Features: AVHnY4IcNk51mQ399xu5XXQNhq4H_k3N3AWLXcgdKsqtkMq5QshPBmP2uK62wW0
Message-ID: <CAAhV-H4i-0-yTsb9UZh3M0rr_bd-FO66wK9Q85RuDmH8M2ZArQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Refactor the Features output in show_cpuinfo()
To: Qiang Ma <maqianga@uniontech.com>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://lore.kernel.org/loongarch/20260228102946.4045-1-dongtai.guo@linux.d=
ev/
https://lore.kernel.org/loongarch/20260428075231.2283151-1-maqianga@unionte=
ch.com/T/#u

What make you modify here again and again?
Is this function ugly?
Is this function has bugs?
Or for some other reasons?


Huacai

On Tue, Apr 28, 2026 at 3:53=E2=80=AFPM Qiang Ma <maqianga@uniontech.com> w=
rote:
>
> 1. Adds an hwcap_str[] mapping table, using KERNEL_HWCAP(x)
> (i.e., const_ilog2(HWCAP_LOONGARCH_x)) to map HWCAP bits
> to corresponding strings;
> 2. In show_cpuinfo(), iterates through hwcap_str in a loop,
> checks the bitmap of elf_hwcap, and prints the corresponding
> feature names;
> 3. Maintains the original output semantics (still printing
> the same feature names) to facilitate adding new CPU features
> in the future.
>
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  arch/loongarch/kernel/proc.c | 60 ++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 34 deletions(-)
>
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index d4ce5b585453..1188bffd66b6 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -12,9 +12,32 @@
>  #include <asm/idle.h>
>  #include <asm/processor.h>
>  #include <asm/time.h>
> +#include <asm/cpufeature.h>
> +
> +#define KERNEL_HWCAP(x)  const_ilog2(HWCAP_LOONGARCH_ ## x)
> +static const char *const hwcap_str[] =3D {
> +       [KERNEL_HWCAP(CPUCFG)]          =3D "cpucfg",
> +       [KERNEL_HWCAP(LAM)]             =3D "lam",
> +       [KERNEL_HWCAP(LAM_BH)]          =3D "lam_bh",
> +       [KERNEL_HWCAP(UAL)]             =3D "ual",
> +       [KERNEL_HWCAP(FPU)]             =3D "fpu",
> +       [KERNEL_HWCAP(LSX)]             =3D "lsx",
> +       [KERNEL_HWCAP(LASX)]            =3D "lasx",
> +       [KERNEL_HWCAP(CRC32)]           =3D "crc32",
> +       [KERNEL_HWCAP(COMPLEX)]         =3D "complex",
> +       [KERNEL_HWCAP(CRYPTO)]          =3D "crypto",
> +       [KERNEL_HWCAP(LVZ)]             =3D "lvz",
> +       [KERNEL_HWCAP(LBT_X86)]         =3D "lbt_x86",
> +       [KERNEL_HWCAP(LBT_ARM)]         =3D "lbt_arm",
> +       [KERNEL_HWCAP(LBT_MIPS)]        =3D "lbt_mips",
> +       [KERNEL_HWCAP(PTW)]             =3D "ptw",
> +       [KERNEL_HWCAP(LSPW)]            =3D "lspw",
> +       [KERNEL_HWCAP(SCQ)]             =3D "scq",
> +};
>
>  static int show_cpuinfo(struct seq_file *m, void *v)
>  {
> +       unsigned int i;
>         unsigned long n =3D (unsigned long) v - 1;
>         unsigned int isa =3D cpu_data[n].isa_level;
>         unsigned int prid =3D cpu_data[n].processor_id;
> @@ -60,40 +83,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>         seq_puts(m, "\n");
>
>         seq_puts(m, "Features\t\t:");
> -       if (cpu_has_cpucfg)
> -               seq_puts(m, " cpucfg");
> -       if (cpu_has_lam)
> -               seq_puts(m, " lam");
> -       if (cpu_has_lam_bh)
> -               seq_puts(m, " lam_bh");
> -       if (cpu_has_scq)
> -               seq_puts(m, " scq");
> -       if (cpu_has_ual)
> -               seq_puts(m, " ual");
> -       if (cpu_has_fpu)
> -               seq_puts(m, " fpu");
> -       if (cpu_has_lsx)
> -               seq_puts(m, " lsx");
> -       if (cpu_has_lasx)
> -               seq_puts(m, " lasx");
> -       if (cpu_has_crc32)
> -               seq_puts(m, " crc32");
> -       if (cpu_has_complex)
> -               seq_puts(m, " complex");
> -       if (cpu_has_crypto)
> -               seq_puts(m, " crypto");
> -       if (cpu_has_ptw)
> -               seq_puts(m, " ptw");
> -       if (cpu_has_lspw)
> -               seq_puts(m, " lspw");
> -       if (cpu_has_lvz)
> -               seq_puts(m, " lvz");
> -       if (cpu_has_lbt_x86)
> -               seq_puts(m, " lbt_x86");
> -       if (cpu_has_lbt_arm)
> -               seq_puts(m, " lbt_arm");
> -       if (cpu_has_lbt_mips)
> -               seq_puts(m, " lbt_mips");
> +       for (i =3D 0; i < ARRAY_SIZE(hwcap_str); i++)
> +               if (elf_hwcap & (1 << i))
> +                       seq_printf(m, " %s", hwcap_str[i]);
>         seq_puts(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
> --
> 2.20.1
>
