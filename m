Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F77B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682429953; bh=jTBUvOKpu+QtkXcQetcv0Xt5ZBFlI4VLqloawXzfQMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALkaGQUYn3pA6KYl8R9rAPwSTxfpZjvzLQ4GzddpoWVK20WFCYjzgHUYHm7RejUfN
	 FFehH0GUAENq5StmPYwSk4cXTT7ud/EPDqao5Z3vpkvvaYo9H5kG3+dJV3VTJ51ksQ
	 hwKAodm+wmfNymtO3O1PqTxdkKZelDfB9smIMrPo=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CE013600A6;
	Tue, 25 Apr 2023 21:39:13 +0800 (CST)
Message-ID: <293fb6d9-db3a-1435-5f1a-55103677d42c@xen0n.name>
Date: Tue, 25 Apr 2023 21:39:13 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v7 03/12] LoongArch: Print GPRs with ABI names when
 showing registers
Content-Language: en-US
To: Enze Li <lienze@kylinos.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20230425081023.3809434-1-kernel@xen0n.name>
 <20230425081023.3809434-4-kernel@xen0n.name>
 <e9bfc2e3f9d90797c032798b7bb762537a56a68e.camel@kylinos.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <e9bfc2e3f9d90797c032798b7bb762537a56a68e.camel@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/4/25 21:06, Enze Li wrote:
> Hi Xuerui,
> 
> Thanks for doing this.  Overall, I like this idea, but I think I found
> an easily fixable problem in this patch, please see below.
> 
> On Tue, 2023-04-25 at 16:10 +0800, WANG Xuerui wrote:
>> From: WANG Xuerui <git@xen0n.name>
>>
>> Show PC (CSR.ERA) in place of $zero, and also show the syscall
>> restart
>> flag (conveniently stuffed in regs[0]) if non-zero.
>>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   arch/loongarch/kernel/traps.c | 36 ++++++++++++++++++++++-----------
>> --
>>   1 file changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/traps.c
>> b/arch/loongarch/kernel/traps.c
>> index 529165eb6e6b..cdb17d6afc77 100644
>> --- a/arch/loongarch/kernel/traps.c
>> +++ b/arch/loongarch/kernel/traps.c
>> @@ -158,22 +158,32 @@ static void __show_regs(const struct pt_regs
>> *regs)
>>          const int field = 2 * sizeof(unsigned long);
>>          unsigned int excsubcode;
>>          unsigned int exccode;
>> -       int i;
>>   
>>          show_regs_print_info(KERN_DEFAULT);
>>   
>> -       /*
>> -        * Saved main processor registers
>> -        */
>> -       for (i = 0; i < 32; ) {
>> -               if ((i % 4) == 0)
>> -                       printk("$%2d   :", i);
>> -               pr_cont(" %0*lx", field, regs->regs[i]);
>> -
>> -               i++;
>> -               if ((i % 4) == 0)
>> -                       pr_cont("\n");
>> -       }
>> +       /* Print GPRs except $zero (substituting with PC/ERA) */
>> +#define GPR_FIELD(x) field, regs->regs[x]
> 
> The checkpatch.pl throws up the following error,
> 
> -------------------------------------------------------------------
> ERROR: Macros with complex values should be enclosed in parentheses
> #40: FILE: arch/loongarch/kernel/traps.c:165:
> +#define GPR_FIELD(x) field, regs->regs[x]
> -------------------------------------------------------------------
> 
> and I think adding a pair of parentheses is a good way, like this,
> 
> =======================================================================
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -162,7 +162,7 @@ static void __show_regs(const struct pt_regs *regs)
>          show_regs_print_info(KERN_DEFAULT);
>   
>          /* Print GPRs except $zero (substituting with PC/ERA) */
> -#define GPR_FIELD(x) field, regs->regs[x]
> +#define GPR_FIELD(x) (field, regs->regs[x])

Have you checked whether the code even compiles after making this change?

The macro use here is deliberate because otherwise for every register 
printed we would have to repeat the "field" argument once, leading to 
very long lines or more vertical space occupied. (The kernel vsprintf 
implementation doesn't support overriding argument positions like with 
"%0*1$lx", unlike modern C.)

>          pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",
>                  field, regs->csr_era, GPR_FIELD(1), GPR_FIELD(2),
> GPR_FIELD(3));
>          pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",
> =======================================================================
> 
> In addition, the checkpatch.pl also throws up some warnings.  Should
> these use pr_info() instead?

Hmm perhaps. I originally thought of the whole show_regs output as one 
entry. Now I see how that's not the case and I'll tweak a bit. Thanks 
for pointing out.

> 
> --------------------------------------------------------
> WARNING: Avoid logging continuation uses where feasible
> #41: FILE: arch/loongarch/kernel/traps.c:166:
> +	pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",
> 
> WARNING: Avoid logging continuation uses where feasible
> #43: FILE: arch/loongarch/kernel/traps.c:168:
> +	pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",
> 
> WARNING: Avoid logging continuation uses where feasible
> #45: FILE: arch/loongarch/kernel/traps.c:170:
> +	pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx a7 %0*lx\n",
> --------------------------------------------------------
> 
> Best Regards,
> Enze
> 
>> +       pr_cont("pc %0*lx ra %0*lx tp %0*lx sp %0*lx\n",
>> +               field, regs->csr_era, GPR_FIELD(1), GPR_FIELD(2),
>> GPR_FIELD(3));
>> +       pr_cont("a0 %0*lx a1 %0*lx a2 %0*lx a3 %0*lx\n",
>> +               GPR_FIELD(4), GPR_FIELD(5), GPR_FIELD(6),
>> GPR_FIELD(7));
>> +       pr_cont("a4 %0*lx a5 %0*lx a6 %0*lx a7 %0*lx\n",
>> +               GPR_FIELD(8), GPR_FIELD(9), GPR_FIELD(10),
>> GPR_FIELD(11));
>> +       pr_cont("t0 %0*lx t1 %0*lx t2 %0*lx t3 %0*lx\n",
>> +               GPR_FIELD(12), GPR_FIELD(13), GPR_FIELD(14),
>> GPR_FIELD(15));
>> +       pr_cont("t4 %0*lx t5 %0*lx t6 %0*lx t7 %0*lx\n",
>> +               GPR_FIELD(16), GPR_FIELD(17), GPR_FIELD(18),
>> GPR_FIELD(19));
>> +       pr_cont("t8 %0*lx u0 %0*lx s9 %0*lx s0 %0*lx\n",
>> +               GPR_FIELD(20), GPR_FIELD(21), GPR_FIELD(22),
>> GPR_FIELD(23));
>> +       pr_cont("s1 %0*lx s2 %0*lx s3 %0*lx s4 %0*lx\n",
>> +               GPR_FIELD(24), GPR_FIELD(25), GPR_FIELD(26),
>> GPR_FIELD(27));
>> +       pr_cont("s5 %0*lx s6 %0*lx s7 %0*lx s8 %0*lx\n",
>> +               GPR_FIELD(28), GPR_FIELD(29), GPR_FIELD(30),
>> GPR_FIELD(31));
>> +
>> +       /* The slot for $zero is reused as the syscall restart flag
>> */
>> +       if (regs->regs[0])
>> +               pr_cont("syscall restart flag: %0*lx\n",
>> GPR_FIELD(0));
>> +#undef GPR_FIELD
>>   
>>          /*
>>           * Saved csr registers
> 
> 

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

