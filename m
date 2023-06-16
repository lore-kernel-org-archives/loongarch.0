Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2733ED
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 10:04:48 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9829b12b80fso72460466b.2
        for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909887; x=1689501887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYBJJFpgemmy6W4txbxWomnmBYNEc2Pci2rgkT0U7hg=;
        b=WeM4PckhJwPQ1923kkK/m24dg7JziG6V4ajokijrPIYQHuZp5fTGYVsti5xHtHMZbE
         OjRnMw4ofWUHcGbWQbNu10iJrQVNfgAaEnCAHvAs/ZTPLLiYgzlcURrMAUgsRyyiKq5z
         yi/gkplSCNfDeiFqKmzghI7XGH19x5qWCpCIeZkx8HAGV5PvMPHr8uE9tltyhabd0lAe
         pSf9WZ82qoRpGkZZnsAGG4qs0g73oT1uIN5kSmb5qqQMWRzDJ5ArvsJLwKSjWQfwxhC1
         YYKkr4heeFlGCIK3ck0mukJh4avG2R51W+EqtmzLSKgGrohcL8F5xhSm8hKse0auGsxO
         r1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909887; x=1689501887;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYBJJFpgemmy6W4txbxWomnmBYNEc2Pci2rgkT0U7hg=;
        b=bs/HE5akW3gtNQbcyUzkRXNSKK7FObAjmDWAH12NUSTZP/kyNw2taI/yVEQxrFfhZW
         RC3ck76zKjFU8289EgZA3apMQ6KR4ZpUnw54j00jFsJVdcE3TyeC+Fd17p3DW/VIo1ln
         wP+RDd44TIr88SZAspsS9MSDm+EE/3tpmVWa9cWV+tDQ8Xt6x3twDZi1HvdQiKx4VAKM
         1RECqzgKUHYzlxZRtk4CwpWAR4X+P9ywMqVHiUD0rjB2w3PEMlqAGfmbtVkqCJ85USIF
         OF+Fn/AHJybxoM4sLCV8nLrtMcbw7n3cLCPof45d2qf7ZP1/TyGEheJvDqKyBmbpXqEg
         IKfQ==
X-Gm-Message-State: AC+VfDzAlN8bwgxj2F0rrvLsYHLQe8f5DROtJwspyUxKnTCxQca+IcM6
	bkO+//V9U1Ug60LtPQYCfgAfpg==
X-Google-Smtp-Source: ACHHUZ4rcmI11g1mhDGNXV6YANHaooS38LFWir880NILrYi+St8Lb9fV6/jlWjeoYYiY2HdPxS6i2w==
X-Received: by 2002:a17:907:86ab:b0:973:a30d:b264 with SMTP id qa43-20020a17090786ab00b00973a30db264mr1281273ejc.46.1686909887022;
        Fri, 16 Jun 2023 03:04:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906355000b00982943c7892sm2383714eja.134.2023.06.16.03.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 03:04:46 -0700 (PDT)
Message-ID: <ca49f782-7e5f-5203-c981-e601eb2ff4c5@linaro.org>
Date: Fri, 16 Jun 2023 12:04:40 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/6] LoongArch: DeviceTree for Loongson-2K0500
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c7087046a725e7a2cfde788185112c150e216f1b.1686882123.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c7087046a725e7a2cfde788185112c150e216f1b.1686882123.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2023 08:10, Binbin Zhou wrote:
> Add DeviceTree file for Loongson-2K0500 processor, which integrates one
> 64-bit dual emission superscalar LA264 processor core.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---


> +
> +		pixi2c@1ff4a800 {
> +			compatible = "loongson,ls2k-i2c";
> +			reg = <0 0x1ff4a800 0 0x0800>;
> +			interrupt-parent = <&eiointc>;
> +			interrupts = <19>;
> +			status = "disabled";
> +		};
> +
> +		pmc: acpi@1ff6c000 {
> +			compatible = "syscon";

One more - this is not allowed and clear NAK.

Best regards,
Krzysztof

