Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F17C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 02:00:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so2747411e87.2
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690509646; x=1691114446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msn98uSrmp3cbj/UxZcQv417B0dm9hgVkWLxRLCqOCQ=;
        b=BvIcPDaQ3ylQNdxQD1U56Hg2yNKmULsOKTaZ3U6AoWBLBiYlr45miZGrm78z9pM+fY
         Bj9wXo7Puosr6BGQSTY/7v8RhPPZoGfMJ1y0Bc+YecZ8VZzo3ETW6YKlPtVIsUDY+U0w
         Fj9fzjslJEBpa7rPK+MzcTpnnvKLg6QFGL0MbUb3uDxpO4LbREqfKTKQKqm/UsTu+xUa
         hPD4DxuVXQ4reKx0dBaxI3obTLKkKQDyDkX1ylLOw07f6ya0S0sWrw/7QRmco+676Fh0
         hD53xEcgm+pRu4IiIgyy/c1CMEJQfKcEBTaGDIp0MP2I4X9kozn8Sou+YNs6XSmIfRAg
         m4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690509646; x=1691114446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msn98uSrmp3cbj/UxZcQv417B0dm9hgVkWLxRLCqOCQ=;
        b=elYUWtScP23NiTTtFMEDV1WbMftjKLXDAtLdAeEncUhGcwIvi4ORktKXOZgaqmn8PH
         Vng5KciJDWE0DsicCZaujRHq7OGNvznpuofJm/iek5GBpR9Z5r3ehXLGWYKQkHpzfE/A
         7Pu3mbqAxHqF7NkX4o7HSp+f/CtK8iJXRr77RkBghya3xAXSKmc4ThbvzRWMX5gaYYVe
         9Pd4MtuSXsexGtaPh1GhXFEFCrwxKInibsEgHrPnUZ9RV5cwBLUORWDpzv7UB3d4o3BK
         1wrtFvJqsGP32HOkodYtXxAE8GfROR0H9B1AhpU0/lvhgmatD51E1QJqCQFWyOwHyVKk
         3pJw==
X-Gm-Message-State: ABy/qLZCCDC69iXdvNyB7ZsHlvdrGFecSBcRZdV4fOmnyuO0jAGKjZZA
	OklT777yO7BG+ePsphF5cpsOKkdLZCsPbggZoOU=
X-Google-Smtp-Source: APBJJlGfZAxG1J/1uxcdjl7oEhK0DiCdnf7IwT3YZFXU8CAr/+XLxn4pJSUAatCqRLpMUGFqX2cCgotDd7v1uvFYLkI=
X-Received: by 2002:a05:6512:ad6:b0:4f8:5b23:5287 with SMTP id
 n22-20020a0565120ad600b004f85b235287mr676034lfu.62.1690509646152; Thu, 27 Jul
 2023 19:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <dd88ed0f53e9ee0f653ddeb78b326f8eb44bdbd1.1690439335.git.chenfeiyang@loongson.cn>
 <9add374b-27ba-47c9-95cf-eec896231d58@lunn.ch>
In-Reply-To: <9add374b-27ba-47c9-95cf-eec896231d58@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 10:00:34 +0800
Message-ID: <CACWXhKnmEgt9FFKrtcMZN75bNDuEqNoOqNtHWUP-W2s0U2JkQA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] net: stmmac: dwmac-loongson: Add LS7A support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 6:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int loongson_dwmac_probe(struct pci_dev *pdev,
> > +                             const struct pci_device_id *id)
> >  {
> > +     int ret, i, bus_id, phy_mode;
> >       struct plat_stmmacenet_data *plat;
> > +     struct stmmac_pci_info *info;
> >       struct stmmac_resources res;
> >       struct device_node *np;
> > -     int ret, i, phy_mode;
> > -
> > -     np =3D dev_of_node(&pdev->dev);
> > -
> > -     if (!np) {
> > -             pr_info("dwmac_loongson_pci: No OF node\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
> > -             pr_info("dwmac_loongson_pci: Incompatible OF node\n");
> > -             return -ENODEV;
> > -     }
>
> There are a lot of changes here, and it is not easy to review.  I
> would suggest you first do a refactoring patch, moving all handling of
> DT into a helper. Since it is just moving code around, it should be
> easy to review. Then you can add support for platforms which don't
> support DT.
>

Hi, Andrew,

OK.

Thanks,
Feiyang

>         Andrew
