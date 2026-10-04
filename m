Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB6F1A6822
	for <loongarch@lists.linux.dev>; Sun,  4 Oct 2026 05:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791091589; cv=none; b=OyL7h1F8U2uniNYQRYerUJ5/23W//hV8QU3nGzSReiYbEm10oowdNv1pT6kahSpFoNIu4twHp/VF8P+Uph90sG+Qkq9g/c2LKzxkYQXAn538b441J9fWdYR1UjUWr38lCgdKm2qBUNPcJH9Rrseq980eYXmHOkk1QfOHLooU8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791091589; c=relaxed/simple;
	bh=eZ2p6zXDNQHbt4Zn0SxItyBiCh80mtsGPEzghGsZle4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGPrkbO6t6OrcdGLyDR6vGZUg4U56AXe0cWFvSo6Aeufay4Pdv4i05UzwtWES1BKHSkDjR224C+l/AobrE6Wo4tH/wMEpUr139+8AwWmXCOuiEtWAwqqnDoWUu/jucsz3JSssqCaKRSttQZbZT4ZskmwUO8rETvIVtj9x9L4O3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ye21ofHW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ye21ofHW"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b355ffso187316b3a.1
        for <loongarch@lists.linux.dev>; Sat, 03 Oct 2026 22:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791091587; x=1791696387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrSoyR0XDRjfdCWPMbPLnbv5pHqYkj4I5sTbgAVqzyc=;
        b=Ye21ofHWwXeVhJrHPcKObjCDcQUe6gzABR3RDuabX4NKuxmgUWBmHWZctJ8lIsjtMh
         tgvisgS0uF+7CGi3GrtWu7rvqmmyyCDeo0BkAbceyHjqYOhBeptHWUXpWq9rk6evqlFp
         H5EQAvajRE5RVZX65LgYsBAGg8afct1QG/x6Nb2gnVm9OejAHQrcXqaOZPyWWDWFvR1s
         9kHC/0o0pCs3imMJQVzTXdi+cRrArpGfIz4xOQYDJCEPJVP21yGIJW1DmUO7L0AnMNbn
         rhpD1pxB7823S+dtK7otUYi3w4Unn3zBFofXfL4aVfemRRKTZUwWQqDVVowShkJtiLyh
         Ndng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791091587; x=1791696387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yrSoyR0XDRjfdCWPMbPLnbv5pHqYkj4I5sTbgAVqzyc=;
        b=h3pzCMIDs5eWkciUBSAPpMXZYrlVZgtDSjkCZJmb9g3wnLI/GtvSEI6dZoFSyxf5CW
         +gqFfMhWgURl8gN2/BWc5zrAFnqjj9OyRq2FZYPNO9IAZbqq4vwP6InKd58etshDtwMS
         SRycTKVa+4+HRLYH/VWlrUgi/B/B1lnYmHRKckwM7pCDPv+X+GE1e8plJQ+MAzCuAeGI
         1s73m77MZ/HBtTBbEA/OfByi3CVf25uFwcAlYLBy9Q6inyUyTdi9ezst8vUVYg7uphM/
         eDdD0bLrwhMFNR5V6isPk+Qp3otisC9N/q6abpuJVjrq1siYiXqd0tkLZDs25DNFVvVO
         xuJw==
X-Forwarded-Encrypted: i=1; AKwUvBxtemO7ONWkJ/q4oMprYhyEqRPhPPvrmyUTYvpg/wDaGn7iXzqPIvB29G80/yWssZ/VICNchbKXD9c=@lists.linux.dev
X-Gm-Message-State: AFuF++nfjQpKkkseURoDHaScgDlelRgA826MEeRFFAMDKSoZhrvpbzKj
	Csj39pMdnz70BsK9YJ0vPpm8qeiTZ1AgsFFwlKANHYcl2TsUbRoXudIN
X-Gm-Gg: AYBFou20onHDvcHLdT38gH/WPmzQpDqvd0R3DoGau/hYvlNdBZ5QEkh2fSbZmbmqxKr
	gEgmek1DNgE9h8vIFx85yP/DPVNMQRPyRnpkG23KIvstVXKrxsCmGusek0CsSI5MVsEk4ZFHoin
	1PfKrTN6wdRrpbwnjkK8kP1avG4oKu/OSiBhB29plXR8zhdH5dY97/BfTZEezsQso2AtZQWaP2b
	G5e33z8M5zm40aAY1BqYfJ5W5qDN9urqZwtjmYfQ3phuJUAwGXETO7RfDMcYL9H0GAj+Gw2Hs1g
	g+jp9gJk1zC66sY6aoV3iUV4UyJjrz5s7mkijBLOLELWvze9cWAYr4FiHaheeeSm42x50lKkG9i
	NQS5ALMvrjoO1W1j7uHWU5ozDWByKA/Fv50EoJwdODC4R3YVe794Pmz9xXVjn6lAeh1vLsR/01i
	edIz+GVu9aujehkgymGwC8vDHOerQehm5gcTe26MQGiH03kJEN6libD5i1czR3WKX12ezVjASN3
	xadDHIMEfJvsA+Ko6QE967BceioneXmk+SiJpMNlJmFSBxNLMPjZbCHGb2iyBOkZK7ba2pn2NU+
	FAVkcKuz1iHY+Y93Sva4j2nj
X-Received: by 2002:a05:6a00:4f86:b0:881:e266:c3e1 with SMTP id d2e1a72fcca58-88af56e732cmr7763772b3a.48.1791091587013;
        Sat, 03 Oct 2026 22:26:27 -0700 (PDT)
Received: from Inspiron5409 (61-228-84-245.dynamic-ip.hinet.net. [61.228.84.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968d44asm2226260b3a.5.2026.10.03.22.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 22:26:26 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	chenhuacai@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	kernel@xen0n.name,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v15 0/13] ax88179_178a: Add support for AX88179A-based chips
Date: Sun,  4 Oct 2026 13:26:19 +0800
Message-ID: <20261004052619.112885-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002-ax88179a-v15-0-131d9286fcd7@birger-koblitz.de>
References: <20261002-ax88179a-v15-0-131d9286fcd7@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested the 13-patch v15 series on an AX88179B adapter (USB 0b95:1790,
bcdDevice 0x0200) on the declared net-next base
071876fd50482a68603a9460d80dd6dd58827ee1.

Builds, cold DHCP, 1000/100/10 Mbit/s link changes, EEE, pause settings,
EEPROM reads, autonegotiation restart, module reload, USB reattach, MII
ioctl reads, and repeated 100/1000 Mbit/s transitions all passed. The build
only showed the pre-existing unused mask warning in
asix_ax88772D_get_features(). Deep-S3 resume also passed with both wol
d and wol g; resume was triggered with QEMU system_wakeup, not a magic
packet. The guest later hit an init-exit panic during poweroff, which
appears separate and has not been investigated further.

However, I did find a reproducible RX VLAN filtering failure. With
rx-vlan-filter enabled, ip link add for VLAN 123 or 124 returned
success, but no VLAN interface was created. With the feature disabled,
VLAN creation worked normally.

The first read in ax88179a_vlan_rx_add_vid() returns the byte count on
success, so:

if (ret)
    return ret;

returns 1 before the VLAN bitmap is programmed.

The patch below fixes both issues and worked correctly when applied
directly on top of v15.

Because unmodified v15 has this VLAN failure, please do not carry my
previous Tested-by for v15.

Thanks,
Jianhui

Signed-off-by: Jianhui Xu <neuromoments@gmail.com>
---
 drivers/net/usb/ax88179a_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 16b441fea..f2140e2bb 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -422,7 +422,7 @@ static int ax88179a_vlan_rx_add_vid(struct net_device *net, __be16 proto, u16 vi
 	u8 reg8;
 
 	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
-	if (ret)
+	if (ret < 0)
 		return ret;
 	vlan_ctrl = reg8;
 
@@ -438,7 +438,7 @@ static int ax88179a_vlan_rx_add_vid(struct net_device *net, __be16 proto, u16 vi
 	if (ret < 0)
 		return ret;
 
-	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
+	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
 	if (ret < 0)
 		return ret;
 	reg16 |= (1 << (vid % 16));
-- 
2.56.0

