Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254FE1D5ADC
	for <loongarch@lists.linux.dev>; Fri, 21 Mar 2025 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742576762; cv=none; b=Fr4Mj96Gvq/BhpZk+UjafQnbn0AkvbJs/M2NoUOgHV7qgTUC45+Dp/y2a0OMnr3FEvOhmJjIxeOfyglDGYlE/jp3dsd2S6n6H6caFMTvKZmMswQFqFLFnhHYUlY5jGfjo/Z3dkpSHKK/l+go1wzfnX08FUbN93ODEVVU3k2EDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742576762; c=relaxed/simple;
	bh=n9/WVuTJiRxEQG1Hl0uQJuC2jaPbsPAQvGluwkYAflA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTWohoyDnaIibyQUu1ZohcPOlglwhhAiwELYUS/WPnzvKBauXPQ9reQFF7JQkcdDHN3/yixk780pWGru7kn7IyTFoa7JZIVvx66H5JoejU6cSYKCLGNpv4VL5KElsDu2fWjGrd51nFbGsYjruaDajChM5MK7t/ViO3RSmz5Qn3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjlX8dcG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjlX8dcG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223f4c06e9fso38313555ad.1
        for <loongarch@lists.linux.dev>; Fri, 21 Mar 2025 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742576760; x=1743181560; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=AjlX8dcGwIVxlidTv35Q8LMapf00VaGisB1lpacM75bl4uhLc8k+dt9h1/+D4TlFy9
         2rG8M23IPOZ9dqkjOLlowNeNtQw7LqoEXvEu6/utxBj4rqbXi0xqvEvGfGGVn9rzQrle
         LzIbZXX2tNGOfju2kVRQAtm3tmPzn7FzhghUMj14XQ9DOSgNGdnvGtre6RHBuw7vgcuz
         cufbc8GYf/6HiWFkEkYTDDwbWr1TabMmDxRMy8BDz1bPMx1S3GlbypxM5AOYiBg3SQiK
         c//4VaAR0KTh3W83+mGccv3jcHjVrRwmAAyRTwEO3Z/LXLw3aCJS1L8GVX83JvG6lg29
         D0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742576760; x=1743181560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGn88oPkGY52kMYyELFbKZ2t+jeQDt845yU5wPNCV7I=;
        b=CRcp2BT7/nZ3VWPZzGnJmH09D8RYpGqIQLAAxFq0Z0MG0SLPW1skxgahwwrqpV4kjG
         FIJwEh1dyzEQtOOdwioyv9X1Wdk5yqV4gMbMIw9soLoPqf8+U68uUi/b8RlUZRFfrjgF
         A++iZ4Xb0oKF2CI2tHDwEMpP2uOfB8Nyki/QhngyNqUiybXzbvAJyoN57HvK9zHd8nnc
         eHaEnIcYC9EJRir0nRkdp/bfvZrec9bH3TtHCD1KZ0ihqeqZ7OO7plc4jjn5iKz1nzOM
         RRcty4AZWwMWX8Qr3cc+HbcrpaBABEXbhWwARnbfUCpUg3pu9RQ3VzLp7vXVYbAvLPbC
         NO8g==
X-Forwarded-Encrypted: i=1; AJvYcCUz7TKeb8/ASN5rH6bU021DsFP5i0AAHpE3dx9BNdf7DMzH1G+I4rMD4oNZnIV9MBWhEkD4xd+rEpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxysNGUxEnW4B/rrvdStlBHSMGpjGb4ao81x9PDycM/IQWN9jd4
	inrijcdjHMHFUSrRs8cq4QDO/hS2kL9HaBUZr6dr67qUxlK3urnN
X-Gm-Gg: ASbGncuLqPLGa1DTGiyZ99vzIIkwFpL9ouYx9t8V0MCkMEjqU50MRG8W8VJcwL+r0KY
	o3mAQ1dq4tiSddqcE1FqEVByZXuT5Pa1rI0j+rmMrOWeiEPUW+Zyl2iH7/OmH5qyDKVx+oMMRim
	b/0OmaawwQ5odFP1xYSXoPLZwwT0IC5Jbh060/Zny5vUW78LrgZ68lRC5xM5SDNGi7ZOmoOfFaA
	ZKWCuv/Hng0NDkQa3ptdhL18Oq3uHDqXvNHyWd/pYKE7IxJsjD1B+4ZxiG7MG20rLIx8+HVZ18H
	E6GFyAvJjoTSNaL/zeRBaQKV9P62ukTBKSzGtGOsxLpisndOjZB0ivHNCzqlnPHLQc91Ng7Ahox
	jZ73z4FtoaFHk/f3WkQ==
X-Google-Smtp-Source: AGHT+IGlJ+Z2e1+BqNuKZjJeYaVTSO5uEIrxfNDx54p4mNFYbbGfGIs11ZjWWb6jUGSm+z6+aHdutQ==
X-Received: by 2002:a17:902:ce84:b0:223:fb95:b019 with SMTP id d9443c01a7336-2265e7a1b2emr136230625ad.24.1742576760001;
        Fri, 21 Mar 2025 10:06:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45879sm19661595ad.65.2025.03.21.10.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:05:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
Date: Fri, 21 Mar 2025 10:05:55 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] s390: Add support for suppressing warning
 backtraces
To: Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-11-acarmina@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250313114329.284104-11-acarmina@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/25 04:43, Alessandro Carminati wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
> 
> To limit image size impact, the pointer to the function name is only added
> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
> parameter is replaced with a (dummy) NULL parameter to avoid an image size
> increase due to unused __func__ entries (this is necessary because
> __func__ is not a define but a virtual variable).
> 
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> ---
>   arch/s390/include/asm/bug.h | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index c500d45fb465..44d4e9f24ae0 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,6 +8,15 @@
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   
> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR	"	.long	%0-.\n"
> +# define __BUG_FUNC	__func__

gcc 7.5.0 on s390 barfs; it doesn't like the use of "__func__" with "%0-."

drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c: In function 'anx_dp_aux_transfer':
././include/linux/compiler_types.h:492:20: warning: asm operand 0 probably doesn't match constraints

I was unable to find an alternate constraint that the compiler would accept.

I don't know if the same problem is seen with older compilers on other architectures,
or if the problem is relevant in the first place.

gcc 10.3.0 and later do not have this problem. I also tried s390 builds with gcc 9.4
and 9.5 but they both crash for unrelated reasons.

If this is a concern, the best idea I have is to make KUNIT_SUPPRESS_BACKTRACE
depend on, say,
	depends on CC_IS_CLANG || (CC_IS_GCC && GCC_VERSION >= 100300)

A more complex solution might be to define an architecture flag such
as HAVE_SUPPRESS_BACKTRACE, make that conditional on the gcc version
for s390 only, and make KUNIT_SUPPRESS_BACKTRACE depend on it.

Guenter

