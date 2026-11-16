Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794815;
	b=iTpZvVytkaIfI0LRH6F9LxqD5EeXPSHUQMJ0XXnr8h11zqn852/hA1EOcFRhTydRXQi/
	 keJ1dFSyREVxrz7hJ8PJ5xqBeDXK93S556zkmIBEWNicpxwDp+aQYQNKAm5s0taiEJ8D7
	 Q5yQOmpQrIYd3eqqqJJqXRt/sTI6U1X0qDYeOKNZ/kq23fKKTYXEop3TccpNC2Hnq4/yD
	 CBIBp2LBQoVG9AaJnfBQLiic5NGwMbCb1xSucdyhompfnjeVnzCqZ/Pkv9LLdb7ib0qza
	 PQeJtmf65l80Onuwr1lRDay0J9P+Dq3Wc6MmmO/mL6Nk1jnebZjGmC8dusVNf7JlMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794815;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p59Nqouvw/Y1Hsysnv6GrIlTxTq1/nSacS9ypF2MY2w=;
	b=U4or1yBkt9KuK5cMjB+dlfStF5wyqu5eB/nO0xJE/R77olQA1PwBzlvDdV0wqYqa+OXF
	 dGIJVE3xXjd8hvmBrFQUO0uFdiYq4H+HCFkbxMsQCtcsWbCL6y7T85PDvVdnKjlfI4z1E
	 FrKyf98JX17vJNhhiWrKd1BWjYvVfz+EUddWPo4DaLNZPHYUtQTspBSv0W0/X1tTT04Fs
	 KpEWOq+ymBpsSgy8NvsBBgp5S/ACkyfsEeQpwroGISCgHd8vSLD7DPlPHc3JkRqCjrAEq
	 lzqo62d+6xXwud0/fxKx2Ce0RG51Q+DlUZqNSxaU20Kwb5XMBxE/7yZyNrssr6L1+ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAXW23yN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664D6606A33D;
	Mon, 16 Nov 2026 02:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GAXW23yN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467FB1F000C4;
	Mon, 16 Nov 2026 02:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794815;
	bh=p59Nqouvw/Y1Hsysnv6GrIlTxTq1/nSacS9ypF2MY2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GAXW23yNnUCBjktD2KR5Vfg9h2mHf8YFP5EK+o7QAXMFSdaZRtWJ7dtoZZgkZefDV
	 0IYSpGoWXng+VicqzZo4QSS2gNQve/ghd0dOD68/nT9NtCont4gybmqSe3juLi6n+Z
	 vtIVStIVUTiEd2dvQUF3UibNJTzfpZ5EqA9ugEiH5+Xt2clsjWzALWW1Z0UdPJnzue
	 8WfK2iRnKLrwXRM2GeYa9114XQ2bs81N9OcDsK84fFqcd2L0ulanxfVhEDfICbnuf2
	 9nCazeRqj52t7zTkbCyOP8K3J5KDDqt6+a0kNA4wHdomb7qqTfgKlsuL2q/kDX+3Ue
	 J0SbUUBj25guA==
Subject: Re: [PATCH net-next v21 02/13] phylib: Add support for PHYs with
 broken forced mode
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:06:53 +0000
Message-ID: <179479481380.3136.17048496149036079912@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-2-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-2-c2d34410bcbe@birger-koblitz.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The concern: PHY_BROKEN_FORCED (include/linux/phy.h:67) has no
  user at this commit, so the checks in phy_ethtool_ksettings_set()…

--

phylib: Add support for PHYs with broken forced mode

This adds a PHY_BROKEN_FORCED driver flag. With it set,
phy_ethtool_ksettings_set() and phy_mii_ioctl() return -EOPNOTSUPP when
someone asks for a forced speed/duplex mode. The aim is to avoid the
warning in the PHY state machine when config_aneg() rejects forced mode.

> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index fce9bc7be3304..079c53516f424 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c

[ ... ]

> @@ -1190,6 +1193,10 @@ int phy_ethtool_ksettings_set(struct phy_device *phydev,
>  	      duplex != DUPLEX_FULL)))
>  		return -EINVAL;
>  
> +	if (autoneg == AUTONEG_DISABLE && phydev->drv &&
> +	    (phydev->drv->flags & PHY_BROKEN_FORCED))
> +		return -EOPNOTSUPP;
> +

[Severity: Low]
No driver sets PHY_BROKEN_FORCED at this commit. Doesn't that mean this
check, and the matching one in phy_mii_ioctl(), can't trigger yet?

The commit message says:

  This prevents a kernel warning and stack-trace within the
  phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()

Later in the series, "ax88796b: Add support for AX88772D, AX88179A and
AX88279" sets the flag on the AX88279 entry. That driver's
asix_ax88279_config_aneg() returns -EOPNOTSUPP when autoneg is disabled,
so the description is accurate once that patch is applied.

Would it help to say in the commit message that the first user comes
later in the series?

Separately, two existing drivers already reject forced mode in
config_aneg(), but they return -EINVAL:

drivers/net/phy/bcm84881.c:bcm84881_config_aneg() {
    ...
	/* disabled autoneg doesn't seem to work with this PHY */
	if (phydev->autoneg == AUTONEG_DISABLE)
		return -EINVAL;
    ...
}

drivers/net/phy/air_en8811h.c:en8811h_config_aneg() {
    ...
	if (phydev->autoneg == AUTONEG_DISABLE) {
		phydev_warn(phydev, "Disabling autoneg is not supported\n");
		return -EINVAL;
	}
    ...
}

These two still reach the warning through
_phy_state_machine()->_phy_start_aneg()->phy_error_precise(). This
patch didn't cause that, and converting them could be a separate
follow-up.

Would these two drivers be good candidates for the new flag?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
