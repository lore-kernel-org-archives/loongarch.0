Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07DA3FF5
	for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 08:43:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-977cc662f62so772972066b.3
        for <loongarch@lists.linux.dev>; Tue, 13 Jun 2023 01:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686645805; x=1689237805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5Dbs9odIHVvkEWBqHHqfLFf7lgHuWeM0uugMrIB5UY=;
        b=LloKSIEhAMpnEpsYPW39b6O6NUjbZ2ljy2hcRAYG21medhu4KyE2ePRR0r+zVHeL64
         pDEzzdxroHyDIdqlykc6iTGhhQ/UrKnN6XR0uqNzz0t4o6x1sBiEovQY2eFH6QAkK/By
         KYHuM6dKnJTpkoJBbs4k5cM/iEgCYHccdow6ZBBOOFHFHLgGvim7eG8pld4Obs74ufJH
         7Xd5U1H0U5Fzu4S7Oe/sTghVUA52cIJ2Ada8qz7OtkpqHpt/IBTmUUkuKmqXrKbrPipf
         Eo/ydGkWScNOYzLsari49zXzfz9lAyhQbbPUEW58HQf2Bq9+eLHVVBei067BxG2OqapH
         miGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686645805; x=1689237805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5Dbs9odIHVvkEWBqHHqfLFf7lgHuWeM0uugMrIB5UY=;
        b=LTNGMFwClSAnvJeyJ5qDtxMn//WTtMBHg5SBryQQK+iucU74yWo2TQcTMaJfHBNDGG
         uRCO1qWlVdonFJNmjNoDa4Oj9Fias3mAC7waOHZTM4yn1BpOo4qsq2DOvXk7GV3tJSe6
         Rr1OTvSXv24rsqTliIAkgNHv0aQOqz3retvur38oDG9LyWf/HdbFJFdlHirHNyGrbVnY
         YMFXXMWfB7KMr0biYUvk81N70VftszetFR2qpsnyY9KJ9ybQfIBD1J3j2+Kys4FZv45I
         MNUlMr31CbDauUu3WLHnHCuC+21uY0coMMRSd6g/mAPQu95gkKqeoapQoDwsaQIHSmyN
         vzTw==
X-Gm-Message-State: AC+VfDzOzusEEIGcvLKbiJd3Ge43cshDDIe4p21iIL0mZtdRdBPAGyPG
	qabfnAtG7UEOKhw/yNNVAUR20A==
X-Google-Smtp-Source: ACHHUZ4/ztJz5BfPpk5ZLSM0RLuAYAVgxSU3DPpJe1GRo73HUHvkUMgS3aOL4f8QyySrPKsiYIeIjA==
X-Received: by 2002:a17:907:320a:b0:974:52e6:93cb with SMTP id xg10-20020a170907320a00b0097452e693cbmr12720907ejb.50.1686645805697;
        Tue, 13 Jun 2023 01:43:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090668c900b0098242730348sm218185ejr.72.2023.06.13.01.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 01:43:25 -0700 (PDT)
Message-ID: <9e0ac1da-9064-5a0a-0365-d5e00cefd1c0@linaro.org>
Date: Tue, 13 Jun 2023 10:43:23 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: YingKun Meng <mengyingkun@loongson.cn>,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230612090058.3039546-1-mengyingkun@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612090058.3039546-1-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2023 11:00, YingKun Meng wrote:
> From: Yingkun Meng <mengyingkun@loongson.cn>
> 
> The audio card uses loongson I2S controller present in
> 7axxx/2kxxx chips to transfer audio data.
> 
> On loongson platform, the chip has only one I2S controller.
> 
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>

Where is the changelog? It's second v2 I got.

Best regards,
Krzysztof

