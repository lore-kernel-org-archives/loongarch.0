Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E96F2264B0
	for <loongarch@lists.linux.dev>; Mon, 17 Nov 2025 01:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763343693; cv=none; b=VDy8h/H5eM11xUWpm+RL5JDdpuH8Qci5jLKCescW/IjpkI0vUYmCkm9HxZkuv5hTQYHLRFV7KImBa9cntSoz/8Yo3hhpLvBXdFIuvI9GNe/KFbBzYTAVc6II+DCen4GAlQi16cdW8j0UEs3NwCaveII/yLdjBXvD8vXdgwkmug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763343693; c=relaxed/simple;
	bh=pMNtykI90hIz8Q0BtzOIyvTCCeVCLeg2vv6nq2n2mHA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=T3BoMjF6o6t61bimriL7Km6koy23tG60kGY58nTwRyw1x1Od6wvdsN5Tw0XRB+AEQmputYaibjKElc2hgy7tzgN4TGerW6M1sMKdxDs2DEArO0EckcmtXtyEhAcZVN2anAA43lYkl83iIpZqLWbO7MMSV2NCkKumKBvPwgfAup0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxRNBGfRppojskAA--.11962S3;
	Mon, 17 Nov 2025 09:41:27 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJBxC8E9fRppZI41AQ--.46005S3;
	Mon, 17 Nov 2025 09:41:19 +0800 (CST)
Subject: Re: [PATCH v2 0/7] KVM: LoongArch: selftests: Add timer test case
To: Huacai Chen <chenhuacai@kernel.org>,
 "open list:LOONGARCH" <loongarch@lists.linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org
References: <20251104113700.1561752-1-maobibo@loongson.cn>
 <CAAhV-H6kU=6JtEoy3arisuo7RvVBHTn_g6TP7kGuz7AT2pRnQQ@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <4fa41d29-13d7-83f6-c38b-94185145c5f7@loongson.cn>
Date: Mon, 17 Nov 2025 09:38:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6kU=6JtEoy3arisuo7RvVBHTn_g6TP7kGuz7AT2pRnQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxC8E9fRppZI41AQ--.46005S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFWxGr43Zw15Xr4fCrWfJFc_yoW5Zr1DpF
	Z29F4Skr48AFy3Aas7Ja4vgryjgw1kCrn0yF13tryUCwn0q34kXw4xtFW7CFW3Crs5Wa40
	v34rK3W5ua4DtrgCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jb_-PU
	UUUU=



On 2025/11/15 上午11:43, Huacai Chen wrote:
> Hi, Bibo,
> 
> I'm very confused with this series.
> 1. The cover letter doesn't appear in the maillist.
> 2. Patch-6 is missed in the thread.
I do not why, maybe it is because my git mail client is configured
with limited smtpbatchsize, since it fails to send in one time with many 
CC users. Here is git config about sendemail
   sendemail.smtpbatchsize=2
  sendemail.smtprelogindelay=2

However there is no such problem on lore.kernel.org and my thunderbird 
mail client. Here is display result of lore.kernel.org
https://lore.kernel.org/lkml/20251104113700.1561752-1-maobibo@loongson.cn/

result shown in my thunderbird client:
patch 0: Message-Id: <20251104113700.1561752-1-maobibo@loongson.cn>
patch 1:
     Message-Id: <20251104113700.1561752-2-maobibo@loongson.cn>
     In-Reply-To: <20251104113700.1561752-1-maobibo@loongson.cn>
patch 6:
     Message-Id: <20251104113700.1561752-7-maobibo@loongson.cn>
     In-Reply-To: <20251104113700.1561752-1-maobibo@loongson.cn>
 From the In-Reply-To: information, it shows that they are in one mail 
thread.

> 3. The one-shot and periodic test splitting is a little strange,
> because you put some common parts in the on-shot test, maybe you can
> consider merge these two.
well, will merge one-shot and periodic test case.

Regards
Bibo Mao
> 
> Huacai
> 
> On Tue, Nov 4, 2025 at 7:37 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> This patchset adds timer test case for LoongArch system, it is based
>> on common arch_timer test case. And it includes one-shot and period mode
>> timer interrupt test, software emulated timer function and time counter
>> test.
>> ---
>> v1 ... v2:
>>    1. Restore PC and PRMD after exception handler.
>>    2. Split patch 4 into two small patches with period timer test and
>>       time counter test.
>>    3. With time counter test, set time count with 0 when create VM. And
>>       verify time count starts from 0 in guest code.
>> ---
>> Bibo Mao (7):
>>    KVM: LoongArch: selftests: Add system registers save and restore on
>>      exception
>>    KVM: LoongArch: selftests: Add exception handler register interface
>>    KVM: LoongArch: selftests: Add basic interfaces
>>    KVM: LoongArch: selftests: Add timer test case with one-shot mode
>>    KVM: LoongArch: selftests: Add period mode timer test
>>    KVM: LoongArch: selftests: Add SW emulated timer test
>>    KVM: LoongArch: selftests: Add time counter test
>>
>>   tools/testing/selftests/kvm/Makefile.kvm      |  10 +-
>>   .../kvm/include/loongarch/arch_timer.h        |  84 ++++++++
>>   .../kvm/include/loongarch/processor.h         |  81 +++++++-
>>   .../selftests/kvm/lib/loongarch/exception.S   |   6 +
>>   .../selftests/kvm/lib/loongarch/processor.c   |  47 ++++-
>>   .../selftests/kvm/loongarch/arch_timer.c      | 195 ++++++++++++++++++
>>   6 files changed, 417 insertions(+), 6 deletions(-)
>>   create mode 100644 tools/testing/selftests/kvm/include/loongarch/arch_timer.h
>>   create mode 100644 tools/testing/selftests/kvm/loongarch/arch_timer.c
>>
>>
>> base-commit: ec0b62ccc986c06552c57f54116171cfd186ef92
>> --
>> 2.39.3
>>

