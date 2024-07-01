Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE416D9A2;
	Mon,  1 Jul 2024 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850452; cv=none; b=onFWayZ1iTpHN554N6tkcidHE1g7hy8BZH7D4YC7crZMItapzzBqPm49HFA4fVngrKls2Wfh/iNynXQQb5PHNKLD1p4JzzVhGpnwMukcVneWFszQyQvNKRt7PFnZ/tSk/F1CqWHoXVU99lzVsL8i/ptCqK7curLfcId0fB+Sv2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850452; c=relaxed/simple;
	bh=+AQ7sBFYdyhgp+x+WWlZYAcTpu3FvubStwSJ9uOtJNI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Y8eNWLZVsnjKYejV9vcSQLzA0Md+wTaZC8KTgMGi1d+46unJahBosacyZovikb8885aC69J00HGgRxYWFuHnP+jGnChJo5/PfSHY3RR7dWd0GcSnKXpL0bfbvyBZn4Af6mUTb18/3qQ/IdALtkrf74tf7pzWnFn8u+kMeXmMnls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzzjMM58; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzzjMM58"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso31472911fa.2;
        Mon, 01 Jul 2024 09:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850449; x=1720455249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=gzzjMM58ho7iek6GBUcUXpzhmit7naBu6877AqLq942gE5d777v38JsXyBOSe/6tYR
         /nEtN70y7xxuTF8/ywuilfvJtJeQy4BoDU8mvYYe4CkI8WFOHS0dqE8NAdrwL6HpMIf/
         k44IcTQ2dbojR9gfR6Hx1Bx633/pFzHUGPyNIzZyFQKnCBCdmes+cVh8M0hTKAaPMIso
         q2yIwMfXUPuwWGHCrvNBZjGs67lPxFjbiW6/h+kR5WzMwOEb9gGaQSPuac826f/GwO+f
         mQQ8lqgQ40slfM/EFtFzmnRqwie7ldqTotGz5Blcz64EyWjTyjjHb6nDFVj4Hysj/PjM
         9MSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850449; x=1720455249;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9eJvY3noQUZfbyZhFkyxOik2OAqPtae0XwqIwzXsH8=;
        b=kEFIEEZKxzrtOSafwPETZ4Yti9PIy0W6kVa0N9YuC1Te7d0Oi+amrsoPmOrcD6s8wa
         J6O0yx7daEFkFImeRLpZH61tD2JyX0zMvflHPF2DOexyWEr/vIQ6hsGwA2XRv/QJ8fUl
         C1flAr9bVDwJYnxxpv8duRRyN4SwCiyoXx+ZD0ap6XSWGdiDkwmrhqQMyPiYGWkkdNG6
         5pBaahpfX8esEMPabBnr6thcilVN1qZAkR26ltIG3zHvjHHdwqLy3Xcwt6nq45SnQctN
         OLgJPJAon7pzczw1VQZQvccj+evWcLn5UB8ygAMLw1uzki2ThXutJPhWQ3HXmvdAmGjS
         ZTdg==
X-Forwarded-Encrypted: i=1; AJvYcCVK07gbC0LT9ALo/DjmFlm9/vkw23oKE+aCJubAVk9xHlAVy7fkOJiGKGdys0bIg+TxLsJ0xUpsX+aqmJfsZ5cSn5R5eCdBHT5bgqFOZotAj+UyBFrFi32yaOypsPet
X-Gm-Message-State: AOJu0Ywdk7no3YG+GHqSG6BoYtJsD6SiqpLiTHMkp+sgDvOV3WS5lT9O
	egQ0Jbx8x26HsJrcMPJ/hXhVdfyD4yVrCCsio0pzIdMt4q52MxzQCWTBpkI/
X-Google-Smtp-Source: AGHT+IHHz/OamA1Ukx5sIFBlK+L0AmnL9jrrDHysPJKMb3Xyg4pOUjtzhB1j4PXHUjwphZM6xFX6sw==
X-Received: by 2002:a2e:8558:0:b0:2ec:5382:2703 with SMTP id 38308e7fff4ca-2ee5e6f6972mr34830361fa.53.1719850448585;
        Mon, 01 Jul 2024 09:14:08 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.75.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee516803aesm14192571fa.79.2024.07.01.09.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:07 -0700 (PDT)
Subject: Re: [PATCH 2/9] mtd: add mtd_is_master helper
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b97bf565-bef5-fbc7-63c5-f174880ad9ab@gmail.com>
Date: Mon, 1 Jul 2024 19:14:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-2-3fd5f4a193cc@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/1/24 4:53 PM, Marco Felsch wrote:

> Provide a simple helper to make it easy to detect an master mtd device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  include/linux/mtd/mtd.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 8d10d9d2e830..bf3fc2ea7230 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -408,6 +408,11 @@ static inline struct mtd_info *mtd_get_master(struct mtd_info *mtd)
>  	return mtd;
>  }
>  
> +static inline bool mtd_is_master(struct mtd_info *mtd)
> +{
> +	return mtd->parent ? false : true;

   Perhaps:

	return !mtd->parent;

[...]

MBR, Sergey
