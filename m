Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAA43DEB7
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651966; cv=none; b=BqRvOFMxWxe3ETJMh2HmqEl8lE3oDLucSVw4h6I8pps8PTSIVLOf5l4Qpf1RCpCCCQWdjyr8lNC4nA5TP4O6P8cgTR/NnemB2UCbmXYMcYzBICnsODw8p8KCUeAzga5sG2YynaJdq9fcJ5+suIF94n4AxEeUw33a0hUnrXrPCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651966; c=relaxed/simple;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGjf1NHWnQAKzLpycwu+oD51Bjcka1txv+Fwdn05W+OyCBmkXOJX24st7U+jPJwwk1chfPZmXPIDO+2YzACCZflq+quRhoOHo4h/ylYnbMH6621lLZRKaZ5LxD3SoXVzsMqBL4cUuZe1WofB3Ed5wl+AR4JTaXcwzHDyXvKbxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=xPevxiSu; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=uCbEtlY1; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="xPevxiSu";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="uCbEtlY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651955;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xPevxiSuG3QbU6zGcvWhbdIBI4c+ND2iXVx3iXWFTZwTUAXyqfzkv71pbsYh/Yo2M
	 YV6b6qPZOWbybghvAZMgsUMXHFeZ6nV4xRuAZFl8mqWaDCn2s5p2+kuVg9xqCQ42F/
	 ivyMcM2wG0loGomPSxd3MHpZ65+jGQONhSuZrHPc+br5OGK8z9DEMpkpkIa5ypJR3C
	 d3BTlb2TbWluTR5IvURfuZ/h9Iwsjc9S4FUdIWASaP8jyhcKTDoLN2gIHe8xRXWZ61
	 9+/WrswRenSYnr+wl55GgHSNZX+bheUh2naQj4QV8117bRFD0KZLUKwMez2zVIXGO+
	 zpOPS3L5xVONQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 00632422AC; Tue, 29 Sep 2026 03:19:15 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651939;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uCbEtlY18OCDyRBYl974RpWS6fGfh1Yp7H31b4SWquGN0lM3Kzu/XdmXDw6xJpq9U
	 JdNC23yaIXqWtvV0NtlqTmIebw0A2L46ZDWJhv6nFon3Ow8QGlkjrY6x2Gtq5Jrba9
	 Q9SSkYxZoeEpmMLfat8Msbe2oSWr69yPbCebapgjNxX6px696lGfB4ra0NXwGiP1Dw
	 My3lBFoMfNjZY0Jmj4kIPqA8I61GyiQmCnBAO3vuc5lNF2CCTPYmasC3r+aa2k1UMQ
	 jHKgpoGr1gxgeXFaHlRpoP2PxrvF6NAUb96U1cJAaoA40CxMujVDg6fmAGlq2R5/F4
	 ddcvWtqrMzpUg==
Received: from AMDDesktop.lan (p5dd1eaf2.dip0.t-ipconnect.de [93.209.234.242])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id AC64B4225E;
	Tue, 29 Sep 2026 03:18:59 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 29 Sep 2026 05:18:55 +0200
Subject: [PATCH net-next v14 07/14] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-ax88179a-v14-7-a1f2249e42ea@birger-koblitz.de>
References: <20260929-ax88179a-v14-0-a1f2249e42ea@birger-koblitz.de>
In-Reply-To: <20260929-ax88179a-v14-0-a1f2249e42ea@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>
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

