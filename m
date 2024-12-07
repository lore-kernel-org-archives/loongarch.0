Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9685626
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733562724; cv=none; b=m35gTeFkNVG4jA93B8ea3QHYKUqzMfF/ACmsl5vq18u2rh1KG6iAvaM0RbWEVu4l83lu6sinEOptF8kas2X/vjVPR3k8VzC+25xzxg2FCvsiEC8dXlWzDWsn4ofQoUrSHoNzFEYZ44VT8YhlQRo2Fq/cefq4XiPlQ63tUlAJr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733562724; c=relaxed/simple;
	bh=QM3dO3IgDSl6o5lIGQCB9dg197jlldvwDAyQrKZYv3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAUMNRbtDLEXkdxpK4XhllycevFP11RWjEHKGIUbVsi2QE7+NPuCY1jQ4/SIPT8eh553PiLfC1mpnGZ3+ntQ2mG6xKsXtebNDIMVmct2G7jwZbXC+yzFQjw7Fs3P0ioCUkKmCcEts6FU1/J+VPTYJrz+wL+CnYOPo1CiZO46oEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTp28EWp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTp28EWp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D3C4CED2
	for <loongarch@lists.linux.dev>; Sat,  7 Dec 2024 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733562724;
	bh=QM3dO3IgDSl6o5lIGQCB9dg197jlldvwDAyQrKZYv3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bTp28EWpE3ExZK+5Xs2L1Q8q0swUp2wWFRjCQtBdrBj94IYxtRDULH5ph85ujsVPV
	 7YIPdR8xkHJG2kpedB0hF1nqWIhOzZaWWf6iYAuSFdWig8ELvuhp/6605tkYlN+7Gf
	 VhpkKJPhmDjL8JsBxUm9+zpVQPKdz+7eTcJqY1ye390h33yprz/alOYyzGR7jGZEDm
	 ueIzXJe+1P/5RxzBjMOZVbsB3X5hMNyrD97vy/kZDaaiqtnUkMHIkKjhuyw/xR1t0/
	 ScmsYOLyFNCzKmGblfJ8bKnG4YiQqTw2FleBqhrHDZS8jFKJFQHroAGdWlhsJ3F9zH
	 vPp6/k/dlg1cA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ec267b879so542745966b.2
        for <loongarch@lists.linux.dev>; Sat, 07 Dec 2024 01:12:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDdnQuOSNcJ3g1DSnbSmHjjo9TKVYdhTqpWpALdThFrmBXe00ADJiYTEtOEkRxA2u3oJmH5rYvFOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoGrCDEuFTlHWmla0CXxzd1Ha5SWGva1L7EhfWw4gGX+fwFRDP
	tipIrDiHL5zdkenN1rah95mRjVoo+tDV2lp+jDaPsSsM9zJjybfYsC41JZn8377BY8CQ/fKRUR9
	lwaZzt3LMiDeJ0y94Wyuk04SCwBk=
X-Google-Smtp-Source: AGHT+IEJGrBvG/ShGpCySY5o73rk2XwpV1WNmzYZCleJxbsf6ctE3q/pdaSVAnpSfuCOYx8WSVD6NwrST7GnTWOsFP0=
X-Received: by 2002:a17:907:2817:b0:aa4:e18e:1ca1 with SMTP id
 a640c23a62f3a-aa63a266bbbmr514126266b.60.1733562723240; Sat, 07 Dec 2024
 01:12:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241207033146.20938-1-zhangtianyang@loongson.cn>
In-Reply-To: <20241207033146.20938-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Dec 2024 17:11:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
Message-ID: <CAAhV-H4VAyD+=Btt9S6HrN6-sVQJqe1_jeLPS13UR1kxXJ8S5w@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongarch-avec:Add multi-nodes topology support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, tglx@linutronix.de, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

On Sat, Dec 7, 2024 at 11:31=E2=80=AFAM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> This patch enables the advanced interrupt controller function under
> multiple-node of 3C600. The topology of the advanced interrupt controller
> is consistent with NUMA node. We check the enable status of the node wher=
e
> each CPU is located once when it goes online, which may cause some
> additional operations, but it can ensure that the advanced interrupt
> controller can still be used in situations where some CPUs cannot start
The whole can be reworded:

Currently we only enable one chip's advanced interrupt controller
(AVEC) in hardware, so multi-chip machines with Loongson-3C6000 don't
work. This patch enables it for every chip (In theory every chip needs
to be enabled only once, but for simplicity we enable it on every core
in the CPU online hooks).

>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  drivers/irqchip/irq-loongarch-avec.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-l=
oongarch-avec.c
> index 0f6e465dd309..9e30198fa7e4 100644
> --- a/drivers/irqchip/irq-loongarch-avec.c
> +++ b/drivers/irqchip/irq-loongarch-avec.c
> @@ -56,6 +56,18 @@ struct avecintc_data {
>         unsigned int            moving;
>  };
>
> +static inline void avecintc_enable(void)
> +{
> +       u64 value;
> +
> +       if (!loongarch_avec.domain)
> +               return;
Is there any reason to check this? If domain is NULL, avecintc_init()
fails, there is no chance to execute this function.

Huacai

> +
> +       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> +       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> +       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +}
> +
>  static inline void avecintc_ack_irq(struct irq_data *d)
>  {
>  }
> @@ -127,6 +139,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>
>         guard(raw_spinlock)(&loongarch_avec.lock);
>
> +       avecintc_enable();
> +
>         irq_matrix_online(loongarch_avec.vector_matrix);
>
>         pending_list_init(cpu);
> @@ -339,7 +353,6 @@ static int __init irq_matrix_init(void)
>  static int __init avecintc_init(struct irq_domain *parent)
>  {
>         int ret, parent_irq;
> -       unsigned long value;
>
>         raw_spin_lock_init(&loongarch_avec.lock);
>
> @@ -378,14 +391,13 @@ static int __init avecintc_init(struct irq_domain *=
parent)
>                                   "irqchip/loongarch/avecintc:starting",
>                                   avecintc_cpu_online, avecintc_cpu_offli=
ne);
>  #endif
> -       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> -       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> -       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +       avecintc_enable();
>
>         return ret;
>
>  out_remove_domain:
>         irq_domain_remove(loongarch_avec.domain);
> +       loongarch_avec.domain =3D NULL;
>  out_free_handle:
>         irq_domain_free_fwnode(loongarch_avec.fwnode);
>  out:
> --
> 2.20.1
>
