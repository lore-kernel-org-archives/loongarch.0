Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794823;
	b=5F9jWZiPiMIWWf/N7d9hZZoUAeZ/AytIJ5SqBfNQRo/mx2shHIzC1gxQK5ts0rq+Vrbz
	 TSpBwvOJnQek86OkC/kpSGUK3ZY+Hb7jlduQBkDWA/D9jkzd+bFFxGDkhmWcHvgxr0jar
	 33DN3X58WptZWShaBm0v6aKeGh29AVhx0jrzNtK6BaNsOy1agyPo/zu+TPlGMaYAFugsg
	 4JyQGK7PoA1YtEy893NZHcNzdHC5lFPWDgSl9J+ogYA8FRmVkDyCW9Wl/12lSo8gTaO8W
	 8jlUR1vPnRllNo0qkMibcN9Nfa19aelFGj4BMYIERi3g9eAEuZ8fJKdin3+09a1B4AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794823;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=om/X9t1Aih03jhKVB/Sm7/LnmMQaHENjfg1lTusfAi0=;
	b=elsbQ16x0UwLSjb+OyBFTKjP4Bu4UVUJFbkAAAKOTICtg4vvsSIhEUj/hzWI1pGD9Z7g
	 XTw5Qn743mxQShx8K8BgOx6sv7OxYzr61NUtYrYE5PVqyKhcmibI+5fIjk0juwNi8U1M+
	 FUxLWTF3XVpKaeeyCU62r39AIExK53dvOhFISF6v77/asWHpSPQjo/44E1i50u1Oxgvjs
	 OrO5eycvJVZLGYExN+G9V3O/WxGpVIzeTgdXuBbMm/9Hy2w46+D/n44m45QVQ/vJyzFKt
	 fmuMydMCfpWhIAtrpeE/awf+Mep0MT17YVX/qZ0QwhHjUj1t8g23owLfhVhHpdWnK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/ngX9J5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD0606A888;
	Mon, 16 Nov 2026 02:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/ngX9J5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51991F000CA;
	Mon, 16 Nov 2026 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794823;
	bh=om/X9t1Aih03jhKVB/Sm7/LnmMQaHENjfg1lTusfAi0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W/ngX9J5XAfs5t9//jNFOIUthFn8AfqCGaGqOtgbPmx6lNjbWwNZjxEiYp49zXc6l
	 1loiKopU3Gks43Bcl+T3ubcCUeA3GfB1ZjShtS30NjOuxHKQ4rYXLiJrPJuRn2DR4e
	 +kwoupTYHAMDZukMxLyxc+V/vrcfRfPgwtKFKm555zTmhdnPk+xD0LGl1hpLCE+rd/
	 95y4xxLxG8/tkCdTrrS2SWTMxsSdJ1xnrMvhVZGElLMijywPcQUgsZWeK0T6P1VMvJ
	 WAtaDzt6jxQT9esYHaM7mwLR1fT9I0rFZnAIUeeETPW4C0Fw2VC24JyIxNKGvaq0Fx
	 VzMiTY5n8zlog==
Subject: Re: [PATCH net-next v21 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:02 +0000
Message-ID: <179479482220.3136.14070184395975500303@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-8-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-8-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch hooks ax88179_set_multicast() up as
  .ndo_set_rx_mode for the AX88179A/AX88772D/AX88279 family…
- [Low] The patch is titled "Add AX179A/AX279 multicast configuration",
  but it changes ax88179_set_multicast() in…

--

ax88179_178a: Add AX179A/AX279 multicast configuration

This commit changes ax88179_set_multicast() to build the RX_CTL value in
a local variable. The value now always includes AX_RX_CTL_DROPCRCERR,
and AX_RX_CTL_IPE is added only when data->ip_align is set. The commit
also hooks ax88179_set_multicast() up as .ndo_set_rx_mode for the
AX88179A family netdev ops.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index fa6423f51849e..f27b073e1bccb 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -319,16 +319,21 @@ int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
>  void ax88179_set_multicast(struct net_device *net)
>  {

[ ... ]

> -	data->rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
> +	rxctl = (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
> +	if (data->ip_align)
> +		rxctl |= AX_RX_CTL_IPE;

[Severity: Low]
ax88179_set_multicast() is shared code. The legacy AX88179/AX88178A
driver in ax88179_178a.c also uses it as .ndo_set_rx_mode. ip_align is
always 1 for those chips, so IPE does not change for them. The only
change on legacy hardware is that DROPCRCERR now stays set after every
open and every RX mode change.

Before this patch, the START|AB|IPE value cleared the DROPCRCERR bit
that ax88179_reset() programs. With the bit kept set, the chip drops
bad-CRC frames before they reach ax88179_rx_fixup(). They are then no
longer counted here:

drivers/net/usb/ax88179_178a.c:ax88179_rx_fixup() {
    ...
		if ((*pkt_hdr & (AX_RXHDR_CRC_ERR | AX_RXHDR_DROP_ERR)) ||
		    pkt_len < 2 + ETH_HLEN) {
			dev->net->stats.rx_errors++;
    ...
}

The subject only names AX179A/AX279. Could the commit message say that
the legacy chips are affected too, and that their rx_errors accounting
changes?

The commit message also says:

  "make sure that AX_RX_CTL_DROPCRCERR is also set to be consistent
  with the initial configuration in ax88179_reset()"

That is only partly true. ax88179_reset() and ax88179a_reset() both set
AX_RX_CTL_AP, and this function still clears it.

The comment in ax88179a_bind() points to a different reason, a
requirement of the AX88279:

	/* The AX88279 requires both the AX_RX_CTL_IPE and AX_RX_CTL_DROPCRCERR
	 * bits set in AX_RX_CTL for creating correct RX-URBs. AX_RX_CTL_DROPCRCERR
	 * is anyway set for all chips, make sure AX_RX_CTL_IPE is set via ip_align.

Would it be clearer to split the legacy behaviour change into its own
patch, or to describe it in the commit message? This also appears to be
unchanged at the end of the series.

[ ... ]

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index 4207d2cc2b865..a6b0a3f47118c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -678,6 +678,7 @@ static const struct net_device_ops ax88179a_netdev_ops = {
>  	.ndo_set_mac_address	= ax88179_set_mac_addr,
>  	.ndo_validate_addr	= eth_validate_addr,
>  	.ndo_eth_ioctl		= ax88179a_mii_ioctl,
> +	.ndo_set_rx_mode	= ax88179_set_multicast,

[Severity: Medium]
This hook makes ax88179_set_multicast() a second writer of AX_RX_CTL on
the AX88179A/AX88772D/AX88279 family. What serializes it with
ax88179a_mac_link_up()?

ax88179_set_multicast() is called from __dev_set_rx_mode() with only
netif_addr_lock_bh() held. It stores data->rxctl with WRITE_ONCE(),
always with AX_RX_CTL_START set, and then submits an async control URB
through ax88179_write_cmd_async().

ax88179a_mac_link_up() runs from the phylink_resolve() worker with
phy->lock and pl->state_mutex held. It takes medium_status_mutex around
its final write. It holds neither RTNL nor addr_list_lock, and
ax88179_set_multicast() never takes medium_status_mutex:

drivers/net/usb/ax88179a_devices.c:ax88179a_mac_link_up() {
    ...
	/* Stop RX/TX for link configuration */
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, AX_RX_CTL_STOP);
	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_PATH, 1, 0);
    ...
	mutex_lock(&ax179_data->medium_status_mutex);
    ...
	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data->rxctl));
	mutex_unlock(&ax179_data->medium_status_mutex);
    ...
}

Could an update be lost in this sequence?

phylink_resolve() worker
ax88179a_mac_link_up()
    READ_ONCE(ax179_data->rxctl) returns the old value

                          dev_set_promiscuity()
                          ax88179_set_multicast()
                              WRITE_ONCE(data->rxctl, rxctl with PRO)
                              async AX_RX_CTL URB completes

    ax88179_write_u16(..., AX_RX_CTL, 2, <old value>)

The hardware would then be missing PRO/AM/AMALL even though
data->rxctl says they are set. This would last until the next RX mode
change or link flap. Enabling promisc, adding the device to a bridge or
starting tcpdump while a link-up is being processed could all trigger
it.

The ordering also looks open. Suppose an async START|AB|DROPCRCERR
write is submitted after the AX_RX_CTL_STOP write but before the final
restore. RX would be turned back on while the RX CDC and bulk-in
settings for the new speed are only partly programmed. What the
hardware does with START set while MAC_PATH is 0 isn't documented, so
this part is less certain.

The WRITE_ONCE()/READ_ONCE() pair prevents torn reads. It does not
make "read rxctl, then program the register" atomic with respect to the
other writer.

Before this patch these devices had no ndo_set_rx_mode. AX_RX_CTL was
only written from the reset, link_up, unbind and suspend paths. This
also appears to be unchanged at the end of the series.

>  	.ndo_set_features	= ax88179a_set_features,
>  	.ndo_vlan_rx_add_vid	= ax88179a_vlan_rx_add_vid,
>  	.ndo_vlan_rx_kill_vid	= ax88179a_vlan_rx_kill_vid,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
