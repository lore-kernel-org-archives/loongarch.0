Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852DE5D905
	for <loongarch@lists.linux.dev>; Tue, 26 Mar 2024 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711429360; cv=none; b=CE4bvPOpfSVdMYDgIY0WVEW/KNvcNf6fff2/LwxeUs8J8D2OqQFdPwuKB31nOD6TPrFgK7x5fsmba1vojpQzsS7BEpvAkmEJ+pTVePDuIbf/YGqJ5pr5qDG4Kc5BBfWp5jswYcCOWuCz+HCr+XOOeBhhzksG/zMq2PxhGhS5QNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711429360; c=relaxed/simple;
	bh=kLFdQikJ3pP/Ye1r7/bcEA6VEXSjRgAqw+Lz3/ACtKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvAVw/eCfUz+8heJu3rKcgHk2jCcSBU6+o9o2Ykm/BakiuUnbwV/jWI4StTIZ5AvZQ8TmnZJdzyC730TX5fbI6popw1HsDxe9ijU5cfzmQEY9zJyEB2uA8nfPc54gd/eOLSMZBbrzMpa1z7jGJBntAVNcTesK9KcgN6/UjZK9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC+c9JJX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC+c9JJX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso36702135ad.1
        for <loongarch@lists.linux.dev>; Mon, 25 Mar 2024 22:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711429358; x=1712034158; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nIhrywFoGE/FB0l12vjAjrM2buYxUGncKgITpiq2JlY=;
        b=BC+c9JJXpFY7w8oQ15Ix8c6iaT6vrdJZ2Uzp9gu3bLPxu4MkSNV6dnFsQv9pOsTLa8
         Ej0KEIaudnDrtQGblzDfD9TK5sN5FcENI1zSMb52/WDnA/zHRQ7r7z10U7xjXOlRkO7L
         i0HowcTZ2/ynLJNpm2o4XK8lVJGXf98g6kS1jW1MvbdIEKnKmlTYJ57RNg5Duf0wWbCc
         UOZwvqAZxqAndh7jFDXBI1ZjsWc8sv2N/LPTuh8QXEJK6edJ1n+TqA5uf3t36EikKLTf
         X7lC4ftOnf+F5JX19tYXxpCkxkiduLkis2EwL0hS0aW/Eu5bvb9W9pk422ypQIuNLdk1
         dvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711429358; x=1712034158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIhrywFoGE/FB0l12vjAjrM2buYxUGncKgITpiq2JlY=;
        b=pTr/8XY8Euf5/qLnNTqvR5ncIO1Wlymi3iQ0Qwxjkg6EQbgLZcSTLkO6u256BLC5cf
         xSeH2UXOaCsMf4/XhL8BVXRgQtSytrVErsNX121zPozMYjiLnkl61fOEa14BysvDw3T9
         s8vgHNVrwtdIDTUETqnEX/mtLsytlma7O8I46Z0qn6iLfsZ55RjWU0W48K7ULgO+cvRj
         48fJ2QgaIMuEwlwBSVdGYXOlnIvLLdDsB/SfpgUMky9amGWJbDIZZLCTJy+yR5XBJO8n
         Il+Iv3z0xBvP2p3l+V+AMoKMs1+gypfr/ZgagWmza2SWpaGLNkMlCO4onWpOPXkiOA9U
         YTpg==
X-Forwarded-Encrypted: i=1; AJvYcCXJr2LtT2DmPmG2A+6sHGwX8ABMCBQR4zQTpcLa8SmjZMrd0uV8o8lkVh5IO4muZnMxKp+ds9wnCumaG5QsohkfBGrsi5PqXQja
X-Gm-Message-State: AOJu0YzhBSiQ2TUcxN3/OOp0QfE8rbe7FTLImdEOo1Aixkgzi0PdqxIH
	ZvIq3XOmdK4gG1nrtjy0VxFC8QZg3pKqB2qaeSIYSTf72eNmGDt7
X-Google-Smtp-Source: AGHT+IEcTHB/02f9HaB1tS0cP2ZsRx971NBiGwEGqHnjokk6umDjAiHMd//taF/o4xULvRj25jCExA==
X-Received: by 2002:a17:902:a586:b0:1e0:cd8a:581 with SMTP id az6-20020a170902a58600b001e0cd8a0581mr42211plb.23.1711429357721;
        Mon, 25 Mar 2024 22:02:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902690b00b001dd64048f78sm5700013plk.211.2024.03.25.22.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 22:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4799424e-8dfc-4848-8c4f-affedaec9dfe@roeck-us.net>
Date: Mon, 25 Mar 2024 22:02:33 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
 <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
 <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7f6a223f-f432-4e1b-a67e-3816448224a1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/24 18:09, Maíra Canal wrote:
> On 3/25/24 16:24, Guenter Roeck wrote:
>> Hi,
>>
>> On Mon, Mar 25, 2024 at 04:05:06PM -0300, Maíra Canal wrote:
>>> Hi Guenter,
>>>
>>> On 3/25/24 14:52, Guenter Roeck wrote:
>>>> The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
>>>> intentionally trigger warning backtraces by providing bad parameters to
>>>> the tested functions. What is tested is the return value, not the existence
>>>> of a warning backtrace. Suppress the backtraces to avoid clogging the
>>>> kernel log.
>>>>
>>>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>> - Rebased to v6.9-rc1
>>>> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>>>>
>>>>    drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
>>>> index 76332cd2ead8..75614cb4deb5 100644
>>>> --- a/drivers/gpu/drm/tests/drm_rect_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_rect_test.c
>>>> @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
>>>>    static void drm_test_rect_calc_hscale(struct kunit *test)
>>>>    {
>>>> +    DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
>>>>        const struct drm_rect_scale_case *params = test->param_value;
>>>>        int scaling_factor;
>>>> +    START_SUPPRESSED_WARNING(drm_calc_scale);
>>>
>>> I'm not sure if it is not that obvious only to me, but it would be nice
>>> to have a comment here, remembering that we provide bad parameters in
>>> some test cases.
>>
>> Sure. Something like this ?
>>
>>          /*
>>           * drm_rect_calc_hscale() generates a warning backtrace whenever bad
>>           * parameters are passed to it. This affects all unit tests with an
>>           * error code in expected_scaling_factor.
>>           */
>>
> 
> Yeah, perfect. With that, feel free to add my
> 
> Acked-by: Maíra Canal <mcanal@igalia.com>
> 

Thanks!
Guenter

