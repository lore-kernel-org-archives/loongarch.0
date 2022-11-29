Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F71322A
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1669730560; bh=y9EauzLm0scBRQQa93V+B6AAKBVnK7BNxP30koTcDR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nLJIaMUdF3yl4etjOGOkf4DOpsYfzqJbu1sVIRMFiNktxNfbo4IqERL1OYfK95+cA
	 fEzcu+/IL8PpFKAqWNZlMKyR6h3U+oZDrPFH+egsx8W7ctfjHh8qRTVIytGNb3NSx+
	 FaoKyNKgABSnjBzs76OLuPO9r2F8dMidyA+xZnw8=
Received: from [192.168.9.172] (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 607A06015C;
	Tue, 29 Nov 2022 22:02:40 +0800 (CST)
Message-ID: <202a3cb4-a197-f26d-b9cc-72a017cd00a0@xen0n.name>
Date: Tue, 29 Nov 2022 22:02:39 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/109.0 Thunderbird/109.0a1
Subject: Re: [PATCH v4 1/2] docs/LoongArch: Add booting
Content-Language: en-US
To: Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
 corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc: wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com, liuyun@loongson.cn,
 linux-doc@vger.kernel.org, loongarch@lists.linux.dev, siyanteng01@gmail.com,
 Xiaotian Wu <wuxiaotian@loongson.cn>
References: <cover.1669686320.git.siyanteng@loongson.cn>
 <653b590c8e7ca42faff18cabfceb9b7f4b2971c1.1669686320.git.siyanteng@loongson.cn>
 <29198961-5100-8e8c-f5a2-87d15769c550@xen0n.name>
 <6b84b57f-5293-0636-7a91-235aea910b7a@loongson.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <6b84b57f-5293-0636-7a91-235aea910b7a@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/29/22 21:03, Yanteng Si wrote:
>
> On 11/29/22 10:40, WANG Xuerui wrote:
>> On 11/29/22 09:52, Yanteng Si wrote:
>>> Describes the meaning and value of the image header field.
>>>
>>> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>   Documentation/loongarch/booting.rst | 89 
>>> +++++++++++++++++++++++++++++
>>>   Documentation/loongarch/index.rst   |  1 +
>>>   2 files changed, 90 insertions(+)
>>>   create mode 100644 Documentation/loongarch/booting.rst
>>>
>>> diff --git a/Documentation/loongarch/booting.rst 
>>> b/Documentation/loongarch/booting.rst
>>> new file mode 100644
>>> index 000000000000..90456f713c48
>>> --- /dev/null
>>> +++ b/Documentation/loongarch/booting.rst
>>>
>>> [snip]
>>>
>>>> +
>>>> +According to the EFI specification, the PE/COFF image file header is
>>>> +required at the beginning of the kernel image; the LoongArch kernel
>>>> +supports the EFI stub, so the first two bytes of the kernel image 
>>>> header
>>>> +are "MZ" magic characters, and 0x3c should point to the rest of the
>>>> +PE/COFF file header, between which The kernel entry point, image
>>>> +effectivesize, and image load offset layout are as follows::
>>>> +
>>>> +          +-----------------------------------------------+
>>>> +          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
>>>> +          +-----------------------------------------------+
>>>> +    0x00: |       MZ_MAGIC        |          res0         |
>>>> +          +-----------------------------------------------+
>>>> +    0x08: |                 kernel_entry                  |
>>>> +          +-----------------------------------------------+
>>>> +    0x10: |                  _end - _text                 |
>>>> +          +-----------------------------------------------+
>>>> +    0x18: |                       0                       |
>>>> +          +-----------------------------------------------+
>>>> +    0x20: |                      res1                     |
>>>> +          +-----------------------------------------------+
>>>> +    0x28: |                      res2                     |
>>>> +          +-----------------------------------------------+
>>>> +    0x30: |                      res3                     |
>>>> +          +-----------------------------------------------+
>>>> +    0x38: |          res4         |       PE header       |
>>>> +          +-----------------------------------------------+
>>>
>>> This is repeating the structure described above, only in a pictorial 
>>> form. I think only one needs to be kept.
>
> I don't think so.
>
> The above corresponds to the struct in grub, this diagram is much more 
> readable.
How is an EFI stub image's header different in grub than somewhere else?
>
>>
>>> +
>>> +All bit fields are in little endian:
>>> +
>>> +    - MZ: Effective length of 2 bytes;
>>> +
>>> +    - kernel entry point: leaving 6 bytes blank in front, starting
>>> +      from 0x8, with a effective length of 8 bytes;
>>> +
>>> +    - kernel image effective size: Immediately following the kernel
>>> +      entry point, with a effective length of 8 bytes, this field is
>>> +      required for the bootloader;
>>
>> The boot loader probably doesn't care. GRUB2 just chain-loads after 
>> recognizing the image as valid EFI application, and the firmware most 
>> certainly just do its routine EFI application launch too without 
>> looking at the contents here that are all in fact just reserved 
>> space. (IIUC only the MZ signature and the PE header offset matter 
>> here; everything in between is actually part of the DOS stub which is 
>> ignored on all modern platforms.)
>>
>> So, please clarify which component requires this info; is it the EFI 
>> stub instead? (I haven't checked myself though due to limited review 
>> time. Sorry for that.)
>
> I wrote this article with partial reference to riscv.
>
> See Documentation/riscv/boot-image-header.rst line 61:
>
> - Image size is mandatory for boot loader to load kernel image. 
> Booting will
>   fail otherwise.
No, the LoongArch EFI boot protocol is not the same as that of RISC-V, 
we've taken lessons and I believe the LoongArch GRUB2 simply chain-loads 
the image without any of the extra Linux-specific checking. Please read 
the previous EFI boot patch threads carefully, and you can also ask 
Xiaotian or Huacai for details (they're both CC'd on this thread so they 
should have the context).
>
>>
>>> +
>>> +    - kernel image load offset: Immediately following the kernel
>>> +      image effective size, with a effective length of 8 bytes;
>>> +
>>> +    - Offset to the PE header: leaving 28 bytes blank in front,
>>> +      starting from 0x3c, with a effective length of 4 bytes.
>> Drop explanation for trivial things like MZ or the PE header offset, 
>> they're just common PE format thing, and totally unrelated to Linux.
>
> Here's just a simple description of the header bit fields, which is a 
> prerequisite for understanding the boot image header.
Since the boot image is just a PE file, and it's clearly mandated in the 
UEFI spec, I think some knowledge of the PE format should be necessary 
after all? In which case the reader could be pointed to the PE spec for 
the parts not related to Linux or LoongArch, and this document can stay 
focused on its main topic.
>
>
> Thanks,
>
> Yanteng
>
>>> diff --git a/Documentation/loongarch/index.rst 
>>> b/Documentation/loongarch/index.rst
>>> index aaba648db907..df0174d6d227 100644
>>> --- a/Documentation/loongarch/index.rst
>>> +++ b/Documentation/loongarch/index.rst
>>> @@ -10,6 +10,7 @@ LoongArch Architecture
>>>        introduction
>>>      irq-chip-model
>>> +   booting
>>>        features
>>
-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

