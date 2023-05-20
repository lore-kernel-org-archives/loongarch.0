Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4195817
	for <loongarch@lists.linux.dev>; Sat, 20 May 2023 08:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23FDC433EF
	for <loongarch@lists.linux.dev>; Sat, 20 May 2023 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684572232;
	bh=q8wzoly7YJd3wL9q5vpF3c1DGI0d06QhOhge2JVJV5U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ijwwa9nw0pjTSuZ7q/bshHkMKD5QlO5fINK6ccVvDAjoWCNALzzCD/XYxT8NR/f/l
	 D52pipde/es6WfhZqeA3/i0U6WK94+1Fzqdi+Jo1QQBxSnMW6oMqmc89g6UU9XQWE3
	 LRwf1zqujrnLyu9o+ni1TBNhclvAtyU/B4DBs9xrdhjYA7zx2xfu36We+a+chVKzGT
	 piWQoAmEM8RqOavzbz3GclquTdAU7fvI7BZ/jNUH5XgtJ5keJnv/A2Gxt+sHkJyjza
	 fqrknfT+Cmr4euWcx60uVv1Vjv0tPrUMFISo5ZmuefW/I2lrOhKWgm/qU9ZPqb9jkC
	 sSgZ4LkR79hfw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-96f588bc322so301612866b.1
        for <loongarch@lists.linux.dev>; Sat, 20 May 2023 01:43:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDxpuT4X5gja0xEq8DfRvtaYOdxoCHlN5iIzK21/zL4FJCPQbsBU
	Pd6bwBFwPG8YwYmQ2exX2ASIi012IiV4GfwMu3o=
X-Google-Smtp-Source: ACHHUZ7TLDwGUzb3p7e39xGVbwmazSAUUSI8aJJ1deVvVbH905mq/y8n8yEbYhWccb49zSY4Cd0hDP2vFe1tWYsTO2Q=
X-Received: by 2002:a17:907:94ca:b0:94a:44ef:853d with SMTP id
 dn10-20020a17090794ca00b0094a44ef853dmr4504939ejc.68.1684572230928; Sat, 20
 May 2023 01:43:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230520063818.27208-1-lvjianmin@loongson.cn> <20230520063818.27208-5-lvjianmin@loongson.cn>
In-Reply-To: <20230520063818.27208-5-lvjianmin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 20 May 2023 16:43:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6BBCXpF2uOehwz1gsMdb6vcjHsCYsp+soL+Tzy-bfxQg@mail.gmail.com>
Message-ID: <CAAhV-H6BBCXpF2uOehwz1gsMdb6vcjHsCYsp+soL+Tzy-bfxQg@mail.gmail.com>
Subject: Re: [PATCH V1 4/4] irqchip/loongson-liointc: Add IRQCHIP_SKIP_SET_WAKE
 flag
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	loongson-kernel@lists.loongnix.cn, Yinbo Zhu <zhuyinbo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jianmin,

On Sat, May 20, 2023 at 2:38=E2=80=AFPM Jianmin Lv <lvjianmin@loongson.cn> =
wrote:
>
> From: Yinbo Zhu <zhuyinbo@loongson.cn>
>
> Liointc doesn't require specific logic to work with wakeup IRQs,
> and no irq_set_wake callback is needed. To allow registered IRQs
> from liointc to be used as a wakeup-source, and ensure irq_set_irq_wake()
> works well, the flag IRQCHIP_SKIP_SET_WAKE should be added.
Maybe using LIOINTC instead of Liointc/liointc is better in commit
message. Except this small issue, for the whole series,
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-liointc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq=
-loongson-liointc.c
> index 9a9c2bf048a3..dbd1ccce0fb2 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -291,6 +291,7 @@ static int liointc_init(phys_addr_t addr, unsigned lo=
ng size, int revision,
>         ct->chip.irq_mask =3D irq_gc_mask_disable_reg;
>         ct->chip.irq_mask_ack =3D irq_gc_mask_disable_reg;
>         ct->chip.irq_set_type =3D liointc_set_type;
> +       ct->chip.flags =3D IRQCHIP_SKIP_SET_WAKE;
>
>         gc->mask_cache =3D 0;
>         priv->gc =3D gc;
> --
> 2.31.1
>
>
