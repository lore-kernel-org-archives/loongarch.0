Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F999185F
	for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 12:33:03 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 8so10555232qka.1
        for <loongarch@lists.linux.dev>; Wed, 19 Oct 2022 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PX18bToPOnvPyqbrZjvQaY5SwM0Ct0C5YKtPYXd9P9I=;
        b=rDQlZYT8SxjtV9ek3IiNUMnGCGrzvBJ5gDbOz/qnFZG3R7+MMCdF+PMSptg2eRMo4u
         nzp/fwAnNuann98pfuxf5pH79MDwO3LWITubYsb96DyVH63Qb9HGA4Quwu9qNTnwx1jn
         ZHmKhb1pfGWidPIt+8mZxniT5ZZULzEafvm97ZLlDT+S0wFGnpakbjDfCsv1cQ2LHz45
         IsYePLwOZjjX98oJ7rSpH51fMipB+mUf5r7VsQfYL+ebgW1NZnvA0LepBhhFU8kKvEmj
         Unv8W+pWDDwuoWro1a4LJ5w0DpcVXzDfKO18vnLF9v1cOyWECZmO5RWGrobvAosNgkKI
         njfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PX18bToPOnvPyqbrZjvQaY5SwM0Ct0C5YKtPYXd9P9I=;
        b=JNFuI4a6uT6CxIWmog6A2JuLv526A+ucJK6HRSBrTu1YPZxlqd27gGB8W9WMNYXBl2
         WjzvDKhrvn3q3qUOn3ODA3SdyaLCa/DgndmNPBjLZLgY/+pJzt5GWeRRuHCpncir8IVo
         9Dfmj1iojr6ow713+WKbrkcc0vCMPEAQjTiS0qq73wU5Am6DML10CIKm1/sVStaEIJi9
         XrAO2DP5HXzjH5b/+pNl2+dSZZ4nCBq5SeoDC9kCKpYBuw7eDlsZnhdBDXaG0AoYr5X8
         pknLO/W86sTZFQ+/WQKacdfWIltBeI6i2z0SAwUytTMMGCgx6fn/gKlgx5wKX34MkJ/Y
         Bx/w==
X-Gm-Message-State: ACrzQf3fW85jfiCSOEMUIjYsoMa2uI0n1rNYZ4yXadMnR77NULcmspsq
	7/nA1mAfSAEYCyZvfQZxQ2fuVA==
X-Google-Smtp-Source: AMsMyM5Fh/5Xj6uqwhE3SfgD49hweT3z6vUVN1Wqv0vpArs/K2txN9tLrVzgrE5g2C4WhAlRwY85Ew==
X-Received: by 2002:a05:620a:2627:b0:6b9:1b05:7b9 with SMTP id z39-20020a05620a262700b006b91b0507b9mr5334977qko.776.1666182782282;
        Wed, 19 Oct 2022 05:33:02 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id t6-20020a05620a450600b006e8f8ca8287sm4712954qkp.120.2022.10.19.05.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 05:33:01 -0700 (PDT)
Message-ID: <b035a095-f8d6-1951-67a0-e2c1f1d18492@linaro.org>
Date: Wed, 19 Oct 2022 08:33:00 -0400
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
References: <20221019035117.29352-1-zhuyinbo@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019035117.29352-1-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2022 23:51, Yinbo Zhu wrote:
> This file defines all loongson2 soc clock indexes, it should be
> included in the device tree in which there's device using the
> clocks.
> 
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

You sent the patchset twice. It's confusing and might cause review to be
missed.

Send a v3, including my review. Send it only once.

Best regards,
Krzysztof

