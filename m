Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779F3101F2
	for <loongarch@lists.linux.dev>; Sun,  4 Aug 2024 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722755682; cv=none; b=eBVlOKiinbHzMIuzKt2iBcIjpq7nmtOew+9elpRVUJJZ8tOYDmZhjhEJiq6UjX3IYk+Beyah9YtD7knPeiTpPgOzqgt/Jv2mMrDTrTwaZyq4OZiGsvE72VDyc5BVqXAPLY5rUXh65Sj5qbFtTRH2JqekyTdPEkIGjw8ngNBYWw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722755682; c=relaxed/simple;
	bh=neoQXiAs/eK45+Vn9/FufG/dHbA6k0syvg4que2tmlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvTZfeoAVgqAbRSxpFvODeYZmsHZGYrO9Q5gm5GhbSk3DkrwBipQuLW54gQhKGGriS/LfyTTqadEFur40dzIhXiBVYtdg6a6JR1ZQ8QlqSboL/erxf792fZGV5KMmRCx3OWYFQfUE/ZqUqdLGAng+ElZ7GKYbwgF84w1MhZ1BFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LpO1sbvH; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LpO1sbvH"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id aVQjsd3xlYjQzaVQjs3TcI; Sun, 04 Aug 2024 09:13:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722755610;
	bh=o92rgxzS+zv7GuEFU/LDkkgE+jnxQdMRm/w/7tzVkHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LpO1sbvHd8k8W3WAsQB9EJPvUR9zVjKEZEmgH8/vwH3rp90LBCcoWMWPPbcmViSc2
	 t6VaE/dZR+jxaO5MjhtnSVZIymn3GI7B7a8P5CkAKSm+5/Zc551mF6qWi3L7CDXDsV
	 OSiDA+DBlMeQC1qr3/hHTzueGRClcVOz6/jE+rxxv1gdV2II1lPavU8QoSQQOQgvVv
	 gt8ELkWtA8JyPEKEsw+LtYjc7VsRtwfPBOaB0+czS46VULj79ziD+j26OoHLWFpAJM
	 0JMXRt960pHX7NdgDzi1NvvIwgboqwA3DytaH0881Uegcop+jE5kAA2PdJ5OpOWe7p
	 zo1rc+KridJMw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 04 Aug 2024 09:13:30 +0200
X-ME-IP: 90.11.132.44
Message-ID: <685e5225-339c-4d7e-973c-9f0ab421b15e@wanadoo.fr>
Date: Sun, 4 Aug 2024 09:13:25 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] tty: serial: 8250: Add loongson uart driver
 support
To: zhenghaowei@loongson.cn
Cc: chenhuacai@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, kernel@xen0n.name,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, loongarch@lists.linux.dev,
 p.zabel@pengutronix.de, robh@kernel.org
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
 <20240804063834.70022-2-zhenghaowei@loongson.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240804063834.70022-2-zhenghaowei@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/08/2024 à 08:38, 
zhenghaowei-cXZgJK919ebM1kAEIRd3EQ@public.gmane.org a écrit :
> From: Haowei Zheng <zhenghaowei-cXZgJK919ebM1kAEIRd3EQ@public.gmane.org>
> 
> Due to certain hardware design challenges, we have opted to
> utilize a dedicated UART driver to probe the UART interface.
> 
> Presently, we have defined four parameters — 'fractional-division',
> 'invert-rts', 'invert-dtr', 'invert-cts', and 'invert-dsr' — which
> will be employed as needed.
> 
> Signed-off-by: Haowei Zheng <zhenghaowei-cXZgJK919ebM1kAEIRd3EQ@public.gmane.org>
> ---

Hi,

...

> +	data->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> +	if (IS_ERR(data->rst))
> +		return PTR_ERR(data->rst);
> +
> +	device_property_read_u32(&pdev->dev, "clock-frequency", &port->uartclk);
> +
> +	ret = reset_control_deassert(data->rst);
> +	if (ret)
> +		goto err_unprepare;

Should reset_control_assert() be called if an error occurs later?

> +
> +	ret = serial8250_register_8250_port(&uart);
> +	if (ret < 0)
> +		goto err_unprepare;
> +
> +	platform_set_drvdata(pdev, data);
> +	data->line = ret;
> +
> +	return 0;
> +
> +err_unprepare:

What is this label for?

> +
> +	return ret;
> +}

CJ

