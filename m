Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7651C2D9
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 18:21:26 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-79266c8617eso80311539f.3
        for <loongarch@lists.linux.dev>; Fri, 01 Sep 2023 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693592485; x=1694197285; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AkxZWqWdmQ7F4OBr4vVbCBrNJyUi6XIXCKckh3E053I=;
        b=FPXVzXCbqUpvCGfvSCMQhlhKNURT0QRHKzdOjOvZpNOc3CmtLyfHcl07GJlG/8UmbS
         3AnADCxiC0scHXlc1YfR6BFiYwjOAh8mXkXV+4VctbfTtj2R6p5vFlkqScD3cHuz3ZRS
         SI1w8cG4+fbvPJEy0ONFo3CmOP2yeUQjT4aHbKXqMDtOqS0qX9OvmIyNrJGHt1ygJXkC
         r5v1xc+GIAr6vz7BHu8gvo5TfVqT+r1fKE45mu4jcUnGuTzJzbAsa7Ejh0EvnD4CZhjm
         /PuwPTVmOUtax3weSsCJIU/Lbzk+zT/cVDbzbUVaQ1AV7tSbcmy19FT+q0MwnHkBwssb
         Ow9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693592485; x=1694197285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkxZWqWdmQ7F4OBr4vVbCBrNJyUi6XIXCKckh3E053I=;
        b=LohUnEMR5lVIhqmSGAgdvDbiEMIPFkzAp1ogHuwwuVZQ+/QxagoP7ZNvFEotOrjDOG
         qSSMyR8bjc/JIgDcFLR+YW8M7JQjOKyZne9WKcuQWpYcNb1yyQGY3bAK0DBQU0jUsiXR
         IU3MSdN7yATDFfjK1FLenUvYO0MHu/5hhYfsS/LYO/dlxdr9X2qddsK1tr54WUIXBLQS
         Jkmyl+8T9AnyhWhP67bfiqRjoAJJebwqqOuTIykw8UKR969d4ozIflhke0NeM36bpTyD
         ZVRxifi09ftSE8Yov2oTXwnT5a6li48GsjxUlmLtIYJbV/042ZinQIWGwEKW7bTQRzu8
         4pzw==
X-Gm-Message-State: AOJu0YwYTyh2cCOGL7ORynScLTyxZ8cAA9/E5j33E5dabi/kVrOKoDnR
	wCtOrRbSAfVYg0rPXzwt7Gg=
X-Google-Smtp-Source: AGHT+IEbBMcZsXGlB1GUVHhi2Pihj+qc2rFLgCVuWcgWXsrzuhONf+cH6SWBxsrTojrGnCA9s4rMBQ==
X-Received: by 2002:a5e:9505:0:b0:791:6aa4:2d89 with SMTP id r5-20020a5e9505000000b007916aa42d89mr3489073ioj.21.1693592485543;
        Fri, 01 Sep 2023 11:21:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2-20020a056638020200b0041e328a2084sm1168921jaq.79.2023.09.01.11.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 11:21:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <11390a1e-932f-8979-1547-f4555920fb7a@roeck-us.net>
Date: Fri, 1 Sep 2023 11:21:21 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [patch 17/17] x86/fpu: Move FPU initialization into
 arch_cpu_finalize_init()
Content-Language: en-US
To: Nikolay Borisov <nik.borisov@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Ahmed S. Darwish" <darwi@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 Richard Henderson <richard.henderson@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Chris Zankel <chris@zankel.net>,
 Tom Lendacky <thomas.lendacky@amd.com>, semenzato@google.com
References: <20230613223827.532680283@linutronix.de>
 <20230613224545.902376621@linutronix.de>
 <ba1b11e5-b3f0-457b-8920-d57d470626c3@roeck-us.net>
 <20f025f9-35d9-1f35-f21e-38e1bb44b74c@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20f025f9-35d9-1f35-f21e-38e1bb44b74c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/23 11:00, Nikolay Borisov wrote:
> 
> 
> On 1.09.23 г. 20:30 ч., Guenter Roeck wrote:
>> Hi,
>>
>> On Wed, Jun 14, 2023 at 01:39:46AM +0200, Thomas Gleixner wrote:
>>> Initializing the FPU during the early boot process is a pointless
>>> exercise. Early boot is convoluted and fragile enough.
>>>
>>> Nothing requires that the FPU is set up early. It has to be initialized
>>> before fork_init() because the task_struct size depends on the FPU register
>>> buffer size.
>>>
>>> Move the initialization to arch_cpu_finalize_init() which is the perfect
>>> place to do so.
>>>
>>> No functional change.
>>>
>>> This allows to remove quite some of the custom early command line parsing,
>>> but that's subject to the next installment.
>>>
>>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>
>> The backport of this patch into chromeos-5.10 and chromeos-5.15 via stable
>> relase merges is causing various Chromebooks (not all of them) to crash
>> early during boot. Subsequent fixes have not addressed the problem for us,
>> so we already reverted the patch from chromeos-5.15 and will revert it
>> from chromeos-5.10 as well.
>>
>> I don't know if this is a Chromebook specific problem, or if it affects
>> mainline, so this is just a heads-up in case others experience similar
>> problems.
> 
> 
> Looking at 5.15 the following prerequisites are likely missing:
> 
> af8060279968 ("mm: Move mm_cachep initialization to mm_init()")
> 5b93a83649c7 ("x86/mm: Initialize text poking earlier")
> 
> 
> Can you test with those patches backported to 5.15.y and see if it works?

Both patches are already in v5.10.y and 5.15.y, so unfortunately
that doesn't help.

Guenter

