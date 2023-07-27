Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993FE1FDD
	for <loongarch@lists.linux.dev>; Thu, 27 Jul 2023 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gUQMzQyKjcDc8bRIA4Rye4QCND40jXimAuOGpygqhkw=; b=5ixRRImxB2bwzy7gCHeIwm/wbq
	m0YRjf8ihmcT9SaxKzhGucyFHvwhLLpGi/KhmsmLL6cVtL4HUpbfdr+H9NRGMQbSw/AHSbZXCGGP5
	FN9IGi3NZMR76acEXeB2WuZNWqCMsE2nNsuuuc4eK6BYKJXIWJE8M6er6QXXgS1VBjME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qOyNW-002RTV-LB; Thu, 27 Jul 2023 12:37:54 +0200
Date: Thu, 27 Jul 2023 12:37:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v2 09/10] net: stmmac: dwmac-loongson: Add 64-bit DMA and
 multi-vector support
Message-ID: <26015def-bee6-4427-9da4-ca27de8c1d87@lunn.ch>
References: <cover.1690439335.git.chenfeiyang@loongson.cn>
 <f626f2e1b9ed10854e96963a14a6e793611bd86b.1690439335.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f626f2e1b9ed10854e96963a14a6e793611bd86b.1690439335.git.chenfeiyang@loongson.cn>

> +	case DWMAC_CORE_3_50:
> +		fallthrough;
> +	case DWMAC_CORE_3_70:

You don't need fallthrough here.

    Andrew
