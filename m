Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7231E851
	for <loongarch@lists.linux.dev>; Tue, 17 Mar 2026 03:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773719401; cv=none; b=ZnzpFdOp8JpkeSrx/IP4jnkeKk5FElAyeDJ7SGE9amgYrnO4pft3yTLnWw+48anB1YpcizLCm1TA3IK90ZA+mFLNblZ6UB9d+QQ9YxSwAHt6K0PQAjZex7r5Bbq3Htj1f5DFoLcihbVDyasF5kSjVTFltBV5vX9ch+K0CMCP5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773719401; c=relaxed/simple;
	bh=bsTHXrdDrCMdw0tDUkatLv8c9nfNpZ/HZf+pMYc7bbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huZ4JxqqThvtcSWdIvY2Gzsf41/CK7RVsXI8llSmH2kDcJjHHUpajBk2oe9drOdT7jlC1UlKOtw7PdQrGmE6A6uC/3cPKweSXw/x8EyJamQFMsLNfVhEPSQVOomk0aiyKBnvFL+i9HJDpPY19OmeMEvOm5YZa+xxNhnxu26l6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=X8Y/VWNV; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X8Y/VWNV"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4043b27ddeaso3332623fac.1
        for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 20:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773719394; x=1774324194; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=X8Y/VWNVwFEXkNE9ZgsrGQFb1tW/8irYrwd130UaOIUQLLuzSgviueagd7fLlqqT5n
         6Q6PibsnBEViFTPct7fP0Jv378Ppcaq3Dkg1uPh0WXsNB0kXsjkrXFqiGA2YTBA+EUCc
         dO8JYUrXTXOMlVgvzW+GVOJHDNk5f5dd8sRlszQfhLM5SZXPqlKI5okSfCsfltnVIGk3
         /M8XUnXSduJTjMQVW3DovOn/o9Evj5BlFLK5P9y62G6mLZ5ZvPW1XILtb9+hwoK1vdYo
         DHZNZtgV9SfORnuv4xSuyuPf3ghWGK5kw0P0l+k9HzWPjWpqSWxUMV7T7K6z4tHuZ2wc
         RQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773719394; x=1774324194;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=NL1rxniQAS77LUPyQOw7MD8diKiRtjRLw+JO46tiwoMIzumqrSlWZdJ/z+c6BVeoPK
         N8DbTd0R7hsRtI58VHSYcyv4GlVDvO3SzD3ez5KV4XF08R//ehaFot+eYFOHV3VeJY0i
         v9kG2MF42d4MOYsiofVEomKXu7FUdFwcFrRTlEX35ma6pEC2ShIQM320ER7RZEvvxXp7
         8eMibiwNzOBmdMuaVJavMj/q/HpdhBY22h50Z6Ib4QbAM/G7wMJsL/A0EpXd+1x60JBa
         L70hywwzi5K4bIWZRURKWYwCKJzabq8edOyJclIfQp+uqSUUrdttciyMxaevXFN4ij0u
         uRRA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYGHktk4c1P+5e+77Zg0lpwp3Vkx7m1dRJ/SKMn2BGWIXUB15PkgYVEQTwg1+Fs9S5JJTV8hiUiY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxejWTfDLF1PW9faRmemgC7K5ig4My/n4pztLY46Zs1tRvh1h+b
	UpkVNAav7E5T2/et2S0F0SFdcaXcfZTzepb+BnfJjPfDeleLiEl5N8j5wPKaFkX8KlQ=
X-Gm-Gg: ATEYQzyj9VOZ8LBT8fDK3jEGRgzi4daH+AezxwiXe0l6H8famMvIc9DQosJ3J3qnaHo
	k8aRxKQ1OdU/3a/fEEs3apNxbrlxBNUFUvUYtTic8j5/KDyPD22eLHT/IJac9sexp3qdiNUpkfE
	Tf2mDcjQqjxbuyL2UiCZZX45n6UflXVM8cROKQVbafdYb7dIX1K6bipREuQZfRXs2A7rYiTzvut
	/UUtEuruhN9VnEZugd147BpVOHOtVD96NuEWVoG2/7+YDgpWZQQP1RALDZ3eoppL/NOSkNRQ4OR
	Pd9v50XVg1z1qnfKY5WESKSYL9cOIJkTjtxV9hJyyObO8XofASe+FlTsQe//ZRIEnHR/0yt2ukv
	+h4pB0fNxXI6R40RR0KngerIKGG8Aw3aKP85RYT9pgqdRyBo/qRX+pKA/dN3X2NVgUAn8t9HSEw
	NSBW3rdgpVe2dcdtl+sI8fqemP
X-Received: by 2002:a05:6870:d406:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-417b906d206mr9213737fac.7.1773719394528;
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm19148337fac.16.2026.03.16.20.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Message-ID: <da8c8b57-6d5e-461a-83b3-9339a712aca4@sifive.com>
Date: Mon, 16 Mar 2026 22:49:52 -0500
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, andreyknvl@gmail.com,
 ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
 <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com> <abjMP58VdUu_eElh@fedora>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <abjMP58VdUu_eElh@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-16 10:36 PM, Baoquan He wrote:
> On 03/12/26 at 07:53am, Samuel Holland wrote:
>> Hi Baoquan,
>>
>> On 2026-02-25 2:14 AM, Baoquan He wrote:
>>> And also remove the relevant description in dev-tools/kasan.rst
>>> which is hw_tags specificially.
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>>>  Documentation/dev-tools/kasan.rst               | 2 --
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index cb850e5290c2..e0115fad9e60 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2899,6 +2899,10 @@ Kernel parameters
>>>  	js=		[HW,JOY] Analog joystick
>>>  			See Documentation/input/joydev/joystick.rst.
>>>  
>>> +	kasan=		[KNL] controls whether KASAN is enabled.
>>> +			Format: off | on
>>> +			default: on
>>> +
>>>  	kasan_multi_shot
>>>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>>>  			report on every invalid memory access. Without this
>>> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
>>> index a034700da7c4..eaae83fcb5e4 100644
>>> --- a/Documentation/dev-tools/kasan.rst
>>> +++ b/Documentation/dev-tools/kasan.rst
>>> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>>>  mitigation. Therefore, it supports additional boot parameters that allow
>>>  disabling KASAN altogether or controlling its features:
>>
>> The sentence above is now incorrect as well. I would recommend documenting the
>> parameter earlier in the "Boot parameters" section instead of removing it from
>> this document entirely.
> 
> Good catch and the suggestion is good to me. Thanks.
> 
> Is below change OK to you?
> 
> 
> From 317be48b9c1bf9d33b8d8fff5e401e3155531d81 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Tue, 17 Mar 2026 11:28:39 +0800
> Subject: [PATCH] mm/kasan: adjust documentation

I'd suggest something a bit more specific, maybe like "mm/kasan: document kasan=
for all modes".

> Content-type: text/plain
> 
> To reflect the change of kasan=on|off.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/dev-tools/kasan.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..8e65bc04dbcd 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -103,6 +103,9 @@ Boot parameters
>  KASAN is affected by the generic ``panic_on_warn`` command line parameter.
>  When it is enabled, KASAN panics the kernel after printing a bug report.
>  
> +The generic ``kasan=off`` or ``=on`` command line parameter controls
> +whether KASAN is enabled (default: ``on``).
> +

This is in the middle of paragraphs describing the fault reporting options. I'd
suggest to move it to the beginning of the section.

With those fixes, you can add

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  By default, KASAN prints a bug report only for the first invalid memory access.
>  With ``kasan_multi_shot``, KASAN prints a report on every invalid access. This
>  effectively disables ``panic_on_warn`` for KASAN reports.
> @@ -127,9 +130,7 @@ modes below) support altering stack trace collection behavior:
>  
>  Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
> -disabling KASAN altogether or controlling its features:
> -
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> +controlling its features:
>  
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of

