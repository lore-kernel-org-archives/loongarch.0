Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A0D289378
	for <loongarch@lists.linux.dev>; Tue, 23 Dec 2025 02:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766457671; cv=none; b=r6+4SdekIYNnXwklXBol5V967m+tQpelmF2eiN41wlsTZnr7fKY4R3UYYbTeygVq+I6Lx6QDpZQcz0BWEzx9mhAGsKY84itMlcxaasazbAJuX0CB9Q/1T/ABDjUpxSrZ/dqfklTPEl06+AulEUBKvKDYbr1JZuzCpEdGIS3AUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766457671; c=relaxed/simple;
	bh=stAUPP8+Kbp1H2heOgsJzavFDRf6zD6tVWAyVK8GbKA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YSVBlRd7c5lNAEabdQmeUM19tDIrjtTbnxdn6ERRz/TdqHod0c2y/O3xm9IzDbCgHJSexf3GII24hyLJ6gv82d8KVFsLzsyRiV77TS/ROkLqUebZmiH1dt05VfE57il7UugNVn//BOdCPPBytAytd06Apt/h/6KP3W0DCW/Jy1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.126])
	by gateway (Coremail) with SMTP id _____8DxOMJBAUpp5EACAA--.7008S3;
	Tue, 23 Dec 2025 10:41:05 +0800 (CST)
Received: from [10.20.42.126] (unknown [10.20.42.126])
	by front1 (Coremail) with SMTP id qMiowJCxHOE9AUppPKwDAA--.11410S3;
	Tue, 23 Dec 2025 10:41:04 +0800 (CST)
Subject: Re: [PATCH V2 2/2] LoongArch: KVM: fix "unreliable stack" issue
To: Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: stable@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Charlie Jenkins <charlie@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20251222113409.2343711-1-lixianglai@loongson.cn>
 <20251222113409.2343711-3-lixianglai@loongson.cn>
 <e1f4b85e-0177-91b7-c422-22ed60607260@loongson.cn>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <48cfef68-533f-b275-764c-2c00b1631e42@loongson.cn>
Date: Tue, 23 Dec 2025 10:37:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e1f4b85e-0177-91b7-c422-22ed60607260@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJCxHOE9AUppPKwDAA--.11410S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxuF4UJrW8Kr1fXrW7uw4kGrX_yoW5Aw1fpa
	yFyF1q9rWDKw1kJw4UWa4DuFyxXFWkK3Z8Wr1xJFyrAr18WryFgFy8XwnI9F1DXw48GF4k
	XFyUtF98ZayUAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAF
	wI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVF
	xhVjvjDU0xZFpf9x07j1LvtUUUUU=

Hi Bibo Mao:
>
>
> On 2025/12/22 下午7:34, Xianglai Li wrote:
>> Insert the appropriate UNWIND macro definition into the kvm_exc_entry in
>> the assembly function to guide the generation of correct ORC table 
>> entries,
>> thereby solving the timeout problem of loading the livepatch-sample 
>> module
>> on a physical machine running multiple vcpus virtual machines.
>>
>> While solving the above problems, we have gained an additional benefit,
>> that is, we can obtain more call stack information
>>
>> Stack information that can be obtained before the problem is fixed:
>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>> [<0>] kvm_exc_entry+0x100/0x1e0
>>
>> Stack information that can be obtained after the problem is fixed:
>> [<0>] kvm_vcpu_block+0x88/0x120 [kvm]
>> [<0>] kvm_vcpu_halt+0x68/0x580 [kvm]
>> [<0>] kvm_emu_idle+0xd4/0xf0 [kvm]
>> [<0>] kvm_handle_gspr+0x7c/0x700 [kvm]
>> [<0>] kvm_handle_exit+0x160/0x270 [kvm]
>> [<0>] kvm_exc_entry+0x100/0x1e0
>> [<0>] kvm_arch_vcpu_ioctl_run+0x260/0x488 [kvm]
>> [<0>] kvm_vcpu_ioctl+0x200/0xcd8 [kvm]
>> [<0>] sys_ioctl+0x498/0xf00
>> [<0>] do_syscall+0x94/0x190
>> [<0>] handle_syscall+0xb8/0x158
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
>> ---
>> Cc: Huacai Chen <chenhuacai@kernel.org>
>> Cc: WANG Xuerui <kernel@xen0n.name>
>> Cc: Tianrui Zhao <zhaotianrui@loongson.cn>
>> Cc: Bibo Mao <maobibo@loongson.cn>
>> Cc: Charlie Jenkins <charlie@rivosinc.com>
>> Cc: Xianglai Li <lixianglai@loongson.cn>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>
>>   arch/loongarch/kvm/switch.S | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
>> index 93845ce53651..e3ecb24a3bc5 100644
>> --- a/arch/loongarch/kvm/switch.S
>> +++ b/arch/loongarch/kvm/switch.S
>> @@ -170,6 +170,7 @@ SYM_CODE_START(kvm_exc_entry)
>>       /* restore per cpu register */
>>       ld.d    u0, a2, KVM_ARCH_HPERCPU
>>       addi.d    sp, sp, -PT_SIZE
>> +    UNWIND_HINT_REGS
>>         /* Prepare handle exception */
>>       or    a0, s0, zero
>> @@ -214,6 +215,7 @@ SYM_FUNC_START(kvm_enter_guest)
>>       addi.d    a2, sp, -PT_SIZE
>>       /* Save host GPRs */
>>       kvm_save_host_gpr a2
>> +    st.d    ra, a2, PT_ERA
> Had better add some comments here to show that it is special for 
> unwind usage since there is "st.d ra, a2, PT_R1" already in macro 
> kvm_save_host_gpr().
>
Ok, I will add some comments to explain it in the next version.
Thanks!
Xianglai.
> Regards
> Bibo Mao
>>         addi.d    a2, a1, KVM_VCPU_ARCH
>>       st.d    sp, a2, KVM_ARCH_HSP
>>

