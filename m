Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05431F989
	for <loongarch@lists.linux.dev>; Tue,  6 Oct 2026 03:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255932; cv=none; b=Mm2r/vqEwuPgxMf99WeBWZpUpdgonEPtdGi62Pce4xM+oc5t23cUbvbcQQz+shvIJQCE+LDeScEDVPQ3WigDoppIY0cNxeTfT0/G5f9o/D3UIIRRGulYBW1fGQo97jpQv6Yn8g2c7nfQyVVfCl4tr6oraBwpFd4JzgtK+wUcXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255932; c=relaxed/simple;
	bh=wtVRnLeCsrXqTECaRwqNgr1XTvB/0hGMSpFSRJmy++E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaR86ZoclJMnipCDqH8jtiG2tWxsbQa7sEZ5+a0A0v2CmTUli9WSW1X5p/+GcoZr9QAsuP42Ll2WF+I3ORITqfwR+Z+W09Un7eZV/RDU4E7vI0WEaPcRZTXdswl4sUh9r9Gy7oBjkNuMYZm291rbnvK58k3xNgN/F6SQF6TTR8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=cmGgZzWe; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=d5u2DIM9; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="cmGgZzWe";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="d5u2DIM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791255926;
	bh=wtVRnLeCsrXqTECaRwqNgr1XTvB/0hGMSpFSRJmy++E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cmGgZzWeXrfZq6eaX/22+6i+XBOt3RJ+8oVQ3kCHz9JaGeTk+WFIMaiMzSRDUAOkY
	 PRJEun9Zt0fUMBMuQhCaEQdhaW2NG2kWjl+jJvcIfCclRF5QOeMv2dhQAGk4RqnSYR
	 gdG/kloKXy9Zv/nAuvJNY2gvdt83dPLes868tEPnRjdl8PZpcZGtlBMD4RzddrH1fo
	 bQ6yDdSsHOEkAVvFgCnIrhE3xka5/eBpLOgMklOvnaPE704XP7eSlAoM0A5JMrZlZY
	 mu8J7ZRs691B4FGPUt4eHpNsKGV2LDmI8I8DE++QPZEmtlT1NPbPZPBd/Cj9eHKLur
	 HGHeqWNZHJKaw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id E74C4485AA; Tue,  6 Oct 2026 03:05:26 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791255914;
	bh=wtVRnLeCsrXqTECaRwqNgr1XTvB/0hGMSpFSRJmy++E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d5u2DIM9Bg08FgZnAbWwmANR8adCsDjN18kjR3kz3+5XtzWfH6Saua2y4YVmHPY4V
	 XX3tbESQ3sBlSiY5BZGOyPfJC50SsN/BNLiOuVuxxSG8hR9CM4Po+ZHElh90u1mre0
	 zl9TIpQ+hHC/WDg1Khh01bobeuqQp2IJIH7vAr5LkSS8rJ7WJCDl522CRCv86nuvGl
	 2w+Z4nDkN61HHzDRv+AnVE21Sj34m3gdGJQI86nMap7b9/G4jjEqDAElmrcMo/f4gz
	 hIOOZ7o2kum+rYxWpI3hW0eG2X3YDE0kUMzY9vDhfh+haHxrS3mpvnnefUWlUeAZGD
	 sCKLQe9kKdjrA==
Received: from AMDDesktop.lan (p4fd5971b.dip0.t-ipconnect.de [79.213.151.27])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 1153D485A3;
	Tue,  6 Oct 2026 03:05:14 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 06 Oct 2026 05:05:11 +0200
Subject: [PATCH net-next v17 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-ax88179a-v17-5-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
In-Reply-To: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Jianhui Xu <neuromoments@gmail.com>, 
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The AX88179A uses a simple HW configuration for EEE
via a single EEE configuration register without LPI timer support
Add support for setting this EEE enable/disable register in implementations
of mac_enable_tx_lpi/mac_disable_tx_lpi.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179a_devices.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 661003f20f966d8d3597ae761a02956c087e8a14..f076bc41b53d670582935a099ce5819be22259ba 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -395,10 +395,27 @@ static void ax88179a_mac_link_up(struct phylink_config *config,
 			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
 }
 
+static void ax88179a_mac_disable_tx_lpi(struct phylink_config *config)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
+}
+
+static int ax88179a_mac_enable_tx_lpi(struct phylink_config *config, u32 timer, bool tx_clk_stop)
+{
+	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
+
+	/* AX88179A does not provide LPI timer registers */
+	return ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, true, 0, NULL);
+}
+
 static const struct phylink_mac_ops ax88179a_phylink_mac_ops = {
 	.mac_config = ax88179a_mac_config,
 	.mac_link_down = ax88179a_mac_link_down,
 	.mac_link_up = ax88179a_mac_link_up,
+	.mac_disable_tx_lpi = ax88179a_mac_disable_tx_lpi,
+	.mac_enable_tx_lpi = ax88179a_mac_enable_tx_lpi,
 };
 
 static int ax88179a_phylink_setup(struct usbnet *dev)

-- 
2.47.3

