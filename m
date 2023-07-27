Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1D14A85
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lCe4RRqO2UyXfwpfBhCVdTGQbnmteKhj+Lqc+YcZMCw=; b=naRjE6F2uiLpQl3Y68DZyR26Mh
	WKs/xojA/ftXqj+ae6lJufjBBz1JCwNMtgUEDJ7NYR5hIsBjGqecgHWaLtYcjyr3C7/hJtSqbwKZg
	VDsiXRAxv1+oarJzVM7G05NLLf/wgRs1YfAJoxkxHr/yxpk7/xmloUsZSCfiIRi9ZRjw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOySl-002RVp-28; Thu, 27 Jul 2023 12:43:19 +0200
Date: Thu, 27 Jul 2023 12:43:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 10/10] net: stmmac: dwmac-loongson: Add GNET support
Message-ID: <4a59ba65-a4f2-4cd1-8bfe-2ae3e4d0a778@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <20aa37fdfd4b03b9614befe1c8f78ffc0ac5dead.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20aa37fdfd4b03b9614befe1c8f78ffc0ac5dead.1690439335.git.chenfeiyang@loongson.cn>

> +static void loongson_gnet_fix_speed(void *priv, unsigned int speed)
> +{
> +	struct net_device *ndev = (struct net_device *)(*(unsigned long *)priv);

priv is a void *, so you don't need any casts.

     Andrew
