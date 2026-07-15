Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE0F317158
	for <loongarch@lists.linux.dev>; Wed, 15 Jul 2026 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096539; cv=none; b=MsbBgUHyZ/0jVl5HDt1em7P0nysamh9i6zF7gHI94NNsYZVVYNF5+P0RFtUo3NvwtBeqMQeu+cp6/JN2LICWZ0VBoQtY79B+uU29iOg1HORwWeSZlKSRPLyj11N5Knx8eVIUvlyVHyxad/cgzpIGF+TftEV9yFe2e06SgYsWoEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096539; c=relaxed/simple;
	bh=fVvDEaGQ/MSqV9WHTUH54HeK2N/sLkWfRHutlgmtj7I=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=k3gq63eV9UY9gJdDkZn9UBEJYe6/pV6DL4Ok/AjwFlCmfdkYsj2nCxRgh5Y2kSLhXvDQqQ2aO+uDidgOorF9sGT2r1P78j8uhy+U2LxqnaVaB0MQWe873MCFuUn+npidxb9BnZuSpoAk/PcKudVGtYC7hmtQhi0mw4dAOQG2zs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxZegRJ1dqpa4DAA--.13508S3;
	Wed, 15 Jul 2026 14:22:09 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJCxq8QNJ1dqwp0NAA--.12679S2;
	Wed, 15 Jul 2026 14:22:08 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Reload one-shot TVAL on migration
 destination
To: Tao Cui <cui.tao@linux.dev>, zhaotianrui@loongson.cn
Cc: chenhuacai@kernel.org, kernel@xen0n.name, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 lixianglai@loongson.cn, cuitao@kylinos.cn
References: <20260715032831.1411664-1-cui.tao@linux.dev>
 <a93bc0fe-58b9-f5af-aefb-f5659e54304f@loongson.cn>
 <5c4f0ea6-b13c-4263-964f-cc4653c5cf6d@linux.dev>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <7ce5c447-87b7-2e8f-9c58-af1d8a211f0a@loongson.cn>
Date: Wed, 15 Jul 2026 14:21:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5c4f0ea6-b13c-4263-964f-cc4653c5cf6d@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxq8QNJ1dqwp0NAA--.12679S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXFy7GFWkuw47Kw1rtr1rKrX_yoWrGr4xpF
	4vk3W3JrWkAr1kGr1DXF1Y9Fy5ZrW8Kw1rGFyUGFW2yrsxKr1YqF4xWFy2gFy5Gr4Iywna
	qr4rXw13ZFn8A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==



On 2026/7/15 下午1:53, Tao Cui wrote:
> 
> 
> 在 2026/7/15 11:49, Bibo Mao 写道:
>>
>>
>> On 2026/7/15 上午11:28, Tao Cui wrote:
>>> From: Tao Cui <cuitao@kylinos.cn>
>>>
>>> kvm_restore_timer() rebuilds the remaining timer countdown from
>>> vcpu->arch.expire, which is host-internal and is not part of the migrated
>>> vCPU state. On the migration destination it is still 0, so for a one-shot
>>> timer that has not expired yet the computed delta is 0 and
>>> write_gcsr_timertick(0) injects the timer interrupt immediately instead of
>>> after the remaining time. The guest observes a premature timer event right
>>> after migration.
>>>
>>> The expired one-shot case (TVAL = -1) is already handled earlier, so only
>>> the non-expired one-shot path is affected. When expire has not been set
>>> (i.e. on the destination), reload the remaining countdown from the
>>> migrated TVAL. The regular preempt/resume path on the source, where
>>> expire is valid, is unchanged.
>>>
>>> Fixes: a5857b9ff6e0 ("LoongArch: KVM: Implement vcpu timer operations")
>>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>>> ---
>>>    arch/loongarch/kvm/timer.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
>>> index 3829f35a4070..57f53d19a00a 100644
>>> --- a/arch/loongarch/kvm/timer.c
>>> +++ b/arch/loongarch/kvm/timer.c
>>> @@ -132,6 +132,14 @@ void kvm_restore_timer(struct kvm_vcpu *vcpu)
>>>             * during injecting intr async
>>>             */
>>>            kvm_queue_irq(vcpu, INT_TI);
>>> +    } else if (!expire) {
>>> +        /*
>>> +         * One-shot timer on the migration destination: vcpu->arch.expire
>>> +         * is host-internal and is not migrated, so it is still 0 here.
>> Good catch, I ever noticed this issue before however without good method. My previous method is to recalculate vcpu->arch.expire in function _kvm_setcsr() when LOONGARCH_CSR_TVAL is set and value of vcpu->arch.expire is 0.
>>
> Thanks for the review and for sharing your idea. I also considered
> recalculating expire in _kvm_setcsr() when TVAL is restored, but ended
> up keeping the change within kvm_restore_timer() to avoid touching the
> core CSR write path. Both approaches are functionally equivalent since
> the first save_timer() after restore will set expire correctly either
> way.
> 
> That said, if you prefer the _kvm_setcsr() approach, I'm happy to
The problem in _kvm_setcsr() is that there is only register 
LOONGARCH_CSR_TVAL however no context of LOONGARCH_CSR_TCFG register, it 
seems that it is better in to restore it in kvm_restore_timer() function 
where all registers about CPU timer are set.

How about something like this, it should work with period timer mode 
when migration.
@@ -119,6 +119,17 @@ void kvm_restore_timer(struct kvm_vcpu *vcpu)
         delta = 0;
         now = ktime_get();
         expire = vcpu->arch.expire;
+       if (!expire) {
+             /*
+              * The field vcpu->arch.expire is host-internal and is not
+              * migrated, so it is 0 after migration. Reload the
+              * remaining countdown from the migrated TVAL.
+              */
+               if (ticks < cfg)
+                       delta = tick_to_ns(vcpu, ticks);
+               expire = ktime_add_ns(ktime_get(), delta);
+       }
+
> rework the patch accordingly.
ok, that is fine. Thanks for catching this issue.

Regards
Bibo Mao
> 
> Thanks,
> Tao
>> Regards
>> Bibo Mao
>>> +         * Reload the remaining countdown from the migrated TVAL instead
>>> +         * of firing the timer immediately.
>>> +         */
>>> +        delta = ticks;
>>>        }
>>>          write_gcsr_timertick(delta);
>>>
>>

