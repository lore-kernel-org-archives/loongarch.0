Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF6A389115
	for <loongarch@lists.linux.dev>; Tue,  1 Sep 2026 01:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225216; cv=none; b=HyJA9C8uioydZlRuByggbcbZBemEtXmPNzxoMZzP7Jd7UF4e30wHKeDiOt2YSyA2D0uL90hhesYTjq64u2c9VrgbOAEkJ5a0+8GFJw1ZSN/UAeGrlg6Pb10wkHSGEatTrL2MwgkF0HvoVzhAztj6XTAG3NB/pRh2ljZCtJ68+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225216; c=relaxed/simple;
	bh=HE4mCDn6ofnArcRxya5qMIpUJ3FWRE49JTxy3bpHbOA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kuOkT1PpFFbVIhsrBwY8jVo4Gc1FpAkiOQ/aKIkQ4A9vvQV3kYt0jFDb8PaX+ehNUyEVYlkCJ9r6z/E4+cBWp/GlVZudIZ1nYmhnLW6JyRn8aKLQ6hfWVnrb4fBLom7AYwtQGHdF9aF9uf2/EBreGPN/H1t6sE7G/VIf+qBAycM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxrtK6JpZq9jYHAA--.20323S3;
	Tue, 01 Sep 2026 09:13:31 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc25JpZqbJQYAA--.24104S2;
	Tue, 01 Sep 2026 09:13:30 +0800 (CST)
Subject: Re: [PATCH v1 4/6] LoongArch: Only send SIGTRAP signal if necessary
 in do_watch()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260826110306.6847-1-yangtiezhu@loongson.cn>
 <20260826110306.6847-5-yangtiezhu@loongson.cn>
 <CAAhV-H40Zu0zTLQ7-S0tzqMNJ8KRB4iF+rzzrZG_Nd4ETveDDA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5bae6d0d-c159-00c2-1660-d0dd3d0ce875@loongson.cn>
Date: Tue, 1 Sep 2026 09:13:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H40Zu0zTLQ7-S0tzqMNJ8KRB4iF+rzzrZG_Nd4ETveDDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc25JpZqbJQYAA--.24104S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFyUJr4xWF13WryrZF1rKrX_yoW5Gr18pF
	ZrAF1xKFWkGr18Xa17Ca1DuF47CrsYqF4xu3ySy34ruFZIg3sYgr1vyr4avr47A34DXa40
	qr1jva1fuF1rJrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UU
	UUU==

On 2026/8/31 下午10:02, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Wed, Aug 26, 2026 at 7:03 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> In do_watch(), the kernel unconditionally forces a SIGTRAP signal at the
>> end of the handler via force_sig(SIGTRAP). This is essential for ptrace
>> operations, but it severely disrupts standard perf_event usage.

...

>> @@ -811,6 +811,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
>>   asmlinkage void noinstr do_watch(struct pt_regs *regs)
>>   {
>>          irqentry_state_t state = irqentry_enter(regs);
>> +       bool perf_sigtrap = false;
> This is not for perf only, so need_sigtrap is better.
> 
>>
>>   #ifndef CONFIG_HAVE_HW_BREAKPOINT
>>          pr_warn("Hardware watch point handler not implemented!\n");
>> @@ -851,11 +852,12 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
>>                          }
>>                  }
>>          } else {
>> -               breakpoint_handler(regs);
>> -               watchpoint_handler(regs);
>> +               perf_sigtrap |= breakpoint_handler(regs);
>> +               perf_sigtrap |= watchpoint_handler(regs);
> Let breakpoint_handler() and watchpoint_handler() return "int", then
> see below...
> 
>>          }
>>
>> -       force_sig(SIGTRAP);
>> +       if (current->ptrace || perf_sigtrap)
> Define need_sigtrap as "int" and initialize it as current->ptrace,
> then we can only use "if (need_sigtrap)" here.

Thanks for your suggestion, it looks better.

But I think the type can be bool since it is either true or false.

Here is the incremental diff based on this v1 patch:

```
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index de0c9b03d551..4cbf84b148cd 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -811,7 +811,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
  asmlinkage void noinstr do_watch(struct pt_regs *regs)
  {
         irqentry_state_t state = irqentry_enter(regs);
-       bool perf_sigtrap = false;
+       bool need_sigtrap = !!current->ptrace;

  #ifndef CONFIG_HAVE_HW_BREAKPOINT
         pr_warn("Hardware watch point handler not implemented!\n");
@@ -852,11 +852,11 @@ asmlinkage void noinstr do_watch(struct pt_regs *regs)
                         }
                 }
         } else {
-               perf_sigtrap |= breakpoint_handler(regs);
-               perf_sigtrap |= watchpoint_handler(regs);
+               need_sigtrap |= breakpoint_handler(regs);
+               need_sigtrap |= watchpoint_handler(regs);
         }

-       if (current->ptrace || perf_sigtrap)
+       if (need_sigtrap)
                 force_sig(SIGTRAP);
  out:
  #endif
```

If you are OK with the above changes, I will send out v2 later.

Thanks,
Tiezhu

