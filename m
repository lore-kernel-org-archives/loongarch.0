Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225A63A2
	for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 09:42:49 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b974031aeaso63132931fa.0
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690796567; x=1691401367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHiBudAh1G+w+7yBNDUS9EIw0wxBnRGoQ+xkrF+Mw5k=;
        b=lNMc+/VrwdL4JbVu/ope6EaOPz5UlzCo3U/LBv3l1GJ9IX/uuxWZaub+Grxx2FBQ9L
         1A/NH4G3w1lF6hUha1Mee9OSAp9vfTNK35Zl++mEn1O+tbSmY8Z6ExWBEY5PG1y8dyO8
         /XG36Uk79MULOBuwso5DQ1unyZ5boz5Ph6M5lhLwdI4xeCpZ8V0OaksBw97j6BapGnng
         MU/egB2PXDCYZhaxXndi14m7/ot1G/KcKjneB1QggftO5oEsYdQmCnyIk3YM6RG02Jau
         3ijgfKqUHEU00lgIc2PhUjxe2t4E4ezmnQgyOPqr/TEKdFIBw5qBhZ3O/FSUT2I/+0em
         2tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796567; x=1691401367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHiBudAh1G+w+7yBNDUS9EIw0wxBnRGoQ+xkrF+Mw5k=;
        b=LiyXrmnbYdfyuItz1pvBYPqe3JMsonkSmClolFL2JnmAn2HoQL3LcZK5rZtKkF/ydV
         cXOacgX/jQFvBHVDAKCEW8O3THnkAkmy0/f15u2S6JJecqDzFcdKoFxfsSwURl7y2DY3
         wOmkMDIUQ26FQIrth9hHGtbNokhYo+ZGy6nUjOjGOs5zr7mgvUdiTRKqkusGo/Jjh7hy
         WAgl4kIMtihdcYJGZy5rtZ8C86azelp0t4tuGHXNKyukDD3FghbHqKohCz4BIVDi34iI
         8aZNJ4DR3oDkPrkLJjqiIIefoBwJ6EE7L2cqDW5Yfugevcdt0uyXb4sUoFHFHN3h0sPd
         Nl6g==
X-Gm-Message-State: ABy/qLaJ6WhyK1PI6ht/abPYHpHVwesxGY+3uVN2Xw6IYZYzyXlma7W1
	I0AGWaw32Rn8RRMcKswABrqXSCKafC0/2gjGYOg=
X-Google-Smtp-Source: APBJJlHfa2y1+a6KbXHOIJYUerUo7LR5NDOdKUdfzPLfURUCzMJXgDX4hX6XmSXCpNJZlbyTQc3dWMfFDNOJ5VeEv/Y=
X-Received: by 2002:a2e:84c6:0:b0:2b9:ac48:d804 with SMTP id
 q6-20020a2e84c6000000b002b9ac48d804mr6428546ljh.38.1690796567032; Mon, 31 Jul
 2023 02:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <dd88ed0f53e9ee0f653ddeb78b326f8eb44bdbd1.1690439335.git.chenfeiyang@loongson.cn>
 <1bbba61c-19b7-48bb-8c93-0741b43abda5@lunn.ch> <CACWXhK=rVTf=BYo2G2CDDo6AFOwqJJM_v+H6G=0YNohqh8OycA@mail.gmail.com>
 <a353bda9-2931-4c26-a853-21b6b340e1c3@lunn.ch>
In-Reply-To: <a353bda9-2931-4c26-a853-21b6b340e1c3@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 31 Jul 2023 17:42:35 +0800
Message-ID: <CACWXhKm11Dq-=HNihhp3WWb6sE=xh=bqBGiMJsGKxte65wQDsg@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] net: stmmac: dwmac-loongson: Add LS7A support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 4:46=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Jul 28, 2023 at 09:59:53AM +0800, Feiyang Chen wrote:
> > On Thu, Jul 27, 2023 at 5:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > +static void common_default_data(struct pci_dev *pdev,
> > > > +                             struct plat_stmmacenet_data *plat)
> > > >  {
> > > > +     plat->bus_id =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID=
(pdev->bus->number, pdev->devfn);
> > > > +
> > > >       plat->clk_csr =3D 2;      /* clk_csr_i =3D 20-35MHz & MDC =3D=
 clk_csr_i/16 */
> > > >       plat->has_gmac =3D 1;
> > > >       plat->force_sf_dma_mode =3D 1;
> > > >
> > > >       /* Set default value for multicast hash bins */
> > > > -     plat->multicast_filter_bins =3D HASH_TABLE_SIZE;
> > > > +     plat->multicast_filter_bins =3D 256;
> > >
> > > HASH_TABLE_SIZE is 64. You appear to be changing it to 256 for
> > > everybody, not just your platform. I would expect something like
> > > common_default_data() is called first, and then you change values in =
a
> > > loongson specific function.
> > >
> >
> > Hi, Andrew,
> >
> > The common_default_data() here is defined in our platform driver. We
> > have tested on our platforms (LS7A and LS2K) and it can be safely
> > changed to 256.
>
> Then add a new #define.
>

Hi, Andrew,

Should I add the new  #define in our platform driver or in common.h?

Thanks,
Feiyang

>      Andrew
