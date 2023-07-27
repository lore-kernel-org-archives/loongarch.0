Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C11FDD
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bl78Tq6a6qufkM1Ok03PUmnHbqshN4ZqLWgn47tc/Pk=; b=o08IEbS97okEP/CacoZindUoSu
	n2npWoYj8Ax90FK1i+sKenFYAYJFmpU9CkEndHjJacFGToK9WIomorUSurxEwzV7dHjvSkc4BZcbT
	KJSwsu//gGQuvziYJbEWc+2k11TGp8c9MIIV8h/HgO1pKSeGV3S9ZHMnfFF8i1eenImc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOyLL-002RRz-JH; Thu, 27 Jul 2023 12:35:39 +0200
Date: Thu, 27 Jul 2023 12:35:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 07/10] net: stmmac: dwmac-loongson: Add LS7A support
Message-ID: <9add374b-27ba-47c9-95cf-eec896231d58@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <dd88ed0f53e9ee0f653ddeb78b326f8eb44bdbd1.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd88ed0f53e9ee0f653ddeb78b326f8eb44bdbd1.1690439335.git.chenfeiyang@loongson.cn>

> +static int loongson_dwmac_probe(struct pci_dev *pdev,
> +				const struct pci_device_id *id)
>  {
> +	int ret, i, bus_id, phy_mode;
>  	struct plat_stmmacenet_data *plat;
> +	struct stmmac_pci_info *info;
>  	struct stmmac_resources res;
>  	struct device_node *np;
> -	int ret, i, phy_mode;
> -
> -	np = dev_of_node(&pdev->dev);
> -
> -	if (!np) {
> -		pr_info("dwmac_loongson_pci: No OF node\n");
> -		return -ENODEV;
> -	}
> -
> -	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
> -		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
> -		return -ENODEV;
> -	}

There are a lot of changes here, and it is not easy to review.  I
would suggest you first do a refactoring patch, moving all handling of
DT into a helper. Since it is just moving code around, it should be
easy to review. Then you can add support for platforms which don't
support DT.

	Andrew
