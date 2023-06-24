Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56831384
	for <loongarch@lists.linux.dev>; Sat, 24 Jun 2023 13:26:45 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-25e89791877so723329a91.2
        for <loongarch@lists.linux.dev>; Sat, 24 Jun 2023 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=j4S9zj7lUuy3sqeeDhUPOz9rwvMJbGSEdKnwRk/XZ+y08PrJVIgqGnCRVMjv5QysTG
         qw+xSrtWimmK0w+c8oUxGgA/hWWS3mddb5TfZRZZkZXCB9iy4qhZcLzmK/w1rFGHNOlD
         u6YXzvdMzyxYCBki+QXeLCsaSepsuUuVeoUWLvfvN2Dfxqqx0oSY8FZK/DD2zqhKZHfv
         RYvqwhQB7QGRxNAtgIU6NHSikcQzK9FTked9KfdwhJI/KFzaz6eCW0C1QabmKjtdXE0H
         kEFZFV+Sc13EU6p5oRwnRdHPaXUEyY8PcvUlBsvAgUzJqMVPy3L5lDhMq3dGib+XWXWt
         gQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687613205; x=1690205205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzHR5VGsBkmKTRWsr9Fr6/IuDbgm5PM65lp5AFdyOdU=;
        b=b3+zf+UCHDJQ136mdsQT5GCpNjX9iacFL8Dy+bkm+qYmUWslcW14wECuCUOyggP8px
         03crczA3PLYmJXqSOl5FRWEN6zcUZkJCAbWlAH5JTYnrZ/lgZfp8XO8bMcXjcw+9WLdj
         GSgdHisbj/wQ0//E9L8JEwVC0nij2KLnpqVle5TxkOg3DscND5sS+TkS6vnUSUSJeNks
         rGxl3SucxtB9xJ9x20J5ZC2ck2BLlqwqHo9Z3+Bl+9Tu26JZKgPAB/yad6V2iny3aiei
         HYJVH7G33lYGScx0PC0MwUEeqp4FXdqzo+5Lkgnj/IrAmccsPOdKPzPK1GUFYPKz7qAZ
         ZpYg==
X-Gm-Message-State: AC+VfDzTl4s6h88wvlTL5ePNogjWCwAc3TYQks+lgrElu7r7RRpv/t4B
	JeR57huEVgv3sh/q1W/a9HM=
X-Google-Smtp-Source: ACHHUZ7BC5DQswxC/X8knfo6PJ0Ce0pzV2b4lrahqjLtajzjQRmz1UcB8/ZZrwmJOMsABWyiGJPEWQ==
X-Received: by 2002:a17:90b:251:b0:25b:d304:6eaf with SMTP id fz17-20020a17090b025100b0025bd3046eafmr14080091pjb.24.1687613204832;
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n189-20020a6327c6000000b0055387ffef10sm1282333pgn.24.2023.06.24.06.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 06:26:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 06:26:40 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source
 file
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/23 02:27, Arnd Bergmann wrote:
> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>
>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>> Other architectures implment fb_is_primary_device() in a source
>>> file. Do the same on sparc. No functional changes, but allows to
>>> remove several include statement from <asm/fb.h>.
>>>
>>> v2:
>>> 	* don't include <asm/prom.h> in header file
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>
>> This patch results (or appears to result) in the following build error
>> when trying to build sparc64:allmodconfig.
>>
>> Error log:
>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>> us2e_freq_cpu_init (section: .init.text)
>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>> us3_freq_cpu_init (section: .init.text)
>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>> undefined!
> 
> These all look like old bugs that would be trivially fixed if
> anyone cared about sparc.
> 

Odd argument, given that this _is_ a sparc patch. Those may be old
bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

Sure, I can stop build testing it if that is where things are going.

Guenter

>> ERROR: modpost: missing MODULE_LICENSE() in arch/sparc/video/fbdev.o
> 
> I checked that there are no callers of fb_is_primary_device()
> in built-in code when CONFIG_FB is =m, so adding the MODULE_LICENSE()
> and MODULE_DESCRIPTION() tags to the file is the correct fix.
> 
>      Arnd

