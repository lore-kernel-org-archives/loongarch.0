Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91081857
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 03:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666063780; bh=Nsjx7HBFdQ0PfKSORxy+GK4HHujeOaw7K/qEJvRNjDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tk/mE1T2UqlKlO0m0RjMedDu0q4aSjzLg9ZnUPP8W4ch54CYqZ/zIzpIl6rhi0gkT
	 UkMUTEUZG+PUwcINFgdnof+cxfS2LdGB5khqwLMAy0R6IbB+yG/DoL1QoTG7nrPU6B
	 bBxuZQ6BLgDFn83gnTEMHXeTuRzm+XG8QQ0jDlm4=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DC17E60087;
	Tue, 18 Oct 2022 11:29:39 +0800 (CST)
Message-ID: <c34a277a-1735-65e6-c97d-fcc2ac3d57e6@xen0n.name>
Date: Tue, 18 Oct 2022 11:29:39 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH V2] LoongArch: Add unaligned access support
To: Huacai Chen <chenhuacai@kernel.org>,
 David Laight <David.Laight@aculab.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Xuefeng Li <lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20221017022330.2383060-1-chenhuacai@loongson.cn>
 <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
 <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H5WM97+Um9ULjv7gT3i5pJ3GfQ8ex6NRNr6uzmMgdVY_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/10/18 10:24, Huacai Chen wrote:
> Hi, David,
> 
> On Mon, Oct 17, 2022 at 8:58 PM David Laight <David.Laight@aculab.com> wrote:
>>
>> From: Huacai Chen
>>> Sent: 17 October 2022 03:24
>>>
>>> Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
>>> unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
>>> Loongson-3C5000) are configurable whether support unaligned access in
>>> hardware. This patch add unaligned access emulation for those LoongArch
>>> processors without hardware support.
>>>
>> ...
>>> +     /*
>>> +      * This load never faults.
>>> +      */
>>> +     __get_inst(&insn.word, pc, user);
>>
>> On what basis does it never fault?
>> Any user access can fault.
>> If nothing else another thread of the process can unmap
>> the page.
> Yes, this can happen, since __get_inst() handles fault, we can just
> remove the comment.
> 
>>
>>> +     if (user && !access_ok(addr, 8))
>>> +             goto sigbus;
>>
>> Surely that is technically wrong - a two or four byte
>> access is valid right at the end of valid user addreeses.
> Yes, this check should be moved to each case.
> 
>>
>>> +
>>> +     if (insn.reg2i12_format.opcode == ldd_op ||
>>> +             insn.reg2i14_format.opcode == ldptrd_op ||
>>> +             insn.reg3_format.opcode == ldxd_op) {
>>> +             res = unaligned_read(addr, &value, 8, 1);
>>
>> That is the most horrid indentation of long lines I've
>> ever seen.
>> I'd also guess you can common up some of this code
>> by looking at the instruction field that include the
>> transfer width.
>>
>> The long elsif list will generate horrid code.
>> But maybe since you've just taken a fault it really
>> doesn't matter.
>> Indeed just emulating in C using byte accesses
>> it probably fine.
> I want to keep the assembly, because we can use more efficient methods
> with the upcoming alternative mechanism.

What about my more structured approach in another reply that avoids the 
huge else-if conditions? Both the terrible line wraps and codegen could 
be avoided.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

