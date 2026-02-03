Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD96A246778
	for <loongarch@lists.linux.dev>; Tue,  3 Feb 2026 01:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082553; cv=none; b=OmrztrBUL42GHNbyNTH35uYizCkpDSFtes0yHRtGDiKiglxdbgbzG/+d+hhq3JP5NDR1hw2hCP/I4yo9APdYzsn7aq04wgtrAAlWHxN61dWlDtEjIQGLgOMDKUKEhWzy5UNL0c9qLqeTZfT1g8BozAXZOylBbRVOmpzkc/jtiAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082553; c=relaxed/simple;
	bh=KltxEqcvz5k2YebmOf0bO3E6BwF4ofoL1lJk2Kgvld4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uSZLWlrmbTSn8n6gXfPQhL4ywNG9hiXApX4Lmaz16r2DqYs8aaIG378+7Mf0ErEVqDG+6sua68NhKnqpkpU7LUKaVIAUb85NuXC0NC28zo9w9/81CYBFCvqqb8CHWJrlXfAKHlwWffw14Ekpu72Of3XwskuP6b77cxVEXuY86HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Cx68L1UIFpuzUPAA--.49019S3;
	Tue, 03 Feb 2026 09:35:49 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJCxWeDyUIFpQMQ+AA--.51847S3;
	Tue, 03 Feb 2026 09:35:49 +0800 (CST)
Subject: Re: [PATCH v10 4/4] irqchip/irq-loongarch-ir:Add Redirect irqchip
 support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liupu Wang <wangliupu@loongson.cn>
References: <20260202091041.2278271-1-zhangtianyang@loongson.cn>
 <20260202091041.2278271-5-zhangtianyang@loongson.cn> <87ms1rfogh.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <675fc46a-d44e-34e4-b747-4585819a3aa9@loongson.cn>
Date: Tue, 3 Feb 2026 09:33:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ms1rfogh.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeDyUIFpQMQ+AA--.51847S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrur1kAF4UKrWkKry8KFW5XFc_yoWfJrXEvr
	4ruw1DCF90gFn3Zan5JwsruasxWF4kW3WDWr4Fqas2v34fAFWkZ3yFqryIk3yUJ34fA3WU
	Zr90vry7Xw1I9osvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j22NtUUUUU=

Hi, Thomas

ÔÚ 2026/2/2 ÏÂÎç6:07, Thomas Gleixner Ð´µÀ:
> On Mon, Feb 02 2026 at 17:10, Tianyang Zhang wrote:
>> +static inline void redirect_write_reg64(u32 node, u64 val, u32 reg)
>> +{
>> +	return writeq(val, REDIRECT_REG(reg, node));
> 
> Again: What is this return for?
it is meaningless, and the return statement here will be removed later.
> 
>> +static int redirect_table_init(struct irde_desc *irde)
>> +{
>> +	struct redirect_table *ird_table = &irde->ird_table;
>> +	unsigned long *bitmap;
>> +	struct folio *folio;
>> +	int node = irde->node;
> 
> It seems to be really hard to do a length based sort.
> 
> Oh well...
> 
'''
struct redirect_table *ird_table = &irde->ird_table;
unsigned long *bitmap;
struct folio *folio;
int node;

node = irde->node
''''
Maybe this look better, I will try my best......

Thanks
Tianyang

