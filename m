Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B5413D24E
	for <loongarch@lists.linux.dev>; Wed, 27 Nov 2024 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732690901; cv=none; b=sZYLC43ixx4oM30ujTCeiCo0zV3OYb4p/gT4uLMLP/ioZ2Qwkjt2bapVFmQpiIID79+gHVeZv8mF8113YiPahhsd0u8MUgi0CTQDDcAb6z7ZXFduWPLVdxUznFV34u0LdFio95I+Ai7Cmf79pH8pGNZVmsscRpx8VWruQHarNYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732690901; c=relaxed/simple;
	bh=gWyFNicxctPBg9J4e26jnWJduJq5hCPP0tXpiqu81B8=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EJtnZfKxQcXqZo4jgBKCBkRS0Ow2kAOv4nJGd4HUFDs/4rX+fUbLAPACJD1nZYSlfLARY88IyXmq0TBzRUNHcTPsFJApcTuj/gUqunnnJ/xCgviASsG1/kfZ2yyx2R4UDJT5+ZQhH8z4XsM42U4obyQDPobE8irfjV9KUhgAG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxbeLPw0ZnyadJAA--.12238S3;
	Wed, 27 Nov 2024 15:01:35 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxVcDNw0ZnkJBpAA--.44731S3;
	Wed, 27 Nov 2024 15:01:34 +0800 (CST)
Subject: Re: [PATCH v4 06/10] objtool: Handle unsorted table offset of rodata
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-7-yangtiezhu@loongson.cn>
 <8cb35ab7-56d0-8e8d-5e18-1bc2b94aeeeb@loongson.cn>
 <20241127012042.by4g34m4twlfmove@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <53677c5f-2ea5-a227-66f7-b27c27665f6b@loongson.cn>
Date: Wed, 27 Nov 2024 15:01:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241127012042.by4g34m4twlfmove@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMAxVcDNw0ZnkJBpAA--.44731S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtrW5Ww15Wr1ktry8Jw4xAFc_yoWfCwb_ur
	1I9F4DWayDJF1kG3Wqyws7JF4jgw1UXa1jqr4Iyr4qvwnxZrWv9w4xuFyS9345J3ZFgr90
	g3WqqFWxuw4jgosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5
	r7UUUUU==



On 11/27/2024 09:20 AM, Josh Poimboeuf wrote:
> On Tue, Nov 26, 2024 at 09:28:19PM +0800, Tiezhu Yang wrote:
>>> +		/* Handle the special cases compiled with Clang on LoongArch */
>>> +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
>>> +		    reloc->sym->type == STT_SECTION && reloc != table &&
>>> +		    reloc_offset(reloc) == reloc_offset(table) + rodata_table_size)
>>> +			break;
>>
>> I think it can be generic, like this:
>>
>>                 /* Check for the end of the table: */
>>                 if (reloc != table && reloc == next_table)
>>                         break;
>>
>>                 if (reloc != table &&
>>                     reloc_offset(reloc) == reloc_offset(table) +
>> rodata_table_size)
>>                         break;
>>
>> What do you think?
>
> I'm not sure, this patch is hard to review because it uses
> insn->table_size which doesn't get set until the next patch.
>
> Maybe this patch should come after patches 7 & 8, or maybe they should
> be squashed?

OK, I will squash the changes into patch #7.

