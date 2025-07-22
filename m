Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2798EAC6;
	Tue, 22 Jul 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753175249; cv=none; b=oYmv4j3y80W680HfTleeTgyOpMqKXKrSBSQiug6Qme5TBD2TpnhoPoHzTBy0VwIMgU9e4dQdZCMkGtfj4SHpjBi42o2J6A+7uok/a7MtetYs9KjNe072knqZeryXkmtALHKz+QYzUNvencHz1mMqADunpYOX+uSVO8lBKel4BNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753175249; c=relaxed/simple;
	bh=uu7YEV+sBYy0lZ9HJM6cHIKZrL33VDKt+RK+6r+PsbI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TYpgD5YC4TsDbx10Gn6V03FeMc4bSVuoEQgg1QR57GJjDa5qoOD3x02+M5rAvA+8O/Yv7B/skSSlzZLdwZ2pRzWN8URyT3kv1AHV4F0o09C1zaTfpOnc2bi3dLEgm9suRic7bYno9297xVo09decH3Sn75w61no4c/wmM9p0F2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxjazDVH9oZX4vAQ--.63058S3;
	Tue, 22 Jul 2025 17:07:15 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowJAxE+S4VH9ohbEhAA--.44151S3;
	Tue, 22 Jul 2025 17:07:06 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: Implement physical address with ELF program
 header
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>,
 Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250721091248.3896152-1-maobibo@loongson.cn>
 <202507220309.mDl9W32Y-lkp@intel.com>
 <7a5789f1-d6a5-3892-98c1-2c4b8515459d@loongson.cn>
 <CAAhV-H74EpbKsPpc_ToGqP6LKx04z+Dvyuw52u-1A4nQ-wr6WQ@mail.gmail.com>
From: Bibo Mao <maobibo@loongson.cn>
Message-ID: <d6b6aaa8-06f2-1b0d-5ebc-e7a71a20dd7a@loongson.cn>
Date: Tue, 22 Jul 2025 17:05:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H74EpbKsPpc_ToGqP6LKx04z+Dvyuw52u-1A4nQ-wr6WQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+S4VH9ohbEhAA--.44151S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1xGw4kAF4UZFW8JF13GFX_yoWrZw43pr
	n5AayqqF4UKr93X34DKFn0gw1qqrnxWr42qa98J3WfCFy7XF18Z3s7Gr9ruasFq34UK3W0
	gFyrGayjya4Ut3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU24So
	DUUUU



On 2025/7/22 下午12:58, Huacai Chen wrote:
> On Tue, Jul 22, 2025 at 9:33 AM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Oops, it is the obvious compile issue. And I am messed with parallel
>> tasks and do not notice this, what I test is old kernel.
>>
>> Regards
>> Bibo Mao
> Add this part to the patch is enough.
> 
> diff --git a/arch/loongarch/include/asm/addrspace.h
> b/arch/loongarch/include/asm/addrspace.h
> index fe198b473f84..babcc1c6c820 100644
> --- a/arch/loongarch/include/asm/addrspace.h
> +++ b/arch/loongarch/include/asm/addrspace.h
> @@ -18,11 +18,20 @@
>   /*
>    * This gives the physical RAM offset.
>    */
> -#ifndef __ASSEMBLER__
> +#ifdef __ASSEMBLER__
> +
> +#ifndef PHYS_OFFSET
> +#define PHYS_OFFSET    0
> +#endif
> +
> +#else
> +
>   #ifndef PHYS_OFFSET
>   #define PHYS_OFFSET    _UL(0)
>   #endif
> +
>   extern unsigned long vm_map_base;
> +
>   #endif /* __ASSEMBLER__ */
> 
>   #ifndef IO_BASE
sure, will do in this way.

Regards
Bibo Mao
> 
>>
>> On 2025/7/22 上午3:19, kernel test robot wrote:
>>> Hi Bibo,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on 89be9a83ccf1f88522317ce02f854f30d6115c41]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Bibo-Mao/LoongArch-Implement-physical-address-with-ELF-program-header/20250721-171418
>>> base:   89be9a83ccf1f88522317ce02f854f30d6115c41
>>> patch link:    https://lore.kernel.org/r/20250721091248.3896152-1-maobibo%40loongson.cn
>>> patch subject: [PATCH v2] LoongArch: Implement physical address with ELF program header
>>> config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20250722/202507220309.mDl9W32Y-lkp@intel.com/config)
>>> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220309.mDl9W32Y-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202507220309.mDl9W32Y-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:15: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:18: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:33: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:34: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:41: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:46: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:47: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:50: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: ./arch/loongarch/kernel/vmlinux.lds:57: symbol not found: PHYS_OFFSET
>>>      ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
>>>
>>

