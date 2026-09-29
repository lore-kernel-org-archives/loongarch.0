Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C25B4D4878
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 03:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651975; cv=none; b=fmTqPkqoNd5UH4wtH87GWtjbTRU2JKG/YRTGwVq/TAjCuR8DNELc3QPtSnH6FCo7hGgSH7aCMgRLwTzsALj3TkSxYjF3Tm1msfbqEcad9O4LyoiA7Zxw7ejEsoWktQcTaKe2sbKIGdIH17GRumT0PlJEsLA89q/1g9DCHAQ3Qfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651975; c=relaxed/simple;
	bh=/A0k3jiBFp19ADWTQBTkvBSWwOOpjiQM/X0B7jSqluA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLyP8Dp6OtmAgfhjHOEXLNiHg+8oIoz7qGmOvg8MDIhG7B1hjsDf5EbV6fR2Oapo920765NC1BPMQLN3suZMJGWTaFjEquaSlCZZh/EU37JBWQunIbwnJkRPlSl1SMIKr67K+4K8Yb2BG4A08SgN350iQX+onHvRRt9Hl8nbIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=d4tDwJ0J; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=nT8xXVrD; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="d4tDwJ0J";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="nT8xXVrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651961;
	bh=/A0k3jiBFp19ADWTQBTkvBSWwOOpjiQM/X0B7jSqluA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d4tDwJ0J6NqCLoUFzY4UU0iEiAWKODMq9b4ZZU8o0DgJlbvJ7so8YL1zQnYgd6lJv
	 8NqXgGlrDlxFjgMuDDFVL50xwdEUEAiX/Mf4hjS84sQfCGcyPGxACtfqLIjv8VPk/E
	 /aW9yTBMpPWmKHlOpwbsVi8GVqWAxRjlo3bmWY4vuQPWOTqPrI8CEyXHUpDpZ2bQEb
	 dwAIx0yj8l8zbph8LTtlSaQfSXS1/vmugh3b/RNVSIVXUDEKeVjEAICzN2pOpxO2eF
	 uvia2arYfzfbJKRL3g93+Q/q39T0QzTG+oCKoV7Y1YTkV/h+TSr7B3qNoEKH3w0KcI
	 +syj5C4gVr9Yg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id DB984422C4; Tue, 29 Sep 2026 03:19:21 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790651941;
	bh=/A0k3jiBFp19ADWTQBTkvBSWwOOpjiQM/X0B7jSqluA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nT8xXVrDbclYc0uAS7Dtphj8UOr2KLlHSNu15zu4S/jm70Y0/Rl+9tPHjNvdyiTxE
	 21IQQK1TcKBQHsF/N/c+nN0DfBuFewI7n1VYNC44YIMgMSS7DNvsn50J3DvG/4DPBZ
	 pZeisaiYugGk7s90tFwqZh+I7dG5GHxy7FDxfRTvUmMx2haE24fVwY5JzvGG21MOXd
	 T2egzMYOkVBxqFNOpgw19PhW3aVJ5tTTVvIp91Wx5vNzRXxnobaHG+XuprPHjt9Sg0
	 RYz6Glu3/8tCteETqibcxWRgoNZOXR+Ep+zfZAHyAE3pmc3XdrS8DCoRELeTRXJSwl
	 dDsnp6GGFKm+Q==
Received: from AMDDesktop.lan (p5dd1eaf2.dip0.t-ipconnect.de [93.209.234.242])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id F0F104226C;
	Tue, 29 Sep 2026 03:19:00 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 29 Sep 2026 05:19:00 +0200
Subject: [PATCH net-next v14 12/14] ax88179_178a: Update driver name and
 information
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-ax88179a-v14-12-a1f2249e42ea@birger-koblitz.de>
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
 drivers/net/usb/Kconfig                     | 10 +++++++---
 drivers/net/usb/Makefile                    |  2 +-
 drivers/net/usb/ax88179_178a.c              |  8 ++++----
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index e76ea9b629747a8d721d248be3ac1e8d504178fc..9ac643b1a68ec35f944bfec1821437c7e61e2d71 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -642,7 +642,7 @@ CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=m
 # CONFIG_USB_NET_AX8817X is not set
-# CONFIG_USB_NET_AX88179_178A is not set
+# CONFIG_USB_NET_AX88179 is not set
 CONFIG_USB_NET_CDC_EEM=m
 CONFIG_USB_NET_HUAWEI_CDC_NCM=m
 CONFIG_USB_NET_CDC_MBIM=m
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index 976340d4d51445871274bfd558d217e1640a7756..882b6dadeeb7c998e15f6ba06ac48ada1b994dff 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -658,7 +658,7 @@ CONFIG_USB_RTL8150=m
 CONFIG_USB_RTL8152=m
 CONFIG_USB_USBNET=m
 # CONFIG_USB_NET_AX8817X is not set
-# CONFIG_USB_NET_AX88179_178A is not set
+# CONFIG_USB_NET_AX88179 is not set
 CONFIG_USB_NET_CDC_EEM=m
 CONFIG_USB_NET_HUAWEI_CDC_NCM=m
 CONFIG_USB_NET_CDC_MBIM=m
diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 115990b0d9537aea2776544c9768b034f32aa7a4..27862e380bdb4a54d184fa8618e4c9b348354e84 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -195,11 +195,12 @@ config USB_NET_AX8817X
 	  This driver creates an interface named "ethX", where X depends on
 	  what other networking devices you have in use.
 
-config USB_NET_AX88179_178A
-	tristate "ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet"
+config USB_NET_AX88179
+	tristate "ASIX AX88179/179A/178A USB 2.0/3.0 to 100M/1G/2.5GbE Adapters"
 	depends on USB_USBNET
-	select CRC32
 	select PHYLINK
+	select AX88796B_PHY
+	select CRC32
 	default y
 	help
 	  This option adds support for ASIX AX88179 based USB 3.0/2.0
@@ -207,6 +208,9 @@ config USB_NET_AX88179_178A
 
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
index 245ccf6896033922adcef79bd395b347918f57e3..8b52994e2a604101b61ec9cc0d698a0ecb520a14 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1354,8 +1354,8 @@ static const struct usb_device_id products[] = {
 };
 MODULE_DEVICE_TABLE(usb, products);
 
-static struct usb_driver ax88179_178a_driver = {
-	.name =		"ax88179_178a",
+static struct usb_driver ax88179_driver = {
+	.name =		"ax88179",
 	.id_table =	products,
 	.probe =	usbnet_probe,
 	.suspend =	ax88179_suspend_wrapper,
@@ -1366,8 +1366,8 @@ static struct usb_driver ax88179_178a_driver = {
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

