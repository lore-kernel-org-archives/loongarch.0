Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C843DEAB
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651964; cv=none; b=lhInL0wqRK73ts6OSPO2RMMMBpUu9Vpkbg0s3lveXd++exRE+6GnCqbpXkabVq4+BZeotAMwQuU1oE1ZMvSijS72okpqgAPD+K7oLwMp683swJ4sfFsZ/UZPmdJ3RbSmyiiQxmq/3LotcJxxpH4vo/JJ/YbJCPILUyZrIESfH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651964; c=relaxed/simple;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmT2f9WI8BRYVCelQX4cr3iIr54IYMkClu+VpNuBsck1m0vK0jYngMHQ0o8zQEdbRapve6+VxzZN60vaWslfxazTOWRp2hEJMEypH+H1dRKmK4swbU2jM4fTttxuHlCGreo1K0maT7EuXunGHUzZ+fXk0QE1Wteo0LIk/UkghEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=KxZSGzgp; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=FnFyrZ9J; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="KxZSGzgp";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="FnFyrZ9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651950;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KxZSGzgpvLul40or/YOhssPvv1RzVZZLDWkg1skjGIQfs+uBWqx8/0NKrLDCNNRm3
	 yd0IRpbTKuQEzc4UGY9+dOUzT7NNUyuKEriVo8QvOoA4L0cwXu2bIVgPhtd6fu3GSf
	 L/cQnrqzHovv7mgGC8QbAsFKNONW+B9D3Ih75Pm1Ms8FIPjxOoqmpGeRBzl5DJUdk8
	 uEFotwZQkPXcoQVJYh/Fhkgal/e3x2lNJEonWNXCstPr2oRnDHzg6HNo0PNmbyvUa2
	 L0Xs9aksVKksgOk/es75hWwGIv0zOLmQkCo9Ia8CZ96FrwFaK1cTHwte5zi+ecDl2f
	 8qzXE6GM6fdww==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 7DB5542267; Tue, 29 Sep 2026 03:19:10 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651939;
	bh=kO/E0+66Aeswq0UC8BtggpSkLfEi2Vb5MPs3YzxqsDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnFyrZ9JKvt8EW5ehPP8GWO5vBGB3lje0oacEoQa7Uw3PDi/76TuUv3GqH6DjD78F
	 BSUJ6PgLmy+ov4R9X1pj8qyPEIDh62F9QmLLB2yvUyISPLP3JEgSAFrlzpek1C2Za4
	 8WOyKPugvnXMKf9L4dl4dabhQQAnsM9ySnsAJK5MomYhA5niVxn6Sa32F1vJJ/Xh0g
	 Q0eeJVjkQtQ/q1dYqVQyrhWmjETYHM2uTZNaNn5GNjpEw7aI7nzrg0E3VdL2s3HeXO
	 mqTjl4itXWJwjSBHHPpgMFEqnmEW8ce5aQQnA9/5MmUczP8yKzyFvFntWU856J18HI
	 /SE81CddUC68A==
Received: from AMDDesktop.lan (p5dd1eaf2.dip0.t-ipconnect.de [93.209.234.242])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 6E0BD4225D;
	Tue, 29 Sep 2026 03:18:59 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 29 Sep 2026 05:18:54 +0200
Subject: [PATCH net-next v14 06/14] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-ax88179a-v14-6-a1f2249e42ea@birger-koblitz.de>
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
index b15eddb0ebe290fcd6da7653afec19918a47717a..96748ca49743dcaef71bbf649a543508be01b8e6 100644
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

