Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048815;
	b=xOzzuk6vhbj1l+KlR/7Tushk7QbZEw81g7aLqSS3jitwwowOb+8Jt7XLpDUue4rRA0Jt
	 7rCfMJCz/SMG/DaconLxmaUgAtgvmzH0EAafJAr0AKjhjaEm7rb18ySMRQj/tI+QCURxp
	 iIH6vTbPr5347OOeF+rkGGdjSU7qMad26fz9PRJuWYTMM/kDeVNix2734xeoxgoRhfmVe
	 ryxd2DXJM3G5m2yRQrhKiiT27ILxoQtO4coY/Tr/J2yJpc3RkhbHQebcfmCBs+6btBtom
	 5g2nq2/txIqci1UdMxuxOMKUJT75H5QlwYHkcnQQ6+tT5nHRXW+DIPR/VthYZkpmSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048815;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=mH/GpsPPirC6mELIGbZkxdo7T8fe/zXCXZSCzaQ6v48=;
	b=tRFWTOowocZVBO474l2KjPFlAbEujfPmQjMAJHx1CE5cqG5du7HSUtbb3E4Ljssd+CC5
	 jYQA+3L07cZKJJrTDnhCoojku/J9myrC8Tf8tmLVXH428FiwyKlG+Y8T0Q10Yk3vOG+R2
	 hFA1qeOZC4d0oy0UCjjqIRlekrOBZy6e1R9lrskfid1qvVv0ylzCqb+lypRrpvK5Mo7Hn
	 GaNWRJineoB93mwz9QAIvmNO7dcqWXqsPHiDdHgncYQBT4pqjWkOHfL5c3WJqSjxB+Ly2
	 1aLlMG+LJTI3ciT3lz3IEdcjS5HTkSA/sVpEhdvS8pj74n/jVA0clywapAou+0OMKJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqbEWm72;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E47606A31C;
	Thu, 19 Nov 2026 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqbEWm72
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAD41F000C4;
	Thu, 19 Nov 2026 00:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048814;
	bh=mH/GpsPPirC6mELIGbZkxdo7T8fe/zXCXZSCzaQ6v48=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SqbEWm72dT6Bo95rB5VC2FbvrmPHfSxWidxxZvfwym9vUInok0SFU/BWXpQVWMKC5
	 7foGxa1IsR3AEIqXo+R9X/kl+PxXTOlC8uIQJlnrhsSjIiX5U3Yly3ch/QbC9jrzWq
	 uAnzZclfiOaz613oeDAErQrEmGyBlhfrb34uPcqf+vVxqYdouwRX/2IbKJT7GUPRpY
	 lTHXJOfb+YnoUagoV6qFhRqjLyMFEd1MD52h1Itv8mA6nPA4ggaE4Qa/0sshKApMoi
	 PJlrIIj04GwnbtAlm3pxNgPSNdZ9qV8gunbO0+1dR5iUt7LJrXJs4zxz31CBzuICZS
	 6roT5G7NEjyQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44443808210;
	Thu, 19 Nov 2026 00:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v21 00/13] ax88179_178a: Add support for
 AX88179A-based chips
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504881327.2666484.11881850734497891131.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:40:13 +0000
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
In-Reply-To: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com, nb@tipi-net.de,
 maxime.chevallier@bootlin.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 11:50:56 +0100 you wrote:
> This adds support for the current generation of ASIX network adapter chips,
> which are based on the AX88179A. This includes the AX88179A/B (1GBit-PHY),
> AX88772D/E (100MBit) and AX88279 (2.5GBit).
> 
> The AX179A-based chips all provide both a CDC-NCM compatible USB interface,
> and a proprietary vendor interface with more features. By default, the
> proprietary vendor interface is not active and Linux will load the CDC-NCM
> driver to support the devices. If the ax88179_178a module is configured by
> the OS to have precedence over CDC-NCM, then this driver will switch the
> device to use the vendor interface, and the device will be controlled by
> the ax88179_178a driver when the device is probed again after an automatic
> reset of the device bringing up the vendor interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v21,01/13] phylink: Add phylink_mac_interrupt
    https://git.kernel.org/netdev/net-next/c/525e055f026b
  - [net-next,v21,02/13] phylib: Add support for PHYs with broken forced mode
    https://git.kernel.org/netdev/net-next/c/73f8fcee8453
  - [net-next,v21,03/13] ax88179_178a: Split driver into library and device specific code
    https://git.kernel.org/netdev/net-next/c/aadb4048a412
  - [net-next,v21,04/13] ax88179_178a: Add HW support for AX179A-based chips
    https://git.kernel.org/netdev/net-next/c/7d573278f9a5
  - [net-next,v21,05/13] ax88179_178a: Add EEE configuration support for AX88179A MACs
    https://git.kernel.org/netdev/net-next/c/ac12cbe7b385
  - [net-next,v21,06/13] ax88179_178a: Add EEE configuration support for AX88179A PHYs
    https://git.kernel.org/netdev/net-next/c/4ae4234e779c
  - [net-next,v21,07/13] ax88179_178a: Add VLAN offload support for AX88179A
    https://git.kernel.org/netdev/net-next/c/faea93a5239c
  - [net-next,v21,08/13] ax88179_178a: Add AX179A/AX279 multicast configuration
    https://git.kernel.org/netdev/net-next/c/192c7b09608a
  - [net-next,v21,09/13] ax88179_178a: Add Suspend/resume support for AX88179A/772D/279
    https://git.kernel.org/netdev/net-next/c/24543aeed42f
  - [net-next,v21,10/13] ax88179_178a: Add ethtool get_drvinfo
    https://git.kernel.org/netdev/net-next/c/8d405df176e1
  - [net-next,v21,11/13] ax88179_178a: Update driver name and information
    https://git.kernel.org/netdev/net-next/c/d7e3ce733ae3
  - [net-next,v21,12/13] ax88179_178a: Add support for AX88179A/772D/279 EEPROM access
    https://git.kernel.org/netdev/net-next/c/bfa4a3adf638
  - [net-next,v21,13/13] ax88796b: Add support for AX88772D, AX88179A and AX88279
    https://git.kernel.org/netdev/net-next/c/8cacc4fd1518

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


