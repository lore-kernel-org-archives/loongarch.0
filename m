Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794818;
	b=OwEo7uOiM8niKwJNhHeXlxHguZ7da4H6CDl/yGsRnAXYItqHBuZzJzhOTMt1LEx61v9m
	 agUN9lBFhlZP0GtMRnbh/3UY9WbG6qb0D7/ITtFGClJ2X4v4X6b3ICn40kJIS3f2iczw5
	 XxyxKWC6/1FeZRnRWKuj9ul30ks0qw43UJSYKq+hGW8H/zsrH6hNC9clmd2eMm/rUPrhg
	 AnR71wyU63gBKbllxDHYQiaz/dUm0dPLRzjwIK4KdhRfh4esWbBvVzXV+yQEOZ6rNH+8E
	 zviQ+SeRDgep6jp0WGu9UIwo9uPd2z3nBb7ktDf3AINMOwqt9OdBHw1NmhaZyJkpg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794818;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=G0DPfg+JSTm5QkF+d5s0q6+unTYAHUfdct5rGITcQVs=;
	b=QShfX4tFEQPiN/cE66q5ZcRwKrAXWCgCY/cDll1WReD0zbcxkCXOZqHb6LF9LEWq5816
	 KRcv7C/n6yl+1EC869j5Fd54znoii7nypVHby8nuIcD5TyzUDDS2cRcjnaYPmDja5f+NF
	 6W6MxoIy9BRvia6TWJCE/AjprfJEyS280RarnTmE/NTQ/P4NcoM4aayJVmsvR9PUuk+es
	 ip4K9CTun1vkgWcPWPM6xiLdaztGH8nz2e53PSLMLd0oCBPO/T2HNjoKVpb/300FAn9kW
	 wMz7mTRfVp3g0TtpY+WkUXDdABm0k12ZE2gk9YBvJkAYQ4tVA11psRshrGHnAp4fSeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Athumidn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC056606A889;
	Mon, 16 Nov 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Athumidn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2191F000CB;
	Mon, 16 Nov 2026 02:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794818;
	bh=G0DPfg+JSTm5QkF+d5s0q6+unTYAHUfdct5rGITcQVs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AthumidnRm/8tUyyKISZdcQ4RQ9Zd3KhWLEt48/BQ//JzP04x1eAzS1XdkJBsG5YC
	 ZZRZsF4oE/rVGConiQ4KDR3TMeqboerMsFwpQvwo31d6cui4d2d73nzqo/cgdMerNh
	 GQ1AD7bbw/pMVxofdkHkaHCM3HLsFLa4lj1LtuNEXyOH1VuTMSN8kt/jAofn5H8Zuv
	 5XlRiiM9Us0HqfVa8VEa6Hi+ElGz1uHMgFm5KYPLbSjkRYP5S/59XZ/iGteHlkLTjc
	 R/adLqgzpDnFgRUia63ngHoMhbOnveXcWQgOTSUlHXrPn6XCtXDC+FOwWAO6rxKIh0
	 uJcNZWj1VSR3A==
Subject: Re: [PATCH net-next v21 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:06:57 +0000
Message-ID: <179479481713.3136.1379566245572435988@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-4-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-4-c2d34410bcbe@birger-koblitz.de>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 14 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 9 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: usb: ax88179: UAF on unbind when down due to
  FLAG_AVOID_UNLINK_URBS
- [Medium] The commit message says that by default Linux binds CDC-NCM,
  and that the vendor interface is used only 'if the ax88179_178a module…
- [Medium] ax88179a_rx_fixup() drops any frame with `pkt_len >
  (dev->hard_mtu + AX179A_RX_HW_PAD)`.
- [Medium] ax88179a_mac_link_up() and ax88179a_mac_link_down() never call
  usbnet_link_change().
- [Medium] ax88179a_tx_fixup() programs the hardware TSO MSS from
  skb_shinfo(skb)->gso_size (NETIF_F_TSO is advertised), but reports…
- [Medium] ax88179a_tx_fixup() linearizes only when `!dev->can_dma_sg &&
  (dev->net->features & NETIF_F_SG)`, i.e. based on the live feature bit…
- [Medium] In ax88179a_mac_link_up(), the SPEED_2500 branch programs
  three registers that the 1000/100/10 branches never write back.
- [Medium] net: usb: ax88179_178a: missing wol_supported init in
  ax88179a_bind()
- [Medium] net: usb: ax88179_178a: positive return from
  ax88179_mdiobus_write() and c45
- [Medium] net: usb: ax88179a: ax88179a_reset() clobbers custom MAC and
  perm_addr on open
- [Low] ax88179a_reset() is usbnet's info->reset hook.
- [Low] In ax88179a_mac_link_up(), the return value of
  `ax88179_read_cmd(dev, AX_ACCESS_MAC, PHYSICAL_LINK_STATUS, 1, 1,…
- [Low] The pause water-level registers get contradictory values.
- [Low] ax88179a_bind() switches the firmware mode (AX_FW_MODE_179A) and
  powers the Ethernet PHY with `ax88179_write_u8(dev,…

--

ax88179_178a: Add HW support for AX179A-based chips

This adds support for the AX88179A/B, AX88772D/E and AX88279 USB Ethernet
controllers. All of them share the 0b95:1790 ID and are told apart by
bcdDevice. A new ax88179a_devices.c provides bind/reset/stop, RX/TX
framing and a phylink/MDIO based PHY setup, and switches the device from
its CDC-NCM configuration to the vendor configuration.

> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index 55268d0890d12..f78ad344c1c4f 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c

[ ... ]

> @@ -1271,6 +1290,18 @@ static const struct driver_info at_umc2000sp_info = {
>  
>  static const struct usb_device_id products[] = {
>  {
> +	/* ASIX AX88179A USB 3.2 1000Mbit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0200, 0x0200),
> +	.driver_info = (unsigned long)&ax88179a_info,
> +}, {
> +	/* ASIX AX88772D USB 2.0 100Mbit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0300, 0x0300),
> +	.driver_info = (unsigned long)&ax88772d_info,
> +}, {
> +	/* ASIX AX88279 USB 3.2 2500Mbit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0400, 0x0400),
> +	.driver_info = (unsigned long)&ax88279_info,
> +}, {
>  	/* ASIX AX88179 10/100/1000 */
>  	USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),
>  	.driver_info = (unsigned long)&ax88179_info,

[Severity: Medium]
The commit message says:

  By default, the proprietary vendor interface is not active and Linux
  will load the CDC-NCM driver to support the devices. If the
  ax88179_178a module is configured by the OS to have precedence over
  CDC-NCM, then this driver will switch the device to use the vendor
  interface

Do these new entries behave that way? USB_DEVICE_VER() only sets
USB_DEVICE_ID_MATCH_DEVICE_AND_VERSION. That means the entries match
every interface of the device, including the CDC-NCM control and data
interfaces of the default configuration. The existing 0b95:1790 entry
uses USB_DEVICE_AND_INTERFACE_INFO(..., 0xff, 0xff, 0), and that entry
can't match CDC class interfaces.

Once one of these entries matches, ax88179a_bind() always switches the
configuration:

	if (udev->actconfig->desc.bConfigurationValue != 1) {
		netdev_info(dev->net, "Switching to vendor mode\n");
		usb_driver_set_configuration(udev, 1);
		return -ENODEV;
	}

In drivers/net/usb/Makefile, ax88179.o is linked before cdc_ncm.o. When
both drivers are built in, this driver registers first and is offered
the CDC interfaces first. With modules, the result depends on load
order.

Won't adapters that work through cdc_ncm today then always be switched
to the vendor configuration, with no way to opt out? If that is
intended, could the commit message say so?

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> new file mode 100644
> index 0000000000000..1aa8479422517
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -0,0 +1,983 @@

[ ... ]

> +static void ax88179a_mac_link_down(struct phylink_config *config,
> +				   unsigned int mode, phy_interface_t interface)
> +{
> +	/* Nothing to do */
> +}

[Severity: Medium]
Should ax88179a_mac_link_down() and ax88179a_mac_link_up() call
usbnet_link_change(), as ax88772_mac_link_down() and
ax88772_mac_link_up() in asix_devices.c do?

Without that call, nothing queues dev->bh_work when phylink turns the
carrier on. usbnet_bh() doesn't submit RX URBs while the carrier is off:

usbnet_open()
  ax88179a_reset()
    phylink_start()          <- carrier set off
  queue_work(system_bh_wq, &dev->bh_work)
    usbnet_bh()              <- !netif_carrier_ok(), no RX URBs

phylink_resolve()
  ax88179a_mac_link_up()
  netif_carrier_on()         <- bh_work is not queued

After that, RX URBs are only posted when something else runs
usbnet_bh(), typically a TX completion.

Could a host that doesn't transmit after link-up (static addressing, no
IPv6 or DHCP traffic) then never receive packets? The same sequence
looks possible after resume, because phylink_resume() restarts phylink
with the carrier off.

> +static void ax88179a_mac_link_up(struct phylink_config *config,
> +				 struct phy_device *phy,
> +				 unsigned int phy_mode, phy_interface_t interface,
> +				 int speed, int duplex,
> +				 bool tx_pause, bool rx_pause)
> +{

[ ... ]

> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 2, 0x0410);

[Severity: Low]
ax88179_write_u16() stores the value little endian. So this writes 0x10
to AX_PAUSE_WATERLVL_LOW (0x54) and 0x04 to AX_PAUSE_WATERLVL_HIGH
(0x55). ax88179a_reset() programs the opposite values:

	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 0x04);
	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH, 1, 0x10);

Which ordering is intended? In practice the link-up values win, because
mac_link_up() runs before any traffic. They also follow the LOW > HIGH
ordering of the legacy chip (0x52/0x34), so the reset values look
inverted.

[ ... ]

> +	switch (speed) {
> +	case SPEED_2500:
> +		reg8[0] = 0x00;
> +		reg8[1] = 0xF8;
> +		reg8[2] = 0x07;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_PAUSE, 3, 3, reg8);
> +
> +		reg8[0] = 0x78;
> +		reg8[1] = (AX_LSOFC_WCNT_7_ACCESS << 5);
> +		reg8[2] = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_STATUS_CDC, 3, 3, reg8);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT, 1, 0x40);
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT + 1, 1,
> +				 AX_MAC_MIQFFCTRL_FORMAT | AX_MAC_MIQFFCTRL_DROP_CRC |
> +				 AX_MAC_LSO_ERR_EN);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_BFM_DATA, 1, AX_XGMII_EN);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_LSO_ENHANCE_CTRL, 1,
> +				 0x1C | AX_LSO_ENHANCE_EN);

[Severity: Medium]
The SPEED_2500 case writes three registers: AX88179A_MAC_TX_PAUSE,
AX88179A_MAC_RX_DATA_CDC_CNT + 1 and AX88179A_MAC_LSO_ENHANCE_CTRL. The
1000, 100 and 10 cases never write them, and ax88179a_reset() doesn't
initialize them either. Only AX88179A_BFM_DATA is cleared for the other
speeds:

	if (speed != SPEED_2500)
		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_BFM_DATA, 1, 0);

Suppose an AX88279 renegotiates from 2.5G down to 1G or 100M without a
device reset. Does the MAC keep the 2.5G RX FIFO format, CRC drop and
LSO enhance settings, now combined with AX_GMII_CRC_APPEND in
AX88179A_MAC_RX_STATUS_CDC?

A fresh lower-speed link-up never programs that combination. The
hardware effect can't be confirmed without the ASIX documentation.

[ ... ]

> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, PHYSICAL_LINK_STATUS, 1, 1, &link_sts);
> +	ax88179a_bulkin_config(dev, link_sts, bulk_config_speed, !!duplex);

[Severity: Low]
The return value of this read is ignored. On failure the 1-byte buffer
is left untouched, so link_sts stays 0 and ax88179a_bulkin_config() sees
none of the SS/HS/FS bits. index then stays 0 for ETHER_LINK_1000. For
ETHER_LINK_100 it is 0, or 1 for half duplex.

Those slots are not initialized in the sparse tables.
AX88179A_BULKIN_SIZE[BULK_IN_SPEED_2G5] and AX88772D_BULKIN_SIZE[0..4]
are all zeros.

Would this write zero for ctrl, timer, size and ifg to
AX_RX_BULKIN_QCTRL, with no error reported, and leave it that way until
the next link-up?

[ ... ]

> +	/* Power PHY for probing */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, AX_PHY_POWER);
> +	msleep(250);
> +
> +	ret = ax88179a_init_mdio(dev);
> +	if (ret)
> +		goto err_nodev;
> +
> +	ret = ax88179a_phylink_setup(dev);
> +	if (ret)
> +		goto phylink_err;
> +
> +	ret = ax88179a_init_phy(dev);
> +	if (ret)
> +		goto initphy_err;
> +
> +	return 0;
> +
> +initphy_err:
> +	phylink_destroy(ax179_data->phylink);
> +phylink_err:
> +	ax88179a_mdio_unregister(ax179_data);
> +err_nodev:
> +	kfree(ax179_data);
> +	ax179_data = NULL;
> +
> +	return ret;
> +}

[Severity: Low]
Suppose ax88179a_init_mdio(), ax88179a_phylink_setup() or
ax88179a_init_phy() fails (for example with "Could not find PHY"). The
error labels unwind phylink, the MDIO bus and ax179_data, but
AX88179A_PHY_POWER is never written back to 0.

Does this leave the PHY powered, possibly with the copper link up, on a
device the driver has abandoned? ax88179a_unbind() and ax88179a_stop()
both power the PHY down explicitly.

[ ... ]

> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> +{

[ ... ]

> +		if (pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK) ||
> +		    pkt_len > (dev->hard_mtu + AX179A_RX_HW_PAD) || pkt_len < 2 + ETH_HLEN) {

[Severity: Medium]
ax88179a_bind() sets dev->hard_mtu to 9 * 1024. However, ndo_change_mtu
is ax88179_change_mtu(), which overwrites it:

drivers/net/usb/ax88179_lib.c:ax88179_change_mtu() {
    ...
	dev->hard_mtu = net->mtu + net->hard_header_len;
    ...
}

After any MTU change, this check drops frames longer than mtu + 16.

With an MTU of 1500, wouldn't a full-size 802.1Q tagged frame (1518
bytes) be dropped? VLAN RX tag stripping isn't enabled, so the tag stays
in the frame.

Before the first MTU change, frames up to about 9218 bytes are accepted.
So whether a frame is accepted depends on whether the MTU was ever
changed.

[ ... ]

> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
> +{

[ ... ]

> +	if (!dev->can_dma_sg && (dev->net->features & NETIF_F_SG) && skb_linearize(skb)) {
> +		dev_kfree_skb_any(skb);
> +		return NULL;
> +	}
> +
> +	headroom = skb_headroom(skb);
> +	tailroom = skb_tailroom(skb);
> +
> +	if (skb_cloned(skb) || !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
> +		ax_skb = skb_copy_expand(skb, sizeof(tx_desc), padding_size, flags);
> +		dev_kfree_skb_any(skb);
> +		skb = ax_skb;
> +		if (!skb)
> +			return NULL;
> +	}
> +	if (padding_size != 0)
> +		skb_put_zero(skb, padding_size);

[Severity: Medium]
Linearization here depends on the current NETIF_F_SG bit, not on whether
the skb is actually non-linear. Feature updates are not serialized
against the transmit path.

If SG is cleared with ethtool -K in the window after validate_xmit_skb()
has accepted a non-linear skb and before usbnet_start_xmit() calls this
tx_fixup, skb_linearize() is skipped.

For a non-cloned skb with enough tailroom, skb_put_zero() would then hit
SKB_LINEAR_ASSERT(). If padding_size is 0, usbnet_start_xmit() without
can_dma_sg submits the skb as one linear buffer:

	usb_fill_bulk_urb(urb, dev->udev, dev->out,
			  skb->data, skb->len, tx_complete, skb);

Can this read past the linear head, up to the 16K GSO size, and send
that memory out on the wire? Would checking skb_is_nonlinear(), or
linearizing whenever !dev->can_dma_sg, avoid this?

> +	/* Copy TX header */
> +	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
> +	put_unaligned_le64(tx_desc, tx_desc_ptr);
> +
> +	usbnet_set_skb_tx_stats(skb, 1, 0);

[Severity: Medium]
NETIF_F_TSO is advertised and the MSS comes from gso_size, so the
hardware splits a GSO skb into several frames. Here it is counted as a
single packet.

Doesn't this undercount tx_packets under TSO? The existing
ax88179_tx_fixup() in the same module uses:

	usbnet_set_skb_tx_stats(skb, (skb_shinfo(skb)->gso_segs ?: 1), 0);

> +static int ax88179a_reset(struct usbnet *dev)
> +{

[ ... ]

> +	/* Ensure EEE state is off, consistent with phylink setup */
> +	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
> +
> +	phylink_start(ax179_data->phylink);
> +
> +	return 0;
> +}

[Severity: Low]
ax88179a_reset() is the info->reset hook that usbnet_open() calls first.
If usbnet_open() fails later, for example because usbnet_status_start()
can't submit the interrupt URB, it jumps to done without calling
info->stop:

	if (dev->interrupt) {
		retval = usbnet_status_start(dev, GFP_KERNEL);
		if (retval < 0) {
			...
			goto done;
		}
	}

Because dev_open() failed, ndo_stop isn't called either, so
phylink_stop() in ax88179a_stop() never runs.

Do phylink and the PHY state machine then keep running, with the PHY
powered, while the interface is down? On the next open, phylink_start()
would be called on an already started phylink. phy_start() would then
WARN, because the PHY is no longer in READY or HALTED.

[ ... ]

> @@ -0,0 +1,983 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/module.h>
> +#include <linux/phylink.h>
> +#include <linux/if_vlan.h>
> +#include "ax88179_lib.h"
> +
> +#define AX88279_EEPROM_LEN			0x4000
> +#define AX88179A_EEPROM_LEN			(32 * 20)
> +
> +enum ax_bulk_in_speeds {
> +	BULK_IN_SPEED_2G5 = 0,
> +	BULK_IN_SPEED_1G_SS = 1,
> +	BULK_IN_SPEED_1G_HS   = 2,
> +	BULK_IN_SPEED_100_FULL_SS = 3,
> +	BULK_IN_SPEED_100_HALF_SS = 4,
> +	BULK_IN_SPEED_100_FULL_HS = 5,
> +	BULK_IN_SPEED_100_HALF_HS = 6,
> +	BULK_IN_SPEED_FS = 7,
> +};
> +
> +static const struct ax_bulkin_settings AX88179A_BULKIN_SIZE[] = {
> +	[BULK_IN_SPEED_1G_SS]		= {5, 0x7B, 0x00, 0x17, 0x0F},
> +	[BULK_IN_SPEED_1G_HS]		= {5, 0xC0, 0x02, 0x06, 0x0F},
> +	[BULK_IN_SPEED_100_FULL_SS]	= {7, 0xF0, 0x00, 0x0C, 0x0F},
> +	[BULK_IN_SPEED_100_HALF_SS]	= {6, 0x00, 0x00, 0x06, 0x0F},
> +	[BULK_IN_SPEED_100_FULL_HS]	= {5, 0xC0, 0x04, 0x06, 0x0F},
> +	[BULK_IN_SPEED_100_HALF_HS]	= {7, 0xC0, 0x04, 0x06, 0x0F},
> +	[BULK_IN_SPEED_FS]		= {7, 0x00, 0x00, 0x03, 0x3F},
> +};
> +
> +static const struct ax_bulkin_settings AX88772D_BULKIN_SIZE[] = {
> +	[BULK_IN_SPEED_100_FULL_HS]	= {5, 0xC0, 0x04, 0x06, 0x0F},
> +	[BULK_IN_SPEED_100_HALF_HS]	= {7, 0xC0, 0x04, 0x06, 0x0F},
> +	[BULK_IN_SPEED_FS]		= {7, 0x00, 0x00, 0x03, 0x3F},
> +};
> +
> +static const struct ax_bulkin_settings AX88279_BULKIN_SIZE[] = {
> +	[BULK_IN_SPEED_2G5]		= {5, 0x10, 0x01, 0x11, 0x0F},
> +	[BULK_IN_SPEED_1G_SS]		= {7, 0xB3, 0x01, 0x11, 0x0F},
> +	[BULK_IN_SPEED_1G_HS]		= {7, 0xC0, 0x02, 0x06, 0x0F},
> +	[BULK_IN_SPEED_100_FULL_SS]	= {7, 0x80, 0x01, 0x03, 0x0F},
> +	[BULK_IN_SPEED_100_HALF_SS]	= {7, 0x80, 0x01, 0x03, 0x0F},
> +	[BULK_IN_SPEED_100_FULL_HS]	= {7, 0x80, 0x01, 0x03, 0x0F},
> +	[BULK_IN_SPEED_100_HALF_HS]	= {7, 0x80, 0x01, 0x03, 0x0F},
> +	[BULK_IN_SPEED_FS]		= {7, 0x00, 0x00, 0x03, 0x3F},
> +};
> +
> +static int ax88179_mdiobus_read(struct mii_bus *bus, int phy_id, int regnum)
> +{
> +	struct usbnet *dev = bus->priv;
> +	struct ax88179_data *priv;
> +	u16 res;
> +	int ret;
> +
> +	priv = dev->driver_priv;
> +	/* When reading PHYSID, return unused PHY-IDs from the ASIX vendor range */
> +	if (phy_id == AX88179_PHY_ID && regnum == MII_PHYSID1)
> +		return 0x003b;
> +	if (phy_id == AX88179_PHY_ID && regnum == MII_PHYSID2) {
> +		if (priv->chip_version == AX_VERSION_AX88179A && priv->is_ax88772d)
> +			return 0x772d;
> +		else if (priv->chip_version == AX_VERSION_AX88179A)
> +			return 0x179a;
> +		else if (priv->chip_version == AX_VERSION_AX88279)
> +			return 0x2790;
> +	}
> +
> +	ret = ax88179_read_cmd(dev, AX_ACCESS_PHY, phy_id, (__u16)regnum, 2, &res);
> +	if (ret < 0)
> +		return ret;
> +	return res;
> +}
> +
> +static int ax88179_mdiobus_write(struct mii_bus *bus, int phy_id, int regnum, u16 val)
> +{
> +	struct usbnet *dev = bus->priv;
> +
> +	return ax88179_write_u16(dev, AX_ACCESS_PHY, phy_id, (__u16)regnum, val);

[Severity: Medium]
ax88179_write_u16() returns whatever __ax88179_write_cmd() returns.
That is the usb_control_msg() result from usbnet_write_cmd(), which
is the number of bytes transferred, so 2 on success.
ax179a_write_mmd() behaves the same way through ax88179_write_cmd().

The mii_bus write and write_c45 callbacks are expected to return 0
on success and a negative errno on failure. __mdiobus_write() and
__mdiobus_c45_write() pass the value straight up. phy_write() and
phy_write_mmd() will therefore return 2 for a successful write on
this bus.

phylib and PHY drivers commonly check the result with if (ret), or
return the phy_write() result directly from a callback. For example,
phy_suspend() only sets phydev->suspended when the driver's suspend
callback returns 0.

Won't those paths treat every successful write on this bus as an
error, or pass 2 up to their callers? Should both
ax88179_mdiobus_write() and ax88179_mdiobus_write_c45() map a
non-negative result to 0?

> +}
> +
> +static int ax179a_read_mmd(struct usbnet *dev, u16 dev_addr, u16 reg)
> +{
> +	u16 res;
> +	int ret;
> +
> +	ret = ax88179_read_cmd(dev, AX88179A_PHY_CLAUSE45, dev_addr, reg, 2, &res);
> +	if (ret < 0)
> +		return ret;
> +	return res;
> +}
> +
> +static int ax179a_write_mmd(struct usbnet *dev, u16 dev_addr, u16 reg, u16 data)
> +{
> +	return ax88179_write_cmd(dev, AX88179A_PHY_CLAUSE45, dev_addr, reg, 2, &data);
> +}
> +
> +static int ax88179_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum, int regnum)
> +{
> +	struct usbnet *dev = bus->priv;
> +
> +	if (addr != AX88179_PHY_ID)
> +		return -EINVAL;
> +
> +	return ax179a_read_mmd(dev, devnum, regnum);
> +}
> +
> +static int ax88179_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,
> +				     int regnum, u16 val)
> +{
> +	struct usbnet *dev = bus->priv;
> +
> +	if (addr != AX88179_PHY_ID)
> +		return -EINVAL;
> +
> +	return ax179a_write_mmd(dev, devnum, regnum, val);
> +}
> +
> +static void ax88179a_status(struct usbnet *dev, struct urb *urb)
> +{
> +	struct ax88179_data *data = dev->driver_priv;
> +
> +	if (urb->actual_length < 8)
> +		return;
> +
> +	phylink_mac_interrupt(data->phylink);
> +}
> +
> +static int ax88179a_auto_detach(struct usbnet *dev)
> +{
> +	u16 tmp16;
> +
> +	tmp16 = AX88179A_AUTODETACH_DELAY;
> +	ax88179_write_cmd(dev, AX88179A_AUTODETACH, tmp16, 0, 0, NULL);
> +	return 0;
> +}
> +
> +static void ax88179a_bulkin_config(struct usbnet *dev, u8 link_sts, u8 speed, bool full_duplex)
> +{
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +	const struct ax_bulkin_settings *bulkin_data;
> +	int index = 0;
> +
> +	switch (speed) {
> +	case ETHER_LINK_2500:	/* AX88279 only */
> +		index = BULK_IN_SPEED_2G5;
> +		break;
> +
> +	case ETHER_LINK_1000:	/* AX88279 & AX88178A */
> +		if (link_sts & AX_USB_SS)
> +			index = BULK_IN_SPEED_1G_SS;
> +		else if (link_sts & AX_USB_HS)
> +			index = BULK_IN_SPEED_1G_HS;
> +		break;
> +
> +	case ETHER_LINK_100:
> +		if (link_sts & AX_USB_SS)
> +			index = BULK_IN_SPEED_100_FULL_SS;
> +		else if (link_sts & AX_USB_HS)
> +			index = BULK_IN_SPEED_100_FULL_HS;
> +		if (!full_duplex)
> +			index++;
> +		break;
> +
> +	case ETHER_LINK_10:
> +		index = BULK_IN_SPEED_FS;
> +		break;
> +
> +	default:	/* No link */
> +		index = BULK_IN_SPEED_FS;
> +	}
> +
> +	if (link_sts & AX_USB_FS)
> +		index = BULK_IN_SPEED_FS;
> +
> +	if (ax179_data->chip_version == AX_VERSION_AX88279) {
> +		bulkin_data = AX88279_BULKIN_SIZE;
> +	} else {
> +		if (ax179_data->is_ax88772d)
> +			bulkin_data = AX88772D_BULKIN_SIZE;
> +		else
> +			bulkin_data = AX88179A_BULKIN_SIZE;
> +	}
> +
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, &bulkin_data[index]);
> +}
> +
> +static void ax88179a_get_pauseparam(struct net_device *net, struct ethtool_pauseparam *pause)
> +{
> +	struct ax88179_data *data = netdev2data(net);
> +
> +	phylink_ethtool_get_pauseparam(data->phylink, pause);
> +}
> +
> +static int ax88179a_set_pauseparam(struct net_device *net, struct ethtool_pauseparam *pause)
> +{
> +	struct ax88179_data *data = netdev2data(net);
> +
> +	return phylink_ethtool_set_pauseparam(data->phylink, pause);
> +}
> +
> +static int ax88179a_get_link_ksettings(struct net_device *net,
> +				       struct ethtool_link_ksettings *cmd)
> +{
> +	struct ax88179_data *data = netdev2data(net);
> +
> +	return phylink_ethtool_ksettings_get(data->phylink, cmd);
> +}
> +
> +static int ax88179a_set_link_ksettings(struct net_device *net,
> +				       const struct ethtool_link_ksettings *cmd)
> +{
> +	struct ax88179_data *data = netdev2data(net);
> +
> +	return phylink_ethtool_ksettings_set(data->phylink, cmd);
> +}
> +
> +static int ax88179a_get_eeprom_len(struct net_device *net)
> +{
> +	struct ax88179_data *ax179_data = netdev2data(net);
> +
> +	if (ax179_data->chip_version >= AX_VERSION_AX88279)
> +		return AX88279_EEPROM_LEN;
> +	else
> +		return AX88179A_EEPROM_LEN;
> +}
> +
> +static const struct ethtool_ops ax88179a_ethtool_ops = {
> +	.get_link		= ethtool_op_get_link,
> +	.get_msglevel		= usbnet_get_msglevel,
> +	.set_msglevel		= usbnet_set_msglevel,
> +	.get_wol		= ax88179_get_wol,
> +	.set_wol		= ax88179_set_wol,
> +	.get_eeprom_len		= ax88179a_get_eeprom_len,
> +	.get_eeprom		= ax88179_get_eeprom,
> +	.set_eeprom		= ax88179_set_eeprom,
> +	.nway_reset		= phy_ethtool_nway_reset,
> +	.get_link_ksettings	= ax88179a_get_link_ksettings,
> +	.set_link_ksettings	= ax88179a_set_link_ksettings,
> +	.get_pauseparam		= ax88179a_get_pauseparam,
> +	.set_pauseparam		= ax88179a_set_pauseparam,
> +	.get_ts_info		= ethtool_op_get_ts_info,
> +};
> +
> +static void ax88179a_mdio_unregister(struct ax88179_data *data)
> +{
> +	mdiobus_unregister(data->mdio);
> +	mdiobus_free(data->mdio);
> +}
> +
> +static int ax88179a_init_phy(struct usbnet *dev)
> +{
> +	struct ax88179_data *data = dev->driver_priv;
> +	int ret;
> +
> +	data->phydev = mdiobus_get_phy(data->mdio, AX88179_PHY_ID);
> +	if (!data->phydev) {
> +		netdev_err(dev->net, "Could not find PHY\n");
> +		return -ENODEV;
> +	}
> +
> +	data->phydev->irq = PHY_MAC_INTERRUPT;
> +	ret = phylink_connect_phy(data->phylink, data->phydev);
> +	if (ret) {
> +		netdev_err(dev->net, "Could not connect PHY\n");
> +		return ret;
> +	}
> +
> +	phy_suspend(data->phydev);
> +	data->phydev->mac_managed_pm = true;
> +
> +	phy_attached_info(data->phydev);
> +
> +	return 0;
> +}
> +
> +static void ax88179a_mac_config(struct phylink_config *config, unsigned int mode,
> +				const struct phylink_link_state *state)
> +{
> +	/* Nothing to do */
> +}
> +
> +static void ax88179a_mac_link_down(struct phylink_config *config,
> +				   unsigned int mode, phy_interface_t interface)
> +{
> +	/* Nothing to do */
> +}
> +
> +static void ax88179a_mac_link_up(struct phylink_config *config,
> +				 struct phy_device *phy,
> +				 unsigned int phy_mode, phy_interface_t interface,
> +				 int speed, int duplex,
> +				 bool tx_pause, bool rx_pause)
> +{
> +	struct usbnet *dev = netdev_priv(to_net_dev(config->dev));
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +	u8 link_sts = 0, reg8[3];
> +	u8 bulk_config_speed = 0;
> +	u16 mode;
> +
> +	/* Stop RX/TX for link configuration */
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1, 0);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_CDC_DELAY_TX, 1, 0xa5);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 2, 0x0410);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_ETH_TX_GAP, 1, 0);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_EP5_EHR, 1, 0x07);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_NEW_PAUSE_CTRL, 1,
> +			 0x28 | AX_NEW_PAUSE_EN);
> +
> +	mode = AX_MEDIUM_RECEIVE_EN;
> +	if (tx_pause)
> +		mode |= AX_MEDIUM_TXFLOW_CTRLEN;
> +	if (rx_pause)
> +		mode |= AX_MEDIUM_RXFLOW_CTRLEN;
> +
> +	switch (speed) {
> +	case SPEED_2500:
> +		reg8[0] = 0x00;
> +		reg8[1] = 0xF8;
> +		reg8[2] = 0x07;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_PAUSE, 3, 3, reg8);
> +
> +		reg8[0] = 0x78;
> +		reg8[1] = (AX_LSOFC_WCNT_7_ACCESS << 5);
> +		reg8[2] = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_STATUS_CDC, 3, 3, reg8);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT, 1, 0x40);
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT + 1, 1,
> +				 AX_MAC_MIQFFCTRL_FORMAT | AX_MAC_MIQFFCTRL_DROP_CRC |
> +				 AX_MAC_LSO_ERR_EN);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_BFM_DATA, 1, AX_XGMII_EN);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_LSO_ENHANCE_CTRL, 1,
> +				 0x1C | AX_LSO_ENHANCE_EN);
> +
> +		mode |= AX_MEDIUM_GIGAMODE | AX_MEDIUM_FULL_DUPLEX;
> +		bulk_config_speed = ETHER_LINK_2500;
> +
> +		break;
> +
> +	case SPEED_1000:
> +		mode |= AX_MEDIUM_GIGAMODE;
> +		bulk_config_speed = ETHER_LINK_1000;
> +		fallthrough;
> +
> +	case SPEED_100:
> +		reg8[0] = 0x78;
> +		reg8[1] = (AX_LSOFC_WCNT_7_ACCESS << 5) | AX_GMII_CRC_APPEND;
> +		reg8[2] = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_STATUS_CDC, 3, 3, reg8);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT, 1, 0x40);
> +		if (!bulk_config_speed)
> +			bulk_config_speed = ETHER_LINK_100;
> +		break;
> +
> +	case SPEED_10:
> +		reg8[0] = 0xFA;
> +		reg8[1] = (AX_LSOFC_WCNT_7_ACCESS << 5) | AX_GMII_CRC_APPEND;
> +		reg8[2] = 0xFF;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_STATUS_CDC, 3, 3, reg8);
> +
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_RX_DATA_CDC_CNT, 1, 0xFA);
> +
> +		bulk_config_speed = ETHER_LINK_10;
> +		break;
> +	}
> +
> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, PHYSICAL_LINK_STATUS, 1, 1, &link_sts);
> +	ax88179a_bulkin_config(dev, link_sts, bulk_config_speed, !!duplex);
> +
> +	if (speed != SPEED_2500)
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_BFM_DATA, 1, 0);
> +
> +	if (duplex)
> +		mode |= AX_MEDIUM_FULL_DUPLEX;
> +
> +	mutex_lock(&ax179_data->medium_status_mutex);
> +	if (dev->net->mtu > 1500)
> +		mode |= AX_MEDIUM_JUMBO_EN;
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->rxctl));
> +	mutex_unlock(&ax179_data->medium_status_mutex);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1,
> +			 AX_MAC_RX_PATH_READY | AX_MAC_TX_PATH_READY);
> +}
> +
> +static const struct phylink_mac_ops ax88179a_phylink_mac_ops = {
> +	.mac_config = ax88179a_mac_config,
> +	.mac_link_down = ax88179a_mac_link_down,
> +	.mac_link_up = ax88179a_mac_link_up,
> +};
> +
> +static int ax88179a_phylink_setup(struct usbnet *dev)
> +{
> +	struct ax88179_data *data = dev->driver_priv;
> +	phy_interface_t phy_if_mode;
> +	struct phylink *phylink;
> +
> +	data->phylink_config.dev = &dev->net->dev;
> +	data->phylink_config.type = PHYLINK_NETDEV;
> +	data->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE | MAC_100;
> +	if (data->is_ax88772d)
> +		data->phylink_config.mac_capabilities |= MAC_10;
> +	else if (data->chip_version < AX_VERSION_AX88279)
> +		data->phylink_config.mac_capabilities |= MAC_10 | MAC_1000;
> +	else
> +		data->phylink_config.mac_capabilities |= MAC_1000 | MAC_2500FD;
> +
> +	if (!data->is_ax88772d) {
> +		data->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
> +		data->phylink_config.eee_enabled_default = false;
> +	}
> +
> +	if (data->chip_version == AX_VERSION_AX88279) {
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +			  data->phylink_config.supported_interfaces);
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  data->phylink_config.supported_interfaces);
> +		phy_if_mode = PHY_INTERFACE_MODE_2500BASEX;
> +	} else {
> +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> +			  data->phylink_config.supported_interfaces);
> +		phy_if_mode = PHY_INTERFACE_MODE_SGMII;
> +	}
> +
> +	phylink = phylink_create(&data->phylink_config, dev->net->dev.fwnode,
> +				 phy_if_mode, &ax88179a_phylink_mac_ops);
> +	if (IS_ERR(phylink))
> +		return PTR_ERR(phylink);
> +
> +	data->phylink = phylink;
> +	return 0;
> +}
> +
> +static int ax88179a_init_mdio(struct usbnet *dev)
> +{
> +	struct ax88179_data *data = dev->driver_priv;
> +	int ret;
> +
> +	data->mdio = mdiobus_alloc();
> +	if (!data->mdio)
> +		return -ENOMEM;
> +
> +	data->mdio->priv = dev;
> +	data->mdio->read = ax88179_mdiobus_read;
> +	data->mdio->write = ax88179_mdiobus_write;
> +	data->mdio->read_c45 = ax88179_mdiobus_read_c45;
> +	data->mdio->write_c45 = ax88179_mdiobus_write_c45;
> +	data->mdio->name = "AX88179A MDIO Bus";
> +	data->mdio->phy_mask = ~(1 << AX88179_PHY_ID);
> +	/* mii bus name is usb-<usb bus number>-<usb device number> */
> +	snprintf(data->mdio->id, MII_BUS_ID_SIZE, "usb-%03d:%03d",
> +		 dev->udev->bus->busnum, dev->udev->devnum);
> +
> +	ret = mdiobus_register(data->mdio);
> +	if (ret) {
> +		netdev_err(dev->net, "Could not register MDIO bus (err %d)\n", ret);
> +		mdiobus_free(data->mdio);
> +		data->mdio = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
> +{
> +	struct ax88179_data *data = netdev2data(net);
> +
> +	return phylink_mii_ioctl(data->phylink, rq, cmd);
> +}
> +
> +static const struct net_device_ops ax88179a_netdev_ops = {
> +	.ndo_open		= usbnet_open,
> +	.ndo_stop		= usbnet_stop,
> +	.ndo_start_xmit		= usbnet_start_xmit,
> +	.ndo_tx_timeout		= usbnet_tx_timeout,
> +	.ndo_get_stats64	= dev_get_tstats64,
> +	.ndo_change_mtu		= ax88179_change_mtu,
> +	.ndo_set_mac_address	= ax88179_set_mac_addr,
> +	.ndo_validate_addr	= eth_validate_addr,
> +	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
> +};
> +
> +static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
> +{
> +	struct usb_device *udev = interface_to_usbdev(intf);
> +	struct ax88179_data *ax179_data;
> +	int ret;
> +
> +	/* Check if vendor configuration */
> +	if (udev->actconfig->desc.bConfigurationValue != 1) {
> +		netdev_info(dev->net, "Switching to vendor mode\n");
> +		usb_driver_set_configuration(udev, 1);
> +		return -ENODEV;
> +	}
> +
> +	ret = usbnet_get_endpoints(dev, intf);
> +	if (ret < 0)
> +		return ret;
> +
> +	ax179_data = kzalloc_obj(*ax179_data);
> +	if (!ax179_data)
> +		return -ENOMEM;
> +
> +	dev->driver_priv = ax179_data;
> +	mutex_init(&ax179_data->medium_status_mutex);
> +
> +	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_CHIP_STATUS,
> +			       1, 1, &ax179_data->chip_version);
> +	if (ret < 0)
> +		goto err_nodev;
> +
> +	ax179_data->chip_version = (ax179_data->chip_version & 0xf0) >> 4;
> +	ax179_data->is_ax88772d = 0;
> +	if (ax179_data->chip_version == AX_VERSION_AX88179A) {
> +		if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x300)
> +			ax179_data->is_ax88772d = 1;
> +	}
> +
> +	for (int i = 0; i < 3; i++) {
> +		ret = ax88179_read_cmd(dev, AX88179A_ACCESS_BL, AX88179A_SW_VERSION + i,
> +				       1, 1, &ax179_data->fw_version[i]);
> +		if (ret < 0)
> +			ax179_data->fw_version[i] = 0xff;
> +	}
> +	ret = ax88179_read_cmd(dev, AX88179A_ACCESS_BL, AX88179A_SW_REVISION,
> +			       1, 1, &ax179_data->fw_version[3]);
> +	if (ret < 0)
> +		ax179_data->fw_version[3] = 0xff;
> +
> +	netdev_info(dev->net, "AX88179A/279/772D Chip Version: %x, FW: %d.%d.%d.%d\n",
> +		    ax179_data->chip_version,
> +		    ax179_data->fw_version[0], ax179_data->fw_version[1],
> +		    ax179_data->fw_version[2], ax179_data->fw_version[3]);
> +
> +	/* The AX88279 requires both the AX_RX_CTL_IPE and AX_RX_CTL_DROPCRCERR
> +	 * bits set in AX_RX_CTL for creating correct RX-URBs. AX_RX_CTL_DROPCRCERR
> +	 * is anyway set for all chips, make sure AX_RX_CTL_IPE is set via ip_align.
> +	 * Also configure eeprom access parameters.
> +	 */
> +	if (ax179_data->chip_version == AX_VERSION_AX88279) {
> +		ax179_data->ip_align = 1;
> +		ax179_data->eeprom_read_cmd = AX88179A_FLASH_READ;
> +		ax179_data->eeprom_write_cmd = AX88179A_FLASH_WRITE;
> +		ax179_data->eeprom_block = 256;
> +		ax179_data->eeprom_wen = 1;
> +	} else {
> +		ax179_data->ip_align = 0;
> +		ax179_data->eeprom_read_cmd = AX_ACCESS_EFUS;
> +		ax179_data->eeprom_write_cmd = AX_ACCESS_EFUS;
> +		ax179_data->eeprom_block = 20;
> +		ax179_data->eeprom_wen = 0;
> +	}
> +
> +	dev->net->netdev_ops = &ax88179a_netdev_ops;
> +	dev->net->ethtool_ops = &ax88179a_ethtool_ops;
> +	dev->net->needed_headroom = 8;
> +	dev->net->needed_tailroom = 8;
> +	dev->net->min_mtu = ETH_MIN_MTU;
> +	dev->hard_mtu = 9 * 1024;
> +	dev->net->max_mtu = dev->hard_mtu - dev->net->hard_header_len;
> +
> +	if (!ax179_data->is_ax88772d)
> +		dev->mii.supports_gmii = 1;
> +
> +	dev->net->features |= NETIF_F_SG | NETIF_F_IP_CSUM |
> +			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
> +
> +	dev->net->hw_features |= dev->net->features;
> +
> +	dev->net->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM |
> +				  NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
> +
> +	netif_set_tso_max_size(dev->net, 16384);
> +
> +	/* Enable Transmission of Link Speed byte in interrupt URB */
> +	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
> +	ax88179_write_cmd(dev, AX_RELOAD_EEPROM_EFUSE, 0, 0, 0, NULL);
> +
> +	/* Read MAC address from DTB or ASIX chip */
> +	ax88179_get_mac_addr(dev);
> +	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +
> +	/* Power PHY for probing */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, AX_PHY_POWER);
> +	msleep(250);
> +
> +	ret = ax88179a_init_mdio(dev);
> +	if (ret)
> +		goto err_nodev;
> +
> +	ret = ax88179a_phylink_setup(dev);
> +	if (ret)
> +		goto phylink_err;
> +
> +	ret = ax88179a_init_phy(dev);
> +	if (ret)
> +		goto initphy_err;
> +
> +	return 0;
> +
> +initphy_err:
> +	phylink_destroy(ax179_data->phylink);
> +phylink_err:
> +	ax88179a_mdio_unregister(ax179_data);
> +err_nodev:
> +	kfree(ax179_data);
> +	ax179_data = NULL;
> +
> +	return ret;
> +}
> +
> +static void ax88179a_unbind(struct usbnet *dev, struct usb_interface *intf)
> +{
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +
> +	/* Configure RX control register => stop operation */
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
> +
> +	rtnl_lock();
> +	phylink_disconnect_phy(ax179_data->phylink);
> +	rtnl_unlock();
> +	phylink_destroy(ax179_data->phylink);
> +	ax88179a_mdio_unregister(ax179_data);
> +
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +
> +	kfree(ax179_data);
> +}
> +
> +static void ax88179a_rx_checksum(struct sk_buff *skb, u64 pkt_desc)
> +{
> +	u32 pkt_type;
> +
> +	skb->ip_summed = CHECKSUM_NONE;
> +	/* checksum error bit is set */
> +	if (pkt_desc & AX179A_RX_PD_L4_ERR || pkt_desc & AX179A_RX_PD_L3_ERR)
> +		return;
> +
> +	pkt_type = pkt_desc & AX179A_RX_PD_L4_TYPE_MASK;
> +	/* It must be a TCP or UDP packet with a valid checksum */
> +	if (pkt_type == AX179A_RX_PD_L4_TCP || pkt_type == AX179A_RX_PD_L4_UDP)
> +		skb->ip_summed = CHECKSUM_UNNECESSARY;
> +}
> +
> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> +{
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +	struct sk_buff *ax_skb;
> +	u32 hdr_off, pkt_end;
> +	__le64 *pkt_desc_ptr;
> +	u16 vlan_tag;
> +	u16 pkt_cnt;
> +	u64 rx_hdr;
> +
> +	/* SKB contents for AX179A-based chips:
> +	 *   <packet 1>
> +	 *   ...
> +	 *   <packet N>
> +	 *   <per-packet metadata entry 1>
> +	 *   ...
> +	 *   <per-packet metadata entry N>
> +	 *   <rx_hdr>
> +	 *
> +	 * where:
> +	 *   <packet N> contains pkt_len data bytes and padding:
> +	 *		2 bytes of IP alignment (optional, depends on AX_RX_CTL_IPE flag)
> +	 *		packet data received
> +	 *		optional padding to 8-bytes boundary
> +	 *   <per-packet metadata entry N> contains 8 bytes:
> +	 *		pkt_len and fields AX_RXHDR_*
> +	 *   <rx-hdr>	contains 8 bytes:
> +	 *		pkt_cnt and hdr_off (offset of <per-packet metadata entry 1>)
> +	 *
> +	 * pkt_cnt is number of entries in the per-packet metadata array.
> +	 */
> +
> +	if (!skb || skb->len < sizeof(rx_hdr))
> +		goto err;
> +
> +	/* RX Descriptor Header */
> +	skb_trim(skb, skb->len - sizeof(rx_hdr));
> +	rx_hdr = get_unaligned_le64((__le64 *)skb_tail_pointer(skb));
> +
> +	/* Check these packets */
> +	hdr_off = FIELD_GET(AX179A_RX_DH_DESC_OFFSET, rx_hdr);
> +	pkt_cnt = rx_hdr & AX179A_RX_DH_PKT_CNT_MASK;
> +
> +	/* Consistency check header position */
> +	if (hdr_off != skb->len - (pkt_cnt * sizeof(rx_hdr)))
> +		goto err;
> +
> +	/* Make sure that the bounds of the metadata array are inside the SKB
> +	 * (and in front of the counter at the end).
> +	 */
> +	if (pkt_cnt * 8 + hdr_off > skb->len)
> +		goto err;
> +
> +	/* Packets must not overlap the metadata array */
> +	skb_trim(skb, hdr_off);
> +
> +	if (!pkt_cnt)
> +		goto err;
> +
> +	/* Get the first RX packet descriptor */
> +	pkt_desc_ptr = (__le64 *)(skb->data + hdr_off);
> +
> +	pkt_end = 0;
> +	while (pkt_cnt--) {
> +		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
> +		u32 pkt_len_plus_padd;
> +		u32 pkt_len;
> +
> +		pkt_len = FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
> +		pkt_len -= (ax179_data->ip_align ? 2 : 0);
> +		pkt_len_plus_padd = ((pkt_len + 7 + (ax179_data->ip_align ? 2 : 0)) & 0x7FFF8);
> +
> +		pkt_end += pkt_len_plus_padd;
> +		if (pkt_end > hdr_off || (pkt_cnt == 0 && pkt_end != hdr_off))
> +			goto err;
> +
> +		if (pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK) ||
> +		    pkt_len > (dev->hard_mtu + AX179A_RX_HW_PAD) || pkt_len < 2 + ETH_HLEN) {
> +			skb_pull(skb, pkt_len_plus_padd);
> +
> +			/* Next RX Packet Descriptor */
> +			pkt_desc_ptr++;
> +			continue;
> +		}
> +
> +		ax_skb = netdev_alloc_skb_ip_align(dev->net, pkt_len);
> +		if (!ax_skb)
> +			goto err;
> +
> +		skb_put(ax_skb, pkt_len);
> +		memcpy(ax_skb->data, skb->data + (ax179_data->ip_align ? AX179A_RX_HW_PAD : 0),
> +		       pkt_len);
> +
> +		if (ax179_data->rx_checksum)
> +			ax88179a_rx_checksum(ax_skb, pkt_desc);
> +
> +		if (pkt_desc & AX179A_RX_PD_VLAN) {
> +			vlan_tag = pkt_desc >> AX179A_RX_PD_VLAN_SHIFT;
> +			__vlan_hwaccel_put_tag(ax_skb, htons(ETH_P_8021Q), vlan_tag);
> +		}
> +
> +		usbnet_skb_return(dev, ax_skb);
> +		skb_pull(skb, pkt_len_plus_padd);
> +
> +		/* Next RX Packet Header */
> +		pkt_desc_ptr++;
> +	}
> +
> +	return 1;
> +
> +err:
> +	return 0;
> +}
> +
> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)
> +{
> +	u64 tx_desc = skb->len & AX179A_TX_DESC_LEN_MASK;
> +	int frame_size = dev->maxpacket;
> +	struct sk_buff *ax_skb;
> +	u64 *tx_desc_ptr;
> +	int padding_size;
> +	int headroom;
> +	int tailroom;
> +	u16 tci = 0;
> +
> +	/* TSO MSS */
> +	tx_desc |= FIELD_PREP(AX179A_TX_DESC_MSS, (u64)skb_shinfo(skb)->gso_size);
> +
> +	headroom = (skb->len + sizeof(tx_desc)) % 8;
> +	padding_size = headroom ? 8 - headroom : 0;
> +
> +	if (((skb->len + sizeof(tx_desc) + padding_size) % frame_size) == 0) {
> +		padding_size += 8;
> +		tx_desc |= AX179A_TX_DESC_DROP_PADD;
> +	}
> +
> +	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb, &tci) >= 0)) {
> +		tx_desc |= AX179A_TX_DESC_VLAN;
> +		tx_desc |= FIELD_PREP(AX179A_TX_DESC_VLAN_ID, (u64)tci);
> +	}
> +
> +	if (!dev->can_dma_sg && (dev->net->features & NETIF_F_SG) && skb_linearize(skb)) {
> +		dev_kfree_skb_any(skb);
> +		return NULL;
> +	}
> +
> +	headroom = skb_headroom(skb);
> +	tailroom = skb_tailroom(skb);
> +
> +	if (skb_cloned(skb) || !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
> +		ax_skb = skb_copy_expand(skb, sizeof(tx_desc), padding_size, flags);
> +		dev_kfree_skb_any(skb);
> +		skb = ax_skb;
> +		if (!skb)
> +			return NULL;
> +	}
> +	if (padding_size != 0)
> +		skb_put_zero(skb, padding_size);
> +	/* Copy TX header */
> +	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
> +	put_unaligned_le64(tx_desc, tx_desc_ptr);
> +
> +	usbnet_set_skb_tx_stats(skb, 1, 0);
> +
> +	return skb;
> +}
> +
> +static int ax88179a_reset(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +	u16 *tmp16;
> +	u8 buf[5];
> +	u16 rxctl;
> +	u8 *tmp;
> +
> +	tmp16 = (u16 *)buf;
> +	tmp = (u8 *)buf;
> +
> +	/* Power up ethernet PHY */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, AX_PHY_POWER);
> +	msleep(250);
> +
> +	/* Ethernet PHY Auto Detach*/
> +	ax88179a_auto_detach(dev);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_BULK_OUT_CTRL, 1, AX_MAC_EFF_EN);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 0);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 0x04);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH, 1, 0x10);
> +
> +	*tmp = 0;
> +	if (dev->net->features & NETIF_F_HW_VLAN_CTAG_FILTER)
> +		*tmp |= AX_VLAN_CONTROL_VFE;
> +	if (dev->net->features & NETIF_F_HW_VLAN_CTAG_RX)
> +		*tmp |= AX_VLAN_CONTROL_VSO;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, tmp);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_INT_MASK, 1, 0xff);
> +
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_RX_DMA_CTL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_TX_DMA_CTL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_ARC_CTRL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
> +
> +	/* Read MAC address from DTB or asix chip */

[Severity: Medium]
ax88179a_reset() is the info->reset hook, so it runs on every
usbnet_open(). It calls ax88179_get_mac_addr() again and then copies
dev_addr into perm_addr, although ax88179a_bind() already did both.

Suppose the administrator sets a MAC address while the interface is
down. ax88179_set_mac_addr() stores it with eth_hw_addr_set(), which
sets addr_assign_type to NET_ADDR_SET, and writes it to AX_NODE_ID.
On the next ifup there are two cases.

If eth_platform_get_mac_address() returns an address,
ax88179_get_mac_addr() replaces the configured dev_addr with the
platform one. It also writes that back to AX_NODE_ID, so the user
setting is silently lost.

Otherwise it reads the configured address back from AX_NODE_ID and
marks it NET_ADDR_PERM if it is not locally administered. The
memcpy() then overwrites perm_addr with it. From then on ethtool -P
reports the configured address, and the real permanent address is
gone until the device is probed again.

Do these chips need the MAC address re-read on open? If the reset
sequence loses AX_NODE_ID, would it be enough to write
dev->net->dev_addr back to AX_NODE_ID here and leave perm_addr
alone?

> +	ax88179_get_mac_addr(dev);
> +	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +
> +	/* The Bulk-Register configuration for the AX88179A is done in
> +	 * ax88179a_mac_link_up(), once the link is up for a given link and USB-speed.
> +	 */
> +	if (ax179_data->is_ax88772d)
> +		dev->rx_urb_size = 1024 * 24;
> +	else
> +		dev->rx_urb_size = 1024 * 48;
> +
> +	/* Enable checksum offload */
> +	if (dev->net->features & NETIF_F_RXCSUM) {
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1,
> +				 AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
> +				 AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6);
> +		ax179_data->rx_checksum = 1;
> +	} else {
> +		ax179_data->rx_checksum = 0;
> +		ax88179_write_u8(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 0);
> +	}
> +
> +	*tmp = 0;
> +	if (dev->net->features & NETIF_F_IP_CSUM)
> +		*tmp = AX_TXCOE_IP | AX_TXCOE_TCP | AX_TXCOE_UDP;
> +	if (dev->net->features & NETIF_F_IPV6_CSUM)
> +		*tmp |= AX_TXCOE_IP | AX_TXCOE_TCPV6 | AX_TXCOE_UDPV6;
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, *tmp);
> +
> +	/* Configure RX control register => start operation */
> +	rxctl = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START | AX_RX_CTL_AP |
> +		AX_RX_CTL_AMALL | AX_RX_CTL_AB;
> +	if (ax179_data->ip_align)
> +		rxctl |= AX_RX_CTL_IPE;
> +	if (dev->net->flags & IFF_PROMISC)
> +		rxctl |= AX_RX_CTL_PRO;
> +	WRITE_ONCE(ax179_data->rxctl, rxctl);
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);
> +
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A)
> +		*tmp = AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE_PMEPOL | AX_MONITOR_MODE_RWMP;
> +	else
> +		*tmp = AX_MONITOR_MODE_RWMP;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, tmp);
> +
> +	/* Configure default medium type => giga */
> +	*tmp16 = AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
> +		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
> +	if (!ax179_data->is_ax88772d)
> +		*tmp16 |= AX_MEDIUM_GIGAMODE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp16);
> +
> +	/* Check if WoL is supported */
> +	ax179_data->wol_supported = 0;
> +	if (ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD,
> +			     1, 1, tmp) > 0)
> +		ax179_data->wol_supported = WAKE_MAGIC | WAKE_PHY;
> +
> +	/* Ensure EEE state is off, consistent with phylink setup */
> +	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
> +
> +	phylink_start(ax179_data->phylink);
> +
> +	return 0;
> +}
> +
> +static int ax88179a_stop(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data = dev->driver_priv;
> +	u16 reg16 = 0;
> +
> +	phylink_stop(ax179_data->phylink);
> +
> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
> +	reg16 &= ~AX_MEDIUM_RECEIVE_EN;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 0);
> +
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +
> +	return 0;
> +}
> +
> +const struct driver_info ax88179a_info = {
> +	.description = "ASIX AX88179A USB 3.2 Gigabit Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179a_status,
> +	.reset = ax88179a_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
> +
> +const struct driver_info ax88772d_info = {
> +	.description = "ASIX AX88772D/E USB 2.0 Fast Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179a_status,
> +	.reset = ax88179a_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
> +
> +const struct driver_info ax88279_info = {
> +	.description = "ASIX AX88279 USB 3.2 2.5Gigabit Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179a_status,
> +	.reset = ax88179a_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
>

[Severity: High]
All three new driver_info entries set FLAG_AVOID_UNLINK_URBS. None
of the existing entries in ax88179_178a.c do.

With that flag, usbnet_stop() skips usbnet_terminate_urbs(). After
ifdown the RX URBs stay submitted and remain on dev->rxq.
ax88179a_stop() only clears AX_MEDIUM_RECEIVE_EN and AX_RX_CTL and
powers the PHY down, so those URBs never complete on their own.
usbnet_stop() then cancels bh_work and deletes dev->delay, but
nothing prevents them from being re-armed later.

Now suppose the adapter is unplugged or unbound while the interface
is down:

usb_unbind_interface()
  usb_disable_interface()  <- leftover RX URBs killed, -ESHUTDOWN
    rx_complete()
      defer_bh()           <- queues dev->bh_work
  usbnet_disconnect()
    unregister_netdev()    <- already down, usbnet_stop() not called
    free_netdev()          <- bh_work and dev->delay not cancelled

On a physical unplug the leftover URBs can also fail first with
-EPROTO and similar errors, and rx_complete() then arms dev->delay.
Either way, usbnet_bh() would later run on the freed struct usbnet
and net_device.

Is FLAG_AVOID_UNLINK_URBS actually needed for these chips? If the
hardware copes with URB unlinking, dropping the flag avoids this.
If it doesn't, wouldn't usbnet_disconnect() need to cancel bh_work
and dev->delay before freeing the netdev?

[Severity: Medium]
ax88179a_bind() allocates ax179_data with kzalloc_obj() and never
sets wol_supported. The only place it gets filled in is
ax88179a_reset(). usbnet calls that from usbnet_open(), so it first
runs on the first ifup.

usbnet_probe() registers the netdev right after bind returns. Until
the interface has been brought up once, ax88179_get_wol() reports
supported = 0. ax88179_set_wol() rejects any non-zero wolopts with
-EINVAL, and so does the ethtool netlink path.

WoL can be queried and configured while the interface is down. udev
and systemd-networkd apply WakeOnLan= link settings when the
interface appears, which is usually before it is up. Won't that
setting always fail on these chips?

The legacy ax88179_bind() avoids this because it calls
ax88179_reset() from bind. Could the WoL capability check also be
done in ax88179a_bind(), or moved there entirely?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
