Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931719891
	for <loongarch@lists.linux.dev>; Fri,  4 Aug 2023 20:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gsTp/8RqKjRXhoBtimhZThHQUikCRunY6gzHuzVbGzQ=; b=brHYBWvTNp//ZgB/+R2OVoXzTD
	BtmZYCW8QaUeyF5cI9bIYVwLSb1AtkdQ4Az/v7ounPcwDwg+ttfkLEGctU8weBzkcDQ8CUpj0tfGq
	yknXf7Sl6PKtEB+e0vchejunphmheqt84cg+D5CH7Zkfe1qChzQ54juUTS0Da8mMtkya8KCyI2XSC
	732BayLSJkcrgtYy9LfCRbMFKL9X7sq41CVNeGlz26JY450wx/BYket9TpsqrDm2pJP1VAcHE8V/q
	9K3Yy/ygj4FRCtNjbVVpm3nMKQjRxPf7wAeoLZmS9KinbXbZh1jwDPfsz+wpNMkMMEpDUweRMaBLm
	IzizfEKA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55502)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qS1Z9-0000i2-07;
	Fri, 04 Aug 2023 21:38:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qS1Z4-0004I9-Hn; Fri, 04 Aug 2023 21:38:26 +0100
Date: Fri, 4 Aug 2023 21:38:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v3 14/16] net: stmmac: dwmac-loongson: Disable flow
 control for GMAC
Message-ID: <ZM1hwjttrnM8jFXJ@shell.armlinux.org.uk>
References: <cover.1691047285.git.chenfeiyang@loongson.cn>
 <021e4047c3b0f2c462e1aa891e25ae710705ed29.1691047285.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021e4047c3b0f2c462e1aa891e25ae710705ed29.1691047285.git.chenfeiyang@loongson.cn>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Aug 03, 2023 at 07:30:35PM +0800, Feiyang Chen wrote:
> +
> +		if (priv->plat->disable_flow_control) {
> +			phy_support_sym_pause(dev->phydev);
> +			phy_set_sym_pause(dev->phydev, false, false, true);
> +		}

Given that stmmac uses phylink, control over the PHY is given over to
phylink to manage on the driver's behalf. Therefore, the above is not
very useful.

The correct way to deal with this is via
	priv->phylink_config.mac_capabilities

in stmmac_phy_setup().

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
