Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F36AB1
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 09:24:11 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id b9so24830089ljr.5
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 01:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gm5yfU9YziCMwLNsyVuPxY75pXMz7VSRfqIfnoUFvE=;
        b=eAz2QvzAzn/m+Dfbq4RDigAZs9DY3fb/ppo0otCSBB0rL6JKxIhyMVX5z5qBd3TWR/
         esfHXVQT5OwDFrlQbFBn5UWr2a6+Rfd+IxmecJWkbEJBIUvMivnslwveb9VDfXILW4xa
         gY7l0U4qXQgwg0jG1+gtHBqYyce5aPFtHuwpGAxdPTs+n7j8fLlf+X8FRQfAtSxn8eGl
         mCCYbC8giysrnBFstKTI+K/cdUyReS/wTi3X/bTofv+jc2IyXO92OFHqd4Fob3YEW4h8
         5Z4EYgQs5XZ+KtqQwPwsX7otQWYOwDIF17QTI2Gkap78a2tTMVZwp906nXUjxpbCqf57
         vYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gm5yfU9YziCMwLNsyVuPxY75pXMz7VSRfqIfnoUFvE=;
        b=fJGpJX9ttuYrOkl/1KsufybWAkbybO+Lj4YIuypC5eHvC3FZtbiCrcmZNPw7Ofx+i+
         xIElKpP8Qyx3693g722kfCUYo3Xn32caUn01q9VDiChw6ABYoVBxYrv+yAcW94ipuB1j
         j7pzDEfCSetbwQ8/OUOhRaDgU/NIn0Sp4HLqlm/IKANIsklkhG9aD1PkeIqkAOSRmThC
         GTD0850OBoLPJ80LNA5EqxFAwEtRSzygELdHtkW7CTxbWzpZaYaKKsaLO3mrjhQGwxtI
         JVNuvsGF7DaGjjURQYs1HYJUUoNV4UNJxjBE76S2W6n2xB+RU6NkGt+GnZryrxjiFzb7
         c4vA==
X-Gm-Message-State: ACrzQf0QbmpMQNlvhqSaXvL1bF4Xe2vEftXHfAW2p8VsgmjGItXZmTaP
	KCybWU8AAYRAhV4Kvm8tLqHyww==
X-Google-Smtp-Source: AMsMyM5UI1gFIlHma+VcJxWK8k5Kni7jsznGK0vbSHYejZElBiiGKVZcM7EDMrppBCrBZxji9Hvu6g==
X-Received: by 2002:a2e:350d:0:b0:26d:e73c:e018 with SMTP id z13-20020a2e350d000000b0026de73ce018mr8186724ljz.391.1667985849333;
        Wed, 09 Nov 2022 01:24:09 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id g19-20020a2ea4b3000000b0026de1bf528esm2084311ljm.119.2022.11.09.01.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:24:08 -0800 (PST)
Message-ID: <a588a90e-a8ab-7b43-a14b-101bb9f590db@linaro.org>
Date: Wed, 9 Nov 2022 10:24:07 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 2/2] dt-bindings: hpet: add loongson-2 hpet
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221103065351.32603-1-zhuyinbo@loongson.cn>
 <20221103065351.32603-2-zhuyinbo@loongson.cn>
 <b0aed9f8-f82e-3d74-4299-4d77445c2170@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b0aed9f8-f82e-3d74-4299-4d77445c2170@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 10:19, Yinbo Zhu wrote:
> Hi maintainer,
> 
> please help me merge it to upstream.
> in addition, this patch need rely on 
> "https://patchwork.kernel.org/project/linux-clk/list/?series=691497"

Why pinging for v8? Didn't you have v9 and v10?

Several of your Loongson patches had many build errors, pointed out by
lkp. Therefore I have doubts that you test these extensively. This might
be the reason why your patches float around...

Best regards,
Krzysztof

