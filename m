Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F9A29
	for <loongarch@lists.linux.dev>; Sun, 21 May 2023 10:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1684665977; bh=ROm0pJOZNyVDKEAis1Y6Eci8XLW7KJHTxO8fnKHcE5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mH+YJ27HMqhNsQjU+h8lFEiVcwuIQDEP7IoCIvHgdTVn5XPDbyx19NbUrmnYvOaFY
	 LOz2TDlA91owpQ0zButjzTnK2/BYfFDlFq7NDtdtvjCcCYE8oKF4fEKKN+1qRGpem8
	 GUqAhxAxB55f5Pt/rh+uzS/s8WEO7YeePbFRbjAU=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4A09A60115;
	Sun, 21 May 2023 18:46:17 +0800 (CST)
Message-ID: <4a08b133-4ead-083e-4ddb-519e12a0dad6@xen0n.name>
Date: Sun, 21 May 2023 18:46:16 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V1 3/4] irqchip/loongson-liointc: Fix IRQ trigger polarity
Content-Language: en-US
To: Jianmin Lv <lvjianmin@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>,
 loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
References: <20230520063818.27208-1-lvjianmin@loongson.cn>
 <20230520063818.27208-4-lvjianmin@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230520063818.27208-4-lvjianmin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/5/20 14:38, Jianmin Lv wrote:
> For IRQ controller INT_POLARITY regitser of Loongson-2K CPU

"For the INT_POLARITY register of Loongson-2K series IRQ controller"?

> series, '0' indicates high level or rising edge triggered IRQ,
> '1' indicates low level or falling edge triggered IRQ.

Remove the two "IRQ"s; the topic is "polarity", not "IRQs".

Also please mention the source of this information; I've checked the 
Loongson 2K1000LA User Manual v1.0 and it seems a similar description is 
found in Table 9-2, Section 9.3 (中断寄存器描述 / Description of the Interrupt 
Registers). It mentioned "Intpol_0" and "Intpol_1" but the description 
is consistent with the wording here.

> 
> For Loongson-3A CPU series, setting INT_POLARITY register is not
> supported and writting it has no effect.

Only 3A and not the whole Loongson-3 series?

Also typo: "writing".

> 
> So trigger polarity setting shouled be fixed for Loongson-2K CPU
> series.

The changes seem to be just inversion of the polarity flags. It should 
be correct given your description, and not affect Loongson-3 series 
because it's supposed to behave as noops; it may be better to move the 
explanation regarding Loongson-3 behavior to code comment (e.g. 
somewhere near the definition of LIOINTC_REG_INTC_POL) so it's 
immediately visible to drive-by readers not familiar with LoongArch 
internals, without them having to dig through commit history to see this.

> 
> Fixes: 17343d0b4039 ("irqchip/loongson-liointc: Support to set IRQ type for ACPI path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>

Again, who's the proper author for this patch? Given the tags it seems 
the author should be Chong Qiao, but I didn't see an Author: line at the 
beginning.

> ---
>   drivers/irqchip/irq-loongson-liointc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 8d00a9ad5b00..9a9c2bf048a3 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -116,19 +116,19 @@ static int liointc_set_type(struct irq_data *data, unsigned int type)
>   	switch (type) {
>   	case IRQ_TYPE_LEVEL_HIGH:
>   		liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, false);
> -		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
> +		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
>   		break;
>   	case IRQ_TYPE_LEVEL_LOW:
>   		liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, false);
> -		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
> +		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
>   		break;
>   	case IRQ_TYPE_EDGE_RISING:
>   		liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, true);
> -		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
> +		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
>   		break;
>   	case IRQ_TYPE_EDGE_FALLING:
>   		liointc_set_bit(gc, LIOINTC_REG_INTC_EDGE, mask, true);
> -		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, false);
> +		liointc_set_bit(gc, LIOINTC_REG_INTC_POL, mask, true);
>   		break;
>   	default:
>   		irq_gc_unlock_irqrestore(gc, flags);

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

