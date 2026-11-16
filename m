Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794825;
	b=kmdxcYL3TXhoYTDg4gvrf8ZTyql+tGJpvo9bvHc8YToxlhBJJP0vJhPofpnydDOY9VZT
	 XAYv57MoijhyG3QKDgng5TfB9YLHXibalNMsPmtgMFCW6sSJsez2ji4OYrR+CUZfK2h+o
	 DYFwtfrcQyvGqEISDqno/x/T28sLNOh+uWM+9AHvEOE42WKgG85TaXU+S4FWRi2wSchHg
	 ZOxBxcACLUaBFeIxvszY9zhmKnFRIGHWojhxWpAC8Hd6fnjxwBjHydhZDGzmckZQvNDEM
	 9bUIufw2UsJGNQLY1kdM4H9qbC1XM/yDIF5BcG5oOVa49lX7e/ScE7B4p9vV29XEVjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794825;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NLdZYXDZwnUO9RbpuUTRBeN6PmR0N4O16o+fzENUdEI=;
	b=LeYHYpvZyiYePTxbCwsIZ7PP3fFTYSQh7gK1xOkYpZcGEeHCyP26wPO/JW+Fh5ivgPq6
	 5VDmwHtxoOrb7icwQsKmp0pgD0MtJLQNiXOND0bSGWZpi7X8CCrTzuRDMjygj2kKcaGxF
	 MD5oahp3c52IWMsJJ+XJNLjEh4zCd2dZ0M/PkwCuqOAlULzegvydsxT7ixaxz0/OhrefX
	 bLJsQAvvYTPDZM2SHLDM+le/Mp54XdnXyFZY+B8RzrrSe4NIdhH1W9RlB9308K3amT3Is
	 ABHOd+fmtloRKNEpWo5Smoaj9TavQIfe6gf3t1QFDZxNuBpb3QVEaEupkj6bxBNa2OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTpPvfg6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025D60A2604;
	Mon, 16 Nov 2026 02:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTpPvfg6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464D31F00926;
	Mon, 16 Nov 2026 02:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794825;
	bh=NLdZYXDZwnUO9RbpuUTRBeN6PmR0N4O16o+fzENUdEI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LTpPvfg6v/f4rmD2r9T+rLuROP4eLWJmVbDhPaWHSzwqYy40TYzloPeVzqDZJSnM9
	 hX2QZxFFwKpSJ/5iyRfQnN93mM/QAFlETj7EFuxecEFf7vr/CBCkv9ptTFb8uu7/1P
	 irn8PnTJR1sq+Lwd/fawir6djVO/VIJEXB7RX/tU4aHVmB0DsF7kY/SOz2093NrEqL
	 9hzstuoXYaDwG36oOlZYqhz//vsKy/XMdoeFtvLZOrwBAb5tkt8mC8oZL3xh0e9KCD
	 aY9Q6/8VB+Ci4xi9wI3VRHRUW/7uaA+lpDUxc3sxGfBMv6lQGGK95T5pG0TWPWZxK3
	 L9Zvddi0n9/5A==
Subject: Re: [PATCH net-next v21 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:03 +0000
Message-ID: <179479482381.3136.17971003813764801587@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-9-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-9-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 11 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 5 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch turns off runtime PM (USB autosuspend) for every
  AX88179A/AX88772D/AX88279 interface, and the commit message never says…
- [Medium] When ax88179a_reset() is called from ax88179a_resume() (in_pm
  == true), the patch skips ax88179_get_mac_addr() entirely.
- [Medium] ax88179a_resume() always cuts PHY power (ax88179_write_u8(dev,
  AX88179A_PHY_POWER, 0, 0, 0); msleep(250)).
- [Medium] In ax88179a_resume(), if the first control read
  ax88179_read_cmd(dev, AX88179A_PHY_POWER, ...) fails, the code jumps…
- [Medium] In the resume path, ax88179a_reset() writes
  AX88179A_VLAN_ID_CONTROL with AX_VLAN_CONTROL_VFE whenever…
- [Low] The commit message presents this change as adding suspend/resume
  for the AX179A family.
- [Low] struct ax88179_data documents `struct mutex medium_status_mutex;
  /* protect AX_MEDIUM_STATUS_MODE */`.
- [Low] The patch makes the control flow of ax88179a_reset() depend on
  the shared, unlocked flag ax179_data->in_pm.
- [Low] ax88179a_suspend() and ax88179a_resume() call
  netif_running(dev->net) before rtnl_lock(), then call…
- [Low] The WoL branch of ax88179a_suspend() arms
  AX88179A_WAKEUP_SETTING.
- [Low] In the WoL branch of ax88179a_suspend(), the return value of
  ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2,…

--

ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

This commit stores per-chip suspend and resume callbacks in struct
ax88179_data. Wrappers in ax88179_lib dispatch to them from the single
usb_driver. It adds ax88179a_suspend()/ax88179a_resume() for the AX179A
family using phylink_suspend()/phylink_resume(), and takes a runtime PM
usage reference in ax88179a_bind().

> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index f78ad344c1c4f..b077b7153f0c0 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c

[ ... ]

> @@ -1362,9 +1365,9 @@ static struct usb_driver ax88179_178a_driver = {
>  	.name =		"ax88179_178a",
>  	.id_table =	products,
>  	.probe =	usbnet_probe,
> -	.suspend =	ax88179_suspend,
> -	.resume =	ax88179_resume,
> -	.reset_resume =	ax88179_resume,
> +	.suspend =	ax88179_suspend_wrapper,
> +	.resume =	ax88179_resume_wrapper,
> +	.reset_resume =	ax88179_resume_wrapper,

[Severity: Low]
The subject says "Add Suspend/resume support for AX88179A/772D/279". Is
that accurate?

Since "ax88179_178a: Add HW support for AX179A-based chips", the
ax88179a_info, ax88772d_info and ax88279_info entries in the shared
products table have already been using .suspend = ax88179_suspend and
.resume/.reset_resume = ax88179_resume.

Those legacy handlers program AX_PHYPWR_RSTCTL (in ax88179_suspend() and
through ax88179_reset()). They never stop or start phylink.

That means every commit between that one and this one runs the legacy
AX88179 PM code on AX179A hardware. Could the commit message say that this
replaces the legacy handlers that were being used for the AX179A family?
Or could the series be reordered so that no bisectable commit wires up the
wrong callbacks?

>  	.disconnect =	ax88179_disconnect,
>  	.supports_autosuspend = 1,

[ ... ]

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index a6b0a3f47118c..01d6a35f68b2c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c

[ ... ]

> @@ -126,6 +128,63 @@ static void ax88179a_status(struct usbnet *dev, struct urb *urb)
>  	phylink_mac_interrupt(data->phylink);
>  }
>  
> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t message)
> +{
> +	struct usbnet *dev = usb_get_intfdata(intf);
> +	struct ax88179_data *priv;
> +	u8 tmp8 = 0;
> +	u16 tmp16;
> +	int ret;
> +
> +	priv = dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_suspend(priv->phylink, !!priv->wolopts);
> +		rtnl_unlock();
> +	}

[Severity: Low]
netif_running() is checked here before rtnl_lock() is taken. ndo_open and
ndo_stop change the running state and call phylink_start()/phylink_stop()
under RTNL. Could the result be stale by the time RTNL is held?

If dev_close() runs between the check and rtnl_lock(), phylink_suspend()
without WoL would call phylink_stop() a second time on a PHY that is
already stopped.

The error path below has the same pattern, and so does ax88179a_resume().
There, a stale result would run phylink_resume() -> phylink_start() on an
interface that is down.

The window is narrow, because userspace is frozen during system sleep and
this patch blocks runtime PM. Would moving the netif_running() check inside
the rtnl_lock() section close it?

> +
> +	ret = usbnet_suspend(intf, message);
> +	if (ret && netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(priv->phylink);
> +		rtnl_unlock();
> +		ax88179_set_pm_mode(dev, false);
> +		return ret;
> +	}
> +
> +	/* Enable WoL */
> +	if (priv->wolopts) {
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +		tmp8 &= ~(AX_MONITOR_MODE_RWLC | AX_MONITOR_MODE_RWMP);
> +		if (priv->wolopts & WAKE_PHY)
> +			tmp8 |= AX_MONITOR_MODE_RWLC;
> +		if (priv->wolopts & WAKE_MAGIC)
> +			tmp8 |= AX_MONITOR_MODE_RWMP;
> +
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp16);
> +		tmp16 |= AX_MEDIUM_RECEIVE_EN;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp16);

[Severity: Low]
What happens here if the AX_MEDIUM_STATUS_MODE read fails? For size == 2,
ax88179_read_cmd() copies its zero-initialised buffer to the caller even
on error:

drivers/net/usb/ax88179_lib.c:ax88179_read_cmd() {
	...
		u16 buf = 0;

		ret = __ax88179_read_cmd(dev, cmd, value, index, size, &buf);
		le16_to_cpus(&buf);
		*((u16 *)data) = buf;
	...
}

If the read fails and the write succeeds, only AX_MEDIUM_RECEIVE_EN is
left set. That clears the GIGAMODE, FULL_DUPLEX, flow control and JUMBO
bits that ax88179a_mac_link_up() programmed, while phylink_suspend(pl,
true) has kept the link up for WoL.

The AX_MONITOR_MOD read above has the same problem with tmp8.

[Severity: Low]
This isn't a bug, but struct ax88179_data documents:

	struct mutex medium_status_mutex;  /* protect AX_MEDIUM_STATUS_MODE */

ax88179a_mac_link_up() and ax88179_change_mtu() take that mutex around
their AX_MEDIUM_STATUS_MODE accesses. Should this read-modify-write hold
medium_status_mutex too, for consistency?

> +
> +		if (priv->chip_version == AX_VERSION_AX88279)
> +			ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 8,
> +					  EPHY_LOW_POWER_EN | S5_WOL_EN
> +					  | S5_WOL_LOW_POWER | 0x8000, 0, NULL);
> +		else
> +			ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 0,
> +					  EPHY_LOW_POWER_EN, 0, NULL);
> +
> +	} else if (priv->chip_version == AX_VERSION_AX88279) {
> +		ax88179_write_cmd(dev, AX88179A_WAKEUP_SETTING, 8, 0x8000, 0, NULL);
> +	}

[Severity: Low]
Is AX88179A_WAKEUP_SETTING ever cleared after a WoL suspend?

Neither ax88179a_resume() nor ax88179a_reset() writes this register.
ax88179_set_wol() only updates priv->wolopts.

On AX88179A/772D nothing clears it at all, because the else branch above
only handles AX88279. On AX88279 the S5 wake bits are cleared only at a
later suspend with WoL off.

Suppose a WoL suspend/resume cycle is followed by WoL being disabled and
the system shutting down. Could S5_WOL_EN stay armed while ethtool reports
WoL as off? Whether the chip clears this itself on resume depends on the
hardware.

> +
> +	ax88179_set_pm_mode(dev, false);
> +	return 0;
> +}

[ ... ]

> @@ -135,6 +194,47 @@ static int ax88179a_auto_detach(struct usbnet *dev)
>  	return 0;
>  }
>  
> +static int ax88179a_resume(struct usb_interface *intf)
> +{
> +	struct usbnet *dev = usb_get_intfdata(intf);
> +	struct ax88179_data *ax179_data;
> +	u8 reg8 = 0;
> +	int ret;
> +
> +	ax179_data = dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	ret = ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +	if (ret < 0)
> +		goto err_out;

[Severity: Medium]
If this first control read fails, the jump to err_out skips the PHY
power-on, the AX_FW_MODE_179A write and all of ax88179a_reset(). The
err_out path still does this:

err_out:
	if (netif_running(dev->net)) {
		rtnl_lock();
		phylink_resume(ax179_data->phylink);
		rtnl_unlock();
	}
	ax88179_set_pm_mode(dev, false);
	return usbnet_resume(intf);

usbnet_resume() returns 0, so ret is lost. Does this report a successful
resume to the USB core while RX is stopped and the PHY may have no power,
with phylink running and usbnet resubmitting URBs?

Should the error be returned so the USB core can reset or rebind the
device?

> +
> +	if (!(reg8 & AX_PHY_POWER)) {
> +		reg8 = AX_PHY_POWER;
> +		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +		msleep(250);
> +	}
> +	ax88179_write_cmd(dev, AX_FW_MODE, AX_FW_MODE_179A, 0, 0, NULL);
> +
> +	/* Now, that AX_FW_MODE_179A is enabled, the PHY needs a power-cycle.
> +	 * PHY-power is re-enabled in ax88179a_reset()
> +	 */
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +	msleep(250);

[Severity: Medium]
Does this power cycle reset the PHY registers to their power-on defaults,
with nothing re-initialising them afterwards?

ax88179a_init_phy() sets:

	data->phydev->mac_managed_pm = true;

so mdio_bus_phy_resume() returns early and never calls phy_init_hw(). This
driver doesn't call it either.

With WoL enabled, phylink_suspend(pl, true) did not stop the PHY. So
phylink_resume() takes the PHYLINK_DISABLE_MAC_WOL branch, which only runs
phylink_link_down(), phylink_mac_initial_config() and a resolve. It never
calls phy_start(), so config_aneg does not run.

Would the PHY then autonegotiate with its reset-default advertisement,
BMCR and EEE settings? Meanwhile phylib and ethtool would still report the
earlier user settings, such as a forced speed, a restricted advertisement
or EEE off.

In the non-WoL path, phy_start() restores the advertisement, but
soft_reset and config_init are still skipped.

> +
> +	ax88179a_reset(dev);

[Severity: Medium]
Is the hardware VLAN filter table restored on this path? When
NETIF_F_HW_VLAN_CTAG_FILTER is enabled, ax88179a_reset() turns the filter
back on:

	if (dev->net->features & NETIF_F_HW_VLAN_CTAG_FILTER)
		*tmp |= AX_VLAN_CONTROL_VFE;

Nothing clears or refills the 256-entry VLAN ID table, though. Entries are
written one at a time by ax88179a_vlan_rx_add_vid(), and the driver keeps
no shadow copy. ax88179a_set_features() zeroes all 256 entries before
setting VFE, so it treats the table as undefined.

.reset_resume also goes through this path. After a USB reset or power
loss, could tagged traffic on configured VLANs be dropped (or wrongly
passed, if the table holds garbage) until the feature is toggled? Whether
the table survives a reset depends on the hardware.

> +
> +err_out:
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(ax179_data->phylink);
> +		rtnl_unlock();
> +	}
> +
> +	ax88179_set_pm_mode(dev, false);
> +
> +	return usbnet_resume(intf);
> +}

[ ... ]

> @@ -802,6 +905,13 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
>  	if (ret)
>  		goto initphy_err;
>  
> +	/* Keep this interface runtime-PM active by taking a usage ref.
> +	 * Prevents runtime suspend while bound and avoids resume paths
> +	 * that could deadlock (autoresume under RTNL while USB PM lock
> +	 * is held, phylink/MDIO wants RTNL).
> +	 */
> +	pm_runtime_get_noresume(&intf->dev);

[Severity: Medium]
This turns off USB autosuspend for every bound AX88179A, AX88772D and
AX88279 interface, even when the netdev is down. The only matching put is
pm_runtime_put_noidle() in ax88179a_unbind(). The shared usb_driver still
sets .supports_autosuspend = 1.

The commit message only talks about adding system suspend/resume
wrappers. Could it say that runtime PM is deliberately disabled for the
AX179A family, and why? The reason is that ax88179a_resume() takes
rtnl_lock(), which would deadlock when an ethtool or MDIO access under
RTNL triggers an autoresume.

> +
>  	return 0;

[ ... ]

> @@ -1055,9 +1166,13 @@ static int ax88179a_reset(struct usbnet *dev)
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
>  
> -	/* Read MAC address from DTB or asix chip */
> -	ax88179_get_mac_addr(dev);
> -	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	/* Read MAC address from DTB or asix chip, except when called
> +	 * from resume context.
> +	 */
> +	if (!ax179_data->in_pm) {
> +		ax88179_get_mac_addr(dev);
> +		memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	}

[Severity: Medium]
Skipping ax88179_get_mac_addr() here skips more than the read. It also
skips writing the station address back to the hardware:

drivers/net/usb/ax88179_lib.c:ax88179_get_mac_addr() {
	...
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_NODE_ID, ETH_ALEN, ETH_ALEN,
			  dev->net->dev_addr);
}

On this path, the only other code that writes AX_NODE_ID is
ax88179_set_mac_addr(), and it returns -EBUSY while the interface is
running.

After a reset_resume or hibernation restore, the chip would reload
NODE_ID from efuse/EEPROM. dev_addr may hold a different address: one set
by the user, a random one for a blank efuse, or one from DT.

ax88179a_reset() programs AX_RX_CTL with AX_RX_CTL_AP and without
AX_RX_CTL_PRO. In that case, would the hardware filter out unicast frames
sent to the netdev's own address?

Before this patch, the legacy resume path went through ax88179_reset() ->
ax88179_get_mac_addr(), which rewrote NODE_ID. Could the resume path skip
only the read and still write dev->net->dev_addr to AX_NODE_ID?

[ ... ]

> @@ -1117,7 +1232,11 @@ static int ax88179a_reset(struct usbnet *dev)
>  	/* Ensure EEE state is off, consistent with phylink setup */
>  	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);
>  
> -	phylink_start(ax179_data->phylink);
> +	/* ax88179a_reset() may also be called from resume context,
> +	 * phylink_resume() will start phylink, then.
> +	 */
> +	if (!ax179_data->in_pm)
> +		phylink_start(ax179_data->phylink);

[Severity: Low]
ax88179a_reset() is also the usbnet .reset callback, which usbnet_open()
calls under RTNL. in_pm is set and cleared by plain stores in
ax88179a_suspend()/ax88179a_resume(), and there is no lock shared with
the open path:

drivers/net/usb/ax88179_lib.c:ax88179_set_pm_mode() {
	...
	ax179_data->in_pm = pm_mode;
}

If ndo_open ran while in_pm was true, phylink_start() and the MAC address
programming would be skipped without any warning. The interface would be
up with phylink stopped.

The window is very narrow, given the freezer and the runtime PM usage
reference. Still, could the resume context be passed in explicitly, for
example as a bool argument to an internal reset helper, so this doesn't
depend on a shared mutable flag?

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
