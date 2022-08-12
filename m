Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35671638
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 10:00:12 +0000 (UTC)
Received: from [10.130.0.193] (unknown [113.200.148.30])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWs2pJPZiWy0PAA--.36277S3;
	Fri, 12 Aug 2022 18:00:10 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
To: Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>
References: <20220811130301.2431582-1-chenhuacai@loongson.cn>
 <bc52a604-828b-6d19-4f9c-df17cd180f34@loongson.cn>
 <CAAhV-H7zjqJDq0aqSx23wxE=sDSZ1dpfPV_D2hS6sEZ8YGDGqw@mail.gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <3002b2b3-2c2c-e32e-c474-d3876d3ef9b7@loongson.cn>
Date: Fri, 12 Aug 2022 18:00:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7zjqJDq0aqSx23wxE=sDSZ1dpfPV_D2hS6sEZ8YGDGqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9AxWs2pJPZiWy0PAA--.36277S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFyfAryxKFWkAr1UKr1rZwb_yoW5uw47pF
	W5AayDKw4kGrnrA3WIyw1UurWrZan2v3W3WFnrtrWfAwnIqrnIyw109w13WF9xJrW8Kr4Y
	9F1UtFW2kay5A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
	Y487MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjfU52NtDUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/

Hi，Jinyang & Huacai

On 08/12/2022 05:24 PM, Huacai Chen wrote:
> Hi, Jinyang,
>
> On Fri, Aug 12, 2022 at 4:24 PM Jinyang He <hejinyang@loongson.cn> wrote:
>>
>> On 08/11/2022 09:03 PM, Huacai Chen wrote:
>>
>>> The kernel entry point of both boot-cpu and nonboot-cpu may be physical
>>> address from BootLoader (in DA mode or identity-mapping PG mode). So we
>>> should jump to the link address before PG enabled (DA is disabled at the
>>> same time) and just after DMW configured.
>>>
>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>> ---
>>>   arch/loongarch/kernel/head.S | 19 +++++++++++--------
>>>   1 file changed, 11 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
>>> index 7062cdf0e33e..c60eb66793e3 100644
>>> --- a/arch/loongarch/kernel/head.S
>>> +++ b/arch/loongarch/kernel/head.S
>>> @@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)                       # kernel entry point
>>>       csrwr           t0, LOONGARCH_CSR_DMWIN0
>>>       li.d            t0, CSR_DMW1_INIT       # CA, PLV0, 0x9000 xxxx xxxx xxxx
>>>       csrwr           t0, LOONGARCH_CSR_DMWIN1
>>> +
>>> +     /* We might not get launched at the address the kernel is linked to,
>>> +        so we jump there.  */
>>> +     la.abs          t0, 0f
>>> +     jr              t0
>>> +0:
>> Hi, Huacai,
>>
>> I care about the real address these codes is running.  We know that the
>> kernel codes is placed at the location 0x9000000000200000 because the
>> firmware, or the compressed kernel puts it in this location. However,
>> there are other ways to put it to others location. E.g. during kdump,
>> when the capture kernel reboot, (here the capture kernel is the same
>> as the standard kernel), its address may be 0x9000000004200000, and
>> the physical address is 0x4200000. If only using la.abs which is a constant
>> after compiled is unreliable. The real address might look like as follows
>>
>>    /* Get High */
>>    csrrd $t0,LOONGARCH_CSR_DMWIN1
>>    srli.d t0, t0, 59
>>    slli.d t0, t0, 59
>>    /* Get Low */
>> 0:
>>    pcaddi t1, (1f-0b)/4
>>    srli.d t1, t1, 48
>>    slli.d t1, t1, 48
>>    /* Combine */
>>    or t0, t0, t1
>>    /* Jump */
>>    jr t0
>> 1:
>>
>> I admit that this thoughts may seem a little strange. It is not fully
>> considered, so if wrong, or should not be considered at present,
>> please ignore.
> That seems like another problem and I haven't thought about it before. :)
Yes, if the later kdump can realize that the production kernel and the
capture kernel are the same image, there will be problems with la.abs.

My local temporary modification is:
-       la.abs          t0, 0f
-       jirl            zero, t0, 0
+       li.d            t0, CACHE_BASE
+       pcaddi          t1, 0
+       or              t0, t0, t1
+       jirl            zero, t0, 0xc

Of course, there will be problems with the existing efistub. The reason
is that the current efistub jumps to the kernel_entry of the efistub
space instead of the kernel space. The correct way is to jump to the
kernel_entry of the kernel space(like RISCV). Some modifications are as
follows (where _start is _text) :

drivers/firmware/efi/libstub/loongarch-stub.c: efi_enter_kernel()
-       real_kernel_entry = (kernel_entry_t)
-               ((unsigned long)&kernel_entry - entrypoint + 
VMLINUX_LOAD_ADDRESS);
+       real_kernel_entry = (kernel_entry_t)
+               ((unsigned long)&kernel_entry - (unsigned long)&_start + 
entrypoint);

Of course, the la.abs method is feasible and easier to understand before 
kdump is implemented

Thanks,
Youling

>
> Huacai
>>
>> Thanks,
>> Jinyang
>>

