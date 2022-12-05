Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFCA17E0
	for <loongarch@lists.linux.dev>; Mon,  5 Dec 2022 09:29:06 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8Cxl_HguY1jBj4DAA--.7465S3;
	Mon, 05 Dec 2022 17:29:04 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuDfuY1jB94lAA--.27647S3;
	Mon, 05 Dec 2022 17:29:04 +0800 (CST)
Message-ID: <2eca3c45-b0b2-6a3e-c0b1-a8b42e350b1a@loongson.cn>
Date: Mon, 5 Dec 2022 17:29:02 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/2] docs/LoongArch: Add booting
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>, chenhuacai@kernel.org, corbet@lwn.net,
 alexs@kernel.org, seakeel@gmail.com
Cc: wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com, liuyun@loongson.cn,
 linux-doc@vger.kernel.org, loongarch@lists.linux.dev, siyanteng01@gmail.com,
 Xiaotian Wu <wuxiaotian@loongson.cn>
References: <cover.1669686320.git.siyanteng@loongson.cn>
 <653b590c8e7ca42faff18cabfceb9b7f4b2971c1.1669686320.git.siyanteng@loongson.cn>
 <29198961-5100-8e8c-f5a2-87d15769c550@xen0n.name>
 <6b84b57f-5293-0636-7a91-235aea910b7a@loongson.cn>
 <202a3cb4-a197-f26d-b9cc-72a017cd00a0@xen0n.name>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <202a3cb4-a197-f26d-b9cc-72a017cd00a0@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTuDfuY1jB94lAA--.27647S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JFyxuF15Wry8Jr4UZF45GFg_yoWxGF45pr
	1fJF17tFyDJr1fJr17Kw1UXr9Fyr18J3WUXr1UJFy8Jr1qvr1qqr1UXr1vgFyUJrWfJFyj
	qr1UJr9rZF15ArDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==


在 11/29/22 22:02, WANG Xuerui 写道:
> On 11/29/22 21:03, Yanteng Si wrote:
>>
>> On 11/29/22 10:40, WANG Xuerui wrote:
>>> On 11/29/22 09:52, Yanteng Si wrote:
>>>> Describes the meaning and value of the image header field.
>>>>
>>>> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>>> ---
>>>>   Documentation/loongarch/booting.rst | 89 
>>>> +++++++++++++++++++++++++++++
>>>>   Documentation/loongarch/index.rst   |  1 +
>>>>   2 files changed, 90 insertions(+)
>>>>   create mode 100644 Documentation/loongarch/booting.rst
>>>>
>>>> diff --git a/Documentation/loongarch/booting.rst 
>>>> b/Documentation/loongarch/booting.rst
>>>> new file mode 100644
>>>> index 000000000000..90456f713c48
>>>> --- /dev/null
>>>> +++ b/Documentation/loongarch/booting.rst
>>>>
>>>> [snip]
>>>>
>>>>> +
>>>>> +According to the EFI specification, the PE/COFF image file header is
>>>>> +required at the beginning of the kernel image; the LoongArch kernel
>>>>> +supports the EFI stub, so the first two bytes of the kernel image 
>>>>> header
>>>>> +are "MZ" magic characters, and 0x3c should point to the rest of the
>>>>> +PE/COFF file header, between which The kernel entry point, image
>>>>> +effectivesize, and image load offset layout are as follows::
>>>>> +
>>>>> + +-----------------------------------------------+
>>>>> +          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x00: |       MZ_MAGIC        |          res0 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x08: |                 kernel_entry |
>>>>> + +-----------------------------------------------+
>>>>> +    0x10: |                  _end - _text |
>>>>> + +-----------------------------------------------+
>>>>> +    0x18: |                       0 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x20: |                      res1 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x28: |                      res2 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x30: |                      res3 |
>>>>> + +-----------------------------------------------+
>>>>> +    0x38: |          res4         |       PE header |
>>>>> + +-----------------------------------------------+
>>>>
>>>> This is repeating the structure described above, only in a 
>>>> pictorial form. I think only one needs to be kept.
>>
>> I don't think so.
>>
>> The above corresponds to the struct in grub, this diagram is much 
>> more readable.
> How is an EFI stub image's header different in grub than somewhere else?
OK, remove it.
>>
>>>
>>>> +
>>>> +All bit fields are in little endian:
>>>> +
>>>> +    - MZ: Effective length of 2 bytes;
>>>> +
>>>> +    - kernel entry point: leaving 6 bytes blank in front, starting
>>>> +      from 0x8, with a effective length of 8 bytes;
>>>> +
>>>> +    - kernel image effective size: Immediately following the kernel
>>>> +      entry point, with a effective length of 8 bytes, this field is
>>>> +      required for the bootloader;
>>>
>>> The boot loader probably doesn't care. GRUB2 just chain-loads after 
>>> recognizing the image as valid EFI application, and the firmware 
>>> most certainly just do its routine EFI application launch too 
>>> without looking at the contents here that are all in fact just 
>>> reserved space. (IIUC only the MZ signature and the PE header offset 
>>> matter here; everything in between is actually part of the DOS stub 
>>> which is ignored on all modern platforms.)
>>>
>>> So, please clarify which component requires this info; is it the EFI 
>>> stub instead? (I haven't checked myself though due to limited review 
>>> time. Sorry for that.)
>>
>> I wrote this article with partial reference to riscv.
>>
>> See Documentation/riscv/boot-image-header.rst line 61:
>>
>> - Image size is mandatory for boot loader to load kernel image. 
>> Booting will
>>   fail otherwise.
> No, the LoongArch EFI boot protocol is not the same as that of RISC-V, 
> we've taken lessons and I believe the LoongArch GRUB2 simply 
> chain-loads the image without any of the extra Linux-specific 
> checking. Please read the previous EFI boot patch threads carefully, 
> and you can also ask Xiaotian or Huacai for details (they're both CC'd 
> on this thread so they should have the context).
Now, MAGIC is back.
>>
>>>
>>>> +
>>>> +    - kernel image load offset: Immediately following the kernel
>>>> +      image effective size, with a effective length of 8 bytes;
>>>> +
>>>> +    - Offset to the PE header: leaving 28 bytes blank in front,
>>>> +      starting from 0x3c, with a effective length of 4 bytes.
>>> Drop explanation for trivial things like MZ or the PE header offset, 
>>> they're just common PE format thing, and totally unrelated to Linux.
>>
>> Here's just a simple description of the header bit fields, which is a 
>> prerequisite for understanding the boot image header.
> Since the boot image is just a PE file, and it's clearly mandated in 
> the UEFI spec, I think some knowledge of the PE format should be 
> necessary after all? In which case the reader could be pointed to the 
> PE spec for the parts not related to Linux or LoongArch, and this 
> document can stay focused on its main topic.

OK.


Thanks,

Yanteng

>>
>>
>> Thanks,
>>
>> Yanteng
>>
>>>> diff --git a/Documentation/loongarch/index.rst 
>>>> b/Documentation/loongarch/index.rst
>>>> index aaba648db907..df0174d6d227 100644
>>>> --- a/Documentation/loongarch/index.rst
>>>> +++ b/Documentation/loongarch/index.rst
>>>> @@ -10,6 +10,7 @@ LoongArch Architecture
>>>>        introduction
>>>>      irq-chip-model
>>>> +   booting
>>>>        features
>>>

