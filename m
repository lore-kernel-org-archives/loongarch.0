Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66847428837
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913864; cv=none; b=ub7mT3wpFiiZHPpSEjVaG3M/SiIDU0+pSo53T/LSxnPR2e3aLuWIb+WB1gqhkwjPHt7FvBXM238itb5pO3aZYthU634T8nmS06fcvt6fDZjFhPsz8O0eJs14CJPeTpx8urmit85vp+4agMUKUkWTEyaqj/2qaVmge+KjLKvlI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913864; c=relaxed/simple;
	bh=r/N7ZU4S7MwxHTtO3DTPmIUAKbkzWslU9/yt9HAQmr8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sQ5w/7D5eFmmRcLhHyNR0deBqkuMrYnCFcoVEgp52pla6BJuKumZr36TFwTq4PyvHz8c8HiCyo6VazwzFBDRFS9iUzL0/a++HPQDNTmHhSPUNW2zsmErEuvZB43XdACSIFIn7QGuvtXhvwIqys5VuN/o1saasSlLgv5Apf7qGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxisLBe29pGroKAA--.34990S3;
	Tue, 20 Jan 2026 20:57:38 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAx38LAe29pQ7MnAA--.14571S3;
	Tue, 20 Jan 2026 20:57:37 +0800 (CST)
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in
 bt_address()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260120092331.813-1-yangtiezhu@loongson.cn>
 <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn>
Date: Tue, 20 Jan 2026 20:57:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx38LAe29pQ7MnAA--.14571S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF45Gr4UZr1rWr45JrW7WrX_yoW3WFXEgr
	n2y3srCr48Wr9IkwsakFyrAa4DJa1DJr90gr93Wry7Z340vay8Jwn7Kas3uw4rAr4vkrsY
	yws8ZFy3A34Y9osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8oGQDUUUUU==

On 2026/1/20 下午8:04, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Tue, Jan 20, 2026 at 5:23 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
>> ORC unwinder"), the system can not boot normally under some configs,
>> there are many error messages "cannot find unwind pc at".

...

>> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
>> +       for (int cpu = 1; cpu < num_possible_cpus(); cpu++) {
> Use nr_cpu_ids instead of num_possible_cpus() can improve performance a little.
> 
>> +               int vec_sz = sizeof(exception_handlers);
>> +
> It is better to add "if (!pcpu_handlers[cpu]) continue" here.

If so, it can use for_each_possible_cpu(cpu) directly?

Thanks,
Tiezhu

