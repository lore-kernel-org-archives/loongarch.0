Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA1468C
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3+ufFCVRkF3iZYTHYJyjgWqPmSlBWrJ/mMYuOXxUKNY=; b=rAyP4o8nGUKmaOmPS6YaAE2uL0
	JrKQVOhnIlTKJMUSTMtxbUXSRvC8KuCEaKcnDHdzyNRh/qbB9PbZYxS8eqQhEWKuDyVkcgYRvuyqX
	dxMAdkZDKE/JEo+3i4DPO2+g1Dr8GPYA5j+WOYxHBZdtjpdkII8L610zyuzTWO4QWd5Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qJndl-001CXW-UV; Thu, 13 Jul 2023 06:09:17 +0200
Date: Thu, 13 Jul 2023 06:09:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, linux@armlinux.org.uk, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
Message-ID: <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1689215889.git.chenfeiyang@loongson.cn>

On Thu, Jul 13, 2023 at 10:46:52AM +0800, Feiyang Chen wrote:
> Add driver for Loongson PHY. Extend stmmac functions and macros for
> Loongson DWMAC. Add LS7A support for dwmac_loongson.

Why is this RFC? What do you actually want comment on?

    Andrew
