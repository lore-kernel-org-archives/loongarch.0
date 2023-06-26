Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0685820E2
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 07:34:51 +0000 (UTC)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qDgkA-0002xP-00; Mon, 26 Jun 2023 09:34:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AE59BC0301; Mon, 26 Jun 2023 09:19:37 +0200 (CEST)
Date: Mon, 26 Jun 2023 09:19:37 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
	zhao zhang <zhzhl555@gmail.com>, Yang Ling <gnaygnil@gmail.com>,
	WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH V5 5/5] MIPS: Loongson64: DTS: Add RTC support to
 Loongson-2K1000
Message-ID: <20230626071937.GB4397@alpha.franken.de>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
 <36ceb490f00f7a387de41330465a4daa21484be0.1685693501.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ceb490f00f7a387de41330465a4daa21484be0.1685693501.git.zhoubinbin@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jun 02, 2023 at 05:50:50PM +0800, Binbin Zhou wrote:
> The module is now supported, enable it.
> 
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 8143a61111e3..f878f47e4501 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -97,6 +97,13 @@ liointc1: interrupt-controller@1fe11440 {
>  						<0x00000000>; /* int3 */
>  		};
>  
> +		rtc0: rtc@1fe07800 {
> +			compatible = "loongson,ls2k1000-rtc";
> +			reg = <0 0x1fe07800 0 0x78>;
> +			interrupt-parent = <&liointc0>;
> +			interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +
>  		uart0: serial@1fe00000 {
>  			compatible = "ns16550a";
>  			reg = <0 0x1fe00000 0 0x8>;
> -- 
> 2.39.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
