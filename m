Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218587B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 07:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE057C4339B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682407976;
	bh=0VhWa//Z4bwNhYJc1uiInKzm/3SRh2H929nlKF3D880=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mY4nUhHF/R4dTuLca0ycrGo39ZjgaNXYw4yw8jeL1qbolwcA+Tuthd2CZshqQcuXt
	 SJ9oXMmg/HOAS5vKcoqeQ42WhXkM0obgNcTEXfdXS5Q8upM19sTTMB1DbbLKU1OJ01
	 1RX771PUg+/G9NFtf76kxK2qHZJu3k3OBiyQBDhWEufc3HaKGp6BPsZYUr+cfqcnNJ
	 XZ8UTvAP6Lda9jq9/8AtX9mdXVPhlofuKHNvjqqvbvqOKGjcJVkRYMXZ52IN8irzqZ
	 gmKFMOnc4RVkk7bPVFBORQqBFJXVta25xDySxtPgSmqSdzjvxrPZNiS77GKIr+5WNS
	 breoSjPYSB+Kw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so40449183a12.1
        for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 00:32:56 -0700 (PDT)
X-Gm-Message-State: AAQBX9e8NAQJDsYBb6KhiffjxGTfsVzOvsyYtkhzFOzliea2NJ7nqm9X
	4Iu0Z9Toj78T+mxrrq/CYgXjNEqOWw0PJxpolBE=
X-Google-Smtp-Source: AKy350ZAk4jvdeJup7TUD94/ZT0MC5UIzlXBrluGzAEbaiZ3INefHaxNGjF2QsbSTwbFVzECK6Xg9EEOYb1J0bK9Wl8=
X-Received: by 2002:a05:6402:520b:b0:506:771a:60d6 with SMTP id
 s11-20020a056402520b00b00506771a60d6mr19990546edd.1.1682407974806; Tue, 25
 Apr 2023 00:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230422173455.3354690-1-kernel@xen0n.name> <20230422173455.3354690-2-kernel@xen0n.name>
In-Reply-To: <20230422173455.3354690-2-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Apr 2023 15:32:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H75h22VyOFh=29qhFWZt5E6OKDykifYjW=S3FccemYoLQ@mail.gmail.com>
Message-ID: <CAAhV-H75h22VyOFh=29qhFWZt5E6OKDykifYjW=S3FccemYoLQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/13] LoongArch: Clean up the architectural interrupt definitions
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 23, 2023 at 1:35=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> While interrupts are assigned ECodes `64 + interrupt number`, all
> existing use sites of interrupt numbers want the 64 subtracted.
> Re-arrange the definitions so that the actual interrupt number is used
> everywhere, and make EXCCODE_INT_END inclusive as it is more intuitive
> that way.
>
> While at it, according to the asm/loongarch.h definitions, the total
> number of architectural interrupts should be 14 instead of 13. Relevant
> bitfields and masks have been adjusted as well.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/include/asm/loongarch.h | 47 ++++++++++++++------------
>  arch/loongarch/kernel/irq.c            |  2 +-
>  arch/loongarch/kernel/perf_event.c     |  2 +-
>  arch/loongarch/kernel/time.c           |  2 +-
>  arch/loongarch/kernel/traps.c          |  2 +-
>  5 files changed, 29 insertions(+), 26 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index 83da5d29e2d1..7d8b83dd32e9 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -311,8 +311,8 @@ static __always_inline void iocsr_write64(u64 val, u3=
2 reg)
>  #define  CSR_ECFG_VS_WIDTH             3
>  #define  CSR_ECFG_VS                   (_ULCAST_(0x7) << CSR_ECFG_VS_SHI=
FT)
>  #define  CSR_ECFG_IM_SHIFT             0
> -#define  CSR_ECFG_IM_WIDTH             13
> -#define  CSR_ECFG_IM                   (_ULCAST_(0x1fff) << CSR_ECFG_IM_=
SHIFT)
> +#define  CSR_ECFG_IM_WIDTH             14
> +#define  CSR_ECFG_IM                   (_ULCAST_(0x3fff) << CSR_ECFG_IM_=
SHIFT)
>
>  #define LOONGARCH_CSR_ESTAT            0x5     /* Exception status */
>  #define  CSR_ESTAT_ESUBCODE_SHIFT      22
> @@ -322,8 +322,8 @@ static __always_inline void iocsr_write64(u64 val, u3=
2 reg)
>  #define  CSR_ESTAT_EXC_WIDTH           6
>  #define  CSR_ESTAT_EXC                 (_ULCAST_(0x3f) << CSR_ESTAT_EXC_=
SHIFT)
>  #define  CSR_ESTAT_IS_SHIFT            0
> -#define  CSR_ESTAT_IS_WIDTH            15
> -#define  CSR_ESTAT_IS                  (_ULCAST_(0x7fff) << CSR_ESTAT_IS=
_SHIFT)
> +#define  CSR_ESTAT_IS_WIDTH            14
> +#define  CSR_ESTAT_IS                  (_ULCAST_(0x3fff) << CSR_ESTAT_IS=
_SHIFT)
>
>  #define LOONGARCH_CSR_ERA              0x6     /* ERA */
>
> @@ -1090,7 +1090,7 @@ static __always_inline void iocsr_write64(u64 val, =
u32 reg)
>  #define ECFGF_IPI              (_ULCAST_(1) << ECFGB_IPI)
>  #define ECFGF(hwirq)           (_ULCAST_(1) << hwirq)
>
> -#define ESTATF_IP              0x00001fff
> +#define ESTATF_IP              0x00003fff
>
>  #define LOONGARCH_IOCSR_FEATURES       0x8
>  #define  IOCSRF_TEMP                   BIT_ULL(0)
> @@ -1418,23 +1418,26 @@ __BUILD_CSR_OP(tlbidx)
>         #define EXCSUBCODE_GCHC         1       /* Hardware caused */
>  #define EXCCODE_SE             25      /* Security */
>
> -#define EXCCODE_INT_START   64
> -#define EXCCODE_SIP0        64
> -#define EXCCODE_SIP1        65
> -#define EXCCODE_IP0         66
> -#define EXCCODE_IP1         67
> -#define EXCCODE_IP2         68
> -#define EXCCODE_IP3         69
> -#define EXCCODE_IP4         70
> -#define EXCCODE_IP5         71
> -#define EXCCODE_IP6         72
> -#define EXCCODE_IP7         73
> -#define EXCCODE_PMC         74 /* Performance Counter */
> -#define EXCCODE_TIMER       75
> -#define EXCCODE_IPI         76
> -#define EXCCODE_NMI         77
> -#define EXCCODE_INT_END     78
> -#define EXCCODE_INT_NUM            (EXCCODE_INT_END - EXCCODE_INT_START)
> +/* Interrupt numbers */
> +#define INT_SWI0       0       /* Software Interrupts */
> +#define INT_SWI1       1
> +#define INT_HWI0       2       /* Hardware Interrupts */
> +#define INT_HWI1       3
> +#define INT_HWI2       4
> +#define INT_HWI3       5
> +#define INT_HWI4       6
> +#define INT_HWI5       7
> +#define INT_HWI6       8
> +#define INT_HWI7       9
> +#define INT_PCOV       10      /* Performance Counter Overflow */
> +#define INT_TI         11      /* Timer */
> +#define INT_IPI                12
> +#define INT_NMI                13
> +
> +/* ExcCodes corresponding to interrupts */
> +#define EXCCODE_INT_NUM                (INT_NMI + 1)
> +#define EXCCODE_INT_START      64
> +#define EXCCODE_INT_END                (EXCCODE_INT_START + EXCCODE_INT_=
NUM - 1)
>
>  /* FPU register names */
>  #define LOONGARCH_FCSR0        $r0
> diff --git a/arch/loongarch/kernel/irq.c b/arch/loongarch/kernel/irq.c
> index 0524bf1169b7..883e5066ae44 100644
> --- a/arch/loongarch/kernel/irq.c
> +++ b/arch/loongarch/kernel/irq.c
> @@ -92,7 +92,7 @@ static int __init get_ipi_irq(void)
>         struct irq_domain *d =3D irq_find_matching_fwnode(cpuintc_handle,=
 DOMAIN_BUS_ANY);
>
>         if (d)
> -               return irq_create_mapping(d, EXCCODE_IPI - EXCCODE_INT_ST=
ART);
> +               return irq_create_mapping(d, INT_IPI);
>
>         return -EINVAL;
>  }
> diff --git a/arch/loongarch/kernel/perf_event.c b/arch/loongarch/kernel/p=
erf_event.c
> index 707bd32e5c4f..ff28f99b47d7 100644
> --- a/arch/loongarch/kernel/perf_event.c
> +++ b/arch/loongarch/kernel/perf_event.c
> @@ -461,7 +461,7 @@ static int get_pmc_irq(void)
>         struct irq_domain *d =3D irq_find_matching_fwnode(cpuintc_handle,=
 DOMAIN_BUS_ANY);
>
>         if (d)
> -               return irq_create_mapping(d, EXCCODE_PMC - EXCCODE_INT_ST=
ART);
> +               return irq_create_mapping(d, INT_PCOV);
>
>         return -EINVAL;
>  }
> diff --git a/arch/loongarch/kernel/time.c b/arch/loongarch/kernel/time.c
> index 4351f69d9950..f377e50f3c66 100644
> --- a/arch/loongarch/kernel/time.c
> +++ b/arch/loongarch/kernel/time.c
> @@ -133,7 +133,7 @@ static int get_timer_irq(void)
>         struct irq_domain *d =3D irq_find_matching_fwnode(cpuintc_handle,=
 DOMAIN_BUS_ANY);
>
>         if (d)
> -               return irq_create_mapping(d, EXCCODE_TIMER - EXCCODE_INT_=
START);
> +               return irq_create_mapping(d, INT_TI);
>
>         return -EINVAL;
>  }
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index de8ebe20b666..3fb4709c3b19 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -792,7 +792,7 @@ void __init trap_init(void)
>         long i;
>
>         /* Set interrupt vector handler */
> -       for (i =3D EXCCODE_INT_START; i < EXCCODE_INT_END; i++)
> +       for (i =3D EXCCODE_INT_START; i <=3D EXCCODE_INT_END; i++)
>                 set_handler(i * VECSIZE, handle_vint, VECSIZE);
NMI doesn't use handle_vint(), so this part can be dropped.

Huacai
>
>         set_handler(EXCCODE_ADE * VECSIZE, handle_ade, VECSIZE);
> --
> 2.40.0
>
