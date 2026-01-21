Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47253126B2
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 02:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962428; cv=none; b=K4MzZrKC3sotM2Y8SwgfQ9qtuj7nRUM+LGKzvb9f2ckoenkaZ6IHyfKWNHLEQrTUSIgKkZACOPVoJalHWKHppsxtwSFaHKNbkDVWkPqM4V/81dWJzmwFiB87vcdK7bra3zYsO3d4atPLADDcPBMd1I7Z41HMFIhmE6CNFIgvvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962428; c=relaxed/simple;
	bh=JSZfvmprFeYEIEm5yVJHuhfn8k7ODQZp2i53CCMGx2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBZHtfm/CKS7XqgMd5xMfi/T8bT14NNausSJlhi0A91+UYkpuFNcrny24YvR4veF+xBTBuXZA27YLtJBFF/x3dytG6C2OIMVF76SzY67Xve58Y5jNeq3yfRajJ9DBoQNtJtk7CJGQ7WS0b+3yGIuC9o/IPcqSmSKhXQvOKLuA2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWpyaQSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWpyaQSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE91C19423
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 02:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962428;
	bh=JSZfvmprFeYEIEm5yVJHuhfn8k7ODQZp2i53CCMGx2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MWpyaQSm04380kFudeyk46GomDQL1nyKllfqbgbG/8H2nm/He/aiiv1CJQkjaRkdB
	 aRRogDHF9E8HaOPZoQiG5E11ZQYL/DxEcA2bEbN4/HYriU/TZeHWoWuyx3RAnpAda3
	 tmmzFJC7o9EAFNHwAcKuPnlRQwXzgA+naIvAO452Z7SHTITHM67sfcFbyIi8TZGz5U
	 uN+QIVv6fDFmfY1LLsEG7rigsjX0WObznWcorqScnPNb0XKHbHzfbw3aeozk7Pq/CD
	 GOfy4HWXFVf54oMRq8IBXD3S7bL08PFjxT4/2Q/2aj3H4HGhqcMYqNvkN+HyWq3EHX
	 N8OmbBEYCAxow==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b87003e998bso80114266b.1
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 18:27:08 -0800 (PST)
X-Gm-Message-State: AOJu0YzOb01wkA1NhMBvrvJBveVtz1Lp7Vn+Q8B4BInOUiPDgW39hz19
	TzS9boQktbOEWayw275zXGePvfDvVz/8NUtbvwBEAqdoyj2lJDNd4aY1zJCbLv1ZvOJHJtwLwni
	GHUzK6a2gi4HR3jaZ6YZYD9XTNq6ek44=
X-Received: by 2002:a17:907:3e1b:b0:b80:40ea:1d65 with SMTP id
 a640c23a62f3a-b8793a69e79mr1635920366b.31.1768962426967; Tue, 20 Jan 2026
 18:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120092331.813-1-yangtiezhu@loongson.cn> <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
 <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn> <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
 <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn>
In-Reply-To: <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 21 Jan 2026 10:27:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H71vas03P=3YOCG-orp0NmxHG12A--bbGhHFcVcxeNMdg@mail.gmail.com>
X-Gm-Features: AZwV_QgvqW5VvX-b4xZNNtfckMt9XJrGivUTOD9gKuGp88dpRuD8aih5qh-aWqQ
Message-ID: <CAAhV-H71vas03P=3YOCG-orp0NmxHG12A--bbGhHFcVcxeNMdg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 9:09=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/20 =E4=B8=8B=E5=8D=889:01, Huacai Chen wrote:
> > On Tue, Jan 20, 2026 at 8:57=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> On 2026/1/20 =E4=B8=8B=E5=8D=888:04, Huacai Chen wrote:
> >>> Hi, Tiezhu,
> >>>
> >>> On Tue, Jan 20, 2026 at 5:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loong=
son.cn> wrote:
> >>>>
> >>>> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
> >>>> ORC unwinder"), the system can not boot normally under some configs,
> >>>> there are many error messages "cannot find unwind pc at".
> >>
> >> ...
> >>
> >>>> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> >>>> +       for (int cpu =3D 1; cpu < num_possible_cpus(); cpu++) {
> >>> Use nr_cpu_ids instead of num_possible_cpus() can improve performance=
 a little.
> >>>
> >>>> +               int vec_sz =3D sizeof(exception_handlers);
> >>>> +
> >>> It is better to add "if (!pcpu_handlers[cpu]) continue" here.
> >>
> >> If so, it can use for_each_possible_cpu(cpu) directly?
> > It can, but I remember you want to skip CPU 0?
>
> Yes, that is the intention to use the for loop, but if checking
> !pcpu_handlers[cpu], I think no need to use for loop to skip cpu
> 0, just use for_each_possible_cpu(cpu) is more simple and direct.
My original purpose, checking  !pcpu_handlers[cpu] is to handle the
memory allocation failure case, but not for skipping CPU 0.

But yes, it will skip CPU 0 indeed, so you can choose the original for
loop or for_each_possible_cpu(cpu), both OK for me.

>
> The code looks like:
>
> ----->8-----
> diff --git a/arch/loongarch/kernel/unwind_orc.c
> b/arch/loongarch/kernel/unwind_orc.c
> index d6b3688a1ce9..a0ba4e416f99 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -352,6 +352,24 @@ static inline unsigned long bt_address(unsigned
> long ra)
>   {
>          extern unsigned long eentry;
>
> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> +       int cpu;
> +       int vec_sz __maybe_unused;
 __maybe_unused is not needed because it is already in #ifdefs.

> +
> +       for_each_possible_cpu(cpu) {
> +               if (!pcpu_handlers[cpu])
> +                       continue;
> +
> +               vec_sz =3D sizeof(exception_handlers);
Calculate it when defining it.


Huacai

> +
> +               if (ra >=3D pcpu_handlers[cpu] &&
> +                   ra < pcpu_handlers[cpu] + vec_sz) {
> +                       ra =3D eentry + (ra - pcpu_handlers[cpu]);
> +                       break;
> +               }
> +       }
> +#endif
> +
>          if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) =
{
>                  unsigned long func;
>                  unsigned long type =3D (ra - eentry) / VECSIZE;
>
> Please let me know what is the better way.
>
> Thanks,
> Tiezhu
>
>
