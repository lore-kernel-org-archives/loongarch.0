Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06B373
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 02:41:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb7589b187so2431770e87.1
        for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 19:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689302517; x=1691894517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OmPgs82qehEhicyd4Es3lxW3uviOWIkt4ph6eCLkRY=;
        b=fxxRI1BFMCGQM3EwByzI7GvrScnXDZox4fH7nbts4w7X9vPkUM6Ni2RnsQIgygJokv
         mc1OM/s/qNigpj9SrAZzGY0ZcV9P4G7QLtcoOkG1irq6ZKx0OV2Sx92eqojxpfS806e7
         ub89Tn27LJugQ4glEEfMD2qes8SPV31M5wxpEGPFjAScpYlgIFeA5eiyFuttqLyi1JuQ
         NO8PI/Qg4C+4bmmskIO0N5CLTAd06MHqiNMXgJYcRFzNZloxyAUncjZWFXDvB3Sim9A1
         7AJDM2EaAuL9x8ohT20e/ROuNjKFZ054YW1lfLsxY8zMNr88+WrEG0Kv4FiYQGH+MTGJ
         hXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689302517; x=1691894517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OmPgs82qehEhicyd4Es3lxW3uviOWIkt4ph6eCLkRY=;
        b=CHgb0nMvvngfRfzFA6Wh+xYciElf84sYgC2R7kPa9k/7xiiAKBlCV/heXpPKin/+ws
         YteiUdi3CNwd9eTmIwYjgfeaWptMYBJ28Rhy7HUlgqIAmT5YXq/jph34WCSSKTBPMJ3d
         ZcXErdNteATg60pW6lN73p0eCHpR8GwV46uQpeV6VCVAaP6UNCUPSjtDFb5Sx1lEk2NC
         UBcZFV59SS7jsMs4xLKaZZ7wIEBxa6DiQkf7QN8DYlWUl3TgpHqzDhe33EgKYos9muxG
         fpfEzNWxsb5J/49RcM+R5qxmzx1f1WCcDgRtng2uOzWH2Z+aSyqSUuV01cTB73BlAKO/
         YZkQ==
X-Gm-Message-State: ABy/qLaOYyzjMKWZRKBlvu4rR8f9u0efVh+G0+ToltQ/kfbhDI3I7JkP
	pbbbq7Yb9q9itLhZu2yXaMYhO7J0J9Ab5BH+csI=
X-Google-Smtp-Source: APBJJlEFmqmz9tnK7MKDDZLEfck5buNk7gYCbKlD1BY1i3MogukPQOOA58aAJq69v+b1iCN2ltOAHYSAjoYRTiUABgo=
X-Received: by 2002:a05:6512:36d2:b0:4f8:e4e9:499e with SMTP id
 e18-20020a05651236d200b004f8e4e9499emr2194877lfs.12.1689302516984; Thu, 13
 Jul 2023 19:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <be1874e517f4f4cc50906f18689a0add3594c2e0.1689215889.git.chenfeiyang@loongson.cn>
 <ZK+thg7xIKt7b8X+@shell.armlinux.org.uk>
In-Reply-To: <ZK+thg7xIKt7b8X+@shell.armlinux.org.uk>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Fri, 14 Jul 2023 10:41:45 +0800
Message-ID: <CACWXhKn1V-jMjsmV2kHEvG-Kn_vp4v22145MZdy-zdKaywPrmw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: phy: Add driver for Loongson PHY
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, andrew@lunn.ch, hkallweit1@gmail.com, 
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com, 
	chenhuacai@loongson.cn, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 3:53=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jul 13, 2023 at 10:46:53AM +0800, Feiyang Chen wrote:
> > +#define PHY_ID_LS7A2000              0x00061ce0
> > +#define GNET_REV_LS7A2000    0x00
> > +
> > +static int ls7a2000_config_aneg(struct phy_device *phydev)
> > +{
> > +     if (phydev->speed =3D=3D SPEED_1000)
> > +             phydev->autoneg =3D AUTONEG_ENABLE;
> > +
> > +     if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> > +         phydev->advertising) ||
> > +         linkmode_test_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> > +         phydev->advertising) ||
> > +         linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> > +         phydev->advertising))
> > +         return genphy_config_aneg(phydev);
>
> While it's fine to use four spaces within the if () expression, this
> "return" should be indented with a tab.
>

Hi, Russell,

Sorry for the typo. I will correct it in the next version.

> > +
> > +     netdev_info(phydev->attached_dev, "Parameter Setting Error\n");
>
> Does this give the opportunity for userspace to spam the kernel log?
> E.g. by a daemon repeatedly trying to set link parameters? Should it
> be rate limited?
>
> > +     return -1;
>
> Sigh, not this laziness disease yet again. -1 is -EPERM. Return a
> real errno code.
>

OK.

> > +int ls7a2000_match_phy_device(struct phy_device *phydev)
> > +{
> > +     struct net_device *ndev;
> > +     struct pci_dev *pdev;
> > +
> > +     if ((phydev->phy_id & 0xfffffff0) !=3D PHY_ID_LS7A2000)
> > +             return 0;
>
>         if (!phy_id_compare(phydev->phy_id, PHY_ID_LS7A2000, 0xfffffff0))
>                 return 0;
>

OK.

> > +
> > +     ndev =3D phydev->mdio.bus->priv;
>
> This doesn't look safe to me - you're assuming that if the PHY ID
> above matches, that the MDIO bus' private data is something you know
> which is far from guaranteed.
>
> The mdio bus has a parent device - that would be a safer route to
> check what the parent device is, provided the mdio bus is created so
> that it's a child of the parent PCI device.
>

OK. I=E2=80=99ll get right on that.

Thanks,
Feiyang



> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
