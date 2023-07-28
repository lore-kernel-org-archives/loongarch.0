Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BE7C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 02:00:07 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so2746799e87.2
        for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 19:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690509605; x=1691114405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQRjDvqI2wB+9kV9HDAkrT4+B9QHQmFxny+flLnsotM=;
        b=sTd8an1jg+ArsGizoBbMuupDBtPeHRJzexdcZLypJrDrU2IXDXr8gUl91CViZ++lIw
         VTtRpj2K1F3YC9qlxxxkgoK1Xi4tO+1N9ClyMomgT8el8fElcJYawmv7Oqua5NCEfddn
         SkhCLXYOHmDoCE4l7RNs9Eb9puAWhucz3mXLHBxSfBJPq+j39BGAnL6gxB46b/1BGfmC
         qNa1JhhK8olBB6NHHd1bV1PBJTHwwXhF9fgk5UkIpOc8b4/FdELvi7QMLfMFUogzZPvA
         QtA6AwYQOohdKA7fl19PesiDe0ZTBnfCBAvGYK4NQMHneHOsXpvnwYiJanZ6F3HKbmI6
         Uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690509605; x=1691114405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQRjDvqI2wB+9kV9HDAkrT4+B9QHQmFxny+flLnsotM=;
        b=CkCeINZ1OIz9MlYNQq3gCcPMGZzQ9ijl9NUUgHQcyc5/YzNKGE75iS9jOtqZdfQW2L
         fgYxQDFMz0QR8JqU2kEhf3D7bln+bOtLZvhgqC2wkafePyWpFzl4HSX1yw3yG4A7FoQX
         8aOtqz7g8GkJz1k3C+1KeksYZV27vuUNG7Uo4BB/N5cn6cNSZwf7LWrEd+aSiWK/NFki
         qQnO0OnltJ/2UK74taA0O/zu2zOABFlD10ht/v531UBuSLqy0shh5Omu4iGKNKJyl6LB
         HYshHvBdNKIjPJUQl0DID+GEkcfFkGZRu4TdGlrhNnzAC1bKQ7ceg1dl4BPxsjThXSVe
         hDeA==
X-Gm-Message-State: ABy/qLaAe1e4aCercXzUDuN3w5XLks0Z4Kq0PkRymT/Z+52TiDuJWiLN
	ZGErsL6q7sYp9onvkGFJx5/pRxT1nobsDPUCtL8=
X-Google-Smtp-Source: APBJJlFDrZ3zDcRnitvNO9k2G8Jf4yZ3wP9u3pkv+LgOzBuOLQtxjUD/EfN+EFCQd86sAT6E5pzf9LndL0lJ96csXPI=
X-Received: by 2002:a19:641e:0:b0:4fe:85c:aeba with SMTP id
 y30-20020a19641e000000b004fe085caebamr521667lfb.21.1690509605492; Thu, 27 Jul
 2023 19:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <dd88ed0f53e9ee0f653ddeb78b326f8eb44bdbd1.1690439335.git.chenfeiyang@loongson.cn>
 <1bbba61c-19b7-48bb-8c93-0741b43abda5@lunn.ch>
In-Reply-To: <1bbba61c-19b7-48bb-8c93-0741b43abda5@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 28 Jul 2023 09:59:53 +0800
Message-ID: <CACWXhK=rVTf=BYo2G2CDDo6AFOwqJJM_v+H6G=0YNohqh8OycA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] net: stmmac: dwmac-loongson: Add LS7A support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 5:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static void common_default_data(struct pci_dev *pdev,
> > +                             struct plat_stmmacenet_data *plat)
> >  {
> > +     plat->bus_id =3D (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pde=
v->bus->number, pdev->devfn);
> > +
> >       plat->clk_csr =3D 2;      /* clk_csr_i =3D 20-35MHz & MDC =3D clk=
_csr_i/16 */
> >       plat->has_gmac =3D 1;
> >       plat->force_sf_dma_mode =3D 1;
> >
> >       /* Set default value for multicast hash bins */
> > -     plat->multicast_filter_bins =3D HASH_TABLE_SIZE;
> > +     plat->multicast_filter_bins =3D 256;
>
> HASH_TABLE_SIZE is 64. You appear to be changing it to 256 for
> everybody, not just your platform. I would expect something like
> common_default_data() is called first, and then you change values in a
> loongson specific function.
>

Hi, Andrew,

The common_default_data() here is defined in our platform driver. We
have tested on our platforms (LS7A and LS2K) and it can be safely
changed to 256.

Thanks,
Feiyang

>          Andrew
