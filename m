Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255721C08
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 04:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=6skC+RvlbgbyR/EKdDhgXCrauBUUoVWMmNI+FpROXw0=; b=ZA
	QyujDuQ1sfGmafrrfcCvd+rhP1K79PCc4emzpotEiNGyElG2pxWRkWQ5n6bFQ5H/5Nim+TUs2Y7Kn
	1JwQmMboyuXj+Up9jUj8UjEV1nxIcTKDPkN/fzD/itB0saKjXwNLc5wM8gw0h9gSwHf/dpCuEhLtC
	uo+afiQttGL5zdw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qKANi-001Jhl-KJ; Fri, 14 Jul 2023 06:26:14 +0200
Date: Fri, 14 Jul 2023 06:26:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Feiyang Chen <chenfeiyang@loongson.cn>, hkallweit1@gmail.com,
	peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
	dongbiao@loongson.cn, loongson-kernel@lists.loongnix.cn,
	netdev@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
Message-ID: <f50469a6-74ed-44bc-a2aa-fafdec717cc3@lunn.ch>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
 <e491227b-81a1-4363-b810-501511939f1b@lunn.ch>
 <CACWXhKmLRK5aGNwDyt5uc0TK8ZXZKuDQuSXW6jku+Ofh73GUvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACWXhKmLRK5aGNwDyt5uc0TK8ZXZKuDQuSXW6jku+Ofh73GUvw@mail.gmail.com>

On Fri, Jul 14, 2023 at 10:24:37AM +0800, Feiyang Chen wrote:
> On Thu, Jul 13, 2023 at 12:07 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Thu, Jul 13, 2023 at 10:49:38AM +0800, Feiyang Chen wrote:
> > > Add GNET support. Use the fix_mac_speed() callback to workaround
> > > issues with the Loongson PHY.
> >
> > What are the issues?
> >
> 
> Hi, Andrew,
> 
> There is an issue with the synchronization between the network card
> and the PHY. In the case of gigabit operation, if the PHY's speed
> changes, the network card's speed remains unaffected. Hence, it is
> necessary to initiate a re-negotiation process with the PHY to align
> the link speeds properly.

When the line side speed changes, the PHY will first report link down
via the adjust_link callback in the MAC driver. Once the PHY has
determined the new speed, the adjust_link callback will be called
again with the new speed and pause parameters.

So what is actually going wrong?

   Andrew
