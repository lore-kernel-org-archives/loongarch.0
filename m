Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303E15AC3
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 09:58:36 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-982b1a18daeso74632866b.2
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909514; x=1689501514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dInND012OMCtnndaCiOgwcAwK1OMOIJfuoRYdslhCiE=;
        b=LIuXYLJ3c2riDeudlJ/PMJWeuS+ZxHBs/NxWD+s/8EGQCO0yVfWABL7bBla6l7WA5k
         tltl8CqVylKCsnLfmHS3L1zjolRUXGbcHI+mHtWNyWPWqMa4WUTXh5/A6aZBLECAXtrt
         RHWgkqKVUeGOm6+Fo1GigRBxVZBSWwhkCjdGD0Tb2ALg/vV4J2DSDkf2FIhoY7r1nbM9
         AiNl+94pf05wCf6y4BxmmieQv5mCuI1g941Vc0lMC8JdORJmM/ZVgqRnaPwbJW2+XPUP
         65Tit+lSyeL4NfEolhgNTkWVc3PDfy36VIyROR1O23FGr3Wvd4pfngCaWFFTySOji23x
         MpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909514; x=1689501514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dInND012OMCtnndaCiOgwcAwK1OMOIJfuoRYdslhCiE=;
        b=bapTrMgyEWloSrmlBSFh/QfNxru2YDuLkOrj1uPG3gl1krP8blXwCKud+BFd93bhgb
         i758VIePYMa6rZh6AvrUyiZQ0MpowMgHK3AIvrThIaVTRx+/iOcre+MqhiGVHN3t12dE
         ZSzDAaKAiix+qQDd+ng0gGA2zNcnstH6goeU7pEtR421Ge90/DeFZ/PbgaWQEYUFtTLk
         IPtj1nlPs2FSV65wLyzE3xwRKgU/5K17f0yoS71MNc04W4DeFVW30BTW3eQYqw81coVK
         tpxdOrsnjwYDwUnxEi3oWuSGQTm7VKQA+cXKAOqqN27fH7Up5vzG4D4xtCd0N5jgTKqV
         e0tQ==
X-Gm-Message-State: AC+VfDx9E9qlMiV42Xvzb7vTerEJDw+kzm/AC0K0JAGRmKikbuJ0V+ek
	PKemedA6WijB2+LpSsiqedkR/w==
X-Google-Smtp-Source: ACHHUZ6GpT8GPAjWm17B7AOWOWjpoRTGDKhcg88Dj9SSh5Hp/3XzFFP5p4jBqGswKscUuZSeBQJ7/A==
X-Received: by 2002:a17:906:f898:b0:984:8225:27c2 with SMTP id lg24-20020a170906f89800b00984822527c2mr1054172ejb.32.1686909514487;
        Fri, 16 Jun 2023 02:58:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm10497980ejb.180.2023.06.16.02.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:58:34 -0700 (PDT)
Message-ID: <3543cbf9-d259-8d0f-e78e-d8d5e3f501de@linaro.org>
Date: Fri, 16 Jun 2023 11:58:32 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/6] LoongArch: DeviceTree for Loongson-2K0500
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c7087046a725e7a2cfde788185112c150e216f1b.1686882123.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c7087046a725e7a2cfde788185112c150e216f1b.1686882123.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 08:10, Binbin Zhou wrote:
> Add DeviceTree file for Loongson-2K0500 processor, which integrates one
> 64-bit dual emission superscalar LA264 processor core.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Keep subject prefixes with existing style, so: "loongarch: dts:"

> ---
>  arch/loongarch/boot/dts/Makefile            |   2 +
>  arch/loongarch/boot/dts/loongson_2k0500.dts | 311 ++++++++++++++++++++
>  2 files changed, 313 insertions(+)
>  create mode 100644 arch/loongarch/boot/dts/loongson_2k0500.dts
> 
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
> index 1e24cdb5180a..0e5ed373b1b4 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +dtb-$(CONFIG_MACH_LOONGSON64)	= loongson_2k0500.dtb
> +
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
> diff --git a/arch/loongarch/boot/dts/loongson_2k0500.dts b/arch/loongarch/boot/dts/loongson_2k0500.dts
> new file mode 100644
> index 000000000000..4f58f7b06445
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson_2k0500.dts
> @@ -0,0 +1,311 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "LS2K0500 Reference Board";
> +	compatible = "loongson,ls2k0500";

Incorrect compatible. This is board, not SoC.

> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		serial0 = &cpu_uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";

Drop bootargs. Not relevant to mainline.

> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		model = "Loongson-2K0500";

Does not match your bindings.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +
> +		cpu0: cpu@0 {
> +			compatible = "loongson,la264";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			clock-frequency = <500000000>;	/* 500MHz */
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
> +		      <0x00000000 0x90000000 0x00000000 0x60000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x00000000 0x02000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	ref_100m: clock-ref-100m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "ref_100m";
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "loongson,cpu-interrupt-controller";

compatible is always the first property.

> +	};
> +

Missing soc node.

> +	liointc0: interrupt-controller@1fe11400 {
> +		compatible = "loongson,liointc-2.0";
> +		reg = <0 0x1fe11400 0 0x40>,
> +		      <0 0x1fe11040 0 0x8>;
> +		reg-names = "main", "isr0";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <2>;
> +		interrupt-names = "int0";
> +		loongson,parent_int_map = <0xffffffff>, /* int0 */
> +					  <0x00000000>, /* int1 */
> +					  <0x00000000>, /* int2 */
> +					  <0x00000000>; /* int3 */
> +	};
> +
> +	liointc1: interrupt-controller@1fe11440 {
> +		compatible = "loongson,liointc-2.0";
> +		reg = <0 0x1fe11440 0 0x40>,
> +		      <0 0x1fe11048 0 0x8>;
> +		reg-names = "main", "isr0";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <4>;
> +		interrupt-names = "int2";
> +
> +		loongson,parent_int_map = <0x00000000>, /* int0 */
> +					  <0x00000000>, /* int1 */
> +					  <0xffffffff>, /* int2 */
> +					  <0x00000000>; /* int3 */
> +	};
> +
> +	eiointc: interrupt-controller@1fe11600 {
> +		compatible = "loongson,ls2k0500-eiointc";
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <3>;
> +	};
> +
> +	soc {

Oh, here it is. All MMIO nodes are part of SoC node, not top-level. You
did not check for warnings, right?

Be sure you do not introduce any new W=1 warnings (make dtbs).

Anyway, this is SoC, right? So it should be in DTSI. Don't mix boards
(DTS) and SoCs (DTSI).

> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		ranges = <0 0x10000000 0 0x10000000 0 0x10000000>,
> +			 <0 0x2000000  0 0x2000000  0 0x2000000>,
> +			 <0 0x20000000 0 0x20000000 0 0x10000000>,
> +			 <0 0x40000000 0 0x40000000 0 0x40000000>,
> +			 <0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
> +
> +		reboot {

And this is not part of SoC. You don't have here reg.

> +			compatible = "syscon-reboot";
> +			regmap = <&pmc>;
> +			offset = <0x30>;
> +			mask = <0x1>;

How does it even work? offset of what? Did you even test it?

> +		};
> +
> +		poweroff {
> +			compatible = "syscon-poweroff";
> +			regmap = <&pmc>;
> +			offset = <0x14>;
> +			mask = <0x3c00>;
> +			value = <0x3c00>;
> +		};
> +
> +		gmac0: ethernet@1f020000 {
> +			compatible = "snps,dwmac-3.70a";
> +			reg = <0 0x1f020000 0 0x10000>;
> +			interrupt-parent = <&liointc0>;
> +			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			mac-address = [ 64 48 48 48 48 60 ];/* [>mac 64:48:48:48:48:60 <]*/

Yep, because all boards in the world will come with exactly this one MAC
address. Drop.

> +			phy-mode = "rgmii";
> +			bus_id = <0x0>;
> +		};
> +
> +		gmac1: ethernet@1f030000 {
> +			compatible = "snps,dwmac-3.70a";
> +			reg = <0 0x1f030000 0 0x10000>;
> +			interrupt-parent = <&liointc0>;
> +			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			mac-address = [ 64 48 48 48 48 61 ];/* [>mac 64:48:48:48:48:61 <]*/

Drop.

> +			phy-mode = "rgmii";
> +			bus_id = <0x1>;
> +		};
> +
> +		sata@1f040000 {
> +			compatible = "snps,spear-ahci";
> +			reg = <0 0x1f040000 0 0x10000>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <75>;
> +		};
> +
> +		ehci@1f050000 {
> +			compatible = "generic-ehci";
> +			reg = <0 0x1f050000 0 0x8000>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <71>;
> +		};
> +
> +		ohci@1f058000 {
> +			compatible = "generic-ohci";
> +			reg = <0 0x1f058000 0 0x8000>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <72>;
> +		};
> +
> +		clk: clock-controller@1fe10400 {
> +			compatible = "loongson,ls2k-clk";
> +			reg = <0 0x1fe00400 0 0x30>;
> +			#clock-cells = <1>;
> +			clocks = <&ref_100m>;
> +			clock-names = "ref_100m";
> +			status = "disabled";
> +		};
> +
> +		cpu_uart0: serial@1ff40800 {
> +			compatible = "ns16550a";
> +			reg = <0 0x1ff40800 0 0x10>;
> +			clock-frequency = <100000000>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <2>;
> +			no-loopback-test;
> +		};
> +
> +		i2c@1ff48000 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff48000 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <14>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			eeprom@57 {
> +				compatible = "atmel,24c16";

Are you sure eeprom is part of SoC? Again, aren't you mixing them?

> +				reg = <0x57>;
> +				pagesize = <16>;
> +			};
> +		};
> +
> +		i2c@1ff48800 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff48800 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <15>;
> +			status = "disabled";
> +		};
> +
> +		i2c@1ff49000 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff49000 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <16>;
> +			status = "disabled";
> +		};
> +
> +		i2c@1ff49800 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff49800 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <17>;
> +			status = "disabled";
> +		};
> +
> +		pixi2c@1ff4a000 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff4a000 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <18>;
> +			status = "disabled";
> +		};
> +
> +		pixi2c@1ff4a800 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff4a800 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <19>;
> +			status = "disabled";
> +		};
> +
> +		pmc: acpi@1ff6c000 {
> +			compatible = "syscon";
> +			reg = <0x0 0x1ff6c000 0x0 0x58>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <56>;
> +			suspend-address = <0x1c000500>;
> +		};
> +
> +		pcie@16800000 {
> +			compatible = "loongson,ls2k-pci";
> +			device_type = "pci";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			reg = <0 0x1a000000 0 0x02000000>,
> +			      <0xfe 0x00000000 0 0x20000000>;
> +
> +			ranges = <0x02000000 0 0x40000000 0 0x40000000 0 0x40000000>,
> +				 <0x01000000 0 0x00004000 0 0x16404000 0x0 0x4000>;
> +
> +			pci_bridge@0,0 {

No underscores in node names.

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +				compatible = "pci0014,1a05.1",
> +					     "pci0014,1a05",
> +					     "pciclass,060400",
> +					     "pciclass,0604";
> +
> +				reg = <0x0000 0x0 0x0 0x0 0x0>;
> +				interrupts = <81>;
> +				interrupt-parent = <&eiointc>;
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &eiointc 81>;
> +			};
> +
> +			pci_bridge@1,0 {

Ditto

> +				compatible = "pci0014,1a05.1",
> +					     "pci0014,1a05",
> +					     "pciclass,060400",
> +					     "pciclass,0604";
> +
> +				reg = <0x0800 0x0 0x0 0x0 0x0>;
> +				interrupts = <82>;
> +				interrupt-parent = <&eiointc>;
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &eiointc 82>;
> +			};
> +		};
> +	};
> +};

Best regards,
Krzysztof

