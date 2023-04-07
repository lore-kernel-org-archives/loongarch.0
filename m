Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB621FDB
	for <loongarch@lists.linux.dev>; Fri,  7 Apr 2023 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1680861117; bh=xStM71TMN048Ko9ww+BuNB+3v2DyF7jsusOnwx7u2zY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kj0ExMKphuz60PvZsIJCRm+JsuEv1z4mLaBEJcQ4YmsrfI0LZt30DSJrhzej9b8qc
	 /15UHuafi18hwdUZ0jvwZmquzx2iBA5l/Ot6RAvK/H12YBNMwxrhVGJnpWQU9iCMHB
	 EktiuswpPJNE3yKtZ2aTinyLtVhniLARJj5gwnSI=
Received: from [100.100.33.167] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 795E4600F8;
	Fri,  7 Apr 2023 17:51:57 +0800 (CST)
Message-ID: <ab4f20ff-6aeb-f343-c4dc-24c46919176c@xen0n.name>
Date: Fri, 7 Apr 2023 17:51:57 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 2/3] LoongArch: Add larch_insn_gen_break() to generate
 break insn
Content-Language: en-US
To: Youling Tang <tangyouling@loongson.cn>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <1680833701-1727-1-git-send-email-yangtiezhu@loongson.cn>
 <1680833701-1727-3-git-send-email-yangtiezhu@loongson.cn>
 <0d309725-3b91-6902-de67-08bda48ccf57@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <0d309725-3b91-6902-de67-08bda48ccf57@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/4/7 10:30, Youling Tang wrote:
> /* snip */
> 
>> diff --git a/arch/loongarch/kernel/kprobes.c 
>> b/arch/loongarch/kernel/kprobes.c
>> index 08c78d2..a5c3712 100644
>> --- a/arch/loongarch/kernel/kprobes.c
>> +++ b/arch/loongarch/kernel/kprobes.c
>> @@ -4,19 +4,8 @@
>>  #include <linux/preempt.h>
>>  #include <asm/break.h>
>>
>> -static const union loongarch_instruction breakpoint_insn = {
>> -    .reg0i15_format = {
>> -        .opcode = break_op,
>> -        .immediate = BRK_KPROBE_BP,
>> -    }
>> -};
>> -
>> -static const union loongarch_instruction singlestep_insn = {
>> -    .reg0i15_format = {
>> -        .opcode = break_op,
>> -        .immediate = BRK_KPROBE_SSTEPBP,
>> -    }
>> -};
>> +#define breakpoint_insn larch_insn_gen_break(BRK_KPROBE_BP)
>> +#define singlestep_insn larch_insn_gen_break(BRK_KPROBE_SSTEPBP)
> 
> IMO, Defined as KPROBE_BP_INSN, KPROBE_SSTEPBP_INSN may be better.

Are you suggesting to hardcode the instruction words for those two BREAK 
flavors? I don't think it's better because even more structured info is 
lost, and the compiler would generate the same code (if not, it's the 
compiler that's to be fixed).

Actually, I don't know why this commit was necessary in the first place. 
For the very least, it consisted of two logical changes (pass around 
instruction words instead of unions; and change the BREAK insns to make 
them words) that should get split; but again, the generated code should 
be identical anyway, so it seems a lot of churn for no benefit and 
reduced readability.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

