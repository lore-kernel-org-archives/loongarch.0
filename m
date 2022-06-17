Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9CA17E5
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 12:38:13 +0000 (UTC)
Received: from [192.168.100.8] (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9+sdaxinpBIAA--.13129S3;
	Fri, 17 Jun 2022 20:38:05 +0800 (CST)
Message-ID: <4d4442b9-2d53-03a2-9b06-053ff46154cb@loongson.cn>
Date: Fri, 17 Jun 2022 20:38:04 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] docs/LoongArch: Fix notes rendering by using reST
 directives
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, bobwxc@email.cn, seakeel@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Yanteng Si <siyanteng01@gmail.com>, loongarch@lists.linux.dev,
 WANG Xuerui <git@xen0n.name>
References: <cover.1655463225.git.siyanteng@loongson.cn>
 <2da9b19588cfa20c3797015ea3ce6831b3a7fa2b.1655463225.git.siyanteng@loongson.cn>
 <CAAhV-H4ihtPn-3zKWaevvTKeCs=tdi8RQ8NaKoEU_XD44mEytg@mail.gmail.com>
 <ff1edf29-8b69-29fc-5ccd-26a6d6ef8bb9@xen0n.name>
From: YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <ff1edf29-8b69-29fc-5ccd-26a6d6ef8bb9@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9Dxj9+sdaxinpBIAA--.13129S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XF47Cw18XF48XrykCr47XFb_yoW7WFWxpF
	ykJayfKr98JryfJw17GF17ZFy8AFn7Ja1DWr4vgF18JwsrZwnYgr1avr4vgFyUGrW8Aay0
	qr1Utw4UuFyUA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9lb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUyaZXDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/


在 2022/6/17 19:49, WANG Xuerui 写道:
> On 2022/6/17 19:05, Huacai Chen wrote:
>> Hi, Yanteng,
>>
>> On Fri, Jun 17, 2022 at 6:55 PM Yanteng Si <siyanteng@loongson.cn> 
>> wrote:
>>> "Note" is an admonition, but it doesn't render
>>> correctly, let's fix it by using reST directives.
>> I think "but it doesn't render correctly" should be "but it isn't
>> correctly rendered in HTML". How do you think, Xuerui?
> This depends on what you mean by "correctly"; actually the original 
> rendering is readable, only that it's not rendered with a "note" 
> block. Maybe just "Notes are better expressed with reST admonitions."?

Great!


Thanks,

Yanteng

>>
>> Huacai
>>> Fixes: 0ea8ce61cb2c ("Documentation: LoongArch: Add basic 
>>> documentations")
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> Reviewed-by: WANG Xuerui <git@xen0n.name>
>>> ---
>>>   Documentation/loongarch/introduction.rst   | 15 +++++++++------
>>>   Documentation/loongarch/irq-chip-model.rst | 22 
>>> +++++++++++++---------
>>>   2 files changed, 22 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/loongarch/introduction.rst 
>>> b/Documentation/loongarch/introduction.rst
>>> index 2bf40ad370df..216b3f390e80 100644
>>> --- a/Documentation/loongarch/introduction.rst
>>> +++ b/Documentation/loongarch/introduction.rst
>>> @@ -45,10 +45,12 @@ Name              Alias Usage               
>>> Preserved
>>>   ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
>>>   ================= =============== =================== ============
>>>
>>> -Note: The register ``$r21`` is reserved in the ELF psABI, but used 
>>> by the Linux
>>> -kernel for storing the percpu base address. It normally has no ABI 
>>> name, but is
>>> -called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` 
>>> in some old code,
>>> -however they are deprecated aliases of ``$a0`` and ``$a1`` 
>>> respectively.
>>> +.. Note::
>>> +    The register ``$r21`` is reserved in the ELF psABI, but used by 
>>> the Linux
>>> +    kernel for storing the percpu base address. It normally has no 
>>> ABI name,
>>> +    but is called ``$u0`` in the kernel. You may also see ``$v0`` 
>>> or ``$v1``
>>> +    in some old code,however they are deprecated aliases of ``$a0`` 
>>> and ``$a1``
>>> +    respectively.
>>>
>>>   FPRs
>>>   ----
>>> @@ -69,8 +71,9 @@ Name              Alias Usage               Preserved
>>>   ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
>>>   ================= ================== =================== ============
>>>
>>> -Note: You may see ``$fv0`` or ``$fv1`` in some old code, however 
>>> they are deprecated
>>> -aliases of ``$fa0`` and ``$fa1`` respectively.
>>> +.. Note::
>>> +    You may see ``$fv0`` or ``$fv1`` in some old code, however they 
>>> are
>>> +    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
>>>
>>>   VRs
>>>   ----
>>> diff --git a/Documentation/loongarch/irq-chip-model.rst 
>>> b/Documentation/loongarch/irq-chip-model.rst
>>> index 8d88f7ab2e5e..7988f4192363 100644
>>> --- a/Documentation/loongarch/irq-chip-model.rst
>>> +++ b/Documentation/loongarch/irq-chip-model.rst
>>> @@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
>>>
>>> https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf 
>>> (in English)
>>>
>>> -Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller 
>>> described
>>> -in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is 
>>> "Legacy I/O
>>> -Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor 
>>> Reference
>>> -Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 
>>> 11.2 of
>>> -"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is 
>>> "HyperTransport
>>> -Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor 
>>> Reference
>>> -Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in 
>>> Section 5 of
>>> -"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" 
>>> described in
>>> -Section 24.3 of "Loongson 7A1000 Bridge User Manual".
>>> +.. Note::
>>> +    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller 
>>> described
>>> +      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
>>> +    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
>>> +      "Loongson 3A5000 Processor Reference Manual";
>>> +    - EIOINTC is "Extended I/O Interrupts" described in Section 
>>> 11.2 of
>>> +      "Loongson 3A5000 Processor Reference Manual";
>>> +    - HTVECINTC is "HyperTransport Interrupts" described in Section 
>>> 14.3 of
>>> +      "Loongson 3A5000 Processor Reference Manual";
>>> +    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in 
>>> Section 5 of
>>> +      "Loongson 7A1000 Bridge User Manual";
>>> +    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
>>> +      "Loongson 7A1000 Bridge User Manual".
>>> -- 
>>> 2.27.0
>>>

