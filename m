Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752D34C7E
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 04:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kgZWFSVDiDmk6YDdDdf49KaPkLtd1ObXt9w/aSKaZ3w=; b=mSN5k4UE9yXCufhi9yYBDqp8wW
	qpjynSl2hgGKF+vaoplyfw1LxzDz9Vn11lGy3Qevgykl2NZnUE80HVmNc4pmuS0sZ0eynGLHlmlOz
	X1cJXzaXPH0y5QwWqAgKIg2oPssTLlGjLb948FLcBH/rV/3M3o4TJYuZ9z/JIWjZZYv0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qKAHe-001JfI-8R; Fri, 14 Jul 2023 06:19:58 +0200
Date: Fri, 14 Jul 2023 06:19:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
	dongbiao@loongson.cn, loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 01/10] net: phy: Add driver for Loongson PHY
Message-ID: <3cff46b0-5621-4881-8e70-362bb7a70ed1@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <be1874e517f4f4cc50906f18689a0add3594c2e0.1689215889.git.chenfeiyang@loongson.cn>
 <9e0b3466-10e1-4267-ab9b-d9f8149b6b6b@lunn.ch>
 <CACWXhKkX-syR01opOky=t-b8C3nhV5f_WNfCQ-kOE+4o0xh4tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWXhKkX-syR01opOky=t-b8C3nhV5f_WNfCQ-kOE+4o0xh4tA@mail.gmail.com>

> > > +#include <linux/mii.h>
> > > +#include <linux/module.h>
> > > +#include <linux/netdevice.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/phy.h>
> > > +
> > > +#define PHY_ID_LS7A2000              0x00061ce0
> >
> > What is Loongson OUI?
> >
> 
> Currently, we do not have an OUI for Loongson, but we are in the
> process of applying for one.

Is the value 0x00061ce0 baked into the silicon? Or can it be changed
once you have an OUI?

> > > +#define GNET_REV_LS7A2000    0x00
> > > +
> > > +static int ls7a2000_config_aneg(struct phy_device *phydev)
> > > +{
> > > +     if (phydev->speed == SPEED_1000)
> > > +             phydev->autoneg = AUTONEG_ENABLE;
> >
> > Please explain.
> >
> 
> The PHY itself supports half-duplex, but there are issues with the
> controller used in the 7A2000 chip. Moreover, the controller only
> supports auto-negotiation for gigabit speeds.

So you can force 10/100/1000, but auto neg only succeeds for 1G?

Are the LP autoneg values available for genphy_read_lpa() to read? If
the LP values are available, maybe the PHY driver can resolve the
autoneg for 10 an 100.

> > > +     if (linkmode_test_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> > > +         phydev->advertising) ||
> > > +         linkmode_test_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> > > +         phydev->advertising) ||
> > > +         linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> > > +         phydev->advertising))
> > > +         return genphy_config_aneg(phydev);
> > > +
> > > +     netdev_info(phydev->attached_dev, "Parameter Setting Error\n");
> >
> > This also needs explaining. How can it be asked to do something it
> > does not support?
> >
> 
> Perhaps I missed something, but I think that if someone uses ethtool,
> they can request it to perform actions or configurations that the
> tool does not support.

No. The PHY should indicate what it can do, via the .get_abilities()
etc. The MAC can also remove some of those link modes if it is more
limited than the PHY. phylib will then not allow ksetting_set() to
enable things which are not supported. So this should not happen.  It
would actually be a bad design, since it would force every driver to
do such checks, rather than implement it once in the core.

> > > +int ls7a2000_match_phy_device(struct phy_device *phydev)
> > > +{
> > > +     struct net_device *ndev;
> > > +     struct pci_dev *pdev;
> > > +
> > > +     if ((phydev->phy_id & 0xfffffff0) != PHY_ID_LS7A2000)
> > > +             return 0;
> > > +
> > > +     ndev = phydev->mdio.bus->priv;
> > > +     pdev = to_pci_dev(ndev->dev.parent);
> > > +
> > > +     return pdev->revision == GNET_REV_LS7A2000;
> >
> > That is very unusual. Why is the PHY ID not sufficient?
> >
> 
> To work around the controller's issues, we enable the usage of this
> driver specifically for a certain version of the 7A2000 chip.
> 
> > > +}
> > > +
> > > +static struct phy_driver loongson_phy_driver[] = {
> > > +     {
> > > +             PHY_ID_MATCH_MODEL(PHY_ID_LS7A2000),
> > > +             .name                   = "LS7A2000 PHY",
> > > +             .features               = PHY_LOONGSON_FEATURES,
> >
> > So what are the capabilities of this PHY? You seem to have some very
> > odd hacks here, and no explanation of why they are needed. If you do
> > something which no other device does, you need to explain it.
> >
> > Does the PHY itself only support full duplex? No half duplex? Does the
> > PHY support autoneg? Does it support fixed settings? What does
> > genphy_read_abilities() return for this PHY?
> >
> 
> As mentioned earlier, this driver is specifically designed for the PHY
> on the problematic 7A2000 chip. Therefore, we assume that this PHY only
> supports full- duplex mode and performs auto-negotiation exclusively for
> gigabit speeds.

So what does genphy_read_abilities() return?

Nobody else going to use PHY_LOONGSON_FEATURES, so i would prefer not
to add it to the core. If your PHY is designed correctly,
genphy_read_abilities() should determine what the PHY can do from its
registers. If the registers are wrong, it is better to add a
.get_features function.

	Andrew
