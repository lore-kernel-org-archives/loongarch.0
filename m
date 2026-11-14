Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653500;
	b=lKguL14TmA3iWHWBK/2/4zZJIMPfDje8HPKECpd/HXGJwlWlFTLcCmzHYhSSaP+7steD
	 82KLMGbLo3bb/QYrqw/jVGiuiHySO6BUuEqHqLQbl31Cdl96ZK1LZ5QfJH2D2AFil74aw
	 YI8YiF1RJg3tEHE8OTQgQsl+YNxsa1eX2h7AQl4lG+pduNG6HXlB82Xtm9cm4uKQocS5T
	 YfsvN5RcbnIh8Uu9CAAPk67jK/sVwg5+M7eD/iinf+s11TD6okDL1cxt3CaVPraUBsxYk
	 WjjkDoQK3u3AEhrh22Qgy1RWAJbfwjQNiKgVCcZ1kKB+8lZgAsHKd75H8fyKy8H6dRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653500;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Uh6D9C8zw8k2ciF6Aka7QZ/0294duv4CIz41u3J6i30=;
	b=BaDGl4Rc4djLZGieOLLG/h4ICKcGrT2wlI+45zY3vWrXEL2ZhqJvhJa0NcPdpFSW4hnX
	 usmXc+22CH2wqIH274K7/nx5qutIzw0ImpkVZSQzxqOxdIrfaBIkH08/wyBMoOBJlr5oh
	 L/gvakBnSbDlDi545BiI8H60hUw24VGcMo15l5rgM1xJMPHLVI9DJp+8muAocAyMgCbJK
	 SEeEg29B7wLSTK+ACxHHZkBjtcbGv88NwXDsDInTNKAVnYT1fVry2jy7PTnxtKg7DteR1
	 GAxa5texJ9c5uMSTPbpppqiOql+thWKUvEs7Fkh8AIFrEyZExYd4XyUWRTYvAqQexCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=xzejz1AK;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=nq3noX+6;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2660A381D
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB2660A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=xzejz1AK;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=nq3noX+6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653498;
	bh=ycn+TETni0bFc5LJd2Abvies0NoQSGScwmb4fUcrgL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xzejz1AKik/M69TDuGG1GldJRB+3aJuPEQxE6V1W0/pZ0e2TSj/2Sy1gYS+N1BcAD
	 MueAM/M3NYNSk+sEQP+uQd0pLlrT+hWtYdrkJ/IRnPb6fOaaNtOum+1xP82akXBi9+
	 U5mET8kAZD3is/+UCkapeyv3HKkRPMn5XWaMrjYDMNE3wYAWcNIwnbbN78AxwQF13w
	 Sa84qHkJTo+fnNYnGGor/6v/MJpbMSxZvxQ1CeAXWr9Zw6NWCjGrgjijp/VBqxh/Zi
	 YbxmrQeneIefQImb9DY5e7s+kfdhoeBhuk4O1rujf9HtRQR7cRysEVFEoxK0owYXv9
	 7qclMywuaI8vQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 3F57F489D7; Sat, 14 Nov 2026 10:51:38 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653485;
	bh=ycn+TETni0bFc5LJd2Abvies0NoQSGScwmb4fUcrgL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nq3noX+6RdN08wxJLDLE0J4Da2DLqpavik0CLkzNyUYNbE3OXbVDAdMujnN21+buy
	 6aleSPLLgBKEaihEF5qWlG0FslhqXoY856MEM+ctcEKJLSkmJfgJcJRM6/zpVbesTY
	 D+fWoPYQU+JED3WmzFfjcxQNC/N2s8hHbhEsp3hWAAXqc+2vqxDurQv7zXVAvHuWWE
	 4LbsQlHixbFsmyOE7RpnTdlAv31YDqdtxvge8KKkjqlcWQXT4x+/GME2aofVysEbr+
	 VXTdhWx3T/ixXxOHC4GAG/ZyF8BxX+4EfRlt4PLtyXha6r+9ocl76Ic+pe8wvSPcCq
	 h/iSXljNFxJEQ==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id E0E3D489BD;
	Sat, 14 Nov 2026 10:51:24 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:07 +0100
Subject: [PATCH net-next v21 11/13] ax88179_178a: Update driver name and
 information
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
Message-Id: <20261114-ax88179a-v21-11-c2d34410bcbe@birger-koblitz.de>
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

Add additionally supported devices to Kconfig description, add
further requirements such as PHYLINK.

Update driver name in usb_driver and update MODULE_DESCRIPTION
to include the additionally supported chips.

Change Kconfig symbol name from USB_NET_AX88179_178A to USB_NET_AX88179
and update loongson32_defconfig/loongson64_defconfig to use that
symbol.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 arch/loongarch/configs/loongson32_defconfig |  2 +-
 arch/loongarch/configs/loongson64_defconfig |  2 +-
 drivers/net/usb/Kconfig                     | 11 +++++++----
 drivers/net/usb/Makefile                    |  2 +-
 drivers/net/usb/ax88179_178a.c              |  8 ++++----
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index dbef879935f322e6167b4ed878ad4cb20048c6db..a039b8e8d242073c16ea281cf8734068a1a9b29f 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -641,7 +641,7 @@ CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=m
 # CONFIG_USB_NET_AX8817X is not set
-# CONFIG_USB_NET_AX88179_178A is not set
+# CONFIG_USB_NET_AX88179 is not set
 CONFIG_USB_NET_CDC_EEM=m
 CONFIG_USB_NET_HUAWEI_CDC_NCM=m
 CONFIG_USB_NET_CDC_MBIM=m
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index 4f8bb77b8a1e6e30bcbd6e96d7e38b5054630ea0..b30415c03fa185cae77e81ded929c743ef22ee40 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -657,7 +657,7 @@ CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=m
 # CONFIG_USB_NET_AX8817X is not set
-# CONFIG_USB_NET_AX88179_178A is not set
+# CONFIG_USB_NET_AX88179 is not set
 CONFIG_USB_NET_CDC_EEM=m
 CONFIG_USB_NET_HUAWEI_CDC_NCM=m
 CONFIG_USB_NET_CDC_MBIM=m
diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 115990b0d9537aea2776544c9768b034f32aa7a4..cc8f2e150339915908fe1c28dea82e1103bbf17d 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -195,18 +195,21 @@ config USB_NET_AX8817X
 	  This driver creates an interface named "ethX", where X depends on
 	  what other networking devices you have in use.
 
-config USB_NET_AX88179_178A
-	tristate "ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet"
+config USB_NET_AX88179
+	tristate "ASIX AX88179/179A/178A USB 2.0/3.0 to 100M/1G/2.5GbE Adapters"
 	depends on USB_USBNET
-	select CRC32
 	select PHYLINK
-	default y
+	select AX88796B_PHY
+	select CRC32
 	help
 	  This option adds support for ASIX AX88179 based USB 3.0/2.0
 	  to Gigabit Ethernet adapters.
 
 	  This driver should work with at least the following devices:
 	    * ASIX AX88179
+	    * ASIX AX88179A/B
+	    * ASIX AX88279
+	    * ASIX AX88772D/E
 	    * ASIX AX88178A
 	    * Sitcomm LN-032
 
diff --git a/drivers/net/usb/Makefile b/drivers/net/usb/Makefile
index 2ecead0181eaf8d66fb6f5dbd6f2905b22b6eb57..4026f19ecb826a6465de38f1d9bb0e4c0af80421 100644
--- a/drivers/net/usb/Makefile
+++ b/drivers/net/usb/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_USB_HSO)		+= hso.o
 obj-$(CONFIG_USB_LAN78XX)	+= lan78xx.o
 obj-$(CONFIG_USB_NET_AX8817X)	+= asix.o
 asix-y := asix_devices.o asix_common.o ax88172a.o
-obj-$(CONFIG_USB_NET_AX88179_178A)      += ax88179.o
+obj-$(CONFIG_USB_NET_AX88179)      += ax88179.o
 ax88179-y := ax88179_178a.o ax88179a_devices.o ax88179_lib.o
 obj-$(CONFIG_USB_NET_CDCETHER)	+= cdc_ether.o
 obj-$(CONFIG_USB_NET_CDC_EEM)	+= cdc_eem.o
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index b077b7153f0c07676aafd5dfd13a2c0d9a826719..88dce368eacfeee5df4062ff277041427f6ff475 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1361,8 +1361,8 @@ static const struct usb_device_id products[] = {
 };
 MODULE_DEVICE_TABLE(usb, products);
 
-static struct usb_driver ax88179_178a_driver = {
-	.name =		"ax88179_178a",
+static struct usb_driver ax88179_driver = {
+	.name =		"ax88179",
 	.id_table =	products,
 	.probe =	usbnet_probe,
 	.suspend =	ax88179_suspend_wrapper,
@@ -1373,8 +1373,8 @@ static struct usb_driver ax88179_178a_driver = {
 	.disable_hub_initiated_lpm = 1,
 };
 
-module_usb_driver(ax88179_178a_driver);
+module_usb_driver(ax88179_driver);
 
-MODULE_DESCRIPTION("ASIX AX88179/178A based USB 3.0/2.0 Gigabit Ethernet Devices");
+MODULE_DESCRIPTION("ASIX AX88179/179A/178A/279 based USB 3.0/2.0 100M/1G/2.5GbE Controllers");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("ax88179_178a");

-- 
2.47.3

