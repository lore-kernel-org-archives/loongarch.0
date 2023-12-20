Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F720B03
	for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hh3OaVV3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33674f60184so1485344f8f.1
        for <loongarch@lists.linux.dev>; Wed, 20 Dec 2023 02:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703068174; x=1703672974; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4rwLB+kXN5q0CC/jT9rfMkl23cOP2H+44syY5vBs5A=;
        b=Hh3OaVV3K68EDOYCat9d+ZAZ7/75Kc2w329+EHn7dpSHlsb6hvCm0iTsKwk0u48ILE
         J95tQO7m0tG0IflkLn4/PTXns5yd/xaxm3mtrrAYgkdSAOfOj/64LdvZCz/yISghSQ7+
         YHdvzdLqVFeuCpTQJ17am6rsbKmP1p+IevCq+fuCAJQ8LDZQHiVn99HaF1d+LBQoV5iB
         EQQePIoBrdKgGWbigiC9EDVMSmbRfbdcAB9h8dRyqIHUvuDtNEmzZHqRHfHgwMjmZOyw
         eTSAHrf4kGCjeLH0r8cGd2DAoxi2zDXp9NDS99kpVB6oogNK7ZEWPe9WIVe5q69bnGd+
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068174; x=1703672974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4rwLB+kXN5q0CC/jT9rfMkl23cOP2H+44syY5vBs5A=;
        b=gt4kW5lCvP/U2CGCiVLM2jUjMAjWkV6h648NaRpUyx1SuYEyA35eFAnZzxKevShsoz
         lmZWQtV9OZ8btef3ItFIrRMHntzq51dqvjK/xtHZhSRZ5NlXq8M67Ks7PpKb398lSmSN
         gAUwtYu9OMpmm0UHgQ2xCqZSvASAjHwIKltXuJA8ltTYlE5pCVwJd0MJf7F29OQqoRos
         mJYrH7KJ0am33i6gdWRvNnEq1rbHwkWejD0KHY0v9L3TKiG3xq4InE3k7RgzxXEBnBVP
         MB3nm/h/4wb4ROVdFMF4W4eh+TjHpFgkerSVl7HnDag2AiiuTXcJypDnkuPZOSiyKbmC
         O4+g==
X-Gm-Message-State: AOJu0Yx1rtGS3zL4sYMWKpeq66gJ9pdGiKbe4d0RywTHufWrqCce8ysx
	bthkjGaLAtyKUttbauCp0hBfVQ==
X-Google-Smtp-Source: AGHT+IGCe/qLsEP05ubIPKkwycUpvxs7WinK3FMiAzA0PsKhXahfgf9qy0JppPim/gRxQemuKCzFlQ==
X-Received: by 2002:a5d:63cc:0:b0:336:7357:acc5 with SMTP id c12-20020a5d63cc000000b003367357acc5mr1229235wrw.73.1703068173978;
        Wed, 20 Dec 2023 02:29:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5307000000b0033667c94839sm8004797wrv.61.2023.12.20.02.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 02:29:33 -0800 (PST)
Message-ID: <7309da41-93f5-4358-9630-a075da03f66b@linaro.org>
Date: Wed, 20 Dec 2023 11:29:31 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] LoongArch: dts: DeviceTree for Loongson-2K0500
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1702862778.git.zhoubinbin@loongson.cn>
 <303e56cb6e5f82623babe18b095069b330cd37da.1702862778.git.zhoubinbin@loongson.cn>
 <aa9cec3e-ee58-4d52-a8ec-d696e3ff70ca@linaro.org>
 <CAMpQs4+2kjNZMHu1+7MvDNFdCgY8bpF2kQTru-ZHSf8RceiP_A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMpQs4+2kjNZMHu1+7MvDNFdCgY8bpF2kQTru-ZHSf8RceiP_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2023 10:17, Binbin Zhou wrote:
> On Tue, Dec 19, 2023 at 9:37 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 18/12/2023 02:52, Binbin Zhou wrote:
>>> Add DeviceTree file for Loongson-2K0500 processor, which integrates one
>>> 64-bit dual emission superscalar LA264 processor core.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>  arch/loongarch/boot/dts/Makefile              |   2 +
>>>  .../boot/dts/loongson-2k0500-ref.dts          |  89 ++++++
>>>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 274 ++++++++++++++++++
>>>  3 files changed, 365 insertions(+)
>>>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500-ref.dts
>>>  create mode 100644 arch/loongarch/boot/dts/loongson-2k0500.dtsi
>>>
>>> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
>>> index 1e24cdb5180a..aa0b21d73d4e 100644
>>> --- a/arch/loongarch/boot/dts/Makefile
>>> +++ b/arch/loongarch/boot/dts/Makefile
>>> @@ -1,3 +1,5 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>
>>> +dtb-$(CONFIG_MACH_LOONGSON64)        = loongson-2k0500-ref.dtb
>>> +
>>>  obj-$(CONFIG_BUILTIN_DTB)    += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
>>> diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
>>> new file mode 100644
>>> index 000000000000..52483127a419
>>> --- /dev/null
>>> +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
>>> @@ -0,0 +1,89 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "loongson-2k0500.dtsi"
>>> +
>>> +/ {
>>> +     compatible = "loongson,ls2k0500-ref", "loongson,ls2k0500";
>>> +     model = "Loongson-2K0500 Reference Board";
>>> +
>>> +     aliases {
>>> +             ethernet0 = &gmac0;
>>> +             ethernet1 = &gmac1;
>>> +             serial0 = &uart0;
>>> +     };
>>> +
>>> +     chosen {
>>> +             stdout-path = "serial0:115200n8";
>>> +             bootargs = "console=ttyS0,115200";
>>
>> You received here comments already:
>> https://lore.kernel.org/all/3543cbf9-d259-8d0f-e78e-d8d5e3f501de@linaro.org/
>>
>> Don't waste our time to re-review the same mistakes over and over again.
>>
>>
> Hi Krzysztof:
> 
> I am sorry for this, I misunderstood before that `earlycon` is not allowed.
> BTW, is there a note about not using the `bootargs` attribute? I
> didn't find it in the Documentation.

This is a common sense, not a "note". If you think otherwise, please
provide me the reasons why duplicated information is necessary in this
particular case.

> 
>>
>> ...
>>
>>> +
>>> +             i2c@1ff4a800 {
>>> +                     compatible = "loongson,ls2k-i2c";
>>> +                     reg = <0x0 0x1ff4a800 0x0 0x0800>;
>>> +                     interrupt-parent = <&eiointc>;
>>> +                     interrupts = <19>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>> +             pmc: power-management@1ff6c000 {
>>> +                     compatible = "loongson,ls2k0500-pmc", "syscon";
>>
>> It does not look like you tested the DTS against bindings. Please run
>> `make dtbs_check W=1` (see
>> Documentation/devicetree/bindings/writing-schema.rst or
>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
>> for instructions).
> 
> Emm...
> Here is the compatible description from the latest kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml#n13
> 
> I think this compatible should be fine, also, I ensure that `make
> dtbs_check W=1` is fine before committing.

Hm, that's fine then.

Best regards,
Krzysztof

