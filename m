Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949700;
	b=ptz47kVVMbJr28JFcHJEa6jW7CTTHAQmb33J2CSXXfZgp6+jlwHmfjx9Xz40Q+pcH92H
	 AZYf4go2cEtWoIs1UyXciQsZwCf5R7NYPq8qHl30i3dAGWQMsSyXY/F2ZyweN+BFcjAR9
	 tEUmN+UYM/rpTE1MpFE/mPdfzGU+VvC2qphbOtNOfXbJxH6CcFEhUtiLuP2wQmKJR7mgp
	 0FPrmwihNZ08PsA5H4yEv2QZV9iilzdM54PdzdUddN1netMHheBngfwAQh8C5hjVe8974
	 fuNs6Uxm8j2qAPErbFLAYs09wIW79y92Tj+MUicl28nLMB5AS0EAP/M84wiWnwFQ9Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949700;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=MhADV3IyydkqsTPMH3tU3wvA/vLc7fc8EWdcpm0ov70=;
	b=QpA/zKS7al68PR9BQqAjIRiAu6tYC5T1nMZKeeKHX1K4oCglyQgzeb5KKtiVLhKw+72j
	 QbYijMvi5o8UVgBud0TyQXwkws0ylbK5q4F0bT1OIJKODbfoGKb1vIwRexqL+md3gUzZJ
	 afVdZUT65DhMKKL9A9oVAMwb2q8YsZKosvIT0JxuheoQrG1RNgimCxxYSwCeuwQDybJlz
	 C8vrRwSoiH7bJajWi0GB65hEh6HJHorZwxV13pfQsZGEXB3855JDB7cHnPDjc9Lo7ayru
	 wdQqTixGqRLt+Eu1yf+Y2Aoek1rEb/kTtm8JxE1aHSyuvH86sJ9N0fwyBFqmi0K+j4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=Z86uJjNo;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=uGYh0zRU;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEA606A339
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 07:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DEA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=Z86uJjNo;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=uGYh0zRU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949698;
	bh=cg39L093dm5ZgWsTfiATniGIm12jPVEs5/MdqNtJY2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z86uJjNoHVfoUxw1WqL23yxwHT8+maNT6e0WKhpiQqN+ehVRmPAojI5Q9FrlG39r4
	 vYBjENqcSJ9jexj6QXUdFbUQpq0hj7WrbZhdjmnWH+B9+khw40Q2auJfy6sMUzvbCV
	 X7tV45kkBvuWh9akSd+q4BCpAhF0lDcaVkcblnl+8+jWjXMbMuLyPOTHvuu8k1oqif
	 ovhlci4pdVCGSVB34ibF+FkUePHjwGsQ8qfoHcUN4ll2Mo7kRX7x8GRcvwo7hIir2H
	 l1JGjyDB/KbWmWVARVspwJKuXDM+tPWrvsyYwvmxbifF2WP/3zCBbDfK1zWVh8T1Vr
	 eeDXL8diFEvYQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 60D5A48BC8; Fri,  6 Nov 2026 07:21:38 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949686;
	bh=cg39L093dm5ZgWsTfiATniGIm12jPVEs5/MdqNtJY2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uGYh0zRURGY7FrxzJvr8vqyPJMayJODkStAkG6XseYTGZTG5dC5AywXLHgWHbCo5L
	 eu5VDWjZhgCzNSVorY77wyHq51JLALLqkuPTTgfmEczyTRxF4JjgLrNBOz/kDsFHXn
	 QNJt4+Otg917PUXaaW3H0dg+/5OYkuITq9am+DuYq0mw0zgGLF4P7rKDbe5Qk63yB2
	 Qf4aKaO3AbM6qT+UwzYIq4sjMe4zYVARYmxPTpcMFXUyDEwc6WSmJVW7OTHU1C2ojS
	 pvTZCvJK09ZbLaYJifHbaajsBXTObgs3Dz3jnXKVxQ0aovdFAg1/Xl+TqkI1uYVCAM
	 DZshu60m2rjxA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 1661D48B90;
	Fri,  6 Nov 2026 07:21:26 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 06 Nov 2026 08:21:21 +0100
Subject: [PATCH net-next v20 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-ax88179a-v20-6-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
In-Reply-To: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Emir Beganovic <beganovic.emir@gmail.com>, 
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
index 62619fd68c408f453e48c94020bce2254da9a1f9..272e92365683247b42a5fd25013c728a9c1af711 100644
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

