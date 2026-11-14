Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653498;
	b=UBZPloYTScJp1Wv0T9fPcMnyti17q3VTl9iIY7/S8ZeqvV9tDKYbPKNJhZ4hlpshmXwp
	 bV44fetuGxskXNLv3jtcuSnGSp1zlsyps69NPBLfDrcOePG5WLk1mzFSwWXq9a/HOqZU/
	 5kdspag+lZ4ii5lYtW8W1YvMufz7eytZ4w4xPtwKoXDYfArbSZn5jN5th+gQ1DXOpQ5xh
	 qkOGaOrcJZpEjzj8kq5GWw0c6aOEPv3xFe79Xf539dU4Li/MboFc5uFzGY9N22Faa7+vg
	 2+G7JMDRYr6Ho8BnvDk8eYR76GR/cJ2jVt6Pp5H4W8alihp1KlqXlMDbIBGkTvQvauQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653498;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7Xw0LE5u83IfzOCq8pe7VuEhWijl3+wCcr3mRDNJTlI=;
	b=C65yRDtlftUSRIwFpNS+0R9a9YB8CXhjTCql0fLVa2wYdijcjeNpnhbXs+xVRHM6TRaB
	 8/meBR0RLtt61UN15Rk2Jf4nkHwAjkaxejiV1ht6ztPJ9Gp7KixLXvawmb5JtbRkmHHfG
	 mwTnPbTqLUpfxRNJLEYW2RTDvLQfXTtxELbIHiF4QJIIQ66gn+ry0/hiGfr3Si9Enhf2c
	 P8sPS3+4A8Xs6eKtqWkj/fPnrzFRaNhwS+InC/OjNRnIXgjuxmoDbmjduUu+4eB5Bliq/
	 6D/0kC9N3u6DHVPrd38DTAenqj51Npav/a09Nnq9qmlzi65jYSrDeVxLNudT/Yv0RRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=RYyIjLI4;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=BfJFIqYk;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFA60A260C
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEFA60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=RYyIjLI4;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=BfJFIqYk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653496;
	bh=DMyfS/V8XkCvDQVVam9NrzNnW5N5E9LR5JQt9WDhjKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RYyIjLI4hCReOQ77HECsHccDa0ThtntK5j76u6FD0TIkxDYE7a18d5U3iGnpNAA8D
	 a2uQC1biN2D4WTUlt/Qg5kvFeBrXhCJIHUoYkguWr/Zmc4cVZqO4SbS4gWqnbxzn3A
	 XfuwgjLNxIPwoxf110tBAUVShZObWNqpR2JoZi5SLJjdfXIEkyN2jOqgvKk4q2hb2x
	 QKtQ0qVo2NB9LVhoJhAnkaZFKyYVj/RYUhZdM6DsydAB6j0yggjMfVYZrTN9RWkJjX
	 pLKpB+iGnRQqthiW/pHNCVU/Hf5m6e90KNIQFSEbBdKTNGovNds1FgQIyGCeY5v2z3
	 Jcf8qhe+nz0Zg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 4E414489BA; Sat, 14 Nov 2026 10:51:36 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653484;
	bh=DMyfS/V8XkCvDQVVam9NrzNnW5N5E9LR5JQt9WDhjKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BfJFIqYkm7jkUMJ3cQaJrgjzKAb8fwTf77o7a/YtNS1SQNnOQPHma/tNGs6+4Hphc
	 dt8mszVLBY9gnNjz6e9onlqDUlMS9nPoLVll/mdCrTF0tpkQ4+2M39uIkvF9XmtnDl
	 kGG/jLSkAjYOAgHhTgnUG3QxwwMQHvuPF9LK6UFZWAEwMOUtAmqxMWm0hGx8iXx2AZ
	 iGhlChMEWQ/qHOobWaw2qLHJzmQdHcW4C5h7T5m26QJ6TLg3xe+3HZiFRstdG8Dgvj
	 Ge3zfqt6qHY7Leo5sJngmYQqvFT8NOVPOy7PWbaPYjkyjwBBtjsHySEJO+BFNi7flN
	 mTqeX73N1j9XA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id E1DA1489AA;
	Sat, 14 Nov 2026 10:51:23 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:05 +0100
Subject: [PATCH net-next v21 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
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
Message-Id: <20261114-ax88179a-v21-9-c2d34410bcbe@birger-koblitz.de>
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

The suspend and resume functions are called via the usb_driver structure,
for which the driver has only a single instance. Add wrapper functions
for the different implementations for the AX88179 and AX179A architecutres
in ax88179_lib which calls the 2 implementations in ax88179_178a and
ax88179a_devices, respectively.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Suggested-by: Jianhui Xu <neuromoments@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179_178a.c     |   9 ++-
 drivers/net/usb/ax88179_lib.c      |  19 ++++++
 drivers/net/usb/ax88179_lib.h      |   4 ++
 drivers/net/usb/ax88179a_devices.c | 129 +++++++++++++++++++++++++++++++++++--
 4 files changed, 153 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index f78ad344c1c4f1f057164728e4f21f875e6cdc1a..b077b7153f0c07676aafd5dfd13a2c0d9a826719 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -685,6 +685,9 @@ static int ax88179_bind(struct usbnet *dev, struct usb_interface *intf)
 	dev->driver_priv = ax179_data;
 	mutex_init(&ax179_data->medium_status_mutex);
 
+	ax179_data->resume = ax88179_resume;
+	ax179_data->suspend = ax88179_suspend;
+
 	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_CHIP_STATUS,
 			       1, 1, &ax179_data->chip_version);
 	if (ret < 0)
@@ -1362,9 +1365,9 @@ static struct usb_driver ax88179_178a_driver = {
 	.name =		"ax88179_178a",
 	.id_table =	products,
 	.probe =	usbnet_probe,
-	.suspend =	ax88179_suspend,
-	.resume =	ax88179_resume,
-	.reset_resume =	ax88179_resume,
+	.suspend =	ax88179_suspend_wrapper,
+	.resume =	ax88179_resume_wrapper,
+	.reset_resume =	ax88179_resume_wrapper,
 	.disconnect =	ax88179_disconnect,
 	.supports_autosuspend = 1,
 	.disable_hub_initiated_lpm = 1,
diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
index f27b073e1bccb72a49437cb082a80c8e73a5de46..1523a920f3c38bf5c88a43c8a33645987b569bcd 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -493,3 +493,22 @@ int ax88179_set_mac_addr(struct net_device *net, void *p)
 	return 0;
 }
 
+int ax88179_suspend_wrapper(struct usb_interface *intf, pm_message_t message)
+{
+	struct usbnet *dev = usb_get_intfdata(intf);
+	struct ax88179_data *priv;
+
+	priv = dev->driver_priv;
+
+	return priv->suspend(intf, message);
+}
+
+int ax88179_resume_wrapper(struct usb_interface *intf)
+{
+	struct usbnet *dev = usb_get_intfdata(intf);
+	struct ax88179_data *priv;
+
+	priv = dev->driver_priv;
+	return priv->resume(intf);
+}
+
diff --git a/drivers/net/usb/ax88179_lib.h b/drivers/net/usb/ax88179_lib.h
index adc2b4598bb52d80c18a6e2cc467144d3bd57a88..401c0bed3d28b4b94f0a0cad7509cd7087ef0639 100644
--- a/drivers/net/usb/ax88179_lib.h
+++ b/drivers/net/usb/ax88179_lib.h
@@ -315,6 +315,8 @@ struct ax88179_data {
 	struct phy_device *phydev;
 	struct phylink *phylink;
 	struct phylink_config phylink_config;
+	int (*resume)(struct usb_interface *intf);
+	int (*suspend)(struct usb_interface *intf, pm_message_t message);
 };
 
 struct ax88179_int_data {
@@ -348,6 +350,8 @@ int ax88179_set_features(struct net_device *net, netdev_features_t features);
 void ax88179_get_mac_addr(struct usbnet *dev);
 int ax88179_change_mtu(struct net_device *net, int new_mtu);
 int ax88179_set_mac_addr(struct net_device *net, void *p);
+int ax88179_suspend_wrapper(struct usb_interface *intf, pm_message_t message);
+int ax88179_resume_wrapper(struct usb_interface *intf);
 
 extern const struct driver_info ax88179a_info;
 extern const struct driver_info ax88772d_info;
diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index a6b0a3f47118c46db38d483792c083510aa2641a..01d6a35f68b2c56f79acbe2875ce8e99ccdfb197 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -5,6 +5,8 @@
 #include <linux/if_vlan.h>
 #include "ax88179_lib.h"
 
+static int ax88179a_reset(struct usbnet *dev);
+
 #define AX88279_EEPROM_LEN			0x4000
 #define AX88179A_EEPROM_LEN			(32 * 20)
 
@@ -126,6 +128,63 @@ static void ax88179a_status(struct usbnet *dev, struct urb *urb)
 	phylink_mac_interrupt(data->phylink);
 }
 
+static int ax88179a_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct usbnet *dev = usb_get_intfdata(intf);
+	struct ax88179_data *priv;
+	u8 tmp8 = 0;
+	u16 tmp16;
+	int ret;
+
+	priv = dev->driver_priv;
+	ax88179_set_pm_mode(dev, true);
+
+	if (netif_running(dev->net)) {
+		rtnl_lock();
+		phylink_suspend(priv->phylink, !!priv->wolopts);
+		rtnl_unlock();
+	}
+
+	ret = usbnet_suspend(intf, message);
+	if (ret && netif_running(dev->net)) {
+		rtnl_lock();
+		phylink_resume(priv->phylink);
+		rtnl_unlock();
+		ax88179_set_pm_mode(dev, false);
+		return ret;
+	}
+
+	/* Enable WoL */
+	if (priv->wolopts) {
+		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
+		tmp8 &= ~(AX_MONITOR_MODE_RWLC | AX_MONITOR_MODE_RWMP);
+		if (priv->wolopts & WAKE_PHY)
+			tmp8 |= AX_MONITOR_MODE_RWLC;
+		if (priv->wolopts & WAKE_MAGIC)
+			tmp8 |= AX_MONITOR_MODE_RWMP;
+
+		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
+
+		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp16);
+		tmp16 |= AX_MEDIUM_RECEIVE_EN;
+		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp16);
+
+		if (priv->chip_version == AX_VERSION_AX88279)
+			ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 8,
+					  EPHY_LOW_POWER_EN | S5_WOL_EN
+					  | S5_WOL_LOW_POWER | 0x8000, 0, NULL);
+		else
+			ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 0,
+					  EPHY_LOW_POWER_EN, 0, NULL);
+
+	} else if (priv->chip_version == AX_VERSION_AX88279) {
+		ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 8, 0x8000, 0, NULL);
+	}
+
+	ax88179_set_pm_mode(dev, false);
+	return 0;
+}
+
 static int ax88179a_auto_detach(struct usbnet *dev)
 {
 	u16 tmp16;
@@ -135,6 +194,47 @@ static int ax88179a_auto_detach(struct usbnet *dev)
 	return 0;
 }
 
+static int ax88179a_resume(struct usb_interface *intf)
+{
+	struct usbnet *dev = usb_get_intfdata(intf);
+	struct ax88179_data *ax179_data;
+	u8 reg8 = 0;
+	int ret;
+
+	ax179_data = dev->driver_priv;
+	ax88179_set_pm_mode(dev, true);
+
+	ret = ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
+	if (ret < 0)
+		goto err_out;
+
+	if (!(reg8 & AX_PHY_POWER)) {
+		reg8 = AX_PHY_POWER;
+		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
+		msleep(250);
+	}
+	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
+
+	/* Now, that AX_FW_MODE_179A is enabled, the PHY needs a power-cycle.
+	 * PHY-power is re-enabled in ax88179a_reset()
+	 */
+	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
+	msleep(250);
+
+	ax88179a_reset(dev);
+
+err_out:
+	if (netif_running(dev->net)) {
+		rtnl_lock();
+		phylink_resume(ax179_data->phylink);
+		rtnl_unlock();
+	}
+
+	ax88179_set_pm_mode(dev, false);
+
+	return usbnet_resume(intf);
+}
+
 static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 speed, bool full_duplex)
 {
 	struct ax88179_data *ax179_data = dev->driver_priv;
@@ -755,6 +855,9 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
 		ax179_data->eeprom_wen = 0;
 	}
 
+	ax179_data->resume = ax88179a_resume;
+	ax179_data->suspend = ax88179a_suspend;
+
 	dev->net->netdev_ops = &ax88179a_netdev_ops;
 	dev->net->ethtool_ops = &ax88179a_ethtool_ops;
 	dev->net->needed_headroom = 8;
@@ -802,6 +905,13 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
 	if (ret)
 		goto initphy_err;
 
+	/* Keep this interface runtime-PM active by taking a usage ref.
+	 * Prevents runtime suspend while bound and avoids resume paths
+	 * that could deadlock (autoresume under RTNL while USB PM lock
+	 * is held, phylink/MDIO wants RTNL).
+	 */
+	pm_runtime_get_noresume(&intf->dev);
+
 	return 0;
 
 initphy_err:
@@ -829,7 +939,8 @@ static void ax88179a_unbind(struct usbnet *dev, struct usb_interface *intf)
 	ax88179a_mdio_unregister(ax179_data);
 
 	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
-
+	/* Drop the PM usage ref taken in bind() */
+	pm_runtime_put_noidle(&intf->dev);
 	kfree(ax179_data);
 }
 
@@ -1055,9 +1166,13 @@ static int ax88179a_reset(struct usbnet *dev)
 	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
 	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
 
-	/* Read MAC address from DTB or asix chip */
-	ax88179_get_mac_addr(dev);
-	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
+	/* Read MAC address from DTB or asix chip, except when called
+	 * from resume context.
+	 */
+	if (!ax179_data->in_pm) {
+		ax88179_get_mac_addr(dev);
+		memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
+	}
 
 	/* The Bulk-Register configuration for the AX88179A is done in
 	 * ax88179a_mac_link_up(), once the link is up for a given link and USB-speed.
@@ -1117,7 +1232,11 @@ static int ax88179a_reset(struct usbnet *dev)
 	/* Ensure EEE state is off, consistent with phylink setup */
 	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
 
-	phylink_start(ax179_data->phylink);
+	/* ax88179a_reset() may also be called from resume context,
+	 * phylink_resume() will start phylink, then.
+	 */
+	if (!ax179_data->in_pm)
+		phylink_start(ax179_data->phylink);
 
 	return 0;
 }

-- 
2.47.3

