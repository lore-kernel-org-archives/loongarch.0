Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CC14C9D
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 05:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135383; cv=none; b=glIr8PutsCsbevZ1fn4qG6d1ogpcWq7dY/BfPDI9G3PCsVq3yHnC+t+3w2Y0B6JtsRQjs+Es34LWEtys1/4qb0tEjj05T5BerTEdh01SHHEkz4Y5O0uNbZg9As87N96T0pOAt1sZuvNH/INxT3VRLDIk9zY1uDl5fj8JnM/01eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135383; c=relaxed/simple;
	bh=3fr7+zisVir+vjWivU1phFdz98ryaS94nElCm29Yjtg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=M3nXi1j5P9gg39uQiseqnOz72erqzlGNuC9X5I0/W6H0bWnystvL45MngfIpsRueCdtBiHJOZ16SsSAU7coJq/Jjt8Xhh3Ufk1zIQ+QZvvwc5iCp7N8QRAc20zMGH5mqsuy+s9caIS202pYxATj5RfB0DxjbHoxDkoL/3/D+qIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxbb_QkSZpXzEoAA--.19793S3;
	Wed, 26 Nov 2025 13:36:17 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+TPkSZplbQ_AQ--.44916S3;
	Wed, 26 Nov 2025 13:36:16 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Zhang <zhangxi@kylinos.cn>, Xianglai Li <lixianglai@loongson.cn>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <CAAhV-H5AO38DAqxUyawwKW_f=ZuCaROj+s--vE8ham0sTWMxog@mail.gmail.com>
 <332975a8-c7f1-76d5-0628-cd7260ad1180@loongson.cn>
 <CAAhV-H77duX-WiYsJzkJChmGHdGh5y_k6YEvLQdpDys5iLctgw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <97155bf2-591c-2d5f-b26f-c0532fe2e3d5@loongson.cn>
Date: Wed, 26 Nov 2025 13:36:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H77duX-WiYsJzkJChmGHdGh5y_k6YEvLQdpDys5iLctgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+TPkSZplbQ_AQ--.44916S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrXryDZFy3GF4kGw4fWrWUKFX_yoWxXFb_Wa
	yY93WDZr4UJFnxJw18K34YvF9xWas8GryrtrZrJw4xtasYgFyrGr4Iyrnakr95Kr4ktr47
	JF4kZFZ3uw1UuosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU74lkDUUUU

On 2025/11/25 下午5:05, Huacai Chen wrote:
> On Tue, Nov 25, 2025 at 4:54 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

...

>> They are different code paths, the current path is "goto err", it will
>> set state->error as true, then arch_stack_walk_reliable() will return
>> -EINVAL.
>>
>> With this patch, the code path is "goto end" for this case, it will
>> not set state->error as true, then arch_stack_walk_reliable() will
>> return 0.
> Then can we replace "goto err" with "goto end" at  __kernel_text_address()?

No, this "goto err" path is useful to indicate that there is
something wrong.

Thanks,
Tiezhu

