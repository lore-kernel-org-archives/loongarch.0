Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D3310ED
	for <loongarch@lists.linux.dev>; Mon, 17 Jul 2023 02:43:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b708e49059so59792231fa.3
        for <loongarch@lists.linux.dev>; Sun, 16 Jul 2023 19:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689561806; x=1692153806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/rbaFBr1o1WpkBGUX8CuyV0YuFTgeUPikyuIhf+EvE=;
        b=K3Mb/t0FO1qVOX7kd3PzPv9ouKCPOirSTurifUS3hp0XAUNv4+5SfQKPDuJuqyE/cT
         9rdeQF3bv2zPYKA9d5ROWefv2U7I7ZBMnYYBvoO5KJnoxqZ8IpG0SwNpiNryFXuqZy2M
         //c7WxNHauCj1fqbxZPjFip4EoGhWxz3yoTenbPD1xZYeZ5w/y7vXPKUW9ibWncMdU8y
         7nQ6zR/Px1GXOhWExwQymtzU8LPu5Tex3i6BnE7RoOZX+ltbGU5/12AZqONsgDkRNNqR
         xkSiqfwlw0MXih5dapPBb2XoQtEs5lh0VB/j0gqxbq7aI5kTBha/2SzwC1O30GxRHNjB
         lcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689561806; x=1692153806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/rbaFBr1o1WpkBGUX8CuyV0YuFTgeUPikyuIhf+EvE=;
        b=PQz/I0Hg7NVycA11HfE8SxM70W0u4PLzBrywP2o1gpZLw2zi3ODrxG6VvEY+3bU6uL
         nlYeVFrXV3U1Rk30cCDlNlEhhQtsteHs1ncCXJLkKtQ4tG8tyTtX16PxcZ83ww/gA3lK
         PSVJ0PSe5o/mR7t46POO+7AgZ9quYaQIV4MRhACNa/Md4dDltPEcXgqqK+8Y4tw1HG3Y
         6OjRA5K1e0Tf8fD3KdAtc/Or88RVJkCvzDPNeyuJL0ddvEoIN1vkUmo98sPgCkpmmjVI
         dzeCZxe5U5s9KfVEmzF+cf9AFA5Nk8DsC2YPcIGgd+Rf4Mznf9IDpFJP61BGcnUC1Xtj
         3EzA==
X-Gm-Message-State: ABy/qLb4lHGvrXhUJe665e5M+NV5rT2I3G68aPrXQ0R18sdx7nDWFjni
	oD2RDXnsvQDOEdYcUdctdZen/1i1k6GIZNSaCk4=
X-Google-Smtp-Source: APBJJlEZwMnaiTG95a3lbYA/EQ/ugxl+LiVHyTtkU1lBXW7IyUkjmLK0UnEdBRvoSdpmQOEjyU+lnRm60uohNtFUFi0=
X-Received: by 2002:a05:6512:2243:b0:4fb:9da2:6cec with SMTP id
 i3-20020a056512224300b004fb9da26cecmr7097000lfu.7.1689561806084; Sun, 16 Jul
 2023 19:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1689215889.git.chenfeiyang@loongson.cn> <be1874e517f4f4cc50906f18689a0add3594c2e0.1689215889.git.chenfeiyang@loongson.cn>
 <9e0b3466-10e1-4267-ab9b-d9f8149b6b6b@lunn.ch> <CACWXhKkX-syR01opOky=t-b8C3nhV5f_WNfCQ-kOE+4o0xh4tA@mail.gmail.com>
 <3cff46b0-5621-4881-8e70-362bb7a70ed1@lunn.ch>
In-Reply-To: <3cff46b0-5621-4881-8e70-362bb7a70ed1@lunn.ch>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Mon, 17 Jul 2023 10:43:14 +0800
Message-ID: <CACWXhKk23muXROj6OrmeFna88ViJHA_7QpQZoWiFgzEPb4pLWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] net: phy: Add driver for Loongson PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com, peppe.cavallaro@st.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, chenhuacai@loongson.cn, 
	linux@armlinux.org.uk, dongbiao@loongson.cn, 
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 12:20=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > > > +#include <linux/mii.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/netdevice.h>
> > > > +#include <linux/pci.h>
> > > > +#include <linux/phy.h>
> > > > +
> > > > +#define PHY_ID_LS7A2000              0x00061ce0
> > >
> > > What is Loongson OUI?
> > >
> >
> > Currently, we do not have an OUI for Loongson, but we are in the
> > process of applying for one.
>
> Is the value 0x00061ce0 baked into the silicon? Or can it be changed
> once you have an OUI?
>

Hi, Andrew,

The value is baked into the silicon.

> > > > +#define GNET_REV_LS7A2000    0x00
> > > > +
> > > > +static int ls7a2000_config_aneg(struct phy_device *phydev)
> > > > +{
> > > > +     if (phydev->speed =3D=3D SPEED_1000)
> > > > +             phydev->autoneg =3D AUTONEG_ENABLE;
> > >
> > > Please explain.
> > >
> >
> > The PHY itself supports half-duplex, but there are issues with the
> > controller used in the 7A2000 chip. Moreover, the controller only
> > supports auto-negotiation for gigabit speeds.
>
> So you can force 10/100/1000, but auto neg only succeeds for 1G?
>
> Are the LP autoneg values available for genphy_read_lpa() to read? If
> the LP values are available, maybe the PHY driver can resolve the
> autoneg for 10 an 100.
>

I apologize for the confusion caused by my previous description. To
clarify, the PHY supports auto-negotiation and non-auto-negotiation
for 10/100, but non-auto-negotiation for 1000 does not work correctly.

> > > > +     if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> > > > +         phydev->advertising) ||
> > > > +         linkmode_test_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> > > > +         phydev->advertising) ||
> > > > +         linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> > > > +         phydev->advertising))
> > > > +         return genphy_config_aneg(phydev);
> > > > +
> > > > +     netdev_info(phydev->attached_dev, "Parameter Setting Error\n"=
);
> > >
> > > This also needs explaining. How can it be asked to do something it
> > > does not support?
> > >
> >
> > Perhaps I missed something, but I think that if someone uses ethtool,
> > they can request it to perform actions or configurations that the
> > tool does not support.
>
> No. The PHY should indicate what it can do, via the .get_abilities()
> etc. The MAC can also remove some of those link modes if it is more
> limited than the PHY. phylib will then not allow ksetting_set() to
> enable things which are not supported. So this should not happen.  It
> would actually be a bad design, since it would force every driver to
> do such checks, rather than implement it once in the core.
>

I see.

> > > > +int ls7a2000_match_phy_device(struct phy_device *phydev)
> > > > +{
> > > > +     struct net_device *ndev;
> > > > +     struct pci_dev *pdev;
> > > > +
> > > > +     if ((phydev->phy_id & 0xfffffff0) !=3D PHY_ID_LS7A2000)
> > > > +             return 0;
> > > > +
> > > > +     ndev =3D phydev->mdio.bus->priv;
> > > > +     pdev =3D to_pci_dev(ndev->dev.parent);
> > > > +
> > > > +     return pdev->revision =3D=3D GNET_REV_LS7A2000;
> > >
> > > That is very unusual. Why is the PHY ID not sufficient?
> > >
> >
> > To work around the controller's issues, we enable the usage of this
> > driver specifically for a certain version of the 7A2000 chip.
> >
> > > > +}
> > > > +
> > > > +static struct phy_driver loongson_phy_driver[] =3D {
> > > > +     {
> > > > +             PHY_ID_MATCH_MODEL(PHY_ID_LS7A2000),
> > > > +             .name                   =3D "LS7A2000 PHY",
> > > > +             .features               =3D PHY_LOONGSON_FEATURES,
> > >
> > > So what are the capabilities of this PHY? You seem to have some very
> > > odd hacks here, and no explanation of why they are needed. If you do
> > > something which no other device does, you need to explain it.
> > >
> > > Does the PHY itself only support full duplex? No half duplex? Does th=
e
> > > PHY support autoneg? Does it support fixed settings? What does
> > > genphy_read_abilities() return for this PHY?
> > >
> >
> > As mentioned earlier, this driver is specifically designed for the PHY
> > on the problematic 7A2000 chip. Therefore, we assume that this PHY only
> > supports full- duplex mode and performs auto-negotiation exclusively fo=
r
> > gigabit speeds.
>
> So what does genphy_read_abilities() return?
>
> Nobody else going to use PHY_LOONGSON_FEATURES, so i would prefer not
> to add it to the core. If your PHY is designed correctly,
> genphy_read_abilities() should determine what the PHY can do from its
> registers. If the registers are wrong, it is better to add a
> .get_features function.
>

genphy_read_abilities() returns 0, and it seems to be working fine.
The registers are incorrect, so I will use the .get_features function
to clear some of the half-duplex bits.

Thanks,
Feiyang

>         Andrew
