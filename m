Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610836655D
	for <loongarch@lists.linux.dev>; Fri,  2 Oct 2026 04:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916494; cv=none; b=dygBwAVjv2VXqefIGgfBt1WAetLezuX9jB0GFAA+2krE/NN6JSqHOEoHdK0lnM8d/GmSpO+XSYUCs8nafytoQ9LK7EdrRwhsTaloK6SsHo+IlZ8i+v5CCg9sGycPYdKy3h+Gf/cl3jiVFPESUJXK4THhNTZzJVV3rz33h6y54dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916494; c=relaxed/simple;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFWfqYNDCQokc+/ioeX5JScGUf2N+Al+P9Gj2kYRgL7sqEt6LhWM8ddEWyN2yY2UN6JkyuDJyC45YQmWnbhY9gNVbr81EGJzEY/LaQZUAnYrRpdsNJtYtZg5DoZvRPBT8c5NnLoIHU2wPDQxhP04YSCbL4baAXnmGT37oHsnMWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=jTSXXdsu; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=iRYaPkyD; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="jTSXXdsu";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="iRYaPkyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790916490;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jTSXXdsunhKm+AOgqRwVICOXkhqSISZg5ofjUWoa1QeOSuER294VSmXYdxB6DFwnN
	 0pdF4JLDNWXbENeskzEmftVk5Pfdz7PgEYUdsNXvblUdIUI8EOWkBP+2Q9Z44YdU1m
	 ikrklEFUh7TwQ5FB6MdgI2XxF5bLqKbQ58kmVqUvBNWCVJgl2GJEuwC9krsDMhQYQl
	 GwTqEM1bAUFE3b1Bya8heX1qXSgA4dxPV1nuk5IynD5RVaIpch/6G+N4NWkmz2av+Q
	 Xv8Yc/Jp54aBWec+pjZEzpB21COOVMIcVtRfPI+cN3T9Qx2du5SnIX87nwGVMRc62t
	 Dfv6T/Gi1muyg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id D900F48197; Fri,  2 Oct 2026 04:48:10 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790916479;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iRYaPkyDj/BZDC7732uu/cEp0deUscFjK/pWqLCWEZlJkcAGL3dK/XpwlQet3U1LF
	 0Ckov+3Ev+aLRazP7/fruXdKFlSX4MsctN+ad1liyLZ2M+Vo+eTJTmZBz6ts5BlFIh
	 fVQGtGQW98s7+FvuviQknIhAQtR+QzLKqV0K5dRUaxsM+uCDnstxM3T+z0Bsqmmvj8
	 Cah9v/nWP4+PUCh6+OGAjgc4VkvkTUiE3iW9o43rLmNIE+o/R3PHw5qQslAyOidt17
	 WdgegdvohLwvaUsBCC8zvPaJCT08Aw/s9ZMECSGQaarGvxVS0TsBOb4mPM6kKuqJbV
	 FaVIkZgYzlYDg==
Received: from AMDDesktop.lan (p5798b2cf.dip0.t-ipconnect.de [87.152.178.207])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id F329C47E1E;
	Fri,  2 Oct 2026 04:47:58 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 02 Oct 2026 06:47:50 +0200
Subject: [PATCH net-next v15 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-ax88179a-v15-6-131d9286fcd7@birger-koblitz.de>
References: <20261002-ax88179a-v15-0-131d9286fcd7@birger-koblitz.de>
In-Reply-To: <20261002-ax88179a-v15-0-131d9286fcd7@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.2

Configure phylink to work with the PHYs in the AX88179A controllers
and provide ethtool get/set eee operations calling into phylink.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/usb/ax88179a_devices.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 96748ca49743dcaef71bbf649a543508be01b8e6..e2ea9724433929d4cbfba0597787ddcb84dacf98 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -225,6 +225,20 @@ static int ax88179a_get_eeprom_len(struct net_device *net)
 		return AX88179A_EEPROM_LEN;
 }
 
+static int ax88179a_get_eee(struct net_device *net, struct ethtool_keee *edata)
+{
+	struct ax88179_data *ax179_data = netdev2data(net);
+
+	return phylink_ethtool_get_eee(ax179_data->phylink, edata);
+}
+
+static int ax88179a_set_eee(struct net_device *net, struct ethtool_keee *edata)
+{
+	struct ax88179_data *ax179_data = netdev2data(net);
+
+	return phylink_ethtool_set_eee(ax179_data->phylink, edata);
+}
+
 static const struct ethtool_ops ax88179a_ethtool_ops = {
 	.get_link		= ethtool_op_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
@@ -234,6 +248,8 @@ static const struct ethtool_ops ax88179a_ethtool_ops = {
 	.get_eeprom_len		= ax88179a_get_eeprom_len,
 	.get_eeprom		= ax88179_get_eeprom,
 	.set_eeprom		= ax88179_set_eeprom,
+	.get_eee		= ax88179a_get_eee,
+	.set_eee		= ax88179a_set_eee,
 	.nway_reset		= phy_ethtool_nway_reset,
 	.get_link_ksettings	= ax88179a_get_link_ksettings,
 	.set_link_ksettings	= ax88179a_set_link_ksettings,
@@ -451,6 +467,10 @@ static int ax88179a_phylink_setup(struct usbnet *dev)
 		phy_if_mode = PHY_INTERFACE_MODE_SGMII;
 	}
 
+	memcpy(data->phylink_config.lpi_interfaces,
+	       data->phylink_config.supported_interfaces,
+	       sizeof(data->phylink_config.lpi_interfaces));
+
 	phylink = phylink_create(&data->phylink_config, dev->net->dev.fwnode,
 				 phy_if_mode, &ax88179a_phylink_mac_ops);
 	if (IS_ERR(phylink))

-- 
2.47.3

