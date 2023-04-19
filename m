Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5009E23C3
	for <loongarch@lists.linux.dev>; Wed, 19 Apr 2023 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1681888609; bh=7s/jLHBctsRrU3qW3AWEjYwuAveEJvUVNRGYx1QOcas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A7dabfFt4fv1j4OwftiUanXz4+GWoe+UDksFoMlt3IEV7k9Vk/UyV9OlrDCKcy7qk
	 CL6u3sKz61CwndSKbps4goOJB4ozhYxt/VvV76lQaGtra0ULCum8oJsbIwh3yqtus3
	 WjlSkY119xN26Bcntn3H5acyHPeEX9Auwbesr88o=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3C956011C;
	Wed, 19 Apr 2023 15:16:48 +0800 (CST)
Message-ID: <1fba4e9e-dd98-39d7-5ff9-027987551a88@xen0n.name>
Date: Wed, 19 Apr 2023 15:16:48 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/12] LoongArch: Print GPRs with ABI names when
 showing registers
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20230416060356.3711529-1-kernel@xen0n.name>
 <20230416060356.3711529-4-kernel@xen0n.name>
 <CAAhV-H4JmVq9y02gPxOCm6dFO+BS9=BLj_u276UdtEJ+DUHbUw@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4JmVq9y02gPxOCm6dFO+BS9=BLj_u276UdtEJ+DUHbUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/4/19 14:49, Huacai Chen wrote:
> On Sun, Apr 16, 2023 at 2:04 PM WANG Xuerui <kernel@xen0n.name> wrote:
>>
>> From: WANG Xuerui <git@xen0n.name>
>>
>> Print 3 registers per line to fit the entire line within 75 columns even
>> with timestamp prefixed to each line, to ease future copy-pastes for all.
>>
>> And show the syscall restart flag (in place of the saved "$zero") if
>> non-zero.
>>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   arch/loongarch/kernel/traps.c | 38 +++++++++++++++++++++++------------
>>   1 file changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
>> index 2f4279f612e7..f61de72e0c3a 100644
>> --- a/arch/loongarch/kernel/traps.c
>> +++ b/arch/loongarch/kernel/traps.c
>> @@ -158,22 +158,34 @@ static void __show_regs(const struct pt_regs *regs)
>>          const int field = 2 * sizeof(unsigned long);
>>          unsigned int excsubcode;
>>          unsigned int exccode;
>> -       int i;
>>
>>          show_regs_print_info(KERN_DEFAULT);
>>
>> -       /*
>> -        * Saved main processor registers
>> -        */
>> -       for (i = 0; i < 32; ) {
>> -               if ((i % 4) == 0)
>> -                       printk("$%2d   :", i);
>> -               pr_cont(" %0*lx", field, regs->regs[i]);
>> -
>> -               i++;
>> -               if ((i % 4) == 0)
>> -                       pr_cont("\n");
>> -       }
>> +       /* Print most of the GPRs, 3 per row to fit output in 75 columns */
> I prefer print 4 registers per line, including r0 (for alignment we
> don't use zero).
> e.g.,
> r0(r0) .... r1(ra) .... r2(tp) .... r3(sp) ....

I don't agree here. The rationale for 3 GPRs per row is clearly stated 
in the commit message and *this exact comment*. If we can somehow fit 4 
GPRs within 75 columns I'd be all for changing, but sadly we can't.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

