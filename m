Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B73D25A3
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502235; cv=none; b=BonIncRkrR0tGlOcCvQnKyw6mWPQgCjmxSUstODNio3Qzfqfa4z84mMwY76udNxW1JrHC+MZqEEI2uPM1G+iry4/4bsnKesncAJoAZzOcLibl+cdsEhGz8dcLnrlXneMN59B/nLOwHIIZU++ZEX77brHyh+wKfhmG0Gtfd3q/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502235; c=relaxed/simple;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYDDMhKYdSK6s8oDhs1mA7GvfSqBitaNdzPROgP6c6PLoJQiyIbB9Qi2SXYHjT0BEzPcN5ikLbiG/vucGylSuhuw8HiDxqrMwGC5nChRoH9UBtq2Ag5EGCOLdtemP0NLU6Af3+SqlDB/HjIn3Bq5XMYVPk7ynVdlpZoyKB92Ndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Qlh21qXJ; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=SHPqSPvt; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Qlh21qXJ";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="SHPqSPvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502232;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qlh21qXJ2O59K1pfOB18Y10F8Nz3tAa2Dk5h4nLgrEku/9IA2SPOeOxlzsZH1IVZz
	 PA/t+jAyDRsebrOQpA8Iw1ZAvxZxDJ6cl3abRxXu2rQxBMipZcxv8uT7u3pqm26iDE
	 tUSIcpwpxstWUrW4a18OnXVmTGLUzhEnx0zKi8h6+SSZdpCaOUI3g9HORMwc4hd/n0
	 yayalO8eZK6ud1mzyDyCynWbkGEhTqdnZVy5pH+exfoY7ojs8yTi/ZjmeHluv5jxJf
	 e70fF/DYwllkEozZlluWTIIxLnlNk4q5/FCaWCZd6AQGfSmlAFPkKN7xV9l9GYLU27
	 KvQYpIAxOC5Nw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id E9DA941338; Sun, 27 Sep 2026 09:43:52 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502221;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SHPqSPvtXhSCoUC+asK6nyirI1+TvaJlrdnfwWr4L/yFw7YNGdwfEQjfPHX0dBHuD
	 +twA3b9dp3FrF4Upz8bcMJem8nUlYaVJR/RL7oAGix8FW3OPByut6/1+k+YSchot6h
	 kcfgX+fNoXHdGyrjmAY2GDcI1J8nb0SrQ9a6Q2hswna0YtwR6ubKit9wm341eIAfTk
	 guP+Gph4ZMvx+JoMmfpD6W6hfuUqEj7x1NzXJLz5j7y7BFv2eIxYig5VoI6vcUh0f2
	 EiTU5Q5OK4bxnvU5A4mBpvz5crmh+LFzcDtZCpvrx9S7EkFbUJY3T1dL2GYVnqJtez
	 vhOhb6OKmsSrg==
Received: from AMDDesktop.lan (p5798b961.dip0.t-ipconnect.de [87.152.185.97])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 87A6841308;
	Sun, 27 Sep 2026 09:43:41 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 27 Sep 2026 11:43:44 +0200
Subject: [PATCH net-next v13 06/14] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-ax88179a-v13-6-4fac6b3e032e@birger-koblitz.de>
References: <20260927-ax88179a-v13-0-4fac6b3e032e@birger-koblitz.de>
In-Reply-To: <20260927-ax88179a-v13-0-4fac6b3e032e@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A uses a simple HW configuration for EEE
via a single EEE configuration register without LPI timer support
Add support for setting this EEE enable/disable register in implementations
of mac_enable_tx_lpi/mac_disable_tx_lpi.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179a_devices.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index b15eddb0ebe290fcd6da7653afec19918a47717a..96748ca49743dcaef71bbf649a543508be01b8e6 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -395,10 +395,27 @@ static void ax88179a_mac_link_up(struct phylink_config *config,
 			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
 }
 
+static void ax88179a_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
+}
+
+static int ax88179a_mac_enable_tx_lpi(struct phylink_config *config, u32 timer, bool tx_clk_stop)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	/* AX88179A does not provide LPI timer registers */
+	return ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, true, 0, NULL);
+}
+
 static const struct phylink_mac_ops ax88179a_phylink_mac_ops = {
 	.mac_config = ax88179a_mac_config,
 	.mac_link_down = ax88179a_mac_link_down,
 	.mac_link_up = ax88179a_mac_link_up,
+	.mac_disable_tx_lpi = ax88179a_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = ax88179a_mac_enable_tx_lpi,
 };
 
 static int ax88179a_phylink_setup(struct usbnet *dev)

-- 
2.47.3

