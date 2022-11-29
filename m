Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA5F627
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1669689623; bh=dYOv4utJcmNrRCn/aYqrxyaSFiey9iD+no6SQCAi4Do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TOT0fPBFUIrqM73Yrv7pEfTxkRzm2XaefDZezqg2ruuAdt518jacmvAML23h4PFvt
	 7lt14zoJ5i4aXQKhFmoROR/ja5vXhZsWKa4uhO9hcrtKsFGBKJpOAODqrwNpV/TGTO
	 PDuZBkli576rRJbEi5Xq+OBk3gYSMcY1W8e72Zow=
Received: from [192.168.9.172] (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 1DEDD600D1;
	Tue, 29 Nov 2022 10:40:23 +0800 (CST)
Message-ID: <29198961-5100-8e8c-f5a2-87d15769c550@xen0n.name>
Date: Tue, 29 Nov 2022 10:40:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/109.0 Thunderbird/109.0a1
Subject: Re: [PATCH v4 1/2] docs/LoongArch: Add booting
To: Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
 corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc: wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com, liuyun@loongson.cn,
 linux-doc@vger.kernel.org, loongarch@lists.linux.dev, siyanteng01@gmail.com,
 Xiaotian Wu <wuxiaotian@loongson.cn>
References: <cover.1669686320.git.siyanteng@loongson.cn>
 <653b590c8e7ca42faff18cabfceb9b7f4b2971c1.1669686320.git.siyanteng@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <653b590c8e7ca42faff18cabfceb9b7f4b2971c1.1669686320.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/29/22 09:52, Yanteng Si wrote:
> Describes the meaning and value of the image header field.
>
> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   Documentation/loongarch/booting.rst | 89 +++++++++++++++++++++++++++++
>   Documentation/loongarch/index.rst   |  1 +
>   2 files changed, 90 insertions(+)
>   create mode 100644 Documentation/loongarch/booting.rst
>
> diff --git a/Documentation/loongarch/booting.rst b/Documentation/loongarch/booting.rst
> new file mode 100644
> index 000000000000..90456f713c48
> --- /dev/null
> +++ b/Documentation/loongarch/booting.rst
> @@ -0,0 +1,89 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================
> +启动 LoongArch Linux

Forgot to translate this? ;-)

Also it's probably more idiomatic to use the "Linux/LoongArch" 
convention throughout, as can be seen from similar previous usages such 
as "Linux/Alpha", "Linux/IA64", "Linux/PA-RISC" or "Linux/MIPS". (Of 
course it's "RISC-V Linux" according to my grep result but it's probably 
better to stick to traditions here IMO.)

> +====================
> +
> +:Author: Yanteng Si <siyanteng@loongson.cn>
> +:Date:   18 Nov 2022
> +
> +BootLoader passing parameters to the kernel
"Bootloader" or "Boot loader", but not "BootLoader".
> +===========================================
> +
> +LoongArch supports ACPI and FDT. The information that needs to be
> +passed to the kernel are memmap, initrd, cmdline, fdt, etc.
Perhaps "... includes the memmap, the initrd, the command line, 
optionally the FDT, and so on." could be better?
> +On LoongArch machines, the BootLoader (EFISTUB/Grub) will pass three
> +valid parameters to the kernel, which are::

The "on LoongArch machines" seems redundant, we're a LoongArch document 
so it's kinda implied information. Also drop "valid" as it's quite 
obvious too.

And it's not the bootloader that provides the kernel with those 3 
arguments, kernel_entry isn't directly called by firmware but rather by 
the EFI stub. And I doubt the FDT boot flow invokes kernel_entry either. 
Let's clarify things then, make the whole paragraph something like this:

"The kernel is passed the following arguments on `kernel_entry`::"

> +
> +      a0 = efi_boot
> +      a1 = cmdline
> +      a2 = systemtable
> +
> +where a1 is a pointer to cmdline, a2 contains the memmap, initrd,
> +fdt(opt) and other information that needs to be passed to the kernel.

Please use a list for enumerating the 3 arguments.

Also the list belongs to the previous sentence, so you shouldn't start 
this paragraph with "where" but rather please use a new sentence. And 
the fact that a0 is a flag indicating whether full UEFI capabilities are 
present needs mentioning too.

"`efi_boot` is a flag indicating whether this boot environment is fully 
UEFI-compliant. `cmdline` is a pointer to the kernel command line. 
`systemtable` points to the EFI system table. All pointers involved at 
this stage are in physical addresses."

> +
> +Boot image header in LoongArch Linux
"Header of Linux/LoongArch kernel images"
> +====================================
> +
> +The following 64-byte header is present in decompressed Linux
> +kernel image::

Everything becomes crystal clear when you somehow indicate it's just the 
DOS header of the EFI stub. Also AFAIK no LoongArch bootloader 
decompress the kernel image themselves, so it's not like there exists 
any "compressed Linux kernel image".

"Linux/LoongArch kernel images are EFI images. Being PE files, they have 
a 64-byte header structured like::"

> +
> +	u32	MZ_MAGIC		/* "MZ", MS-DOS header */
> +	u32	res0 = 0		/* reserved */
> +	u64	kernel_entry		/* Kernel entry point */
> +	u64	_end - _text		/* Kernel image effective size */
> +	u64	0			/* Kernel image load offset from start of RAM */
> +	u64	res1 = 0		/* reserved */
> +	u64	res2 = 0		/* reserved */
> +	u64	res3 = 0		/* reserved */
> +	u32	res4 = 0		/* reserved */
> +	u32	pe_header - _head	/* Offset to the PE header */
> +
> +Header notes
> +============
No need for a new section: the rest are all explanations to the 
structure mentioned above.
> +
> +Currently, LoongArch has removed the "magic" field.

Needs more background information, and (IMO) unnatural topicalization.

"LoongArch has abolished the use of a magic number for identifying the 
boot image as one for the LoongArch, because ..."

Right now, unfortunately I don't have enough time for providing all the 
details for the justification of removal of magic number, but you can 
refer to previous (long) threads where the earlier versions of the arch 
EFI boot code were reviewed. Pay attention especially to ardb's very 
detailed and in-depth explanation, you want to "transplant" the info here.

> +
> +According to the EFI specification, the PE/COFF image file header is
> +required at the beginning of the kernel image; the LoongArch kernel
> +supports the EFI stub, so the first two bytes of the kernel image header
> +are "MZ" magic characters, and 0x3c should point to the rest of the
> +PE/COFF file header, between which The kernel entry point, image
> +effectivesize, and image load offset layout are as follows::
> +
> +          +-----------------------------------------------+
> +          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
> +          +-----------------------------------------------+
> +    0x00: |       MZ_MAGIC        |          res0         |
> +          +-----------------------------------------------+
> +    0x08: |                 kernel_entry                  |
> +          +-----------------------------------------------+
> +    0x10: |                  _end - _text                 |
> +          +-----------------------------------------------+
> +    0x18: |                       0                       |
> +          +-----------------------------------------------+
> +    0x20: |                      res1                     |
> +          +-----------------------------------------------+
> +    0x28: |                      res2                     |
> +          +-----------------------------------------------+
> +    0x30: |                      res3                     |
> +          +-----------------------------------------------+
> +    0x38: |          res4         |       PE header       |
> +          +-----------------------------------------------+

This is repeating the structure described above, only in a pictorial 
form. I think only one needs to be kept.

> +
> +All bit fields are in little endian:
> +
> +    - MZ: Effective length of 2 bytes;
> +
> +    - kernel entry point: leaving 6 bytes blank in front, starting
> +      from 0x8, with a effective length of 8 bytes;
> +
> +    - kernel image effective size: Immediately following the kernel
> +      entry point, with a effective length of 8 bytes, this field is
> +      required for the bootloader;

The boot loader probably doesn't care. GRUB2 just chain-loads after 
recognizing the image as valid EFI application, and the firmware most 
certainly just do its routine EFI application launch too without looking 
at the contents here that are all in fact just reserved space. (IIUC 
only the MZ signature and the PE header offset matter here; everything 
in between is actually part of the DOS stub which is ignored on all 
modern platforms.)

So, please clarify which component requires this info; is it the EFI 
stub instead? (I haven't checked myself though due to limited review 
time. Sorry for that.)

> +
> +    - kernel image load offset: Immediately following the kernel
> +      image effective size, with a effective length of 8 bytes;
> +
> +    - Offset to the PE header: leaving 28 bytes blank in front,
> +      starting from 0x3c, with a effective length of 4 bytes.
Drop explanation for trivial things like MZ or the PE header offset, 
they're just common PE format thing, and totally unrelated to Linux.
> diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
> index aaba648db907..df0174d6d227 100644
> --- a/Documentation/loongarch/index.rst
> +++ b/Documentation/loongarch/index.rst
> @@ -10,6 +10,7 @@ LoongArch Architecture
>   
>      introduction
>      irq-chip-model
> +   booting
>   
>      features
>   

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

