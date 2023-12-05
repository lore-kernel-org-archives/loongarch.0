Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0A36AA0
	for <loongarch@lists.linux.dev>; Tue,  5 Dec 2023 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8Dxg_CDlm5lQPE+AA--.60338S3;
	Tue, 05 Dec 2023 11:18:27 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvi9+lm5lyxRVAA--.57025S3;
	Tue, 05 Dec 2023 11:18:25 +0800 (CST)
Subject: Re: [PATCH v4 1/3] LoongArch: KVM: Remove SW timer switch when vcpu
 is halt polling
To: Huacai Chen <chenhuacai@kernel.org>, zhaotianrui <zhaotianrui@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231116023036.2324371-1-maobibo@loongson.cn>
 <20231116023036.2324371-2-maobibo@loongson.cn>
 <564a2fd3-ffba-3bc5-70b9-8a9fa9a0f1c6@loongson.cn>
 <CAAhV-H4P_JUewDM7R1ByNR4PZa97=xM_rAJ239J-wFSd6_+0GA@mail.gmail.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <17c54ef9-9ce5-bc2b-0566-851fe4da9483@loongson.cn>
Date: Tue, 5 Dec 2023 11:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4P_JUewDM7R1ByNR4PZa97=xM_rAJ239J-wFSd6_+0GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxvi9+lm5lyxRVAA--.57025S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFy3WF48KrW8Cw43Zr48Zrc_yoWrCFWDpF
	WxCFnrZr4rGr17G34aqan0qr42q3s3Kr1xWa47JFyFyrnrtr1xtF18GrZxuFy7Cw4fCFyI
	vr1rKasIvF45A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==



On 2023/12/5 上午10:20, Huacai Chen wrote:
> This series looks good to me, If Paolo agrees, I will apply to
> loongarch-next after [1] is taken into the kvm tree (otherwise there
> will be build errors).
> 
> [1] https://lore.kernel.org/loongarch/CAAhV-H63QkfSw+Esn8oW2PDEsCnTRPFqkj8X-x8i9cH3AS0k9w@mail.gmail.com/T/#t
> 
Got it, and thanks for your information.

Regards
Bibo Mao

> On Mon, Dec 4, 2023 at 4:45 PM zhaotianrui <zhaotianrui@loongson.cn> wrote:
>>
>> Reviewed-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>>
>> 在 2023/11/16 上午10:30, Bibo Mao 写道:
>>> With halt-polling supported, there is checking for pending events
>>> or interrupts when vcpu executes idle instruction. Pending interrupts
>>> include injected SW interrupts and passthrough HW interrupts, such as
>>> HW timer interrupts, since HW timer works still even if vcpu exists
>>> from VM mode.
>>>
>>> Since HW timer pending interrupt can be set directly with CSR status
>>> register, and pending HW timer interrupt checking is used in vcpu block
>>> checking function, it is not necessary to switch to sw timer during
>>> halt-polling. This patch adds preemption disabling in function
>>> kvm_cpu_has_pending_timer, and removes SW timer switching in idle
>>> instruction emulation function.
>>>
>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>>> ---
>>>    arch/loongarch/kvm/exit.c  | 13 ++-----------
>>>    arch/loongarch/kvm/timer.c | 13 ++++++++++---
>>>    arch/loongarch/kvm/vcpu.c  |  9 ++++++++-
>>>    3 files changed, 20 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
>>> index ce8de3fa472c..e708a1786d6b 100644
>>> --- a/arch/loongarch/kvm/exit.c
>>> +++ b/arch/loongarch/kvm/exit.c
>>> @@ -200,17 +200,8 @@ int kvm_emu_idle(struct kvm_vcpu *vcpu)
>>>        ++vcpu->stat.idle_exits;
>>>        trace_kvm_exit_idle(vcpu, KVM_TRACE_EXIT_IDLE);
>>>
>>> -     if (!kvm_arch_vcpu_runnable(vcpu)) {
>>> -             /*
>>> -              * Switch to the software timer before halt-polling/blocking as
>>> -              * the guest's timer may be a break event for the vCPU, and the
>>> -              * hypervisor timer runs only when the CPU is in guest mode.
>>> -              * Switch before halt-polling so that KVM recognizes an expired
>>> -              * timer before blocking.
>>> -              */
>>> -             kvm_save_timer(vcpu);
>>> -             kvm_vcpu_block(vcpu);
>>> -     }
>>> +     if (!kvm_arch_vcpu_runnable(vcpu))
>>> +             kvm_vcpu_halt(vcpu);
>>>
>>>        return EMULATE_DONE;
>>>    }
>>> diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
>>> index 284bf553fefe..437e960d8fdb 100644
>>> --- a/arch/loongarch/kvm/timer.c
>>> +++ b/arch/loongarch/kvm/timer.c
>>> @@ -155,11 +155,18 @@ static void _kvm_save_timer(struct kvm_vcpu *vcpu)
>>>                 */
>>>                hrtimer_cancel(&vcpu->arch.swtimer);
>>>                hrtimer_start(&vcpu->arch.swtimer, expire, HRTIMER_MODE_ABS_PINNED);
>>> -     } else
>>> +     } else if (vcpu->stat.generic.blocking) {
>>>                /*
>>> -              * Inject timer interrupt so that hall polling can dectect and exit
>>> +              * Inject timer interrupt so that hall polling can dectect and
>>> +              * exit.
>>> +              * VCPU is scheduled out already and sleeps in rcuwait queue and
>>> +              * will not poll pending events again. kvm_queue_irq is not
>>> +              * enough, hrtimer swtimer should be used here.
>>>                 */
>>> -             kvm_queue_irq(vcpu, INT_TI);
>>> +             expire = ktime_add_ns(ktime_get(), 10);  // 10ns is enough here?
>>> +             vcpu->arch.expire = expire;
>>> +             hrtimer_start(&vcpu->arch.swtimer, expire, HRTIMER_MODE_ABS_PINNED);
>>> +     }
>>>    }
>>>
>>>    /*
>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
>>> index 73d0c2b9c1a5..42663a345bd1 100644
>>> --- a/arch/loongarch/kvm/vcpu.c
>>> +++ b/arch/loongarch/kvm/vcpu.c
>>> @@ -187,8 +187,15 @@ int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
>>>
>>>    int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>>>    {
>>> -     return kvm_pending_timer(vcpu) ||
>>> +     int ret;
>>> +
>>> +     /* protect from TOD sync and vcpu_load/put */
>>> +     preempt_disable();
>>> +     ret = kvm_pending_timer(vcpu) ||
>>>                kvm_read_hw_gcsr(LOONGARCH_CSR_ESTAT) & (1 << INT_TI);
>>> +     preempt_enable();
>>> +
>>> +     return ret;
>>>    }
>>>
>>>    int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu)
>>
>>

