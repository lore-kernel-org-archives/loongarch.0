Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13146A8
	for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 21:57:56 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-666eec46206so4554669b3a.3
        for <loongarch@lists.linux.dev>; Tue, 27 Jun 2023 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687903076; x=1690495076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t1QqN2jdF+WL3G2Fn2F+gnSyyU4sNUKe3JWXuNtILlE=;
        b=g+t5RbdhRiaLoYyDKYrUABIe+H7AyRcVTK6Ps8KX11dLH3rVyHHxTIp4jo1F1MLfJ/
         7iNHUg8lMtHSGaBwqfjHucjm6wwc/jl78+I2QtBt+NVF52zFOTO8iGbXC2EXZcfaizxp
         syPg/dBUX2hToZvcUTpD+czYfrRw5crN2vey7CoePIDlxvhbRn4jKEtVasFgYbYadRKT
         uIII/cayZYqptv+yRMmyM+Wfpd5/UPoabOL1LFJ6elItbp/e6VHQDna35ucIS9DgJdAS
         QwUA3GiJRf5dQk/OTJ3hXfUBDFz7VSwh76MedBtdvOPKN3bvoe9PwVVR6Es4OllczpXD
         WRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687903076; x=1690495076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1QqN2jdF+WL3G2Fn2F+gnSyyU4sNUKe3JWXuNtILlE=;
        b=SPwSDgPAzjeW+gUOeyfIXKD/D4pvCtMAh6TK5c4AxzoSJUS8M0abe4O6ab78NKYinB
         n5oUGArtTL25FPPfYvBFwMnJSuqsnckaajRLRidu4gCnK1Pex8H3oWS9XgBNypBN7Fd7
         nD5FVIhHZXOMkedf5glw9UpUWNXnakAKqCKTege9iVqz1x2u9JIQ6gJvSOsbRCkXIYOz
         qWjv/byvf+cadwjSLkc6fygbzd7tFmxdyvVpUARGludIKikPprCK8gA/LcMpMLcOaRnP
         zKteP9anpWusUL+xKoG3JhDDnHgqiFxUfkC6TIBfRg7KquNr+nmBezwtBw+wmUE+ru0Z
         BDQw==
X-Gm-Message-State: AC+VfDyfk8I25866s/6SvTfHxvmm2JoIiO50bfYFZ7duFIZBHI0oxV9C
	YhpybZqQWdQ5UL2Q26CMCfk=
X-Google-Smtp-Source: ACHHUZ6lN48OedTSkLTDBhYcXWegZDranrwbL7k9xhFTjM3m37Ei4jw/mCpSF8qmoSte/cwaCNHhUw==
X-Received: by 2002:a17:902:c407:b0:1ac:8717:d436 with SMTP id k7-20020a170902c40700b001ac8717d436mr14008978plk.60.1687903075769;
        Tue, 27 Jun 2023 14:57:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001b69303db65sm6438851plh.26.2023.06.27.14.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:57:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a7e61e75-cc94-9771-4b56-d1a7c35c13f2@roeck-us.net>
Date: Tue, 27 Jun 2023 14:57:52 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Dinh Nguyen <dinguyen@kernel.org>, Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
 <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
 <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
 <70776142-a778-9c20-5594-835ed6f7e7a2@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <70776142-a778-9c20-5594-835ed6f7e7a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/23 14:46, Dinh Nguyen wrote:
> 
> 
> On 6/27/23 16:01, Guenter Roeck wrote:
>> On 6/27/23 13:05, Dinh Nguyen wrote:
>>>
>>>
>>> On 6/27/23 14:56, Vishal Moola wrote:
>>>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>>
>>>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>>>>> ptdesc equivalents.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>>>
>>>>>>>> This patch causes all nios2 builds to fail.
>>>>>>>
>>>>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>>>>> this architecture and it worked, but let me know if something fails
>>>>>>> when its applied on top of those patches (or the rest of the patchset).
>>>>>>
>>>>>>
>>>>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>>>>> pending-fixes branch of linux-next.
>>>>>>
>>>>>
>>>>> A quick check shows that the build fails with next-20230627. See log below.
>>>>
>>>> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
>>>> drop this patch from -next; it shouldn't be in without the rest of the
>>>> patchset which
>>>> I intend to have Andrew take through the mm tree.
>>>>
>>>
>>> I apologize, but I queue this patch up for Linus and it's been pulled for this merge window. I didn't realize you were going to take this patchset through another tree.
>>>
>>> Sorry about that.
>>>
>>
>> Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
>> are now broken.
>>
> 
> Please let me know if you need to do anything. I'm going to out for a week starting tomorrow.
> 

Not sure I understand. It seems to me that it would have to be you to do something.
After all, you are the nios2 maintainer, and nios2 builds in mainline are now
broken. Maybe send a revert ? Am I missing something ?

Guenter

