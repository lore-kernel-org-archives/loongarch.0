Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F4379F7
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=osGQCoFsA115itAF/3BRNwmc8iArLh4T0+7xb0MN6Bo=; b=rZaFP+SEDm2h0rjMfKJOM3RZHB
	L1PP/QfKYymasVkkRcpz8rGmopiwUQTpQCr8YYphU6FIoTmPnxcHJtym08gVTztXdyQl9swjK7oBZ
	lTw4E8tCaPHpJOnjcAkfXO2wJIJKsJ4GaIb1zFizIjhf21xTXeCS0PvdbABWSUwYu739tivLfZAkb
	J/VRdd2LTLbhReE5tbp+HJPJ5fCxy4V8oVNGb+o9OjmIVvUKCIcsmffHke86pO8Bh+VGDHsI/KoCi
	ocwFp0dy0uJZDRugP6vOesiO2ciAJwc/X08kcq2+B9hlaPPbOPW/46BY81NQEidTd7Ol3rtc6tCbA
	XqHtfclA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41290)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qJrL8-0005zI-14;
	Thu, 13 Jul 2023 09:06:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qJrL4-0005xc-La; Thu, 13 Jul 2023 09:06:14 +0100
Date: Thu, 13 Jul 2023 09:06:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com,
	chenhuacai@loongson.cn, dongbiao@loongson.cn,
	loongson-kernel@lists.loongnix.cn, netdev@vger.kernel.org,
	loongarch@lists.linux.dev, chris.chenfeiyang@gmail.com
Subject: Re: [RFC PATCH 10/10] net: stmmac: dwmac-loongson: Add GNET support
Message-ID: <ZK+wdvepjYPigfOh@shell.armlinux.org.uk>
References: <cover.1689215889.git.chenfeiyang@loongson.cn>
 <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98b53d15bb983c309f79acf9619b88ea4fbb8f14.1689215889.git.chenfeiyang@loongson.cn>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jul 13, 2023 at 10:49:38AM +0800, Feiyang Chen wrote:
> Add GNET support. Use the fix_mac_speed() callback to workaround
> issues with the Loongson PHY.

It would be good to document what those issue(s) are, and if they are a
PHY issue, why they need to be resolved in a MAC driver rather than
using the PHY driver's link_change_notify().

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
