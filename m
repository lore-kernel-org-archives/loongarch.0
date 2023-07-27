Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E55FBEF
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X/k/8uLCIMHfS1bCGkd3PvnH4U8zm3GAOxOGXyOeA6k=; b=AaFjLqdraeEC9g+wiI2LNdmRr/
	lPnSh1XJCI9NUSm8RT2bYxT9CDxnFo7N+B9grAYnZeUQaU3zluOlGjW3Pz/HJGkdNuNZH7DGXjEjZ
	vYP4N0hExAtnHHiGCGS6ZgS6/af6UkzqcNDV3JtkJrtC1hjcPqVrCCSjwQ6UTso4TQ/I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOx0Z-002RAa-TD; Thu, 27 Jul 2023 11:10:07 +0200
Date: Thu, 27 Jul 2023 11:10:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 02/10] net: stmmac: dwmac1000: Allow platforms to
 choose some register offsets
Message-ID: <5b52d461-77e5-493a-a634-4c8a0637a0bc@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <067f87d9785849c13f2f8733d457ffe8616a1aa0.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <067f87d9785849c13f2f8733d457ffe8616a1aa0.1690439335.git.chenfeiyang@loongson.cn>

> +#define _REGS			(priv->plat->dwmac_regs)
>  
> -/* Rx watchdog register */
> +/* DMA CRS Control and Status Register Mapping */
> +#define DMA_CHAN_OFFSET		(_REGS->addrs->chan_offset)

It is thought to be bad practice for a macro to access things not
passed to it. Please try to make a cleaner solution.

       Andrew
