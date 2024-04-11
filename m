Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F311474BB
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712833635; cv=none; b=jIC5FPQdWob9VpYMb3iCnLk5ebwupts7UECB+ntZQEHoocqNtnEqGaCNMPZpg4DRgWStrRW44uVfJdA6CsPNNVIJW+hk1hqD6NJPvk63jVsSF9QzG11uhpQiwgwbgVuVnz94/cVUh+PbRvEXUOA0g9B5J58mX57UQDWvBju6DzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712833635; c=relaxed/simple;
	bh=fLit8VjED7zE79F2sopStkIe4xL2XjF5KSYypHS2ERM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMb2wJvhC8jvY5N1W+MwjyMmAZdCptDcSrtqt+Lit1em/y83EiEky1k+x98RGGwdZrrEosWhfS48i58EeNx8aOiuPxQVyODNMJkufEGuGsobigqBdymEx2e5nb8B3NpwEVfn5RsWrOEAhyi2l1G9tfFj4z2yrgFklKafG4PtAhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lLbdwqns; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lLbdwqns"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-346b96f1483so282380f8f.1
        for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712833631; x=1713438431; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5GkNWGxakmJKXBqFXolPskgW0D6/XXw8rh7tWUsTVyk=;
        b=lLbdwqnsM7zsadY0BGeUU14AgW63r38uODJRLH3lgqc/SCtwN79k4hY276E9o56kqf
         QUO+pVH4s9faY0+hs4aufcwmq4Axa+VreUZlehu63OWBZz6ivDBabedcyljFrohubNYo
         b2FHlqi9Pd5MH84bCKLrZY42DLG/85GtOjXDX+Rm0g6eHu/VovQWfs9WtzQwLWgmgDwM
         pSuHX51qYZKeFsQhQ91z/445Q6fpSVgfZ5+Y7R9KYGCitQ+V3Zv9S5fIOQdzMEaoK7AI
         0tzeQZ5fz1NAo/q87Xk83yuk4SCwGo9psMeLU8Tp57F5J+eyNBzdX8QcOkuhGe4Q58xy
         xNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712833631; x=1713438431;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GkNWGxakmJKXBqFXolPskgW0D6/XXw8rh7tWUsTVyk=;
        b=Tv35AFA78fe92atrJ8N01nIQ6ZzYFmIrav2P8jBl2Mz9OqYUvgW1ZbbNxWGAqrFlpS
         KlNMHnQNivLU5nqwoIWMJ/GVx70CO/oxHYt29cUI+QShd9p/pOiU1HGl46/LWPNIxIMZ
         I7OIZxwXXAykO0XTH46m698mDKCegKdnBvSS+ZWShXu5Tf/Au7kDnr2sTosU/Y/7nAd3
         bJKnt002ewfwcsMA2oECJBiNITY4DY5Q6Yo2yXH0o9E50vs1HtiaOdPtp/7yq6aBBipL
         cluIlAZLr81r3MjH24gwIyFRDdPk1jWiJEleL6UhZOJbL1MheKe3Xc1o1IbZ+aOMl+cn
         6/TA==
X-Forwarded-Encrypted: i=1; AJvYcCXBi+5N0dorI1e42HZhs9KjB3PGuP4PM2eqTeO9GgTGlsoH1p0aGfYBU7kjFPu4JWJM4LYy2PkcMxKiZAV2J41TIn+EK8sbmEnG
X-Gm-Message-State: AOJu0Yx2w2SloEu+g4+6x19L1i/5Kp7wt2R5T0P/5lEQA4AvPPOTYhfs
	o7GpDV+wfa/xi5KN0z8PNgfPhRPoRJEwTS8vpmZwPaSqwd8mqah94elVE0OsU8w=
X-Google-Smtp-Source: AGHT+IFi3hjMCBbMTtRxhlllfe8R3Fkj+JS8g2H80ShThs3gsytJR5CfKh/9xqbPBG0TvlGWGBjr0g==
X-Received: by 2002:a5d:6542:0:b0:343:d23a:c977 with SMTP id z2-20020a5d6542000000b00343d23ac977mr1948319wrv.1.1712833631552;
        Thu, 11 Apr 2024 04:07:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id q4-20020adff504000000b0034635bd6ba5sm1506039wro.92.2024.04.11.04.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 04:07:11 -0700 (PDT)
Message-ID: <98d12a5e-e291-40f9-8334-3b5f53ed79a8@linaro.org>
Date: Thu, 11 Apr 2024 13:07:09 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Add Loongson PWM controller
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Juxin Gao <gaojuxin@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1712732719.git.zhoubinbin@loongson.cn>
 <38c234d548b4b9c334cda6e7664a803896b31f6f.1712732719.git.zhoubinbin@loongson.cn>
 <c1399191-6c6d-4eb4-b05b-f87a9f2b4152@linaro.org>
 <CAMpQs4JiLGJ-nBDmj1pe0SCqKeCnz5DrybJAKE8_6up293YNpw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMpQs4JiLGJ-nBDmj1pe0SCqKeCnz5DrybJAKE8_6up293YNpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 13:01, Binbin Zhou wrote:
> On Thu, Apr 11, 2024 at 4:26 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 11/04/2024 11:16, Binbin Zhou wrote:
>>> Add Loongson PWM controller binding with DT schema format using
>>> json-schema.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>
>>
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: loongson,ls7a-pwm
>>> +      - items:
>>> +          - enum:
>>> +              - loongson,ls2k0500-pwm
>>> +              - loongson,ls2k1000-pwm
>>> +              - loongson,ls2k2000-pwm
>>> +          - const: loongson,ls7a-pwm
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  '#pwm-cells':
>>> +    description:
>>> +      The first cell must have a value of 0, which specifies the PWM output signal;
>>
>> If you have always the same value in PWM phandle, why encoding it in the
>> phandle in the first place? What's the benefit of passing 0?
> 
> Hi Krzysztof:
> 
> My thoughts are:
> First of all, our pwm has only one output signal, so it can only be 0.
> Also, as you know from the pwm xlate function, the first cell is the
> pwm index, so I fixed it to be 0 here.
> 
> The xlate function:
> https://elixir.bootlin.com/linux/v6.8/source/drivers/pwm/core.c#L106

You refer for xlate for PWM with three cells. You do not have three
cells, as you have only on signal, so why insisting on using other
xlate? Do you do the same for clocks? Or resets?

I don't think you use appropriate argument in this discussion. We talk
about hardware and your argument "I don't want to use my own xlate in
the driver" is about driver.


Best regards,
Krzysztof

