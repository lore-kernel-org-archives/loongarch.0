Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EFB3F3265
	for <loongarch@lists.linux.dev>; Sun,  4 Oct 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092365; cv=none; b=qS3300Sj0Ppr4cT0VQikA7mNaijO4X6xGgxuUrhs+2F7yuxAKeV8FdTeE7XanL0G/KAmLOu96rPCvjO2NnVF3K24FKn5hoIRU4jOwWbbBAf9LXqaEQqyvYsTNGnmvEv9X31iuXgHrljrULEMR76mSBBwL/f2CyqzmBR/HJox8FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092365; c=relaxed/simple;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UADQG0B+5q3oZakX8eIcVccLS2E/53n82fTh/iuQ30ds2WQ989h77n96L927Fiuw72BUi8HDC5J+jgjlVDWGUVLmxlOTkwD2Y3p2Sj9Rj3wVePKsO//+gIJD1drqq6oOaxzD9WrL0nDWX8l9WKCajlPMseJLowPNdJfo8jF8Y9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Jk75+O7H; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=RLywusOE; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Jk75+O7H";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="RLywusOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791092361;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jk75+O7HCDr9vBkPZe+RM60gL/3g53M7Oh+ax62PdGxA72j6PHxUGcVUhOtZ//fGI
	 DW8zDcbAY7ztsj6fOHeH+4Lzr/ZcGz76ynCS65fLLtuF+Pae2VkT/JPpqHSoCrGIkq
	 pwuIEnIRE15OdG1eIxdyYA5JfdztJ3RJmRdr854aIKSiDHSYfJiPudFJfyl3EgL81b
	 HFnh0H/NQJ4Fe313ti9fWRSxqMpQIm9gCylCde98xfbLyvZemsiZICKF+8KCnb++nQ
	 4eJjiHWFJHiDPs3iD19zdbiLktqw777NNszEqBBU8RGYb8FZrtFTVhxGYMlRrpz3kx
	 C7ADhw75olbNA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C92BD48352; Sun,  4 Oct 2026 05:39:21 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791092348;
	bh=jBZVvx+tFxcAcqhGb5gfAVEGyHbhwI7uGLasNYH0V/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RLywusOEjL/6F7eShTkM4hGlegxhPa50A2nRpKInsCLor6ssMRucgd76dYCfdLwkM
	 ZHRmHluZZbDIwp616AiDS5I391pRZdclxl9CIMlv48D1ObzbpFqYYfJtqgSUMDAIu0
	 bKilRpq3HS82nzZf2XvQbQGjKUAHkyNjxn0BjrXyUiDG+7ljD739twTyo8vALxOm+H
	 iVHl/eJlWlTGSn8OrAkzh6f9B0g9i1gDDG+Y432TDNiD42NTmEEdSwiL4q8k1trzd9
	 dBDdYBLL/fcNtRQxxU9FTduP7d6S+6UtspyO4YqS8fUks+wPpkA57iTFdXu9gmEXCc
	 dzbUjfSN4ljUg==
Received: from AMDDesktop.lan (p5dd1ef42.dip0.t-ipconnect.de [93.209.239.66])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id CA1614834E;
	Sun,  4 Oct 2026 05:39:07 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 04 Oct 2026 07:39:10 +0200
Subject: [PATCH net-next v16 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-ax88179a-v16-6-2a9ae4e68f7b@birger-koblitz.de>
References: <20261004-ax88179a-v16-0-2a9ae4e68f7b@birger-koblitz.de>
In-Reply-To: <20261004-ax88179a-v16-0-2a9ae4e68f7b@birger-koblitz.de>
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

