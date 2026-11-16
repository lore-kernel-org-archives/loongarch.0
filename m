Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794822;
	b=qJ8cSsOrOrSmQFUIrNmRInXUlWuo5ecBN1EYnOgmzJTxOXG3JDsBeLS//bfO31xLsMnb
	 iLKkndQT2wAI87Qvw3jrVvaONs33qRUVw3u550c3t3g4fQme2lT/jmEbwxLCCDuBBF4El
	 b68Z+5kYJQlGT6jSXCuh1/Z1zH6lYysUgXJCIOgezA6JedcjWqiKWv2wy42uy0J6dy4e5
	 Pm3xrAq2oM/0LDgWVBuj8HtTpeMz3yKg6TJXxQFKbCz1UJl7Rc1wW3OzCl4CTDjrvXrgK
	 5RBkRSLF66UzOKwfOUD6NrdQPmaMXilv13VjiyLeRqmnZpNguEtNgsc9Snpbqn/5RYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794822;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lUYJ6W7rUWUUaUVY4vYGboH978Ehnj6B6S0+TvHjhvE=;
	b=nx4DYNLOQfXizX+g46aPQlbnl3SF0lSHfWLgHuru79jRufFRXv6KfzrRKnZuBeSzhWOf
	 2/9DJY5vCwZ3n9RXeHUKq9juKjVmKqLKBwE7T4Xb5BTJ1qcqtSyjW1ByxgH6A3VTFe5MX
	 7EYIe5jK1VSAILzWYRlOG2+TBX+Jcy+Em939wJcgXg43LwNuOdKpOUAEzFIFb4oHSjqnA
	 G9kV7YQKQLBuKUF6MTlm2pgYE+iVRODdbj04MvUuKeuTSBIOe9K9FGKpV3QTSLoDBnXy1
	 c3ovcczL5U2UoVPChb0JCzgbdLc1fh5ItheaADd7Hxldt3IZOUrHJ5wpw4jqtNapAHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFxy4FRK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81002606A337;
	Mon, 16 Nov 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFxy4FRK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF8D1F000CA;
	Mon, 16 Nov 2026 02:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794822;
	bh=lUYJ6W7rUWUUaUVY4vYGboH978Ehnj6B6S0+TvHjhvE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XFxy4FRKgN6eRAWTMOGsXHRZsO5HLVYtcx/3f64zhBCeigZrcmwDrJ96NLv27BKLu
	 +6UJ19TucL6jwyyfoPrxtU2Jw77mQ5aY4QeDAXAhdjJe8KHSECFj1hYEo4oQFEfvb/
	 ib/qX6R4P6c8BOV4SNCECJlTFxAkIOLHtsfumxPHXQohWgH44uLKjw0jNITF9e2mBX
	 WeJ/S4Zg/kmnlWuPNmXLoLzcQko5OEtTVMOael9x1R1SOp4QpTdWXGTRUw4nL+ECjV
	 EJMnpUF7a8QgHVdssDPfnh9f3qFLI1+Nsz5vhhhozXvrTYMeYmAuyUttzShSIap0WP
	 Vx2Bf9/udPmrw==
Subject: Re: [PATCH net-next v21 07/13] ax88179_178a: Add VLAN offload support
 for AX88179A
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:00 +0000
Message-ID: <179479482049.3136.16172204503147472443@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-7-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-7-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 6 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ax88179a_set_features() can fail halfway and leave hardware
  checksum state out of sync with dev->features.
- [Medium] When NETIF_F_HW_VLAN_CTAG_FILTER is turned on,
  ax88179a_set_features() clears the VLAN table with a 256-iteration…
- [Medium] The driver keeps no software copy of the VLAN filter table.
- [Medium] This patch makes NETIF_F_HW_VLAN_CTAG_RX a toggleable feature
  that is off by default (only in hw_features).
- [Medium] Uninitialized stack bytes are used and written back to the USB
  device.
- [Medium] Partial failure within the VLAN steps of
  ax88179a_set_features() leaves the filter state in hardware different…
- [Low] The commit message doesn't mention that the patch changes
  checksum offload behaviour.

--

ax88179_178a: Add VLAN offload support for AX88179A

This commit adds VLAN offload support for AX88179A-based chips. It adds
an ndo_set_features handler for CTAG filtering and stripping, and
ndo_vlan_rx_add_vid/kill_vid callbacks that program the hardware VID
table. It also enables CTAG TX by default and adds CTAG RX and FILTER to
hw_features.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index 272e923656832..4207d2cc2b865 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops = {

[ ... ]

> +static int ax88179a_vlan_rx_add_vid(struct net_device *net, __be16 proto, u16 vid)
> +{
> +	struct usbnet *dev = netdev_priv(net);
> +	u8 vlan_ctrl;
> +	int ret = 0;
> +	u16 reg16;
> +	u8 reg8;
> +
> +	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +	vlan_ctrl = reg8;

[Severity: Medium]
Can reg8 be used uninitialized here? For size 1, ax88179_read_cmd() hands
&reg8 straight to __usbnet_read_cmd(). That function only copies into the
buffer when the reply has a positive length:

drivers/net/usb/usbnet.c:__usbnet_read_cmd() {
    ...
	if (err > 0 && err <= size) {
		if (data)
			memcpy(data, buf, err);
    ...
}

If the device sends a 0-byte reply, ret is 0, so the ret < 0 check passes
and vlan_ctrl holds stack garbage. That value is then OR'ed with
AX_VLAN_CONTROL_RD and AX_VLAN_CONTROL_WE and written back to
AX88179A_VLAN_ID_CONTROL. Uninitialized stack bytes go to the device, and
KMSAN would report an uninit-value.

ax88179a_vlan_rx_kill_vid() initializes its reg8 to 0, but this function
does not.

ax88179a_set_features() has the same pattern with u8 tmp. In both the
VFE-disable branch and the NETIF_F_HW_VLAN_CTAG_RX branch, tmp is read
with ax88179_read_cmd() and written back.

Earlier syzbot fixes in this driver family dealt with the same short-read
pattern.

> +
> +	/* Address */
> +	reg8 = (vid / 16);
> +	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS, 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Data */
> +	reg8 = vlan_ctrl | AX_VLAN_CONTROL_RD;
> +	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
> +	if (ret < 0)
> +		return ret;
> +	reg16 |= (1 << (vid % 16));
> +	ret = ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0, 2, 2, &reg16);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
The VID table only exists in device memory. What restores it after the
device loses power?

ax88179a_reset() sets the filter again from dev->features, but it does not
rewrite the table:

drivers/net/usb/ax88179a_devices.c:ax88179a_reset() {
    ...
	*tmp = 0;
	if (dev->net->features & NETIF_F_HW_VLAN_CTAG_FILTER)
		*tmp |= AX_VLAN_CONTROL_VFE;
	if (dev->net->features & NETIF_F_HW_VLAN_CTAG_RX)
		*tmp |= AX_VLAN_CONTROL_VSO;
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, tmp);
    ...
}

The later commit "ax88179_178a: Add Suspend/resume support for
AX88179A/772D/279" routes .reset_resume through
ax88179_resume_wrapper()->ax88179a_resume()->ax88179a_reset(). After
hibernate, or after the host controller loses power, VFE would be set on a
table that holds power-on defaults.

The VLAN core does not replay VIDs on resume. On NETDEV_UP it only adds
VID 0 again. VIDs held by existing VLAN sub-interfaces keep their
refcounts, so ndo_vlan_rx_add_vid is not called again for them.

Would the hardware then drop tagged traffic for those VLANs until
rx-vlan-filter is toggled? Other USB MACs, such as lan78xx, keep a shadow
copy of the table and rewrite it on reset.

[ ... ]

> @@ -517,6 +599,75 @@ static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
>  	return phylink_mii_ioctl(data->phylink, rq, cmd);
>  }
>  
> +static int ax88179a_set_features(struct net_device *net, netdev_features_t features)
> +{
> +	struct usbnet *dev = netdev_priv(net);
> +	netdev_features_t changed;
> +	int ret;
> +	u8 tmp;
> +
> +	changed = net->features ^ features;
> +
> +	ret = ax88179_set_features(net, features);
> +	if (ret)
> +		return ret;

[Severity: Medium]
What happens to the checksum state if one of the later VLAN register
accesses fails?

By the time the VLAN steps run, ax88179_set_features() has already
XOR-toggled AX_TXCOE_CTL and AX_RXCOE_CTL based on net->features ^
features, and it has set data->rx_checksum. If a VLAN_ID_CONTROL read or
write below fails, this function returns an error and does not undo any
of that. __netdev_update_features() then leaves dev->features as it was:

net/core/dev.c:__netdev_update_features() {
    ...
	if (unlikely(err < 0)) {
		netdev_err(dev,
			"set_features() failed (%d); wanted %pNF, left %pNF\n",
			err, &features, &dev->features);
		...
		return -1;
	}
    ...
}

Take ethtool -K ethX tx-checksum-ipv4 off rx-vlan-filter on, with a USB
error during the VLAN step. TX checksum offload ends up off in hardware
while dev->features still has NETIF_F_IP_CSUM. The stack keeps sending
CHECKSUM_PARTIAL skbs, and they go out with bad TCP/UDP checksums.

ax88179_set_features() toggles relative to dev->features, which was never
updated. Each later successful update would flip the bits again using a
wrong changed mask. Would hardware and software stay inverted until the
next open, when ax88179a_reset() runs?

The RX side can end up inverted the same way: data->rx_checksum is set
while the RX checksum engine is off. ax88179a_rx_checksum() would then
trust descriptor error bits the engine never computed.

Could the checksum update run after the VLAN steps, or be rolled back on
failure?

> +
> +	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +			u8 vlan_state = 0;
> +
> +			ret = ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
> +			if (ret < 0)
> +				return ret;
> +
> +			for (int i = 0; i < 256; i++) {
> +				/* Address */
> +				tmp = i;
> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
> +						  1, 1, &tmp);
> +				/* Data */
> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
> +						  2, 0);
> +				/* Write-Execute */
> +				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +						 1, vlan_state | AX_VLAN_CONTROL_WE);
> +			}

[Severity: Medium]
This loop ignores the return values of all 768 control writes, and
AX_VLAN_CONTROL_VFE is then set unconditionally. Is that intentional,
given that every other register access in this patch is checked?

ndo_set_features runs under the rtnl lock. Each write goes through
usb_control_msg() with USB_CTRL_SET_TIMEOUT (5 seconds), and the loop
never stops early. A device that stays attached but stops responding
could hold rtnl for up to 768 * 5 seconds, which is roughly an hour.

If only some of the writes fail, those table words keep stale bits, or WE
commits zero to the wrong latched address. The filter is still enabled
and the call still reports success.

Related to this, the commit message has this trailer:

    Error-checking fixes Suggested-by: Jianhui Xu <neuromoments@gmail.com>

There is free text before the tag, so tools won't parse it as a
Suggested-by: trailer. It also credits error-checking work that this loop
does not have.

> +			vlan_state |= AX_VLAN_CONTROL_VFE;
> +			ret = ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &vlan_state);
> +			if (ret < 0)
> +				return ret;

[ ... ]

> +	if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
> +		ret = ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +				       1, 1, &tmp);
> +		if (ret < 0)
> +			return ret;

[Severity: Medium]
Suppose a single update enables NETIF_F_HW_VLAN_CTAG_FILTER and also
changes NETIF_F_HW_VLAN_CTAG_RX. By the time this read runs, the table
has been cleared and VFE has been written. If this read, or the write
after it, fails, could the hardware be left filtering on an empty table?

On error, __netdev_update_features() does not update dev->features. It
also skips vlan_get_rx_ctag_filter_info(), so no VIDs are pushed. Because
CTAG_FILTER is then missing from dev->features, vlan_hw_filter_capable()
returns false, and later VLAN additions don't call ndo_vlan_rx_add_vid
either.

The MAC would then drop tagged traffic for every configured VLAN
sub-interface, while the stack believes filtering is off.

The reverse case also exists. If disabling the filter succeeds and the
CTAG_RX step fails, VFE is off in hardware but the feature still shows as
enabled.

[ ... ]

> @@ -527,6 +678,9 @@ static const struct net_device_ops ax88179a_netdev_ops = {
>  	.ndo_set_mac_address	= ax88179_set_mac_addr,
>  	.ndo_validate_addr	= eth_validate_addr,
>  	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
> +	.ndo_set_features	= ax88179a_set_features,

[Severity: Low]
This isn't a bug, but adding .ndo_set_features here also changes checksum
offload behaviour, and the commit message doesn't mention it.

Before this patch, ax88179a_netdev_ops had no .ndo_set_features, even
though NETIF_F_IP_CSUM, NETIF_F_IPV6_CSUM and NETIF_F_RXCSUM were already
in hw_features. ethtool -K could change them in net->features, but
AX_TXCOE_CTL and AX_RXCOE_CTL were never reprogrammed. data->rx_checksum
also kept the value ax88179a_reset() set at open. So ethtool -K ethX rx
off did not stop ax88179a_rx_fixup() from marking packets
CHECKSUM_UNNECESSARY.

ax88179a_set_features() calls ax88179_set_features() first, so this patch
also fixes runtime checksum toggling for all AX179A-family chips. Could
that fix go into the earlier commit "ax88179_178a: Add HW support for
AX179A-based chips", or at least be described in this commit message, so
it can be found during bisection and backports?

> +	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
> +	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,
>  };

[ ... ]

> @@ -612,9 +766,11 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
>  		dev->mii.supports_gmii = 1;
>  
>  	dev->net->features |= NETIF_F_SG | NETIF_F_IP_CSUM |
> -			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
> +			      NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO |
> +			      NETIF_F_HW_VLAN_CTAG_TX;
>  
>  	dev->net->hw_features |= dev->net->features;
> +	dev->net->hw_features |= NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_CTAG_FILTER;

[Severity: Medium]
NETIF_F_HW_VLAN_CTAG_RX is now user-toggleable and off by default, and
toggling it only changes AX_VLAN_CONTROL_VSO. Should the RX path follow
this setting too?

ax88179a_rx_fixup() still pushes a hwaccel tag based only on the
descriptor bit:

drivers/net/usb/ax88179a_devices.c:ax88179a_rx_fixup() {
    ...
		if (pkt_desc & AX179A_RX_PD_VLAN) {
			vlan_tag = pkt_desc >> AX179A_RX_PD_VLAN_SHIFT;
			__vlan_hwaccel_put_tag(ax_skb, htons(ETH_P_8021Q), vlan_tag);
		}
    ...
}

Suppose the hardware still sets AX179A_RX_PD_VLAN for tagged frames when
VSO is clear. Then with rxvlan off, which is the default, the stack would
receive frames that still carry the 802.1Q header in the payload and also
have a hwaccel tag.

I couldn't tell from the code whether PD_VLAN is suppressed when
stripping is off. The aqc111 driver always sets VSO, so it doesn't answer
the question either.

In the same function, checksum reporting is gated on data->rx_checksum,
and drivers such as lan78xx gate the tag push on the feature bit. The tag
push came in earlier in this series ("ax88179_178a: Add HW support for
AX179A-based chips"), but this patch is the one that makes CTAG_RX
toggleable. Would a check of dev->net->features & NETIF_F_HW_VLAN_CTAG_RX
be needed here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
