Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9F5231
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 07:23:56 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9741caaf9d4so210352966b.0
        for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 00:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686986634; x=1689578634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BALn4nHogi6y1z9AsgAJfyJfiqRYd5zNLOOg/2ouMEE=;
        b=Pvs8K2tBZCKq86puKpfNu9DuFHOwzwnzM0AkGpGB6pqb1YGqDVE5HaLYwcE9GxXOr8
         7mK+wHtos/cgNov9LxIfRzmr2QhfAzxrrfLEKKkk5TQmQaxp7OmSTWLqUzR3aZHI3ztF
         RUzceXc2++ezngHE7crk5SbyZT09bnhLd4LqtZDL3IsHls2kr9ehhhEdqIZ0B34lPGxa
         5x6who3KtFWlgx4KYHeOkQD7VYzEbq6u5XuNV9QZHiVey57bnu5zHEPQ3okDBp+/MXHW
         uL/q6swS3iXrkijZrbm5ZqKurn4qrxG2hq8IaJk+mCkx6YhFOA4scwZEFmdEZ6T8NYBx
         M7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686986634; x=1689578634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BALn4nHogi6y1z9AsgAJfyJfiqRYd5zNLOOg/2ouMEE=;
        b=OOs6tGTo/zEKIsI5EEWbCXPp8nnTOHsfF4jgx16GhMA6IetiSWlbPUvpG86gc/pPVg
         wHPxxWIqqXuc/0niB8cDHu5w8Uo6/Fyj8fRKMEKEC5+nJJAmFpX0Ij1emb0VXbuK7VN0
         o4F0eM8nNRjuzdP4jrT3tWhBUNmdsf46WP/gHuWZGdirltCzxSFZQtIgZq3LGgXnI3n9
         OI0O3+x6d7l3RkHrZnGuguajW/vxaEL+YPSx8Twh46U8XxLsqHbwLygWmXNlLRNeKzLm
         PGqgF4YzHrAXoYXIvN5lPb2ZhAzniPEYtn/uHT/+oZ5WeqfWi/Ft1Xuuh+aBYHkObUoZ
         b4sw==
X-Gm-Message-State: AC+VfDx2uO3nHEwVIBoTS2RfsL67aE0j0IiX62lCJjbXGOhkSBS4ckze
	pHbemBCZi/yPWwyD4T2RUWNjOA==
X-Google-Smtp-Source: ACHHUZ5ovY+qgKcvWV4IQbsdgd8jq5luVgKcVljPQWxWlks0ogF6duEmiQCXpK/rXuL+OfgPJJQQ4w==
X-Received: by 2002:a17:907:803:b0:982:cfe2:32fe with SMTP id wv3-20020a170907080300b00982cfe232femr3721370ejb.63.1686986634584;
        Sat, 17 Jun 2023 00:23:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id kb10-20020a1709070f8a00b0098788eb2436sm386571ejc.41.2023.06.17.00.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 00:23:54 -0700 (PDT)
Message-ID: <444dd61e-cebf-8528-d6f9-87bfc9d9cef6@linaro.org>
Date: Sat, 17 Jun 2023 09:23:52 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/6] LoongArch: DeviceTree for Loongson-2K1000
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <99bdbfc66604b4700e3e22e28c3d27ef7c9c9af7.1686882123.git.zhoubinbin@loongson.cn>
 <20230616-projector-visible-4135a378fb56@wendy>
 <CAMpQs4K38C3URsBQ6YC0km5Fg21o4VuEqOe=f6emeutdoqKf_A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4K38C3URsBQ6YC0km5Fg21o4VuEqOe=f6emeutdoqKf_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2023 08:53, Binbin Zhou wrote:
> 
>>
>>> +                     ethernet@3,1 {
>>> +                             compatible = "pci0014,7a03.0",
>>> +                                          "pci0014,7a03",
>>> +                                          "pciclass,020000",
>>> +                                          "pciclass,0200",
>>> +                                          "loongson, pci-gmac";
>>
>> None of the compatibles from here on out are documented either.
> 
> These are required to be added according to DeviceTree Spec PCI [1],
> Linux does not use these compatible for now.
> Removing them really doesn't affect the driver, but to follow the spec
> and make sure every node has a compatible, I've left them all in.
> 
> Are they not required?

If it passes dtbs_check, they can stay.

Best regards,
Krzysztof

