Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E769128E56F
	for <loongarch@lists.linux.dev>; Tue, 10 Jun 2025 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557286; cv=none; b=tk4VE8vBkuXdofcvNKrPAA0TiYJZgr2989FuM4qYuCgOgO2h0KdcSz/BIAEYLQg1DWQHk4ndHOgJthNzj3X43H/Xxhl2iAOWIT5TRde2LfeiRxQhNdYHk7/vMMf1pNCxI/h2jHNurvhMaqLMm5qhD7nMuPpaLE1QUHnMXlXW01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557286; c=relaxed/simple;
	bh=ZzwZmuX1CS+0FiTnplkgygNLxQDbq90B2AuoJJnwJD4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dLRKUlSxIRPg0z1hYiniUvG62y+KGWMn/y969+W9VQm61mwnJXdBD88GvDN1Pr7lHarCcB5JuNWPsZsdqhFojh9aYqS8mlT8tzEtwpnZA8umngn4snML0oPt//p+Gk3eAzZs0F2sXuy8dSxRfWeQrltnQ4Qs0hwIQEj9qsQvgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxaWohIEhopKgSAQ--.49138S3;
	Tue, 10 Jun 2025 20:08:01 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxzMQbIEhoQ1gUAQ--.62619S3;
	Tue, 10 Jun 2025 20:07:57 +0800 (CST)
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
 peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
 maobibo@loongson.cn, siyanteng@cqsoftware.com.cn, gaosong@loongson.cn,
 yangtiezhu@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Super User <root@localhost.localdomain>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <91858552-2ccd-73af-1f5c-962682952a99@loongson.cn>
Date: Tue, 10 Jun 2025 20:07:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxzMQbIEhoQ1gUAQ--.62619S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFyDWry5XrW8Cw4DXw1xtFc_yoW5JF1DpF
	WDuas0kF4rCrn7C3ZF9a40vrW5AFyxGrW2q3W2g343ur98uwnFvF10yFZ8uFn7Ga17tw10
	9F15Xa4DWFn8AacCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=

Hi, Huacai

在 2025/6/10 下午7:54, Huacai Chen 写道:
> Hi, Tianyang,
>
> Have you received my comments in V3?
> https://lore.kernel.org/loongarch/20250523101833.17940-1-zhangtianyang@loongson.cn/T/#m2883f379ce7eb663f3f3eb4736bf9b071c7fd8ab
>
> Huacai

Sorry, except for a slight network issue, I did not receive the email 
mentioned above.

I will reply to the email first and continue to modify this series of 
patches

Tianyang

> On Tue, Jun 10, 2025 at 7:43 PM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>> From: Super User <root@localhost.localdomain>
>>
>> This series of patches introduces support for interrupt-redirect
>> controllers, and this hardware feature will be supported on 3C6000
>> for the first time
>>
>> change log:
>>          v0->v1:
>>          1.Rename the model names in the document.
>>          2.Adjust the code format.
>>          3.Remove architecture - specific prefixes.
>>          4.Refactor the initialization logic, and IR driver no longer set AVEC_ENABLE.
>>          5.Enhance compatibility under certain configurations.
>>
>>          v1->v2:
>>          1.Fixed an erroneous enabling issue.
>>
>>          v2->v3
>>          1.Replace smp_call with address mapping to access registers
>>          2.Fix some code style issues
>>
>>          v3->v4
>>          1.Provide reasonable comments on the modifications made to IRQ_SET_MASK_OK_DONE
>>          2.Replace meaningless empty functions with parent_mask/unmask/ack
>>          3.Added and indeed released resources
>>          4.Added judgment for data structure initialization completion to avoid duplicate creation during cpuhotplug
>>          5.Fixed the code style and some unnecessary troubles
>>
>> Tianyang Zhang (2):
>>    Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
>>    irq/irq-loongarch-ir:Add Redirect irqchip support
>>
>>   .../arch/loongarch/irq-chip-model.rst         |  38 ++
>>   .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
>>   arch/loongarch/include/asm/cpu-features.h     |   1 +
>>   arch/loongarch/include/asm/cpu.h              |   2 +
>>   arch/loongarch/include/asm/loongarch.h        |   6 +
>>   arch/loongarch/kernel/cpu-probe.c             |   2 +
>>   drivers/irqchip/Makefile                      |   2 +-
>>   drivers/irqchip/irq-loongarch-avec.c          |  25 +-
>>   drivers/irqchip/irq-loongarch-ir.c            | 562 ++++++++++++++++++
>>   drivers/irqchip/irq-loongson.h                |  12 +
>>   include/linux/cpuhotplug.h                    |   1 +
>>   11 files changed, 674 insertions(+), 14 deletions(-)
>>   create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>>
>> --
>> 2.41.0
>>

