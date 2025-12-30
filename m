Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD99288510
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096374; cv=none; b=Hsm0cjAoweL3eNGok8fz7OO9TLo1vQBcGQ8MwZA1tMWb/xDPOZzfAL0Abu4QuseO+XPoqxIVskLS4VM8iAVLhr4QEu1lK55Sdixjv72GM9ebDFLAvteWr/Jgn2U8u6LrMnzvOxJg5+qKUDCxRKrWq8YDUcJ4f891IeIujW9VeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096374; c=relaxed/simple;
	bh=xWB5k2/w0seDVNOOyQDzGYnPLLNMCBAE9/F5Iy6dRSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+fcwDMumph8bHoL41k6//faEWMbQnax5krYHnqGuvIGT1d49kpZVxWNa5BZL6G65agMPgwA+8SfSrU890sTwsmBLGaiXQCbQuo1MmGKxWRS/JEtyVncqhMeqPN/mUvfEPIlm7MxTcfmCehrO9C6bBZEqhs6G3qDhPTLnWx/Wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8CYbHOT; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8CYbHOT"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45358572a11so5437273b6e.3
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767096369; x=1767701169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yj5zAQNITHh3tvT9brz7hOd1zvlJ5RwwDCAUSjm+Y60=;
        b=j8CYbHOTt14ByofHumOj6WYkXm12N2CsJYzH6d3Y+eQca6JHJm3TooXaVN2cgiMXP4
         nnqRYQrcVYGJ3lOJLAFbjRrV/zQ7/anMVnntklh6He6KR33arklQ6m+peJ7FiEzgAfY0
         PlTdnYsbRnlYchKDnNHLxAMZ+jZEgdzlEl6qUpSiCXhkSX22uQ34kTwNQ/G39PRL5juM
         QPiDGi/+2TagxitMi1oGkqA2XimYVeDmCNdthukNRH/ZoqkdPDL77sfjo9qkQ3qrJTBR
         QDwG0KBAIQvNVkTJ2Wf27xXBPT6UCrTSxsQRGkgB7KFdiZ7VAdKOPguMqnuGsQhVxJHG
         B3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767096369; x=1767701169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yj5zAQNITHh3tvT9brz7hOd1zvlJ5RwwDCAUSjm+Y60=;
        b=iTVVp81kErIolKaGAw2DSRlQT6EKroBXN7pZ4o4OjDuF3p1vcPsMbP3CwNC7bwdYwS
         4GL6ZYRos7fel8mc0aSRHLdAP0v98yrI4h4t3FBzEZO0+Vxa1MuVbzManq9KmSFXmK2S
         QKVO5HDClza9Kd6LN4YnUCX+qnEoQ79nQHzms71wDzj8Ve/lp4XO69n3VIw9CCnKoc2v
         lJfx+nSBsjITN/nHxMAjO6tYa4jURi8arogG5XNL2Hm1Ku3tMHovNxanyOxJluU4nzF0
         R27qeYIrCxd2l8kiqWSWIX3aZSJUas37Yr1zC3RWJQa/UUu75taFhOyPHGgAymwBZmiz
         S5dg==
X-Forwarded-Encrypted: i=1; AJvYcCVOiOGOSnDdDvLr/JjIHw9WXWRSbZN90rcDerwyS3wG0Ru9wCqzayZvIYtk6F+6ZZjh1Vwk34qo6SA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCj+0eDQCMvd5gmxUZ2sV9mKuq5tGDnEY3L1msb/KY7x0Bb56n
	MoSozpIGqB8DYiK/fJD2UPDlO2CdJ6xA0w5axVN7X8xBI7FGXu3CVe3/AuZRb15nHAc5AjzouB2
	/bZM/ADgCmms8VDz/si5g/drO2aU91S8=
X-Gm-Gg: AY/fxX6eRTwOFetVoGyofqmwLsF8uGaA9NpgZZi5i9Sfq96X2ucoHY9HsS5k898VYO2
	gjmSmy974k9Ihq8QMxAuy4iZL6dCTkvzhmxmAZBx9LSOGM1JbZQYR5R+y1dRtFksflHqetN0sQt
	g9y4y9io6eI0K5EMAa6Vt/9cBx6rsf8dBGML22zluG1492tdUht1WzsTI344Uu1tyYNw3ciHdau
	Pzi+Hl2St2J1ggp9PeW3XE1i07vakB6SZzQ67LXwPaw49Jbka+wJXlNlmUX/y7jIlkGhMz8
X-Google-Smtp-Source: AGHT+IHaJcgupUPVUF082/sRP4fwWz5Ho5G0FBzOpkUKH1iXbxS1eGzWyBOCC2BdzXoMVBg8cEA/a7K0Bea3Ux63amI=
X-Received: by 2002:a05:6808:d47:b0:44f:e801:d6d6 with SMTP id
 5614622812f47-457b1e55942mr16940213b6e.6.1767096369341; Tue, 30 Dec 2025
 04:06:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
 <20251230013417.37393-1-dongtai.guo@linux.dev> <20251230013417.37393-2-dongtai.guo@linux.dev>
In-Reply-To: <20251230013417.37393-2-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 30 Dec 2025 20:05:58 +0800
X-Gm-Features: AQt7F2oErDpNDnyLqiaWuXQQP5J4gmJ8oE3in8cG8SrCiUyahoRjrPMgfRi3DBI
Message-ID: <CAEyhmHT5xwu79pQG9DRn7niUOr6f91ps+nr+ZNPSL-C=R_xxmQ@mail.gmail.com>
Subject: Re: [PATCH v7 loongarch-next 1/4] LoongArch: Add SCQ support detection
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 9:34=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Check CPUCFG2_SCQ bit to determin if the CPU supports
> SCQ instrction.
>
> Co-developed-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cpu-features.h | 1 +
>  arch/loongarch/include/asm/cpu.h          | 2 ++
>  arch/loongarch/include/asm/loongarch.h    | 1 +
>  arch/loongarch/kernel/cpu-probe.c         | 2 ++
>  arch/loongarch/kernel/proc.c              | 1 +
>  5 files changed, 7 insertions(+)
>

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>

> diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/i=
nclude/asm/cpu-features.h
> index 3745d991a99a..39c7fe64c3ef 100644
> --- a/arch/loongarch/include/asm/cpu-features.h
> +++ b/arch/loongarch/include/asm/cpu-features.h
> @@ -67,5 +67,6 @@
>  #define cpu_has_msgint         cpu_opt(LOONGARCH_CPU_MSGINT)
>  #define cpu_has_avecint                cpu_opt(LOONGARCH_CPU_AVECINT)
>  #define cpu_has_redirectint    cpu_opt(LOONGARCH_CPU_REDIRECTINT)
> +#define cpu_has_scq            cpu_opt(LOONGARCH_CPU_SCQ)
>
>  #endif /* __ASM_CPU_FEATURES_H */
> diff --git a/arch/loongarch/include/asm/cpu.h b/arch/loongarch/include/as=
m/cpu.h
> index f3efb00b6141..5531039027ec 100644
> --- a/arch/loongarch/include/asm/cpu.h
> +++ b/arch/loongarch/include/asm/cpu.h
> @@ -125,6 +125,7 @@ static inline char *id_to_core_name(unsigned int id)
>  #define CPU_FEATURE_MSGINT             29      /* CPU has MSG interrupt =
*/
>  #define CPU_FEATURE_AVECINT            30      /* CPU has AVEC interrupt=
 */
>  #define CPU_FEATURE_REDIRECTINT                31      /* CPU has interr=
upt remapping */
> +#define CPU_FEATURE_SCQ                        32      /* CPU has SC.Q i=
nstruction */
>
>  #define LOONGARCH_CPU_CPUCFG           BIT_ULL(CPU_FEATURE_CPUCFG)
>  #define LOONGARCH_CPU_LAM              BIT_ULL(CPU_FEATURE_LAM)
> @@ -158,5 +159,6 @@ static inline char *id_to_core_name(unsigned int id)
>  #define LOONGARCH_CPU_MSGINT           BIT_ULL(CPU_FEATURE_MSGINT)
>  #define LOONGARCH_CPU_AVECINT          BIT_ULL(CPU_FEATURE_AVECINT)
>  #define LOONGARCH_CPU_REDIRECTINT      BIT_ULL(CPU_FEATURE_REDIRECTINT)
> +#define LOONGARCH_CPU_SCQ              BIT_ULL(CPU_FEATURE_SCQ)
>
>  #endif /* _ASM_CPU_H */
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index e6b8ff61c8cc..817cd90941d9 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -94,6 +94,7 @@
>  #define  CPUCFG2_LSPW                  BIT(21)
>  #define  CPUCFG2_LAM                   BIT(22)
>  #define  CPUCFG2_PTW                   BIT(24)
> +#define  CPUCFG2_SCQ                   BIT(30)
>
>  #define LOONGARCH_CPUCFG3              0x3
>  #define  CPUCFG3_CCDMA                 BIT(0)
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 08a227034042..382c472c6bfe 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -205,6 +205,8 @@ static void cpu_probe_common(struct cpuinfo_loongarch=
 *c)
>                 c->options |=3D LOONGARCH_CPU_PTW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_PTW;
>         }
> +       if (config & CPUCFG2_SCQ)
> +               c->options |=3D LOONGARCH_CPU_SCQ;
>         if (config & CPUCFG2_LSPW) {
>                 c->options |=3D LOONGARCH_CPU_LSPW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LSPW;
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index a8800d20e11b..252fa1d03b85 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -75,6 +75,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>         if (cpu_has_lbt_x86)    seq_printf(m, " lbt_x86");
>         if (cpu_has_lbt_arm)    seq_printf(m, " lbt_arm");
>         if (cpu_has_lbt_mips)   seq_printf(m, " lbt_mips");
> +       if (cpu_has_scq)        seq_printf(m, " scq");
>         seq_printf(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
> --
> 2.49.0
>
