Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20B2DE6FB
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768018324; cv=none; b=OipdRmNT3+95hWQAcpMdudZL0T8+wQmM8xZNGXtRBHthEPyvXemPS670FaBs579BNg/z4RRNOzHBSdf3wPUKCvaRCmEHm3zmS72lJfYKWLcNtJVLECMg9cnRRD12sYn4rmq9pTXPrPlqSQ1O9xigir7420ZxlUtWSf+zCBN6I/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768018324; c=relaxed/simple;
	bh=c+gT64jilIZWhclXwSKNfQbHd929CP0G0f5nuNGhNeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb5S7St/iTqfQE2U4/k7uFOnwXShMMZ3wKdGcAgePsciPwAhDe6vMoAi7AUWMq0D2Z7/OyBhG02s0ov3lOW1soGaDYLbZUkMUHjt0L6XCkqlzy41qv21EOVmWVZurgTESZ4RYi58gWWUxyMsqcRR6OZjAVkH+NdZHWHypjbmcNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQXkTtC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQXkTtC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B11C4AF0D
	for <loongarch@lists.linux.dev>; Sat, 10 Jan 2026 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768018323;
	bh=c+gT64jilIZWhclXwSKNfQbHd929CP0G0f5nuNGhNeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IQXkTtC9bz70dO03dM6eT865IeWc1ySl1KUk0oix7TYaM+vNwSjJP2mHplrlWXsmv
	 G4RCLANt+iAu7Vj13/Zs0XwLYZxJ90W9iJq6biL/IyLTUHsv/daQiPhVYSNu+jZWRR
	 iR9Tl+5J6bUnenT7Du3ynNI9dMNPxVWrpOIviAIIC9K9IJY1swbp2AFNDs+ITS1J9u
	 H7nWonQjkD68FoS0L3MG/V7ZUx/K0qJsdw0IauGdEP81EtLBrmhAcBbpsfhEK0CQZ9
	 1vJM+cYSihxZT96aco0zwF1LcfYPM9YMXdcQVocG1frsTcEIrBwAm647CphQ4/xOyc
	 PkuwaRt2YZzZQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b804646c718so722830066b.2
        for <loongarch@lists.linux.dev>; Fri, 09 Jan 2026 20:12:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViLaG6G0yNTXi5LP1ZUJzVlK9KikEPaxB0t/PWelhJypodLqsBJlvvfCQb0GSZ1CB87GHfKdOvd20=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy0JvxVgX6jRO77xYrF/4IwzQZq5A2PHW5jy9laHAswsTUMGz9
	aI/oZEOvU4Wjgrv7sxggwaRTvxauCBCbjRs8DlZOg4ctaNORHOjwp2VVsVB+Oh+syb8NpWGcdAL
	HYMS3FCP2cJ2wy5+GeTiW84ye62D5Xmk=
X-Google-Smtp-Source: AGHT+IHld8KmDWuYjOg7ODyL93Fe76s94mhiEkDKAI0YUaj0Vjgh/xVATZzg6YXC0UYE//vMkKaUb3p5hlM1IxigU1I=
X-Received: by 2002:a17:907:25c4:b0:b80:3fff:420e with SMTP id
 a640c23a62f3a-b84451daa93mr1118274466b.22.1768018322003; Fri, 09 Jan 2026
 20:12:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260105105514.76021-1-dongtai.guo@linux.dev> <20260105105514.76021-3-dongtai.guo@linux.dev>
In-Reply-To: <20260105105514.76021-3-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 10 Jan 2026 12:11:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ayU6xLbSVpTZhM9=TN19MpGZZkmi2eNXLHpEMWNQe0g@mail.gmail.com>
X-Gm-Features: AZwV_QgvXVlG2dEHaM6Q-5-F-Z-QisKLCfmGV2lUgN1sLsIVnO4WaOL5zbbzOb0
Message-ID: <CAAhV-H4ayU6xLbSVpTZhM9=TN19MpGZZkmi2eNXLHpEMWNQe0g@mail.gmail.com>
Subject: Re: [PATCH v9 loongarch-next 2/4] LoongArch: Add SCQ support detection
To: George Guo <dongtai.guo@linux.dev>
Cc: hengqi.chen@gmail.com, kernel@xen0n.name, lianyangyang@kylinos.cn, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, r@hev.cc, 
	xry111@xry111.site, George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, George,

On Mon, Jan 5, 2026 at 6:55=E2=80=AFPM George Guo <dongtai.guo@linux.dev> w=
rote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> Check CPUCFG2_SCQ bit to determine if the CPU supports
> SCQ instruction.
>
> Co-developed-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Signed-off-by: Yangyang Lian <lianyangyang@kylinos.cn>
> Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>
> Tested-by: Hengqi Chen <hengqi.chen@gmail.com>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cpu-features.h | 1 +
>  arch/loongarch/include/asm/cpu.h          | 2 ++
>  arch/loongarch/include/uapi/asm/hwcap.h   | 1 +
>  arch/loongarch/kernel/cpu-probe.c         | 4 ++++
>  arch/loongarch/kernel/proc.c              | 2 ++
>  5 files changed, 10 insertions(+)
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
> diff --git a/arch/loongarch/include/uapi/asm/hwcap.h b/arch/loongarch/inc=
lude/uapi/asm/hwcap.h
> index 2b34e56cfa9e..a3c570d407b9 100644
> --- a/arch/loongarch/include/uapi/asm/hwcap.h
> +++ b/arch/loongarch/include/uapi/asm/hwcap.h
> @@ -18,5 +18,6 @@
>  #define HWCAP_LOONGARCH_LBT_MIPS       (1 << 12)
>  #define HWCAP_LOONGARCH_PTW            (1 << 13)
>  #define HWCAP_LOONGARCH_LSPW           (1 << 14)
> +#define HWCAP_LOONGARCH_CPU_SCQ                (1 << 15)
>
>  #endif /* _UAPI_ASM_HWCAP_H */
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index 08a227034042..0051f2fcd3ec 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -205,6 +205,10 @@ static void cpu_probe_common(struct cpuinfo_loongarc=
h *c)
>                 c->options |=3D LOONGARCH_CPU_PTW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_PTW;
>         }
> +       if (config & CPUCFG2_SCQ) {
> +               c->options |=3D LOONGARCH_CPU_SCQ;
> +               elf_hwcap |=3D HWCAP_LOONGARCH_CPU_SCQ;
> +       }
>         if (config & CPUCFG2_LSPW) {
>                 c->options |=3D LOONGARCH_CPU_LSPW;
>                 elf_hwcap |=3D HWCAP_LOONGARCH_LSPW;
> diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
> index 1d646da010f9..1b9cc05d1f33 100644
> --- a/arch/loongarch/kernel/proc.c
> +++ b/arch/loongarch/kernel/proc.c
> @@ -90,6 +90,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                 seq_puts(m, " lbt_arm");
>         if (cpu_has_lbt_mips)
>                 seq_puts(m, " lbt_mips");
> +       if (cpu_has_scq)
> +               seq_puts(m, " scq");
Please move this lines to be after "lam" since they are similar, so
does that in cpu-probe.c


Huacai

>         seq_puts(m, "\n");
>
>         seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_wat=
ch));
> --
> 2.43.0
>
