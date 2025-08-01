Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D7AD4B
	for <loongarch@lists.linux.dev>; Fri,  1 Aug 2025 05:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754026391; cv=none; b=C2s4Jp5bsqyYlsz41Hpu+HcI+npaf9pjhwv7A+j0NHyY1BACO68B45wbiXEplG9oQKz7HO29xlzMLQHX7Hkb7Svgg6zb7yfhbnXJCTyibJjzC8uK96gmyEwztY97cAVxBfuRqxvtbNvEP7eLIDLH8AC/Cne/yev35HsmizzkJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754026391; c=relaxed/simple;
	bh=FlfVm0CrnaYT5xXnAbvWicgfOKjFRyaZbOW83Vlr7GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pc3HtyvvG/kRlWW/LH+mOXLF/LLr9VEyZfPvcy0upm1RDqUL3iGqjWcVnt81MVCle/GKmprgZ+dY1INWKNIQ40LanKScbKq1KRbvp9VW7WclA/qN1ox3gKy0FKN+Ptr9qFUNB1kXe1oQ9rxCWcmpCd2sbz2Yn2BRD4WXA2Vke3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lKg8Jpcd; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lKg8Jpcd"
Message-ID: <7dc95f48-80c9-4756-98e2-95851c9fc536@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754026384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKalKoOMq1UodWomveQqzcZC7KeSn2U/P9L9QKC2ADk=;
	b=lKg8Jpcdh2/0e+V5FoVEf4f/jchUnq4oIVNSm5X81OLbSAIUtLuG076jQmwIySSne18xj5
	aH/OAKEvR0ElTJVno0QYPrKiIaw4OxuPFtZBv1cAuAl1UFKbI4GYjph2AiLbPecu4LOsc8
	j5AmOFbcH1dD5x6glLqWFnHnF+WpNjI=
Date: Fri, 1 Aug 2025 13:32:57 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] LoongArch: KVM: Access mailbox directly in mail_send()
To: Bibo Mao <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250731075907.189847-1-maobibo@loongson.cn>
 <3fdcce8e-dff6-4871-82b3-571144a26c51@linux.dev>
 <6793e1a8-00f6-c653-3a8a-5943c0471bb1@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <6793e1a8-00f6-c653-3a8a-5943c0471bb1@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 7/31/25 7:24 PM, Bibo Mao 写道:
> 
> 
> On 2025/7/31 下午5:30, Yanteng Si wrote:
>> 在 7/31/25 3:59 PM, Bibo Mao 写道:
>>> With function mail_send(), it is to write mailbox of other VCPUs.
>>> Existing simple APIs read_mailbox/write_mailbox can be used directly
>>> rather than send command on IOCSR address.
>> Hmm, that's indeed a feasible approach. However, I'm
>> curious: what is the purpose of designing IOCSR in
>> LoongArch? Is it merely to make things "complicated"?
> 
> I am not chip designer -:). MMIO address space is ok from my side, however I do not know how to solve multi-chip problem with MMIO method.

I have reviewed many manuals published on loongson.cn and found
that your chip engineers recommend using IOCSR. Although I don't
know the specific reason, I believe it must have solved some problems,
so let's continue to use IOCSR. see:

《龙芯 3D5000 处理器 寄存器使用手册》第10章

龙芯 3D5000 中支持两种不同的访问方式,一种是地址访问模式,另一种是为了支持处理器寄存器空间的直接指令访问.后面章节进行分别说明.推荐使用处理器 IOCSR 指令访问


Thanks,
Yanteng
> 
> Regards
> Bibo Mao
>>
>> Thanks,
>> Yanteng
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>   arch/loongarch/kvm/intc/ipi.c | 16 +++++++++++++---
>>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
>>> index fe734dc062ed..832b2d4aa2ef 100644
>>> --- a/arch/loongarch/kvm/intc/ipi.c
>>> +++ b/arch/loongarch/kvm/intc/ipi.c
>>> @@ -134,7 +134,8 @@ static int send_ipi_data(struct kvm_vcpu *vcpu, gpa_t addr, uint64_t data)
>>>   static int mail_send(struct kvm *kvm, uint64_t data)
>>>   {
>>> -    int cpu, mailbox, offset;
>>> +    int i, cpu, mailbox, offset;
>>> +    uint32_t val = 0, mask = 0;
>>>       struct kvm_vcpu *vcpu;
>>>       cpu = ((data & 0xffffffff) >> 16) & 0x3ff;
>>> @@ -144,9 +145,18 @@ static int mail_send(struct kvm *kvm, uint64_t data)
>>>           return -EINVAL;
>>>       }
>>>       mailbox = ((data & 0xffffffff) >> 2) & 0x7;
>>> -    offset = IOCSR_IPI_BASE + IOCSR_IPI_BUF_20 + mailbox * 4;
>>> +    offset = IOCSR_IPI_BUF_20 + mailbox * 4;
>>> +    if ((data >> 27) & 0xf) {
>>> +        val = read_mailbox(vcpu, offset, 4);
>>> +        for (i = 0; i < 4; i++)
>>> +            if (data & (BIT(27 + i)))
>>> +                mask |= (0xff << (i * 8));
>>> +        val &= mask;
>>> +    }
>>> -    return send_ipi_data(vcpu, offset, data);
>>> +    val |= ((uint32_t)(data >> 32) & ~mask);
>>> +    write_mailbox(vcpu, offset, val, 4);
>>> +    return 0;
>>>   }
>>>   static int any_send(struct kvm *kvm, uint64_t data)
>>>
>>> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
>>
> 

