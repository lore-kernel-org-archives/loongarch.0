Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBD13AA9D4
	for <loongarch@lists.linux.dev>; Fri, 29 May 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037026; cv=none; b=lCWm+l7XNR/J+b0mYe1j0dINiQIgykzOgwTy2M8YYJq6xk/poS8NpJxNjwlt3AdjuiLw34n6iVSTiLRd7Vjsj9MVaZ2HPiOROZqJA9RMZcdSwdoWTdBpGJY1+fLoBYf2a2PW7uSLKMgBaujqyNxCufTCjxZfS0o+IsoQFwBfBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037026; c=relaxed/simple;
	bh=uYSfPgQMOfliQ0QnqZcTOJDwI/fq0Qrowg37nEJvFVs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ukzXSAby4exHk6LQ8rukxmD8hh3tIeeKdt3EWbmA8QkkUdH2VMfWj2NX71u+aQxli7BK9mrog/XGKJSQZG2nGO2xFda8Yg+SGzRw8IzubGHpEYfelBk4ga0dSkWGh5fJD/Mg+rAQ2pV6TMN0cNmJ4XyW84wtSA8kCpa/H157QYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxFemcNRlqHnMOAA--.34851S3;
	Fri, 29 May 2026 14:43:40 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJDxTMKZNRlqOreUAA--.17302S3;
	Fri, 29 May 2026 14:43:39 +0800 (CST)
Subject: Re: [PATCH 1/1] LoongArch: kexec: avoid overwriting QEMU's machine
 FDT at 0x100000
To: Huacai Chen <chenhuacai@kernel.org>, George Guo <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>
References: <20260528135828.196953-1-dongtai.guo@linux.dev>
 <CAAhV-H5R9bHP+sGcLBQVa3Jw41+UWHehDecB7de8+2fjV+866Q@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <dbcb280c-9929-b084-0f2b-4f712a85d17b@loongson.cn>
Date: Fri, 29 May 2026 14:40:34 +0800
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
X-CM-TRANSID:qMiowJDxTMKZNRlqOreUAA--.17302S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxur45KrW3ur17Gw1fCw15Awc_yoW5WF1rpF
	yjyF4YkF4kXF1Sy3yvqw4xWw15W34DJr47W3srKw1ruFsxWw1jgFykX39FgFyrt3WkKw1S
	qFnYgFy0q3WDJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0zMKJUUUU
	U==



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
what is method on other architectures for kexec control page?

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

