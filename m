Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB957C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:31:36 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxyepvGsNkzQ0LAA--.17966S3;
	Fri, 28 Jul 2023 09:31:27 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxjiNuGsNkELg9AA--.58652S3;
	Fri, 28 Jul 2023 09:31:27 +0800 (CST)
Subject: Re: [PATCH v1 4/6] objtool/LoongArch: Enable orc to be built
To: Peter Zijlstra <peterz@infradead.org>
References: <1690272910-11869-1-git-send-email-yangtiezhu@loongson.cn>
 <1690272910-11869-5-git-send-email-yangtiezhu@loongson.cn>
 <20230725115609.GD3765278@hirez.programming.kicks-ass.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d49af603-82cf-a88e-37db-1c031c5f8881@loongson.cn>
Date: Fri, 28 Jul 2023 09:31:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230725115609.GD3765278@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxjiNuGsNkELg9AA--.58652S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFykXr4DtrWUJF4xuFWrXrc_yoW8tr13pa
	4DGayxKFWxtr15G3ZaqanrCFySgwnagrWxCryku3y7XF9a9rn7GFyIvr1j9F1DZ3sa9a42
	vay7tr1DJF1FvFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUU
	UUU==



On 07/25/2023 07:56 PM, Peter Zijlstra wrote:
> On Tue, Jul 25, 2023 at 04:15:08PM +0800, Tiezhu Yang wrote:
>
>> +void arch_write_orc(struct elf *elf, struct orc_entry *orc)
>> +{
>> +	orc->ra_offset = bswap_if_needed(elf, orc->ra_offset);
>> +}
>
> This hardly 'writes' anything, all it does is a bswap.
>
>> diff --git a/tools/objtool/orc_gen.c b/tools/objtool/orc_gen.c
>> index 1eff7e0a..6975056 100644
>> --- a/tools/objtool/orc_gen.c
>> +++ b/tools/objtool/orc_gen.c
>> @@ -14,6 +14,8 @@
>>  #include <objtool/warn.h>
>>  #include <objtool/endianness.h>
>>
>> +void __weak arch_write_orc(struct elf *elf, struct orc_entry *orc) {}
>
> And for that you need a weak function? What's wrong with an inline if
> anything?
>
>>  static int write_orc_entry(struct elf *elf, struct section *orc_sec,
>>  			   struct section *ip_sec, unsigned int idx,
>>  			   struct section *insn_sec, unsigned long insn_off,
>> @@ -26,6 +28,7 @@ static int write_orc_entry(struct elf *elf, struct section *orc_sec,
>>  	memcpy(orc, o, sizeof(*orc));
>>  	orc->sp_offset = bswap_if_needed(elf, orc->sp_offset);
>>  	orc->bp_offset = bswap_if_needed(elf, orc->bp_offset);
>> +	arch_write_orc(elf, orc);
>
> Why can't this simply be:
>
> 	orc->ra_offset = bswap_if_needed(elf, orc->ra_offset);
>
> AFAICT this won't actually do anything for x86 and I don't think Power
> got around to doing ORC yet.
>
>>
>>  	/* populate reloc for ip */
>>  	if (!elf_init_reloc_text_sym(elf, ip_sec, idx * sizeof(int), idx,
>
> Again, not much explaination for why you did things
>

The initial aim is to keep consistent with the above two lines,
but for now, I think there is no need to call bswap_if_needed()
for LoongArch, the related changes are not necessary, I will
drop them too.

LoongArch is little-endian, the __BYTE_ORDER is defined as
__LITTLE_ENDIAN, and elf->ehdr.e_ident[EI_DATA] is 1 which
is equal with ELFDATA2LSB, so need_bswap() returns false.

static inline bool need_bswap(struct elf *elf)
{
	return (__BYTE_ORDER == __LITTLE_ENDIAN) ^
	       (elf->ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
}

Thank you very much for your review, sorry for that.

Thanks,
Tiezhu

