Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D8214659A
	for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782540; cv=none; b=uf8OUdgs8w0fE09NKew5qjIF9WwtHdDES4RPc9g+BSsJbwPT294a2q8HzqXkAsQZpjNSSumMU4WuS6X2Udkl1eJ3xaYkckeytWK0/KX0+VTxMddqFRRryl6a/CWdgLoWbTILLdhdtF0tJPNOOSF6uCqN2v74+akC8yT4sUS+uew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782540; c=relaxed/simple;
	bh=YoEJKKsBkO7Hy2UG3Vai0ze1YI1Lzm34ca+sCXhjjss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUMuBgbV7ySP6pNSBNOKZ4lQc+HU75sDaqljLKosqHgOxneWiui3KR91LbBmNCxUXFbMwPlbyBMkYbGw2e/R1uC9dcK6MNGsGF3QhKo6Eediom4RB3LqjrJREYJjXp0STBRgx+ZkG/i/zHOxnJHw1Sjf1/27JRiulzk89Lx3eco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kSv1/VnT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kSv1/VnT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34af8b880e8so589381f8f.0
        for <loongarch@lists.linux.dev>; Mon, 22 Apr 2024 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713782536; x=1714387336; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gC4DR+9J4HO1tL0F3u172IWLsSfAcz/KXWZdmgKrFKM=;
        b=kSv1/VnTORGSCPEKxbiBdDEqsa0td8RhxpNIF6wzwtaBHEKd3QHbpBYNecCv408ghn
         WU30Fq94CgHu/UqWCXr/T3MTYSlF838XC0X0VUoD8fMYZh9924H6MPdme1nWHVw4TuOR
         lncvgXcIw82GE83m+HDztMULm5LuErCeB3qYOHzvfEpLAB7HPJXCXM+AoO4kLeqTHALA
         eoZ1fATomM/LCgP6nDR91H8alH9OlHiaJfvYveBzvdRC4MTiEVMJppIUz+tQ/zTviW+p
         zqyGINNxtROdwelzlQR9l/0zdGxrVGQ7ZNBqSJvnUgYD5mbUCAHazrRJYYH3mNjBeW9I
         J7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782536; x=1714387336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gC4DR+9J4HO1tL0F3u172IWLsSfAcz/KXWZdmgKrFKM=;
        b=b6HOYOX2vW+GWMGVoyoAHBxiFFTeECP2E+WaTGlyLUa7QsrEQJERbV0RDfJr0ImHD3
         qAJhCK1b+znDLxlrrA9AHUd/0NjGVo8VHWs8TJzSsLcswwUBGQAVlno5yk6UV2zysFAK
         6awswOX6WzSmwDdtaQ66exJUmy/FBzZEbFot6IZjl2h3pUnF8k/9yzSrn/VgFpoKRv/W
         Z/1ypJd8TxKoxvzwaJV01Sm51UxeSQBDWDE5VM615Y1ahETe3/ix79Tv/ZiFwfoOHuoa
         er+HMa9A4xdS8kpFgiWrKlKQNGqlcAcrfH89MvHe+iPDrEjlSrFWYEbVD6fYIPlehtom
         whHg==
X-Forwarded-Encrypted: i=1; AJvYcCVQM4wq0m9GJ6UT0/wVwAKpuukI4Uxb3+jJelYDWojaScsfoMsX/6BbhZxZFh1eoz3yQ6sLn9++u8fypba1styZOrTH4/thBqvU
X-Gm-Message-State: AOJu0YzOXfe72v4N/fkxQY7CBnnm8883VEvZ6knkRJjGa3xQ3Ck9kBUy
	VVZs//GWAKZ213VAIIqiAOFZZ5pGSGsmVLoEuFyh5Dz9tZOTdkqM2isr+9MdxLg=
X-Google-Smtp-Source: AGHT+IGjxf3Zq7FCFraVyj/pZnVXYDfnBTpiDA1Kik2gtcjePJ46VP2hfL68eZOAV63TO64TVMWrYA==
X-Received: by 2002:a5d:59a9:0:b0:34a:6fac:6dab with SMTP id p9-20020a5d59a9000000b0034a6fac6dabmr7224398wrr.12.1713782536459;
        Mon, 22 Apr 2024 03:42:16 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e5-20020adfe385000000b003455e5d2569sm11874012wrm.0.2024.04.22.03.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 03:42:16 -0700 (PDT)
Message-ID: <fc73c913-a6e5-418c-811c-57567a3115b8@linaro.org>
Date: Mon, 22 Apr 2024 12:42:15 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] thermal: loongson2: Add Loongson-2K2000 support
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 loongarch@lists.linux.dev
References: <cover.1713509889.git.zhoubinbin@loongson.cn>
 <e3c9b6bdfe8624d90bcc16eefe92abd66bd3da12.1713509889.git.zhoubinbin@loongson.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <e3c9b6bdfe8624d90bcc16eefe92abd66bd3da12.1713509889.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/04/2024 03:46, Binbin Zhou wrote:
> The Loongson-2K2000 and Loongson-2K1000 have similar thermal sensors,
> except that the temperature is read differently.
> 
> In particular, the temperature output registers of the Loongson-2K2000
> are defined in the chip configuration domain and are read in a different
> way.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   drivers/thermal/loongson2_thermal.c | 50 +++++++++++++++++++++++------
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
> index 7de01fbea801..8ecd8ed465ec 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -30,12 +30,20 @@
>   					 LOONGSON2_THSENS_INT_HIGH)
>   #define LOONGSON2_THSENS_OUT_MASK	0xFF
>   
> +/*
> + * This flag is used to indicate the temperature reading
> + * method of the Loongson-2K2000
> + */
> +#define LS2K2000_THSENS_OUT_FLAG	BIT(0)
> +
>   struct loongson2_thermal_chip_data {
>   	unsigned int thermal_sensor_sel;
> +	unsigned int flags;
>   };
>   
>   struct loongson2_thermal_data {
> -	void __iomem *regs;
> +	void __iomem *ctrl_reg;
> +	void __iomem *temp_reg;
>   	const struct loongson2_thermal_chip_data *chip_data;
>   };
>   
> @@ -48,7 +56,7 @@ static void loongson2_set_ctrl_regs(struct loongson2_thermal_data *data,
>   
>   	reg_ctrl = ctrl_data + HECTO;
>   	reg_ctrl |= enable ? 0x100 : 0;
> -	writew(reg_ctrl, data->regs + ctrl_reg + reg_off);
> +	writew(reg_ctrl, data->ctrl_reg + ctrl_reg + reg_off);
>   }
>   
>   static int loongson2_thermal_set(struct loongson2_thermal_data *data,
> @@ -65,11 +73,16 @@ static int loongson2_thermal_set(struct loongson2_thermal_data *data,
>   
>   static int loongson2_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>   {
> -	u32 reg_val;
> +	int val;
>   	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
>   
> -	reg_val = readl(data->regs + LOONGSON2_THSENS_OUT_REG);
> -	*temp = ((reg_val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
> +	if (data->chip_data->flags) {
> +		val = readl(data->temp_reg);
> +		*temp = ((val & 0xffff) * 820 / 0x4000 - 311) * KILO;
> +	} else {
> +		val = readl(data->ctrl_reg + LOONGSON2_THSENS_OUT_REG);
> +		*temp = ((val & LOONGSON2_THSENS_OUT_MASK) - HECTO) * KILO;
> +	}

Why not use a different ops. That will keep the code cleaner for the 
next sensor versions.

For example:

static int loongson2_2k2000_get_temp(...)
{
}

static int loongson2_2k1000_get_temp(...)
{
}

static struct thermal_zone_device_ops loongson2_of_thermal_ops = {
         .get_temp = loongson2_2k1000_get_temp,
         .set_trips = loongson2_thermal_set_trips,
};


loongson2_thermal_probe
{
	...	

	if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG)
		loongson2_of_thermal_ops.get_temp = loongson2_2k2000_get_temp;
	...

}

>   	return 0;
>   }
> @@ -79,7 +92,7 @@ static irqreturn_t loongson2_thermal_irq_thread(int irq, void *dev)
>   	struct thermal_zone_device *tzd = dev;
>   	struct loongson2_thermal_data *data = thermal_zone_device_priv(tzd);
>   
> -	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
> +	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
>   
>   	thermal_zone_device_update(tzd, THERMAL_EVENT_UNSPECIFIED);
>   
> @@ -111,15 +124,22 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   
>   	data->chip_data = device_get_match_data(dev);
>   
> -	data->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(data->regs))
> -		return PTR_ERR(data->regs);
> +	data->ctrl_reg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(data->ctrl_reg))
> +		return PTR_ERR(data->ctrl_reg);
> +
> +	/* The temperature output register is separate for Loongson-2K2000 */
> +	if (data->chip_data->flags) {
> +		data->temp_reg = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(data->temp_reg))
> +			return PTR_ERR(data->temp_reg);
> +	}
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
>   		return irq;
>   
> -	writeb(LOONGSON2_THSENS_INT_EN, data->regs + LOONGSON2_THSENS_STATUS_REG);
> +	writeb(LOONGSON2_THSENS_INT_EN, data->ctrl_reg + LOONGSON2_THSENS_STATUS_REG);
>   
>   	loongson2_thermal_set(data, 0, 0, false);
>   
> @@ -146,6 +166,12 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>   
>   static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k1000_data = {
>   	.thermal_sensor_sel = 0,
> +	.flags = 0,
> +};
> +
> +static const struct loongson2_thermal_chip_data loongson2_thermal_ls2k2000_data = {
> +	.thermal_sensor_sel = 0,
> +	.flags = LS2K2000_THSENS_OUT_FLAG,
>   };
>   
>   static const struct of_device_id of_loongson2_thermal_match[] = {
> @@ -153,6 +179,10 @@ static const struct of_device_id of_loongson2_thermal_match[] = {
>   		.compatible = "loongson,ls2k1000-thermal",
>   		.data = &loongson2_thermal_ls2k1000_data,
>   	},
> +	{
> +		.compatible = "loongson,ls2k2000-thermal",
> +		.data = &loongson2_thermal_ls2k2000_data,
> +	},
>   	{ /* end */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_loongson2_thermal_match);

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

