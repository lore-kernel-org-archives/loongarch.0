Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABCD15A7
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Pyl29dU1EZiuVHuFHANrFHYnZ0cjCvUEfE6XuSMviwI=; b=CraaLlnqJ8cBNMjQwKw+E+FIL4
	2XzGy3qdm7Ygh3jVenfsYfQJrvybY2IaERIOZDA6x/Zv1/F8+bXUWkcCLwDeCZSAaHHKSSux79Z1L
	bsHYwfPhuA7lATmxBsv5owv4dabvKBp7qFwUgdjgBYRb+vncRqeklegWcIuKWjQfvzTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oOgvO-00Dkwh-3W; Thu, 18 Aug 2022 16:55:10 +0200
Date: Thu, 18 Aug 2022 16:55:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, Feiyang Chen <chenfeiyang@loongson.cn>,
	zhangqing@loongson.cn, Huacai Chen <chenhuacai@loongson.cn>,
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
Message-ID: <Yv5SzmWsVv2G9i0v@lunn.ch>
References: <20220816102537.33986-1-chenfeiyang@loongson.cn>
 <Yv2gy3I+yLzU1dYH@lunn.ch>
 <CACWXhK=aS9Y+hWxCoE3-Y7=T+C9VyuSD_jiegviAArFde1GSWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWXhK=aS9Y+hWxCoE3-Y7=T+C9VyuSD_jiegviAArFde1GSWA@mail.gmail.com>

On Thu, Aug 18, 2022 at 01:01:09PM +0800, Feiyang Chen wrote:
> On Thu, 18 Aug 2022 at 10:15, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> > > +{
> > > +     struct net_device *ndev = (struct net_device *)(*(unsigned long *)priv);
> > > +     struct stmmac_priv *ptr = netdev_priv(ndev);
> > > +
> > > +     if (speed == SPEED_1000) {
> > > +             if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS */) {
> > > +                     /* reset phy */
> > > +                     phy_set_bits(ndev->phydev, 0 /*MII_BMCR*/,
> > > +                                  0x200 /*BMCR_ANRESTART*/);
> >
> > The MAC driver should not be accessing PHY registers. Why does the PHY
> > need a reset? Can you call phy_stop()/phy_start()?
> >
> 
> Hi, Andrew,
> 
> This is a PHY bug, I'll try other methods.

Workarounds for PHY bugs should be in the PHY driver.

Maybe you can use the .link_change_notify callback.

      Andrew
