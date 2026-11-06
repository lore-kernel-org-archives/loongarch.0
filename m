Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949699;
	b=Jpp12RYfCSenSHTg0Jx9Ghe3/l6eVwkS85+sve4Dw5sPCfgH7TuEjiTWKGADJaW3Qr1B
	 yTbgwjM4wARkM/4EFq2zFvRYDujT9tg4t8XcHWAjlA/ixoPiJDBOv371Q64copyQ9HaH0
	 T+Wuv41l0V46Z3Kq0ut7OxAV67abTcEoOWKqD8ON2x0MqdOqu+AzfSe2RDQ4Of4FZvNO9
	 sqgUVketaVMj05vTuIQRSucJ8HsSYYo/WhoBr+zIN/ngCIcYDzXQt0NZf4/lDDElGwyyJ
	 Qxy9Zi1DInNTEljI2ooHTLJwCQd0ZJj+WHtDX10a013LpJy+3BlEevDxaEQDgZWpYTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949699;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=26rwK9emvjRNxgkx1aM0VjRaoRMNaYYnmRitPoyIuNc=;
	b=tKk3vTnkF57u33at82M3oQi8sUuyZV1cWyKda4ptjRPYhBC5AynDZ6NTxsMzjt7f3DOl
	 BR66XMQh+/Lbzj7SGkidlrGxeBzqPUyjbAMoQCWlG+Hp3QfecL/ApDsfRXdbC5rL2ckLA
	 fwp4OLoOdqkEh5DfJry/e+UvAzfA4caurIVQDfbd+jx3Cv5bfbQ2vp44xZ/rYaQkR4qtp
	 LcgiqgbEugQEymesxfho6rdTCJxM7AGiALMvGWnfmH9zmuW1hOxvINdcl2y/60SFyR+sa
	 bRwlr/SNiM/117fSkuJ2wgYTyF/GR32UpxB0iJqUFlFIzdiYrgrxsMTijHTAXp5YmgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ewoxcO0G;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=MU5jOZYH;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E16606D811
	for <loongarch@lists.linux.dev>; Fri,  6 Nov 2026 07:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E16606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ewoxcO0G;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=MU5jOZYH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949697;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ewoxcO0GigD0m/NbACWYtHubLGsbqr4RyjY7JoE+g0bG3chneiewuGXmI2Mnud86q
	 FIW8STqllt8xdM8TxXcjlTX4fRnlS/pxpznfXBuGtqepzGA/UJFcy2EPTb+/vJEEKi
	 pMvr/scKX+fFnXwaKNiMRvICHLpJyy3PKI/r/qZt1HjHBmVpaWhCL6qJ9aa0in3wXh
	 /3YckUjFzkugduG+96s9/2K3KFNTbc0dBUo/MMb4lSorqZAB3WpWaXnSQVvJdKG/Ag
	 6U0JrkCQIao30HdQiKJojr1YaNHlmHRcvgvE265aaE7LQEJnH/4n+e90wbfyTETjCS
	 KMssT8u0GyKfA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C717448BBB; Fri,  6 Nov 2026 07:21:37 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1793949686;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MU5jOZYHlwDlTgovqPNIV59fE9wyN/vLO0RoyQThDaLvVW2q/NrEBqEkF+4LQa+4f
	 +j3Kt9fgPlfmhcddgZZcRaCjDg7fXHLjrFcPa0SlJ3Urpo/YTiLdjD54e22yiHg73l
	 XH8+4VLOU7k1RVmwBmP0oTb+0c70DTVoox6dy6uoUJnVeRXVd3n2XRJTrcP+Y89Ahu
	 QLTAaufu64FZP464xBwQjdD7UY0R3wXSUgdzC3lgWxfSuxXYXMCKeY5qxS7qpOGueA
	 XZLWFU4oamEIRpBpN0QydAxKJE7cn/O+MY49Y7KO82mIoElSw/wnvztkevpLoiFrsX
	 tHcu5IudMjntg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 9464448B8E;
	Fri,  6 Nov 2026 07:21:25 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 06 Nov 2026 08:21:20 +0100
Subject: [PATCH net-next v20 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
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
Message-Id: <20261106-ax88179a-v20-5-37b5a1189983@birger-koblitz.de>
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
index 1aa8479422517bff6758c884c5e47258c5d3ed3a..62619fd68c408f453e48c94020bce2254da9a1f9 100644
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

