Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B100A6ABD
	for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 20:51:02 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u27so3554011lfc.9
        for <loongarch@lists.linux.dev>; Sun, 27 Nov 2022 12:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcyBF1S4bUpKFqqC37gpW44jRKav1Bn5Tz2Jq35WJNo=;
        b=u8k3Lmkynp84WyAtcEBI/uGTcpuSQdAr73TY9D69J36D6sde7JiK8nYdkWgbeKJs17
         FgdTR6EndWjiZ57r+m//dkS3N7h5v9gHNfufZWC23jwLgHZb9C8TXPAzDnz+wurCEAgI
         Gy1JzjIgutt5ScGpExvw6G50wNglmmLdM2HEIQQsbOSAtd1EY4GiVBfIATwQ2f23DDfL
         ktrf17ruj/tXC4EeyuCvn9suFjq2mbJN8yWkhsnXUuceBJnSfuNH8KzjmOesn7Z3ZWgV
         JdxMmPuct/WRg3U4MJXzI2Xg6dTwpsTpI1VFYXs9j4TRbH3Lt7FcEtRjeeQzgUG8hrO3
         Wrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcyBF1S4bUpKFqqC37gpW44jRKav1Bn5Tz2Jq35WJNo=;
        b=dxi6C3ByKfpcOfiPKWAoG/cfCKo6kptaWnqZwmYhegc8vGuTv7f0CHw+ETvC2sBbM/
         mvWHzepEnGikS/7aBj4wRX25NMNYm0iPy1wRaI9Pdb1yXp74/TfSBBmDB5pmcWIyAxqp
         qXbnL/tHyvTD5hL9l/d3KVVAh5fehtdV5OcR5/za7/oNP26BzqbLxTkzdo+HvQz5cSb/
         bWKVO2W6bJFvB4SYBpPLTSzzgZ7WyDLyWbRfv1Rh+SJ9sxQjOhEYsDvPUV7fpX058Xc1
         DO3JMvtRn0HR4fF9n9Uo/+rU0wsOSompTAUI2N+xe65a7oUwG/HWZGFxW57YDtkCCOf6
         gFxw==
X-Gm-Message-State: ANoB5pkw2X4uXpd+zzpc+cjMghjzHfdLOUIyq08gDqD2dov1/yBlHXjt
	wd4Obkr69TyyHWks91CdQYaq6A==
X-Google-Smtp-Source: AA0mqf6y7qiqxK6UAntRevJQyavUOzqGJ5cu5MCIJRPSYHx2H37macfXsXW6QTuKSEpxfcOO3x71jQ==
X-Received: by 2002:a05:6512:344a:b0:4b4:b5d8:865e with SMTP id j10-20020a056512344a00b004b4b5d8865emr15559101lfr.503.1669582260800;
        Sun, 27 Nov 2022 12:51:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v19-20020a056512349300b0049876c1bb24sm1401977lfr.225.2022.11.27.12.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:51:00 -0800 (PST)
Message-ID: <ff8520c3-75d6-fc0c-fe05-20d19353c214@linaro.org>
Date: Sun, 27 Nov 2022 21:50:59 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 09:54, Binbin Zhou wrote:
> Add device tree bindings for the i2c controller on the Loongson-2K Soc
> or Loongosn LS7A bridge.
> 

...


> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c@1fe21000 {
> +        compatible = "loongson,ls2k-i2c";
> +        reg = <0 0x1fe21000 0 0x8>;

Plus what the Rob's robot told you - code testing examples uses 1 for
address/size cells.

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

