Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36154D53A
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9gqk7BP5D/gYIjp96E7iKBj+3EAeBvpuuNNlMCOos/c=; b=rmfHGrkPEnh9wyv4uZj+vHkAa6
	SzvzTwev4/Nf+Y1pBacqLXYTZfrd/5acSG8CdwgzJKI5AP8FH9p+ec9Z8ZxUTvehfx8y5riuqgSso
	RedqShUU35qwYWltFrk+6CnvSvZVTypFmcyEQMK6zcIc86JcdwFb2ekOTxr2kYUacmOI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOwwj-002R8T-3e; Thu, 27 Jul 2023 11:06:09 +0200
Date: Thu, 27 Jul 2023 11:06:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 04/10] net: stmmac: dwmac1000: Add 64-bit DMA support
Message-ID: <677d06af-eb83-4e11-9519-8f3606b97854@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <74a7f82d516836ba53edae509b561f50b441dd63.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74a7f82d516836ba53edae509b561f50b441dd63.1690439335.git.chenfeiyang@loongson.cn>

On Thu, Jul 27, 2023 at 03:15:47PM +0800, Feiyang Chen wrote:
> Some platforms have dwmac1000 implementations that support 64-bit
> DMA. Extend the functions to add 64-bit DMA support.

I wounder if it would be cleaner to implement a new struct
stmmac_dma_ops for 64 bit DMA support?

	Andrew
