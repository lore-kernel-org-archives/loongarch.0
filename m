Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEFC7F
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 01:34:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so785939e87.0
        for <loongarch@lists.linux.dev>; Wed, 02 Aug 2023 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691026438; x=1691631238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5IS5UuGfFv9Y3MJ14DxTeVzX6uKjci9jhbxi32mlnM=;
        b=KOn3G9TR11J16Hu4s6NRwAivMOilaasb7pvv2HlVSR89WSNni4x0NxIPwoahtOx0ZX
         TEGtXn5LIi5ABHAuYFMQa6ENDzfeegxStNeVZGzt/Wo12hYEpCxIXxAffqASY3XTi7J+
         WneAxvUspHTlu6hiKMONj3KXIxSMkSpLiTAoItJACVvtSKKJowxgsOPDTAEauNGg/YWw
         VuIE08S9fbWZtLvwPN04l1E/3VfyiL3sGHwoinPce/ySfChxty89YQjvXxyCzd3DRazg
         rCugiDfapYf9w3KhoBshfWJOS8UQimAcx+qmn5Xh/8Mvk5FcdbXughInsULjsuAhaEJ/
         Wb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691026438; x=1691631238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5IS5UuGfFv9Y3MJ14DxTeVzX6uKjci9jhbxi32mlnM=;
        b=Pnc8t8ShAOrw0iaddD76PZ4GcQgKRpEvHaGrMMjVIs5qoiy0BqkZofTaNoat00uPHD
         Yd8H8XPYAEUN4V5lMEMgBoy9Y2RirWnQmjBS26a9aLeVqZ3Nzuw8DWjKPhuiNRL3gx1U
         pfNbOQ91K5FgykKAx71Xoh3iAq/KZONIvCkodI5mmN7uoKF1NfuOd6m9hg8v3re4T2Qz
         3cK5ECZphVPxNySBiU8rGx4yWtqEu2Uw6EJcYMjVY/02A1PlC2/45QbVqqb44jvCkQnb
         Zy13DSiI/FEF5GYLtafAF3SUo1yDCAfjVggx0LdsorSuTqsxNdLR4PiG0mMFnjw1Ut/f
         ohyg==
X-Gm-Message-State: ABy/qLYlVvc1ivt+2tMua+OZzinsFBhKNzJG+vwALg9awJtMnGBT9YPL
	0nf6VlD9giQ3uBjVNdhzyUEmhfw34oQS7dIkSZk=
X-Google-Smtp-Source: APBJJlFLl57plNWBNHcf1ry/AhGY0pCUEcFSr8oYD0sCjx2Fr43+JHjRQaPGVt+rqe/VHP4iJ7Y3P9nBcmcYvBbWNGs=
X-Received: by 2002:ac2:5edd:0:b0:4fe:1e74:3f3e with SMTP id
 d29-20020ac25edd000000b004fe1e743f3emr5132380lfq.48.1691026437970; Wed, 02
 Aug 2023 18:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1690439335.git.chenfeiyang@loongson.cn> <7cae63ede2792cb2a7189f251b282aecbb0945b1.1690439335.git.chenfeiyang@loongson.cn>
 <ZMOJNtClcAlWwZpP@shell.armlinux.org.uk> <CACWXhKmcFCHQsjc-7BU5VkNyJ70v6iEg2iQ11i-qS3VchvKCJA@mail.gmail.com>
 <ZMfQUI1BOd1RWM4u@shell.armlinux.org.uk>
In-Reply-To: <ZMfQUI1BOd1RWM4u@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Thu, 3 Aug 2023 09:33:45 +0800
Message-ID: <CACWXhKmb6iw+Y8teNVR7J_vTqPEezExixRHvV2kGVDV4X_4HBA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] net: stmmac: Add Loongson HWIF entry
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, andrew@lunn.ch, hkallweit1@gmail.com, 
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	chenhuacai@loongson.cn, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:16=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Jul 31, 2023 at 05:46:57PM +0800, Feiyang Chen wrote:
> > On Fri, Jul 28, 2023 at 5:24=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Jul 27, 2023 at 03:18:06PM +0800, Feiyang Chen wrote:
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/dr=
ivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > index e8619853b6d6..829de274e75d 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > @@ -3505,17 +3505,21 @@ static int stmmac_request_irq_multi_msi(str=
uct net_device *dev)
> > > >  {
> > > >       struct stmmac_priv *priv =3D netdev_priv(dev);
> > > >       enum request_irq_err irq_err;
> > > > +     unsigned long flags =3D 0;
> > > >       cpumask_t cpu_mask;
> > > >       int irq_idx =3D 0;
> > > >       char *int_name;
> > > >       int ret;
> > > >       int i;
> > > >
> > > > +     if (priv->plat->has_lgmac)
> > > > +             flags |=3D IRQF_TRIGGER_RISING;
> > >
> > > Can this be described in firmware?
> > >
> >
> > Hi, Russell,
> >
> > I'm not sure, could you explain what you mean?
>
> Modern systems describe the IRQ triggering in firmware for the OS
> such as DT. Does your implementation have any firmware that can
> do this kind of description for you (e.g. DT, ACPI?)
>

Hi, Russell,

I see. I think I can get this from DT.

Thanks,
Feiyang

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
