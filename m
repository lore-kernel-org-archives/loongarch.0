Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D65B55C29
	for <loongarch@lists.linux.dev>; Thu, 12 Dec 2024 01:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967273; cv=none; b=IndBl4A28N75hQRkW7S3NKv5Alq2QuNP6w8C9a3RhmNrwYfAtrNWNz8Mu1YBlLCHVnFHuPwzPuyf6IcyOtzyw/xmj6nL5nu2dYSigYgzNwfrWP1Y/fVkqXmUWfI+6hHzVOS8P0CtmdlOTLIbNThVTGU60iMDoYctAFogSHidDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967273; c=relaxed/simple;
	bh=HKMGL1rl+Cnji1XVOHgCwdmVL0KJzhUvbGKxYFcBkwQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LAyzMeNu1xVv2z3JvWTn4oHOny0yIntdqDXuAf/VQEmss792Tk8CickX+/XbG5hdqSYriZM/DpESeEfGYmcoCcKCE0Tjl2Sy87yVWtu0PO5mkegBGxqiQ6q33gTKylp3+376U4dV7J2TVzSqPnFRH+0YEgdoII88VQfqdE6n80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxieGiPVpnq+hVAA--.39345S3;
	Thu, 12 Dec 2024 09:34:26 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxbUegPVpnyx2AAA--.8551S3;
	Thu, 12 Dec 2024 09:34:24 +0800 (CST)
Subject: Re: [PATCH v5 03/10] objtool: Handle PC relative relocation type
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241207015915.1159-1-yangtiezhu@loongson.cn>
 <20241207015915.1159-4-yangtiezhu@loongson.cn>
 <20241209203544.axetpzva7vg3hsc5@jpoimboe>
 <9d14c8fa-d61d-bd12-efd7-5a17f4f8cb35@loongson.cn>
 <20241212003526.2kutif7m2svtbp6l@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <91b079a1-4f0f-8017-cdae-f6e2729d72a3@loongson.cn>
Date: Thu, 12 Dec 2024 09:34:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241212003526.2kutif7m2svtbp6l@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxbUegPVpnyx2AAA--.8551S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw17WryUWFWUJF17tr1DurX_yoW8XF43pF
	WqgrZrtFs8Jas2gwsFqw4vqFyru3ykJas8Gr90kr1xAw15Xw1rKaykK3y5Ka4UGr10yw1I
	va1Igw1UGF4DJ3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8j-e5UUUUU==

On 12/12/2024 08:35 AM, Josh Poimboeuf wrote:
> On Wed, Dec 11, 2024 at 11:16:33AM +0800, Tiezhu Yang wrote:
>> When compiling on LoongArch, there are some PC relative relocation types
>> for rodata, it needs to calculate the symbol offset with "S + A - PC" in
>> this case according to the spec of "ELF for the LoongArch Architecture",
>> the "PC" is the index of each jump table which is equal with the value
>> of reloc_offset(reloc) - reloc_offset(table).
>>
>> I will add the above description to the commit message to make it clear.
>
> I understand how PC-relative addressing works.
>
> The oddity here is that "PC" is the jump table's base address rather
> than the entry address.

If there is only one jump table in the rodata, the "PC" is the entry
address which is equal with the value of reloc_offset(reloc), at this
time, reloc_offset(table) is 0.

If there are many jump tables in the rodata, the "PC" is the offset
of the jump table's base address which is equal with the value of 
reloc_offset(reloc) - reloc_offset(table).

> That has nothing to do with the ELF spec or
> even how R_LARCH_32_PCREL is implemented.  Rather it seems to be a quirk
> related to how loongarch jump table code expects the entries to be.
>
> So the arch_adjust_offset() name seems wrong, as this is specific to
> the jump table implementation, rather than relocs in general.
>
> Instead call it arch_jump_table_sym_offset()?

OK, will modify it and add the above description to the commit message
to make it clear.

Thanks,
Tiezhu

