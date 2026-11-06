Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949701;
	b=rd+o6xUWSuWHKciiG63BRuEzuqo+2qbDkfuOuTeUQYBw8KisMkutpQ1yisdE0bbaY0LM
	 c/9Kqf9kNxs22ujHNaR3W7TsS8BIO06y/Re59zQlUb00rbfdmJXuKpbW9W90KMkPlFDbV
	 U2TG/+HhdEvq3G70710DbaqpXI0yAwBIYUNPJxbIQ53gGsYX/SYe17y2wVLn/ZrHkI/Jt
	 KVeTZwgTqjea8Zpj/D5Z4md7+8kOYEpcv+MHnNC0fOCvoNUuUoEckWBEc7yR0W7CDAUA2
	 4kMVOe4dkd0iWife4xp/uyhmTKPGMnb5ZPAw5/hLam1dGrLKKu4ek0fkQqk9oDOlYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949701;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=77bya39SSJtJCPguHOcv1gkK3CCNc10PFT2SuwqP3X4=;
	b=4RfKYbJkkFigoXY2du6HuqbFcNiAa1DMZhH/axagOlm+lJdVQBRm0X5hpWUS5Qv+BI6W
	 wSoGX4hxQKAsVV7vTWN2osu6MxqtOm+EABeeZf5Cfsq0Ir5in3A2xb7xLgqOYO9+ThYJM
	 7FgsSv5fv8jJ5mQ0p4Fz2lijc4QgInqZXo1Lauy2DkNXUtBFXhqECNLCzfJCb/JvLY0RK
	 /N7CBmhHDOGQ9OIylSEWMErL9FnQLp/15QsXtccy2QuCDNVXtv+TFMVaT3zSi4Xgr7Tqq
	 jVe5Vzgq8+O2lG9MysgAo7f66pywmhccWY6GauM5Lxk4OOvM8uyU2VcXD2Y+ZwxaH1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WlbUSoe6;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mGBWonVM;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3767606D82B
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 07:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3767606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WlbUSoe6;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=mGBWonVM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949699;
	bh=hM3oF5K1hZslFyqDR7TTdamJtF9O4stBo/mf2SjKeiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WlbUSoe6k7HoLF/Z8Ps7JNOd5joOFa6Kb7EzM23H350tmMLUw+oRcB1w0tjyVFhHS
	 KHd6IE4p3emzTEbXTOqaqS+e/5G/YS2oIChFFL5ZyNqQy97ihMllhm26tkSAjEaHbX
	 XeS2nEtxyknI5AjrPvkzAyC3tVP0H7bVBcOgDHR3Mom8CzZS70sZnhr8u6D3Oeiqaj
	 7+SfDVEmDqjp1qWWyD3kqVFyfFaNJ9q0bnnU39vK37NJfUuVpAIi8AZeth+LLeGUH4
	 +KiGIq6wk8JLvfoeZsKQLBGwQu2088wa09cGBrRI05Qtak+lAInRkG7N3VYzwfBRSc
	 GSYmi0m45IPPA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 81C5748BD1; Fri,  6 Nov 2026 07:21:39 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949687;
	bh=hM3oF5K1hZslFyqDR7TTdamJtF9O4stBo/mf2SjKeiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mGBWonVM4tJOPT78GavPJYID0kpq8a9QF+9kowFbcYpRRyP/YjYILIhsSlGeWkHDU
	 SjvyG7x0EsKLocQLt0vwgEFCXgPBgAx0Pnjw9B962I4ne5PF9xHO1+D3lzqdG9N878
	 s/qmsIRCtcSc28yspXePQBiXxq5MSMjFusgbfJDkwSpO1Ov9hxV3Bu+bmxA1fhwrIK
	 i78hWjzmsUsBgLvqwYIBy32CF7IOEtBGrO1N2tSc3Ha0Bxcmh//cGz2ZhIXt0ExD9R
	 Wb0/ojG8zUvi3y7bfNktpX+nUowoPXh8znSRD74C/Jkfc6/yKw+qSw1qQ/mac0NdOY
	 DmQdzr/vk6Jbg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 936AB48BA1;
	Fri,  6 Nov 2026 07:21:26 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 06 Nov 2026 08:21:22 +0100
Subject: [PATCH net-next v20 07/13] ax88179_178a: Add VLAN offload support
 for AX88179A
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
Message-Id: <20261106-ax88179a-v20-7-37b5a1189983@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A-based chips support VLAN offload. Add configuration
support in netdev_ops. Features supported are:
NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX
and NETIF_F_HW_VLAN_CTAG_FILTER.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Error-checking fixes Suggested-by: Jianhui Xu <neuromoments@gmail.com>
---
 drivers/net/usb/ax88179a_devices.c | 158 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 272e92365683247b42a5fd25013c728a9c1af711..4207d2cc2b865e5780b3c7f5ba2645a6242df477 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops = {
 	.get_ts_info		= ethtool_op_get_ts_info,
 };
 
+static int ax88179a_vlan_rx_kill_vid(struct net_device *net, __be16 proto, u16 vid)
+{
+	struct usbnet *dev = netdev_priv(net);
+	u16 reg16 = 0;
+	u8 vlan_ctrl;
+	int ret = 0;
+	u8 reg8 = 0;
+
+	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+	vlan_ctrl = reg8;
+
+	/* Address */
+	reg8 = (vid / 16);
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	/* Data */
+	reg8 = vlan_ctrl | AX_VLAN_CONTROL_RD;
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
+	if (ret < 0)
+		return ret;
+	reg16 &= ~(1 << (vid % 16));
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
+	if (ret < 0)
+		return ret;
+
+	reg8 = vlan_ctrl | AX_VLAN_CONTROL_WE;
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ax88179a_vlan_rx_add_vid(struct net_device *net, __be16 proto, u16 vid)
+{
+	struct usbnet *dev = netdev_priv(net);
+	u8 vlan_ctrl;
+	int ret = 0;
+	u16 reg16;
+	u8 reg8;
+
+	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+	vlan_ctrl = reg8;
+
+	/* Address */
+	reg8 = (vid / 16);
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	/* Data */
+	reg8 = vlan_ctrl | AX_VLAN_CONTROL_RD;
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
+	if (ret < 0)
+		return ret;
+	reg16 |= (1 << (vid % 16));
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
+	if (ret < 0)
+		return ret;
+
+	reg8 = vlan_ctrl | AX_VLAN_CONTROL_WE;
+	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static void ax88179a_mdio_unregister(struct ax88179_data *data)
 {
 	mdiobus_unregister(data->mdio);
@@ -517,6 +599,75 @@ static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
 	return phylink_mii_ioctl(data->phylink, rq, cmd);
 }
 
+static int ax88179a_set_features(struct net_device *net, netdev_features_t features)
+{
+	struct usbnet *dev = netdev_priv(net);
+	netdev_features_t changed;
+	int ret;
+	u8 tmp;
+
+	changed = net->features ^ features;
+
+	ret = ax88179_set_features(net, features);
+	if (ret)
+		return ret;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
+			u8 vlan_state = 0;
+
+			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
+					       AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
+			if (ret < 0)
+				return ret;
+
+			for (int i = 0; i < 256; i++) {
+				/* Address */
+				tmp = i;
+				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
+						  1, 1, &tmp);
+				/* Data */
+				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
+						  2, 0);
+				/* Write-Execute */
+				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
+						 1, vlan_state | AX_VLAN_CONTROL_WE);
+			}
+			vlan_state |= AX_VLAN_CONTROL_VFE;
+			ret = ax88179_write_cmd(dev, AX_ACCESS_MAC,
+						AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
+					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
+			if (ret < 0)
+				return ret;
+			tmp &= ~AX_VLAN_CONTROL_VFE;
+			ret = ax88179_write_cmd(dev, AX_ACCESS_MAC,
+						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
+		ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
+				       1, 1, &tmp);
+		if (ret < 0)
+			return ret;
+		if (features & NETIF_F_HW_VLAN_CTAG_RX)
+			tmp |= AX_VLAN_CONTROL_VSO;
+		else
+			tmp &= ~AX_VLAN_CONTROL_VSO;
+		ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
+					1, 1, &tmp);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
 static const struct net_device_ops ax88179a_netdev_ops = {
 	.ndo_open		= usbnet_open,
 	.ndo_stop		= usbnet_stop,
@@ -527,6 +678,9 @@ static const struct net_device_ops ax88179a_netdev_ops = {
 	.ndo_set_mac_address	= ax88179_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
+	.ndo_set_features	= ax88179a_set_features,
+	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,
 };
 
 static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
@@ -612,9 +766,11 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
 		dev->mii.supports_gmii = 1;
 
 	dev->net->features |= NETIF_F_SG | NETIF_F_IP_CSUM |
-			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
+			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO |
+			      NETIF_F_HW_VLAN_CTAG_TX;
 
 	dev->net->hw_features |= dev->net->features;
+	dev->net->hw_features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_FILTER;
 
 	dev->net->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM |
 				  NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;

-- 
2.47.3

