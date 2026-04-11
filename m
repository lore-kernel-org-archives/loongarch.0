Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C0227B94
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913209; cv=none; b=aOu1GyDpygL649irLXrYzDcrCV32ZUjrBHLph6ApINPjHikpvppVZZnEo3iH+sPffyxAHPSOZReP0azADHJaUg+uvCluYtciPqJpzPuDwbSm8m0IIK8Adcc1l970GS7duz7syjO9bAAyqfSO8drTpQnj+q4aog8UE8hDS9RxVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913209; c=relaxed/simple;
	bh=H8VuBO+HG/iGA4wsaIQy1MBs8loB+Vt1sbTgGYgDjNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBj3qEL3IxuSwvZIfJ5Bwb0Vfn54dI4UVMwOHxovNY2AwBo6832+ruqn0//lfWRE/CakrA558mcc27Wo5ywhWz6A+SZnraz/KogAyz7O+TqUiYiS/kI8J4eFWjbf+yQayVk51HJNfI5aehCp7pfPKNhWzYsZ64WyYo1Av1rfTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ia+YZdG3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ia+YZdG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D114AC116C6
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913206;
	bh=H8VuBO+HG/iGA4wsaIQy1MBs8loB+Vt1sbTgGYgDjNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ia+YZdG3ppbjRO9Ec1G6DOHzWQ5KxXycjsoU/iNi4ESZw6uKzwvF73Tt+cwQAVX1o
	 24O3y0Hod8X6myaFD1qRBCoVMluP8Utu3I8L0T9BAQeqHLg89Sfgpsy/8rAFVUXCrS
	 49pSQPyCMzH1XOo1zPs3L01erSMB0kAIQvEZxaWgxLffozth141clObC513RYzaBNc
	 EjXOt0eSE8goIQdrfL1ZpsVQu+XK7wjOFhKGXPhokdXcjroE0bbBf1IrZabeHeZBL6
	 MQgtclpqic2Qb60H3W4itCVe80bvVFWHpnbEObQm0n+22RR8VYTEru0Ci+Sj/HS0wU
	 ZcSHlxkT/rGsQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so399741866b.1
        for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 06:13:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXj4AEoUYim11WCfwXm/2lXRHj0PxJtkuCbg1k4Er8guLkPRsrkGsy4i+bqQz/q1XTni73S2QFJAok=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0mL6TUsPr+qZwgbRjrT0MS/2w1hJXBqehbirgUGFKppnVKQZK
	wdRGbGgrtcxLFO1BDqw/IrzivAaWRr0RppagyyWtU3HHorNi8ErKzfrRuaIXoDeh30qZmbnDWRd
	BaLljWdn18ioxTQtljSqSPuBeyMskGH4=
X-Received: by 2002:a17:907:3d0f:b0:b98:2c44:6631 with SMTP id
 a640c23a62f3a-b9d7248a89dmr375887966b.14.1775913205388; Sat, 11 Apr 2026
 06:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405021227.532599-1-youling.tang@linux.dev> <20260405021227.532599-2-youling.tang@linux.dev>
In-Reply-To: <20260405021227.532599-2-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Apr 2026 21:13:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Y6HJ11z1vT2a6eseKzbV-6Fs_DzxjBzqPCpsy_OxRxQ@mail.gmail.com>
X-Gm-Features: AQROBzAxyUJXMdYZLLRdloSZ6XeQU9UvztWwQE1gZvii9VdWPnE7RLvrUQBchKA
Message-ID: <CAAhV-H6Y6HJ11z1vT2a6eseKzbV-6Fs_DzxjBzqPCpsy_OxRxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] LoongArch: Batch icache maintenance for jump_label
To: Youling Tang <youling.tang@linux.dev>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Sun, Apr 5, 2026 at 10:13=E2=80=AFAM Youling Tang <youling.tang@linux.de=
v> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> Switch to the batched version of the jump label update functions so
> instruction cache maintenance is deferred until the end of the update.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/include/asm/jump_label.h |  1 +
>  arch/loongarch/kernel/inst.c            |  6 +++---
>  arch/loongarch/kernel/jump_label.c      | 13 +++++++++++--
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/inc=
lude/asm/jump_label.h
> index dcaecf69ea5a..ceb3dfa66188 100644
> --- a/arch/loongarch/include/asm/jump_label.h
> +++ b/arch/loongarch/include/asm/jump_label.h
> @@ -13,6 +13,7 @@
>  #include <linux/stringify.h>
>  #include <asm/asm.h>
>
> +#define HAVE_JUMP_LABEL_BATCH
>  #define JUMP_LABEL_NOP_SIZE    4
>
>  #ifdef CONFIG_32BIT
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 1a728082944c..0b9228b7c13a 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -209,6 +209,9 @@ int larch_insn_write(void *addr, u32 insn)
>         int ret;
>         unsigned long flags =3D 0;
>
> +       if ((unsigned long)addr & 3)
> +               return -EINVAL;
> +
>         raw_spin_lock_irqsave(&patch_lock, flags);
>         ret =3D copy_to_kernel_nofault(addr, &insn, LOONGARCH_INSN_SIZE);
>         raw_spin_unlock_irqrestore(&patch_lock, flags);
> @@ -221,9 +224,6 @@ int larch_insn_patch_text(void *addr, u32 insn)
>         int ret;
>         u32 *tp =3D addr;
>
> -       if ((unsigned long)tp & 3)
> -               return -EINVAL;
> -
>         ret =3D larch_insn_write(tp, insn);
>         if (!ret)
>                 flush_icache_range((unsigned long)tp,
> diff --git a/arch/loongarch/kernel/jump_label.c b/arch/loongarch/kernel/j=
ump_label.c
> index 31891214b767..f5a394bdb5f3 100644
> --- a/arch/loongarch/kernel/jump_label.c
> +++ b/arch/loongarch/kernel/jump_label.c
> @@ -6,9 +6,11 @@
>   */
>  #include <linux/kernel.h>
>  #include <linux/jump_label.h>
> +#include <asm/cacheflush.h>
>  #include <asm/inst.h>
>
> -void arch_jump_label_transform(struct jump_entry *entry, enum jump_label=
_type type)
> +bool arch_jump_label_transform_queue(struct jump_entry *entry,
> +                                    enum jump_label_type type)
>  {
>         u32 insn;
>         void *addr =3D (void *)jump_entry_code(entry);
> @@ -18,5 +20,12 @@ void arch_jump_label_transform(struct jump_entry *entr=
y, enum jump_label_type ty
>         else
>                 insn =3D larch_insn_gen_nop();
>
> -       larch_insn_patch_text(addr, insn);
> +       larch_insn_write(addr, insn);
> +
> +       return true;
> +}
> +
> +void arch_jump_label_transform_apply(void)
> +{
> +       flush_icache_all();
>  }
> --
> 2.43.0
>
