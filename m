Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571C78F46;
	Sat, 28 Dec 2024 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735383769; cv=none; b=Bysvgtwpn9d6Xcu/y6QgB0Zs3BlvEdldLecmxCLoqh4NM0QqiIRjCuP4XbktnIWfLpflK4x0VtBNLjrb59jJc/dH97PoZkGeOdYTAHycSoHeHtEVGmQw3Ki3jptj5bLX/bEMeqcyjSIJQLIbf1VffejWzXY3JCUd+ZOZf8MzM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735383769; c=relaxed/simple;
	bh=fbKroEQRip7xzhzwPmBv0l9MdXKz80Eq6dSvtLfPp2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1r5McV27Xnarq76IrT4MhrNn9VcfA8k5rZzdQzIgXLsCNaqBw6CZ+B3nLlYpUNVHbhztsXpwYM9IpaGvHYiq+OpQW9YPEGPRVRhFu9XZn0V5Rl7nxeUSZJUDDQ/otW288GpZ8XLUAZCWyNNPvER77y3eVJccwiwf7pUvjbywR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3ftWVjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3ftWVjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56529C4CECD;
	Sat, 28 Dec 2024 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735383769;
	bh=fbKroEQRip7xzhzwPmBv0l9MdXKz80Eq6dSvtLfPp2A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t3ftWVjy61eEoROm8ldC5SCxIDOXPLAMt4johAKlCHGO5rM9b+5INKwL9a3lt9l0Q
	 1t65o7YT3YX8OGDPy1GNGSxo1Q9yTfldJCqooY57sZ/rqtYG1F8U1vS6RnY9s+IwNd
	 IeNsTLW6VgsdskHhsgGAloW5uucF7b7SbDHdYupsFX7av62LjxDAbRhvaUz5HFj4aY
	 38iUxVxvIc+SqWnnrzkpmRTi24k/vPfkVUANY3XyfwfRMd8vu5XiDmd7hFYtv5+l0a
	 Rl88eCFVKQo9ISUIgtQHaf3Bot09u7ogfDRR2Zq8cC7LoBltDmVhpw4DlpZuJO+uZP
	 DpQ6l0xEUTgrw==
Message-ID: <f9138082-1d17-4247-b365-7cb4eef88879@kernel.org>
Date: Sat, 28 Dec 2024 12:02:43 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 RESEND] soc: loongson: add Loongson Security Module
 driver
To: Qunqin Zhao <zhaoqunqin@loongson.cn>, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, xry111@xry111.site, christophe.jaillet@wanadoo.fr
References: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241224072500.15669-1-zhaoqunqin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/12/2024 08:25, Qunqin Zhao wrote:
> This driver supports Loongson Security Module, which
> provides the control for it's hardware encryption
> acceleration child devices.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Only ACPI firmware is supported.
> 
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

I don't get why you are sending this to soc. This is loongson specific
and is supposed to go via Loongson maintainers.

And why is this a resend?

> ---
> Changes in v2:
> 	- Removed useless memset() in probe.
> 	- Cleaned up coding style.
> 	- Corrected the spelling.
> 
>  MAINTAINERS                        |   7 +
>  drivers/soc/loongson/Kconfig       |   9 +
>  drivers/soc/loongson/Makefile      |   1 +
>  drivers/soc/loongson/loongson_se.c | 523 +++++++++++++++++++++++++++++
>  include/soc/loongson/se.h          | 135 ++++++++


include/linux/soc/... or just keep it private to the driver. Why this
has to be exposed to other users?

>  5 files changed, 675 insertions(+)
>  create mode 100644 drivers/soc/loongson/loongson_se.c
>  create mode 100644 include/soc/loongson/se.h
> 

...

> +
> +/*
> + * Called by SE's child device driver.
> + */
> +int se_send_ch_requeset(struct lsse_ch *ch)
> +{
> +	struct loongson_se *se;
> +	u32 status, int_bit;
> +
> +	se = ch->se;
> +	int_bit = ch->int_bit;
> +	if ((se_readl(se, SE_L2SINT_STAT) & int_bit) ||
> +	    !(se_readl(se, SE_L2SINT_EN) & int_bit))
> +		return -EBUSY;
> +
> +	se_enable_int(se, int_bit);
> +	se_writel(se, int_bit, SE_L2SINT_SET);
> +
> +	return readl_relaxed_poll_timeout_atomic(se->base + SE_L2SINT_STAT, status,
> +						 !(status & int_bit), 10, 10000);
> +
> +}
> +EXPORT_SYMBOL_GPL(se_send_ch_requeset);

No, no users. You cannot export unused symbols.

> +
> +/*
> + * se_init_ch() - Init the channel used by child device.
> + *
> + * Allocate the shared memory agreed upon with SE on SE probe,
> + * and register the callback function when the data processing
> + * in this channel is completed.
> + */
> +struct lsse_ch *se_init_ch(struct device *dev, int id, int data_size, int msg_size,
> +			   void *priv, void (*complete)(struct lsse_ch *se_ch))
> +{
> +	struct loongson_se *se = dev_get_drvdata(dev);
> +	struct lsse_ch *ch;
> +	unsigned long flag;
> +	int data_first, data_nr;
> +	int msg_first, msg_nr;
> +
> +	if (!se) {
> +		pr_err("SE has bot been initialized\n");
> +		return NULL;
> +	}
> +
> +	if (id > SE_CH_MAX) {
> +		dev_err(se->dev, "Channel number %d is invalid\n", id);
> +		return NULL;
> +	}
> +
> +	if (se_ch_status(se, BIT(id))) {
> +		dev_err(se->dev, "Channel number %d has been initialized\n", id);
> +		return NULL;
> +	}
> +
> +	spin_lock_irqsave(&se->dev_lock, flag);
> +
> +	ch = &se->chs[id];
> +	ch->se = se;
> +	ch->id = id;
> +	ch->int_bit = BIT(id);
> +	se->ch_status |= BIT(id);
> +
> +	data_nr = round_up(data_size, PAGE_SIZE) / PAGE_SIZE;
> +	data_first = bitmap_find_next_zero_area(se->mem_map, se->mem_map_pages,
> +						0, data_nr, 0);
> +	if (data_first >= se->mem_map_pages) {
> +		dev_err(se->dev, "Insufficient memory space\n");
> +		spin_unlock_irqrestore(&se->dev_lock, flag);
> +		return NULL;
> +	}
> +
> +	bitmap_set(se->mem_map, data_first, data_nr);
> +	ch->data_buffer = se->mem_base + data_first * PAGE_SIZE;
> +	ch->data_addr = se->mem_addr + data_first * PAGE_SIZE;
> +	ch->data_size = data_size;
> +
> +	msg_nr = round_up(msg_size, PAGE_SIZE) / PAGE_SIZE;
> +	msg_first = bitmap_find_next_zero_area(se->mem_map, se->mem_map_pages,
> +					       0, msg_nr, 0);
> +	if (msg_first >= se->mem_map_pages) {
> +		dev_err(se->dev, "Insufficient memory space\n");
> +		bitmap_clear(se->mem_map, data_first, data_nr);
> +		spin_unlock_irqrestore(&se->dev_lock, flag);
> +		return NULL;
> +	}
> +
> +	bitmap_set(se->mem_map, msg_first, msg_nr);
> +	ch->smsg = se->mem_base + msg_first * PAGE_SIZE;
> +	ch->rmsg = ch->smsg + msg_size / 2;
> +	ch->msg_size = msg_size;
> +	ch->complete = complete;
> +	ch->priv = priv;
> +	spin_lock_init(&ch->ch_lock);
> +
> +	spin_unlock_irqrestore(&se->dev_lock, flag);
> +
> +	if (loongson_se_set_msg(ch)) {
> +		dev_err(se->dev, "Channel %d setup message address failed\n", id);
> +		return NULL;
> +	}
> +
> +	se_enable_int(se, ch->int_bit);
> +
> +	return ch;
> +}
> +EXPORT_SYMBOL_GPL(se_init_ch);

No, no users. You cannot export unused symbols.

> +
> +void se_deinit_ch(struct lsse_ch *ch)
> +{
> +	struct loongson_se *se = ch->se;
> +	unsigned long flag;
> +	int first, nr;
> +	int id = ch->id;
> +
> +	if (!se) {
> +		pr_err("SE has bot been initialized\n");
> +		return;
> +	}
> +
> +	if (id > SE_CH_MAX) {
> +		dev_err(se->dev, "Channel number %d is invalid\n", id);
> +		return;
> +	}
> +
> +	if (!se_ch_status(se, BIT(id))) {
> +		dev_err(se->dev, "Channel number %d has not been initialized\n", id);
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&se->dev_lock, flag);
> +	se->ch_status &= ~BIT(ch->id);
> +
> +	first = (ch->data_buffer - se->mem_base) / PAGE_SIZE;
> +	nr = round_up(ch->data_size, PAGE_SIZE) / PAGE_SIZE;
> +	bitmap_clear(se->mem_map, first, nr);
> +
> +	first = (ch->smsg - se->mem_base) / PAGE_SIZE;
> +	nr = round_up(ch->msg_size, PAGE_SIZE) / PAGE_SIZE;
> +	bitmap_clear(se->mem_map, first, nr);
> +
> +	se_disable_int(se, ch->int_bit);
> +	spin_unlock_irqrestore(&se->dev_lock, flag);
> +
> +}
> +EXPORT_SYMBOL_GPL(se_deinit_ch);

No, no users. You cannot export unused symbols.

Best regards,
Krzysztof

