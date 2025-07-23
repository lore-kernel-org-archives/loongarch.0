Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7382153F1
	for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 17:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753290688; cv=none; b=uNKIK15ibPwu9tE+8LqZBLP8zxOWdGIxTD95uCWDYiP/4BZfOL8JvA76uQMgnc8gUzH70ycoy+P5bd4i9RhQCxZ8S/WF1ZILRXfHR+QoVomgdqzIX91NCFDBVPhu8qlEzyR1W/zljg+FeQm1Oi/86JmMUDYF763Iq4bAtN4yL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753290688; c=relaxed/simple;
	bh=a3VO2yd0ydhuHyilkWWThg5RVteLZD5/hYT51c6jDM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzN+psbRrrfz5CD3qWXvHIVC+di4849ftdg19mzM9m8IMSkX3VTKK7JifkVM8oNEM8bu/VxLhKlk1n5Q57XQqtjsiJ8753G2Lw0UXlyZlTrcCMscQzWrSfjv/96yhNGteGuKeqR1vvLP8YGxEueIXn/210QUJktT9hKpD43IYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myHi+yn0; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myHi+yn0"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33095f59c43so24841fa.2
        for <loongarch@lists.linux.dev>; Wed, 23 Jul 2025 10:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753290685; x=1753895485; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=myHi+yn0D7jalMsvwVZOlzXdD53Ciz6HiCs+4s4kF3jxbpx7RzAcI7pa1//e4Un7HC
         Byp8IZx/bcq6hP4ORPlhLTDTiADuY/d7BN3ogubQvm8VXutA/BNdlL9742ozMHQa1YjM
         NgKzRKVF7/f+8pvSuWf95QBWyNXudTshMDykj5+hC/CB89n6/mGqbo0u9d9KSCln+pWf
         K1z79cG7+r2RGJcHBKYSM0IKyR3HZxT4f5chDpaKF9dNxKkihmkaN0GPnwq6xU8HanN/
         x3ay48/KFO0YXFRg+dMt5QuuAasfxEqhA05GKOH5OV5PHMYG6Fp96dHroR1VsgtutrQp
         zsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753290685; x=1753895485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=mhKWJxVXAHfXtg30pflyiAmMhBvihIpl+H9oR8uE8V74uSiSh7b39FQrF4Th4aj3q6
         ZaCdo1nl4KCMfggSsrrRkEQHYQkNfU+LzGdMXSVRKyCU13C+sOi3ZwHmrclMljJxc9V6
         OxQrSxh5G2v0AnKMJrkgBu5J4C8E2QYdN+ol1/nZ50H25S8rzA14jqVkxudGQmeEiZbo
         U/FuF7T1+Ljpt63/VR5x+sfYlyNW0FLUj0JNuJOQroKU3yNqEhrgo7Gwwc0hhRZq9x54
         Jj7G0h1HY1FUCOtizzxtAzVdyEpc5FF+kkRM0Jn2hkDN6L7l+I0OWEulcd8gVFI6zEmY
         9rbA==
X-Forwarded-Encrypted: i=1; AJvYcCWqAESBbv+1KUOTOtf2pvCc5LztH/3q4rWw+u75dPQhvrItHii7zk2zmIFx+QZ0Z8S64+H7eMsxnNk=@lists.linux.dev
X-Gm-Message-State: AOJu0YySmqyYts+FeF5GKgYjD7hogxv1BE658jPaNP8ICbQo1Uq2gmWN
	Ft9o+7E6rsRUVXwPDfuaYirzH+KT/IX2uQjBMm4hyBQsx68BW5HSc3hc
X-Gm-Gg: ASbGnctTUP13r4c0d/RcVmXfq8NCvSOeRPFbSDxnAYaGrhBwSCVTw0PN1JJKN3yMjAN
	4QLMH06ZDBx8hJ18s4ZQU69jUymhdlSSCeimYgxTvJ5WUAEayC+38FFfFllVyJUWnD4/3te4EE4
	bObsHw5ALlEm40n8dYUK3TrkBjpjSZ5aJscz79Iab1D8Pkc+Ac5oZ1fgJ5OpJBXBKAuKR3gudRV
	SenQhU9r/1F7Xux2WZCdRKXnKGopD0limymQoqkAiiK03WUK2W4UgpO+larvQJhmFHynmo3zRNT
	7qEypl9XnQfOZMSqjWA+0e/8FJtzuEzdDeR51XRZb5gA+eXYwWOx068FQe5B7It7NbulFC7zR4G
	f4dodyVcUMVMGlsLb3RlI3yVHW7+Q
X-Google-Smtp-Source: AGHT+IH2g67FKl5Ss4FX0QBC4tL2LXDPhFaEQPcQJWbHc0FwMHy9whqZBWSEtQi4JTvV5r53QIeSPA==
X-Received: by 2002:a05:651c:f19:b0:32d:fd8c:7e76 with SMTP id 38308e7fff4ca-330dfd2d969mr3521411fa.7.1753290684563;
        Wed, 23 Jul 2025 10:11:24 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9eaasm19869811fa.85.2025.07.23.10.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:11:23 -0700 (PDT)
Message-ID: <4dd38293-4307-474f-8eb7-0e83f5d3b996@gmail.com>
Date: Wed, 23 Jul 2025 19:10:59 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-9-snovitoll@gmail.com>
 <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
 <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/22/25 4:17 PM, Sabyrzhan Tasbolatov wrote:
> On Tue, Jul 22, 2025 at 4:00 AM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>>> UserMode Linux needs deferred KASAN initialization as it has a custom
>>> kasan_arch_is_ready() implementation that tracks shadow memory readiness
>>> via the kasan_um_is_ready flag.
>>>
>>> Select ARCH_DEFER_KASAN to enable the unified static key mechanism
>>> for runtime KASAN control. Call kasan_init_generic() which handles
>>> Generic KASAN initialization and enables the static key.
>>>
>>> Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
>>> interface.
>>>
>>> Note that kasan_init_generic has __init macro, which is called by
>>> kasan_init() which is not marked with __init in arch/um code.
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
>>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
>>> ---
>>> Changes in v3:
>>> - Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
>>> ---
>>>  arch/um/Kconfig             | 1 +
>>>  arch/um/include/asm/kasan.h | 5 -----
>>>  arch/um/kernel/mem.c        | 4 ++--
>>>  3 files changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
>>> index f08e8a7fac9..fd6d78bba52 100644
>>> --- a/arch/um/Kconfig
>>> +++ b/arch/um/Kconfig
>>> @@ -8,6 +8,7 @@ config UML
>>>       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>>>       select ARCH_HAS_CPU_FINALIZE_INIT
>>>       select ARCH_HAS_FORTIFY_SOURCE
>>> +     select ARCH_DEFER_KASAN
>>>       select ARCH_HAS_GCOV_PROFILE_ALL
>>>       select ARCH_HAS_KCOV
>>>       select ARCH_HAS_STRNCPY_FROM_USER
>>> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
>>> index f97bb1f7b85..81bcdc0f962 100644
>>> --- a/arch/um/include/asm/kasan.h
>>> +++ b/arch/um/include/asm/kasan.h
>>> @@ -24,11 +24,6 @@
>>>
>>>  #ifdef CONFIG_KASAN
>>>  void kasan_init(void);
>>> -extern int kasan_um_is_ready;
>>> -
>>> -#ifdef CONFIG_STATIC_LINK
>>> -#define kasan_arch_is_ready() (kasan_um_is_ready)
>>> -#endif
>>>  #else
>>>  static inline void kasan_init(void) { }
>>>  #endif /* CONFIG_KASAN */
>>> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
>>> index 76bec7de81b..058cb70e330 100644
>>> --- a/arch/um/kernel/mem.c
>>> +++ b/arch/um/kernel/mem.c
>>> @@ -21,9 +21,9 @@
>>>  #include <os.h>
>>>  #include <um_malloc.h>
>>>  #include <linux/sched/task.h>
>>> +#include <linux/kasan.h>
>>>
>>>  #ifdef CONFIG_KASAN
>>> -int kasan_um_is_ready;
>>>  void kasan_init(void)
>>>  {
>>>       /*
>>> @@ -32,7 +32,7 @@ void kasan_init(void)
>>>        */
>>>       kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
>>>       init_task.kasan_depth = 0;
>>> -     kasan_um_is_ready = true;
>>> +     kasan_init_generic();
>>
>> I think this runs before jump_label_init(), and static keys shouldn't be switched before that.>  }
> 
> I got the warning in my local compilation and from kernel CI [1].
> 
> arch/um places kasan_init() in own `.kasan_init` section, while
> kasan_init_generic() is called from __init.

No, kasan_init() is in text section as the warning says. It's kasan_init_ptr in .kasan_init.
Adding __init to kasan_init() should fix the warning.


> Could you suggest a way how I can verify the functions call order?
> 

By code inspection? or run uder gdb.

kasan_init() is initialization routine called before main().
jump_label_init() called from start_kernel()<-start_kernel_proc()<-... main()

> I need to familiarize myself with how to run arch/um locally 

It's as simple as:
ARCH=um  make 
./linux rootfstype=hostfs ro init=/bin/bash

