Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838844C60
	for <loongarch@lists.linux.dev>; Sun, 16 Apr 2023 19:51:21 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2B0E8E0008;
	Sun, 16 Apr 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681674674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDCHYtatRNGqqSMam8YDqpPpEGtjwBwQpRGk26Gg1NM=;
	b=KULaQ71ufRwVMmKh27NIndxXTkYIBFk1u48LFxSWEcOWF3p3U1sSCjZVJ9plH7iI49yj8B
	tbiI2kvvxlpEt7tL/JmvWbHvxUM43DL7X00zlBG+ke4ILtgiKTu0nloCxCJsfFWFYZ4bT9
	0iLXv2BXLwcCFbT1EKYuoa5Vyfv1je71Ax5pRVERQwtWIKudyPkJrlmlyKYRhLVNncmcKR
	3Yk4hg4mEXgUFKvp7a6rl1EvmYqAkT2GM/FMXApN34bhgInEJkDxUP4iF5DsN1Pss1SgIy
	c1cyXAcpvjC+0ZScHw/ZHOUJ91ZBbxZcgbw51IXkxEaFh7utJOD/Q/pST8TXcQ==
Date: Sun, 16 Apr 2023 21:51:08 +0200
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
	zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com
Subject: Re: [PATCH V3 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A
 RTC
Message-ID: <202304161951080f60b5e2@mail.local>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681370153.git.zhoubinbin@loongson.cn>

On 13/04/2023 15:57:32+0800, Binbin Zhou wrote:
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
> As LS1X does not support DT, we will merge LS2X and LS1X after keguang
> has completed DT support for LS1X.

Stop waiting and simply add it.

> 
> -------
> Changes since v2:
> - Rebase on the top of rtc-next.
> patch(1/7):
>  - The new patch.
> patch(2/7):
>  - Check patchset with "checkpatch.pl --strict";
>  - Drop static inline functions which are used only once, such as
>    ls2x_rtc_regs_to_time;
>  - Remove the suruct ls2x_rtc_regs and regmap_bulk_xxx() is used to read
>    and write rtc registers;
>  - Clear the RTC wakeup interrupt manually;
>  - Enable the RTC in set_time() and check in read_time();
>  - device_get_match_data() is used to get ls2x_pm_offset, for LS2k1000
>    has the different value;
>  - Remove some inexact CONFIG_ACPI;
>  - remove()->remove_new().
> 
> Changes since v1:
> 1. Rebased on top of latest loongarch-next;
> 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> testing;
> 3. Remove some inexact CONFIG_ACPI.
> 
> Thanks.
> 
> Binbin Zhou (7):
>   dt-bindings: rtc: Subdivision of LS2X RTC compatible
>   rtc: Add support for the Loongson-2K/LS7A RTC
>   LoongArch: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to LS7A
>   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
>   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> 
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   7 +-
>  arch/loongarch/configs/loongson3_defconfig    |   1 +
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
>  arch/mips/configs/loongson2k_defconfig        |   1 +
>  arch/mips/configs/loongson3_defconfig         |   1 +
>  drivers/rtc/Kconfig                           |  11 +
>  drivers/rtc/Makefile                          |   1 +
>  drivers/rtc/rtc-ls2x.c                        | 345 ++++++++++++++++++
>  9 files changed, 379 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
> 
> -- 
> 2.39.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
