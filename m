Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA9923A3
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 11:33:39 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id cr19so3280969qtb.0
        for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nOb6ixaw3sC1bMe4Tc9zgjVX+jZykKmBqY5NKZFPo8=;
        b=H0KktTz/f82EeK7JVYK1NLX88O5AqXOjZNjj2Es89tkGQ4UJ3azJ+f9BwyQYZdvvMr
         LcQvmpLzj/k+IKxQpWUmWkOnrHONVv3PBJGfA22gVRwcjCg9QBRTmLCWmHVuP4aQnwcP
         jcEiBwhS2QJ8kQdTonWRujvTLyHypht7PzVhCbSS6U/dbxcdSOmdE4ByIXXkLjc/zHCs
         LHLw5GLowijW7mOswN66zzmiQvThEf7rKJV2t9VUqmx3mGwyYkfzXObI3IE0kNpb1t+u
         GeqHRAzVxB13q6uSuT78GXXyYkU90PKUYlhrlzPLmNp9uUNk7/IHbfFDmtoqTTbDnRlo
         srvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nOb6ixaw3sC1bMe4Tc9zgjVX+jZykKmBqY5NKZFPo8=;
        b=keyRjzHqMJftqfRhpCnkoLtT5z7uAF/J9QTd5PpXJYjmoXerF4GbwtsluG/hNt3Y2b
         cgQ95oJ8soEGo2i9bJsXBjr69pI5vMuAtygjKBeKXD7rYnEZw4dedCCAS4pSobWIA4NT
         wjGMiS55R8Y8LiGY/yqIh/OkmUB/tp6Oxcom82AGdvgkg9h0/JRSsCcITlVUJvhL4rH2
         CTQH4vAAqyBtqbDmpwnjC1YvM9qk5r/5nqmF06ms4GCNXNoidgoxnhTP1JwcJyo1NdIp
         d2K9OZAi7wRNtI6tcXguHpOuU7kHIIEePe8QMFxoEOkGxYpGPwHIpkeFi59WoC/T3ZBo
         fK4w==
X-Gm-Message-State: ACrzQf0X38vFwSXTQp1jMcRebH8zvb4EQwdM2WVLv1WrPrUDli7ZucpL
	UrQJzqtyi/jBnSFXLUJv702UJg==
X-Google-Smtp-Source: AMsMyM6jgxTjcCSH7VPVjxxayzMiZuZ73epx1TsqH9CaxqnT/E6L32qExryH01IxuSSlluCwce0RWw==
X-Received: by 2002:ac8:5f52:0:b0:39c:cb1c:9310 with SMTP id y18-20020ac85f52000000b0039ccb1c9310mr45321044qta.177.1666956817995;
        Fri, 28 Oct 2022 04:33:37 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w7-20020ac84d07000000b0039d02911555sm2227867qtv.78.2022.10.28.04.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:33:37 -0700 (PDT)
Message-ID: <a79acba3-19ff-6da4-4bbe-d5c5e455594a@linaro.org>
Date: Fri, 28 Oct 2022 07:33:35 -0400
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/2] clocksource: loongson2_hpet: add hpet driver
 support
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
References: <20221026035752.32681-1-zhuyinbo@loongson.cn>
 <438f5df4-b076-4920-7bb3-095041c27eef@linaro.org>
 <9b4c904a-9277-504e-3bec-0b11331bbea4@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9b4c904a-9277-504e-3bec-0b11331bbea4@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2022 23:54, Yinbo Zhu wrote:
> 
> 
> 在 2022/10/26 下午10:20, Krzysztof Kozlowski 写道:
>> On 25/10/2022 23:57, Yinbo Zhu wrote:
>>> HPET (High Precision Event Timer) defines a new set of timers, which
>>> are used by the operating system to schedule threads, interrupt the
>>> kernel and interrupt the multimedia timer server. The operating
>>> system can assign different timers to different applications. By
>>> configuration, each timer can generate interrupt independently.
>>>
>>> The loongson2 HPET module includes a main count and three comparators
>>> , all of which are 32 bits wide. Among the three comparators, only
>>
>> No blank line before coma.
> You said that need blank line is need a blank space before comma?

No, I did not say that.

Best regards,
Krzysztof

