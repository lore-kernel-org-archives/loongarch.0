Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE6181
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 12:37:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id s8so17116529lfc.8
        for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zsuy+0KAbon34PjD50ab0w1ynNsD0k56NpcI5wUZZY=;
        b=nNowC5tN1eKFJBmunGJikmsjqeJ/RZ8kp06qtd4uCbDB1SPM2VZThIjAMQRzCJ48Zc
         XruHi5Q8q1FrwX0F2jQdhznu3cP6nBBS8CN8/lZr8MWZTa0vyGhF6CCqLPXfaT8BDSnw
         GLnP+NkrbqP+K8Lf4l3ht12LlKKWaxugQUq1otVv2Z+kEtP7RGcJz6ApOz0yXHeYIwSc
         KvFtaXxN23QskFC5ezXWO3F/pFocLY5cTITZShvYs03ygkmkg14n+jtBlC92pTu0xzU2
         ZCMjSRNF5GyZKdcSMk/TdLO62Apm7f+xSABKXB3hp1Xe6RXazm3Pm7QHTwMBDoH+SkT2
         v50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zsuy+0KAbon34PjD50ab0w1ynNsD0k56NpcI5wUZZY=;
        b=y8b4VokxTknYfiBOvfS8K97WJPcmOfuCQtOkJJpsXlKS6s0wjXrpA73CEVPx15fCNj
         SjqFik4jlVjxD5L4Be+en3v0nv3eCwIWhJTGrSoZj0rSEZuG2EgzipAeZQnpVw0ut+fH
         qPIn30yUfC6YCqjR9lZun2bTso59zkYqPSnB2Ygmr6gC9y/fPNU2/R31HAIgdEce62yt
         p+N/ZbrEjcwjRcTqWxr5ovAAbrfcNByvXu9flQusD+b3gyXVzXwB1drb911nycEd+sQu
         fkQt05e2p/UJAVrXFmq6r9/m5ru/JuW6gQFD6TlXMiDO6GaogaXxwzXcB5o4s9hHm/Zi
         78sw==
X-Gm-Message-State: ANoB5plL/zXECD3cjMaPakCiHl/3U9nL/UzxDtOfHWbjsshUi4vFhZal
	2MnPj6+ELTDiiVVwbrBQt6V/2w==
X-Google-Smtp-Source: AA0mqf4wQN/ZHP/4bc7HcoQXJzIU87tAaHbkDsXSPAwaz8rWU+HBFFrbh++nFRy+SN9XCqBEi3d0Hg==
X-Received: by 2002:ac2:41c6:0:b0:4b0:4b08:6873 with SMTP id d6-20020ac241c6000000b004b04b086873mr18360398lfi.329.1669639045898;
        Mon, 28 Nov 2022 04:37:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x21-20020a056512047500b00492ca820e15sm1673362lfd.270.2022.11.28.04.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 04:37:25 -0800 (PST)
Message-ID: <58febf4d-05c8-e06e-04c1-6f10322e29c8@linaro.org>
Date: Mon, 28 Nov 2022 13:37:24 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
 I2C
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: loongarch@lists.linux.dev, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
 <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
 <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2022 13:24, Binbin Zhou wrote:

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>> No clocks? I2C controller without clocks? Are you sure the binding is
>> complete?
> 
> We previously set the default CLOCK in the driver. Of course, we also 
> provide the path to read the clock-frequency field for redo. In any 
> case, I will add the clock-frequency field to the V4 patchset.

I am not thinking here about the driver. What your bindings said, is
that device does not have any clocks and I have doubts about it...

I also do not say anything about clock-frequency because it is already
there via i2c-controller.yaml.

Best regards,
Krzysztof

