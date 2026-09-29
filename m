Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78E4D0CCE
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651967; cv=none; b=h7UccXNscx6ig/9o5grt851yJHgfiRzZDFb8XysnqdG2ToV5Ljh7PjgWtDRG6vmZAZcqGpmLj3cO2ASdS3FTOXpA8qiwQF+anAVSqOJN6pHOu+yjcHjekH4oMFJAdsTyKWgvBmXbwdERj+m9AD+t+HOGAaJZQPvp5VoCblQvq6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651967; c=relaxed/simple;
	bh=czvZ5IkrDTQqIInhjHSyPHYhske8wESFBzUsuaxF1b0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=en4/DSGzzi3lbD+Ps9+dW7ywyifrUiUQbz1MlrgEytUjPwDr/3PdBVZ1eCWDxLM+lNn7ABV09co0axJBjVvUz0kw/wfo96Zup/L3+Uf0RxJ7TUFOlvevbpS/uXHWdjFimnYi/S3FPDApXsi+Bp8KS3YNM9fYDxVUjqI6+BSAm7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=tLi+JKjt; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=SVkTMn3S; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="tLi+JKjt";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="SVkTMn3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651956;
	bh=czvZ5IkrDTQqIInhjHSyPHYhske8wESFBzUsuaxF1b0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tLi+JKjtrllKJN85nmsw3NsR7agHZC136mO1RTW4WwzB9uyyZboV81YYG45TZiS1E
	 VyVGoejjmkVgpGgwo7SObceabatI0fr9SX9/gfDYdmFMyHhy07gYj0plumT1JcFnvv
	 fjFnNdw4jwreVVlo4euezWHAbuCl79IM5Rp/T1j5FOI4I2PlD6hzIEDjsMZfbFcchK
	 sAhjtv67btHraH4estQQw6Lf/sL7yRX7oQc/N5vuEyJRL5lznLzM2S2w9oEsdWLH0C
	 bFEx5eL9g0syGGSaEMGod3HpEIImmHmi+zGlT2cSljQKFYOD+FifALio73uIKDbGPQ
	 1aMJTgZ0RwkNw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 4EA55422C5; Tue, 29 Sep 2026 03:19:16 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651940;
	bh=czvZ5IkrDTQqIInhjHSyPHYhske8wESFBzUsuaxF1b0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SVkTMn3SdBSxovFrTjcJKmC+FaX/vgms7S/iGslS0pUmZ51D4CL/wXIgZ+mwbjzUu
	 gxAvRxvqsnEdp6WOAjrx+VSCM752UP0BG1PL9THrN4m0YvAVSdAAlh+NFfN0TuQRte
	 dk6MYXXycO789V2JOyYOICvbbcRtsFYisCtKzzLNaNiBW94FRM10DUfCgFeMxlTzw3
	 lezbGsnJ6W0IzUV9p5QweBxFsuGmnVy06xvgXjN1ubxw8Xo/5oYTVVz69iBlN7pyKJ
	 Ja76zw8WaOdCvx8o5cy7Ebl7WxyWsSbmeDKLljp94Wgjrs/qp0Fb+jarEWM62K3Avh
	 Gfy+55omLlo+g==
Received: from AMDDesktop.lan (p5dd1eaf2.dip0.t-ipconnect.de [93.209.234.242])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id EECFE4225F;
	Tue, 29 Sep 2026 03:18:59 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 29 Sep 2026 05:18:56 +0200
Subject: [PATCH net-next v14 08/14] ax88179_178a: Add VLAN offload support
 for AX88179A
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-ax88179a-v14-8-a1f2249e42ea@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A-based chips support VLAN offload. Add configuration
support in netdev_ops. Features supported are:
NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX
and NETIF_F_HW_VLAN_CTAG_FILTER.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179a_devices.c | 141 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index e2ea9724433929d4cbfba0597787ddcb84dacf98..febb4b0ef12895414f9bdea916315d6d48246ab8 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops = {
 	.get_ts_info		= ethtool_op_get_ts_info,
 };
 
+static int ax88179a_vlan_rx_kill_vid(struct net_device *net, __be16 proto, u16 vid)
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
+	if (ret)
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
+	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
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
@@ -517,6 +599,58 @@ static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
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
+			for (int i = 0; i < 256; i++) {
+				/* Address */
+				tmp = i;
+				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
+						  1, 1, &tmp);
+				/* Data */
+				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
+						  2, 0);
+				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
+						 1, AX_VLAN_CONTROL_WE);
+			}
+			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
+					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
+			if (ret < 0)
+				return ret;
+			tmp ^= AX_VLAN_CONTROL_VFE;
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
+		tmp ^= AX_VLAN_CONTROL_VSO;
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
@@ -527,6 +661,9 @@ static const struct net_device_ops ax88179a_netdev_ops = {
 	.ndo_set_mac_address	= ax88179_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
+	.ndo_set_features	= ax88179a_set_features,
+	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,
 };
 
 static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
@@ -611,9 +748,11 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
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

