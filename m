Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653495;
	b=CsmF12PeBN+HFHthPkc32SE46TvAycvyw7s+PbOsMB7pLrVJebT4laO8odQ966dKac33
	 3oht7mbsmF1RB+iqP+uc+7mPEbkdmxIw98bTeZxMIfxXpBBQu6seAfUba0247sEK4TSXs
	 E27CHz641t/fUK8AJM5mZi8I5RpqyD/7AL5/88FZIGuv48j+vjhKkdP8NlB89CQyi1kUB
	 4ELX4z6zDpFb4KwixQFdu7cMOlk3sHhcC+VpWWVZE0i9fu4mnUnbGY2qLjEjAFbAFJ9em
	 BByx6xIr9gVWSSof6vP9gzVXQ8FVeD+dbTM5pIKwm9redKOv3eKPOoLKKK4ktV4TNrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653495;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=MhADV3IyydkqsTPMH3tU3wvA/vLc7fc8EWdcpm0ov70=;
	b=x8GargDun63cPHR8E9uMlgtcF4wZse518isMYqM16nb6EGrI2f1qyZ7TSqLqwnLzn/cr
	 /6jKq7PlCRvIGZSWwUVmxHVj9M91TXNfk1hJZ9Yd9z4SIl5PtUUPKN2g4t5w5A0mgP/eU
	 x6BHfsJGUdI0Tj6uIVDnlsYCqQNpjhuwNJuI2RJkD4AtQQjss2zRrVGwe+i638jrabsF7
	 aVYRXZDl7vi+PWDGDpsORUSjOZ2vgLF9FDjXbI3rOI4Gpo6EUtt92dNTRC7oWDDRlViKE
	 HsUkZSeFtkkcFcIEq0dq8SVuXROc1cNEBhGJJzWoRlWdpjLcUaQTrazSlnkime3YhAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=z5JrUCDk;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oujzd2ir;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD311606A88A
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD311606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=z5JrUCDk;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oujzd2ir
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653493;
	bh=cg39L093dm5ZgWsTfiATniGIm12jPVEs5/MdqNtJY2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=z5JrUCDkieatB2Age/UzV55ZYAYSvefmYvErbw8VacoF+s1opGmtLwQ0OurgSoOb7
	 o4pUvWJ9ul8tT02NBiPmz8jqdqNbTPE8maH+xTJYsVf6iDyyG/hg4EFkruSL8LtIJh
	 FvDDFkZdh6gQU4nUYCNroE6tnPKOZZg4jkR3G5zL6xHS62lnC5mcfnRhV0aLv1at12
	 mziL9BQfy58WjAP3cFax2CdWXhfZ+RYOLCe5H/1moQn+5msiD4kbTtL1nQXrJMI/vB
	 xMtiMHgOJHCzUWgfUkNEMxRgBWsQ9t9mNi8vxj38xag++AaAv/V+8I1W4yZk1oBlbS
	 p4frllRjnuHIA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 3C156489BC; Sat, 14 Nov 2026 10:51:33 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653482;
	bh=cg39L093dm5ZgWsTfiATniGIm12jPVEs5/MdqNtJY2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oujzd2irR52p3Bs3IoHDOw6JV6bj0Tf/bQCCDZx/UAMhdgnmpGE57CO8jt41ahSue
	 god4HnAW6b8JGSxt74Exqg16QATRNBj6rm2XcBvlQtuN7QEwCpi2lOG1uyt/SF6hye
	 iJMcL2++svrqa7UI1UNU1x+NcmBNuG08RBn20t0b7rQnZ6NJB5HAOZQFoXDO1HW3+d
	 XDc+3S0PPf6VGaoF5oBDsSqcBL9seBQy6+RdKOdixLZBbh8Nk/5+Q11uoHxWTfU2Nx
	 BTbWzkecaKET2abXpJ6d8kGEW0IPlFkcXpkaZf1cbJJVqcXprKtZYH5YBANPKWIjGj
	 IB9sxb+MykCUg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 6DEC3489C8;
	Sat, 14 Nov 2026 10:51:22 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:02 +0100
Subject: [PATCH net-next v21 06/13] ax88179_178a: Add EEE configuration
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
Message-Id: <20261114-ax88179a-v21-6-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
In-Reply-To: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
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

