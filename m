Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B832F757
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962642; cv=none; b=OCaYUj87FPhdzZ/vUrhvuc70A1tZ7NN1i+t/Wt1/NtbXOvLAsnRfKvbhhSqwOAUhWG35aDNBPQRSQrUIvG/UjBsnTguF0mDSbzvItqsrQI+Fy8uD6J5WHv6AAzeWUOtjD+4/gvXfKQAzV7FAL/w8HbOfD0YFaxpbIAeCd7xtt0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962642; c=relaxed/simple;
	bh=qFgwpMGn5KGW4K1W2EwQVot07f2MKB7VipDsoWk3W38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3zzPLfM+NlYwetJwyq214Xgz2BLp75lFRFwTa5NyygUjAANMhGca1dZuMa9ahwslnRx5L+u4Ctvxy5oDyA6NKi+SjbeaEcqwwBpr8hnbfAIJWnnftooKs9VtQw7sp02azn7neqk1jk89H2R0zUvwgDXYZcU1jJ6byCbdKxGYz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WyWa221t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WyWa221t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DF8C2BC87
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 02:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962640;
	bh=qFgwpMGn5KGW4K1W2EwQVot07f2MKB7VipDsoWk3W38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WyWa221t+H9HiIM1NbyRMHPXpwzL2EwwL988jQQcFo3NINiiPpMBV2J+ALCZKA6KS
	 bD/aqlBqjbKKjWlM7Jz1PocVt3eoP0W37OefZeDlsjSLbHF4fgHATxy5dzPhpzfWf0
	 CJ1WQjfgqfiyQNZT3h2KelXVp4OXDEetgMHsFs0TvTUqRmtzNcsB4evb1ksJzfWvrP
	 es/4CivRQVpwurHFNinORDBrVrNnU/aEjYby0uc1er7opIBEWsKVk895rduvvUrW86
	 Wa+6e8A/q2SdIwa58zFM7/zDqqFI/IsTl2REz1EKh/zNeAyJ+/218O8rm7xc7p5GJK
	 ySq15FfSmLYaw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b870732cce2so924863366b.3
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 18:30:40 -0800 (PST)
X-Gm-Message-State: AOJu0YzNcsBei2NBKbPeanLwpIZDyK0oRjLcbPAzCO3hKWfJEp9ZiskK
	30lFxZ7foz3UUnx+B2MHEnBvRioJ+L9a3dH1eveB/mVtrYU7xcLmg6bD1ZpYvtbTxkHPir9AWwc
	cLEjVBb6beJf35JWWn14aaXTdaKGXyqA=
X-Received: by 2002:a17:907:6ea6:b0:b76:6020:ed2b with SMTP id
 a640c23a62f3a-b8796b3f9b1mr1495356266b.45.1768962639382; Tue, 20 Jan 2026
 18:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120092331.813-1-yangtiezhu@loongson.cn> <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
 <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn> <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
 <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn> <0059c5f2-afe3-3100-4f9e-023ddf5c1fe9@loongson.cn>
In-Reply-To: <0059c5f2-afe3-3100-4f9e-023ddf5c1fe9@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 21 Jan 2026 10:30:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4iJ=FJHHbX4BGqCb5MViwA7Tcz1jbh0pKywz5T48XHXg@mail.gmail.com>
X-Gm-Features: AZwV_QiUDOOhuwE1mj6-3BWZyh6ZJTzhBfhsS8WSRaFWrWkcPk7qQiPwzjN1DeQ
Message-ID: <CAAhV-H4iJ=FJHHbX4BGqCb5MViwA7Tcz1jbh0pKywz5T48XHXg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in bt_address()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 9:47=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/20 =E4=B8=8B=E5=8D=889:08, Tiezhu Yang wrote:
> > On 2026/1/20 =E4=B8=8B=E5=8D=889:01, Huacai Chen wrote:
> >> On Tue, Jan 20, 2026 at 8:57=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongs=
on.cn>
> >> wrote:
> >>>
> >>> On 2026/1/20 =E4=B8=8B=E5=8D=888:04, Huacai Chen wrote:
> >>>> Hi, Tiezhu,
> >>>>
> >>>> On Tue, Jan 20, 2026 at 5:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loon=
gson.cn>
> >>>> wrote:
> >>>>>
> >>>>> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks fo=
r
> >>>>> ORC unwinder"), the system can not boot normally under some configs=
,
> >>>>> there are many error messages "cannot find unwind pc at".
> >>>
> >>> ...
> >>>
> >>>>> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> >>>>> +       for (int cpu =3D 1; cpu < num_possible_cpus(); cpu++) {
> >>>> Use nr_cpu_ids instead of num_possible_cpus() can improve
> >>>> performance a little.
> >>>>
> >>>>> +               int vec_sz =3D sizeof(exception_handlers);
> >>>>> +
> >>>> It is better to add "if (!pcpu_handlers[cpu]) continue" here.
> >>>
> >>> If so, it can use for_each_possible_cpu(cpu) directly?
> >> It can, but I remember you want to skip CPU 0?
> >
> > Yes, that is the intention to use the for loop, but if checking
> > !pcpu_handlers[cpu], I think no need to use for loop to skip cpu
> > 0, just use for_each_possible_cpu(cpu) is more simple and direct.
>
> Handle this special case only if bt_address() returns 0 to avoid
> affecting performance for the normal address.
It is a little more complex than V1, since unwinder is not
performance-critical, I prefer the V1 logic.

Huacai

>
> Here is the draft change:
>
> ----->8-----
> diff --git a/arch/loongarch/kernel/unwind_orc.c
> b/arch/loongarch/kernel/unwind_orc.c
> index d6b3688a1ce9..1ce10701f3c3 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -378,6 +378,28 @@ static inline unsigned long bt_address(unsigned
> long ra)
>          return 0;
>   }
>
> +static inline unsigned long handle_pcpu_handlers(unsigned long ra)
> +{
> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
> +       int cpu;
> +       int vec_sz __maybe_unused;
> +
> +       for_each_possible_cpu(cpu) {
> +               if (!pcpu_handlers[cpu])
> +                       continue;
> +
> +               vec_sz =3D sizeof(exception_handlers);
> +
> +               if (ra >=3D pcpu_handlers[cpu] &&
> +                   ra < pcpu_handlers[cpu] + vec_sz) {
> +                       ra =3D eentry + (ra - pcpu_handlers[cpu]);
> +                       break;
> +               }
> +       }
> +#endif
> +       return ra;
> +}
> +
>   bool unwind_next_frame(struct unwind_state *state)
>   {
>          unsigned long *p, pc;
> @@ -494,8 +516,11 @@ bool unwind_next_frame(struct unwind_state *state)
>
>          state->pc =3D bt_address(pc);
>          if (!state->pc) {
> -               pr_err("cannot find unwind pc at %px\n", (void *)pc);
> -               goto err;
> +               state->pc =3D bt_address(handle_pcpu_handlers(pc));
> +               if (!state->pc) {
> +                       pr_err("cannot find unwind pc at %px\n", (void
> *)pc);
> +                       goto err;
> +               }
>          }
>
>          return true;
>
> I will test it, if it works well I will wait for more comments and
> submit v2 later.
>
> Thanks,
> Tiezhu
>
