Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138173876BB
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780035732; cv=none; b=u7JJvEalMtjD/ynuGZ5E/CFC51HfOrJlYh+VtzetT6Oj/WiNfmBDJgbIWHp/3mTcWnO60jBoaaoZ4xk0RZ6MPQy0PThq3WIFKWXllCSVC6m8ngzx5VcDy4A+OQvQtM1R3oHArTjWXWfnnFt2Y1VLQEhQjFbYsYOEokizLVhuKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780035732; c=relaxed/simple;
	bh=M+dvbLWgXwXpWGqhl71Sbu6lZSaGW/Ji/T9To8un5h8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sM3CCmH/Rg4W70zTT4wh1LFT1/U2pSvUlicPfPoImtsFQVyqfUxgbO4jKic5OCgjnbPOjSdx0Iobci3psy05Srp3wrpBDw6FzIgPFSL/OmD8Wog3ZaUPzUpvVufMonBtf4kDmgqKM/J696GgoFnCBm0DZ3QiyddMr+MQhva53Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxVumOMBlq63EOAA--.34985S3;
	Fri, 29 May 2026 14:22:06 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxysGMMBlqErGUAA--.17684S3;
	Fri, 29 May 2026 14:22:06 +0800 (CST)
Subject: Re: [PATCH 1/1] LoongArch: kexec: avoid overwriting QEMU's machine
 FDT at 0x100000
To: Huacai Chen <chenhuacai@kernel.org>, George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
References: <20260528135828.196953-1-dongtai.guo@linux.dev>
 <CAAhV-H5R9bHP+sGcLBQVa3Jw41+UWHehDecB7de8+2fjV+866Q@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <5f7f0295-36bd-c5b2-fdce-f51d09d105ca@loongson.cn>
Date: Fri, 29 May 2026 14:19:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5R9bHP+sGcLBQVa3Jw41+UWHehDecB7de8+2fjV+866Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxysGMMBlqErGUAA--.17684S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur45KrW3ur17Gw1fCw15Awc_yoW5ArWxpF
	yjvF4YkF4kXF1Sy3yvqw4xWw15W3yDJa17W347K34ruFsxWr1jgFykX39F9FyFqw1kKw1S
	qFnYg3W0qan8J3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_Ma
	UUUUU



On 2026/5/29 下午12:25, Huacai Chen wrote:
> Hi, George,
> 
> On Thu, May 28, 2026 at 9:58 PM George Guo <dongtai.guo@linux.dev> wrote:
>>
>> From: George Guo <guodongtai@kylinos.cn>
>>
>> QEMU places its machine FDT at physical address 0x100000 when booting
>> with '-kernel'.  KEXEC_CONTROL_CODE was defined at the same address, so
>> machine_kexec_prepare() overwrites the FDT with the relocation trampoline
>> before jumping to the new kernel.
>>
>> The kexec'd kernel's fdt_setup() reads the FDT pointer from the EFI
>> config table (FDTPTR = 0x100000) and finds trampoline code instead of a
>> valid FDT, so earlycon auto-detection fails and the second kernel boots
>> silently with no console output.
>>
>> Move KEXEC_CONTROL_CODE to 0x180000, which is still within the first 2MB
>> reserved by memblock_init() and does not conflict with the QEMU FDT.
> Modify QEMU seems better.
> 
> For kernel, the kexec code is introduced by
> 4a03b2ac06a5bcae29371866d9d11f5bfd4c9188 ("LoongArch: Add kexec
> support") at Oct, 12, 2022.
> 
> For QEMU, current FDT is introduced by
> 6042385149a0fb3f4a51d264fc3dc42775819c79 ("hw/loongarch: Init efi_fdt
> table") at April, 26, 2024.
> And earlier history is 46b21de238c643ea098f2dcffe493abd135f7d89
> ("hw/loongarch: Fix loongarch fdt addr confict") which move FDT from
> 2MB (0x200000) to 1MB(0x100000).
> And the earliest QEMU FDT  address is 0x1c400000....
> 
> QEMU FDT has changed many times while kexec keep the same always, and
> the current FDT address is later than kernel (which means QEMU
> conflict with kexec, not kexec conflict with QEMU). So I suggest to
> move QEMU FDT to 0x180000.
It is almost impossible to modify the base address of FDT, there will be 
compatible issue with UEFI BIOS. The virt UEFI BIOS searches this fixed 
address for FDT tree parsing.

Regards
Bibo Mao
> 
> 
> Huacai
> 
>>
>> Signed-off-by: George Guo <guodongtai@kylinos.cn>
>> ---
>>   arch/loongarch/kernel/machine_kexec.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
>> index d7fafda1d541..44df7dbd3de5 100644
>> --- a/arch/loongarch/kernel/machine_kexec.c
>> +++ b/arch/loongarch/kernel/machine_kexec.c
>> @@ -21,8 +21,13 @@
>>   #include <asm/cacheflush.h>
>>   #include <asm/page.h>
>>
>> -/* 0x100000 ~ 0x200000 is safe */
>> -#define KEXEC_CONTROL_CODE     TO_CACHE(0x100000UL)
>> +/*
>> + * Both addresses are within the first 2MB which is always reserved by
>> + * memblock_init().  Avoid 0x100000 because QEMU places its machine FDT
>> + * there when using '-kernel'; overwriting it silences earlycon in the
>> + * kexec'd kernel.
>> + */
>> +#define KEXEC_CONTROL_CODE     TO_CACHE(0x180000UL)
>>   #define KEXEC_CMDLINE_ADDR     TO_CACHE(0x108000UL)
>>
>>   static unsigned long reboot_code_buffer;
>> --
>> 2.25.1
>>

