Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA2423BF1
	for <loongarch@lists.linux.dev>; Thu,  3 Aug 2023 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jCAiSqaGsyEXa1saYHFC6ILd7caWomJV0vmU/Co95go=; b=oHoffxjPgEK2XvtWGF3dqqI5Ul
	UFyFK3spxyTbQAf62BCTcK0dOTMtUSP/M9KXLggvtFBzljGxWz8vISUXOXJDU/OKM5Zu8uDhkKryF
	QO8/8hIisPdM0SCw5ZpCCtGNyFxb3YsoOqOUSUxqTSj80n78n5IhSgzkKCDnpW1BnVDE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qRaT3-00302X-LV; Thu, 03 Aug 2023 17:42:25 +0200
Date: Thu, 3 Aug 2023 17:42:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [PATCH v3 13/16] net: stmmac: dwmac-loongson: Add 64-bit DMA and
 multi-vector support
Message-ID: <9d13989c-fc79-404c-a88b-94e5ed7f97d0@lunn.ch>
References: <cover.1691047285.git.chenfeiyang@loongson.cn>
 <48ceed6b5d7b32c2e46b79fa597466b9212f745e.1691047285.git.chenfeiyang@loongson.cn>
 <ZMu3wTCzffo1EgNY@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMu3wTCzffo1EgNY@shell.armlinux.org.uk>

> > +static u32 get_irq_type(struct device_node *np)
> > +{
> > +	struct of_phandle_args oirq;
> > +
> > +	if (np && of_irq_parse_one(np, 0, &oirq) == 0 && oirq.args_count == 2)
> > +		return oirq.args[1];
> > +
> > +	return IRQF_TRIGGER_RISING;
> > +}
> > +
> 
> I do wish that there was some IRQ maintainer I could bounce this over to
> for them to comment on, because I don't believe that this should be
> necessary in any driver - the irq subsystem should configure the IRQ
> accordingly before the driver is probed.

I agree with you, this is very likely to be wrong.

Feiyang, please look at other drivers and copy with they do.

	Andrew
