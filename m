Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714013D3D0C
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502243; cv=none; b=KvXY6vDEz29Ino9KgWS/QxGVyxsivka2h/NyFu+OuR/LWx+ASqhI0GO3P75ZMS1H5AL0G0ZJpKH2YEUtSXnxYf0lKCjIwjtwmNndHbv77EXo2L0hv2z5cpU8hamcKeMHH4ds7JuaHwAgGJ6lL9NfOf4mRSi9zizp0gyFYg0IFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502243; c=relaxed/simple;
	bh=1dLckTUrtKpkgCFuCtHIYBAa1cX0kz+ghNj8allKwrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bf1l7DOpbfOGB4+NTgfxSfCNmmd3iV7buJuZN6phNR60xwSHLWi9gF9WugrkgTxBCGEQ17apunMeCyofvjJiF7bg/QCyeqEwDkvDFjgXRThBNDJcO/u4Og7a3MEp0DPCbWFtosvZlNQlXf00VnUANdW/Pvw+78q6rVgStJSrv98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=2wfCG9tV; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=BJjnBQxo; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="2wfCG9tV";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="BJjnBQxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502239;
	bh=1dLckTUrtKpkgCFuCtHIYBAa1cX0kz+ghNj8allKwrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2wfCG9tVoU5uFkr04LvilPd0kt99dXmK8cTejAY7+Jl8DUXY2CD37CMUvc+a2PLje
	 RTOvnzUE3ModjJB5Q//1UMPy21nJcX3HaLTskvh1xvEOtwXuNGqpWjUYJm/X1706h5
	 DCTVoD8InzxDWsWaOL1WRPYNo/Kaufe8BGHAA2d0e8wfHo1bJgH7tg0R7PvCewCDnX
	 FS1cUMWBDfsBIygs/AGvpbieZ5gkyzVFJc/xGDsI/TP4+1xxUrEDOsNyDPah//O18y
	 Nbb3L6883UzaKFSFiK3Sq/+QYlpiQgV4MPMrPRcZy+Sod8oKDIMc2HyiqLkvkmK2L0
	 lMIBMPZAig7Vw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 99AAD421C6; Sun, 27 Sep 2026 09:43:59 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502222;
	bh=1dLckTUrtKpkgCFuCtHIYBAa1cX0kz+ghNj8allKwrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJjnBQxoaCuu1MWXSpYMhQhLp5nkj/zI7sDm7kJmhcbLtZzCBdCH+7FZA55B0k2Ov
	 Uep798CeiHtbdOtj6eIp1XLr0LeuIYLgbQF5qlQPwNqY1lZUppMAvHsMOXYYfF4apX
	 FJ+WGCE901iJ98zNJ3v5w+xX2iyfrFF9u7Zw6rW78nbs4vgrTaq5j65XY4o04EoeWx
	 Ha4LvBPEnIhHYbQcDy4T8/kenH4SJKfUs3npjbeP+BGcW+qqtp2C1k6+7Crvm9ts2e
	 rY7bAryueCo4FZpL46cAn2avCb+dyQWFmRiocE45lUx4vxrAAcA6HfmU3i56RW4pN0
	 SddFTDNq1k19A==
Received: from AMDDesktop.lan (p5798b961.dip0.t-ipconnect.de [87.152.185.97])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 4FA7741321;
	Sun, 27 Sep 2026 09:43:42 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 27 Sep 2026 11:43:47 +0200
Subject: [PATCH net-next v13 09/14] ax88179_178a: Add AX179A/AX279
 multicast configuration
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-ax88179a-v13-9-4fac6b3e032e@birger-koblitz.de>
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

Add support for conditionally setting the ip_alignement flag
AX_RX_CTL_IPE in AX_RX_CTL and make sure that AX_RX_CTL_DROPCRCERR
is also set to be consistent with the initial configuration in
ax88179_reset()

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179_lib.c      | 8 ++++++--
 drivers/net/usb/ax88179a_devices.c | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
index 53ccfc5d56c24eff102fc94f631d50d2d2ec1abd..6ec662780483e94f9606f05f253106b8a6856d43 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -321,10 +321,14 @@ int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
 void ax88179_set_multicast(struct net_device *net)
 {
 	struct usbnet *dev = netdev_priv(net);
-	struct ax88179_data *data = dev->driver_priv;
 	u8 *m_filter = ((u8 *)dev->data);
+	struct ax88179_data *data;
+
+	data = dev->driver_priv;
 
-	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
+	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
+	if (data->ip_align)
+		data->rxctl |= AX_RX_CTL_IPE;
 
 	if (net->flags & IFF_PROMISC) {
 		data->rxctl |= AX_RX_CTL_PRO;
diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 12ef59ed16b3b081e2538731db3564718fbbf915..a1186649b22bf570e8ea83e42fc1cab81c2fd783 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -658,6 +658,7 @@ static const struct net_device_ops ax88179a_netdev_ops = {
 	.ndo_set_mac_address	= ax88179_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
+	.ndo_set_rx_mode	= ax88179_set_multicast,
 	.ndo_set_features	= ax88179a_set_features,
 	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,

-- 
2.47.3

