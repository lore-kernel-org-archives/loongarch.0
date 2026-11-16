Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794832;
	b=5gSsgvnUjBBzOpChM/ijwpB39katfoMt6yY3R3+J2F/qHcm/3MhTiD3UTqryc+H7q12M
	 rfxn8uy4+ESqOd5vhDajF1p75W1DiZGOvyFxjVit0IDLMgGmCTDOiHEKz7no2/qEUIaCj
	 +GoqGCOQmXkAnMliuKHfXvqHNKYgaIfhkMEaniqeL/BkxWVu0Wc9Nu8sWwQQgJL6u/alK
	 BrDqxFIOshVsgvp2zCAW+RQJRoIruE7pCl1QITCHIH9AbqG4f/WEfd+wjCzQSvqr1VYms
	 wm0u7GrD78X8d5Oy/qIfUUBuaz8gGNM6OwvpmLVzFWOZjBiA9Xdr1Lrp/udPf7ILFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794832;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jd41p17RQC6/oN5+mEJT46P4PwFp+oPBriyl8PP+p2o=;
	b=GFWakNfAfOg2dHfUbjomIJ4C+vBxHXlB02H336Ufo79TuWlGkt4+enykCFdu+qxXlYTx
	 F/I/EgCm5ENfUp+fj3CAVchr9tjJkziBSUmFEzYFcSMN6NRkjeyGGFqX1qi1DqrvcL/CO
	 qasiul0M8cP7upUHtBuNuy6NrnW333vc42lBZkrxxJAXLi8VuGiu4s+/SKcS+f1NsmAy8
	 x4FCJtn3Bs7Bqrn1/Z9zqt/7wG3RR+uuZc9io+mHIWlMmGoA5OqZPIq3jiPbLWVA0zs1T
	 azKT4MCiOdxRzWgSV3r4lY5P4mqexncPY5rnOM38LaWBCcoKGsdXnUjdcxT9urK916A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ji11LXTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AAA60A2609;
	Mon, 16 Nov 2026 02:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ji11LXTQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147D1F000CA;
	Mon, 16 Nov 2026 02:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794831;
	bh=jd41p17RQC6/oN5+mEJT46P4PwFp+oPBriyl8PP+p2o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ji11LXTQpcOfi2uOdhif1RECePgcTyuUUsmmn13MuvStIZd3v0iLhfgHMV53ggS3W
	 0XVp0CLp1hc2A0/8aaCdljNAn1jOBzm29hHNMSXlaXRQ3cAVKCV3NkZoB5BWJtqV03
	 w0tp69lojywMdfqba3fEgSt/WQG5YSxjqAcCo0HcAy+MsRoznRthKtFMNG1sYEYUxa
	 TVI+oxjicrHJC0Zwnn58UBd8QwvbYpjniMDjMWd46lNOgsBNlXmMeNu7sbWx50JSsY
	 i8rrLoVM48wHYJtqoRnbwQa8l8nzflG1YAapDwYo3gJaCDNmoUMcJ0njKdiZFH4ce0
	 5gQ/XBFjeN/uw==
Subject: Re: [PATCH net-next v21 13/13] ax88796b: Add support for AX88772D,
 AX88179A and AX88279
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:10 +0000
Message-ID: <179479483039.3136.9639531602178863442@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-13-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-13-c2d34410bcbe@birger-koblitz.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The three new PHY IDs (AX88772D 0x003b772d, AX88179A
  0x003b179a, AX88279 0x003b2790) are added only to the C driver…
- [Medium] In asix_ax88279_read_status(), the 2500baseT_Full bit in
  phydev->lp_advertising is cleared and recomputed only after the `if…
- [Low] In asix_ax88772D_get_features() (drivers/net/phy/ax88796b.c, line
  215-216), `phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD |…
- [Low] asix_ax88279_read_status() always sets `phydev->duplex =
  DUPLEX_FULL` (line 142) with the comment "Only supports full duplex".
- [Low] asix_ax88772D_get_features() removes
  1000baseT_Full/1000baseT_Half/1000baseX_Full from phydev->supported…

--

ax88796b: Add support for AX88772D, AX88179A and AX88279

This adds PHY IDs and driver entries for the internal PHYs of the ASIX
AX88772D, AX88179A and AX88279 USB Ethernet controllers. The AX88279 gets
its own get_features, config_aneg, read_status and config_init callbacks.
They handle 2.5G advertisement, read the speed from a vendor register, and
switch the interface between SGMII and 2500BASE-X.

> diff --git a/drivers/net/phy/ax88796b.c b/drivers/net/phy/ax88796b.c
> index f20ddf6491499..0df44e0e236ab 100644
> --- a/drivers/net/phy/ax88796b.c
> +++ b/drivers/net/phy/ax88796b.c

[ ... ]

> @@ -83,6 +96,107 @@ static int asix_ax88772a_read_status(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int asix_ax88279_read_status(struct phy_device *phydev)
> +{
> +	int ret, val;
> +
> +	ret = genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (!phydev->link)
> +		return 0;

[ ... ]

> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT, phydev->lp_advertising);
> +	val = phy_read_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_STAT);
> +	if (val >= 0 && val & MDIO_AN_10GBT_STAT_REMOK) {
> +		linkmode_mod_bit(ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> +				 phydev->lp_advertising,
> +				 phydev->speed == SPEED_2500);
> +	}

[Severity: Medium]
Can the 2500baseT_Full bit that is set here stay in lp_advertising after
the link goes down?

This is the only place in asix_ax88279_read_status() that clears it, and
it comes after the early return on !phydev->link.

When a 2.5G link drops, genphy_read_status()->genphy_read_lpa() runs with
autoneg_complete false. That path only clears the C22 and 1000BASE-T
partner bits:

drivers/net/phy/phy_device.c:genphy_read_lpa() {
    ...
		if (!phydev->autoneg_complete) {
			mii_stat1000_mod_linkmode_lpa_t(phydev->lp_advertising,
							0);
			mii_lpa_mod_linkmode_lpa_t(phydev->lp_advertising, 0);
			return 0;
		}
    ...
}

The driver then returns before it gets to this linkmode_clear_bit(). As a
result, ethtool would show the link partner advertising 2500baseT/Full
while the link is down.

On the next link-up, phy_resolve_aneg_linkmode() also runs with the stale
bit still set. The AX_CTRL_STATUS read afterwards does correct the final
speed.

Should the bit be cleared before the !phydev->link check?

> +	/* Only supports full duplex */
> +	phydev->duplex = DUPLEX_FULL;

[ ... ]

> +static int asix_ax88279_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
> +	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +
> +	linkmode_set_bit_array(phy_basic_ports_array, ARRAY_SIZE(phy_basic_ports_array),
> +			       phydev->supported);
> +
> +	ret = genphy_c45_pma_read_abilities(phydev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* AX88279 does not support reported 100baseT-half duplex mode */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, phydev->supported);

[Severity: Low]
Should 10baseT_Half be cleared here too?

genphy_c45_pma_read_ext_abilities() sets both 10baseT_Full and
10baseT_Half from the single MDIO_PMA_EXTABLE_10BT bit. 10M also looks
supported, since asix_ax88279_read_status() decodes
AX_CTRL_STATUS_SPEED_10.

However, asix_ax88279_read_status() always reports full duplex:

	/* Only supports full duplex */
	phydev->duplex = DUPLEX_FULL;

If 10baseT_Half ends up in advertising, genphy_config_advert() writes
ADVERTISE_10HALF. A partner that only does 10M half duplex would then
resolve to 10/half while the driver reports full duplex.

The in-tree consumer, ax88179a_phylink_setup() in
drivers/net/usb/ax88179a_devices.c, does not give the AX88279 MAC_10.
phylink_bringup_phy() also replaces the PHY advertising with the validated
mask. So this cannot be hit through that driver today, but the supported
mask still disagrees with what read_status reports.

> +
> +	return 0;
> +}

[ ... ]

> @@ -94,6 +208,25 @@ static void asix_ax88772a_link_change_notify(struct phy_device *phydev)
>  	}
>  }
>  
> +static int asix_ax88772D_get_features(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	/* MDIO_DEVS1/2 empty, so set mmds_present bits to allow reading abilities */
> +	phydev->c45_ids.mmds_present |= MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +
> +	ret = genphy_read_abilities(phydev);

[Severity: Low]
This isn't a bug, but is the mmds_present assignment needed here?

genphy_read_abilities() is the C22 helper and never reads mmds_present.
In the tree, mmds_present is only read by genphy_c45_pma_read_abilities(),
genphy_c45_read_link() and phylink's C45 ioctl emulation. None of those
are on the AX88772D path.

It looks copied from asix_ax88279_get_features(), which does call
genphy_c45_pma_read_abilities(). Here the comment does not match what the
code does.

> +	if (ret < 0)
> +		return ret;
> +
> +	/* AX88772D does not support (possibly) reported 1000baseT modes */
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT, phydev->supported);
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT, phydev->supported);
> +	linkmode_clear_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT, phydev->supported);

[Severity: Low]
Can supported_eee keep 1000baseT_Full after these bits are cleared?

genphy_read_abilities() has already called
genphy_c45_read_eee_abilities(). That masks supported_eee against
supported as supported was at that point:

drivers/net/phy/phy-c45.c:genphy_c45_read_eee_cap1() {
    ...
	linkmode_and(phydev->supported_eee, phydev->supported_eee,
		     phydev->supported);
    ...
}

If ESTATUS reported 1000BT, that mask still includes 1000baseT_Full.
Nothing trims supported_eee again afterwards, and phy_probe() only ANDs
advertising_eee with supported_eee.

With ax88179a_phylink_setup() no lpi_capabilities are set for AX88772D, so
phylink calls phy_disable_eee() and this does not show up today. Would it
make sense to also clear the 1000BASE-T EEE modes from supported_eee here?

> +
> +	return 0;
> +}

[ ... ]

> @@ -124,6 +286,9 @@ static const struct mdio_device_id __maybe_unused asix_tbl[] = {
>  	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A) },
>  	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772C) },
>  	{ PHY_ID_MATCH_MODEL(PHY_ID_ASIX_AX88796B) },
> +	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772D) },
> +	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88179A) },
> +	{ PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88279) },
>  	{ }
>  };

[Severity: Medium]
What happens to these PHYs when CONFIG_AX88796B_RUST_PHY=y?

drivers/net/phy/Makefile builds only one of the two drivers:

ifdef CONFIG_AX88796B_RUST_PHY
  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b_rust.o
else
  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
endif

drivers/net/phy/ax88796b_rust.rs still registers only:

    drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],

In that configuration, the IDs reported by ax88179_mdiobus_read() in
drivers/net/usb/ax88179a_devices.c would bind to the Generic PHY driver.
The AX88279 would then lose:

  - the C45 2.5G ability read
  - the AX_ADVERTISE_2500 write
  - the AX_CTRL_STATUS speed decoding
  - the SGMII/2500BASE-X interface switching

The AX88796B_RUST_PHY help text in drivers/net/phy/Kconfig also still
says:

	  The features are equivalent. It supports the Asix Electronics PHY
	  found in the X-Surf 100 AX88796B package.

The AX88796B_PHY help text still describes only the X-Surf 100 AX88796B
PHY.

Should the Rust driver get matching entries, or should Kconfig be updated
to reflect the difference?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
