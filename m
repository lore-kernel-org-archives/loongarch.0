Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A521146A8D
	for <loongarch@lists.linux.dev>; Fri,  5 Jul 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173285; cv=none; b=HWHWwhof7SVz8HjJMfCzdJeaffSbAW4t4TEux4MuEAYkajn3KFd+KUfk1Q1V3LQDEkhszeGFV6vpQKCJvS+4jxnkN00LJ7AYFCvghAzfI2UKjAlsPYzHejL8DOEU9TSjGCPsyBuDxleYYMZ18iSIWkAZI8zZgF/mBl0dV5mnqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173285; c=relaxed/simple;
	bh=Mnn7zavjIlCH9dW09Rh11nsxEbN2bWK5P4Os5AVfCFo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mx85Ym1S3HPH482pVNunQgxz0PFGXed+4pHwWL7zNi4a9You5/i58TYjCpaXRvKugsKasG5J2GvWihQ9jR04EgLaU8wJez2UgUY946MB3/ZetL6ymNYwqPFMG1ARDO1FDzWn9xdkgw+8GrPg+ZcXD/30A4iqoIQtdoSbDoKErW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8CxP_HXwodmCEIBAA--.4229S3;
	Fri, 05 Jul 2024 17:54:32 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfcfVwodmrDU8AA--.9067S3;
	Fri, 05 Jul 2024 17:54:31 +0800 (CST)
Subject: Re: [PATCH v3 0/7] LoongArch: KVM: VM migration enhancement
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>,
 Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 WANG Rui <wangrui@loongson.cn>
References: <20240624071422.3473789-1-maobibo@loongson.cn>
 <CAAhV-H4FSKo2+go0aW_4-a06q2FA4cNL_ksSNZoKzd=r+TSykw@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <f8229023-dc94-449a-5f74-02296b3ae56f@loongson.cn>
Date: Fri, 5 Jul 2024 17:54:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4FSKo2+go0aW_4-a06q2FA4cNL_ksSNZoKzd=r+TSykw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfcfVwodmrDU8AA--.9067S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF18Gw4DuFy8tr4xZr1kWFX_yoW5GF1UpF
	Wfuan8KF4DGr43Gwnag342gr90vw1xCryaqF9ayry8CrZ0yFyUtrW7taykuFyrG3yrA3W0
	qrWFywnY93WUA3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcqXdUU
	UUU


Huacai,

Thanks for the carefulness and efforts.

Regards
Bibo Mao

On 2024/7/5 下午5:33, Huacai Chen wrote:
> Series applied, thanks.
> 
> Huacai
> 
> On Mon, Jun 24, 2024 at 3:14 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> This patchset is to solve VM migration issues, the first six patches are
>> mmu relative, the last patch is relative with vcpu interrupt status.
>>
>> It fixes potential issue about tlb flush of secondary mmu and huge page
>> selection etc. Also it hardens LoongArch kvm mmu module.
>>
>> With this patchset, VM successfully migrates on my 3C5000 Dual-Way
>> machine with 32 cores.
>>   1. Pass to migrate when unixbench workload runs with 32 vcpus, for
>> some unixbench testcases there is much IPI sending.
>>   2. Pass to migrate with kernel compiling with 8 vcpus in VM
>>   3. Fail to migrate with kernel compiling with 32 vcpus in VM, since
>> there is to much memory writing operation, also there will be file
>> system inode inconsistent error after migration.
>>
>> ---
>> v2 ... v3:
>>   1. Merge patch 7 into this patchset since it is relative with VM
>> migration bugfix.
>>   2. Sync pending interrupt when getting ESTAT register, SW ESTAT
>> register is read after vcpu_put().
>>   3. Add notation about smp_wmb() when update pmd entry, to elimate
>> checkpatch warning.
>>   4. Remove unnecessary modification about function kvm_pte_huge()
>> in patch 2.
>>   5. Add notation about secondary mmu tlb since it is firstly used here.
>>
>> v1 ... v2:
>>   1. Combine seperate patches into one patchset, all are relative with
>> migration.
>>   2. Mark page accessed without mmu_lock still, however with page ref
>> added
>> ---
>> Bibo Mao (7):
>>    LoongArch: KVM: Delay secondary mmu tlb flush until guest entry
>>    LoongArch: KVM: Select huge page only if secondary mmu supports it
>>    LoongArch: KVM: Discard dirty page tracking on readonly memslot
>>    LoongArch: KVM: Add memory barrier before update pmd entry
>>    LoongArch: KVM: Add dirty bitmap initially all set support
>>    LoongArch: KVM: Mark page accessed and dirty with page ref added
>>    LoongArch: KVM: Sync pending interrupt when getting ESTAT from user
>>      mode
>>
>>   arch/loongarch/include/asm/kvm_host.h |  5 ++
>>   arch/loongarch/include/asm/kvm_mmu.h  |  2 +-
>>   arch/loongarch/kvm/main.c             |  1 +
>>   arch/loongarch/kvm/mmu.c              | 67 ++++++++++++++++++++-------
>>   arch/loongarch/kvm/tlb.c              |  5 +-
>>   arch/loongarch/kvm/vcpu.c             | 29 ++++++++++++
>>   6 files changed, 86 insertions(+), 23 deletions(-)
>>
>>
>> base-commit: 50736169ecc8387247fe6a00932852ce7b057083
>> --
>> 2.39.3
>>
>>

