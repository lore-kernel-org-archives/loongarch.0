Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4E7E
	for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 18:37:34 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id x13so493677qkg.11
        for <loongarch@lists.linux.dev>; Thu, 20 Oct 2022 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1hBLD4lH/XELJE0KWPJAlY/VEp51da8IvgbYfbE9SM=;
        b=m1MqjUsqQL2MbyAa48c2CVvgvq8u1I50bHLNDjMG1UmYjQuTXWEYox4FXqL9j3G6jR
         woCALKrlvanJEaLbeFrJ84/u56hESDulrFNddmwy58SGRhj3EiEzGT1LtoYHEzYnfJ05
         OCYYNp5ngLSolI5T5FcWxlKqd/KSyMNiJUnTMpq3gUeAc9Hjvb/jbahFh7g0fh8gk8AV
         1oMihPlKcs5XeUd3aha6KF8t9Odich8mjDh2Jd+E/9n1hNCcQDYOey8QxfFMnA/XxlfD
         9mvOHqsQCQHtgaAPmTHWtvv1lyTJ1pEulV28hR3143JLdTg1aVfqv/1MFufOVmRV1lEW
         aEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1hBLD4lH/XELJE0KWPJAlY/VEp51da8IvgbYfbE9SM=;
        b=0NrRlEwgxmT4LJTvI4g7VmU02iNcYEZQgtXXk/ZJJtz9mGmigNJzf2DOtV4ooo8aVI
         5KCupHvEGgkmsweQO2Z6sSyScKPLxRIcvjcwu92ZSXtdxh4ohsNO7A3dBs/+MyB6j4qS
         ucuejwyLM//8Hzw9w/h2zQwa6M0/ohBqWhjrplu69pyFxWB9vGk6PvGbqrZPfr8eK5O/
         +qn4Db9liS0dCPRPSmd0Bn/hgPctx7xqeN/sPk0aopDudCYg19KA0q4Ad62Ub2EuX9wK
         ltNYBHVAn3kRzzWrKRXr8cS7hhv2YxhiqUE10Bz6NFVoUT3+VSGHPKFJZZGdxlXnkauD
         YqHg==
X-Gm-Message-State: ACrzQf3ivcIMadziQTXRMGydY4hXDNAvp/XRMtQXn2bjSW/XCp0h9x0F
	TKITZxOlETSHz+b1OUz9HD88sw==
X-Google-Smtp-Source: AMsMyM6K0N51sGcqCNzQyBHqlKAxnwAGBccxXvK+t7f/OxW1GPu+nee4zPGTsttzdLGjy5sQo7B1IQ==
X-Received: by 2002:a37:5803:0:b0:6ee:834c:b605 with SMTP id m3-20020a375803000000b006ee834cb605mr10465392qkb.643.1666291053184;
        Thu, 20 Oct 2022 11:37:33 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id d4-20020ac81184000000b00359961365f1sm6400070qtj.68.2022.10.20.11.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 11:37:31 -0700 (PDT)
Message-ID: <fc302fb5-740a-41d6-2610-dde3cce604cc@linaro.org>
Date: Thu, 20 Oct 2022 14:37:29 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/3] dt-bindings: clock: add loongson2 clock
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221020063624.17548-1-zhuyinbo@loongson.cn>
 <20221020063624.17548-3-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221020063624.17548-3-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2022 02:36, Yinbo Zhu wrote:
> Add the loongson2 clock binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

