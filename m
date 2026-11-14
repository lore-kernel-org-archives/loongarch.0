Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653498;
	b=wHooFCDTC7BUH9Y7FIqdwADFMepXM9VyISYueeuhOsdOWAMHw+eheb5PkwYXSl1dz02l
	 nNzkl45SOkF4xe/bmV2fY19kWJszu8ggxvQT3NziORFXrApR7QVAPzlvcK+vR4y3y3pc9
	 VEd1/nimsrCGz0/nW+9a+YqxkaPNHlLK4FsOlkt+MUg9xKilokhkLwDldNYzS4Gh+OXt5
	 ZAEAqp91YHy2IAGxx529I5yAVhgp3saocSwZkcJPQ9KypRlLA7CrY7JLzdyrSPBG1exQ3
	 Zqrgs8rMhCLyt3MGATl5KG4PC3FM/wHbDXXKyOcMO2uRzLzmtddi/C2KPakCqTejLsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653498;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ln1CUdYFcwFEe4dDBRhaA7UnFZFQE3qSIw+JXD++nI=;
	b=DDs+lNcIEoIgbSK3FQfS+OwyQRoR7xf6pvaG92YCrQjq2BOAByH+qv3ulrVzm90Wd9Ei
	 zPH3kLdJM7Ma51eV2nPtBjKqj7RpcnTkG0NxsQbNKCWIuIeXWIJww6juGS7urQQ3g62Qe
	 MvUGwj73vYZ2eZ8578NGSeXqQT3QJeodlr6P5cg8y/qGtnrPOTM9HF65Dch0j0EnFe5RW
	 Huga1EWAlMdCeXN/niZtNhyu7TnK5YSYXAkPOUC4CBS74wJu7lqr9PglujD2UdXZxCvfk
	 IRK+Y5wlw/vdk5fE22ZDX+CZVLAwmP7IQ7ay7PTidW2wkYcvo8eZAnjypR2Z5MAyr0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=O1ucrMZV;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oZO7as72;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE960A2628
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BE960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=O1ucrMZV;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=oZO7as72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653496;
	bh=1JQfZA672J6OveCAyEFBpwt3mdwIiAJM1L5TlYtB+GE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O1ucrMZVDTmscQYTq1OpIPJesmygZPpfS/nMNLEaf7pGcH4Q/i9Xm3WAkE/PX8SCi
	 h3m2+wQA0u5DqFZPuwDwJaesiaroIzBsg/ojkAdY4q6uYrE3cOZfHRJrtafUyq80Ei
	 u3UorLMdW5anR/H0UHJgDkETNkpg77YUVRNcYAI6iR9Cd7hwSwMsMybdhTznyo2TMF
	 aFTxSBlpG3ZQN8z7RHeNPUDIi71EBMI98CJ4CC4afl56s/f2PPmIy8MezeteDCWosO
	 AbCyNuSVQ3lvyoKI8kPr5lgtgXLqzSbetXRNguh+VzsiX5I4cvtut222+KXFu57Nlf
	 5GPwqMQLkuxGA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id DD79B489C4; Sat, 14 Nov 2026 10:51:36 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653484;
	bh=1JQfZA672J6OveCAyEFBpwt3mdwIiAJM1L5TlYtB+GE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oZO7as72SOqo5dmCDURrRSuk4qrCPIHk/Z4Fh1wkIEDqQKAwnegXTao2qeT67Xvej
	 skVOCrKzeEgNIgseMGP9BQEmDc047Iai6gY1o/RzOwITuIxfVBFRv0sRwedIFMHEsj
	 gPQMKVjvHGIZOndaEDQrhnO1oeXR+ypLRqjvYm2xxyHFCtT86DB3zlucn55JiWn46p
	 lNxWmdTPGayShT9IkGJWez5gRcHmKomeKbssYYrN2Gs32XzGBUW7CRUQ8LCS09f70g
	 yVoycaj5ytbaguve84tx49EYJ9AJs37kv++eMVp84hQe6iz+Q1jxJJLMuMCdUOXGgv
	 mLhferQB/UBfQ==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 65F78489AB;
	Sat, 14 Nov 2026 10:51:24 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:06 +0100
Subject: [PATCH net-next v21 10/13] ax88179_178a: Add ethtool get_drvinfo
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
Message-Id: <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
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
index 01d6a35f68b2c56f79acbe2875ce8e99ccdfb197..69095110e70435806a99274c50d79e86016ec9a0 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -235,6 +235,20 @@ static int ax88179a_resume(struct usb_interface *intf)
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
@@ -340,6 +354,7 @@ static int ax88179a_set_eee(struct net_device *net, struct ethtool_keee *edata)
 }
 
 static const struct ethtool_ops ax88179a_ethtool_ops = {
+	.get_drvinfo            = ax88179a_get_drvinfo,
 	.get_link		= ethtool_op_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,

-- 
2.47.3

