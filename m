Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39B33D3
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 14:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D55C433C1
	for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666623198;
	bh=Op3D3///tVzleIUYThszLuarmymj6iMUCTftDQ95ODU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UyazStzlWaDYrcdLeSIDn24c9OtWVlevIum1UPV1Z8WuvoTqBUN+i3JjUfjrAME2p
	 xoFGqR6n5H4NUSa8g/6CauK0pUA6Ie5uKuY42dEka96p4qSKZQHLQwUjA3FlFMHfKa
	 5zTm1vsAWCNMNGoCtkki+fpnh2OWTimldAigWEcNCDG031TCxOtAzy5IuOwDTvTX8B
	 TeOBIqJC1pvOJycPNGQEP018EkD+aGn7NPJBQLeB2ooC5YnnpeyZiPRY9m6zWkBRbg
	 UrsUArLOo/kKGPKP7zc7y6IdwtKF5UjBBN/byVfAYidDvCewo41YkbZ2Gkig2FHFlV
	 rA0GZKCKzG5FA==
Received: by mail-ej1-f47.google.com with SMTP id fy4so5606622ejc.5
        for <loongarch@lists.linux.dev>; Mon, 24 Oct 2022 07:53:18 -0700 (PDT)
X-Gm-Message-State: ACrzQf1+5G5mcUEfouknQ2ryE8/4Lvb6Od25sdUthdA4dfYmhfXS5ri7
	Mggo/GrYapaSsMHsqkTulJNDRYZ53jEp6TaCW1M=
X-Google-Smtp-Source: AMsMyM6bxF8MxeSwl/qKALAwffAga8E/lRIJxyfXFixKkkldUsI6o7iacwk8qflKVpHg6U7vSflCCZXSLwk+UzCY0QA=
X-Received: by 2002:a17:907:a072:b0:7ab:23e9:bc1 with SMTP id
 ia18-20020a170907a07200b007ab23e90bc1mr927288ejc.72.1666623196476; Mon, 24
 Oct 2022 07:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024121305.381776-1-kernel@xen0n.name> <20221024121305.381776-2-kernel@xen0n.name>
In-Reply-To: <20221024121305.381776-2-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 24 Oct 2022 22:53:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7io32r6Lh9sBuqeoZ5qdTasQBvUnCKESvzSiiUMoT1OA@mail.gmail.com>
Message-ID: <CAAhV-H7io32r6Lh9sBuqeoZ5qdTasQBvUnCKESvzSiiUMoT1OA@mail.gmail.com>
Subject: Re: [PATCH 01/13] LoongArch: Unify CSR.EUEN and CSR.ECFG bitfield
 names with the ISA manual
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 8:13 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> The current field names of CSR.EUEN and CSR.ECFG are not consistent with
> the LoongArch ISA manual v1.02, and seems to be leftover from an earlier
> time. Change to the ISA manual names.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/include/asm/fpu.h       | 10 +++++-----
>  arch/loongarch/include/asm/loongarch.h | 22 +++++++++++-----------
>  arch/loongarch/kernel/fpu.S            |  2 +-
>  arch/loongarch/kernel/process.c        |  2 +-
>  4 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
> index 358b254d9c1d..a5015b6536bc 100644
> --- a/arch/loongarch/include/asm/fpu.h
> +++ b/arch/loongarch/include/asm/fpu.h
> @@ -37,13 +37,13 @@ static inline unsigned long mask_fcsr_x(unsigned long fcsr)
>
>  static inline int is_fp_enabled(void)
>  {
> -       return (csr_read32(LOONGARCH_CSR_EUEN) & CSR_EUEN_FPEN) ?
> +       return (csr_read32(LOONGARCH_CSR_EUEN) & CSR_EUEN_FPE) ?
>                 1 : 0;
>  }
>
> -#define enable_fpu()           set_csr_euen(CSR_EUEN_FPEN)
> +#define enable_fpu()           set_csr_euen(CSR_EUEN_FPE)
I don't think code should be exactly the same as manual, especially
FPE may be misunderstood as "FP Exception".

Huacai

>
> -#define disable_fpu()          clear_csr_euen(CSR_EUEN_FPEN)
> +#define disable_fpu()          clear_csr_euen(CSR_EUEN_FPE)
>
>  #define clear_fpu_owner()      clear_thread_flag(TIF_USEDFPU)
>
> @@ -56,7 +56,7 @@ static inline void __own_fpu(void)
>  {
>         enable_fpu();
>         set_thread_flag(TIF_USEDFPU);
> -       KSTK_EUEN(current) |= CSR_EUEN_FPEN;
> +       KSTK_EUEN(current) |= CSR_EUEN_FPE;
>  }
>
>  static inline void own_fpu_inatomic(int restore)
> @@ -83,7 +83,7 @@ static inline void lose_fpu_inatomic(int save, struct task_struct *tsk)
>                 disable_fpu();
>                 clear_tsk_thread_flag(tsk, TIF_USEDFPU);
>         }
> -       KSTK_EUEN(tsk) &= ~(CSR_EUEN_FPEN | CSR_EUEN_LSXEN | CSR_EUEN_LASXEN);
> +       KSTK_EUEN(tsk) &= ~(CSR_EUEN_FPE | CSR_EUEN_SXE | CSR_EUEN_ASXE);
>  }
>
>  static inline void lose_fpu(int save)
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
> index 7f8d57a61c8b..534352d6ed18 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -295,14 +295,14 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
>  #define  CSR_PRMD_PPLV                 (_ULCAST_(0x3) << CSR_PRMD_PPLV_SHIFT)
>
>  #define LOONGARCH_CSR_EUEN             0x2     /* Extended unit enable */
> -#define  CSR_EUEN_LBTEN_SHIFT          3
> -#define  CSR_EUEN_LBTEN                        (_ULCAST_(0x1) << CSR_EUEN_LBTEN_SHIFT)
> -#define  CSR_EUEN_LASXEN_SHIFT         2
> -#define  CSR_EUEN_LASXEN               (_ULCAST_(0x1) << CSR_EUEN_LASXEN_SHIFT)
> -#define  CSR_EUEN_LSXEN_SHIFT          1
> -#define  CSR_EUEN_LSXEN                        (_ULCAST_(0x1) << CSR_EUEN_LSXEN_SHIFT)
> -#define  CSR_EUEN_FPEN_SHIFT           0
> -#define  CSR_EUEN_FPEN                 (_ULCAST_(0x1) << CSR_EUEN_FPEN_SHIFT)
> +#define  CSR_EUEN_BTE_SHIFT            3
> +#define  CSR_EUEN_BTE                  (_ULCAST_(0x1) << CSR_EUEN_BTE_SHIFT)
> +#define  CSR_EUEN_ASXE_SHIFT           2
> +#define  CSR_EUEN_ASXE                 (_ULCAST_(0x1) << CSR_EUEN_ASXE_SHIFT)
> +#define  CSR_EUEN_SXE_SHIFT            1
> +#define  CSR_EUEN_SXE                  (_ULCAST_(0x1) << CSR_EUEN_SXE_SHIFT)
> +#define  CSR_EUEN_FPE_SHIFT            0
> +#define  CSR_EUEN_FPE                  (_ULCAST_(0x1) << CSR_EUEN_FPE_SHIFT)
>
>  #define LOONGARCH_CSR_MISC             0x3     /* Misc config */
>
> @@ -310,9 +310,9 @@ static __always_inline void iocsr_write64(u64 val, u32 reg)
>  #define  CSR_ECFG_VS_SHIFT             16
>  #define  CSR_ECFG_VS_WIDTH             3
>  #define  CSR_ECFG_VS                   (_ULCAST_(0x7) << CSR_ECFG_VS_SHIFT)
> -#define  CSR_ECFG_IM_SHIFT             0
> -#define  CSR_ECFG_IM_WIDTH             13
> -#define  CSR_ECFG_IM                   (_ULCAST_(0x1fff) << CSR_ECFG_IM_SHIFT)
> +#define  CSR_ECFG_LIE_SHIFT            0
> +#define  CSR_ECFG_LIE_WIDTH            13
> +#define  CSR_ECFG_LIE                  (_ULCAST_(0x1fff) << CSR_ECFG_LIE_SHIFT)
>
>  #define LOONGARCH_CSR_ESTAT            0x5     /* Exception status */
>  #define  CSR_ESTAT_ESUBCODE_SHIFT      22
> diff --git a/arch/loongarch/kernel/fpu.S b/arch/loongarch/kernel/fpu.S
> index ccde94140c89..7b1691f67509 100644
> --- a/arch/loongarch/kernel/fpu.S
> +++ b/arch/loongarch/kernel/fpu.S
> @@ -175,7 +175,7 @@ SYM_FUNC_END(_restore_fp)
>   */
>
>  SYM_FUNC_START(_init_fpu)
> -       li.w    t1, CSR_EUEN_FPEN
> +       li.w    t1, CSR_EUEN_FPE
>         csrxchg t1, t1, LOONGARCH_CSR_EUEN
>
>         movgr2fcsr      fcsr0, a0
> diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
> index 1256e3582475..b88a5864e03d 100644
> --- a/arch/loongarch/kernel/process.c
> +++ b/arch/loongarch/kernel/process.c
> @@ -79,7 +79,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
>         prmd |= PLV_USER;
>         regs->csr_prmd = prmd;
>
> -       euen = regs->csr_euen & ~(CSR_EUEN_FPEN);
> +       euen = regs->csr_euen & ~(CSR_EUEN_FPE);
>         regs->csr_euen = euen;
>         lose_fpu(0);
>
> --
> 2.38.0
>
>
