Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6FB39E184
	for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806252; cv=none; b=M+Amxa+3q/M/z/IsNFgbrroLTCxBsHVqOWm+XWC4Ve4mTsnTchDnU2MQTdkXn9XMQm1uDrARimB8bvQZ9slxXL5oIQLVhvZYLudcEkmJ4+4O1lls4GKWQkGoIZrnXohkwb1g2gAIhbxBlLWFsRsTMX/y4OXTNEtjcmwr/xMb5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806252; c=relaxed/simple;
	bh=0lj4b1z4MAkM8HA1oTgCaRteLCdv8SRSr32wvbP198E=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nBzmx1kZNYWyy8Ua71yRlpHmEaDjeirPL1NC6qYEE50R1JK+KIM8An8ISNOuDORbAEzBYTXe6Gz+zDXY1br09WOiNasEBH+YNKulpcpSrYH7SYPZMhXoHv54uoMYxS7WcfkkD5LAbIi4yup7Zwz6xzu9ycnS+ms6cbSMq8NCVYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.239])
	by gateway (Coremail) with SMTP id _____8BxD6okp9hpWegjAA--.40411S3;
	Fri, 10 Apr 2026 15:30:45 +0800 (CST)
Received: from [10.20.42.239] (unknown [10.20.42.239])
	by front1 (Coremail) with SMTP id qMiowJCxfcIdp9hpYDJqAA--.3805S3;
	Fri, 10 Apr 2026 15:30:41 +0800 (CST)
Subject: Re: [PATCH v10 0/2] LoongArch: KVM: Add DMSINTC support irqchip in
 kernel
To: Huacai Chen <chenhuacai@kernel.org>
Cc: maobibo@loongson.cn, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kernel@xen0n.name, linux-kernel@vger.kernel.org, lixianglai@loongson.cn
References: <20260409024215.136932-1-gaosong@loongson.cn>
 <CAAhV-H7JcTV9aBChaYnR4irFt8O3C_9cOu_q4Krc6Q1c7Xwquw@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <45b93b94-fceb-c41e-9b3a-c2b3187eecae@loongson.cn>
Date: Fri, 10 Apr 2026 15:31:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7JcTV9aBChaYnR4irFt8O3C_9cOu_q4Krc6Q1c7Xwquw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJCxfcIdp9hpYDJqAA--.3805S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF1fuFy7GrW7CFWDtF4UWrX_yoW5Zw1rpF
	W3u3Z0kr48Jr13ArsF93Wvvr4UAr93Jr12ga4aga47CrsIqF18Xrn5GrZFyF9Fg3yrGF10
	qa4fW34a93WUJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=

在 2026/4/9 下午8:39, Huacai Chen 写道:
> Applied with small modifications, thanks.
>
> Now all KVM patches for 7.1 are applied here:
> https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-kvm
>
> Please ensure that everything works well.
>
After some basic testing, the functionality is working properly. Compatibility is fine.

Thanks.
Song Gao

> Huacai
>
> On Thu, Apr 9, 2026 at 11:08 AM Song Gao <gaosong@loongson.cn> wrote:
>> Hi,
>>
>> This series  implements the DMSINTC in-kernel irqchip device,
>> enables irqfd to deliver MSI to DMSINTC, and supports injecting MSI interrupts
>> to the target vCPU.
>> applied this series.  use netperf test.
>> VM with one CPU and start netserver, host run netperf.
>> disable dmsintc
>> taskset 0x2f  netperf -H 192.168.122.204 -t UDP_RR  -l 36000
>> Local /Remote
>> Socket Size   Request  Resp.   Elapsed  Trans.
>> Send   Recv   Size     Size    Time     Rate
>> bytes  Bytes  bytes    bytes   secs.    per sec
>>
>> 212992 212992 1        1       36000.00   27107.36
>>
>> enable dmsintc
>> Local /Remote
>> Socket Size   Request  Resp.   Elapsed  Trans.
>> Send   Recv   Size     Size    Time     Rate
>> bytes  Bytes  bytes    bytes   secs.    per sec
>>
>> 212992 212992 1        1       36000.00   28831.14  (+6.3%)
>>
>> v10:
>>    *Changed from v8;
>>    *Rebase.
>>
>> v9:
>>   *Correct the incorrect parameter type and remove the function prefix;
>>   *Fix a boundary value check.
>>
>> v8:
>>    *Move dmsintc_inject_irq(),dmsintc_deliver_msi_to_vcpu()and
>> dmsintc_set_msi_irq to dmsintc.c.
>>    *Rebase.
>>
>> v7:
>>    *Rebase;
>>    *Fix a typo error;
>>    *Drop an extra space;
>>    *Move some code from patch2 to patch1.
>>    *Rename loongarch_dmsintc_inject_irq() to dmsintc_inject_irq() and move
>> it to interrupt.c;
>>    *Rename kvm_loongarch_deliver_msi_to_vcpu() to
>> dmsintc_deliver_msi_to_vcpu() and move it to irqfd.c;
>>    *Drop loongarch_set_msi() and dispatch the dmsintc/eiointc
>> paths in pch_msi_set_irq().
>>
>> v6:
>>    Fix kvm_device leak in kvm_dmsintc_destroy().
>>
>> v5:
>>    Combine patch2 and patch3
>>    Add check msgint feature when register DMSINT device.
>>
>> V4: Rebase and R-b;
>>     replace DINTC to DMSINTC.
>>
>> V3: Fix kvm_arch_set_irq_inatomic() missing dmsintc set msi.(patch3)
>>
>> V2:
>> https://patchew.org/linux/20251128091125.2720148-1-gaosong@loongson.cn/
>>
>> Thanks.
>> Song Gao
>>
>>
>> Song Gao (2):
>>    LoongArch: KVM: Add DMSINTC device support
>>    LoongArch: KVM: Add dmsintc inject msi to the dest vcpu
>>
>>   arch/loongarch/include/asm/kvm_dmsintc.h |  26 ++++
>>   arch/loongarch/include/asm/kvm_host.h    |   3 +
>>   arch/loongarch/include/asm/kvm_pch_pic.h |   4 +-
>>   arch/loongarch/include/uapi/asm/kvm.h    |   4 +
>>   arch/loongarch/kvm/Makefile              |   1 +
>>   arch/loongarch/kvm/intc/dmsintc.c        | 190 +++++++++++++++++++++++
>>   arch/loongarch/kvm/intc/pch_pic.c        |  15 +-
>>   arch/loongarch/kvm/interrupt.c           |   2 +
>>   arch/loongarch/kvm/irqfd.c               |  11 +-
>>   arch/loongarch/kvm/main.c                |   6 +
>>   include/uapi/linux/kvm.h                 |   2 +
>>   11 files changed, 255 insertions(+), 9 deletions(-)
>>   create mode 100644 arch/loongarch/include/asm/kvm_dmsintc.h
>>   create mode 100644 arch/loongarch/kvm/intc/dmsintc.c
>>
>> --
>> 2.39.3
>>

