Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B097461
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tgeW2jStuSWXSnHecKS+Wr+nGK64USUz9Vn9EpmKdpo=; b=LmKyvJpZBEet9pbzfiN2BDlkPP
	EE4OZHpOojwIbTZ7/sX5ifmMTjAN+nU94VxAInLz2O66TxHo08pvcoQtuTltXZjlNtFVbkH4C96Xe
	gkqYhY3hsb0ajzWdej76QBSsgHcW5izhnQ75cq4v32VpCKwNFyxryLbhsypc0pOG9tZO4h5a+gTPD
	8sHrBWaIqf9dERGfjI/GGW7ulgjTApqLq8m8qjxdDngbbEiBRF/c0H/yQl+rmInZiND/5aKQKxuVD
	yh8UKvWvy8Lmrt9xer7/Tu/uKc56Jduh6dmmvtQ4jjO9gpkBWc/0cP5ZZPr7CLXfwISKJaUtPZwWm
	UqTdtHcg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45454)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qKEKW-0000Hf-2m;
	Fri, 14 Jul 2023 09:39:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qKEKS-00073F-10; Fri, 14 Jul 2023 09:39:08 +0100
Date: Fri, 14 Jul 2023 09:39:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
	hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
Message-ID: <ZLEJq1G5+7I+FsPo@shell.armlinux.org.uk>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
 <CACWXhKkUJCFV8DKeAOGPQCfkn8mBhZvBJBMM8SYVgVKY8JEyRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACWXhKkUJCFV8DKeAOGPQCfkn8mBhZvBJBMM8SYVgVKY8JEyRw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Jul 14, 2023 at 10:16:07AM +0800, Feiyang Chen wrote:
> On Thu, Jul 13, 2023 at 12:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Thu, Jul 13, 2023 at 10:46:52AM +0800, Feiyang Chen wrote:
> > > Add driver for Loongson PHY. Extend stmmac functions and macros for
> > > Loongson DWMAC. Add LS7A support for dwmac_loongson.
> >
> > Why is this RFC? What do you actually want comment on?
> >
> 
> Hi, Andrew,
> 
> I marked this patch series as an RFC because I believe it involves
> significant changes to the dwmac1000 driver. I want comments on the
> design and any alternative suggestions.

That is admirable, but in practice, I've found that posting RFCs is
a waste of effort and time - basically, it seems people ignore
patches posted as RFC.

This turns the whole thing when posting patches into basically what
I'd summarise as "reviewer blackmail" - post the patches non-RFC
even when you want only comments, and reviewers _have_ to comment on
the patches if there's something they don't like to prevent them
being merged.

It's sad that it comes to that, but that is the reality of how things
appear to work.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
