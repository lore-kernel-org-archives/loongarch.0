Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C026134CE
	for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 14:48:10 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99d937b83efso386995266b.3
        for <loongarch@lists.linux.dev>; Tue, 15 Aug 2023 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692110888; x=1692715688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ohltK2QMwwl5xYezQjmUCq0e1EMSffNzvodrNlgmy8=;
        b=BSUjYFKSaW2/pqsOzgZCUBvqwJWn2brzcJGxnzXFVCBHWpEguzZAKVW0MIHBeYVN2g
         zuElhQm54DAV6if8McEQ8sE/RC4uuP2DFzEe5P6dAh+s1u7pmP032hlQi+ilYZRc2vrs
         W3zmK/C6/0+6dI1uIhsSGpbTfnR6RYYsP6z0uUiqVq7KN0dhCZZ4r4MQ98QO+v95j0HW
         E5iaoVODqyPmgvmsgo38MEsHEX7mPWHHIRpy6Gn9zXaLzCGfZfSg6w76OejWXvStKLVb
         aWiPBABt+5OGyC4K0hlLtTqQ3Qg2KV+fXdI9Z1iK7QK7sKHeoMPs/ZBv0FyAp5IFNpvA
         aqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692110888; x=1692715688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ohltK2QMwwl5xYezQjmUCq0e1EMSffNzvodrNlgmy8=;
        b=HjjCeo5IkrJR74W/IaS9ztytfxJAWT5HvntAMugMK0XM1kNvekmURG7OUP/buBcoK1
         Z/qj5hrDJfJcxv4HqhmsConxhuPvSyxuMw/SJT4V4kJ8xn8MuGuidCJCk4ikbqMzMdwl
         MuVujJkY/v7Li8JS0Fn4ln82ORXH83nkKvFyAPwOXrtmyL8xZFK5DL+NWky7/FCCZb4U
         0eCRJe0V+Wj8wjvTU6uKZK0r+Op/WU8hqiVZPUbVmnkBaRBL6LhuFy6M12XZ1Sh4WRx/
         ole01YTUe+k78YUnaZccUSb2A9sT3BkEaJMc4unx1Q6/yQSV3QzVgLzPEfi94ngbSdNV
         vjmQ==
X-Gm-Message-State: AOJu0YzUCCEEbc8uJxVZ+oBeqNzqsqGUxjziJPdYs53mLBlBIHPIwy/K
	idsGSPMSUQ7fMUZYD4UneSkAVw==
X-Google-Smtp-Source: AGHT+IFxyZRO3X1vRtdpSez3GMNwKwb1K5xHj0gOLZMI/LVDmdziZdRyEgdWsv45uElaK/+a1A0K6A==
X-Received: by 2002:a17:907:9715:b0:99b:db4f:68b8 with SMTP id jg21-20020a170907971500b0099bdb4f68b8mr12556209ejc.76.1692110888350;
        Tue, 15 Aug 2023 07:48:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709067fc500b0099bc80d5575sm7067002ejs.200.2023.08.15.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:48:07 -0700 (PDT)
Message-ID: <1fdde0f1-998c-a141-6e43-9c13c0b681a8@linaro.org>
Date: Tue, 15 Aug 2023 16:48:06 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
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
References: <cover.1692088166.git.zhoubinbin@loongson.cn>
 <f869b30d119a56abaa67ac78cd981fc0c2f0d28b.1692088166.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f869b30d119a56abaa67ac78cd981fc0c2f0d28b.1692088166.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2023 10:51, Binbin Zhou wrote:
> Add DeviceTree file for Loongson-2K0500 processor, which integrates one
> 64-bit dual emission superscalar LA264 processor core.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  arch/loongarch/boot/dts/Makefile              |   2 +
>  .../boot/dts/loongson-2k0500-ref.dts          | 115 +++++++++
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 244 ++++++++++++++++++
>  3 files changed, 361 insertions(+)
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500-ref.dts
>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500.dtsi
> 
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
> index 1e24cdb5180a..aa0b21d73d4e 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> +dtb-$(CONFIG_MACH_LOONGSON64)	= loongson-2k0500-ref.dtb
> +
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> new file mode 100644
> index 000000000000..c89662e5a296
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + */
> +
> +/dts-v1/;
> +
> +#include "loongson-2k0500.dtsi"
> +
> +/ {
> +	compatible = "loongson,ls2k0500-ref", "loongson,ls2k0500";
> +	model = "Loongson-2K0500 Reference Board";
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";

No earlycon in mainline. It's just development, not for products.

> +	};
> +
> +	cpu_clk: cpu-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <500000000>;

Conor already commented on this...

> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible = "loongson,la264";
> +			device_type = "cpu";
> +			reg = <0x0>;
> +			clocks = <&cpu_clk>;
> +		};
> +	};
> +
> +	memory@200000 {
> +		device_type = "memory";
> +		reg = <0x0 0x200000 0x0 0xee00000>, /* 238 MB at 2 MB */
> +		      <0x0 0x90000000 0x0 0x60000000>;
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
> +			size = <0x0 0x2000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	bus_id = <0x0>;
> +};
> +
> +&gmac1 {
> +	status = "okay";
> +
> +	phy-mode = "rgmii";
> +	bus_id = <0x1>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	eeprom@57{
> +		compatible = "atmel,24c16";
> +		reg = <0x57>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&sata {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&rtc0 {
> +	status = "okay";
> +};
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> new file mode 100644
> index 000000000000..e6f6476ab558
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Loongson Technology Corporation Limited
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	ref_100m: clock-ref-100m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "ref_100m";
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		compatible = "loongson,cpu-interrupt-controller";
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +	};
> +
> +	bus@10000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		ranges = <0x0 0x10000000 0x0 0x10000000 0x0 0x10000000>,
> +			 <0x0 0x2000000  0x0 0x2000000  0x0 0x2000000>,
> +			 <0x0 0x20000000 0x0 0x20000000 0x0 0x10000000>,
> +			 <0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>,
> +			 <0xfe 0x0 0xfe 0x0 0x0 0x40000000>;
> +
> +		isa@16400000 {
> +			compatible = "isa";
> +			#size-cells = <1>;
> +			#address-cells = <2>;
> +			ranges = <1 0x0 0x0 0x16400000 0x4000>;
> +		};
> +
> +		liointc0: interrupt-controller@1fe11400 {
> +			compatible = "loongson,liointc-2.0";
> +			reg = <0x0 0x1fe11400 0x0 0x40>,
> +			      <0x0 0x1fe11040 0x0 0x8>;
> +			reg-names = "main", "isr0";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>;
> +			interrupt-names = "int0";
> +
> +			loongson,parent_int_map = <0xffffffff>, /* int0 */
> +						  <0x00000000>, /* int1 */
> +						  <0x00000000>, /* int2 */
> +						  <0x00000000>; /* int3 */
> +		};
> +
> +		liointc1: interrupt-controller@1fe11440 {
> +			compatible = "loongson,liointc-2.0";
> +			reg = <0x0 0x1fe11440 0x0 0x40>,
> +			      <0x0 0x1fe11048 0x0 0x8>;
> +			reg-names = "main", "isr0";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <4>;
> +			interrupt-names = "int2";
> +
> +			loongson,parent_int_map = <0x00000000>, /* int0 */
> +						  <0x00000000>, /* int1 */
> +						  <0xffffffff>, /* int2 */
> +						  <0x00000000>; /* int3 */
> +		};
> +
> +		eiointc: interrupt-controller@1fe11600 {
> +			compatible = "loongson,ls2k0500-eiointc";
> +			reg = <0x0 0x1fe11600 0x0 0xea00>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <3>;
> +		};
> +
> +		gmac0: ethernet@1f020000 {
> +			compatible = "snps,dwmac-3.70a";
> +			reg = <0x0 0x1f020000 0x0 0x10000>;
> +			interrupt-parent = <&liointc0>;
> +			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			status = "disable";

That's not a valid status. Run some basic checks on your DTS before
submitting it (dtbs_check W=1)


Best regards,
Krzysztof

