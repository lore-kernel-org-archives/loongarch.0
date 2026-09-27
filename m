Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174C3CEB83
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790502228; cv=none; b=cBEdwoQfpRykbBx6DTYcxvq4PoqOW1BN25xgRg6ghkJNAxAHnJ2tEGNvP+HtCyNwf3FFeGyjXCzvA9o1U09irwrsxc0Zkk1Xs1H7R6h1XHycfIguHQO/ddWTCk4iTVO/sK0qvtLSIxF/+6G1UjB6zMOICT0k6RBJUYySDpvs3OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790502228; c=relaxed/simple;
	bh=UcT1TW4Sdw6h/EHK92PDO/srxgGudwpIfaE1pzE+OMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZrkqnUDTEh51GieUb8v0Hdk1WDCwMT3YA+HfwK0py5o544rWv6rmvvq0PUaK1JXJFbxPoEPqspTJNMpUF8vOZuOJ9C4JNpAQq6QsMrl4Xf/5ABOU6KBSWkzh4HfFqfcfmerM61GPx9OuMJQ+/GduXhDlwbpEEdfhimKq3qNNtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=DLkxa7lS; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=ugnzUbhv; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="DLkxa7lS";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="ugnzUbhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502225;
	bh=UcT1TW4Sdw6h/EHK92PDO/srxgGudwpIfaE1pzE+OMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DLkxa7lSc9OfivyTpW6vUKbQMjBbP8L6+RoFS/rqtKlUc1l8v7xbAB9XscHREope8
	 wv/TtJ1PHxze3AkZ3J8VxtP9K32mmbfueLO8hfhUNxoOkSdxwQXrqHt/9IPZUvzovN
	 G1VtTuMiZItab/PzBBxVRzcnaxOnRs3wtV6kDcmC7FY+qlXOjyfQtTLF4cw8/qjyzG
	 203FY83a6By0JDQV21YyNFl2aZY7zqqu/qU2b+Mcw5XwyOmzbBxbYTWvModgqnzZPu
	 4x3WLpT2Uxgz9xf6KV5do1BHZlTb3TT11G8dGeY6O1qwO28OkNjcc025zfFRNcSyDT
	 GkHBkpmpUhorw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id CFD22412E5; Sun, 27 Sep 2026 09:43:45 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1790502220;
	bh=UcT1TW4Sdw6h/EHK92PDO/srxgGudwpIfaE1pzE+OMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ugnzUbhvaqJtdMpuSG1fV3VOXPcAvzLoQxa1K3PBwBTCdf+/qbjCkoCR772EvSQL/
	 FNULgA2y4gfrmRwOtoiJLQ4ElTJePektnRaGzRi0yQe3XO9/tGv8ZlHHfvLzAagc0K
	 dc/mURjgS+G87vfHks7uwF1pgOFTdIcMJYOBt6kMPWa7xtd7feKLY53qRCtWh0pZhT
	 dNXkWWrmKzkkVd7MM/fjlhHlSahVYkmLkDF5rPoJSKGtj6/vSGvImJSn2qb348hLTh
	 l7hn75jACjOjDjGEe7ngLg4bolCiUr1JMSCsGkA6YGb+UxFoEPsIE87Cac1smc4WMe
	 eZRC/mUULt9yA==
Received: from AMDDesktop.lan (p5798b961.dip0.t-ipconnect.de [87.152.185.97])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id B681C412EA;
	Sun, 27 Sep 2026 09:43:40 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 27 Sep 2026 11:43:41 +0200
Subject: [PATCH net-next v13 03/14] ax88179_178a: Fix endianness of pause
 watermark register
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-ax88179a-v13-3-4fac6b3e032e@birger-koblitz.de>
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
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The 16-bit pause watermark register is little endian as
described in the ASIX 4.1.0 out-of-tree driver. Correct the
register byte sequence but also swap the configuration values
used in the code in order to keep the current behaviour.

The endianness is relevant for 16-bit writes to the register.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179_178a.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 81d8412ce8e2fac981df076ea1385e6e87525cfe..2ed46ab62c0065d32040439f31d44f118d7e9952 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -32,8 +32,8 @@
 #define AX_ACCESS_EEPROM			0x04
 #define AX_ACCESS_EFUS				0x05
 #define AX_RELOAD_EEPROM_EFUSE			0x06
-#define AX_PAUSE_WATERLVL_HIGH			0x54
-#define AX_PAUSE_WATERLVL_LOW			0x55
+#define AX_PAUSE_WATERLVL_LOW			0x54
+#define AX_PAUSE_WATERLVL_HIGH			0x55
 
 #define PHYSICAL_LINK_STATUS			0x02
 	#define	AX_USB_SS		0x04
@@ -1619,11 +1619,10 @@ static int ax88179_reset(struct usbnet *dev)
 	dev->rx_urb_size = 1024 * 20;
 
 	*tmp = 0x34;
-	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 1, tmp);
+	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH, 1, 1, tmp);
 
 	*tmp = 0x52;
-	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH,
-			  1, 1, tmp);
+	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 1, tmp);
 
 	/* Enable checksum offload */
 	*tmp = AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |

-- 
2.47.3

