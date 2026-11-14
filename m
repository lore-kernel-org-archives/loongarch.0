Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653497;
	b=nYuYMtGZMAYM0e7zLghBbgl0rslw1B5kCaHPXeBGjQj43rs4orDy57qDd08cRG2Q6vwA
	 gpEUNusXBfRQHPNsLNyAuD0neBteI3aariZUex82yJc9ivNtK5SsQ4CdcHN9EfP9kcYC2
	 OchQGH1Lo8/R1Qc2cOKP9ODGunhJyIQwByxbsKphYs1G0ftoV+iU/klrcsbE5W6xHQEqH
	 oP3tRFVUewDEipJX+ygZVgZHWriun8oF6PbRSdtgBiOnwxBhZeJHCoMpP/W5xqL7RnQiD
	 ch1vjcNPx7iMJZIY1+MZ8C1B58/afkkyqKLYBT9owvyxAB/ReU+sDNnnF0/ZXZKC3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653497;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=2fUwhor1JLtgZxNrI7pVa054fBxvCIKRLSMnAibWfRM=;
	b=arsEhWBIW32nn8Q7uyQ8pzIXfHSVbUi76y1ifLKkzVBZ0cR1miI61Vx+57S3cKbxnkRv
	 q1hTvaNqBZ9SoFE6lGUVNunKxKPszdhoun+Rrof39tyKSmsvj6/I94wq2G3UAOG2CDIrN
	 LDfQ+pkexr1knGlVZaOSULxgPAEzISK1dxxy0Q27CId4IcQvT3VOhE45Q87hxwhh4CvsO
	 dbKAJtTzv2omCIrt3k801/dOl3/Jj0UHUPxTlZICE76tNwu2wzrMrceemhA2GU0kG91W+
	 btN71Iom0TTpxjzxr16VCT1Pp44XUCEhqkJjUpj6o3ZukaMUNnFWmXwo0FNHGp+7UyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=FVsbYPKh;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=AVxsY8Lo;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E0606A896
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 952E0606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=FVsbYPKh;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=AVxsY8Lo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653495;
	bh=E6BfFqyXJ+0VinOWx7FJ8CLx18WQHBxHqBjmUETH7fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVsbYPKhUtODFblxz/+sgXNUTb7W6xWwOsIeVKzbe4S6O+DuO6lcd2RYSaBMMn4dc
	 J/q5Z4RJ7qDsXgZm4h0NPKeMiGoS76nI191RoemNA/X6EsPV/wHvpdujFR3+aI+EZG
	 f4KjAcAiklNuxd/bW8VUMP4HdURCoQf82ZuKP/KSUB3wZ0lQRHBmuVqS5bkF2vNPEj
	 h/XedlSLaK6gGjBRCXXaLr/a4LPwW/e9PZ8IdYs65GwzsJFqn018+8qDAiFfMC8NMh
	 cBqF0gX4f4dE8LycvZzy4K7DuNp/9VvtRF6FtgonOTq3Q4Oa8sJbfrLUPzV03jBEVs
	 prTawyfpnAE3Q==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 21DAF489C9; Sat, 14 Nov 2026 10:51:35 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653483;
	bh=E6BfFqyXJ+0VinOWx7FJ8CLx18WQHBxHqBjmUETH7fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AVxsY8LoHaz/QL5YggQQO5b7DB1F/Qm5Gs+CWBfOKZnkY+rxApiE6bwMSF1LDjMC/
	 ro6YuTFOmheRr1AjBCKzHEIoUFp02n+zFZ2LzD3I5oDUz6HMb2Vs5rLMmY45A/b+Mx
	 AZxGkpTuXJlhF4tTQGDQ6bpt8BLoBnv4RCu5w6jMboBwucAy4Criko4lLaAsOQcR4j
	 IBYsoNOpiKdJ/GhsCAQEssp0mWKHggRjkBD+kDxIFih39Z35vMVy2fieNBQe7eSm2e
	 E3RXh7o9xy+i+Wp9fo0EUICT1qlwa4BE6k0fSr+cPmaqIHhj3gCTekKNb7WiG3Kh0F
	 si6Qp0sZsGihw==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 6B031489BF;
	Sat, 14 Nov 2026 10:51:23 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:04 +0100
Subject: [PATCH net-next v21 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
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
Message-Id: <20261114-ax88179a-v21-8-c2d34410bcbe@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

Add support for conditionally setting the ip_alignement flag
AX_RX_CTL_IPE in AX_RX_CTL and make sure that AX_RX_CTL_DROPCRCERR
is also set to be consistent with the initial configuration in
ax88179_reset()

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179_lib.c      | 16 +++++++++++-----
 drivers/net/usb/ax88179a_devices.c |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
index fa6423f51849e2ea5b640dcb82af6282d41b189e..f27b073e1bccb72a49437cb082a80c8e73a5de46 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -319,16 +319,21 @@ int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
 void ax88179_set_multicast(struct net_device *net)
 {
 	struct usbnet *dev = netdev_priv(net);
-	struct ax88179_data *data = dev->driver_priv;
 	u8 *m_filter = ((u8 *)dev->data);
+	struct ax88179_data *data;
+	u16 rxctl = 0;
+
+	data = dev->driver_priv;
 
-	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
+	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
+	if (data->ip_align)
+		rxctl |= AX_RX_CTL_IPE;
 
 	if (net->flags & IFF_PROMISC) {
-		data->rxctl |= AX_RX_CTL_PRO;
+		rxctl |= AX_RX_CTL_PRO;
 	} else if (net->flags & IFF_ALLMULTI ||
 		   netdev_mc_count(net) > AX_MAX_MCAST) {
-		data->rxctl |= AX_RX_CTL_AMALL;
+		rxctl |= AX_RX_CTL_AMALL;
 	} else if (netdev_mc_empty(net)) {
 		/* just broadcast and directed */
 	} else {
@@ -349,9 +354,10 @@ void ax88179_set_multicast(struct net_device *net)
 					AX_MCAST_FLTSIZE, AX_MCAST_FLTSIZE,
 					m_filter);
 
-		data->rxctl |= AX_RX_CTL_AM;
+		rxctl |= AX_RX_CTL_AM;
 	}
 
+	WRITE_ONCE(data->rxctl, rxctl);
 	ax88179_write_cmd_async(dev, AX_ACCESS_MAC, AX_RX_CTL,
 				2, 2, &data->rxctl);
 }
diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 4207d2cc2b865e5780b3c7f5ba2645a6242df477..a6b0a3f47118c46db38d483792c083510aa2641a 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -678,6 +678,7 @@ static const struct net_device_ops ax88179a_netdev_ops = {
 	.ndo_set_mac_address	= ax88179_set_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
+	.ndo_set_rx_mode	= ax88179_set_multicast,
 	.ndo_set_features	= ax88179a_set_features,
 	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,

-- 
2.47.3

