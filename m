Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794814;
	b=2ZmT/hwu4IRE8/iDkEKM7VReo8CFAstToH26GzhxPYjJrDmBj5Yc4e5VhmXSYQ03+21n
	 Ahw4NSIg+JiKlQcdyB2jB41xangTc/N+CWxlkMYtcj7lDhnY/SCfgcKdS4GVsFnr67Gsh
	 VUioa0/nmlsqGLf1P1ZfZf9sGVVze6rt4p2DQlvXgtNy73g3Y0QX6MA7kMARFK7cp5+OW
	 NLRpvUSGysNrJYo+pkEkJLIPkG10tjzt6iFlEFgl5vNY/a8MCXTCJ45NRRj24gAgnACCG
	 dC/PrY2HHy/qyYXApxca0I3xqm2CPaHFjMohNwy5j398tlC7JRLyR96pyP1msK8HvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794814;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AyN9oXLJLPfu4KohfU23gdr6R758HYP5wTMLtnJg4oM=;
	b=B4KYMJQ7NAuLx3lUxC4ouenjDr0PqWE7xyYKgo8MqAUOXBLX1w79q06dH1TVWh0i5RiH
	 h9bLf0BNVMvYtHEJAKCbeTToLuIwOE2vdtlLL1P3jtnj8++yVlUXCt5LvpZWL9Nt64SNO
	 YdO1TaJl+fLgRM7pmGcsu1N6lZjiHR4V5vs3+vuAc2KeeJ8s3bw/6oDPjLYtdbA5lxpzE
	 CxcXw1VGx/qMbT1RoESyonrQuYFc2rbeZhXOngm5AvNyghF7lB0TaZazG3exLiL4EVSRi
	 TVYCwlKeuHTpuOuJtP/8++Aprublj/PkbDraLQXn+SFxmztWCrOQAjHtBxgduU9R34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsdU2VCy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECD606A32C;
	Mon, 16 Nov 2026 02:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsdU2VCy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFEB1F000C4;
	Mon, 16 Nov 2026 02:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794813;
	bh=AyN9oXLJLPfu4KohfU23gdr6R758HYP5wTMLtnJg4oM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YsdU2VCyTnH9kd1vgtOrBKt0ITGI+JRBPI+lG4V5Ec3ZYDtW+I3dBo+PiDPBmc1j5
	 sgg6vhj3l0V4sREkxH96mIQt0pe/Ux4/PYhXru0qz0opFsFqQvhD+FLu1suut6mF8j
	 9GAjfsvCjXco9lB+Ja3A8oIYiwKS31XSSa4CG2n1SShGxUqeV0B5g5XY09MLxIpNHL
	 7a54fmMB23BaJT6pyHNjzk0hCCgYqWER/8kHYFR6Gnv2u+gnc7ye9trEeBf84bPJxd
	 uKlE5lGu1RE1yrv+u6+VBSqDlHBVtVnmplKFGyW/LrLlCD/3oLAE3Z8bwGYUppb8kx
	 fcGnuglm0dyOw==
Subject: Re: [PATCH net-next v21 01/13] phylink: Add phylink_mac_interrupt
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:06:52 +0000
Message-ID: <179479481209.3136.3578602024095855268@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-1-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-1-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] phylink_mac_interrupt() (drivers/net/phy/phylink.c:1629-1637)
  is meant to be called from interrupt context.

--

phylink: Add phylink_mac_interrupt

This adds an exported helper, phylink_mac_interrupt(), that MAC drivers
can call from interrupt context. It forwards a link-change interrupt seen
by the MAC to phylib by calling phy_mac_interrupt() on the attached PHY.
Drivers can then skip polling the PHY.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e885da1c28311..a87eaa2f3db5b 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1616,6 +1616,26 @@ static bool phylink_link_is_up(struct phylink *pl)
>  	return pl->netdev ? netif_carrier_ok(pl->netdev) : pl->old_link_state;
>  }
>  
> +/**
> + * phylink_mac_interrupt() - wrapper for phy_mac_interrupt()
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * Passes a link-change interrupt received by the MAC to phylib.
> + * This function may be called in interrupt context, and therefore cannot take
> + * a mutex. However, it is safe to assume that the reference to phy does not
> + * disappear during the call, as only an SFP module may be unplugged to make a
> + * PHY disappear. SFP modules however do not support interrupts.
> + */
> +void phylink_mac_interrupt(struct phylink *pl)
> +{
> +	struct phy_device *phy;
> +
> +	phy = pl->phydev;
> +	if (phy)
> +		phy_mac_interrupt(phy);

[Severity: Medium]

Does the lifetime argument in the kernel-doc above hold?

pl->phydev is read here with a plain load. No lock, RCU or reference is
taken. Every writer, phylink_bringup_phy() and phylink_disconnect_phy(),
changes it while holding phydev_mutex, phy->lock and state_mutex. KCSAN
would likely report this as a data race.

The pointer is then used by phy_mac_interrupt()->phy_trigger_machine(),
which calls mod_delayed_work() on phy->state_queue.

phylink_disconnect_phy() is not specific to SFP. It does not wait for a
phylink_mac_interrupt() call that is already running:

drivers/net/phy/phylink.c:phylink_disconnect_phy() {
    ...
		pl->phydev = NULL;
    ...
	if (phy) {
		flush_work(&pl->resolve);
		phy_disconnect(phy);
	}
}

phy_disconnect() goes through phy_stop_machine(), which calls
cancel_delayed_work_sync(&phydev->state_queue). Then phy_detach() drops
the attach reference.

Suppose an IRQ loaded the old pointer before pl->phydev was cleared. Can
it then queue state_queue again after the cancel, on a PHY that has
already been stopped and detached?

The SFP part of the argument may not hold either. SFP module PHYs are
also stored in pl->phydev, via
phylink_sfp_connect_phy()->phylink_bringup_phy(), and
phylink_mac_interrupt() does not check phy->is_on_sfp_module.

The interrupt comes from the MAC, not from the SFP PHY. Removing a module
is just the kind of event that makes a MAC or PCS report a link change.

When the module is removed, sfp_sm_phy_detach() does:

	sfp_remove_phy(sfp->sfp_bus);
	phy_device_remove(sfp->mod_phy);
	phy_device_free(sfp->mod_phy);

Here sfp_remove_phy() ends up in
phylink_sfp_disconnect_phy()->phylink_disconnect_phy().

If a MAC hardirq has already loaded the old pl->phydev, could
mod_delayed_work() run on a phy_device that has already been freed?

The only caller in this series, ax88179a_status(), looks safe.
usbnet_stop() kills the status URB before ->unbind() calls
phylink_disconnect_phy(). The concern is the contract of the exported
API. The kernel-doc says the call is safe and does not tell callers to
mask and synchronize the MAC interrupt before phylink_disconnect_phy() or
PHY teardown.

Should the kernel-doc state that requirement, or should
phylink_mac_interrupt() protect the pl->phydev pointer itself?

> +}
> +EXPORT_SYMBOL_GPL(phylink_mac_interrupt);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
