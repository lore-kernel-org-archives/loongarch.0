Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6E2185F
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 12:31:56 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id i12so11247098qvs.2
        for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsgvCsDrG0L5go1M7pNQAYTvwXsvN/vC+2+5gNeL11E=;
        b=Pwht4Y+YQT/Q+akb1YflgdfeRaQJuvKGI6p12b2VMApcNLE+XKb1VRzgzTpED0nkNt
         4f2KSAw6YjmsVm8Kt69rdjuO/3eGmIhPPBjoFnKwC5zHYkZ2Fbmu0SPZjSkUzBKnP5T+
         pv1c1OBsXnOCeRoLlWX0VJHUbBHciC17XRfwu1Lmw2ea0IZlXdCMK8+7aCfFMUGqeXDF
         jer9TP3K+xipbqsEHsFe1GShMYQ1zYLob1JTLk4flJZ3IxU8P3PRvKwb9JLyPRru9Jl5
         dPQBpZ0irN/tU/QIOTmQQNV6Mxc7D3gIV5HDt/zoERdAxrI06T7LMvXVFzBlSyh0zbqH
         ihhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TsgvCsDrG0L5go1M7pNQAYTvwXsvN/vC+2+5gNeL11E=;
        b=6gAKmr5rAsOP8U9O4Oi31jz10kCO2H61BL6Ni+Eum5hFBDR0/v5w381cdl7MUQ7UeJ
         yyN91jCUTgVJZ/ue3KtXmtPZZQIym531V65s38uGwFNIuHunEQ2FPZIxZEeQhEmL1WqW
         4Nue1LZ7wSyPHkvuvpQKoYH865OtC/dFmHaNQMGXe/3j0SJTw1joQkdRJZhc6/3y28/Q
         mKgKD1sbUnEr8KTcdeXkdAlDm+PLq1izTyC5Kcw1SjLHu7kArDkw8QBYDV8VqeNDkuMF
         NN9o59yczvwj1pubYwT7bfM1LmpKhMuy4mzlGxxo9M4xZKDd77OpHMmon3IaxYbb4J+m
         9CgA==
X-Gm-Message-State: ACrzQf2noieEO1bcguCSL0gvAwsn9WIYid7GRu7m+pFjvM/+iQjVzidG
	DIke5ERHB+fz3scUn3zSX6ERQg==
X-Google-Smtp-Source: AMsMyM7ajU52RN5MSL5JJQ1VgEbJtgiUHm5DykSRp3Iw07X0DoKYmRCW+TIJPHzBUa6tueBS9s6jsQ==
X-Received: by 2002:a05:6214:519c:b0:4b1:8eaf:a21f with SMTP id kl28-20020a056214519c00b004b18eafa21fmr6147405qvb.97.1666182715482;
        Wed, 19 Oct 2022 05:31:55 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id hf8-20020a05622a608800b0039cbbcc7da8sm3871762qtb.7.2022.10.19.05.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 05:31:54 -0700 (PDT)
Message-ID: <05305f6e-8ba5-9145-7835-db60a8a560bf@linaro.org>
Date: Wed, 19 Oct 2022 08:31:53 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add loongson2 clock include
 file
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
References: <20221019062912.3463-1-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019062912.3463-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/10/2022 02:29, Yinbo Zhu wrote:
> This file defines all loongson2 soc clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


