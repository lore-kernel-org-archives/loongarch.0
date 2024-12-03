Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112AD1DFD9E
	for <loongarch@lists.linux.dev>; Tue,  3 Dec 2024 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219450; cv=none; b=WZIuEe2hpDBda+GLyHdHRtaLrMj4BDp+8mlsIqFcGtYdSKOs7JLgkYRGwustRAdo+E94NX/ae6Mg+6X1b/3TA46K9C1eAbAuNfFfJ7HAqBq94IS15+DAO7QxOPCpL+fjpk68hOEEB9LroLGRgb2GH8BAs6EM0K/p1pO+MHk4EeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219450; c=relaxed/simple;
	bh=hD5EsQIPZqmfmv9zOa5f96mENiNJ8c5VildI0lB0HFg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=O0wdWhJoUS9E1bF/2M0hmrhotD7GsXa1LbnmQehgv9yscaySjCosYWIu3fxdt6KV6UTmKX0iCmoDZva2+U6EUGlUyzT4lZOygA07GN4WNpalYfl2zQuTVrpxwwPd4nJKig3vD745qamB8RyxVqujTdvku9UgIrblN14H678nIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxeeBz1E5nMaBPAA--.23362S3;
	Tue, 03 Dec 2024 17:50:43 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMAxlsBu1E5nN7VzAA--.57761S3;
	Tue, 03 Dec 2024 17:50:41 +0800 (CST)
Subject: Re: [PATCH 1/2] LoongArch: KVM: Protect kvm_check_requests() with
 SRCU
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
References: <20241203065058.4164631-1-chenhuacai@loongson.cn>
 <e0c59558-09ec-1e51-9b36-86b69f7e8bde@loongson.cn>
 <CAAhV-H58ct9uGzyyL5Pz2kVM50K+1B0eGJ0zzb_2aV1Jzwp5+Q@mail.gmail.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <d9a79372-24bd-23bb-8030-4b903db814b5@loongson.cn>
Date: Tue, 3 Dec 2024 17:50:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H58ct9uGzyyL5Pz2kVM50K+1B0eGJ0zzb_2aV1Jzwp5+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxlsBu1E5nN7VzAA--.57761S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZryUWr13Cr1UXr48KryUArc_yoWrZr45pr
	9rGF4I9r4rXry7Aw1jyr1DJr1Utw4DCF1xXr18Jr1UAw1qvr1DJFyUJrWUWFy5C34rCF4x
	AF15trnIyr1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
	uc_UUUUU=



On 2024/12/3 下午5:17, Huacai Chen wrote:
> On Tue, Dec 3, 2024 at 4:27 PM bibo mao <maobibo@loongson.cn> wrote:
>>
>>
>>
>> On 2024/12/3 下午2:50, Huacai Chen wrote:
>>> When we enable lockdep we get such a warning:
>>>
>>>    =============================
>>>    WARNING: suspicious RCU usage
>>>    6.12.0-rc7+ #1891 Tainted: G        W
>>>    -----------------------------
>>>    include/linux/kvm_host.h:1043 suspicious rcu_dereference_check() usage!
>>>    other info that might help us debug this:
>>>    rcu_scheduler_active = 2, debug_locks = 1
>>>    1 lock held by qemu-system-loo/948:
>>>     #0: 90000001184a00a8 (&vcpu->mutex){+.+.}-{4:4}, at: kvm_vcpu_ioctl+0xf4/0xe20 [kvm]
>>>    stack backtrace:
>>>    CPU: 0 UID: 0 PID: 948 Comm: qemu-system-loo Tainted: G        W          6.12.0-rc7+ #1891
>>>    Tainted: [W]=WARN
>>>    Hardware name: Loongson Loongson-3A5000-7A1000-1w-CRB/Loongson-LS3A5000-7A1000-1w-CRB, BIOS vUDK2018-LoongArch-V2.0.0-prebeta9 10/21/2022
>>>    Stack : 0000000000000089 9000000005a0db9c 90000000071519c8 900000012c578000
>>>            900000012c57b920 0000000000000000 900000012c57b928 9000000007e53788
>>>            900000000815bcc8 900000000815bcc0 900000012c57b790 0000000000000001
>>>            0000000000000001 4b031894b9d6b725 0000000004dec000 90000001003299c0
>>>            0000000000000414 0000000000000001 000000000000002d 0000000000000003
>>>            0000000000000030 00000000000003b4 0000000004dec000 90000001184a0000
>>>            900000000806d000 9000000007e53788 00000000000000b4 0000000000000004
>>>            0000000000000004 0000000000000000 0000000000000000 9000000107baf600
>>>            9000000008916000 9000000007e53788 9000000005924778 0000000010000044
>>>            00000000000000b0 0000000000000004 0000000000000000 0000000000071c1d
>>>            ...
>>>    Call Trace:
>>>    [<9000000005924778>] show_stack+0x38/0x180
>>>    [<90000000071519c4>] dump_stack_lvl+0x94/0xe4
>>>    [<90000000059eb754>] lockdep_rcu_suspicious+0x194/0x240
>>>    [<ffff8000022143bc>] kvm_gfn_to_hva_cache_init+0xfc/0x120 [kvm]
>>>    [<ffff80000222ade4>] kvm_pre_enter_guest+0x3a4/0x520 [kvm]
>>>    [<ffff80000222b3dc>] kvm_handle_exit+0x23c/0x480 [kvm]
>>>
>>> Fix it by protecting kvm_check_requests() with SRCU.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>    arch/loongarch/kvm/vcpu.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>> index cab1818be68d..d18a4a270415 100644
>>> --- a/arch/loongarch/kvm/vcpu.c
>>> +++ b/arch/loongarch/kvm/vcpu.c
>>> @@ -240,7 +240,7 @@ static void kvm_late_check_requests(struct kvm_vcpu *vcpu)
>>>     */
>>>    static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
>>>    {
>>> -     int ret;
>>> +     int idx, ret;
>>>
>>>        /*
>>>         * Check conditions before entering the guest
>>> @@ -249,7 +249,9 @@ static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
>>>        if (ret < 0)
>>>                return ret;
>>>
>>> +     idx = srcu_read_lock(&vcpu->kvm->srcu);
>>>        ret = kvm_check_requests(vcpu);
>>> +     srcu_read_unlock(&vcpu->kvm->srcu, idx);
>>>
>>>        return ret;
>>>    }
>>>
>> How about adding rcu readlock with closest function
>> kvm_update_stolen_time()?
> I have considered this method before. But then I read vcpu_run() of
> x86, it protect the whole vcpu_run() except  the subroutine
> xfer_to_guest_mode_handle_work(), so I think protect the whole
> kvm_check_requests() is more like x86.srcu_readlock is to protect memslot or io_bus region to be removed and 
freed.

Both is ok for me, it up to you.

Regards
Bibo Mao
> 
> Huacai
> 
>>
>>    static int kvm_check_requests(struct kvm_vcpu *vcpu)
>>    {
>> +       int idx;
>> +
>>           if (!kvm_request_pending(vcpu))
>>                   return RESUME_GUEST;
>>
>> @@ -213,8 +215,11 @@ static int kvm_check_requests(struct kvm_vcpu *vcpu)
>>           if (kvm_dirty_ring_check_request(vcpu))
>>                   return RESUME_HOST;
>>
>> -       if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
>> +       if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu)) {
>> +               idx = srcu_read_lock(&vcpu->kvm->srcu);
>>                   kvm_update_stolen_time(vcpu);
>> +               srcu_read_unlock(&vcpu->kvm->srcu, idx);
>> +       }
>>
>>           return RESUME_GUEST;
>>    }
>>
>> Both method look good to me.
>>
>> Regards
>> Bibo Mao
>>

