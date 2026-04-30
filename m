Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CE0258CE7
	for <loongarch@lists.linux.dev>; Thu, 30 Apr 2026 01:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777512057; cv=none; b=QnFPWLpn4O6ARZ5E8NOeDyImMgfVZJ1+8y9i2B7+mJRxdy29CO0OnheHmgczbvM9XqakVssqIZZNkjE+tDbRPZDhqfiPrAsSpp0AuSLdsgtmCCnHql/WgtrZhPKfgm+IbtTMqgEV1uxbxNnRpWXJk102vDl+uR/4Zxdw4JH2tOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777512057; c=relaxed/simple;
	bh=4WMlS+6nNoILyYGEsTdq0dsFvBtHEN+h2tbgANLOzb4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kEBotG/P3WEcw8xWTBO/lQ41bsWhfdRiIZz2cZS2BfT9qWwEo9lmH5T9raunjwsIRA6o4seyMrWAhs5t3KIS4efMxZFs9HjRxmuMXD9P77ax5EVFA/HuFMR36C6gUBOTVIQURKuCGGWG+VImCim4cAq1p3xpcqSX094OK3UFy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Dx7elzrvJpK1YFAA--.17407S3;
	Thu, 30 Apr 2026 09:20:52 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxvsJxrvJpCsB3AA--.31058S3;
	Thu, 30 Apr 2026 09:20:49 +0800 (CST)
Subject: Re: [PATCH 0/3] LoongArch: KVM: Small enhancement about timer
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260414072313.3801110-1-maobibo@loongson.cn>
 <CAAhV-H5+mR5gnd6x6yUEFK7ZnWyYQVTiE6C=enk7bHxe2Mo2Sg@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <b876bfe6-4a47-559a-1f33-00e363cb62de@loongson.cn>
Date: Thu, 30 Apr 2026 09:17:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5+mR5gnd6x6yUEFK7ZnWyYQVTiE6C=enk7bHxe2Mo2Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxvsJxrvJpCsB3AA--.31058S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw15ZF1fAFykZF4UGrWDZFc_yoW8Ww18pF
	WI93ZIgr4kCr47Jw1av3Wqywn8AryrGr13W3Wxt3y8ArZIyryjqr47WFWFyF9xGrWrAF10
	gF1rKrZ0g3WUJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=



On 2026/4/29 下午6:13, Huacai Chen wrote:
> The first patch cannot be applied cleanly, I adjusted it and applied,
> hope it is correct.
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next
yes, that is correct.
And thanks for your modification.

Regards
Bibo Mao
> 
> 
> Huacai
> 
> On Tue, Apr 14, 2026 at 3:23 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> By running LTP stress test cases on VM, there is an RCU timeout issue on
>> some vCPUs recently. The problem is that there is HW timer interrupt lost
>> issue when injecting SIP0/IPI interrupt from KVM hypervisor, this problem
>> is hidden because the KVM hypervisor will inject spurious timer interrupt
>> if emulated timer is expired. In late the spurious timer interrupt is
>> clear if old TI bit of ESTAT register is not set, so there will be RCU
>> timeout issue with LTP stress test.
>>
>> This patch set fixes the HW timer interrupt lost issue, also this patch
>> moves unconditional delay in timer interrupt clear scenery, which happens
>> seldomly; mostly the timer interrupt bit is set when it expires.
>>
>> Bibo Mao (3):
>>    LoongArch: KVM: Move AVEC interrupt injection in switch loop
>>    LoongArch: KVM: Fix HW timer interrupt lost when inject interrupt from
>>      software
>>    LoongArch: KVM: Move unconditional delay in timer clear scenery
>>
>>   arch/loongarch/kvm/interrupt.c | 37 +++++++++++++++++++++++++---------
>>   arch/loongarch/kvm/timer.c     | 16 +++++++++++++--
>>   2 files changed, 41 insertions(+), 12 deletions(-)
>>
>>
>> base-commit: d568788baab24875604c231f723dbb72387fb081
>> --
>> 2.39.3
>>
>>

