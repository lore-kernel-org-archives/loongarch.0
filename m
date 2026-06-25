Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2AC3BA237
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368086; cv=none; b=E95qX5BKLzFRsMa9A3MXQy/hpjof+AL7xtVV99x32UXvGLWeNDwwzvbBsdqCfBGiSNTfKppI4TWGWwjpuR7uR+kcl6U/NPtEGETeRMIhgxFK3kTGjT54jqmJ+VivA5qvk7MIFg6K+dYW7u7sJzqfKzWm8e2BvhqUs2mnVKkJW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368086; c=relaxed/simple;
	bh=rdm6KigNO1aAXuPpzN2rt+l9VIOqiPTHFsUhlKKUC5o=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=X4IN36qiPugRMbLagF0Mq7Pf8JVw+Ut80CRfSH4og/3dn6e6hMI/RTMetpLv+XgG7vjhoeV1PKxlXTawXp/X0cQgPpNdpynJqrO+hippPsx4CTQway7vwdoLJutxHSOwFX+LqYL5nYYbMGrS/x8qQAaZrypjaANNNrMwNAj3ne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxBOlRxzxqy7kXAA--.55096S3;
	Thu, 25 Jun 2026 14:14:41 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxXcJKxzxqCXayAA--.8713S3;
	Thu, 25 Jun 2026 14:14:36 +0800 (CST)
Subject: Re: [PATCH v4 2/3] LoongArch: KVM: Implement guest-side PV TLB flush
From: Bibo Mao <maobibo@loongson.cn>
To: Tao Cui <cui.tao@linux.dev>, zhaotianrui@loongson.cn,
 chenhuacai@kernel.org, loongarch@lists.linux.dev
Cc: kernel@xen0n.name, kvm@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
References: <20260615082154.42144-1-cui.tao@linux.dev>
 <20260615082154.42144-3-cui.tao@linux.dev>
 <0c47ce21-9a4d-4cdc-9bec-ce749e31512e@loongson.cn>
 <1bfa4941-b94b-410a-9b64-c13f2712edf9@linux.dev>
 <9ec9d22b-93fd-3dcb-c6b8-19563f1b7c0a@loongson.cn>
 <404180d0-c734-4465-8752-f43279730692@linux.dev>
 <6f837e00-e606-ddaa-b22b-dd30348a18fb@loongson.cn>
Message-ID: <084d7bec-592c-31b5-aa44-099bff87af9a@loongson.cn>
Date: Thu, 25 Jun 2026 14:11:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6f837e00-e606-ddaa-b22b-dd30348a18fb@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcJKxzxqCXayAA--.8713S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr48Xr48ur4UKw17Cr15trc_yoW5XF4rpr
	WrtFy5trWkCr1xAr1UKr1UJryjvry7J3Z8Jr1jyFyUAws8JrySqrW7Wr109F97Xr4rWr1j
	9ryUJrWfZF1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5
	WrAUUUUU=



On 2026/6/25 上午11:31, Bibo Mao wrote:
> 
> 
> On 2026/6/25 上午10:27, Tao Cui wrote:
>>
>> Hi Bibo,
>>
>> 在 2026/6/17 09:05, Bibo Mao 写道:
>>>
>>>> Rather than argue from intuition, I'd like to try the hypercall 
>>>> approach
>>>> you suggested and measure the performance improvement against the 
>>>> current
>>>> path. I'll share the results with you once the testing is done, so we
>>>> can decide the direction based on the numbers.
>>> well, that is the best. It is my pleasure to discuss this with you.
>>>
>>
>> A quick update on the testing. I put both the hypercall and the
>> steal-time variants through two benchmarks on an 8-core host with a
>> 4:1 overcommitted guest (32 vCPUs), and wanted to share where things
>> stand.
>>
>> The two workloads:
>>   - ebizzy (all threads busy, mm-flush heavy)
>>   - tlb_bench in sleep-idle mode (1 flusher + 31 sleeping idle threads,
>>     so the idle vCPUs get preempted)
>>
>> ebizzy (records/s, higher is better), 32 vCPUs:
>>    no-PV       ~103,737
>>    hypercall   ~105,779
>>    steal-time  ~105,872
>>    -> all within noise (±2%); no measurable difference.
> Hi Tao,
> 
> what is ebizzy command? ebizzy -m or ebizzy -M.
> 
> could you try command on host and one VM without over-committed at 
> first, and then two VMs and three VMs?
> 
> Here is result on my 3C5000 Dual-way machines with 32 cores and two numa 
> nodes:
>                  ./ebizzy -m          ./ebizzy -M
> host             8633                 158898
> VM(32 vCPUs)     6610                 133153
> VM/host          76%                  83%
> 
just ./ebizzy -M is enough, it seems that CPU number is one key factor.

> Regards
> Bibo Mao
> 
>>
>> tlb_bench sleep-idle (ns/flush, lower is better), 1 flusher + 31 idle:
>>    no-PV       ~166,536
>>    steal-time  ~149,553
>>    hypercall    ~88,686
>>
>> ebizzy's workload is mostly threads staying busy with alloc/copy/free,
>> which drives remote TLB flushes against running vCPUs — that may not be
>> the path this feature is meant to optimize, so the flat result there
>> probably says more about the workload mismatch than about the feature
>> itself. I need to take another look at whether the benchmark actually
>> exercises the cases PV TLB flush targets before reading too much into
>> the numbers, including the tlb_bench figure above.
>>
>> So I'd hold off on any conclusion for now. Next I'll re-examine the
>> test setup / pick a workload that better matches the feature, and keep
>> you posted once I have something more representative.
>>
>> Best,
>> Tao
>>

