Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653502;
	b=W67lE6lTXxDVxmJbXrtJuW6gyykVtaQxSBR7bA70GWaM2pwQyob5E7QaVjmtofRkHEDx
	 3fIxEC3eF89AUQV37rIPnzayVfF9TZGqP7aYa0meg/qHs/Ifuehm3LC9u3rzDxs12fzTt
	 D+HATKxLsJezFJhG9NDjO1veep2vLvfFS06uKhCBBBOORJumGZxBW7pOte+FvD42Aul/w
	 jzdPY+cjBY83eHwXTVZJsrHJAeEBpns3QmiTMayGCXlAWOG4C/GNardL+dgcx51aKQ3jE
	 kQtCTV7IpHw/IV7S31xFudhDnsdkHe4G5/OZzAQG68i01bgmoCqnGWM6WSiqrP8cFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653502;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=OQDRsImA156rX7VIn/voOldvBWRA4DJ8pwkA/7Q/W/E=;
	b=tsRubgvezmZCa1pHxmXZc+zvnz7BtespuvuxLm2a1lwnsVXs90VdJHAXPzf9bq7/zxv2
	 2Jo6nnzvBMI5IrmylO4DAU3MaAcUF7xmfCTcA6izd2NjIxZGrrBC0uLScJft5o6A9q7Md
	 gP3iYG+XGsR8odkGT9e8dmInyLPThdh/LL7FgXIwEipJJAZ4X6mdI8V3y8X1Jq8duESbP
	 JNYRFSHfOrtLUL2VZf52iIfb7Xie1iqwVOD5QTHaWO53/kihWgnBUmsuxMzib1g5wvVCg
	 2fHn2rR4cwZDP3/VhQ7pplcF0zGPPCdc4HlLaK9WA+GVnKqjtTDb2ppi35CjdXIV3ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=zPX5g15z;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=GV4g43r8;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A960A383B
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 143A960A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=zPX5g15z;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=GV4g43r8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653499;
	bh=s0cpwYkeVCb0kcjXGWJo938EgCbLt1S9id6R/cNC1e4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=zPX5g15zljMYoH3zGlRSGS+xU2+q5HCF4ytZj38fY5wAcu8qLgUzvqzN0JP9AKObQ
	 2SRkXEfG0i+whVpjte7DL4jSGjU/KenkhryavXqNBq7bUT0Rq2QD2KJsEG7ZU0GvlQ
	 CtlyOUG1djF63FPqOKcsHfT5V7n6TD95qY22x9XnbvGNkrhORhbT5Zr8VpFMTUcwLx
	 NJX/SXCAA0tQTyydkrTiltibI6Xutwd8Jkf9FLMZJ8A8MwUT8HdJ263mqaH8bOeI8f
	 ELECqsg5fyVs5qxuGHilvlzgbaRpdQ3Y6/n7Thic8WbO+xQqIBLv+wlhVZNAz1uZRu
	 4/5aElmubnhTQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 96DBB489BD; Sat, 14 Nov 2026 10:51:39 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653486;
	bh=s0cpwYkeVCb0kcjXGWJo938EgCbLt1S9id6R/cNC1e4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GV4g43r8RUT7JyBlQePAtQPTejlXMN6Hoi+wE92/5O1ROEf9YY5i1xKlqMidiBW+4
	 pCKW4VcyVHEohy1jPy5hT6lgWfoZgN6RAsK9GEeSuzNIvhsiugsCYGnP9Q9s6dTbcx
	 8/yuUKVdQWPvC9NPjVyOU9kwc9iq4UzmwBXpqkzNHhNRUW0hFFapURKtVea8nCSaLD
	 DzZpxlg077kvTXJAX3cBKOR1E/1e7YPK2+xv4ucCY7AhQWrQX/lvHMudm/I/DYkJot
	 2T/mz7a5vBSPO/lAb2lnGv92ulJf+TKEnU9RJy2ECW71a6S7mXgWE4HODjxE6Rabxy
	 3g6yCttVJwLTw==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id D96F0489C3;
	Sat, 14 Nov 2026 10:51:25 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:09 +0100
Subject: [PATCH net-next v21 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
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
Message-Id: <20261114-ax88179a-v21-13-c2d34410bcbe@birger-koblitz.de>
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

The AX88772D, AX88179A and AX88279 are 100MBit, 1GBit and respectively
2.5 GBit PHYs that are found in ASIX USB-Ethernet controllers of the
same name.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/ax88796b.c | 165 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
index f20ddf64914993f7097070d1f56c1103ec1e40e8..0df44e0e236abb02e16cb7885d0c743f0a2c501d 100644
--- a/drivers/net/phy/ax88796b.c
+++ b/drivers/net/phy/ax88796b.c
@@ -13,6 +13,19 @@
 #define PHY_ID_ASIX_AX88772A		0x003b1861
 #define PHY_ID_ASIX_AX88772C		0x003b1881
 #define PHY_ID_ASIX_AX88796B		0x003b1841
+#define PHY_ID_ASIX_AX88772D		0x003b772d
+#define PHY_ID_ASIX_AX88179A		0x003b179a
+#define PHY_ID_ASIX_AX88279		0x003b2790
+
+#define AX_ADVERTISE_2500		0x1000
+
+/* MII Vendor registers */
+#define AX_CTRL_STATUS			0x1d
+#define AX_CTRL_STATUS_SPEED_MASK	0x0c
+#define   AX_CTRL_STATUS_SPEED_10	0x0
+#define   AX_CTRL_STATUS_SPEED_100	0x4
+#define   AX_CTRL_STATUS_SPEED_1000	0x8
+#define   AX_CTRL_STATUS_SPEED_2500	0xc
 
 MODULE_DESCRIPTION("Asix PHY driver");
 MODULE_AUTHOR("Michael Schmitz <schmitzmic@gmail.com>");
@@ -83,6 +96,107 @@ static int asix_ax88772a_read_status(struct phy_device *phydev)
 	return 0;
 }
 
+static int asix_ax88279_read_status(struct phy_device *phydev)
+{
+	int ret, val;
+
+	ret = genphy_read_status(phydev);
+	if (ret)
+		return ret;
+
+	if (!phydev->link)
+		return 0;
+
+	/* Read actual speed from vendor register */
+	val = phy_read(phydev, AX_CTRL_STATUS);
+	if (val < 0)
+		return val;
+
+	switch (val & AX_CTRL_STATUS_SPEED_MASK) {
+	case AX_CTRL_STATUS_SPEED_2500:
+		phydev->speed = SPEED_2500;
+		break;
+	case AX_CTRL_STATUS_SPEED_1000:
+		phydev->speed = SPEED_1000;
+		break;
+	case AX_CTRL_STATUS_SPEED_100:
+		phydev->speed = SPEED_100;
+		break;
+	case AX_CTRL_STATUS_SPEED_10:
+		phydev->speed = SPEED_10;
+	}
+
+	/* MDIO_AN_10GBT_STAT_LP2_5G is broken, but we can deduce that
+	 * the link-partner advertised 2500M if remotely AN succceded
+	 * for link speed > 1000M and we locally have a link speed of
+	 * 2500M
+	 */
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->lp_advertising);
+	val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
+	if (val >= 0 && val & MDIO_AN_10GBT_STAT_REMOK) {
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
+				 phydev->lp_advertising,
+				 phydev->speed == SPEED_2500);
+	}
+	/* Only supports full duplex */
+	phydev->duplex = DUPLEX_FULL;
+
+	/* PHY switches interface between 2.5GBit and slower modes */
+	if (phydev->speed == SPEED_2500)
+		phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
+	else
+		phydev->interface = PHY_INTERFACE_MODE_SGMII;
+
+	return 0;
+}
+
+static int asix_ax88279_config_aneg(struct phy_device *phydev)
+{
+	bool adv_2500;
+	int ret;
+
+	if (phydev->autoneg == AUTONEG_DISABLE) {
+		phydev_warn(phydev, "Disabling autoneg is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	adv_2500 = linkmode_test_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->advertising);
+	ret = phy_modify_changed(phydev, MII_ADVERTISE, AX_ADVERTISE_2500,
+				 adv_2500 ? AX_ADVERTISE_2500 : 0);
+	if (ret < 0)
+		return ret;
+
+	return __genphy_config_aneg(phydev, (ret == 1));
+}
+
+static int asix_ax88279_get_features(struct phy_device *phydev)
+{
+	int ret;
+
+	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
+	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+
+	linkmode_set_bit_array(phy_basic_ports_array, ARRAY_SIZE(phy_basic_ports_array),
+			       phydev->supported);
+
+	ret = genphy_c45_pma_read_abilities(phydev);
+	if (ret < 0)
+		return ret;
+
+	/* AX88279 does not support reported 100baseT-half duplex mode */
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, phydev->supported);
+
+	return 0;
+}
+
+static int asix_ax88279_config_init(struct phy_device *phydev)
+{
+	__set_bit(PHY_INTERFACE_MODE_2500BASEX, phydev->possible_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, phydev->possible_interfaces);
+
+	return 0;
+}
+
 static void asix_ax88772a_link_change_notify(struct phy_device *phydev)
 {
 	/* Reset PHY, otherwise MII_LPA will provide outdated information.
@@ -94,6 +208,25 @@ static void asix_ax88772a_link_change_notify(struct phy_device *phydev)
 	}
 }
 
+static int asix_ax88772D_get_features(struct phy_device *phydev)
+{
+	int ret;
+
+	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
+	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
+
+	ret = genphy_read_abilities(phydev);
+	if (ret < 0)
+		return ret;
+
+	/* AX88772D does not support (possibly) reported 1000baseT modes */
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, phydev->supported);
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, phydev->supported);
+	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT, phydev->supported);
+
+	return 0;
+}
+
 static struct phy_driver asix_driver[] = {
 {
 	PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A),
@@ -111,6 +244,35 @@ static struct phy_driver asix_driver[] = {
 	.suspend	= genphy_suspend,
 	.resume		= genphy_resume,
 	.soft_reset	= asix_soft_reset,
+}, {
+	PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772D),
+	.name		= "Asix Electronics AX88772D",
+	.flags		= PHY_IS_INTERNAL,
+	.get_features	= asix_ax88772D_get_features,
+	.read_mmd	= genphy_read_mmd_c45,
+	.write_mmd	= genphy_write_mmd_c45,
+	.suspend	= genphy_suspend,
+	.resume		= genphy_resume,
+}, {
+	PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88179A),
+	.name		= "Asix Electronics AX88179A",
+	.flags		= PHY_IS_INTERNAL,
+	.suspend	= genphy_suspend,
+	.resume		= genphy_resume,
+	.read_mmd	= genphy_read_mmd_c45,
+	.write_mmd	= genphy_write_mmd_c45,
+}, {
+	PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88279),
+	.name		= "Asix Electronics AX88279",
+	.flags		= PHY_IS_INTERNAL | PHY_BROKEN_FORCED,
+	.get_features	= asix_ax88279_get_features,
+	.read_status	= asix_ax88279_read_status,
+	.config_aneg	= asix_ax88279_config_aneg,
+	.config_init	= asix_ax88279_config_init,
+	.read_mmd	= genphy_read_mmd_c45,
+	.write_mmd	= genphy_write_mmd_c45,
+	.suspend	= genphy_suspend,
+	.resume		= genphy_resume,
 }, {
 	PHY_ID_MATCH_MODEL(PHY_ID_ASIX_AX88796B),
 	.name		= "Asix Electronics AX88796B",
@@ -124,6 +286,9 @@ static const struct mdio_device_id __maybe_unused asix_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A) },
 	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772C) },
 	{ PHY_ID_MATCH_MODEL(PHY_ID_ASIX_AX88796B) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772D) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88179A) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88279) },
 	{ }
 };
 

-- 
2.47.3

