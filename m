Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43711188704
	for <loongarch@lists.linux.dev>; Tue, 31 Dec 2024 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735631795; cv=none; b=i/MdcR5guuTIAVWPYO1a0X1c9dWGPEft6oJeJh2uKiqUnwg17d2DjjfzzQBGlpn5Y0vxf0hall3oJ3pv5EYOk6HkZU7GxqsTs8jQfSez/cBqQjYOwtErdwwxmdES5nhXAAn2QaJpKSMNDW+CwGVwWA9fCPkzmGyvtjInTziuzNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735631795; c=relaxed/simple;
	bh=ndUUuADRZQz4vc3PlHVVgIMHvNH2fkoeXFXOrUR7kB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kx6YdddsTW/ocvhq1iALshciv7HJCta45dDqnSHLpOyZgY492uHYJUCcaLTDS+sY9zlqunLLGpMEDh1H+HeZBRKTomIMT1ExcJABiZheTNE7zVfm4Xc7ChD8lIhFDufwJFcoC6j76BfOiCuNrX6OpSAFzGNg45KSP2+tCN1sj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCy8MsP3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCy8MsP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC047C4AF0B
	for <loongarch@lists.linux.dev>; Tue, 31 Dec 2024 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735631794;
	bh=ndUUuADRZQz4vc3PlHVVgIMHvNH2fkoeXFXOrUR7kB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rCy8MsP34cl10Tjz/rqu94F3xEmYMAALWhwHrmYdd2SzmnCCc0MhKyOll665JcP7E
	 qoheN+u5urTY+z5LjodvSXkdlLzXBlgXPmyI6b4SejgHe/Np4FktdsO4LnW90vbdpi
	 Hwdka37ekHxk0HIx6STtn6eyw6p0PjO3GRHc1/m8jvnkHsyMSQqqQVzwGrLkmJLi5j
	 d6eHkMR/zAgLn/GAaskhkcqGIz+g9WDLLjl53RxrkErZ8QmzZjnnR8ZjZCsorejWLO
	 pcWvUnC76gf2QbSe7XT7rQrvpo1YZqJrLo+4sT5J/THOJJaEtrIKln31Eh9UFqakRT
	 Wto6CKrFSnR4A==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa6a618981eso1625616266b.3
        for <loongarch@lists.linux.dev>; Mon, 30 Dec 2024 23:56:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpE+ITn5nROC15yJi3y5mS8cq3BUn+kyttZc03FDacoRLNsv/julLwaNJ9GlC/ymMX4stWA94/SRU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDU7baOjwpQ7UUXvC31C11FYMnK00SZMaIPpx/N+K9qKzcrMDx
	XliWOVTFpNGulpArXbKLzfFPfHRKU3XJ1SADStvf6AiM6mOQH1PTElv6TCOAz0OXTi22h1dRbv6
	ypWoo9Fu5jOZLfjtfWyeZTIlaPPE=
X-Google-Smtp-Source: AGHT+IGDt2q3oaihd4nxTSrdiOqM2wthTkMTfJCpd3xfPOKk3o6ujAvaRNNHYx7yPwSLmtgVwkMKTQXD1PKcKhcUkQ4=
X-Received: by 2002:a17:907:7fa9:b0:aab:d8de:217e with SMTP id
 a640c23a62f3a-aac2c005b7amr3182406266b.26.1735631793454; Mon, 30 Dec 2024
 23:56:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241230021503.14012-1-zhangtianyang@loongson.cn>
In-Reply-To: <20241230021503.14012-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 31 Dec 2024 15:56:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H56tOfi1oqnwh1O94Z3sAS7sAbeKQ_U_O6AD98YVq6F=w@mail.gmail.com>
Message-ID: <CAAhV-H56tOfi1oqnwh1O94Z3sAS7sAbeKQ_U_O6AD98YVq6F=w@mail.gmail.com>
Subject: Re: [PATCH V2] irqchip/loongarch-avec:Add multi-nodes topology support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, tglx@linutronix.de, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

On Mon, Dec 30, 2024 at 10:15=E2=80=AFAM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> avecintc_init() enables the Advanced Interrupt Controller (AVEC) of
> the boot CPU node, but nothing enables the AVEC on secondary nodes.
>
> Move the enablement to the CPU hotplug callback so that secondary
> nodes get the AVEC enabled too. In theory enabling it once per node
> would be sufficient, but redundant enabling does no hard, so keep the
> code simple and do it unconditionally.
>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  drivers/irqchip/irq-loongarch-avec.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-l=
oongarch-avec.c
> index 0f6e465dd309..988d3e02ac54 100644
> --- a/drivers/irqchip/irq-loongarch-avec.c
> +++ b/drivers/irqchip/irq-loongarch-avec.c
> @@ -56,6 +56,15 @@ struct avecintc_data {
>         unsigned int            moving;
>  };
>
> +static inline void avecintc_enable(void)
> +{
> +       u64 value;
> +
> +       value =3D iocsr_read64(LOONGARCH_IOCSR_MISC_FUNC);
> +       value |=3D IOCSR_MISC_FUNC_AVEC_EN;
> +       iocsr_write64(value, LOONGARCH_IOCSR_MISC_FUNC);
> +}
> +
>  static inline void avecintc_ack_irq(struct irq_data *d)
>  {
>  }
> @@ -127,6 +136,8 @@ static int avecintc_cpu_online(unsigned int cpu)
>
>         guard(raw_spinlock)(&loongarch_avec.lock);
>
> +       avecintc_enable();
> +
>         irq_matrix_online(loongarch_avec.vector_matrix);
>
>         pending_list_init(cpu);
> @@ -339,7 +350,6 @@ static int __init irq_matrix_init(void)
>  static int __init avecintc_init(struct irq_domain *parent)
>  {
>         int ret, parent_irq;
> -       unsigned long value;
>
>         raw_spin_lock_init(&loongarch_avec.lock);
>
> @@ -378,14 +388,13 @@ static int __init avecintc_init(struct irq_domain *=
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
This is unnecessary, since no one checks it, and there is no memory
leak even if without it.

Huacai

>  out_free_handle:
>         irq_domain_free_fwnode(loongarch_avec.fwnode);
>  out:
> --
> 2.20.1
>
