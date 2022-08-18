Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03BC15AE
	for <loongarch@lists.linux.dev>; Thu, 18 Aug 2022 02:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NvKfFN11W0HjsiAnViz6ptiRNsKhivEHDDZZsK3mIeg=; b=SzpZjuHp9wP6OViLF/o2m+SRyJ
	CipeSQ4yPcjdRJ2W78JBemt5i/R+f1Gaoxd59RKOUhcNac3uPp5e4UQYbuWL+y6XgqUX1IH+GcADW
	TaFynQr/YOSuhmZ0hwU7sYkxIhFCFJWcFScZBUJysr+rBR2/ByQEoEyQjI/pPkO1bMKQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oOV4N-00Dh8m-NP; Thu, 18 Aug 2022 04:15:39 +0200
Date: Thu, 18 Aug 2022 04:15:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, Feiyang Chen <chenfeiyang@loongson.cn>,
	zhangqing@loongson.cn, chenhuacai@loongson.cn,
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
Message-ID: <Yv2gy3I+yLzU1dYH@lunn.ch>
References: <20220816102537.33986-1-chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816102537.33986-1-chenfeiyang@loongson.cn>

> +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> +{
> +	struct net_device *ndev = (struct net_device *)(*(unsigned long *)priv);
> +	struct stmmac_priv *ptr = netdev_priv(ndev);
> +
> +	if (speed == SPEED_1000) {
> +		if (readl(ptr->ioaddr + MAC_CTRL_REG) & (1 << 15) /* PS */) {
> +			/* reset phy */
> +			phy_set_bits(ndev->phydev, 0 /*MII_BMCR*/,
> +				     0x200 /*BMCR_ANRESTART*/);

The MAC driver should not be accessing PHY registers. Why does the PHY
need a reset? Can you call phy_stop()/phy_start()?

     Andrew
