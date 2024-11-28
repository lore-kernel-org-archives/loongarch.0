Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F77A18E25
	for <loongarch@lists.linux.dev>; Thu, 28 Nov 2024 02:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732760888; cv=none; b=rYKiOi3HcTQFRm8CB/zE44CAQwdlzb4ZKHYMoruJqHPirzYB2fxg4g2YhsUvP7w5kRN/Ijrhc9xashP97M+CkKiIqTmKGrAoExBs9mR2krC2Pd4jbO0xxF5YpBt2FlO77NkZyOAm7+oznLfeKw+MO55d7LUxjdQSBURhzBeXomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732760888; c=relaxed/simple;
	bh=XUvF8BOx52ZbomoxewOyXdDZ9MMTtE5Of6ogPgU08gk=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZzlcVHUOzDwT+t9fvRoO4zbCUT/QwAwWCzpyXGKyVcMgUg47TZ/RRCoilbRumDWZqTbB+si+1ohgpzOZiQM1EkF0hAn7jRCZFo/HGVydkClXYEC+6CI8lcL5V8EAcOcfx+TVxYsv12RaCMIyFc5sJKKFbk6lB/kJCn7Mhu6YG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxDeMz1UdnCVZKAA--.13237S3;
	Thu, 28 Nov 2024 10:28:04 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx60Yx1Udn8tZqAA--.47370S3;
	Thu, 28 Nov 2024 10:28:02 +0800 (CST)
Subject: Re: [PATCH v4 06/10] objtool: Handle unsorted table offset of rodata
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-7-yangtiezhu@loongson.cn>
 <8cb35ab7-56d0-8e8d-5e18-1bc2b94aeeeb@loongson.cn>
 <20241127012042.by4g34m4twlfmove@jpoimboe>
 <53677c5f-2ea5-a227-66f7-b27c27665f6b@loongson.cn>
 <20241128001011.sjedpn2zhrhy6y6i@jpoimboe>
 <20241128001627.5czdlst5rd76qwsd@jpoimboe>
 <20241128010034.u3b7gkh4wqgb7d2s@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <19af5a40-9bf7-bab6-2a69-02fba652a7df@loongson.cn>
Date: Thu, 28 Nov 2024 10:28:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241128010034.u3b7gkh4wqgb7d2s@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCx60Yx1Udn8tZqAA--.47370S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ar1DtF4xuw1rKry8XryfXwc_yoW8uF15pF
	W5AFW8trs8tr1UtFnrtw1vkF13tw1UJF98X34DJr18t3sFvryfKFW8CrW5uF98Xrn8Kr4a
	qr47tr93ArW8X3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2nYF
	DUUUU

On 11/28/2024 09:00 AM, Josh Poimboeuf wrote:
> On Wed, Nov 27, 2024 at 04:16:29PM -0800, Josh Poimboeuf wrote:
>> On Wed, Nov 27, 2024 at 04:10:18PM -0800, Josh Poimboeuf wrote:
>>> On Wed, Nov 27, 2024 at 03:01:33PM +0800, Tiezhu Yang wrote:
>>>>
>>>>
>>>> On 11/27/2024 09:20 AM, Josh Poimboeuf wrote:
>>>>> On Tue, Nov 26, 2024 at 09:28:19PM +0800, Tiezhu Yang wrote:
>>>>>>> +		/* Handle the special cases compiled with Clang on LoongArch */
>>>>>>> +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
>>>>>>> +		    reloc->sym->type == STT_SECTION && reloc != table &&
>>>>>>> +		    reloc_offset(reloc) == reloc_offset(table) + rodata_table_size)
>>>>>>> +			break;
>>>>>>
>>>>>> I think it can be generic, like this:
>>>>>>
>>>>>>                 /* Check for the end of the table: */
>>>>>>                 if (reloc != table && reloc == next_table)
>>>>>>                         break;
>>>>>>
>>>>>>                 if (reloc != table &&
>>>>>>                     reloc_offset(reloc) == reloc_offset(table) +
>>>>>> rodata_table_size)
>>>>>>                         break;
>>>>>>
>>>>>> What do you think?
>>>>>
>>>>> I'm not sure, this patch is hard to review because it uses
>>>>> insn->table_size which doesn't get set until the next patch.
>>>>>
>>>>> Maybe this patch should come after patches 7 & 8, or maybe they should
>>>>> be squashed?
>>>>
>>>> OK, I will squash the changes into patch #7.
>>>
>>> I remembered Ard already solved a similar problem when he prototyped x86
>>> jump table annotation.  Can you pull this patch into your series:
>>>
>>> https://lore.kernel.org/20241011170847.334429-12-ardb+git@google.com
>>
>> Actually, I think I'm going to merge patches 2-5 from Ard's series as
>> they're a nice cleanup.  Let me do that and then you can base your next
>> version off tip/objtool/core once it gets updated with Ard's and Peter's
>> patches.
>
> Still talking to myself here, I think we'll only merge the above patch,
> since we don't know what the generic annotations are going to look like
> yet.

OK, my next version will be based on tip/objtool/core after
the merge window, by that time, hope the tree include Ard's
and Peter's patches to avoid conflicts.

Thanks,
Tiezhu

