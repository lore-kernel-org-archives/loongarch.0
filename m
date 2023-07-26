Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B50A92B
	for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 11:11:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bc0da5684so98333466b.0
        for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690369878; x=1690974678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+UY5aLC+dC/ndM3p8qV+XcIRwaYtKhRxbIV9WFyvcU=;
        b=z4it2c3JFnu+LBMwOMT8UHYA3Qmg6TdUV3x9kFC4mFuyZuwZ0p2axey6WCw2WHsh4y
         8FFzUxOn7Ru0s4iz+xZgEeZN0MJew8T76QYKd34/I07L0FbygTzB5d+LYL7x4bujwtzQ
         Yu6m2Ftjn06vOv9o6olODTidyokwNTEyHtJvpXu6b8QW1MjGlTOS3wojuc3DlzjsTsw0
         UgRT1i/uXI90UAIgoW8erQV43FmemU9nf5iUSyeZerP91wRmpM6JqEj7GURr1z21TJFA
         44A4QqsymC4RMkSuUDphx7+NcqZ7asaZUZCqbyGFH3JTAfR7u8f8r21G6oQ89VkrzthK
         MN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690369878; x=1690974678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+UY5aLC+dC/ndM3p8qV+XcIRwaYtKhRxbIV9WFyvcU=;
        b=IjuNt3UJlZz1o/Zm/jFsmXXGPURe9swvZdiVH9LzPnFwigVB7JnDNHO+GEK9HQ8MMb
         WM1AEnbUCtYScZIokoqde4Sg+0sQRAVRSy9TfE1gBYegzuUkUjB/gflUhVT/XfesigsW
         VkkWK41gT2QOphK5TPpu4c7YqsDPJIhTAWs/h2awfj5nJPXdzgIZ9NEShD0FnFzkxmdS
         EFkx6/YQwWmNKRtpABFZzWcXIwqbfP/o/jjPjdSVRxCMPY7bEpbNDf9TcgDaO2MC5Laq
         ldt86JagtSnsDOv9pISq+YssFFp2SGfqR0R9CKn4yCiVBuQScbtrbGJROz57BRYMm+EK
         zlqQ==
X-Gm-Message-State: ABy/qLaHriW0/V28wII7cs5UclaIuU+DU2GaO+/dFl26ESH0QVBFthoQ
	UUlxiGUTcdeH83CETgTFtB6/yw==
X-Google-Smtp-Source: APBJJlH0DR6qoWo2zM+56h1wbrR4G3XZE9wCgfCy3Yer0np7E+K0OKdn6yOkRHJjv/ZGfjXNTfmpNw==
X-Received: by 2002:a17:906:77db:b0:993:e9b8:90f5 with SMTP id m27-20020a17090677db00b00993e9b890f5mr1282347ejn.8.1690369878658;
        Wed, 26 Jul 2023 04:11:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id fy17-20020a170906b7d100b009931a3adf64sm9665454ejb.17.2023.07.26.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 04:11:18 -0700 (PDT)
Message-ID: <30caa2df-4cfc-761e-759f-039e4ff858dd@linaro.org>
Date: Wed, 26 Jul 2023 13:11:16 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: loongson: drop of_match_ptr for OF device id
To: YingKun Meng <mengyingkun@loongson.cn>, broonie@kernel.org,
 lgirdwood@gmail.com
Cc: xry111@xry111.site, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn,
 kernel test robot <lkp@intel.com>
References: <20230726110516.703342-1-mengyingkun@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726110516.703342-1-mengyingkun@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2023 13:05, YingKun Meng wrote:
> The ASoC Sound Card driver can be compile tested with !CONFIG_OF
> making 'loongson_asoc_dt_ids' unused:
> 
> sound/soc/loongson/loongson_card.c:200:34: warning: unused variable 'loongson_asoc_dt_ids' [-Wunused-const-variable]
> 
> As krzysztof advice, we drop of_match_ptr so the device id
> can also be used on ACPI.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307242008.xqdjgk04-lkp@intel.com
> Fixes: d24028606e76 ("ASoC: loongson: Add Loongson ASoC Sound Card Support")
> Signed-off-by: YingKun Meng <mengyingkun@loongson.cn>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

