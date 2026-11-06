Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949701;
	b=EQdyQ5G7mydqJRMiiplSdCW6SSb0l0r2bQT8xvOC+TUqAFDbEWpfGZK72fUAoJv7X268
	 sWpvfU8WiZWIRvYc/PZXHrlH2SdpXWrxgkVoh/csvZ6sakpvgHE0ZDmEULcM55IxNrJxf
	 5bFhB1VtTEfAOd5Wu3WCRuuo9K4ok9cFK4W2pb8vOmOprKsmQEyPru9+5PA2iZC/riL4X
	 oUvXWxjZ5XCdWoy8CcFkVT5BFi5gk6qHC1mAbUWD9XmhyYL3Rr/WD0EUm+T99/j31ZXOr
	 BuKXGIlj4JxN4zbnyBAPiOOmh8YwD7U3I9JboP/3NMt8YGUckxeRPX4iqq3QT8o8+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949701;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dw2wwIa5KiQ4m+CZJzqK4mHabxUELfoWipJwxC32AEg=;
	b=gTvE8sZkFNkmh4PkvWeboVETR42r8yPT+KExK3fWpXbX2RHUCWAAJWRvWd9VsZaQPgAv
	 YX4XTGy/UgdlnFYC356uPSXRNa2YbcEZg7M2qroeeWt+URqatoEBsLDnQDhuGfWRIKPPq
	 YPAwPgkU1BvEE6ucR57DE0AsupwJTWP2kQo+TbqtjjWlu/LzVVQTvGM1LQiSMWmMS38uG
	 3OTy7fryoshrCnSq7UUj58ZiJgyXN0j81pgT5gGP6tXHklg7SjKjI+lLRS2IUJkyMqRwB
	 4NWlIYRgoDTHRZG3xmLtexXaUx6K6n04x9wVEewIGUMC4grQIJUtHig9EVcusEVNXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=NESMnPUO;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tsaddMoL;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEEE606D825
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 07:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEEE606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=NESMnPUO;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tsaddMoL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949699;
	bh=Q0JBHsoXOE0rcjBzburvk9Dhq9vEVC5K5ZbvCLUZ7po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NESMnPUO4JQuuXwuG8Jzr44IUL4D9RhgA0VwyelDoKLosjg5ddFVfuFS6k9F8ILyf
	 NvzQeusRbkA1tvkJM+YZtR7xoAoh9Hh44V+maY5TT4nel1rCx0GtyBQCHjZCPq+IEZ
	 cAq3nzcZO4DTczFRVkr88+HBXoOfkqt2zqBOSb9PqCdTAs/Z+6Q7XjUpg/qfQ7vrTy
	 zsGvunMpB24pEaoy4Hgo55c0JYHNefGCui6lfJ+Rnn8kG4+UG5UW19D+CuU2jtJDzG
	 tqwI1dHfmnyeHVi2W6H0itevZM1onkmaj5SpkjVJnyK/W1gJojI4YbwQHwP4/BogVz
	 8AX5/q9i7/4Tg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id CD63A48BD8; Fri,  6 Nov 2026 07:21:39 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949687;
	bh=Q0JBHsoXOE0rcjBzburvk9Dhq9vEVC5K5ZbvCLUZ7po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tsaddMoL4wNVn/RSgf/9hPROsls2Ru6IC8aLgalSo5pn0BvC2RK4JZNqYN9PWlGMz
	 PtsC2+/97Ye83wE3aU3mq+tE0PNnr2JlA8P9el7HtI0ayo1SQAIJMXdQlYgLjSPZKV
	 HFsfide/rcXEoWoJ15l76z9PeIv1O7vn8rVHouuXjhSp//7VAy9ZSXhrI+zfU4E0hn
	 BwDRABAMCDLQNwR4TOyYumgFM2J7VHfBZ92ytKkx9HN/SD3rbrucp12gmJP2jYwYgV
	 1IZ4WquEJI4GqnDfALoj3L6B0V1qwVbWKbeLKIqOFj48FuNwi8P7SyDQD3EBX2qxnj
	 24w+yWG6QyP8w==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 1562448BA9;
	Fri,  6 Nov 2026 07:21:27 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 06 Nov 2026 08:21:23 +0100
Subject: [PATCH net-next v20 08/13] ax88179_178a: Add AX179A/AX279
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
Message-Id: <20261106-ax88179a-v20-8-37b5a1189983@birger-koblitz.de>
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
index a314db4c9766679568a036f98acf868784835865..b4b00c8b4b62320471e13ae34a1fed5d02e80441 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -321,16 +321,21 @@ int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
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
@@ -351,9 +356,10 @@ void ax88179_set_multicast(struct net_device *net)
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

