Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A861D95A9
	for <loongarch@lists.linux.dev>; Tue,  1 Apr 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743530032; cv=none; b=WP95INjrVswlId82pwmMDSkzweALbFpYxwy0W6FXgcBpqvfQQPnDzONo0Z8BcwHaPkBfBOKN27q3rqTHLPQM4sI3fEB5BVuUKUjjfUH6XGKpHzvvifZ9j4zYJ9pzBxEl0O30rXYM9qES4oswotHtiMmF6SXslXUZPg+Sny9sct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743530032; c=relaxed/simple;
	bh=QgElNOWE2Xrm08hLa6ESNpdeV4xEO0TTnynJvAUPa3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApN2xcY7miSD+ZUqn8nQpON4r27qPnRTMS+XtsmFlvH7KVx6ZFJ5v0pydZdCqpLF4aJ9AprrWita2fDWxqz8QgaF8Iwpj6cc2AanrOeCkmeW2ecBJ/WRfovgHIMjviypS58cRUj8+Ran1QxrnLZf4Qp9tXcJ9nqsg7BdqUCxA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv+uHG14; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv+uHG14"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30332dfc820so10269772a91.2
        for <loongarch@lists.linux.dev>; Tue, 01 Apr 2025 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743530029; x=1744134829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JAMVOcHUHUp9NIh99z5L1mUQFRtZqcxl3Eb+q823hSk=;
        b=hv+uHG1432DG5LLHjPKfVUIH6qfVIRdsxyd04tJhquuED5NzmQ1qSStAiOnmtlG6I6
         XBTMnba/foshdPCq4ZjZEy1U6ZEV8i374EtfxqIonBBSI+KoxsWKtrjJ7jVIVkx7h+dt
         ZIpms1Q4WdQlCGf6uCYx2O5SnOGuFZYk4CmT2QG8t6aAdAYbs2iLzeZkDnEDmtRoOyin
         PlG1LQbukGfwJZcy0zqqxGlT6QXHqH5llty1jmaMGliJsUVXVy2G69ds7cKVNQi1t7dw
         rbpfjxqYSv5/WwctyFD8Ni2jqdij5MkIS1uiS9+3GH8UalB2nQze4bvHychzeBCKjlnZ
         hbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743530029; x=1744134829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAMVOcHUHUp9NIh99z5L1mUQFRtZqcxl3Eb+q823hSk=;
        b=pnQXlY5WVNRZXaMWy8U9+zJPIjxkWgVF6ne/C6v82xeAi4fwhGIVXqb/9onpuxt7g1
         wI9f5peKIrBrBgiwNbu9gDjqNYPH9JB4xQbdwdtwMvMDSv79Y5J8RDbI+o9MaBZrdzyo
         +PVIl+tI4Ug5tZ7IMnFJtQS9QUdKJ8xExZ5kj3I1zsUxtZt9eYfgezJvJi999oGTEwVG
         zWhUxkD0az96WluVifywf3CiM/0kpVbvgpp2gwtgjWFJ9SRx8whm19e4Nuq7+DyEJZNo
         zQMVey5bTQKHyUfd7Z2wScFHdo2T8gi7QEnDty6aq4BxzM6siQ4y7hC4TX7CSkPX8vxL
         C9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEQLHQW5F+UUBMYoxHBE8Ot2cyGfOYp5MFwQjd5CkFvO4kbHzZigMGTlvrKpHqnM+X6mGMhNaMvuA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6IxWXwZw1fdgKJ0lcX+yDnEtIL8VF2H5j7RUIv6Z35/1N9c3R
	v4idRYdwnI9SIquPLkgM1frYpYdFhw3UmkZuYPAFtbH2QCrccWkF
X-Gm-Gg: ASbGnctvvrUfjjLM0NyWIlqWRPE6y0ghZiw907YNR/6GOieeP62g7NGr0UbaXqgnAqa
	Qgdf375SMQtHY+VxAQiI0u8vfKbBnIdrQ1Y8Gx57xCRBsV1k5/lnXg4gXk1E7SZbB5QWM8KT+k0
	NqzH+3vOtebRY6STrHXt+IPtBrcLVde7TtcRxYV8poSycpzklsPXBLGUXQlVOUqmjG1qfJeH4Ur
	MD7+NesWZufqyqoVCBZPnMqCv11MTiod9EhelgUcapz5cswza/+OoMWslFhdj3vVBJ39o19hvhc
	Zl98yQy0rOqD/w2B9IwYBOsD1BaLFbp0BLa6uy0H0q5M0+3upS/vmXRqlShBxn0VkeMRO32oa87
	58Y1i18IGrLHsDtZeyw==
X-Google-Smtp-Source: AGHT+IFhOMd4yd6M+FWAK5Hy8goXBks0rAj4TVyMNP7GV5VDf1+ABmWCHzxIltBfqT7LAbEN+HeHUw==
X-Received: by 2002:a17:90b:1d48:b0:2fe:b774:3ec8 with SMTP id 98e67ed59e1d1-305321471fcmr18084239a91.23.1743530029346;
        Tue, 01 Apr 2025 10:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d62c57sm9624079a91.28.2025.04.01.10.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:53:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
Date: Tue, 1 Apr 2025 10:53:46 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
To: Peter Zijlstra <peterz@infradead.org>,
 Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
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
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250401170829.GO5880@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 10:08, Peter Zijlstra wrote:
> On Thu, Mar 13, 2025 at 11:43:21AM +0000, Alessandro Carminati wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> Add name of functions triggering warning backtraces to the __bug_table
>> object section to enable support for suppressing WARNING backtraces.
>>
>> To limit image size impact, the pointer to the function name is only added
>> to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
>> CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
>> parameter is replaced with a (dummy) NULL parameter to avoid an image size
>> increase due to unused __func__ entries (this is necessary because __func__
>> is not a define but a virtual variable).
>>
>> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
>> ---
>>   arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
>> index e85ac0c7c039..f6e13fc675ab 100644
>> --- a/arch/x86/include/asm/bug.h
>> +++ b/arch/x86/include/asm/bug.h
>> @@ -35,18 +35,28 @@
>>   
>>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>>   
>> +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
>> +# define HAVE_BUG_FUNCTION
>> +# define __BUG_FUNC_PTR	__BUG_REL(%c1)
>> +# define __BUG_FUNC	__func__
>> +#else
>> +# define __BUG_FUNC_PTR
>> +# define __BUG_FUNC	NULL
>> +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>> +
>>   #define _BUG_FLAGS(ins, flags, extra)					\
>>   do {									\
>>   	asm_inline volatile("1:\t" ins "\n"				\
>>   		     ".pushsection __bug_table,\"aw\"\n"		\
>>   		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
>>   		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
>> -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
>> -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
>> -		     "\t.org 2b+%c3\n"					\
>> +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
>> +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
>> +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
>> +		     "\t.org 2b+%c4\n"					\
>>   		     ".popsection\n"					\
>>   		     extra						\
>> -		     : : "i" (__FILE__), "i" (__LINE__),		\
>> +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
>>   			 "i" (flags),					\
>>   			 "i" (sizeof(struct bug_entry)));		\
>>   } while (0)
>> @@ -92,7 +102,8 @@ do {								\
>>   do {								\
>>   	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
>>   	instrumentation_begin();				\
>> -	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
>> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
>> +		_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
>>   	instrumentation_end();					\
>>   } while (0)
> 
> NAK, this grows the BUG site for now appreciable reason.

Only if CONFIG_KUNIT_SUPPRESS_BACKTRACE is enabled. Why does that warrant a NACK ?

Guenter


