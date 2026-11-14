Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653484;
	b=s4ylN5Lq18UEfplI7uI/C2+Pw+s19lT315K5GjK2pwtGhCejivUSv2dRlj6NTouIbAYR
	 z+koSY5UI6eB3n5AsZmd2OKOj4/C/RT7Hxs9po6JyWHUUr5aI2eVhYS6nz1ik5WIQITGE
	 TM+AiYEIW/66yJVrR4GkQNA9bNdwcUVZle81/Leg95syGUFU9ZrFFPM2zM6r0yNtGhsbc
	 3dBYQ/kbkEcfpNwSZleIKuFVspOWZSibJe+WT5btY8Tmra6w4/pXjAfooSacsir7um453
	 5mqYmytNPFUkiRV5oLWT+Ck/lHr2Pe5eIr4b+N6cmStx4gX2sADQND/oMOyaDv3bcLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653484;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=Tk14Q3K7b3pWB+lFut5VZBB4RBDYCbR7IiLtxn5JIQA=;
	b=B6siKCRWkF/65kVTmYKGB3nKjMTv8e0HLw4khL4+t8bbaHirMT1yP9hO/u8dn61PfH6G
	 cud3i3u5hWkAUKnqDvhzc+OLYg5744ThJPvUW1lCAzWclZjX2CVGXQ7RsZuUNdix0k069
	 OG3W19deWZKrDhLEgos+j6uhl7TIN9bsHmaBwMa83lhoHUQRIbd0IwO8qAJtv54d7KKnI
	 Z+h8RGaDuTyCDW8t3ZQuQqpLLj/EuFq2y7ugGepPMyT0pIl0kTJ6DIPaiek+1neaSNyGO
	 MBXCpGZxh3e56fQWI2tSZEvDKRwcevopCx8/RsY2WIKn4Wljo/YDUsIqyiXIzsxk3HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=iDHpPTZa;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=grZ00gNb;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A82606A32D
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 10:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A82606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=iDHpPTZa;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=grZ00gNb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653481;
	bh=ulueg9g86f1Zhhd6ksrXB1Ozg8LlKiyELMPIlljsLPE=;
	h=From:Subject:Date:To:Cc:From;
	b=iDHpPTZaSzLZNW9R3dvPUVId5W3ESsJ39eugBIGE3XSl2+RbI8wAiyZsMe8Xbg+f/
	 kHxBCMp0d8YBImHYo715SMu5aGncFg86DzAV0Zx94a3C3gc/yMojm+NASMKiCvC2EI
	 109LKxKEarFnujIHgmmourUEfND6HLz+Go6eafEU1tKloFYIwcLvsNYaJgAxwKRNdi
	 5xsIoLMLMqWeR2Qpd/A2urAIMwpx6DNkQXN/BUSdrRpE4buK8EAs6P8xlaRFmlpP9t
	 WFOV/LqvcKGNg3AUD0CIIy1TwLhNiZsLBIWa15NXqRqPoq7krWJ9+X/7X2LHbZSq4H
	 4aFgw9Mu87N9g==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id A624A489C2; Sat, 14 Nov 2026 10:51:21 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794653479;
	bh=ulueg9g86f1Zhhd6ksrXB1Ozg8LlKiyELMPIlljsLPE=;
	h=From:Subject:Date:To:Cc:From;
	b=grZ00gNbYnGVQbxlahFreVMgx7GXgpeejl5ZzmYQs1A6g2tCzBkHjBQRWxHd/nEva
	 zzSvU2stXzx0j82hCsV+EZ4n9roOD/OtEGq8XpuqTih2KmQrtVjyj/rJyreFw/9TD2
	 XMOPNkKpJcf7cUQTIym1nGdxtoGGZaAYYtNGEQNSGEDYBsEs1DCswYG75ReVTZqS1b
	 o3jF8RjrNuWlcxjaqha2rPP1B8nknKQq4f+lBPjsysXJyu16IEX/GWiiLUqDi1fyHn
	 uBPmdTh7Ha3FUdJyMUMvPKPP9RhBNWApCM58IYpo3zJ6wc1mbvMXV8eFR3iqGxOQQd
	 GZWICyYMEbldg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 537EF489A6;
	Sat, 14 Nov 2026 10:51:19 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Subject: [PATCH net-next v21 00/13] ax88179_178a: Add support for
 AX88179A-based chips
Date: Sat, 14 Nov 2026 11:50:56 +0100
Message-Id: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
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
X-B4-Tracking: v=1; b=H4sIABA9+GoC/33US27cMAwG4KsEXteFSD3ZVe9RZKEHlRgtZgrPw
 Jg0mLtX8sY0UHVpy/gskr/0Od14Xfg2fXv5nFbelttyvbQHhC8vU36Plzeel9JeTKjQKafVHB8
 hgKc4RyiBKiN4rab2+e+V6/LYrR/The/zhR/36bWtvC+3+3X92H+ywb6+c17BwW0wqxm0C7ZU5
 y3Y72lZ33idf17Tr+X+52vhHdtQAkEA2AAVlKpcEjK4EaAFgEYAugGpFDaVlA1BjwAjAC1LMA3
 AXKF6SFAKjgB7AEGhAGwDSk6trdHEXMwIcBJwAnANqIW9AeOAeNgDLwAQQ91830F0WgNBBqQRE
 ARw6kHoALcGVmQ2ONwBHQCdekANCOyK96AiRh4BoKQg59gKaoO07BTn6B2pISHCSHAiehotRx8
 JbYquDAmUhBwF9Dw6lZXJRGjiMA0gAknoJdETaWrMLmlWGse9MJIgSfRMRqiIhto4OA6JI5SgT
 gMBu59MKITB1Vz8kHCSOLWz5xIjRTbsQvVpSHhJnNrZk4kWA5jK2v6nkCAJeUFAz6ar7eIy2Si
 D44mQIE7HA3o6vWn3k9e5JjuMNx7pBDgVgj2d2icbAQLRv6+Z5/P5F6dVtsucBQAA
X-Change-ID: 20260630-ax88179a-a1d89fe21730
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
 Birger Koblitz <mail@birger-koblitz.de>, Nicolai Buchwitz <nb@tipi-net.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
X-Mailer: b4 0.14.2

This adds support for the current generation of ASIX network adapter chips,
which are based on the AX88179A. This includes the AX88179A/B (1GBit-PHY),
AX88772D/E (100MBit) and AX88279 (2.5GBit).

The AX179A-based chips all provide both a CDC-NCM compatible USB interface,
and a proprietary vendor interface with more features. By default, the
proprietary vendor interface is not active and Linux will load the CDC-NCM
driver to support the devices. If the ax88179_178a module is configured by
the OS to have precedence over CDC-NCM, then this driver will switch the
device to use the vendor interface, and the device will be controlled by
the ax88179_178a driver when the device is probed again after an automatic
reset of the device bringing up the vendor interface.

The following hardware was tested:
Delock 66046 2.5GBit adapter (AX88279, FW: 1.2.0.0)
TP-Link UE306 1GBit adapter (AX88179B, FW: 1.3.0.0)
Renkforce RF-4708614 1GBit adapter (AX88179A, FW: 1.0.4.0)
UGREEN CR110 100MBit adapter (AX88722E, FW: 1.3.0.0)

The driver supports the following features
- EEE
- TCP segmentation offload
- VLAN filtering/tagging offload 
  (NETIF_F_HW_VLAN_CTAG_FILTER, NETIF_F_HW_VLAN_CTAG_RX/TX)
- RX/TX checksum offload
- FC/Pause configuration
- EEPROM read access

The code is based on the ASIX 4.1.0 out-of-tree driver published under
the GPL,, the aqc111 driver which provides support for the AX88279A,
and some tracing of USB-transfers of the Windows-driver.

Tested-by: Jianhui Xu <neuromoments@gmail.com>
Tested-by: Emir Beganovic <beganovic.emir@gmail.com>
Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
---
Changes in v21:
- Drop "default y" in Kconfig for driver
- Rebased and switched to kmalloc_objs
- Link to v20: https://lore.kernel.org/r/20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de

Changes in v20:
- fixed goto-label being called in patch before label defined in later patch 
- Link to v19: https://lore.kernel.org/r/20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de

Changes in v19:
- Use WRITE_ONCE to set net->mtu and move before changing JUMBO-register flag
- Set TX-Offload HW flags depending on dev->net->features at reset
- In ax88179_set_features() init stack variables to prevent leaking stack memory
  to device
- Fix back writing of VLAN table using Write-Execute bit, add futher comments
  and make sure VFE and VSO bits are preserved
- Make manipulating data->rxctl in ax88179_set_multicast() atomic
- Include include phylink_resume() in error-exit path of suspend(()
- Exclude setting MAC-address in resume path in ax88179a_reset()
- Ensure to restart auto-negotiation if a user only changes the
  2.5G advertisement bit
- Link to v18: https://lore.kernel.org/r/20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de

Changes in v18:
- Add also check for PHY_BROKEN_FORCED in phy_mii_ioctl() to prevent
  users to circumvent check via ioctl.
- Do not unconditionally dereference phydev->drv when it might be NULL
  in phy_ethtool_ksettings_set()
- Fix RTNL deadlock accessing mtu-settings by using dedicated lock for mtu access
- Use get_unaligned_le64() instead of le64_to_cpup() to
  support older architectures
- Add check for skb_cloned() before buffer resize
- Add explicit handling of disabling of NETIF_F_HW_VLAN_CTAG_FILTER
- Fix clobbering of AX_VLAN_CONTROL_VFE bit when setting AX_VLAN_CONTROL_WE
- Do no longer use XOR to change AX_VLAN_CONTROL_VFE by conditional clear/set
  of bit in if/else block to prevent theoretical de-synching of bit and OS state
- Make sure interface is enabled when resuming phylink in suspend error-path
- Fix leaking in_pm / unbalanced suspend_count in suspend error-path
- Add pm_runtime_put_noidle() to unbind()
- Reorder setting MII_ADVERTISE and genphy_config_aneg()
- Remove possible 1000M-bits reported by AX88772D when reading MII_ESTATUS
- Link to v17: https://lore.kernel.org/r/20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de

Changes in v17:
- Fix clang warnings from kernel-robot
- Link to v16: https://lore.kernel.org/r/20261004-ax88179a-v16-0-2a9ae4e68f7b@birger-koblitz.de

Changes in v16:
- Fix error-checking in VLAN-offload code
  as Suggested-by: Jianhui Xu <neuromoments@gmail.com>
- Link to v15: https://lore.kernel.org/r/20261002-ax88179a-v15-0-131d9286fcd7@birger-koblitz.de

Changes in v15:
- Removed already committed patch fixing pause watermark register
  endianess
- Rebased
- Link to v14: https://lore.kernel.org/r/20260929-ax88179a-v14-0-a1f2249e42ea@birger-koblitz.de

Changes in v14:
- Fix return value handling in VLAN offload functions
- Add explanatory comment for phylink_mac_interrupt()
- Link to v13: https://lore.kernel.org/r/20260927-ax88179a-v13-0-4fac6b3e032e@birger-koblitz.de

Changes in v13:
- Add MODULE_ALIAS to ax88179_178a
- Squashed commit adding netdev2data() into the first one needing it
- Add wrappers ax88179_write_u8/ax88179_write_u16
- Use FIELD_GET() FIELD_PREP() in fixups.
- Add guard for phydev->drv NULL in phy_ethtool_ksettings_set()
- Various endianess fixes in fixups
- Add error checking for too small packets in ax88179a_rx_fixup
- Typo fixed:  ax88179_read_cmd -> ax88179_write_cmd setting PHY power
- Changed call to usbnet_nway_reset by phy_ethtool_nway_reset
- ax88179a_bulkin_config() handles FS USB now for all chip versions
- Use phylink versions of calls for get/set_link_ksettings
- Add handling of return values of ax88179_read_cmd() in various places
- Removed usbnet_link_change(dev, 0, 0); at the end of ax88179a_reset().
- Add RTLN-lock to protect AX_MEDIUM_STATUS_MODE register,
  WRITE_ONCE/READONCE for rxctl.
- Changed to clearing AX_XGMII_EN for all speeds != SPEED_2500 independent
  of chip-id.
- Fix access to AX88179A_MAC_RX_DATA_CDC_CNT by using 2 1-byte writes.
- In ax88179a_mac_link_up initialize link_status.
- Added setting of AX_GPHY_EEE_CTRL to disabled in ax88179a_reset(),
  consistent with phylink default.
- Various commit messages fixed
- Conditionally set AX_VLAN_CONTROL_VFE after loop over the VLAN-entries
- Moved code in wrong commits to the right ones (2x).
- Fix races around rx_checksum flag setting.
- Suspend/resume fixes: correct sequence of WoL settings and usbnet/phylink
  suspend calls.
- Read revision number into the 4th field of software version
- Kconfig descriptiona and module description mention 2.5GBit
- Fix orphaned defconfigs
- Fix EEPROM access settings derived from chip versions
- Fix EEPROM read error checking
- Return value checking in asix_ax88279_read_status()
- Added clearing of ETHTOOL_LINK_MODE_2500baseT_Full_BIT in lp_advertising
  before modifying the bit.
- In asix_ax88279_read_status() add if (!phydev->link) guard
- Linkmode cleaning code shortened.
- Link to v12: https://lore.kernel.org/r/20260916-ax88179a-v12-0-60c04c9924a2@birger-koblitz.de

Changes in v12:
- Fix BCD ranges for USB device detection
- Free SKB in ax88179a_tx_fixup() when skb_linearize() fails
- Use phylink_mii_ioctl instead of usbnet_mii_ioctl
- Link to v11: https://lore.kernel.org/r/20260914-ax88179a-v11-0-5ea7a925ba6d@birger-koblitz.de

Changes in v11:
- Fix sparse warnings
- Link to v10: https://lore.kernel.org/r/20260904-ax88179a-v10-0-b5e60eca7690@birger-koblitz.de

Changes in v10:
- Fix missing variable declaration in ax88179a_status()
- Add reviewed-bys
- Link to v9: https://lore.kernel.org/r/20260902-ax88179a-v9-0-8e6d7710a2ae@birger-koblitz.de

Changes in v9:
- Fix ax88179a_status() to not call carrier-related netif or usbnet methods
- Use genphy_read_mmd_c45() and genphy_write_mmd_c45()
- Link to v8: https://lore.kernel.org/r/20260831-ax88179a-v8-0-de905f2ee426@birger-koblitz.de

Changes in v8:
- Fix resume sequence as Suggested-by: Jianhui Xu <neuromoments@gmail.com>
- Add handling of PHYs with broken forced mode in phylib to handle AX88279 PHY
- Multple formatting fixes
- Fix transiently unused functions ax88179a_mac_disable_tx_lpi() and
  ax88179a_mac_enable_tx_lpi()
- Removed unnecessary checks for dev initialized
- Link to v7: https://lore.kernel.org/r/20260810-ax88179a-v7-0-da633191c129@birger-koblitz.de

Changes in v7:
- Add phylink_mac_interrupt() function to phylink and stop
  polling the PHY to prevent a race condition between the controller
  and phylink when configuring a new link.
- Fix typo in ax88179_read_cmd Reported-by: Jianhui Xu <neuromoments@gmail.com>
- Return -EOPNOTSUPP in asix_ax88279_config_aneg when autoneg is being disabled
- Link to v6: https://lore.kernel.org/r/20260806-ax88179a-v6-0-fde7414619e6@birger-koblitz.de

Changes in v6:
- Use genphy_read_status() in asix_ax88279_read_status()
- Use SGMII and 2500BaseX interfaces for PHY
- Fix speed determination of MAC/PHY link
- Fix bulk transfer configuration to use enums for bulk configuration types
- Link to v5: https://lore.kernel.org/r/20260802-ax88179a-v5-0-dcb9fea4acd4@birger-koblitz.de

Changes in v5:
- Fixed read_status() and config_aneg() in PHY driver
- Introduced netdev2data() as convenience function
- netdev_info instances and debugging relicts removed
- Several instances of badly written/formatted code that was copy and pasted from
  the original driver corrected
- select PHYLINK added to Kconfig when phylib dependency added
- PHYLINK selects PHYLIB, so not needed to specify separately
- Link to v4: https://lore.kernel.org/r/20260731-ax88179a-v4-0-2cf1f71b1dd2@birger-koblitz.de

Changes in v4:
- Split driver into library part and part2 for AX88179 and AX88179A-based
  controllers
- Driver renamed ax88179
- Improved phylink use: use phylink standard functions for speed and EEE-settings,
  correct MAC capabilities, removed ax88179_status() irq-urb callback
- Fixes in PHY driver for AX88179A integrated PHYs
- Link to v3: https://lore.kernel.org/r/20260724-ax88179a-v3-0-bdde4f905883@birger-koblitz.de

Changes in v3:
- Add PHY drivers for the PHYs of the AX88179A-based controllers
- Use phylink for the AX88179A-based chips
- Link to v2: https://lore.kernel.org/r/20260708-ax88179a-v2-0-0800fedb2e16@birger-koblitz.de

Changes in v2:
- Correctly use net-next prefix
- Fix compilation issue in HW support patch
- Split MMD support patch into patches for EEE/new chip support
- Do not use ADVERTISE_RESV but private flag definition
- Fix pause configuration to keep track of settings when autoneg disabled
- Fix issue with unitialized variable reported by kernel test robot <lkp@intel.com>
- Avoid white-space changes

- Link to v1: https://lore.kernel.org/r/20260701-ax88179a-v1-0-13685df67515@birger-koblitz.de

---
Birger Koblitz (13):
      phylink: Add phylink_mac_interrupt
      phylib: Add support for PHYs with broken forced mode
      ax88179_178a: Split driver into library and device specific code
      ax88179_178a: Add HW support for AX179A-based chips
      ax88179_178a: Add EEE configuration support for AX88179A MACs
      ax88179_178a: Add EEE configuration support for AX88179A PHYs
      ax88179_178a: Add VLAN offload support for AX88179A
      ax88179_178a: Add AX179A/AX279 multicast configuration
      ax88179_178a: Add Suspend/resume support for AX88179A/772D/279
      ax88179_178a: Add ethtool get_drvinfo
      ax88179_178a: Update driver name and information
      ax88179_178a: Add support for AX88179A/772D/279 EEPROM access
      ax88796b: Add support for AX88772D, AX88179A and AX88279

 MAINTAINERS                                 |    6 +
 arch/loongarch/configs/loongson32_defconfig |    2 +-
 arch/loongarch/configs/loongson64_defconfig |    2 +-
 drivers/net/phy/ax88796b.c                  |  165 ++++
 drivers/net/phy/phy.c                       |    7 +
 drivers/net/phy/phylink.c                   |   20 +
 drivers/net/usb/Kconfig                     |   11 +-
 drivers/net/usb/Makefile                    |    3 +-
 drivers/net/usb/ax88179_178a.c              |  659 +-------------
 drivers/net/usb/ax88179_lib.c               |  545 +++++++++++
 drivers/net/usb/ax88179_lib.h               |  360 ++++++++
 drivers/net/usb/ax88179a_devices.c          | 1311 +++++++++++++++++++++++++++
 include/linux/phy.h                         |    1 +
 include/linux/phylink.h                     |    1 +
 14 files changed, 2471 insertions(+), 622 deletions(-)
---
base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
change-id: 20260630-ax88179a-a1d89fe21730

Best regards,
-- 
Birger Koblitz <mail@birger-koblitz.de>

