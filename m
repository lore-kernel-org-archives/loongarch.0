Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E3632
	for <loongarch@lists.linux.dev>; Thu,  4 Aug 2022 02:46:16 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id f10so7748433uap.2
        for <loongarch@lists.linux.dev>; Wed, 03 Aug 2022 19:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=7AamRdppKvDSQrc9DYTmow3W1DdARJPLLdADy2Ps/Tk=;
        b=aLRkbAjrkTiOBwngiAXaGfPz9SlT8CVBeBLb3a8Oh0vFnpsY2UxyXdJKhBcO6J9+Hj
         a+r0mX0vqT/JtsYSki4zIvGzFh/tbvxKchIZDlxk/SQ+mHOEft011MDpqWjN8u4Q2urS
         lsQUIbA+K4Rueo7ipWyuJmcHN8AjN/v4mlOj3porzVa2zC5G9jJpYjrBWhnkOAKCFkVw
         /h1xGQFgTmUmh4mmV1mB9TAzdpZNkXTRoNQAEFI+exbyGilGp1kkWNNbJRQZyWR08XvS
         kJYsbS+bxol3Ifu0+SoJrFNLs5fjn+3CTF0xyd0uM56R5JbbzH1VTIlK8Dhdkj0Yo0O6
         qTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=7AamRdppKvDSQrc9DYTmow3W1DdARJPLLdADy2Ps/Tk=;
        b=BuevLYiV3QtMre9ptKXvReu1kxX/kpxYcxw9HOCpVU0aIE9NLng0QabPds87M9Jx+j
         CvvVVCSjeIlHKGi5ECzmk8VmPrPUGK+FutCZG94BorvuZCLlZQ4i3QbR9Slp8StY3N6d
         20VTtaiAJdRaIAHFBgVdmxSrM11y+pj+MADlTtAxnK/ZDGPrNyo8TpXSW32WyyP2X4s9
         +74KpumQf10jvPDgF46LXNw0u3rdoGQ0uCB6aMjbWQh3S0Zwl/dg99XLQj2F7KP03Kq0
         mDDXaWPVbhOS51k+R8jUgtBFW7YqwcI5b+kPlxVGA8sokAbun1FNkaehJOHm4k8QYlan
         RSuQ==
X-Gm-Message-State: ACgBeo3NXeemINL/0ljsmRL8F0ctmTAi81dQ2NbaHyLmeWy6JVgGJtjK
	bHiXcFp7CCAFHmsu78N3gasN8CoCSNq7S0ShxYM=
X-Google-Smtp-Source: AA6agR7PV3JeH+wI46Djao6jul7KY04JcQQpbD0zC1OQG5gyUQi/7KDG1mTLMU9JnUA72jB8n9KlfMkalDTUKzsGbhc=
X-Received: by 2002:ab0:65d6:0:b0:385:f6e1:83ef with SMTP id
 n22-20020ab065d6000000b00385f6e183efmr11690820uaq.23.1659581175594; Wed, 03
 Aug 2022 19:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220803042728.3230346-1-chenhuacai@loongson.cn>
 <87r11xbxox.wl-maz@kernel.org> <CAAhV-H5d20zj+vnrEYRYW1h7FwRJpGYtJDc1q4hRdPh3KbXruw@mail.gmail.com>
 <97d33f58-6a15-3a94-f9c0-42ebd48cf562@loongson.cn>
In-Reply-To: <97d33f58-6a15-3a94-f9c0-42ebd48cf562@loongson.cn>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 4 Aug 2022 10:46:00 +0800
Message-ID: <CAAhV-H6hYu5vdpPar_8nMKMWUgD3MLzNBFLkHJyHKfjvCRJJ4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip/loongson-eiointc: Check hwirq overflow
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 3, 2022 at 7:59 PM Jianmin Lv <lvjianmin@loongson.cn> wrote:
>
>
>
> On 2022/8/3 =E4=B8=8B=E5=8D=883:33, Huacai Chen wrote:
> > Hi, Jianmin,
> >
> > On Wed, Aug 3, 2022 at 3:20 PM Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On Wed, 03 Aug 2022 05:27:27 +0100,
> >> Huacai Chen <chenhuacai@loongson.cn> wrote:
> >>>
> >>> Check hwirq overflow when allocate irq in eiointc domain.
> >>>
> >>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >>> ---
> >>>   drivers/irqchip/irq-loongson-eiointc.c | 7 +++++--
> >>>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip=
/irq-loongson-eiointc.c
> >>> index 80d8ca6f2d46..f8060e58ee06 100644
> >>> --- a/drivers/irqchip/irq-loongson-eiointc.c
> >>> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> >>> @@ -241,8 +241,11 @@ static int eiointc_domain_alloc(struct irq_domai=
n *domain, unsigned int virq,
> >>>        struct eiointc *priv =3D domain->host_data;
> >>>
> >>>        ret =3D irq_domain_translate_onecell(domain, arg, &hwirq, &typ=
e);
> >>> -     if (ret)
> >>> -             return ret;
> >>> +     if (ret < 0)
> >>> +             return -EINVAL;
> >>> +
> >>> +     if (hwirq >=3D IOCSR_EXTIOI_VECTOR_NUM)
> >>> +             return -EINVAL;
> >>
> >> How can this happen? Also, you're allocating a *range*. Surely the
> >> upper boundary should matter too?
> > Do you know the exact reason? Please give some information, thanks.
> >
>
> In our internal repo, we don't have middle domain in pch-msi driver, so
> no check for hwirq as in alloc of middle domain. When hwirq is assigned
> failed(negtive value), the wrong hwirq will be passed to parent
> domain(eio domain)'s alloc, so we add check in eio domain's alloc there.
>
>
> But here, it seems that the check is unnecessary, because in pch-msi driv=
er:
>
> static int pch_msi_middle_domain_alloc(struct irq_domain *domain,
>                                             unsigned int virq,
>                                             unsigned int nr_irqs, void
> *args)
> {
>          struct pch_msi_data *priv =3D domain->host_data;
>          int hwirq, err, i;
>
>
>          hwirq =3D pch_msi_allocate_hwirq(priv, nr_irqs);
>          if (hwirq < 0)
>                  return hwirq;
>
>
>          for (i =3D 0; i < nr_irqs; i++) {
>                  err =3D pch_msi_parent_domain_alloc(domain, virq + i,
> hwirq + i);
>                  [...]
>
>
> If pch_msi_allocate_hwirq failed, pch_msi_middle_domain_alloc will
> return, and pch_msi_parent_domain_alloc(will call eio domain's alloc)
> will not be called.
OK, then this patch can be removed and I only need to send the 2nd one. Tha=
nks.

Huacai

>
>
> >>
> >> And for the umpteenth time, please add a cover letter when sending
> >> multiple patches. This is a hard requirement for me.
> > OK, I will add a cover letter, even for simple fix patches. Sorry.
> >
> > Huacai
> >>
> >> Thanks,
> >>
> >>          M.
> >>
> >> --
> >> Without deviation from the norm, progress is not possible.
>
>
