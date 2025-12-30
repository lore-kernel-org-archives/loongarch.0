Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BA9288510
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096474; cv=none; b=VnW/yzsdeLxt4r6Pt4Ohr1ZUG1RJA56yp4W8iD8uvgQbaJ4K810k3uHz/0BgW3WBppfHII0QOyQA3WcDfeNV5VVYPWlWOgKOg+NQfbpHDRhLRjUrMiu+FR+1IjXAF5x7xgyPHCp9asA3BJTNV4IN7WrVXh98H505LyXfrTyM6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096474; c=relaxed/simple;
	bh=qeRsYxXMDxta/1fxwnrutrl+dlHZbQmyC/jdz5B0fcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhBS/XjdnhZC8hWidzTBpeZDJi3Pufq3iajzfOSK2eDlEFP7vfLMCzU9hz1ChrqfCjHxTdQ3MElti441WHCYeA/jAX4UQ21aKuz8nI+QhFNp7JmIq8RmT4LHdrmRJdacY02AI/AQMC1j7OrPrliOsQtBzg3Zz8daJeBgaiIOrEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7mqy3Jo; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7mqy3Jo"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c6da42fbd4so5371245a34.1
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 04:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767096472; x=1767701272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mzWc1VF8Okk/eOZ0wstcpeVG8MnYafMxHy38xDIrxc=;
        b=i7mqy3Jo5gBxQa9CPPH/C2/8NoDuAL2X0RlO2I79fXFjD2K7djNwhN3y/vOKUgCn57
         17u6UgMkfG+DLYgiK+tUggWIyTSD4OaAEth7LBgRDCFxFpo9xtdsJF/iCNGUBstHefsW
         YvmUR7ST/wDTZjZSSZdFoAs5efPgr9GdSzLNg2EodEKeP5gs/KT9QrzckQ4QyOrgukfx
         XWuDBV78/OqAP09X20SBpbKW/DOMgePdu5pS3D2UP6VfiwzY6qeX+7p4WW2EszI/iNA5
         zKPdj5yOecR2ijJoQ4YaDYLfLPw2RZfBwO4oZjoa6B2P6Nj17Qzukahes2AAqtviPrmb
         uTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767096472; x=1767701272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9mzWc1VF8Okk/eOZ0wstcpeVG8MnYafMxHy38xDIrxc=;
        b=kJHhCXyFtEUF8d17EM01Okk4yTItwg8VyiA2nr/u5etqDtkiTp7+ZHO0yehB87Y+rx
         vLpneerQ57BRrKRUNyuc1yUADb54l4CuuwyNmXW+7NGKmE0Tbum1aUWJ42mqKAKlx9R/
         FJcm6YGi1It6zABIpJy4gzddKVbhYKgwa93YNC+Qu1mTb26kf1X1+MKQ3Y+SML9BBR1U
         AU+5bFHp3OWEOmGFTDOv9Zo5UZlCxPWQWZAIwGCYnwcmwL8xG33Wga93fyPGK9sRZTTP
         lKoN8E3hXhFvmsMdlzfYe8WQtbGw/m/7mPiREJofbOcYyVu4lff4JNOfa05y1outWTau
         utVw==
X-Forwarded-Encrypted: i=1; AJvYcCXiTewL4tCy8AJOfetp407xn3hNqTt03Uee5tkIZbUrrrmYIyin9geg4oTSELffZlOeVsARULtn2C0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Sv6RUgTZwOsOuw3d1csH4Xft4vCtTNYm58S6eMseSG9phIpf
	GXa02cR8bXL0rK37vtla3ejqnZ+ROSYVRyAO4/zr4MjHTEurx06EI1Z7FkT1n3EpvVwqMkJVdkO
	7ubzZlr1xV4SPKSHXy5XC5Ke2b3X2sy4=
X-Gm-Gg: AY/fxX5CnIXufgnlWSZyqurRoUjQoNiGsw7hwsyhhdFHcFI+O7TF1jVc3/sFPJ8sbsD
	NI2Uw351/ei8mY1WG7FJkjPzeVo2qssIKx38zzesm7cWRz6H9MuakAt69QqvsKriEm4XIBKBY+I
	R6UZGP6M/EX0o2PPDSCNBQmSfZkL6QkktLf0UILg17lJwv8IXmLSFf6nxpRrX2CQIcugWwiakHY
	KQjpWsHb1cvF3vv29ce0hQlxhhEXMjJOBjGBMNP+KeH7SaNzYh6SZQYhVT/GH2In4ofZPSm
X-Google-Smtp-Source: AGHT+IEp+XIBkNoZ48XvLROOum0+sFgk2uwYggOQAn82xZTKKGdG28vruY2n8xfLCcIDgnj1P0Bb1siW+Foe/6dK5Ak=
X-Received: by 2002:a05:6820:1c82:b0:65d:1ec0:2ff9 with SMTP id
 006d021491bc7-65d1ec035bemr10152563eaf.18.1767096471936; Tue, 30 Dec 2025
 04:07:51 -0800 (PST)
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
Date: Tue, 30 Dec 2025 20:07:41 +0800
X-Gm-Features: AQt7F2riDFwhWJqVnb0yUU49eJ9IfEjVTh7uFe6A5cxYFJTGTIMqCNnyJlcuvhk
Message-ID: <CAEyhmHSmbZiW9Q49tvBDxSF0RUS=_fAFCwVtDzy30-y5=OcpzA@mail.gmail.com>
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

nit:
determin -> determine
instruction -> instruction

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
