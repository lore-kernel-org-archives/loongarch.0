Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794817;
	b=G1ZATOJCajq+Jt1TNa5GRh0+3Hr62/hReRdWFjIFlBHJrYzZuCc0Elli+LI2Q+lILCuw
	 3DQNduYJQnwv0DgO6ndv4GdKzLqe+2aq8WFLbEzfItk2Khgcnm610FlTgdTBx3zSQ0m29
	 4oXOCD9JLz5yGr+8sEFsMEGavUbFwr0/HW/eXW1YOKlWi76XkYsW3rLF/wV9BO5Ln//63
	 cJrpVhlT9Eb7PeCfrfhmEloapuWTJ6J9TKqLyWUv2sJVKFVkYjh2qcmYNlLOLaqAKvPFO
	 GX6ImZBPRj58IhHsV8wa3j6fibRYL/R0FRRhjvQGcEeNQlXiMeyGZXYcvrqnZz/YogQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794817;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LSjFTKFlossbG5+4SGxZNdF6KoUTPkAYpGNyjtBWOnI=;
	b=G1SFDETP9ohurIwZ6x609uKItNucLOkiKaugw4q12gkMYLE+tn8htXR2P7mG8/z9sjgL
	 UakXYxgnmG3i3Dno4AAMqosK/5mRFW/I4RY2DTJacJQY8ZVOmnCyrzFv9XeXfP/3zuLnu
	 pt9O+u/27CBNjuYZoyrD4xJRzTAWq+CjIFW02y7d3I4Y8dz2EKiI7h0SKSwxeHL4G6GMb
	 Kdq2gY/JlOk+YW83W9Eqx70vo37rzsqFrBeyI5xUJfSJ0w0UCrVqtK2oiQe9bPNTZozUJ
	 5h5FSMhHUy6O0A8txmIfyZF79ruMI4Oia4IlB0QW6npqyIIY1cOUHIZ+EFo77l2cXPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aH0F8dyb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46747606A331;
	Mon, 16 Nov 2026 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aH0F8dyb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D831F000CF;
	Mon, 16 Nov 2026 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794817;
	bh=LSjFTKFlossbG5+4SGxZNdF6KoUTPkAYpGNyjtBWOnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aH0F8dybtL9r0QDF90ZfJQzuQKcnckE2zPuIlS/X9wJbbTLSkrQL1xR389D/tt/P4
	 tPHVM9kIXP/gRcFMIomcykQjaxjSDGLPi2tXjSp5x7ge5oSyYKN+zZKMgDjZQHdefy
	 HrfjIcNS/AKCSDhYRszAg1AiS6VGKaDdiUnsa58/R5iLybp/YWS6QVNw81laSMU9IM
	 MnoG1JmKsI+fHudwYhHbNPQzxVyxei6nArWD1TplezW3/osR02KnfMh9Tr8h2bTSeV
	 ZW5RqC9dVaMhNN/6ZUdNJMeEWFk9NWhk0hSL2k1rxLlSizHhwCPXxicMXVcePFzYQ2
	 /d3iTM+9czJ4g==
Subject: Re: [PATCH net-next v21 03/13] ax88179_178a: Split driver into
 library and device specific code
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:06:55 +0000
Message-ID: <179479481543.3136.5279066204729044704@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-3-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-3-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes a pure refactor: split
  ax88179_178a into common library code plus device-specific code, then…
- [Medium] The patch renames the kernel module from ax88179_178a.ko to
  ax88179.ko (Makefile: `obj-$(CONFIG_USB_NET_AX88179_178A) +=…
- [Medium] The reworked `ax88179_change_mtu()` (ax88179_lib.c:394-436)
  does `WRITE_ONCE(net->mtu, new_mtu)` and `dev->hard_mtu = net->mtu +…
- [Low] The new `medium_status_mutex` is commented `/* protect
  AX_MEDIUM_STATUS_MODE */` (ax88179_lib.h:161), but in this patch only…

--

ax88179_178a: Split driver into library and device specific code

This splits the ax88179_178a driver into common library code
(ax88179_lib.c/ax88179_lib.h) and device specific code for the AX88179
and AX88178a. It also renames the module to ax88179 and adds a
MODULE_ALIAS for the old ax88179_178a name.

> diff --git a/drivers/net/usb/Makefile b/drivers/net/usb/Makefile
> index 4964f7b326fbc..ddd76fa71e2ee 100644
> --- a/drivers/net/usb/Makefile
> +++ b/drivers/net/usb/Makefile
> @@ -12,7 +12,8 @@ obj-$(CONFIG_USB_HSO)		+= hso.o
>  obj-$(CONFIG_USB_LAN78XX)	+= lan78xx.o
>  obj-$(CONFIG_USB_NET_AX8817X)	+= asix.o
>  asix-y := asix_devices.o asix_common.o ax88172a.o
> -obj-$(CONFIG_USB_NET_AX88179_178A)      += ax88179_178a.o
> +obj-$(CONFIG_USB_NET_AX88179_178A)      += ax88179.o
> +ax88179-y := ax88179_178a.o ax88179_lib.o

[Severity: Medium]
This renames the module from ax88179_178a.ko to ax88179.ko. The new
MODULE_ALIAS("ax88179_178a") keeps "modprobe ax88179_178a" working. Is
that enough for existing userspace configuration?

As I understand kmod, modprobe.d blacklist entries are matched against
the real module name. Hotplug loads the driver through the USB modalias,
which now resolves to ax88179. An existing "blacklist ax88179_178a" would
then stop applying, and the driver would bind again. People commonly
blacklist this driver so that cdc_ncm binds to AX88179A adapters.

"options ax88179_178a ...", "rmmod ax88179_178a" and scripts that check
/sys/module/ax88179_178a would also stop matching.

Could the commit message mention this user visible change?

> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index 2279dbbcdb4dd..55268d0890d12 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c

[ ... ]

> @@ -1290,6 +683,7 @@ static int ax88179_bind(struct usbnet *dev, struct usb_interface *intf)
>  		return -ENOMEM;
>  
>  	dev->driver_priv = ax179_data;
> +	mutex_init(&ax179_data->medium_status_mutex);
>  
>  	dev->net->netdev_ops = &ax88179_netdev_ops;
>  	dev->net->ethtool_ops = &ax88179_ethtool_ops;

[Severity: Medium]
The commit message only describes a split into library and device
specific code plus a module rename. This hunk, though, adds a new
medium_status_mutex. ax88179_change_mtu() in ax88179_lib.c is also
reworked to take that mutex and to return errors from the
AX_MEDIUM_STATUS_MODE read and write.

The old ax88179_change_mtu() ignored those errors, always called
usbnet_update_max_qlen() and always returned 0. The new version can
return a negative errno from ndo_change_mtu.

Could these functional changes be described in the commit message, or
moved into a separate patch? Later patches in the series use this mutex,
so it looks like groundwork for them. Anyone bisecting or backporting
what looks like a pure split would otherwise pick up new locking and new
ndo_change_mtu error semantics without knowing it.

[ ... ]

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> new file mode 100644
> index 0000000000000..fbaf12b713b03
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.c

[ ... ]

> +int ax88179_change_mtu(struct net_device *net, int new_mtu)
> +{
> +	struct usbnet *dev = netdev_priv(net);
> +	struct ax88179_data *data;
> +	u16 tmp16;
> +	int err;
> +
> +	data = dev->driver_priv;
> +	mutex_lock(&data->medium_status_mutex);
> +	WRITE_ONCE(net->mtu, new_mtu);
> +	dev->hard_mtu = net->mtu + net->hard_header_len;
> +	if (net->mtu > 1500) {
> +		err = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +		tmp16 |= AX_MEDIUM_JUMBO_EN;
> +		err = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	} else {

[ ... ]

> +	}
> +	mutex_unlock(&data->medium_status_mutex);
> +
> +	/* max qlen depend on hard_mtu and rx_urb_size */
> +	usbnet_update_max_qlen(dev);
> +
> +	return 0;
> +
> +err_out:
> +	mutex_unlock(&data->medium_status_mutex);
> +	return err;
> +}

[Severity: Medium]
Can this leave the MTU half applied when a USB control transfer fails?

net->mtu and dev->hard_mtu are updated before the AX_MEDIUM_STATUS_MODE
read and write. The err_out path only drops the mutex and returns the
error. It does not restore the old MTU, and it skips
usbnet_update_max_qlen().

netif_set_mtu_ext() only sends NETDEV_CHANGEMTU when the driver
succeeds. It only restores orig_mtu when a notifier fails:

net/core/dev.c:netif_set_mtu_ext() {
    ...
	orig_mtu = dev->mtu;
	err = __netif_set_mtu(dev, new_mtu);

	if (!err) {
		err = call_netdevice_notifiers_mtu(NETDEV_CHANGEMTU, dev,
						   orig_mtu);
    ...
}

Say the adapter returns -ETIMEDOUT or -EPIPE, or -ENODEV during unplug.
Userspace gets the error, but dev->mtu already holds the new value.
Upper layers never got NETDEV_CHANGEMTU, the JUMBO_EN bit in hardware
may not match the MTU, and the rx/tx qlen were not recomputed.

Retrying with the same value does not help, because netif_set_mtu_ext()
returns early:

	if (new_mtu == dev->mtu)
		return 0;

The previous code ignored these errors and always returned 0, so it
never ended up in this state. This code is the same at the end of the
series.

Should the MTU be set only after the register update succeeds, or be
restored on the error path?

> diff --git a/drivers/net/usb/ax88179_lib.h b/drivers/net/usb/ax88179_lib.h
> new file mode 100644
> index 0000000000000..9111a1395eb2f
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.h

[ ... ]

> +struct ax88179_data {
> +	struct mutex medium_status_mutex;  /* protect AX_MEDIUM_STATUS_MODE */

[Severity: Low]
Is this comment accurate? It says the mutex protects
AX_MEDIUM_STATUS_MODE.

In this patch only ax88179_change_mtu() takes the mutex, and that
function already runs under RTNL. None of the other accesses to this
register in ax88179_178a.c take it: ax88179_suspend(),
ax88179_link_reset(), ax88179_reset(), ax88179_net_reset() and
ax88179_stop().

For example, ax88179_link_reset() runs from the usbnet kevent work
without RTNL. It writes the whole register, with JUMBO_EN based on
dev->net->mtu:

	} else if (GMII_PHY_PHYSR_GIGA == (tmp16 & GMII_PHY_PHYSR_SMASK)) {
		mode |= AX_MEDIUM_GIGAMODE | AX_MEDIUM_EN_125MHZ;
		if (dev->net->mtu > 1500)
			mode |= AX_MEDIUM_JUMBO_EN;
    ...
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
			  2, 2, &mode);

Here is one possible sequence. link_reset reads an MTU of 1500. Then
change_mtu sets the MTU to 4000 and turns JUMBO_EN on. The later
link_reset write clears JUMBO_EN again.

The other way round, the read-modify-write in change_mtu can write back
stale GIGAMODE and 125MHz bits over a 100M mode that link_reset just
wrote.

This race was there before the patch. However, the comment now claims
protection that the code does not give. This is still the case at the
end of the series. The ax88179a_devices.c link up path takes the mutex,
but none of the ax88179_178a.c accessors do.

Should the comment be narrowed, or should the other accessors take the
lock too?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
