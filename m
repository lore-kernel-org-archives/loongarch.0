Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75432C681;
	Sat, 16 Dec 2023 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eXZGywpj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ixhx6WvH8Syc80mMeRWCVgpohgczXdvY1NV4I9TIvsw=; b=eXZGywpjpZLXl5bSBE8DRYTRG1
	jk40d17DQiH6y4fYt1NiLMcWee1V5K//1R2YQGtkNvuP2a3TxxQq4e1pR0H49t+vET3tbg4cJW1VO
	3ZcKuSsaTLmEjUQ8AUMZeFPLE5IW3BGKLawaVyZZAttBDLR9UDSErelQR/RnQQcUgvvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rEUI9-0036CU-B4; Sat, 16 Dec 2023 14:01:17 +0100
Date: Sat, 16 Dec 2023 14:01:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	fancer.lancer@gmail.com, Jose.Abreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk,
	guyinggang@loongson.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v6 1/9] net: stmmac: Pass stmmac_priv and chan in some
 callbacks
Message-ID: <759f33f0-e75a-406b-9318-272e50f2ec3b@lunn.ch>
References: <cover.1702458672.git.siyanteng@loongson.cn>
 <361389e731d14e3e2094f6ff5501597e9f762f34.1702458672.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <361389e731d14e3e2094f6ff5501597e9f762f34.1702458672.git.siyanteng@loongson.cn>


> -static void sun8i_dwmac_enable_dma_transmission(void __iomem *ioaddr)
> +static void sun8i_dwmac_enable_dma_transmission(void __iomem *ioaddr, u32 chan)


>  
> -	stmmac_enable_dma_transmission(priv, priv->ioaddr);
> +	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);

As i've said a few times, i don't know this driver.

Is it a queue or is it a chan? Is this change consistent with the
reset of the code base?

      Andrew
