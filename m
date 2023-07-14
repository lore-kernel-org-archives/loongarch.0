Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72F6D3F
	for <loongarch@lists.linux.dev>; Fri, 14 Jul 2023 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UDJewWYcEeJZnjMf8M0jQDqFbjUDAXj3G8pl/YBv3qc=; b=0sIdpWnFuzPSnbx8/EzZMlZ2Wi
	Xx9sKH10DvSKaR0UWV+99UEvZvNsITYr9cG63+diBXL3NRRZN7TnHx/R+3vJ51gx33kz+VKhWIGgb
	RfcJQNSVV62bTGDQjv+TKIGsxEqN7x4HSy2SS4swmg7oHo8i1i97DMp21a1W9szuDXGJ7R9TtBTsN
	RS97qH7cB3IzRuHuwTd3zxh1JtyZZKh1aGdJkFMoMpTgW+FT/8FZPw772a+Qxf5DfBZXCI0ODERhl
	hjURwEiuis304s5ali+VB35gymO+Z0Mx/WcNGhTied+k9lb3MHG+XuZEdna2KCAGFrIX+PMNrsbMg
	vwPgnQkg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40442)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qKEQH-0000If-0b;
	Fri, 14 Jul 2023 09:45:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qKEQF-00074D-7H; Fri, 14 Jul 2023 09:45:07 +0100
Date: Fri, 14 Jul 2023 09:45:07 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
	hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
Message-ID: <ZLELE5ysytsynpjr@shell.armlinux.org.uk>
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
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

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

Please could you explain a bit more what happens when "the PHY's speed
changes". Are you suggesting that:

You have a connection where the media side has negotiated 1G speed.
The gigabit partner is disconnected, so the link goes down, and is then
replaced by a partner only capable of 100M. The link comes back up at
100M, but the network card continues trying to operate at 1G?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
