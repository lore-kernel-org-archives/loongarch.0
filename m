Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210C43DEAC4
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502245; cv=none; b=scHYH8T2ZsZFzinN95T5l48E2CG33WwpPpgGgrURjw029awVi32W/iK97pT9nAvCTzM21P8QVk9lUQguWJomilCmwiDS5df5fou/uvMTwRVmkDgRX6vAGHbf2EK/SIwjqVyXv5S+GmAf1riNUqaIsSlJuUvalWaKcc9trZ9Bnoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502245; c=relaxed/simple;
	bh=Ugudasv9IaP28auHEvHVgwGvfTUN/CFokc9tyZ2+YSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0/YtwIidJPZi9udSbGOdkSO8mSBS8prMPmnyhxgOF628U7ZT4ScMBnXNc75C8sQziamqzgJTkBgAsdchA6fvvSPLLTiPIFWhgjSZgN2WCWO3NiM4MXPgBSIlhcSQwO2uOxwDmteEyymIAi4ceoHYOZeXGyQ9Nnbf90FvHKiLo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=BueKjiiQ; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=Chop2IVX; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="BueKjiiQ";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="Chop2IVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502241;
	bh=Ugudasv9IaP28auHEvHVgwGvfTUN/CFokc9tyZ2+YSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BueKjiiQ6HC4aDeAo7jgDm5MPNIAxkYEkfj4zsuf4zKZnSRbIGnhKF0+hYzzcbGnk
	 rf3r4lhX0hmCGSQYG9zDG4AGCEv8MhyrU5SaZaThL8m12r6+8J8CG5KrUgp8JbTkBm
	 PaTP8cyssoBNwrp0KD7aPWH0cuMDHFPxLZYB0YuFMT1x/uH3JKEwzKAM5i0SdzUiKU
	 dWDLHtgzTvHaRFBYDKlSbS5ae2Y4Hz0GTDHmul7NH/VuszXgsVrWp5wjixfC0gIsqE
	 7Q89+EXB4vbRegB6b/F2mXA0Ipc3O88FWcqSCLnMv9cR/u1CuPkuVfDHZJjbeUhYPa
	 UckTQ2a5X4z2g==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 728C3421BC; Sun, 27 Sep 2026 09:44:01 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502223;
	bh=Ugudasv9IaP28auHEvHVgwGvfTUN/CFokc9tyZ2+YSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Chop2IVXPy6V/o452Kr0X0W4eh/5rqiFqpCL1OQ720ECuHp9ZZRZlXRktoB4wK7bI
	 dq1hkH+s4sbV4YUpK4RcLdChXIO0PZ/Ve2j2pZYMRKfubRYZx9JkPuilkQqaEE2c9c
	 fjeeoCQ12fbyc/0kTpRqopzGCSYXqgUVWhGTi4ZQRmC54Yh53honfEbLjq9C+LLOV4
	 tUCbNcFUaGiNaKE6ZT6mmggEsrieop7EiXSH9vFrz1VptTSmgnOJyKQh6oLKs9P/dc
	 4raH3oFPiIjDGK4XcKdVsi3WG0eygmPZfaerjg8rlBCbMHKC8wn4tYl99kIqwpet+Z
	 Sd8db+XPJEd8w==
Received: from AMDDesktop.lan (p5798b961.dip0.t-ipconnect.de [87.152.185.97])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id CC4AB4133D;
	Sun, 27 Sep 2026 09:43:42 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 27 Sep 2026 11:43:49 +0200
Subject: [PATCH net-next v13 11/14] ax88179_178a: Add ethtool get_drvinfo
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-ax88179a-v13-11-4fac6b3e032e@birger-koblitz.de>
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
index e62fd3c9a8a69145a23b747bc7c87980e2b9bd7e..e6db553c622e9f9e8a87e7164ea475a7d92de9a9 100644
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

