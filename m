Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC132C937
	for <loongarch@lists.linux.dev>; Sat, 10 Oct 2026 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791608084; cv=none; b=eCrTnuYW9OnWgOmfM1+LBTMbI+kf/TVOeqVBxlMG9Pn848i3kvC1W86rmY08vwDIthhJrGBwbTnPWRDtNGCm3jA+W3MohPAaDcqB6qPuEET5flvqa7BOXWGZmZ+bmgKU0fp0yzmInSi1jfsgXptAwDquRaSng8QQcZP5qFHXoJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791608084; c=relaxed/simple;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+P4G7WUNk3Yy2Pv8HdqNf05Oh9gRy8GtCtFIpIqmDfcHBURyIZtxBonyzzKmf/4DITY7RIxMHs+OZxZzm14PaxW0RqEbKrX60l/02BQ3QwPyfzShXVinOckuJ+PraT2/kzfoqMO6M+/HRFFmI2IKfRmn2ecdKUHeBe/Xmd6+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=CgVcOxWM; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=UuJGWS/4; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="CgVcOxWM";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="UuJGWS/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791608081;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CgVcOxWMNytSYzKPUV5esGnAtKiitubV1apaQXjTjXt0qhWAxLTTBHq1r+oRwOsSc
	 LWJbYVK0N0+nuQOwz1Tkp6Zyok/Z+DZexqjk3p5Qvv2a1OZAnHEr/7wJM6aht1jIel
	 J9OsZGEgQH5mw+YGrlFdmp7eUS1HLm8uY0s3eEGsB9woVqrFhC0A29MkW3ByyDscmN
	 LgQH50YVqWsoyFXwzPUA5/o1ZOOX/a97evc7gnHbfbDL9kdznnss7+tvOGncmGoKB+
	 1bvhi01oqX+nqoETiTWyHz5bV0p8iBy1kbl6U1MAfGHR9ZEdsxI8idHCJheVp502M0
	 mJJPxaRXIejqA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id B034347575; Sat, 10 Oct 2026 04:54:41 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791608070;
	bh=t6c76qrcB5Xzyp5vYgM4qQyIE9cJhW/WseYa5dwzUCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UuJGWS/4rRgHKIecrMo+lbNDJ4CLm2YxKn6rXof96Uh4bUPNdkyCpg8GGblOT2BlH
	 XVhuNpEkllKM8DNKtWc4wnXpmYZpEV50j/TCMSm/2zVf7kJPtN1WHUsQ+qeu0OOJ6H
	 HsiJSJ4hdXwk/IIq+3eyL9UgIaWcViPyZl+7WE3OFypIqzsyl5u1Ldufbc6v6xu/4Z
	 LVuJM6XT2NYy0Dxef8bWHMakJjYl5k0qzq2Pr0mNrb7LzY2Qn2ZACvsfpXRexsUMMc
	 X7iUJL8OGZpZ5SyiBH1syAuKI8XyscTYGqPaPpczQ/u78h+LYJWHcE7CunIowNa880
	 Lgf/bDistW/5Q==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 7585A4754C;
	Sat, 10 Oct 2026 04:54:30 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 10 Oct 2026 06:54:27 +0200
Subject: [PATCH net-next v19 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ax88179a-v19-5-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
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

