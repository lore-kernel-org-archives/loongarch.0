Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653500;
	b=qlKcL7LDNPoQQ3WoCsAL99xKou8ieagkDEq/yoqSM2OwbhcVPTEyfb0SmJWd78BcQ1kW
	 0hzsI3PYjRdqYDh/Ci5HxWvQJkY4DvEEYMex0frmKw1N5C5+dhoirKUdJbHnSv1gv0JGi
	 HEik5T6IKL2IS2I5F8xNYij/ncxdP2EPA63eVRkbAQWNzBbEEf0dSiLw4Ahwja+uy3Ygj
	 zd9iqKtoso8mndd0d8Vbg6GJ6nfTzuFtEMw6GfziDaSIKxTrQ0E5qIu3m3XK14w0bj+XN
	 3VP+hP2SzJqjP1uXkDl/clHJOrUi0d2ddLWORDvo1ZAKCsw7C6QhIpV7Fnm5s4bE/yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653500;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=15W5bO8jb/guFSMBQbUspfI6/2KErQo84dlJC7G61Kw=;
	b=HiFIHeO4gBvMYZqU/eGrllkwC15kiVadsp0Ze8YDaqHKH0drsE7NWt8XGq3AlxUO9Pj0
	 lY5TYRcb3H/Nunxv0eeS4xDSm/eL0kQyWIftEIMc2ghLzUihT3A6n1hSuCfkgOy9HVCKN
	 AfInPPPHfX0B/QCphMi4XthwQAE1rHWjTfmV2kGUtxOR14Y1aymucdxm+xHpb1ej28Iyi
	 Z1SvHlTBcaQUxmJVVt0dij5FnEU9f18+vcTdxXy4GI0UoHVCqNnR78pZ8FGWDElf6fd9m
	 pqGSwyf0oI2Sf+Y96YAQStE0mrwhQ+DULz+am5ipFQRi3Gq7/YLz5oTO65UeOeAzLsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=EXLWfW4k;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=P8zHLdm7;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70B60A381B
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A70B60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=EXLWfW4k;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=P8zHLdm7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653498;
	bh=mkMyTHbsQL+bXFXfzvcneV3ehvDf1ECHm4UFLub7Khk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EXLWfW4kEhNCOUv0nw6xHNDFkyftk+v3rz0ZUVEeu7KgN+uuA+o4LehFtuMEZ6fdd
	 ApzASpfKyYSoCzz2fF/q5VGT2e941gqYNcikshEaC+DnFI+JgS0Y3N5tCS+spoWxNP
	 sRMgZfi2ytVwMbjxNiGLwfhoNxSOsQixIZQCXO06FOH2M8wNIWpo8ASpRbCdTXGUOt
	 Ev6KpGhhBOT42nw+hDWVSdoa2hHTNOuVwaCxSgMHgzx4Ei3IRwULmqV3fIDC08749H
	 MCL2LijaGLH7m7RwuroD8yCeIBqEngAZbtI4ECa0fzgwRCep+Ncx2BnOe0S1eMHYHo
	 XKVfpWOIlcu5g==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 2D58F489D6; Sat, 14 Nov 2026 10:51:38 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653485;
	bh=mkMyTHbsQL+bXFXfzvcneV3ehvDf1ECHm4UFLub7Khk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P8zHLdm7Rd5qecL5rtpIgNxGkVudG8b8POPo9khNX848vJ1I1PeCjRyJqbbYZLhCH
	 nONbWBw4atmXhkJyZ65Jvnkq5zHU/I2yopDxOA1aGuLrvFNs9KSKoLDGbuoq3ntXF8
	 cTM3kye+pr6MgoCvTRC0AYRIf0h2qCQekez+xLmq+fMxK/mBIlJHEMVwcLgfTFPrg4
	 Qtmnu7d94n/AkkE3Gm5T+rfx2l4VrY6+CUo18idT4UlkVLOwvMWeNBMJdOL3BVPZAs
	 JMG5wqGZ+g0WozBrX0xAuS+Knlu/ua0J6va/IPxeUScbidy1ZX0gHi72p+kvH5cCta
	 i1ejP6sLvVJPA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 66B84489C2;
	Sat, 14 Nov 2026 10:51:25 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sat, 14 Nov 2026 11:51:08 +0100
Subject: [PATCH net-next v21 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
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
Message-Id: <20261114-ax88179a-v21-12-c2d34410bcbe@birger-koblitz.de>
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

The AX88179A/772D devices have 32 efuses with 20 bytes each,
which can be randomly programmed. The AX88279 has 16K FLASH.

Provide ethtool read capability for these devices. However,
no write access is provided.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/usb/ax88179_lib.c | 55 +++++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
index 1523a920f3c38bf5c88a43c8a33645987b569bcd..821ee9cd8ded1b8f1e425bcef493fb175ed30376 100644
--- a/drivers/net/usb/ax88179_lib.c
+++ b/drivers/net/usb/ax88179_lib.c
@@ -210,35 +210,61 @@ int ax88179_set_wol(struct net_device *net, struct ethtool_wolinfo *wolinfo)
 	return 0;
 }
 
+static void
+ax88179_eeprom_access_params(struct ax88179_data *ax179_data, int i, u16 *value, u16 *idx)
+{
+	/* AX88179 has a word-addressable EEPROM
+	 * AX88179A uses EFUSES with 20 bytes length
+	 * AX88279 has an EEPROM addressable in 256 byte blocks
+	 */
+	if (ax179_data->chip_version < AX_VERSION_AX88179A) {
+		*value = i;
+		*idx = 1;
+	} else if (ax179_data->chip_version == AX_VERSION_AX88279) {
+		*value = (i * ax179_data->eeprom_block) >> 16;
+		*idx = (i * ax179_data->eeprom_block) & 0xffff;
+	} else {
+		*value = i << 4;
+		*idx = 0;
+	}
+}
+
 int ax88179_get_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8 *data)
 {
 	struct usbnet *dev = netdev_priv(net);
-	u16 *eeprom_buff;
-	int first_word, last_word;
-	int i, ret;
+	struct ax88179_data *ax179_data;
+	int first, last, i, ret;
+	u8 *eeprom_buff;
+
+	ax179_data = dev->driver_priv;
 
 	if (eeprom->len == 0)
 		return -EINVAL;
 
 	eeprom->magic = AX88179_EEPROM_MAGIC;
 
-	first_word = eeprom->offset >> 1;
-	last_word = (eeprom->offset + eeprom->len - 1) >> 1;
-	eeprom_buff = kmalloc_objs(u16, last_word - first_word + 1);
+	first = eeprom->offset / ax179_data->eeprom_block;
+	last = (eeprom->offset + eeprom->len - 1) / ax179_data->eeprom_block;
+
+	eeprom_buff = kzalloc((last - first + 1) * ax179_data->eeprom_block, GFP_KERNEL);
 	if (!eeprom_buff)
 		return -ENOMEM;
 
-	/* ax88179/178A returns 2 bytes from eeprom on read */
-	for (i = first_word; i <= last_word; i++) {
-		ret = __ax88179_read_cmd(dev, AX_ACCESS_EEPROM, i, 1, 2,
-					 &eeprom_buff[i - first_word]);
-		if (ret < 0) {
+	for (i = first; i <= last; i++) {
+		u16 value, idx;
+
+		ax88179_eeprom_access_params(ax179_data, i, &value, &idx);
+		ret = __ax88179_read_cmd(dev, ax179_data->eeprom_read_cmd,
+					 value, idx, ax179_data->eeprom_block,
+					 eeprom_buff + (i - first) * ax179_data->eeprom_block);
+
+		if (ret != ax179_data->eeprom_block) {
 			kfree(eeprom_buff);
 			return -EIO;
 		}
 	}
 
-	memcpy(data, (u8 *)eeprom_buff + (eeprom->offset & 1), eeprom->len);
+	memcpy(data, eeprom_buff + eeprom->offset % ax179_data->eeprom_block, eeprom->len);
 	kfree(eeprom_buff);
 	return 0;
 }
@@ -246,12 +272,17 @@ int ax88179_get_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
 int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8 *data)
 {
 	struct usbnet *dev = netdev_priv(net);
+	struct ax88179_data *ax179_data;
 	u16 *eeprom_buff;
 	int first_word;
 	int last_word;
 	int ret;
 	int i;
 
+	ax179_data = dev->driver_priv;
+	if (ax179_data->chip_version >= AX_VERSION_AX88179A)
+		return -EOPNOTSUPP;
+
 	netdev_dbg(net, "write EEPROM len %d, offset %d, magic 0x%x\n",
 		   eeprom->len, eeprom->offset, eeprom->magic);
 

-- 
2.47.3

