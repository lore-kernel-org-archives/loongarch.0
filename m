Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870790;
	b=DwfxLxgqMvJtStcMcwo+cNyyroRRhywz89OY7COZSpE1yNb9gkbor66yYS6aGWHpuPlR
	 ez8hCWOL/ot9POZPcgbEd2rBoFhxsCrNzv3LSbvTaFsUXHnTrEc1vkuYG8z3jRrxIbna5
	 O0kSB7QApkCOkKs2yAc2Xz1q+iI1iKeicbJ04rRoPp+S+bEi7ZD7lwIO5wcVXtaHmEFzw
	 k5NXOn6gyitMWqsV2Hj25JZNGjKiBeHkcaMXlcFSqaWY/pctP/jav8Hm/zIkV28Py/0Qa
	 UHW5cv3DraO1l0yu1kwDDmNOPD3g95Q3MME+BH4riTa1uzvJl5VTmGR//45tmzZJ3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870790;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
	b=iyEIPTNq5x8DMqk2TA0JbTGzcDqS53GfI5XYf2qe0z+hMCQtonlyi2bWQBFFwFCLyum6
	 3onoC6MMeu1q9RcXWIjUUOnWgBkpsbKoYuu1zn0Zh//y9W+zrhk+X9qeLiFAwlXqdVBJf
	 KGgLl+IpnE2ZeGmBitcramkYlG4DTzDC9ggKJDWsdr6zSCzpGtraZMsF+lhiDFZc4TpJl
	 UfbctgqrphgOCzl63u47Wew2aPUIxdrAutU0Xwub+mX6GIY8eTzZP3pUvhhVdjFHt4Vdq
	 S5NicPMkQ9UgO52owGNKb2YrRmy9SdRePX8GRZgEv7kOCD+5MsWBqIcoqXB95Pgb81A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UUTBWDCf;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B112606A337
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 23:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B112606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UUTBWDCf
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3136238a12.3
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 15:13:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870789; x=1795475589;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=YjcTk6nuOZT9PgrVHxR+hoAZnbs46nU9N8R3ETN0RbFBfPCLC86nLrWBQPnj90jm7k
         fIiwpKCCtpHc5gzn1lTprhiQ67nvUccKEw9NrYZ2BZ8GmqQLwx5M4gIsTsp9j8tRmqa5
         INNxMNr4pzOISg/o24HB2i3BjsUwe2K0Ei+0qDZELSepJacNY0636BEkxV7lFzkogc+h
         gqAyEwHNbkKJiRKNlWa97I0or/aeS8uYi9woQ2yPvGHrJ0/k/kqFNxEF8v4zq//S76bL
         Jmla3utzMo5KK21sTJ98WaMVRN92NZrfKeiJ88dyAe1YpLQgdewZQ4UtGSD9c3yqM3Fv
         8mxQ==
X-Forwarded-Encrypted: i=1; AL+hErF46GDswTcbb7eHR7TWQr5lQobtXiighXHI0nuzWK9mRgC3ufTCrLHFm79/rHrVoaXOgHxW+UEqfN8=@lists.linux.dev
X-Gm-Message-State: APuU4Z917rgXohxsAV27l2e91zZyrWxf64ma3hP7TZ/2CxAWyrwsvCNC
	xZ8hVl82bl5CotJiS9LCtF2rddbTXG3XUaXnfbfYm0qLv9ydh/8fcL5WJSrQKSCPkpS16zwODBw
	EsMlicv73wGqVdZihecRRuTne/RdbyeNZ1g3hLc4FQs5l7ZTQi56TAS+FTrBLpmvrHeoBVjGGrc
	P6flGTaY2udfUvAdL/QNjJzBtKWPNYrf0q/sZ7kkMd0yNQ4XwBF2WGXo8in5TN4B0WJ1hQorwkz
	z7aw5xrVnEr6t5idzHC
X-Gm-Gg: AZFdTZf2Eo6tlbr7IKJuW2i2Y9dQMgqQWcXnc+QHG57tpFGX9oNIyp/V9wHNuE+a26d
	u6qvVaxgltGG1Q3IBjrTX49CfuGOKcw0GW5LRARj+YCpG9eIuLiIl0tgk7gcI7z7ZqiHZ9cOsNx
	WT/oQnS4mMDarqXi3RSZJ5fU2IFyWK3kzlSJvyrpsQgrld0CdWdJiFNNA8ir5KuHCBV1abbPcBT
	L4vBy6GZ0yPqjwVrqFsxxvxXaoh/Mc0zKiahNYbU4J7VSb0et6Uu9iZCgy/JUavxxXXPts1p3dZ
	BIGRDkO3awqTITg+JqZ2VKvSH0yf4capR2XxEXkhWcPDV8aGKZ55uBmp1aHPBZz3Ot9ukm5VHkp
	nZ34x7fgwIODk7r8Pdqf5JdRyGVNwuZwarFEmyXpYgJE6ZSYAZTilvGFYsTDZ9YZhq+Q3aOL/H8
	kiycEaLKxPMT9J/NvwD7J+19NI44VQ0kPXx7ziaP20
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3b1b08798bcmr11962149a91.6.1794870789348;
        Mon, 16 Nov 2026 15:13:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm514046a91.7.2026.11.16.15.13.07
        for <loongarch@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b937ecbb4so29615036d6.2
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 15:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870787; x=1795475587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39KnhmpTvzW3NJqrAH4c7S3DWPwV9FJJvA+CtiAQvpY=;
        b=UUTBWDCfGz2Mk4qrtZP4SnIoUeL9Y0gXWShByIZ71JdMZl3OkPkHeZhcG6vWtEMbYH
         mbfwA9MYaJkyVi/NHMAcWikn1nOrd+OBdJiF2cLtyXxb67sgk/VXprOf7b9GSAHYRali
         fnknd6Eyx1FxqTiGGy5etOzerakClaJkmhfVw=
X-Forwarded-Encrypted: i=1; AL+hErGtA/pL5V0/1xn5+598eStysCeCkP0erM20vEPLPDncEK7bkjGZFyWJbqQZfjsqox/L6eUNF8Ukq9I=@lists.linux.dev
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2038166d6.27.1794870786556;
        Mon, 16 Nov 2026 15:13:06 -0800 (PST)
X-Received: by 2002:a05:6214:2623:b0:921:201:e835 with SMTP id 6a1803df08f44-9210201ebefmr2037266d6.27.1794870785971;
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm96715216d6.28.2026.11.16.15.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:13:05 -0800 (PST)
Message-ID: <2ad1cc65-0381-478c-959e-9bee1a597110@broadcom.com>
Date: Mon, 16 Nov 2026 15:12:57 -0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
To: Peng Fan <peng.fan@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 Tan Siewert <tan.siewert@9elements.com>, Eddie James
 <eajames@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Caleb James DeLisle <cjd@cjdns.fr>,
 Marc Zyngier <maz@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Qin Jian <qinjian@cqplus1.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Anirudha Sarangi <anirudha.sarangi@amd.com>,
 Tushar Nimkar <tushar.nimkar@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/14/26 07:06, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers
> under drivers/irqchip/ so that chained_irq_exit() is always invoked when
> the handler returns. Handlers that duplicated the exit call on an error
> path or jumped to a common exit label simply return now and rely on the
> guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> With [1] now merged in irq/drivers, convert the chained IRQ handlers in
> drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
> chained_irq_exit() calls and the gotos that only existed to reach them,
> reducing boilerplate.
> 
> I use a script to do the job, and after that, do mannual checking.
> 
> No functional changes.
> 
> [1] https://lore.kernel.org/all/179417458323.2093942.14330197609841896598.tip-bot2@tip-bot2/#t
> ---

>   drivers/irqchip/irq-bcm2836.c              | 4 +---
>   drivers/irqchip/irq-bcm6345-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7038-l1.c           | 4 +---
>   drivers/irqchip/irq-bcm7120-l2.c           | 4 +---
>   drivers/irqchip/irq-brcmstb-l2.c           | 4 +---

For those drivers above:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
