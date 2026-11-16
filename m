Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794827;
	b=kEXeqqjrMqYNHl3kllsgjP+YSPdJOdshL2L27JrxCVDZMXCk7utVfidQmZfrdPDnQJWL
	 M5nHoe08gKqWq+g4R5R48CbaXFcP7Qp15c1DYnYGq+4c8vwBLjDYgus/yB4uMo4IyXqY+
	 OZEZqr+95cfMLiNF3BnUugcv2JuSDKLOiV23MLgMqf7U4JuezRmVjVxGqlFS4jzr/ZDw9
	 FwazLTIUv4f6U4r9jJ9iPtmmoN/10IfJSLYik4h4saFLXyXbJ++QvdyAMnxdjlyqZKaKB
	 BcBCkr3HwQJPzEUmkWDzd60vPPONoG1xBAKODIud4gDamtQaX2ar/jDNTbRHlxOk+BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794827;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+KuDMSse6mdV1eusHZ2I6xcvIQeQ6s4RtbvR4Zkb9iY=;
	b=0birXXZvr7F4H15Qm7kdBxv/krucrz8TDnp+BBoYC/YLPfi8jVORH5/Vv3kvVz6zY4ao
	 IOEpISFE5agC13HwnafSRgb2Z5kHNl4wWeISe+TYLz1eQt3df+qV/nvo4sPBOZR2/NN/B
	 8saJzt+wruN8HY0u6JvDS6wFFTRvpZ5iAoAAXYAHtodivv+eNesir8EBs0t2QGPsz1on3
	 WDHi81mbxxTDdOvro0bvJkIUdhd0lkoTf4hM2/oUQuddyg8/aszvyH+BdEertbfItl5Z5
	 QtpdH5F6AuqxLVOzoBzVwvd4HJUby7uQelYEo5kTTxsGxMeouUQYWd/sXzsaODMk3Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ba/DRurA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48560A261C;
	Mon, 16 Nov 2026 02:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ba/DRurA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95501F000C8;
	Mon, 16 Nov 2026 02:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794794826;
	bh=+KuDMSse6mdV1eusHZ2I6xcvIQeQ6s4RtbvR4Zkb9iY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ba/DRurAhdWgEsRijZzK17c0rXdwJqWGQvqpslJaSbDLI37EQkiokct5ra3XwgkG8
	 g+VrdehDx4Ic9tsQv+Fw753Rh5Y17VTm2Qaklub2mBdwPuwn1zLKKXTKYXyr1MddT5
	 FFKi/ZKib2KTFyBUMExf8IouQkHL1XLTxVAJEcSLJgJ8Mr9n6SNWVPZ72iwfG2+hZi
	 oYOUyFAMuzP8KSpaIhUWpL2PErFeMtwqtRZEX/MZ/NmirxtKI8Mj+yzQUV7VnJdBvM
	 KQImnak81i4CEDslrYD4D12C0z7KW4swiFEst42zcsFJxJEPEbqlPnoxUd1LMAQIYI
	 uHJAc43VaoeJA==
Subject: Re: [PATCH net-next v21 10/13] ax88179_178a: Add ethtool get_drvinfo
From: netdev-bot+sashiko@kernel.org
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, chenhuacai@kernel.org, kernel@xen0n.name,
 edumazet@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 neuromoments@gmail.com, beganovic.emir@gmail.com
Date: Mon, 16 Nov 2026 02:07:05 +0000
Message-ID: <179479482548.3136.14472959825841932397@kernel.org>
In-Reply-To: <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
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

- [Low] The new ax88179a_get_drvinfo()
  (drivers/net/usb/ax88179a_devices.c:247-249) prints…

--

ax88179_178a: Add ethtool get_drvinfo

This commit adds ax88179a_get_drvinfo() as the get_drvinfo ethtool
callback for AX88179A-based devices. It reports the firmware version
that was read from the device at bind time.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
> index 01d6a35f68b2c..69095110e7043 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -235,6 +235,20 @@ static int ax88179a_resume(struct usb_interface *intf)
>  	return usbnet_resume(intf);
>  }
>  
> +static void ax88179a_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
> +{
> +	struct ax88179_data *priv = netdev2data(net);
> +
> +	/* Inherit standard device info */
> +	usbnet_get_drvinfo(net, info);
> +	if (priv->chip_version < AX_VERSION_AX88179A)
> +		return;
> +
> +	snprintf(info->fw_version, sizeof(info->fw_version), "%d.%d.%d.%d",
> +		 priv->fw_version[0], priv->fw_version[1],
> +		 priv->fw_version[2], priv->fw_version[3]);

[Severity: Low]
What does ethtool -i report here if one of the firmware version reads
failed at bind time?

ax88179a_bind() stores 0xff in any byte whose AX88179A_ACCESS_BL read
returns an error:

drivers/net/usb/ax88179a_devices.c:ax88179a_bind() {
    ...
	for (int i = 0; i < 3; i++) {
		ret = ax88179_read_cmd(dev, AX88179A_ACCESS_BL, AX88179A_SW_VERSION + i,
				       1, 1, &ax179_data->fw_version[i]);
		if (ret < 0)
			ax179_data->fw_version[i] = 0xff;
	}
	ret = ax88179_read_cmd(dev, AX88179A_ACCESS_BL, AX88179A_SW_REVISION,
			       1, 1, &ax179_data->fw_version[3]);
	if (ret < 0)
		ax179_data->fw_version[3] = 0xff;
    ...
}

The only check in ax88179a_get_drvinfo() is the chip_version one, and
chip_version was read successfully just before these reads. So if the BL
access stalls or hits a transient USB error, the ethtool fw_version field
would show something like "255.255.255.255" or "1.2.255.3". Userspace has
no way to tell that apart from a real firmware version.

This also overwrites the dev->driver_info->description string that
usbnet_get_drvinfo() has just written into info->fw_version.

The 0xff marker itself comes from the earlier commit "ax88179_178a: Add
HW support for AX179A-based chips". This patch is what exposes it
through the ethtool uAPI.

Could the driver record whether the reads succeeded, or skip the
snprintf() when any byte holds the 0xff marker, so that the usbnet
default is kept?

> +}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-ax88179a-v21-0-c2d34410bcbe%40birger-koblitz.de
