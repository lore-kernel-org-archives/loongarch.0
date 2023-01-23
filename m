Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBA98829
	for <loongarch@lists.linux.dev>; Mon, 23 Jan 2023 23:24:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 6B86DC452E
	for <loongarch@lists.linux.dev>; Mon, 23 Jan 2023 23:15:56 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 84D4420002;
	Mon, 23 Jan 2023 23:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674515748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aldhPACUtQ3o63pittRgbmKlsA5qruA1kOc/8QR1Hkc=;
	b=c9ekMjPducohyCm0yQJUUZ+gTV85oV8Ans4jJ6PKCDzXh8pyVPWcNEYDuqgtgVSmWJeTus
	b8sIp5VFjkyLGQ1Wgk5ibWRFTTUjr5qEDj0kudrhBqhzS/HliL+HiXmfK/K4nukG+cxDjz
	dXWnDkSfwvcjhzsIsWBEgtzbtColgJxNZrq37cXHPZbQiLL9w0lqUVlIgX3RnjAdlPLZYt
	wlsKU4d1NzDqc2Skop84h6N5eOrz9qTa4MJxEDuEsyUueFsdtI60TUPbIBhZDVkVafiDo1
	rcOkWm7Q8lbImQpHyDpJnxKx2ZJey5+QczwHzcb+XcoDcroYtxp2gB+DPa2hFQ==
Date: Tue, 24 Jan 2023 00:15:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	zhaoxiao <zhaoxiao@uniontech.com>
Subject: Re: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A
 RTC
Message-ID: <Y88VIXerF5Wk/9kj@mail.local>
References: <cover.1673227292.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673227292.git.zhoubinbin@loongson.cn>

On 09/01/2023 09:35:10+0800, Binbin Zhou wrote:
> Hi all:
> 
> The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> released five versions of patchset before, and all related mail records
> are shown below if you are interested:
> 
> https://lore.kernel.org/all/?q=ls2x-rtc
> 
> In this series of patches, based on the code above, I have added the
> following support:
> 
> 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
>    by default under LoongArch architecture;
> 2. Add rtc alarm/walarm related functions.
> 
> I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> and Loongson-2K0500.
> 
> BTW:
> There have been discussions about merging the rtc drivers of ls1x and
> ls2x, but the following reasons made the merger difficult to achieve:
> 
> 1. ls1x does not support ACPI, for it is only on MIPS-based system;

This is not a good justification, you have to support both in your
driver anyway, as shown by your CONFIG_ACPI ifdefery.

> 2. ls1x does not support alarm function.

It is just a matter of clearing a single bit, this is not difficult at
all.

> 
> Thanks.
> 
> -------
> Changes since v1:
> 1. Rebased on top of latest loongarch-next;
> 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> testing;
> 3. Remove some inexact CONFIG_ACPI.
> 
> Binbin Zhou (4):
>   rtc: Add support for the Loongson-2K/LS7A RTC
>   LoongArch: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to LS7A
>   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
> 
> WANG Xuerui (3):
>   dt-bindings: rtc: Add Loongson LS2X RTC support
>   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> 
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
>  arch/loongarch/configs/loongson3_defconfig    |   1 +
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
>  arch/mips/configs/loongson2k_defconfig        |   1 +
>  arch/mips/configs/loongson3_defconfig         |   1 +
>  drivers/rtc/Kconfig                           |  11 +
>  drivers/rtc/Makefile                          |   1 +
>  drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
>  9 files changed, 410 insertions(+)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
> 
> -- 
> 2.31.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
