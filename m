Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF3B41DDE4
	for <loongarch@lists.linux.dev>; Sat,  1 Aug 2026 03:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785554960; cv=none; b=PrzLr7VMdJNzc4qLGv8tBjigh6qkS4LPBaLHPR3r4NqWqJnQ0KPkn0AHmZ9l25vm1acIuLoFGF31dKeCFY/rRXjOB+CJqIzx57Fwu3L7mEllzrUIWYRaudPC6JWklRALDtjLkkl/sB7pLUoUxOlaVum0wGel4w5eorp6QbZua/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785554960; c=relaxed/simple;
	bh=Avb4CLerqE3hPW40DFNg/oUG/VYLcuNEOl0gjcFpI4k=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YHmtownbQjRQf1e2/tEkW8TBuuicUJjIkDzAXyxRSR8NVSm0Eq5Lw8WDmfrG1XNVh1F8JtsIa4jPz+fOuEYWjpmdamjTnpvZn6W/MScLnCR29QJTR4jXfWbqkCYqD7lHI6f+LdUqVcXOpT3U/oCOB3imliMkylzuTt2oCkO6KO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxqusLaG1q9mwJAA--.31688S3;
	Sat, 01 Aug 2026 11:29:15 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxDccJaG1qf3YfAA--.37140S2;
	Sat, 01 Aug 2026 11:29:14 +0800 (CST)
Subject: Re: [PATCH v2 2/2] LoongArch: Skip address pairing for non-exec
 sections
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
References: <20260721090606.8982-1-yangtiezhu@loongson.cn>
 <20260721090606.8982-3-yangtiezhu@loongson.cn>
 <11c42b7c-7805-cce7-305d-6e52c14db20e@loongson.cn>
 <CAAhV-H47kc-=A2syzJNLWOD1=TWumvyYWObL+xutrbSRy=WpWA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0471efa9-d2b4-22d1-6059-acfa6a150a94@loongson.cn>
Date: Sat, 1 Aug 2026 11:29:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H47kc-=A2syzJNLWOD1=TWumvyYWObL+xutrbSRy=WpWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxDccJaG1qf3YfAA--.37140S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw4UuryDZw1kAF4DJw15WrX_yoW8Gry5pr
	45GFZYkF4qv3yxAFs7Kwn8uFyjgrsYvFWjqr95Xw1vyas0g3ZYy3WDKr15tFWkua9YkF12
	vayaq3yrZ3WDAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U

On 2026/7/31 下午3:38, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Fri, Jul 24, 2026 at 2:07 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2026/7/21 下午5:06, Tiezhu Yang wrote:
>>> The module loader currently runs expensive address pairing logic for all
>>> sections blindly during relocation. For massive modules like amdgpu, this
>>> causes the loader to waste lots of CPU cycles analyzing non-exec sections.

...

>> Using the section flag check reduces the operation to a single check for
>> massive data sections; otherwise, the loader would have to perform six
>> redundant type comparisons across the if-statement and switch-case for
>> every single relocation entry.
> Please just drop this patch and make the first one better.

OK.

> Now the first patch has a risk that the distance between .init.text
> and .text of the same module exceeds 128MB. I solved it and you can
> verify:
> https://github.com/chenhuacai/linux/commit/f87f9d82869ebc71dca4c02bdff1cd203913a98f

Looks good to me, I think it is safe.

static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
{
...

	if (mod_mem_type_is_data(type))
		execmem_type = EXECMEM_MODULE_DATA;
	else
		execmem_type = EXECMEM_MODULE_TEXT;

	ptr = execmem_alloc_rw(execmem_type, size);
	if (!ptr)
		return -ENOMEM;

...
}

Thanks,
Tiezhu

