Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838ACD53A
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 09:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NNYjr6C/L3AxVJvlXu3m2LHHOFUyZCqisK6Cck6tx70=; b=xL/GaOMgqEMQ6nz6TlR246ePpK
	g0039Xcn4ZL8fSdpqkLjK0BHUtMaU5ck2eOVX9dJgUbikY9HR/ou4RF0criGGFkHubfGbBO8Rmvuc
	S4mjkA/Y+b+LYdiXNiJnCr9uXPVfu00nvlwIL5y+oPABLHpyWagfuOQj6McjCwvra5xs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOwrn-002R78-Ha; Thu, 27 Jul 2023 11:01:03 +0200
Date: Thu, 27 Jul 2023 11:01:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 03/10] net: stmmac: dwmac1000: Add multi-channel
 support
Message-ID: <51338bc8-92b0-4aab-92f8-1e5d178b05d7@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <373259d4ac9ac0b9e1e64ad96d60a9bbd35b85aa.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <373259d4ac9ac0b9e1e64ad96d60a9bbd35b85aa.1690439335.git.chenfeiyang@loongson.cn>

On Thu, Jul 27, 2023 at 03:15:46PM +0800, Feiyang Chen wrote:
> Some platforms have dwmac1000 implementations that support multi-
> channel. Extend the functions to add multi-channel support.
> 
> +	priv->plat->dwmac_is_loongson = false;

I don't know this driver, so my comments could be wrong...

Is this specific to loongson, or multi-channel? If you look at the
other bool in plat, they are all for features, not machines? Could
this actually be called priv->multi_chan_en ?

     Andrew
