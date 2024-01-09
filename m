Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006C39AED
	for <loongarch@lists.linux.dev>; Tue,  9 Jan 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMf9YBTa"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3367632ce7bso2482126f8f.2
        for <loongarch@lists.linux.dev>; Tue, 09 Jan 2024 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704813235; x=1705418035; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SZuXHOPPcvY7/ll3qQazlh81180DUWQsNBi9rScVfI=;
        b=RMf9YBTa7r7A+V4w0QcdCweedLBuQpPA/elCI+UoOpOX5WIpCnFmI1XKmfpS9w+p3h
         mms5cjJlo8yePXHs8XsfdLozHtUAuG2UFlXZD2DF1X7hDSgr8BV6bPm53SduakHCrBJ1
         sGM5PKJRx/N9zobvtSvSe+qKCLAgdZlahGoRbKbqIaS+1/3MFl3ZTwTOBuPTu/cwdYKf
         C1A/cYdE60oQh3j1Vv6Ig1SGogAXKlFcrr644Bo74VfGq3IvUtS1Cc1d25iecN7d/DRN
         I2z2BEloWWcXi4tuyGNs4drflKthV7+6YPY+oBbyTo+9NDahzvUbLvBaM4uHpqdbQ7gV
         h/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704813235; x=1705418035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SZuXHOPPcvY7/ll3qQazlh81180DUWQsNBi9rScVfI=;
        b=GEGPIhtxTCd9J90rZ+PplTmFtVODSo8DqmaRp1t91+EuUTm945feXLGQfanFAJ3PB7
         L07V1UiSkgufIAt00omY8TwAR0bY3gRQsD8WYBouSoHRuoKZJa9cSPNkhb16hAt0qtZq
         DB7tAHb16Bmdp07aQgcWo4jivyqbP+P0JqsqRLuW1SDBG/+5rAr8n3ztQHp3BecA85H/
         tWtvToU+JUV9nuT1dnSY4OH5jG91u+Dd4IPmjAddZqZLBoJs3DCIXo142WFLL3zGm6PJ
         LdgJLsTRqqZHqonR1+SHDuOg2k0zZdSpD9oAOhT7v0+jSHeBMxO4ojbDWc+cCY1bfuv4
         XSVA==
X-Gm-Message-State: AOJu0YwpDnVDGdGxLRo6xNylCsi9LQUzOhlOL5Phfi7MN2jC1r+RIkDJ
	wrD2n0/Or9Dt0si/O92Ac25mxgF0q8lCuQ==
X-Google-Smtp-Source: AGHT+IGk6taFeqHGo82gT2wB6EMgesAjpGTMz0A4JUfG1nbS39QMz7oFwZLowQly0c58ZYhfwOgWMQ==
X-Received: by 2002:a5d:6304:0:b0:337:6e99:7404 with SMTP id i4-20020a5d6304000000b003376e997404mr568633wru.143.1704813235499;
        Tue, 09 Jan 2024 07:13:55 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600004d000b003367ff4aadasm2653977wri.31.2024.01.09.07.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 07:13:54 -0800 (PST)
Message-ID: <a1ab57e5-5321-4232-a661-9940f99adcf7@linaro.org>
Date: Tue, 9 Jan 2024 16:13:52 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] LoongArch: Add built-in dtb support
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubb.aaron@gmail.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1703229766.git.zhoubinbin@loongson.cn>
 <20231222-support-relieve-5d8f25292b40@spud>
 <CAMpQs4+Uwu=j56Qa_V211_hC+F4MKE6mvTVtW75M1wuAY3-p1g@mail.gmail.com>
 <20231228-ultimatum-paramedic-6c0301f56d1c@spud>
 <CAAhV-H6O_Ke-xJPGFmgdwNVbGkDS2P6EK3ecfgo9KkkNyi9eOg@mail.gmail.com>
 <CAAhV-H5aZc2sWhodA0+V9aWBUoD0oD4tQHiqDSyg2B-iuHDA9g@mail.gmail.com>
 <a51aec3f-3f1b-4e8a-bfaa-904ef2a79c64@linaro.org>
 <CAAhV-H7QQD9ida52rvkhUgzU6O1KmKD7EsNxn=7YyVZP4HXa=Q@mail.gmail.com>
 <194f95be-59f2-4c71-8642-80e5ced9bf6b@linaro.org>
 <CAAhV-H6qNRHmPe64P7sy14iv0m4qxyM4iwk1EmrQe6-4WE0GYQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAAhV-H6qNRHmPe64P7sy14iv0m4qxyM4iwk1EmrQe6-4WE0GYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2024 16:02, Huacai Chen wrote:
>>>>> Applied to loongarch-next, thanks.
>>>>>
>>>>
>>>> It's merge window, why do you apply patches? For which cycle?
>>> I'm sorry I forgot to reply to the email when I applied patches, the
>>> patches have already been pulled in linux-next some days before.
>>
>> Really? I cannot find them on next-20240108, so what happened?
> Hmm, I applied patches two days ago, and they were only pulled in next-20240109.

Two days ago is weekend, so basically one day ago and definitely not
"some days before".

Anyway two days ago merge window started, so it means you applied them
during the merge window or immediately before. That's not good. Patches
should be in linux-next BEFORE.

> 
>>
>> Are you aware that patches should be in next for "few next cycles"
>> minimum (which means few days or even a week)?
> Thank you for your reminder, when I sent my first PR, my mentor had
> already told me this. So I will wait until next week to send PR for
> this series.

In the future, please be sure that all your patches for next PR are for
several days in your for-next branch, thus at least for few linux-next
cycles.


Best regards,
Krzysztof

