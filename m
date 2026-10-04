Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF93F3263
	for <loongarch@lists.linux.dev>; Sun,  4 Oct 2026 05:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791092359; cv=none; b=VRYYseHt1kOkapycGPNObwUCJG24MJvbs07libo4f9/6u2SvP5ux8ODQ+9HzJnVrsSpVY/SuS3XjcXcoLUe6uhc1sMpJgIzN44ksGpZHV6r2P1Cdv4xIIPeIk28frJrkwoqxE+dSdZ4Bj8P5MYAg9m79+sHUFoykPWcRnfJWXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791092359; c=relaxed/simple;
	bh=ubIcdq3VTwvXgfbEaAznkN58/LJ8FGtSs+1WH/LjGLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBK9wGCVSA9PYm+ihFMVVkSfjxZ0mgcRGwa2nu32YKLquCp/jTg/zR8mmH7DFsobcrrgfjw10o3FHEKvOWhxJ6sBfuzGBZVB5aZf29yeiHwBzOvhK6KkC6Pg5HeAm4XI01rRToUhzSpHTA0JsOEUj1WQ6fYIhyhaAlSRib63y1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=2MK7ZW6f; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=FEcTrnJr; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="2MK7ZW6f";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="FEcTrnJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791092349;
	bh=ubIcdq3VTwvXgfbEaAznkN58/LJ8FGtSs+1WH/LjGLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=2MK7ZW6fHUVPRixu5xRPB+R5y+VuAeX16/WL5VWvlchYxvJLcFgZdOPBS35lXzaCe
	 aroH5NSfq8oWTKi7fUARPIcmNUs7gpOJG5P0zSZ37YG+Z+UovWVjcG/TM5FTQfqqm/
	 cPmL0AvKU8JUiYJvt+3awMTdZXpYXKJIFiUNwQM2bcvqeNSiHSd57BQRQE201Pt1Ef
	 y7O1TcsG+fcgHi9YLKNpVdq65xoCTV+jz0+Rqfojm5wU4Xpd1xFOwEiOTdLC4hCN4x
	 VmYescKaHkS7l+XpzqNRul5tZF2JPGSjcm5VWSIBcK761tCfyGY7HTBL4uZ/TVpzp4
	 kCCjQweVugfDg==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C61384837E; Sun,  4 Oct 2026 05:39:09 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791092347;
	bh=ubIcdq3VTwvXgfbEaAznkN58/LJ8FGtSs+1WH/LjGLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEcTrnJrPtBzT5xoVp9Oz+u1fT0gMhxbFrcc21dg6696zfnJkMueJ08qVowk1Yi3r
	 IhFyajl/c16Ca0rDpXIAqJGniu/70Q4lLycYyhRzupBFx97wzTBTul7+C7dr0yQCwr
	 0Gep+azuEevVgY+bZOnBmimSO1austDpWHB09+zQfq5xpCv9E6VRXJgd1ZZxGGjKSO
	 qa3LRwQl86y5IE0dFUM/GYGNf6aL44VCSb9fJ0BVr0BtikMAK4mycwZyoZb/zURYHQ
	 G/GXJoEQ9oDvq9EgFSv/ip7ch2UdS+ZfBTVAjldklJl8KgD50MIbErBNujzs3Ajy4v
	 swzJOry7dGsFQ==
Received: from AMDDesktop.lan (p5dd1ef42.dip0.t-ipconnect.de [93.209.239.66])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id C79ED4830E;
	Sun,  4 Oct 2026 05:39:06 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 04 Oct 2026 07:39:06 +0200
Subject: [PATCH net-next v16 02/13] phylib: Add support for PHYs with
 broken forced mode
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-ax88179a-v16-2-2a9ae4e68f7b@birger-koblitz.de>
References: <20261004-ax88179a-v16-0-2a9ae4e68f7b@birger-koblitz.de>
In-Reply-To: <20261004-ax88179a-v16-0-2a9ae4e68f7b@birger-koblitz.de>
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

Add support for PHYs which only supported auto-negotiated
speed modes. This prevents a kernel warning and stack-trace within the
phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
because they do not support forced modes.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/phy/phy.c | 4 ++++
 include/linux/phy.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be3304b408c9f3ec9b5b95c76d3680a88..b83f938fe7c3bd619ae453434fd9582c0a055a57 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1190,6 +1190,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
 	      duplex != DUPLEX_FULL)))
 		return -EINVAL;
 
+	if (autoneg == AUTONEG_DISABLE &&
+	    (phydev->drv->flags & PHY_BROKEN_FORCED))
+		return -EOPNOTSUPP;
+
 	mutex_lock(&phydev->lock);
 	phydev->autoneg = autoneg;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7c5098a0dd6cd1ffbfc5f55240cd68e41bfb2d73..4143bffdcdb9b293a6e717a41816c05a2c5a252b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -64,6 +64,7 @@ extern const int phy_basic_ports_array[3];
 #define PHY_RST_AFTER_CLK_EN	0x00000002
 #define PHY_POLL_CABLE_TEST	0x00000004
 #define PHY_ALWAYS_CALL_SUSPEND	0x00000008
+#define PHY_BROKEN_FORCED	0x00000010
 #define MDIO_DEVICE_IS_PHY	0x80000000
 
 /**

-- 
2.47.3

