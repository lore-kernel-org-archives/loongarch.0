Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8431176AC8
	for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732618832; cv=none; b=b4USRBtT860OsZiVWEOcXSvY+/UsBR6UieiNudzPdYFEA4x078biAFIf7HlQxzJyRctUlAdzHG0G/X3GPWlhZqNOu8o9gLMpBBViIx6dfkwPZE49a1jWiuEF3xofCqJaKRKgotJsvKH/OO/zmLMeb+ptZkUEn46vpb7yWVTn6k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732618832; c=relaxed/simple;
	bh=mB6qv9SaMnC7ZRWUJFw8JXa956LhH4qs4ldYN+4ZTbA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XzZwFTuC6I8WZZq6zmA5kFsEXZOeA8KrATT8k1/LowEceQjzrSPdurVu65MhT+lxxkAILmvgYV5aeQ+UI3rmzq51s3J3DMln79E3z5iINdLuU90thLotZ7NQvp2+YFnSjqGxAzljlitQpiMyWrOJRRePYrDxYduuT6TmaoRXxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxGeFKqkVnSBFJAA--.11653S3;
	Tue, 26 Nov 2024 19:00:26 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxS+BJqkVn+nFoAA--.22213S3;
	Tue, 26 Nov 2024 19:00:26 +0800 (CST)
Subject: Re: [PATCH v4 04/10] objtool: Handle PC relative relocation type
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-5-yangtiezhu@loongson.cn>
 <20241126071935.2vmsna54zsa5cdho@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <aebad82f-3979-f7e4-a17b-5f943cd0f18b@loongson.cn>
Date: Tue, 26 Nov 2024 19:00:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241126071935.2vmsna54zsa5cdho@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxS+BJqkVn+nFoAA--.22213S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryDJrW8tF17JryftFWkAFc_yoW8WF1xpF
	15ua15KrsI9r17WwsrK3WkWry5Gw4xWryfXryIkry0kFnrZFn5trWIk3W5ua1UZw1FgayI
	va9xKFyxAa1qyagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
	b18UUUUU=

On 11/26/2024 03:19 PM, Josh Poimboeuf wrote:
> On Fri, Nov 22, 2024 at 12:49:59PM +0800, Tiezhu Yang wrote:
>> When compling with Clang on LoongArch, there exists 32 bit PC relative
>> relocation type, it needs to get the offset with "S + A - PC" according
>> to the spec of "ELF for the LoongArch Architecture".
>>
>> This is preparation for later patch on LoongArch, there is no effect for
>> the other archs with this patch.
>>
>> Link: https://github.com/loongson/la-abi-specs/blob/release/laelf.adoc
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  tools/objtool/check.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
>> index 19d1263e64e4..8733ca620cca 100644
>> --- a/tools/objtool/check.c
>> +++ b/tools/objtool/check.c
>> @@ -2126,6 +2126,11 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>>  		if (reloc->sym->type == STT_SECTION) {
>>  			/* Addend field in the relocation entry associated with the symbol */
>>  			offset = reloc_addend(reloc);
>> +			/* Handle the special cases compiled with Clang on LoongArch */
>> +			if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
>> +			    reloc_type(reloc) == R_LARCH_32_PCREL)
>> +				offset = reloc->sym->offset + reloc_addend(reloc) -
>> +					 (reloc_offset(reloc) - reloc_offset(table));
>
> Please, no more "special cases".  It makes the common code unreadable.
> We should avoid checking 'elf->ehdr.e_machine' in check.c.

OK.

>
> Maybe there should be an arch-specific function arch_adjusted_addend().
>

Will do it.

