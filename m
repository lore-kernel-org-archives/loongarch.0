Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052008C06
	for <loongarch@lists.linux.dev>; Sun, 16 Jul 2023 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=hDT0AFQ9RwSzks8zRpKekZUactN+gmOF61fTYC5WvDs=; b=Yg
	sYhpACB0H+vyD7abljklBbI/G/UoU5cxoUVSsxfyYlqeXZYMsv0sdkdQ9yPrmoumCv3SnWGV9dpIq
	jBiQ3cqCjnk85InU+AQzflrRfHhVJRHX9TNX/7RXN4ZPCKQPJFseo8JnuTYDd8AMrc1Vz+3qgfH3D
	0OUPZWRhvRQSB7k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qL3DK-001UEz-Gl; Sun, 16 Jul 2023 16:59:10 +0200
Date: Sun, 16 Jul 2023 16:59:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Feiyang Chen <chris.chenfeiyang@gmail.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 00/10] net: phy/stmmac: Add Loongson platform support
Message-ID: <bf0299ea-93d2-43e0-be9f-2d8786678b9a@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <2e10d9d1-e963-41fe-b55b-8c19c9c88bd5@lunn.ch>
 <CACWXhKkUJCFV8DKeAOGPQCfkn8mBhZvBJBMM8SYVgVKY8JEyRw@mail.gmail.com>
 <ZLEJq1G5+7I+FsPo@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLEJq1G5+7I+FsPo@shell.armlinux.org.uk>

On Fri, Jul 14, 2023 at 09:39:07AM +0100, Russell King (Oracle) wrote:
> On Fri, Jul 14, 2023 at 10:16:07AM +0800, Feiyang Chen wrote:
> > On Thu, Jul 13, 2023 at 12:09 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Thu, Jul 13, 2023 at 10:46:52AM +0800, Feiyang Chen wrote:
> > > > Add driver for Loongson PHY. Extend stmmac functions and macros for
> > > > Loongson DWMAC. Add LS7A support for dwmac_loongson.
> > >
> > > Why is this RFC? What do you actually want comment on?
> > >
> > 
> > Hi, Andrew,
> > 
> > I marked this patch series as an RFC because I believe it involves
> > significant changes to the dwmac1000 driver. I want comments on the
> > design and any alternative suggestions.
> 
> That is admirable, but in practice, I've found that posting RFCs is
> a waste of effort and time - basically, it seems people ignore
> patches posted as RFC.
> 
> This turns the whole thing when posting patches into basically what
> I'd summarise as "reviewer blackmail" - post the patches non-RFC
> even when you want only comments, and reviewers _have_ to comment on
> the patches if there's something they don't like to prevent them
> being merged.
> 
> It's sad that it comes to that, but that is the reality of how things
> appear to work.

I have to agree with Russell. You wanted comments on the dwmac1000
patches, but all you received where comments on the PHY parts. Maybe
if you had requested comments on the MAC driver changes, somebody
might of commented, but i doubt it.

RFC seems best used during the merge window, and when you know the
target audience well enough to know they will look at the patches even
when it does have RFC.

     Andrew
