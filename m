Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794820;
	b=LAZj8zG+tOsiB3jdMJYt0cpp/3RTnv+lPn88U608VwV9Pi450P59GiaPp2w0iEVbt4Gu
	 CYGl3bQ1PocvuYhhepsAGY6XG0u51P6hcZ6EVEOqQV4bkpBuYY7InoxDOLit58wL63869
	 GvX23r4mpacAju5msjlIneppBz6J86Dgb63VDKdzTA8ebqfygiZTUjZQl8X6SEx9x172U
	 0CYG1NcBLLJ+f3lmvib8vSEARtmrnYppjY5GQSUE9EG1/5O4tYocY6wO+UByS2UjAEw1Z
	 P5rw9Bws5vD++iY0IiE4bGpAgMelJYcuEuVha+uIXJnXgwqvgHYaIxaAREn0MEYhnLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794820;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MlG/42OK0FjbUxbEdHpTMWeIPmJK2RVl31wFAcEnGFI=;
	b=P56WMJMJ6kWAoSiDayZire7cfmPiMdrvBGl80c+foVW2QCNEYUsGop7s5h78oUJm7yHw
	 CHraCPkKRdeLNuLnWpgYna1Srp3dlhG0eQS7Qt0eAhBL59VocM4DVGiz6Kw2MJMfb+jyC
	 fLTtYL6RQkrbEUJ3r+7M3+ETlAnG68toJgFGB0EglR9Bz8FQ+3oFGwp3bzh6G1LTj7d6O
	 w9vSmR9rvri89pUufYdOO4kt7ppbJzF5zBAd9WbqPRZuskgE9my+2WFaFU26IbowpPaDU
	 jNy8Gezhenkvw03mxuCy7AEUnEf0ljvRIzaqBo/JGNgstYZow4UgSzicgzn6py/+rmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSauXhrR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71327606A89E;
	Mon, 16 Nov 2026 02:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSauXhrR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625B41F000D1;
	Mon, 16 Nov 2026 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794820;
	bh=MlG/42OK0FjbUxbEdHpTMWeIPmJK2RVl31wFAcEnGFI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WSauXhrRljC0UnQjHyxn6eue73RhglnXeodmKQdSvzADKPKDLRC0Zq8YhIZASRFIj
	 OD1FG3OwSCYt7kXT27BkgKQ4PdCo4uyCl4VuPnFUezuwIqJM8F5poju6pYzdt7y6yQ
	 GJZk56Qho2d/frctmJ0GBoMCVxsdNo3T389FjSpbJ0L40PzCJmgcbbryX+aIq6ZUcJ
	 eKZ/cJH7yp0pc2dYxTxIvrhZxVVcbo5SFCONGEqn8TynccU7URIQSPzFyZqdlVlnXj
	 QhJ6qwFaPqeyiNuB5HAJfuM3UhvvWqBanyivLYaL9CnoOCqlBLY2b8V+xav+AzPzF9
	 5YrFeEt19IOJQ==
Subject: Re: [PATCH net-next v21 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:06:58 +0000
Message-ID: <179479481893.3136.6353043104743286294@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-6-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-6-c2d34410bcbe@birger-koblitz.de>
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

- [Medium] This patch fills phylink_config.lpi_interfaces in
  ax88179a_phylink_setup() (drivers/net/usb/ax88179a_devices.c:470-472).
- [Low] Once this patch fills lpi_interfaces, pl->mac_supports_eee
  becomes true, and the new .get_eee/.set_eee ops…

--

ax88179_178a: Add EEE configuration support for AX88179A PHYs

This commit fills phylink_config.lpi_interfaces in ax88179a_phylink_setup(),
so phylink now treats the MAC as EEE capable. It also adds ethtool
get_eee/set_eee operations that call into phylink.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index 62619fd68c408..272e923656832 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -225,6 +225,20 @@ static int ax88179a_get_eeprom_len(struct net_device *net)
>  		return AX88179A_EEPROM_LEN;
>  }
>  
> +static int ax88179a_get_eee(struct net_device *net, struct ethtool_keee *edata)
> +{
> +	struct ax88179_data *ax179_data = netdev2data(net);
> +
> +	return phylink_ethtool_get_eee(ax179_data->phylink, edata);
> +}
> +
> +static int ax88179a_set_eee(struct net_device *net, struct ethtool_keee *edata)
> +{
> +	struct ax88179_data *ax179_data = netdev2data(net);
> +
> +	return phylink_ethtool_set_eee(ax179_data->phylink, edata);
> +}

[Severity: Low]
Will ethtool now accept and report a tx_lpi_timer that the hardware never
uses?

ax88179a_mac_enable_tx_lpi() ignores its timer argument:

static int ax88179a_mac_enable_tx_lpi(struct phylink_config *config, u32 timer, bool tx_clk_stop)
{
	...
	/* AX88179A does not provide LPI timer registers */
	return ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, true, 0, NULL);
}

phylink_ethtool_set_eee() does not check eee->tx_lpi_timer. On success it
stores the value in pl->eee_cfg, and later get_eee calls report it back.
So "ethtool --set-eee <dev> tx-timer N" succeeds and reads back N, but the
hardware does not change.

ax88179a_phylink_setup() also never sets phylink_config.lpi_timer_default,
so phylink_create() starts with:

	pl->eee_cfg.tx_lpi_timer = pl->config->lpi_timer_default;

As a result, ethtool shows a 0 us LPI timer by default. That probably does
not match the fixed delay the hardware actually uses.

Before this patch, get/set_eee returned -EOPNOTSUPP, so none of this was
reachable. Some other phylink drivers (r8169, ksz, rtl8365mb) also ignore
the timer.

Could lpi_timer_default be set to the hardware's real fixed delay, or could
values other than the default be rejected?

[ ... ]

> @@ -451,6 +467,10 @@ static int ax88179a_phylink_setup(struct usbnet *dev)
>  		phy_if_mode = PHY_INTERFACE_MODE_SGMII;
>  	}
>  
> +	memcpy(data->phylink_config.lpi_interfaces,
> +	       data->phylink_config.supported_interfaces,
> +	       sizeof(data->phylink_config.lpi_interfaces));
> +

[Severity: Medium]
Does this change the default EEE advertisement on chips other than the
AX88772D?

With lpi_interfaces filled in, phylink_create() now sets
pl->mac_supports_eee to true. ax88179a_phylink_setup() still sets
eee_enabled_default = false, so pl->eee_cfg.eee_enabled is false. In
phylink_bringup_phy() this means:

	if (pl->mac_supports_eee) {
		if (pl->eee_cfg.eee_enabled)
			phy_support_eee(phy);
		...
		linkmode_and(phy->advertising_eee, phy->advertising_eee,
			     pl->supported_lpi);
	} else if (pl->mac_supports_eee_ops) {
		/* MAC supports phylink EEE, but wants EEE always disabled. */
		phy_disable_eee(phy);
	}

Before this patch, the else-if branch ran and phy_disable_eee() cleared
advertising_eee. Now only the linkmode_and() runs. Whatever phy_probe()
read from the PHY's power-on EEE advertisement stays in place, and
phy_probe() has already set:

	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);

If the internal PHY advertises EEE at reset, the link would negotiate EEE
with the partner by default, and ethtool --show-eee would report EEE as
enabled. Meanwhile, phylink's eee_cfg says disabled and MAC TX LPI stays off.

This seems to go against the comment in ax88179a_reset():

	/* Ensure EEE state is off, consistent with phylink setup */
	ax88179_write_cmd(dev, AX_GPHY_CTL, AX_GPHY_EEE_CTRL, false, 0, NULL);

After this patch, that comment holds for the MAC LPI control but not for the
PHY advertisement. The older ax88179_178a driver for the same devices
cleared the advertisement explicitly in ax88179_reset(), using
ax88179_disable_eee() and linkmode_zero(eee_data.advertised).

If EEE is meant to be off by default, should the PHY's EEE advertisement be
cleared explicitly? That way the default would not depend on the PHY's reset
or strap values.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
