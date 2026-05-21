Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E2633EF
	for <loongarch@lists.linux.dev>; Thu, 21 May 2026 02:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779331037; cv=none; b=RDMPGfUda1jpSfkt2iE6DseQdbO4W8HZKsolxUmX79XnZcj+OoDIW47qYKHjxj7J9BTcwLmh13cBnHKKzOtldEUz9SyFZopr4KdrsuaY5wWDwxtePrARKj0mHUfQ6N8+YI7T2T5TUbh6YiiLU4HYEdZ/MQOafrxszAh6qSDdS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779331037; c=relaxed/simple;
	bh=2ltIl9i68+7kP3YTRegJzVOp/z4LIMAarvLv1dXtUUk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=roSsMhtQa64ivZcMxWAKMv6CFNjyZuKZs22pKkIpOg52M1nhkx40OuE//trHE5ZBfgI74pQzicCZj6WraFi8rCQ4uc8pIngdZ1k9/t+/YEgy/lavVmuIoR6NZd0qd9P+mIAgZsiJofO5J8jd/TeZlT+v6csWJA4f3cIDMo1ABi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxVunTbw5qSNwLAA--.28730S3;
	Thu, 21 May 2026 10:37:07 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxysHRbw5qj3WKAA--.63994S3;
	Thu, 21 May 2026 10:37:06 +0800 (CST)
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Lisa Robinson <lisa@bytefly.space>, WANG Rui <r@hev.cc>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
 <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
 <CAAhV-H7aR3NBpTk8Nbg0bphuXoDXa+xjo=bMLbrApm-SwvJYOw@mail.gmail.com>
 <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <dc609ede-d955-c907-fad9-13e3ddb8a784@loongson.cn>
Date: Thu, 21 May 2026 10:37:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7LcrUY0rKV7Q6XZs2U6K_DEo0ammbiEBf=YsJ1-tVfYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxysHRbw5qj3WKAA--.63994S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF4DGr1kJrykZrykCr15Awc_yoWkJrc_uw
	sFkrykCrWUGw4Fy3WkKryrAFyDJry5Ww4rK348XrykZ3s8Jr98ZFs7KF1rZa18XFWkZFnx
	Kr4DWF47Zry7uosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fsqJUUUUU==

On 2026/5/20 下午3:58, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Fri, May 15, 2026 at 12:29 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> On Fri, May 15, 2026 at 10:52 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>
>>> On 2026/5/12 下午4:20, Tiezhu Yang wrote:
>>>> This series addresses ftrace and kprobes issues observed under heavy
>>>> tracing loads.
>>>>
>>>> Tiezhu Yang (4):
>>>>     LoongArch: ftrace: Fix stale per-CPU kprobe state after task migration
>>>>     LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
>>>>     LoongArch: kprobes: Fix single-stepping instruction slot preparation
>>>>     LoongArch: kprobes: Fix handling of fatal unrecoverable recursions
>>>
>>> Hi Lisa and Rui,
>>>
>>> You are right, please ignore the patch #3.
>> I think Patch#3 is OK, but you need to remove the introduction about atomicity.
> Will you resend V2? Or just ignore Patch#3?

I think no need to send v2.

Please disregard patch #1 and #3,
I will tell you more info in the inner meeting.

Please only consider patch #2 and #4.

Thanks,
Tiezhu

