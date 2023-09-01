Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775C08BF8
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 09:06:55 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-99c1c66876aso207627166b.2
        for <loongarch@lists.linux.dev>; Fri, 01 Sep 2023 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693559213; x=1694164013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL2wZFAQ9DQMYKYYGQQIGah4zjC0ig67LMgG+Wt4f1Y=;
        b=Owrq8KdMZLFSt2/eHynA16kmvXYtOJEpHJfTok8ri4wniyV3bvINQf4rOhcI1mruwv
         40fl6aCSEjb5kfnTJazP8/YqkHlbHx/af/yoz/p7SaxAItYPc1M+icmt7JnsYOhgfUEJ
         Dhf4kWsvyO/MWIAYOZT62hnTa85r82QbayuiMkSL+vkm1OmkcWEkNVSyzwxKnAAuNCU7
         Pj8mOHp6cP5yU7UL+GadSl1yPfudLcjBmgF7woMSFRjMw1/sMb5kMf83Ck+Yd9yPq/tQ
         JeRC2c05C7TOE57FuPOySIWsYJX5yOkIxWp2AQMhPY/QhxpedCJKM3QJODaMr2KIhkON
         p3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693559213; x=1694164013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL2wZFAQ9DQMYKYYGQQIGah4zjC0ig67LMgG+Wt4f1Y=;
        b=Gx/5ipw99WyCbXJTgu2V2gxitIwWzhlA4ZI3bA/fq9D+WZlCAt7lWqqmHD5wTejKOF
         Gm1KkeY2vhcPItae235j+luivZsoRJ35hIrbMljwo/G/VvEgI6tVr+HQHzZk7sol48I8
         uMV2/FdTE9fYgw7G0il6DduTwNtucP7k9CokJ8rzU3uRLsF45BUyQc5CVdxsc1g5k/hE
         k4zsQFrnBKKYAOxFgfCChRdkAbSOdGTq++f/uM7i9QpXliYgbIhSfbhKxw3F89PQZOMN
         BkEu9ArwmCRsf1CuNQtqlvL6HZXZM6zCjkfUedM7hk70vkdoE9WD9tOO/MCMiNhKB6ns
         AfjQ==
X-Gm-Message-State: AOJu0Yz4E0QCz2Kmxwlk424oU5y5TlEIMtad9kFkcybxvJXRe8enLUhz
	WX5Rxo9V2OoIWp3TVKuF4VpTcQ==
X-Google-Smtp-Source: AGHT+IFgycuMFi2b9nbCWqWNuNSEcE07Zi45QXIvtjzYup3K8uPK4QvdgSYexfoBzJlc6i5xrD3o3g==
X-Received: by 2002:a17:907:75fa:b0:9a5:7ade:b5e8 with SMTP id jz26-20020a17090775fa00b009a57adeb5e8mr1170613ejc.10.1693559213457;
        Fri, 01 Sep 2023 02:06:53 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b009920a690cd9sm1727779ejb.59.2023.09.01.02.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 02:06:52 -0700 (PDT)
Message-ID: <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
Date: Fri, 1 Sep 2023 11:06:51 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 soc@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 13:43, Binbin Zhou wrote:
>  required:
>    - compatible
>    - reg
> @@ -54,4 +66,18 @@ examples:
>          interrupt-parent = <&liointc1>;
>          interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>          loongson,suspend-address = <0x0 0x1c000500>;
> +
> +        syscon-reboot {
> +            compatible = "syscon-reboot";
> +            offset = <0x30>;
> +            mask = <0x1>;
> +        };
> +
> +        syscon-poweroff {
> +            compatible = "syscon-poweroff";
> +            regmap = <&pmc>;

???

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

