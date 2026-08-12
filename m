Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F54D1E5B70
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 01:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786498471; cv=none; b=TUXNrWu85aLk13YwVVcSljecTbl2lZwfEJ4CrUwcsOXTIznhKJNjkKayEx8dhNEJXuuotg9vUKtFJLrkAnxF2ko/kMElZlPj84H38fZp8MhV+XMjGxf70kG3oae6Sp2Gxw5m2IUMbgaZHRa1uX7e+d9u1IGMEe+yoVRvsuXILfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786498471; c=relaxed/simple;
	bh=YE9zt04z5CZ6P7lf+VW7Fs/6VQ4jiP0JB8lVbLPQXnc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=H7CS+W6jv8X5/a43ayQDNz2xqmaMbNXvUxejvzrtffjn12ONKyAKwwrtQLhv3v1qBOAQPBKeuFfDOOkIj5dD7GQqA5f+3VNTV0UYuaKft6hW+56FuUnrLN5kJn2YHJ8hnBQ0+moibjLT4Ct0hI0s2iaSSVnk4uZ9ec1G0JxKNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Bxb9OgzXtqWWYAAA--.1280S3;
	Wed, 12 Aug 2026 09:34:24 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c6gzXtq5GwBAA--.9706S2;
	Wed, 12 Aug 2026 09:34:24 +0800 (CST)
Subject: Re: [PATCH v2] module/kallsyms: Filter out local mapping symbols
 during module load
To: Huacai Chen <chenhuacai@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260811071507.24043-1-yangtiezhu@loongson.cn>
 <39a48465-22b6-4b18-9f7e-ce258513181b@suse.com>
 <CAAhV-H5qN2=LEbVS+hd5Uohq6OKHgkxEWLg4GNukYFBmjEABHg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f933e156-1ef2-3abc-ef8f-b2688e78b957@loongson.cn>
Date: Wed, 12 Aug 2026 09:34:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5qN2=LEbVS+hd5Uohq6OKHgkxEWLg4GNukYFBmjEABHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c6gzXtq5GwBAA--.9706S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrW7CFyrtF1xJr18trW3CFX_yoW8tr4kpF
	4qka1rXF4kZF13Can2vw1FgFy5WrWkWFW5J3Z8G3s7AFnxWFy0vrZrKw1Y934UAr1rJF1I
	qa12yasxZas8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UU
	UUU==

On 2026/8/11 下午10:22, Huacai Chen wrote:
> Hi, Petr,
> 
> On Tue, Aug 11, 2026 at 8:20 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> On 8/11/26 9:15 AM, Tiezhu Yang wrote:
>>> The compiler toolchains generate internal local labels on certain
>>> architectures (such as LoongArch) for optimizations and relocations.
>>>
>>> While these local labels are filtered out during runtime lookups in
>>> find_kallsyms_symbol(), they still leak into the permanent symbol
>>> tables of loaded modules, because layout_symtab() and add_kallsyms()
>>> do not check for the mapping symbols during layout generation.
>>>
>>> Consequently, tracing tools like bpftrace resolve identical addresses
>>> into confusing local labels instead of actual clear C function names.
>>>
>>> Fix this by adding is_mapping_symbol() checks directly into the symbol
>>> tracking loops of layout_symtab() and add_kallsyms(). This prevents the
>>> mapping symbols from entering the module's memory symbol arrays at load
>>> time.
>>
>> This optimization looks sensible to me. Kallsyms in vmlinux also
>> normally doesn't include information about local labels (.L<xyz>) and
>> mapping symbols ($a, $d, ...), so it should be ok not to track them in
>> modules either.
>>
>> Note that the patch description mixes up these two symbol categories,
>> presumably because the existing is_mapping_symbol() function conflates
>> them as well.

...

>> It is better to avoid duplicating the same logic in layout_symtab() and
>> add_kallsyms(). The function is_core_symbol() can be renamed to
>> something like is_kept_symbol() and can be solely responsible for
>> deciding what to keep.
> I'm sorry but I think Tiezhu's patch is simpler and cleaner. :)

Hi Petr and Huacai,

Thanks for your feedback! To make the code cleaner, I plan to split the
changes into the following three patches for v3:

1. module/kallsyms: Rename is_mapping_symbol() to is_local_mapping_symbol()
2. module/kallsyms: Refactor current symbol filtering into is_kept_symbol()
3. module/kallsyms: Filter out local and mapping symbols during module load

I will send out the v3 patch series soon.

Thanks,
Tiezhu

