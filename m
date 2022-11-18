Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A320FD
	for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 12:40:22 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id u2so6632184ljl.3
        for <loongarch@lists.linux.dev>; Fri, 18 Nov 2022 04:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zLTYsXHR/2HWPYQijXGBO91u/5WmcoUCXMlBqcrLxE=;
        b=NqmKwrLbeZtYmWVypNV9cw9sVY8Uh0yA6ockCssS1ZW75SofXF8qdOtqUfQMry96sv
         leC+y7V2WvnDfbLwbzkDg7ztJnrcxoL4uCBqz+kxduqpJev0UsmRsmKTtJ9uTfZI9HXe
         6zoekzQEulbmlkQb6I2l43uKgmjdGK4lDzGm75xdRNxTrnernduIDMEE2W3BQy7JUDF4
         4KY2uWtn4Q7DhPosMCKq3qvVUYy5nzDYvyP/NkGaDRz9OcXUyjkWGey6hlmY4/nsv/3m
         EaV2eXIkvpidckVPkoycILrmEh/Xdsx10yTDgRgIYEAeYBmWToOrGwFcCFJZ2NvHTNrS
         v3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zLTYsXHR/2HWPYQijXGBO91u/5WmcoUCXMlBqcrLxE=;
        b=4EWNyNmAUZaYEhL9K3t6//FX9VIHI5iV4eQI1qUBZvuBw7PJiffvKxz0ILFe/A34Kq
         JPAAld22haNrSYZ4Z+TbPtrIEWW+MH5/Y5+yydb/TXJAwujipbcCQyJyV2Di/PXKEyO5
         OR93mf9EukzUIbZ+1oCxddOBKAwoLBUSFkEuDCnyliy0kuMmJJnDsfFMdsimnaKOJ4a/
         4TFgYgltXT/iKLVOkEpWdwQQDe1qE8RTVb4+th3RwgroCdnsprsk1IVIGQHJFYKVFX4Y
         UGxeCUne/6QY5IZpuCvCaO/WBDxBSEOZTIRrf27283jYQZRfbSLXooq8EX0cjOhaZXJe
         X5Nw==
X-Gm-Message-State: ANoB5plj/JfX6c5KQfBH7MIieOSmUmUY68vPh9NUCW82dO/712Ujfkg7
	qT3uhNdUO6cd1V0Kt2vvIcZoRQ==
X-Google-Smtp-Source: AA0mqf6JHaqd3SdG/FMh7z7NgcZ5t7HsgeEP1/ln5CmlzAKzsWOfgilv2P8o79vy350QVlD7csdD3g==
X-Received: by 2002:a2e:b10c:0:b0:26f:bd6e:7f7f with SMTP id p12-20020a2eb10c000000b0026fbd6e7f7fmr2456769ljl.87.1668775219007;
        Fri, 18 Nov 2022 04:40:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651c10ab00b002793cf0e9e8sm48983ljn.122.2022.11.18.04.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:40:18 -0800 (PST)
Message-ID: <13c5292b-4f04-0f85-98a2-bf4b5265b567@linaro.org>
Date: Fri, 18 Nov 2022 13:40:16 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: add loongson series gpio
Content-Language: en-US
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>
References: <20221114095332.21079-1-zhuyinbo@loongson.cn>
 <20221114095332.21079-2-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114095332.21079-2-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2022 10:53, Yinbo Zhu wrote:
> Add the Loongson series gpio binding with DT schema format using
> json-schema.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

