Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148694734DC
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058262; cv=none; b=A+xPqLodOdGmdw7sYW3Su4D1d0u6ocQ/7CvcnuitMRQVfKMkYLNApwf4e7cLM1JDIBZjF7MThfgULwTX5L12srpXYsxgSLw6qP8FXfnDGWZeoBwUBjd7MMNqiewJq8nmdzK1zwMFkdqDNzdZBebSktgxN8Q1wcXhm23LiR+SwMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058262; c=relaxed/simple;
	bh=BFn4JpyCthd+jKbVEx5O7iwhEAo72F48en/l+4dlYnw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aC+4cjj9UI8yKxe7wU/hLYv9GkobsLxNwyE9fNne0hZIqCtqIOQYIPM+BMjUFnkH41swHD6z91eUOBATWjkjpjI+b29LUVGCXcN5tjT+rkTh5oQkiMWQ0v8hntq1Z4C97EdhbDMMnpBpzR6hhdj3YlHB6zxzJzao+nLY3JmEEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Ax29FQWIRq9U0CAA--.6996S3;
	Tue, 18 Aug 2026 21:04:16 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c5NWIRqHVoJAA--.59505S2;
	Tue, 18 Aug 2026 21:04:14 +0800 (CST)
Subject: Re: [PATCH v3 1/3] module/kallsyms: Rename is_mapping_symbol() to
 is_local_mapping_symbol()
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260812032807.15034-1-yangtiezhu@loongson.cn>
 <20260812032807.15034-2-yangtiezhu@loongson.cn>
 <96b0e23b-165d-4026-bdfe-f8cd8ceb36ba@suse.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d22a5f25-b4b3-faa4-46d5-132f3fa725f3@loongson.cn>
Date: Tue, 18 Aug 2026 21:04:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <96b0e23b-165d-4026-bdfe-f8cd8ceb36ba@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c5NWIRqHVoJAA--.59505S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFWDurW8JFyUuFWkXF1fGrX_yoW8ArW3pF
	WDCr4UXFn5Wr48Wws7Jr4rWF9F9w4kXw4rCa43trWkuF9IqF1vqFWS9rs0g3ZrXr10gw4I
	vF47ZF90v34kAFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zw
	Z7UUUUU==

On 2026/8/18 下午7:56, Petr Pavlu wrote:
> On 8/12/26 5:28 AM, Tiezhu Yang wrote:
>> The helper function is_mapping_symbol() historically checks for both
>> local labels prefixed with ".L" or "L0" and mapping symbols prefixed
>> with "$".

...

> I think the updated comment and the function name are confusing. They
> read as if they are about local symbols in general (STB_LOCAL), but they
> should refer only to local label symbols (.L<xyz>, ...). The function
> would need to be called is_local_label_or_mapping_symbol() but that is
> too long.
> 
> If you do want to rename this function, one option is to be consistent
> with perf, which implements the same filter and calls it
> is_ignored_kernel_symbol().
> 
> The comment could also be clearer, for example:
> 
> /*
>   * Ignore local labels (.L*, L0*) and mapping symbols ($*). These symbols are
>   * not useful for the kernel, for example, they should not appear in kallsyms.
>   */

OK, it looks better, will do it in v4.

>>   {
>>   	if (str[0] == '.' && str[1] == 'L')
>>   		return true;

...

> Another comment-only reference to is_mapping_symbol() that should be
> updated is in tools/perf/util/symbol.h.

There may be conflicts between modules-next and perf-tools-next:

https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/tools/perf/util/symbol.h?h=modules-next
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/tools/perf/util/symbol.h?h=perf-tools-next

So one way is to not modify tools/perf/util/symbol.h if based
on modules-next at this time, the other way is to rebase the
code and then send the series after the merge window.

Please let me know what is the proper way.

Thanks,
Tiezhu

