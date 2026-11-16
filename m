Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794830;
	b=eMzT6K4rwRCDbwtkgdTMsogl0aNjM6HV7BaKaF5gz82myXX2dBcW0XuttZdkmYfOnLZ5
	 WPUZaAXPgA/EVpbsnPsw1BkwmiZiQZOFnBX/Vl/Jfes/YS6ljnokGe2Rk7vkH++Q7M37C
	 alH4KIW2PdQPnyvUz62F9EfPdsDp3vJsoPj3Eyf8SNl0p4DyWnxEk83oxsL2lT4m5n0Gn
	 m/Ae1lDVT3E/7Rm8fX5oX1tN0vqNjpZY3pbc6fYJyEGA7XgV9jKo0JUszxAGCNU0SQ1zW
	 qbBRBQaTun0UOjVwuWyGO7wdJWqoYJ2DaGFzgVi/kLKnY4jnKErSGhVy6GlXcTWhqgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794830;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=D/IbGZ9nhg9AGebaNUKLhffH3G51e8GK38u9ilPGpl0=;
	b=a1d+hxgM11/mZ7QFL9rb0ImE1Z+OVXjEZJpO7yWoRkZ66EgSLqjy6e41+HUKOAbcCM69
	 e4FwqZDTgPcM/tBYkiMjxn7gKLreX/m/I77MxwnJ1PiEXjDxX8knkRgTCsWLInWGR8gum
	 mfIwKMSg0bSu8mSJFd0vV7kbiMzhPS/lFsVeOrMwbSvEahG9Fw72AqDELIPOkaKdAxIT+
	 fO39jUYKbY71Zz/3qMw0Bbppt3ZRt/pLWtlFG1HmDVZikTcazP0zpJd6tt+iY82dgblNa
	 PCz9A98PgWBlHcyrZSaapZjJL7RmoF5kuYwIONLQORK7tkEYY9vUfvd3aB/oBS6SK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYso6ZsW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C08606A88B;
	Mon, 16 Nov 2026 02:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TYso6ZsW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A491F00932;
	Mon, 16 Nov 2026 02:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794830;
	bh=D/IbGZ9nhg9AGebaNUKLhffH3G51e8GK38u9ilPGpl0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TYso6ZsWRiDZ28HKDt9VCGywJ076oZm0H+ZAGFqMHIj/22oqJy1U5OZgaKWKdPUdE
	 DSLZPPeAbwuUrS0xkfpd2Ilm62GZcewa+u9pnYwI+HG86zwZW4aNXUb/sLMhSKwJPW
	 iJrNiBfVmzOZNJtGVqzdKULzInhRtnd7HFnDATdawt8931pyduWEjlHH/Z4PYH5mEX
	 qvP0fCfy+Vfws0jdB0KEGKWBXikBnGIqqmkEdHLOEw4jhmjOCZAzbGIw5fMO5IIrvo
	 TTTrIL9yXlBAD1HvwXBqYXNZV5p5afDbuU97OebNdfrW5qWLmAwRMW0i+xuWRy+Tod
	 3KHU8wR16GsbA==
Subject: Re: [PATCH net-next v21 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:08 +0000
Message-ID: <179479482870.3136.10078101441879571465@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-12-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-12-c2d34410bcbe@birger-koblitz.de>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new EEPROM read path builds each vendor request from two
  sources that are not tied together.
- [Low] This patch quietly closes an EEPROM write path that an earlier
  commit in this series already opened on AX88179A/772D/279 chips, and…
- [Low] The new comment in `ax88179_eeprom_access_params()`
  (drivers/net/usb/ax88179_lib.c) says "AX88279 has an EEPROM…

--

ax88179_178a: Add support for AX88179A/772D/279 EEPROM access

This commit makes ax88179_get_eeprom() chip-aware. It uses a per-device
read command and block size, so ethtool can read the AX88179A/772D efuses
and the AX88279 flash. It also makes ax88179_set_eeprom() return
-EOPNOTSUPP on AX88179A and newer chips.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index 1523a920f3c38..821ee9cd8ded1 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -210,35 +210,61 @@ int ax88179_set_wol(struct net_device *net, struct ethtool_wolinfo *wolinfo)
>  	return 0;
>  }
>  
> +static void
> +ax88179_eeprom_access_params(struct ax88179_data *ax179_data, int i, u16 *value, u16 *idx)
> +{
> +	/* AX88179 has a word-addressable EEPROM
> +	 * AX88179A uses EFUSES with 20 bytes length
> +	 * AX88279 has an EEPROM addressable in 256 byte blocks
> +	 */

[Severity: Low]
This isn't a bug, but is this comment accurate for the AX88279?

The commit message says "The AX88279 has 16K FLASH", and ax88179a_bind()
sets up AX88179A_FLASH_READ/AX88179A_FLASH_WRITE for it. The code below
also passes a byte offset, not a block number:

	*value = (i * ax179_data->eeprom_block) >> 16;
	*idx = (i * ax179_data->eeprom_block) & 0xffff;

Would it be clearer to describe this as flash read in 256 byte chunks,
with a 32-bit byte offset split across wValue/wIndex?

> +	if (ax179_data->chip_version < AX_VERSION_AX88179A) {
> +		*value = i;
> +		*idx = 1;
> +	} else if (ax179_data->chip_version == AX_VERSION_AX88279) {
> +		*value = (i * ax179_data->eeprom_block) >> 16;
> +		*idx = (i * ax179_data->eeprom_block) & 0xffff;
> +	} else {
> +		*value = i << 4;
> +		*idx = 0;
> +	}
> +}

[Severity: Medium]
Can the wValue/wIndex chosen here disagree with the opcode and length used
in the same request?

ax88179_get_eeprom() takes eeprom_read_cmd and eeprom_block from whatever
the bind function set. This helper, and the new write gate in
ax88179_set_eeprom(), branch only on chip_version. That value comes from
the hardware as (AX_CHIP_STATUS & 0xf0) >> 4, so it can be 0..15, and
nothing validates it.

ax88179_bind() in ax88179_178a.c stores chip_version without checking it
and always uses the legacy parameters:

	ax179_data->eeprom_read_cmd = AX_ACCESS_EEPROM;
	ax179_data->eeprom_write_cmd = AX_ACCESS_EEPROM;
	ax179_data->eeprom_block = 2;

That bind handles the generic 0b95:1790 entry, which matches any
bcdDevice other than 0x200/0x300/0x400. It also handles all of the OEM
IDs.

Suppose an AX88179A-class chip binds this way:

  version 6: ethtool -e sends AX_ACCESS_EEPROM with value=i<<4, idx=0,
             len=2
  version 7: ethtool -e sends value=(2*i)>>16, idx=2*i

Before this patch, the same device got consistent word reads (value=i,
idx=1). On that device, ethtool -E now returns -EOPNOTSUPP, even though
bind set up the legacy word-write protocol.

The ax88179a path has the opposite mismatch. ax88179a_get_eeprom_len()
uses a >= test:

	if (ax179_data->chip_version >= AX_VERSION_AX88279)
		return AX88279_EEPROM_LEN;

ax88179a_bind() and this helper both test == AX_VERSION_AX88279 instead.
A chip code of 8..15 would be reported as 16K of flash. It would then be
read with 20-byte efuse requests (value=i<<4) for up to 819 rows, while
only 32 rows exist.

A chip code below 6 on the ax88179a path would get value=i, idx=1 with
the efuse opcode and a 20-byte length. ax88179_set_eeprom() would also
still allow the legacy word writes for it.

Could all of these decisions come from one per-bind setting, for example
an access mode stored next to eeprom_block? Alternatively, could bind
reject or normalize unexpected chip_version values?

[ ... ]

> @@ -246,12 +272,17 @@ int ax88179_get_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8
>  int ax88179_set_eeprom(struct net_device *net, struct ethtool_eeprom *eeprom, u8 *data)
>  {
>  	struct usbnet *dev = netdev_priv(net);
> +	struct ax88179_data *ax179_data;
>  	u16 *eeprom_buff;

[ ... ]

> +	ax179_data = dev->driver_priv;
> +	if (ax179_data->chip_version >= AX_VERSION_AX88179A)
> +		return -EOPNOTSUPP;
> +

[Severity: Low]
This guard changes existing behavior, but the commit message only
describes new read support ("no write access is provided"). Should the
commit message say that this also closes a write path that already
exists?

An earlier patch in this series, "ax88179_178a: Add HW support for
AX179A-based chips", already added these to ax88179a_ethtool_ops in
ax88179a_devices.c:

	.get_eeprom_len		= ax88179a_get_eeprom_len,
	.get_eeprom		= ax88179_get_eeprom,
	.set_eeprom		= ax88179_set_eeprom,

At that point ax88179a_get_eeprom_len() already reported 640 bytes or
16K. So at every commit between that one and this patch, ethtool -E on an
AX88179A/772D/279 runs the legacy word read-modify-write:

ax88179_set_eeprom()
  ax88179_write_cmd(dev, AX_ACCESS_EEPROM, i, 1, 2, ...)  /* per word */
  ax88179_write_cmd(dev, AX_RELOAD_EEPROM_EFUSE, ...)

These parts have efuses or SPI flash, not a word EEPROM. At those commits,
ethtool -e also sends legacy AX_ACCESS_EEPROM word reads across the whole
advertised range.

Could the series be reordered? One option is to leave
.get_eeprom/.set_eeprom out of ax88179a_ethtool_ops until this patch.
Another is to move the -EOPNOTSUPP guard into the commit that adds the
ops. Either way, a bisect or partial backport would not land on a kernel
that can send EEPROM writes and a reload to these parts.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
