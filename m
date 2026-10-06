Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F0322C73
	for <loongarch@lists.linux.dev>; Tue,  6 Oct 2026 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255934; cv=none; b=Tl8VqJSwI9vEFbr87GFY/bU3hu2xSOjYmPLAKe+PMPcQFz7RcuP0b8mh0ooMppd1L8p6yCIjCem1lFZIFIuZpL/d1/6kqzbY/X18Vbz8XU66WgwE8g4lro9DbSy7I4TMZ6Y23FXa6JgyT/unRTxKQ5MeGsF07vCmDJeYciJMkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255934; c=relaxed/simple;
	bh=vpipJ6woiEO7rxtSTKIhAV98Xzs+OvVnK/G1yvFpKkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb3GmcoQ3wnY+L1nb4NaQbNIajqazPC9YSQoKMBg3N7uxit2rUyXnKmhE4nlb1mJILfscTVI4P4oNxQf+piRZ9kIumSfAsjNpS/P+3v8DTXf7aY3jxV7LMsjE1lEvWKkICSDqM3/dx46+Tpp9TaUNMIzKuIrK9pWkeV/mOMZEy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=eQ6ZrhX1; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=0tzZoxNY; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="eQ6ZrhX1";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="0tzZoxNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791255929;
	bh=vpipJ6woiEO7rxtSTKIhAV98Xzs+OvVnK/G1yvFpKkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eQ6ZrhX1jl19uZRG06kDj6PPQ4Z6EDFxp2YPQkO9i84M+qJtTL49IVNmapsm+nXhi
	 hdsLV7TeXQWhMKncku5qYstshNeJp9VKm7+XLQh+qsXTSdb6CzNAWcpW5AaqeJ145F
	 iTEX5PthPKBMNY15d6O+2LO+0hpt8JjxQBSP0diNHJbC5sQLtYfVSlP3JSjf4SC90/
	 l2GlF34d6lVxyda2HUkNNyM5mLD9Po8f4eiAFhXf33RM39/nbkirUzh2bkdwMi08Me
	 1Sr+z8yLz/Z4locTwY/P6CV/8HY/3AfqtQv4N9EBafZqh1XMczAnMNm8Qcx6tTH1U/
	 neaQvh8+ZzgRQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id F3D87485C6; Tue,  6 Oct 2026 03:05:29 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791255915;
	bh=vpipJ6woiEO7rxtSTKIhAV98Xzs+OvVnK/G1yvFpKkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=0tzZoxNYqzgq9mtB2B63NicW8CUnbSw5AQhRpgE/V9kdLtRGcRdO3aYlHv8HnvKOQ
	 SvAASOJyB0dmTb/wQYIfonnSqYkDQ/7p6aVyO1O6AK7Nlyq6gfYbEO0Oq2siF/+f5A
	 vQj3M1eJIkZIqnWPg5f8Phulf4rUkcO5Ws+JsgQkVcOKKjzF8SY4guNMNV1R3NN41O
	 yKSuRZo5AkgSdW6ia+Dqmtab8aF6PVzhljP08AIq167gCiLJVgtzMrgx9ztspcGs47
	 EBHAgO5LIM9hl4FMq/fYhEsBnAliPC0VKexD1AgD1VcAVM92FN90ctpgDityrL0WD+
	 PBUgroLzUPj7A==
Received: from AMDDesktop.lan (p4fd5971b.dip0.t-ipconnect.de [79.213.151.27])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 4160F485A8;
	Tue,  6 Oct 2026 03:05:15 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 06 Oct 2026 05:05:16 +0200
Subject: [PATCH net-next v17 10/13] ax88179_178a: Add ethtool get_drvinfo
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-ax88179a-v17-10-252814fe35ea@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.14.2

Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
to provide information about the device firmware.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/usb/ax88179a_devices.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index aa5f2d6e42e76bfa07d14330d96fb302360fd23d..929fa51280e843393f7a340561985579712be28f 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -234,6 +234,20 @@ static int ax88179a_resume(struct usb_interface *intf)
 	return usbnet_resume(intf);
 }
 
+static void ax88179a_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
+{
+	struct ax88179_data *priv = netdev2data(net);
+
+	/* Inherit standard device info */
+	usbnet_get_drvinfo(net, info);
+	if (priv->chip_version < AX_VERSION_AX88179A)
+		return;
+
+	snprintf(info->fw_version, sizeof(info->fw_version), "%d.%d.%d.%d",
+		 priv->fw_version[0], priv->fw_version[1],
+		 priv->fw_version[2], priv->fw_version[3]);
+}
+
 static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 speed, bool full_duplex)
 {
 	struct ax88179_data *ax179_data = dev->driver_priv;
@@ -339,6 +353,7 @@ static int ax88179a_set_eee(struct net_device *net, struct ethtool_keee *edata)
 }
 
 static const struct ethtool_ops ax88179a_ethtool_ops = {
+	.get_drvinfo            = ax88179a_get_drvinfo,
 	.get_link		= ethtool_op_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,

-- 
2.47.3

