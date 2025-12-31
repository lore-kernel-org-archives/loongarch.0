Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C102BF3CF
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 01:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767145015; cv=none; b=pe0kTGMLHcgg6IVcKpkEKKuwD5ARvhaY4kioRk+2vYqoYKCEh8jqSFhZmCiFXbKtiRZIswIyB4yNLa0VP/EYw4FunhlhYKzwp00Ya3VjUYiKt3ZUawNlEoH3/JZpeedhpEJCq3405TnG0IUYv/xOz247g/QiI+tgc2uDN0POAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767145015; c=relaxed/simple;
	bh=O4YxZJvJ1Q9wW6IePCQmhBdpUBA3MIPk9qUJYP2LMV4=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ud8T2/88RJHLyWXh1DeSPuaAU6opG8bEcWE3WuQbC7Vtp58Ok3JsooiunQGsa1DudbozFh8ZqRHr0Kg8TmBFctpAFPrlBzWE34WK9QyciSinB3RZZS43bzQgL/NZ5OwbhiWd2Itu0is4ijK4ddxLAgWA30h6sE1uioy4rXCwub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxusIoflRpYY4EAA--.13817S3;
	Wed, 31 Dec 2025 09:36:40 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAx28EkflRpsWkHAA--.16503S3;
	Wed, 31 Dec 2025 09:36:37 +0800 (CST)
Subject: Re: x86 bpf selftests report for reference
To: Vincent Li <vincent.mc.li@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>,
 Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev
References: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
 <CAK3+h2zJk7V-VNA9cG4C1BX02Dphyt_XXN8i_ERLAQbmJn++JQ@mail.gmail.com>
 <CAK3+h2x2o7xh-=bB5yPKieZWd6BYmke6QNvB5iG7fM9sqPjE=g@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f5954f91-969d-8bf0-7f03-be4dff5d839a@loongson.cn>
Date: Wed, 31 Dec 2025 09:36:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK3+h2x2o7xh-=bB5yPKieZWd6BYmke6QNvB5iG7fM9sqPjE=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28EkflRpsWkHAA--.16503S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1DZFWfCF4rZr13Kw45Arc_yoW8Wr1DpF
	4Uu3WYyF4kJrn2qa4qqw1j9FWjgw13Wryjg3W8Gry5ur98WFW2qF1I9a4ruF98CrsagwnI
	ya10va43XFyrCagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xuctUU
	UUU==

On 2025/12/31 上午8:48, Vincent Li wrote:
> On Tue, Dec 30, 2025 at 2:20 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
>>
>> On Mon, Dec 29, 2025 at 1:27 PM Vincent Li <vincent.mc.li@gmail.com> wrote:
>>>
>>> Hi Huacai,
>>>
>>> I did a manual full bpf selftests on x86 machine, no ns_bpf_qdisc
>>> failure, so indeed like you said, it seems loongarch bpf is
>>> deteriorating. Here is x86 failed bpf test report for reference, there
>>> is no hang up or anything like that during the test.
>>>
>> After testing 6.16, 6.17, 6.18-rc1, I am not sure about the loongarch
>> bpf deteriorating any more :)
>>
>> Test results:
>> 6.16 ns_bpf_qdisc not supported
>> 6.17 some patches enabled ns_bpf_qdisc support, but ns_bpf_qdisc panic
> 
> if I guess it right, I think commit 6abf17d6 (LoongArch: BPF: Add
> struct ops support for trampoline) seems to have enabled ns_bpf_qdisc
> support.
> 
>> 6.18-rc1 ns_bpf_qdisc panic fix commit merged (8b51b11), ns_bpf_qdisc
>> mq test failed with WATCHDOG messaging on the screen.

In short, what is the problem on LoongArch?
Did you mean the following test failed or paniced or something else?

sudo ./test_progs -t ns_bpf_qdisc

IIRC, there is a patch to fix the problem:
LoongArch: BPF: Sign-extend struct ops return values properly
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8b51b11b3d81

Is there something wrong with the 6.19-rc3 or the coming 6.19-rc4?
If yes, please report it. You can set CONFIG_RCU_CPU_STALL_TIMEOUT=60
like the other archs.

Thanks,
Tiezhu

