Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794828;
	b=R/Nls3PCix+81XpqvBg2xSFMopqevMSlC0X16T4Gl2GYJi0JyGWaRVFI1nnBj5ZbSNSC
	 ApNDRg+FOMz8+AFawnngAs/dsfQ1pcxvFyGn+R4hGPWDvrumQnBkLuaEQFKTtLPe1pXN0
	 /aanomu7P6aNi8Mzql+WH/UAPVhr3rZ5pKgQCC6aHH8FnNJiItsbFGW3jGTHv0+myTC6a
	 1fQ7yoPIxxnYfTCRkId85k58W3dDSfq5PrVvMNJkS1NrMt59lKGov7LaYf2mTyS+eHhEk
	 lmvAZetnIWuWsQnEPO4FFvWglT2YxZMujjEPmfNnHBmEjDG0KAMGiPq/aI2rqkA33Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794828;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uBec+GyObfIvAmuuRmArBlWqLASyyq8JQcZ5XP7ZUy0=;
	b=mGD67eyZgTShhJSdsoEQhJLndX8zF59veGzgXg2g6RzAPwbnsfBEHRLgFwR1NjIqbZ6G
	 lLYSS6azRK2jjw20RW9yRt7hrLB5QM9NiZhGcoCXwKYS+CSSYchJfwcKJvPmfFY1GgZnS
	 Vhv7nNBNIp4oKof+BSksYF4NCFKuOn2krBNBxUq09pIvtxbFhZBkna5jyhiYnXW35VYas
	 pr09cZJigoH/CKxrMk04BX9a/Fq84QDoSfWtkBSW+m1S96FMPxG6hDPo0N844T79WlhoC
	 Gfeugoee53gaEQjZJdp5riNKD5EsTxFozZHkp2EoS3/zE3tbG605CpGugW3NQdupQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYqxLCgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E32606A8B6;
	Mon, 16 Nov 2026 02:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UYqxLCgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DC51F00927;
	Mon, 16 Nov 2026 02:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794828;
	bh=uBec+GyObfIvAmuuRmArBlWqLASyyq8JQcZ5XP7ZUy0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UYqxLCgQ36M/6Z5oUKMScAWe7d82AZGurbKx15J6VIusvkx/+LuoD9Egd6J7oJPDR
	 oEXilBr/pe3Az9QCSh9TM5eCqcCMAW4ayRUkHXxo9Rd6mZ0thATeejcpgQIuRtAffo
	 pO9GkpPSXlDR3gvk6PMO00XwkDAA1F0A3lcOqkqMI0dXHUJaPXPmqyMbyIanENHrRQ
	 kEQ9rGIqbaybVXXwo34QPqxkUFfRmiOxWh3mnDTi8Xlxlaz9UUSiHr3ZpIyt5r1BIN
	 fkZmMlHl3OpI13WO5ht9xr0vmN4h9k1Cq4ykvqUaJGibqMcte22Es+Mrp8CgEVQyWZ
	 xhcQmG75T1rzQ==
Subject: Re: [PATCH net-next v21 11/13] ax88179_178a: Update driver name and
 information
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:07 +0000
Message-ID: <179479482708.3136.10346915942423337117@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-11-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-11-c2d34410bcbe@birger-koblitz.de>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/usb/Kconfig the patch quietly deletes `default
  y` from the AX88179 driver entry and, in the same hunk, renames the…
- [Medium] The patch changes usb_driver.name in
  drivers/net/usb/ax88179_178a.c (struct ax88179_driver) from…
- [Low] The commit message says the patch adds "further requirements such
  as PHYLINK".

--

ax88179_178a: Update driver name and information

This commit renames the Kconfig symbol USB_NET_AX88179_178A to
USB_NET_AX88179 and updates the loongarch defconfigs to match. It extends
the Kconfig help text and MODULE_DESCRIPTION to list the newly supported
chips, and renames the usb_driver from "ax88179_178a" to "ax88179".

> diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
> index 115990b0d9537..cc8f2e1503399 100644
> --- a/drivers/net/usb/Kconfig
> +++ b/drivers/net/usb/Kconfig
> @@ -195,18 +195,21 @@ config USB_NET_AX8817X
>  	  This driver creates an interface named "ethX", where X depends on
>  	  what other networking devices you have in use.
>  
> -config USB_NET_AX88179_178A
> -	tristate "ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet"
> +config USB_NET_AX88179
> +	tristate "ASIX AX88179/179A/178A USB 2.0/3.0 to 100M/1G/2.5GbE Adapters"
>  	depends on USB_USBNET
> -	select CRC32
>  	select PHYLINK
> -	default y

[Severity: Medium]
The commit message covers the symbol rename but does not mention that
default y is removed here. Was that intended?

savedefconfig leaves out symbols that are at their default, so the two
loongarch defconfigs are the only in-tree defconfigs that name this symbol.
Other defconfigs enable USB_USBNET without naming it. For example,
arch/arm64/configs/defconfig has:

CONFIG_USB_USBNET=m

The same goes for multi_v7, imx_v6_v7, exynos, tegra, qcom, omap2plus,
bcm2835 and the drm CI configs. These got ax88179.ko only through the
default. With the symbol renamed and the default gone, won't they silently
stop building the driver?

Existing .config files hit the same problem. make olddefconfig drops the
stale CONFIG_USB_NET_AX88179_178A line, and the new symbol takes its
default, which is now n.

The sibling USB_NET_AX8817X entry still has default y. Without the default,
the updated "# CONFIG_USB_NET_AX88179 is not set" lines in the loongarch
defconfigs are also redundant.

Should default y be kept here?

> +	select AX88796B_PHY

[Severity: Low]
The commit message says:

    Add additionally supported devices to Kconfig description, add
    further requirements such as PHYLINK.

select PHYLINK was already there before this patch and appears as unchanged
context above. The only new dependency is select AX88796B_PHY, and the
commit message does not name it. Could the message mention it instead?

At this commit the select also does nothing. drivers/net/phy/ax88796b.c
matches only 0x003b1861, 0x003b1881 and 0x003b184x. ax88179_mdiobus_read()
reports 0x003b179a, 0x003b772d and 0x003b2790, so genphy binds instead.

The last patch in the series ("ax88796b: Add support for AX88772D,
AX88179A and AX88279") adds those IDs to the C driver.

The Rust variant still lacks them at the end of the series. With
CONFIG_AX88796B_RUST_PHY=y, drivers/net/phy/Makefile builds ax88796b_rust.o
in place of ax88796b.o:

ifdef CONFIG_AX88796B_RUST_PHY
  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b_rust.o
else
  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o

ax88796b_rust.rs matches only 0x003b1861, 0x003b1881 and 0x003b1841. In that
configuration, wouldn't the AX88772D, AX88179A and AX88279 PHYs still fall
back to genphy? That gap belongs to the later ax88796b patch rather than
this one.

> +	select CRC32
>  	help

[ ... ]

> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index b077b7153f0c0..88dce368eacfe 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
> @@ -1361,8 +1361,8 @@ static const struct usb_device_id products[] = {
>  };
>  MODULE_DEVICE_TABLE(usb, products);
>  
> -static struct usb_driver ax88179_178a_driver = {
> -	.name =		"ax88179_178a",
> +static struct usb_driver ax88179_driver = {
> +	.name =		"ax88179",

[Severity: Medium]
Userspace can see this name. usbnet_probe() copies it into
dev->driver_name, and usbnet_get_drvinfo() reports it:

drivers/net/usb/usbnet.c:usbnet_get_drvinfo() {
    ...
	strscpy(info->driver, dev->driver_name, sizeof(info->driver));
    ...
}

So ethtool -i now shows "ax88179" for every device this driver handles,
including existing AX88179/178A adapters.

The USB core also registers the driver directory under this name. That
means /sys/bus/usb/drivers/ax88179_178a/, along with its bind, unbind and
new_id files, goes away.

MODULE_ALIAS("ax88179_178a") keeps modprobe ax88179_178a working. Does it
help udev rules matching DRIVERS=="ax88179_178a", systemd .link files using
Driver=ax88179_178a, or scripts that write to the old sysfs path?

The earlier patch "ax88179_178a: Add HW support for AX179A-based chips"
says AX179A-family devices bind to cdc_ncm by default. They only use this
driver "if the ax88179_178a module is configured by the OS to have
precedence over CDC-NCM". That kind of configuration would usually be a
udev or sysfs rule that names the driver.

Is this userspace-visible rename intended, and could the commit message
describe its impact?

>  	.id_table =	products,
>  	.probe =	usbnet_probe,
>  	.suspend =	ax88179_suspend_wrapper,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
