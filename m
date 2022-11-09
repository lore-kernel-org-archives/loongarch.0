Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F38F68
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 11:05:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id s24so25189907ljs.11
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzaCvH3xkARHHfJKzBlJJDQJiXN89YFdinP6IW/0fKQ=;
        b=h5S0vl+gwxO3+hZ1VmiEIxOPNO/y3K372NLE/9cA+qNUI/BhCEdUwZ1Z3z1sTh6GpU
         V90cw/FEBs6QSt655LhsMF1AGo7wDl03wHn6S5EaI+RJLKH40Qq7XRFAgsq5mFr5u1S8
         Ic1Y6akI7pTH7tfxZBqnKi3LSVrbGkuDJIQiYh6IBr1agVGGN1Utqdf28jo1DMQYiDS9
         a4PmqaCX8ptMAm+WudXQ0JKu+FbUAdBMaohGMElD2Wfw6RW6hU7cNwrXH/HMmjsp/jNv
         7BVDMhvoRkXVocpmgnk2dZhrXfsYqV/6M69E3qTG3JL47J+8RxCVBj6szGHAhut6hMMo
         Ck5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzaCvH3xkARHHfJKzBlJJDQJiXN89YFdinP6IW/0fKQ=;
        b=oFXT0N59bQAkTHnCr9DOgGPDHH4iPx94L+MX453h/Nlb4pWGJ2PQz/IC3J9YbNNDL1
         5wqYzsuOM9UIeQkWCpfHdh4GczlS6QqdqixR9KEoJ/5ECiOgHEVPrdYQJjI2p6l9nIjh
         VRO7Pi0QpJRezQTSFZifJxZP8Kwa9USVAOE1rS8xfNuPHaEAli1qsTSqOzHMg9fK8wAQ
         RzAiMOaCwYfoYbAsPIeeL6yntI9snSBmdOL0Gq5shMYvzq0mlDnYmtb2LuMmoCaWCE0y
         3WoMqA+sv9hXXbY5pmOU5ofuPekD7Tm2eOBBzp0/Qu3G6nygqdkGPkb0RgO0RtPZVnij
         sqHg==
X-Gm-Message-State: ACrzQf2LJOnDbMy5nNbB6AnuFbNWjfJD0EPb4Qw5VsReGAHluoyevm5O
	6C4jMbSAdoasKXv2FVh+3sI99A==
X-Google-Smtp-Source: AMsMyM5EaAzEjE2wqAIdQQS9DKHqggJlSiktGSWvrpBK/emQnzuqrjmMZklhZEQDYjO0bXVRuJtiSw==
X-Received: by 2002:a2e:953:0:b0:277:3609:bd2b with SMTP id 80-20020a2e0953000000b002773609bd2bmr7300851ljj.340.1667991929507;
        Wed, 09 Nov 2022 03:05:29 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id z4-20020a056512376400b00499b1873d6dsm2177860lft.269.2022.11.09.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:05:29 -0800 (PST)
Message-ID: <fe352971-dcb2-c33f-285b-a47c40dbcf2a@linaro.org>
Date: Wed, 9 Nov 2022 12:05:27 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu
 <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Heiko Stuebner <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>,
 Sven Peter <sven@svenpeter.dev>, loongarch@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
 <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 11:15, Linus Walleij wrote:
> On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> 
>> Hi maintainer,
>>
>> This patch I had verified that base on mainline 6.1-rc3 tree, it is
>> okay, if no other issue, please you help me merge it to upstream.
> 
> Aren't these loongarch maintainers listed in MAINTAINERS able to
> merge this? Certainly Huacai can merge stuff to drivers/soc as
> need be. drivers/soc is a bit shared between different archs.

The problem was they were not cc-ed on these patches for some reason.
Maybe the maintainers patterns are incorrect...

Best regards,
Krzysztof

