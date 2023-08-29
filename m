Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD910EC
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 06:28:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bf3f59905so511759466b.3
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693290524; x=1693895324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rk5O5cxE3H0kwoH1WMJzLdh2Fpjs5TVwpzODQP6Z++M=;
        b=QqICDRIUDF1jyEERa8At+Vs3w+GMlzAd48wUa/b79coZ3jsDfVTjDRQmjrGUN5TIsd
         IxRW0xdPGhE+0BuYHu1AernHobQeJfWYbYarMI2G1lFyyEpz9qDUz01T9nldsCFtLu5A
         Hw/kY+K8xF4MphaMHmN+eTIbTZDGn6CB6fyizcbrty1sqQKlp4g/P+vZ+C1lz4c0NGsp
         PfeRNUCy80y18ff2Lk+5rFfly7ACiAFVm6e07u1VAmaWScdQ+dTaKZabgq98xitKrQtu
         OzOzhaxVJ4KIJZMtercxdY/dckhP+qs5rp4G3Cp7B/XPqn27dKkBSoK0js4RYRMP6U1O
         R9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290524; x=1693895324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rk5O5cxE3H0kwoH1WMJzLdh2Fpjs5TVwpzODQP6Z++M=;
        b=NNZp41nQ1MJNrMFbOTA+LBq0LHWFOeSL4k4MJ2gjgF2p1ol/yC3qvdxluffJKeAdJc
         jxiFRLLIrtTWOslMBFwdPBSpV62U/vSaY1polj4wT62dqLnK+uSwCy8GBegsWhKJD7ET
         cY6tTKf0lZcGtyCjt7WPJccGrOIm7CjX4eU2zsE56n7aFyYijXSTWTnzOnNM6vDwcCk8
         TldKHlHEU4wYJtpN9MrQwwN1nznNyTG+E7xxqcnX7drTv1+Cnu37dK7zPozjqZfF0nNG
         5yFP7cEzGRv4VZFD0ehl4ZEjFwKToiJ2EqJbwgnTnVgcVVU9J0QW3oI9musp+Ze3I9XV
         dhZA==
X-Gm-Message-State: AOJu0YzsvT/IHlBTgV2TMxHfZoH4L16OH9LHmykcEUix1h4n1HuK5bwj
	SS9qoqJaJPLhdCBmVAlndTErFQ==
X-Google-Smtp-Source: AGHT+IFLXFOGO7lW2CrMpZOyjDWN+69cmgGskpd1u+5hxqW7nLvyH3fWdwwRExeQ8+sQRCgE6jKjdg==
X-Received: by 2002:a17:907:c20d:b0:9a5:c919:55cb with SMTP id ti13-20020a170907c20d00b009a5c91955cbmr826089ejc.73.1693290524597;
        Mon, 28 Aug 2023 23:28:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm5563521ejb.96.2023.08.28.23.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:28:44 -0700 (PDT)
Message-ID: <256bfc91-31da-c3c8-7b9b-610bb4a73038@linaro.org>
Date: Tue, 29 Aug 2023 08:28:42 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/5] soc: loongson: loongson_pm2: Add missing compatible
 for Loongson-2K2000
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
 <8468bdbea87003dc05bd10d15b51e6d27f306a20.1693218539.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8468bdbea87003dc05bd10d15b51e6d27f306a20.1693218539.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 14:38, Binbin Zhou wrote:
> Add compatible for Loongson-2K2000, which also has the Loongson2
> Power Management Unit system controller.
> 
> This is a missing compatible, now we add it.

How is it missing? Was support for it added before but not complete?



Best regards,
Krzysztof

