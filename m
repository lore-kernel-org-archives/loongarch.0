Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F81EFFAB
	for <loongarch@lists.linux.dev>; Fri, 28 Mar 2025 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200101; cv=none; b=ZkZQ4JxJWUns9dVnOAlOJ8i+SFfsP906ze10pmXXxVkoHTwPnmP2eSnBUiVDeOlapa0swHW91aCac7f6MjkXWBlDAEsH6z8NXr3HN9UqJWDafeRy0oxAq6Dx1H6lzEgPCy2U6SxxQlPXYR0TFUSYwWNdoq0RwJH/ob1+Vc8tSo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200101; c=relaxed/simple;
	bh=3LhOBh1if/G4lc3HsqhYB39Qdkno2Qt5JqUSH0+F/e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSzZ6bB7xRSk3n1FJVgeoxcVNY15Eyg30GukFJ8ZJlJVcIyf0KvrpYyjGpURsDXCSb3XK5mK8oze4JSUpDtXbGYFxUhAwDbcAUI8Do27pJacC9b5a2ccgby8jNvjWoE+mVbnANjOdtcssk/GgkgKSPeNRjdTUSdGV8/W1AvYT6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZSe3q5ua; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZSe3q5ua"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so9401255ab.2
        for <loongarch@lists.linux.dev>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=ZSe3q5uaFvSayDg+V5l4sz/jzMO0CI32l5hJa6XW+sEdX9y1BkI+QHxh8tDeH5KFSs
         e7zT1Qemf2Qgrov//uQhF5tOm1ends+JLGMiNN48ynvli4VZtNTsRKRYP1SMKQwVezHD
         ylXENQACDDKZYyTYLCeJkt23tSPijg3JSc7is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=rf2wyuMcCeOxpz9Wt/z4jkBpCS/133aD9GX+2FZOfLc64AktJRKNadGs3IuuJHkWic
         mYadjahv9oi9Q6Fz6UecS0OxnwqpMl3vv3NzZ0qgmj2DCzlO3rSfswFeU/M4+gLEY6rL
         Dvlfy3YE3lwsMrV8Wxox1s5oMBgKHbNfyjUF+A21mUZcDzdMQrjPG56WSCry/kw/wAJO
         3E3XMqAohQiHQ2yUq2PkJjTIZGED6KqR4Gh4wqjn0vkGi5BivjWKYCJYRvL0FX67usTk
         gu+6DuAI8VaOJ825lrWE9rf+RfX60kwt58h/qbOfFTGOBXAptN9XBezwKsPxbL88VrUc
         BjQw==
X-Forwarded-Encrypted: i=1; AJvYcCVcGVrvyiAV/PiegbmYH7U3heUgt30fcYkWFhElhG1MAPwyZ+5v2wuiv+KGI7FzBPyidlnKvcvBazA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSJPAsHv71paFwRXxef/rThtZcyLtzDaQXIBsLDgrjMkeer37n
	HwAc5Ong8H1FUPU4nhn0N9tNvkjBs7LaRJg+W/w7ZNaevr54JtzDiOM5y7Z7MkA=
X-Gm-Gg: ASbGncsms9CGo24+DDWotZ4BpNO2W4iP0/ZCsa8Wiv+QTpW4IvxIsvF+OJInJa9R8N/
	xCsITXjdyvCw6qHHPTziel0D8IDKoz5fCchkNlmm7lxenOjbSjB/4BJdzksSeyBffkBpDcT58AE
	doVSIR7XXcPUMQT6FFus+F8uqeMnzW4WXjb8cFlOnonY2cAIok/lg9Cb+T8Ut87wVZmXGC2kNPW
	v5BrLbZ2JUs+Mdi6JWK1Jee7i9vSHBSisRbvNoADR0JCarexPPI0/4nlE77n2h450umf5ao2CDa
	QrgrLNbaO+BgkFrdSIlLM1g1UH5sDqtwWSUvaqjeErVCeQ3QNqU6p5k=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah

