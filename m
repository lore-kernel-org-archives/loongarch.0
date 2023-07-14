Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1F053A2
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 04:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mbYPepi17uOpgEAVyis+G92QB7nvZZ8+bXPkemIXm+U=; b=AOm/KcmrK+JyRIRUKHBETllUtE
	78hUr0s84HP8a3ItvmTO/Yp+ngML0vbJtlYS6qe2yeiNsYRds3/gKstKX7SZinGIEqWygEwxSMsHD
	v7DOEqEYkp+7SiJnYAHYhoCH/C/ahN0Ty9tRMpb0kX9qoxExdCMe2hpF3BBScQzDmfdc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qKAJq-001JgI-So; Fri, 14 Jul 2023 06:22:14 +0200
Date: Fri, 14 Jul 2023 06:22:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
Message-ID: <7d4f2e43-bb38-44cf-91a0-dbe1116e6a87@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
 <ZK+wdvepjYPigfOh@shell.armlinux.org.uk>
 <CACWXhKmPgiPXKJiBJjcAtWbY6Agb55XjqwDKdgiJuP5Se4r4Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACWXhKmPgiPXKJiBJjcAtWbY6Agb55XjqwDKdgiJuP5Se4r4Yw@mail.gmail.com>

> Hi, Russell,
> 
> There is an issue with the synchronization between the network card
> and the PHY.

Details. We need the details in order to tell you the best workaround
for your broken hardware.

I believe that I am unable to access certain bits of the
> network card's registers within the PHY driver.

The PHY driver and the MAC driver should never access each others
registers.

	Andrew
