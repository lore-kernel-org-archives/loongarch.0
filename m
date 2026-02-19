Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E2148850
	for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771472678; cv=none; b=T3TYLa1H8tenTTThOBABDi9s5UXn8n9mMv1Uht57IO8rQyUTJub9JCVVmNCuN8Z1bd9NZqskurfGiA8fd6KdPnmXx01hjhNVGo1th1KeVnZpzBhlQbrkas/ZvmuNkCZrXab9cIhcYWg4+UNmEQNeVjONXPctegjZcIRfTHnBlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771472678; c=relaxed/simple;
	bh=yNO2tw3C8oBvyd4RypjP9XiqQ9nNXRWI7/xuiRxvYag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0ntc3nYUzqUcpHiKl5uSoOe3lR3UtD0pDBT3exKjmuG5kkmddRJrfPLsozzaYy9GLsRCFKp4QBustv362ijg2bqnLr+AsVG96oa90tfaGIQBNkWBbyyOrZyrwnmhiteJvJJG7o37VOMToyR3Dz1iXzdM6v0I1KbdRoDerh62n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g04Xl5pw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g04Xl5pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC091C4AF09
	for <loongarch@lists.linux.dev>; Thu, 19 Feb 2026 03:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771472677;
	bh=yNO2tw3C8oBvyd4RypjP9XiqQ9nNXRWI7/xuiRxvYag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g04Xl5pwPRdZkk8r3oxkg7BBeHaBKjR/iXJgXZ0Jpeo9cAijI1OLJSKQzuOBUcYEv
	 Q1En1WwQ1pyP4wSSw7sJ1zHynO18hX7rVvYUBs1PfjUuGwu3sUKzaAzxGsHY8Pp1bv
	 Dcq6F4NKuNJamrg+zZffNvrWPMWQlUPyNTriTJNKLIJB9q715cIzmpK8VuAD6ZkRKo
	 O3ouqCLGC0m2w3nsvSJs8DgpUJ6VuSlR4ZG+oqJzG67sVGyYodqRBSkwaMPGBRBnW9
	 YIjciz6rXbZwI6CCJb4+7fWPmZRBj2pfThOmTof6k5TKjY4cXHkR7s4HOJKL/IZPxs
	 ZeTtN1HquCIWQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65a431e305eso753050a12.0
        for <loongarch@lists.linux.dev>; Wed, 18 Feb 2026 19:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVud3gcWRxo/Rd3Px/qPGGV4kn+ZLCjljyPJXLjz+nTLeG1LjwswIs9X8Wr/psGzlqXaqqrnBwIOOM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm0j9ejeMJf/YbI7mvxt37lPiTfXJdsChRecJKL/nVzTmekOZB
	i7AJehM0xPi8DodTrlJJUxJEO3FFsp6UXF4FuIHOcRpRlml/WupKKdFGgUPUqDrQxnIO/CJBTtS
	ydcHC8fcn0VOH8AsPOIjN/Hp2SdyZNZw=
X-Received: by 2002:a05:6402:f16:b0:658:cc59:1624 with SMTP id
 4fb4d7f45d1cf-65bc78549bemr6581713a12.5.1771472676136; Wed, 18 Feb 2026
 19:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028065139.10227-1-youling.tang@linux.dev>
In-Reply-To: <20251028065139.10227-1-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Feb 2026 11:44:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6mQJ5RR4Oad9aOA2nbVa4BeFYfTHLTvdj=5dL56O7FTw@mail.gmail.com>
X-Gm-Features: AaiRm53tP1To4B0gkvVzXooN_0ptRk2jrg07EI9ng-ysViblAhIyKkBnj5k-BpA
Message-ID: <CAAhV-H6mQJ5RR4Oad9aOA2nbVa4BeFYfTHLTvdj=5dL56O7FTw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: jump_label: Batch icache maintenance
To: Youling Tang <youling.tang@linux.dev>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

First of all, it is better to split to two patches:
LoongArch: Add flush_icache_all()/local_flush_icache_all()
LoongArch: Batch icache maintenance for jump_label


On Tue, Oct 28, 2025 at 2:53=E2=80=AFPM Youling Tang <youling.tang@linux.de=
v> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> Switch to the batched version of the jump label update functions so
> instruction cache maintenance is deferred until the end of the update.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/include/asm/cacheflush.h | 16 +++++++++++++++-
>  arch/loongarch/include/asm/jump_label.h |  1 +
>  arch/loongarch/kernel/inst.c            |  6 +++---
>  arch/loongarch/kernel/jump_label.c      | 13 +++++++++++--
>  arch/loongarch/mm/cache.c               | 10 ----------
>  5 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/cacheflush.h b/arch/loongarch/inc=
lude/asm/cacheflush.h
> index f8754d08a31a..66c34c821ecb 100644
> --- a/arch/loongarch/include/asm/cacheflush.h
> +++ b/arch/loongarch/include/asm/cacheflush.h
> @@ -31,9 +31,23 @@ static inline unsigned int cpu_last_level_cache_line_s=
ize(void)
>         return boot_cpu_data.cache_leaves[cache_present - 1].linesz;
>  }
>
> +/*
> + * LoongArch maintains ICache/DCache coherency by hardware,
> + * we just need "ibar" to avoid instruction hazard here.
> + */
> +static inline void local_flush_icache_all(void)
> +{
> +       asm volatile ("\tibar 0\n"::);
> +}
> +
> +static inline void local_flush_icache_range(unsigned long start, unsigne=
d long end)
> +{
> +       local_flush_icache_all();
Just use a plain "asm volatile ("\tibar 0\n"::);", and put them after
__flush_cache_all().

Huacai

> +}
> +
>  asmlinkage void __flush_cache_all(void);
> -void local_flush_icache_range(unsigned long start, unsigned long end);
>
> +#define flush_icache_all       local_flush_icache_all
>  #define flush_icache_range     local_flush_icache_range
>  #define flush_icache_user_range        local_flush_icache_range
>
> diff --git a/arch/loongarch/include/asm/jump_label.h b/arch/loongarch/inc=
lude/asm/jump_label.h
> index 4000c7603d8e..d0689032fd9d 100644
> --- a/arch/loongarch/include/asm/jump_label.h
> +++ b/arch/loongarch/include/asm/jump_label.h
> @@ -11,6 +11,7 @@
>
>  #include <linux/types.h>
>
> +#define HAVE_JUMP_LABEL_BATCH
>  #define JUMP_LABEL_NOP_SIZE    4
>
>  /* This macro is also expanded on the Rust side. */
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index bf037f0c6b26..65c1b74d677a 100644
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
> diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
> index 6be04d36ca07..966b8d2b04ad 100644
> --- a/arch/loongarch/mm/cache.c
> +++ b/arch/loongarch/mm/cache.c
> @@ -31,16 +31,6 @@ void cache_error_setup(void)
>         set_merr_handler(0x0, &except_vec_cex, 0x80);
>  }
>
> -/*
> - * LoongArch maintains ICache/DCache coherency by hardware,
> - * we just need "ibar" to avoid instruction hazard here.
> - */
> -void local_flush_icache_range(unsigned long start, unsigned long end)
> -{
> -       asm volatile ("\tibar 0\n"::);
> -}
> -EXPORT_SYMBOL(local_flush_icache_range);
> -
>  static void flush_cache_leaf(unsigned int leaf)
>  {
>         int i, j, nr_nodes;
> --
> 2.43.0
>
