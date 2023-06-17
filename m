Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93B6122
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 07:15:17 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-519c0ad1223so1963001a12.0
        for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686986116; x=1689578116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nv079PwSDx5Qjn48gGeMYGtp2X8BMlgLzerQPmDR5LU=;
        b=RSbQZEZFGuZ5r45XsssWGjfFZCE6MPC/VuHIuur6EfwZ7Gt6jY+TGqrAUA00wSgzJf
         mkvmne0R07+SSURIehBpSWH+lz2L+FUt5dm9e4I/vjeRwtuoVHxmzWOITS5kfB7E1wW9
         vIRTa/qTjJXXfgmL37kAZo+uraTZc6H76bWvLLzRJpSdHRCdDoUj0WjWCMOazbyAI/p2
         W68QvydiDWbYv4OPFGwa0iw/rvO6fXTliPx2kM3AyFjLRoWgZkhUegFzgxXy76XED3V3
         eqD8BcFjr/EvVQmb6RK88l0h+SU57M+1xrJRxY3TDluBxz0papFhB3Fv91mn1Z4+DcqH
         BuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686986116; x=1689578116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nv079PwSDx5Qjn48gGeMYGtp2X8BMlgLzerQPmDR5LU=;
        b=DVYx+izcZ2ghYNMTmqWhtA4w/47CbBm8dZMhcRKEUAuYQJ2OkqGJJXalISNNqdEtnF
         eQ/Z+1+Fk9tk+OoMLq1J8WBbbHUkN/QbepUnZMgwMvKXNEK7PrVjRJqZGHwnWmP1DTf6
         4lViZF/sL0avz6fBcKzpW4+vbYJXegZdFrzoGGWaQNZgLGtL/OEaYGD5pVU63ObRq6b8
         RW27iucnr0MSBbYcfP+F+LKN2dvi0TyBRjUDDx3//y2Mo8W84jfbxzEdh+v/pJ9BO23h
         M+HynrYvp7GO/yMPf8B9AGHP0vY1CwXe2zxhvaAdfdXVgSTOtw9R3WljLDHjot92fJyU
         P7hg==
X-Gm-Message-State: AC+VfDyaSNbHBl/nqAJQ4fNHFpJELKlDajZtOmSOXJGSCoZDfRakZDcc
	xSBVu0nuQTtLjrTaJzuzNooBQg==
X-Google-Smtp-Source: ACHHUZ7i1+uGK10quNG5gGL8cY74t/gEKzCHFIRi3MAorDFNUNSYKKLaeCOXAZ6g5jz/Icc/uMGXhw==
X-Received: by 2002:a17:907:1b0b:b0:978:90cc:bf73 with SMTP id mp11-20020a1709071b0b00b0097890ccbf73mr3364967ejc.48.1686986116122;
        Sat, 17 Jun 2023 00:15:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lx15-20020a170906af0f00b009837806ae2fsm2158177ejb.78.2023.06.17.00.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 00:15:15 -0700 (PDT)
Message-ID: <a0e0e3d7-8e9d-3ebd-e57e-5f99255b1afb@linaro.org>
Date: Sat, 17 Jun 2023 09:15:10 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/6] dt-bindings: loongarch: Add CPU bindings for
 LoongArch
Content-Language: en-US
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
References: <cover.1686882123.git.zhoubinbin@loongson.cn>
 <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn>
 <6bfd273e-d7e8-8447-f7e7-ebda33092337@linaro.org>
 <CAMpQs4JiyGk+qTyv6Bbnn-P++5FTxdhBNBOa+FcxNVm0j0-9tg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMpQs4JiyGk+qTyv6Bbnn-P++5FTxdhBNBOa+FcxNVm0j0-9tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2023 08:31, Binbin Zhou wrote:
> On Fri, Jun 16, 2023 at 5:51 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/06/2023 08:10, Binbin Zhou wrote:
>>> Add the available CPUs in LoongArch binding with DT schema format using
>>> json-schema.
>>>
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>  .../devicetree/bindings/loongarch/cpus.yaml   | 65 +++++++++++++++++++
>>>  1 file changed, 65 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/loongarch/cpus.yaml b/Documentation/devicetree/bindings/loongarch/cpus.yaml
>>> new file mode 100644
>>> index 000000000000..c3e2dba42c81
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/loongarch/cpus.yaml
>>> @@ -0,0 +1,65 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/loongarch/cpus.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: LoongArch CPUs
>>> +
>>> +maintainers:
>>> +  - Binbin Zhou <zhoubinbin@loongson.cn>
>>> +
>>> +description:
>>> +  The device tree allows to describe the layout of CPUs in a system through
>>> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
>>> +  defining properties for every CPU.
>>
>> I understand you copied it from ARM, but I would prefer to have here
>> something meaningful. Bindings description does not explain what is DTS,
>> but explains what the hardware is.
> 
> Hi Krzysztof:
> 
> I am very sorry, this is my problem and I will rewrite this part.
> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - loongson,la264
>>> +      - loongson,la364
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  device_type: true
>>> +
>>> +  clock-frequency:
>>> +    description: The frequency of cpu in Hz.
>>> +
>>> +  model:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: User-visible cpu name in /proc/cpuinfo.
>>
>> First, aren't you mixing nodes?
>> Second, it is derived from compatible, so no need for such property.
> 
> Well, this attribute is an attempt to tweak it.
> 
> As the description says, this attribute was added to show the model
> name in /proc/cpuinfo. here, we will show the custom name instead of
> using the cpu core name directly.

DTS is not some translation layer. You can decode compatible and put
into /proc/cpuinfo whatever you wish.

> 
> For example, on a Loongson-3A5000 machine, although its cpu core is
> la464, we can see:
> [root@fedora ~]# cat /proc/cpuinfo
> system type : generic-loongson-machine
> ..............
> Model Name : Loongson-3A5000-HV
> ............
> CPU MHz : 2500.00
> ...........
> 
> Unfortunately, some Loongson-2K chips are not designed with
> corresponding CPUNAME registers, so we expect to add them in the DTS.
> 
> At first, we considered writing it directly into cpu compatible, but
> it seems that dts compatible is all lower case, while our desired
> model name contains upper case letters.
> 
> What do you think if we repositioned this attribute under cpu?

You already did it, so about which solution we talk about?

Anyway, I am against store translation of compatibles in DTS.

Best regards,
Krzysztof

