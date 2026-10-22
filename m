Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655109;
	b=e3Usu02G7oL7ttXP4qYIrdOAx8kbU6UHC59gKhE+VwoSN92vOCTOJUEWL4GlJIoQwyQL
	 JgG4Dno2lXOK+V5xT9KAU7ict1ift7VexufeO49DvGi2sei6LoLG1hWnWXZ6UEo+HXPtK
	 wXN2tz7K1ECHzjs5sbThF3zkduxTpElc4brIoFRnsle/axnpl1cWvnv2wuRAxVyPQJMTn
	 ur/qdjc7oZnnD0w8ua6Jw3MgxwkVmL9zIN3PvZUCDBUO/O+vH1t06ro52TxBwsRbepvif
	 fR8Zyvnb3/Xb2nGkLSBpfyFbS6JKx5U9NaizD95mjZFGue02gOJ5Mmu6xxlG4q2CkTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
	b=CY1RgtYBwEF8aVvoXaDJjDVn+tTSR6XpbKbJGNqWHHLaUxfz53cq1Fkakq0ZTBQBMIE5
	 Hw/GJFVjbulVuzsnn812X6CVaP68Q3+EUvvkwFbH+nz5IIv5fhPfD04VHs+EbrnDeMChU
	 3SqGK6C07WwaPwCdMAZSZABdsh90LIxfDxy00aHhUlQFNy/i5cw0w3QRjjuEKN+7+1Fh9
	 I6c7QyGcgP0aocPkfDie8u9lJwGjg/CF+C+WfbX4BDneoD1UV7fXZIULjH0JjMgWj2PLA
	 6zpNLN4Lby1gRDciWtwnels3/0F+xL3k2fwyEh0gdZQKRrN4H+bfoXu13dD0unzOYag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rk25qGEr;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98CB606A321
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 07:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rk25qGEr
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso933625a91.1
        for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655108; x=1793259908; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=rk25qGEr/mTVyStsgBtqsLniSoLzdvMNydpDTzZOO+QRVoQvy1Vc9UbICzdhK5FlOK
         RcHVNLlP6F/hdXPassNhSlfjycQ/3YGhWoRHpQLCyKpdQ6ET1eQjvi6KaGFps6KITwSr
         4EQikr03yMhv84uGDBLpOb+PwXbplBEuEC2EalWoUmYJN2KBxtgizBtQlSZQ+r823Av9
         2iysbajYAOY4NaIM7PMz+xm4uJ52+9s0kjs4OLIaZESCn9w5SRwmDEcN6q0QhOspzt1C
         guTvA1mqt08cwTI3lbjEdckDsBCnYbjeN5rUAK3NTNizCmSv/kjzPPmXnl4i+2uMZjX6
         HWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655108; x=1793259908;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDXHwat4zLpbZennBEg7uZauJYVMECCPqpPno/TLnRE=;
        b=dS/0Ln5VDykWPtxUEYxsGOi1nhSJHcnKOEhAyocShhNJWFG7qqeBUoalkm75RCsEcP
         1zhLdmcU2bsCZgAFyUEw1VIMcxDgkJ9a+WTKvbOyZlyumv58j1o300CMUQUGDNefE2E5
         SGlWw6KJerqajAZAIZZSRpVQ3CpSCax2qZgquX7/uEYql3FQ0Om9B/GbXmNxVcW40AUj
         gIgltrhjhKsXtc7YIcKxmnK8sI1Jmu4Bbn6hhhJsyHKK/NlHEHPQcahJEUpAt6+WVdcF
         uiY+K9SPpJWdy6C/j9thb4cuPIXT7KEeDwQ0tbMqlXx5kPNRdiCL7CmXke398Y/wIo2O
         RJAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw96voC35DK5zMqNEqFOYVbgpRsWMCNKqDQvsHk7AQSq4SLx/ZCwY9bQDaYGKqpDJ8b6yxullFF2p0=@lists.linux.dev
X-Gm-Message-State: AFq9FYKSyDEZ+ia6/nKMjmiZ3dLM3b+0+huO+NGEXqqOonUTTDzbFfmI
	GoOLMKEkpDBu5Vmz888QPF46Gu+pBxfn491J3sjNUJoJ22qNgToRnsEr
X-Gm-Gg: AYBFou3PGD8kQXEJuicgvZFJ21Pm1WTf9svmdn0JUFSZL5GZpeE+ajxAfPn+lOPGqNo
	2a1YPTgJ1/5u95vfaIJYG2cJknB9sEWBxI0VNEKvUlBDtk3rPwJxe0R5MlLb96hr4Sq43IArTJp
	l/FNgSwuL9UWuOXeXY6Rm5aD+RMWEZLa5aJ7ceJEUJg/3rB23VixjuG9qXaXgFMppjpCmGwZzsv
	w6xL2KJoOLOSUL9SxehES2OMFupkeROOwfXj/SvCbrdU8kUNc0ls4LBvrDD33kL+Hx4aw5yDrcn
	MIHvsnhg8YdsCEMvLLJ4ua/asaOZ/thk2IiwrVfs4ZHrlDeMLCUYDGKqMvFCHhxqXxEe26nx/F/
	ZNSp34fTAxKS0bZcu0F9uC3HT1t8af4vLz63n9cvLS/XHyE1TjJKc5KcQ6VKie56/3AG8CSmwTf
	XvOnrOWuWasS8xsjMHE5Vt3SbFXQJEGz7v63MZjo469R/jd41Cd0TirB5vr3v3MCsngutXwDocf
	F/sTpAKTBSSF09R+HJy5SMUaWPKzibpb2CCDcU30eQLQ4pWO2GRhMCc6+upofc=
X-Received: by 2002:a17:90b:5870:b0:3ab:5758:3766 with SMTP id 98e67ed59e1d1-3ad8707700dmr3724932a91.51.1792655107849;
        Thu, 22 Oct 2026 00:45:07 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm2945920a91.14.2026.10.22.00.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:45:06 -0700 (PDT)
Message-ID: <098ff899-81b9-4ccc-a143-1e324446258f@gmail.com>
Date: Thu, 22 Oct 2026 15:44:48 +0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org,
 m.szyprowski@samsung.com
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
 <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
 <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/26 10:00, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/21 17:48, Wandun 写道:
>>
>>
>> On 10/21/26 17:13, Jinjie Ruan wrote:
>>>
>>>
>>> 在 2026/10/21 16:30, Wandun Chen 写道:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> crash_prepare_headers() counts memory ranges before populating the
>>>> allocated crash_mem array. The weak implementation used by ARM64,
>>>> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
>>>> two-pass operation over system RAM resources. Concurrent memory hotplug
>>>> can change range source between the two walks and make the populate
>>>> pass overflow cmem->ranges.
>>>>
>>>> Take device_hotplug_lock when preparing crash headers during
>>>> kexec_file_load(). The x86/riscv memory hotplug path already takes
>>>> device_hotplug_lock, so call __crash_prepare_headers() directly
>>>> to avoid recursive locking.
>>>>
>>>> Sashiko reported this issue in [1].
>>>>
>>>> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
>>>> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
>>>> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
>>>> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
>>>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>>>> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
>>>> Acked-by: Baoquan He <baoquan.he@linux.dev>
>>>> ---
>>>>  arch/riscv/kernel/crash.c  |  2 +-
>>>>  arch/x86/kernel/crash.c    |  2 +-
>>>>  include/linux/crash_core.h |  2 ++
>>>>  kernel/crash_core.c        | 17 +++++++++++++++--
>>>>  4 files changed, 19 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
>>>> index fe5a4b306aae..ac8df2edf2a7 100644
>>>> --- a/arch/riscv/kernel/crash.c
>>>> +++ b/arch/riscv/kernel/crash.c
>>>> @@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>>>  	 * memory resources.
>>>>  	 */
>>>> -	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>>> +	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>>>  		pr_err("unable to create new elfcorehdr");
>>>>  		goto out;
>>>>  	}
>>>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>>>> index e6f23933a6df..bef008a0cb22 100644
>>>> --- a/arch/x86/kernel/crash.c
>>>> +++ b/arch/x86/kernel/crash.c
>>>> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>>>  	 * memory resources.
>>>>  	 */
>>>> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>>> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>>>  		pr_err("unable to create new elfcorehdr");
>>>>  		goto out;
>>>>  	}
>>>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>>>> index bc087124cd78..28e7a81cf263 100644
>>>> --- a/include/linux/crash_core.h
>>>> +++ b/include/linux/crash_core.h
>>>> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>>>>  				       void **addr, unsigned long *sz);
>>>>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>>>>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
>>>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			    unsigned long *nr_mem_ranges);
>>>>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>>>>  
>>>>  struct kimage;
>>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>>> index faa0f22dbb41..8a861a946e26 100644
>>>> --- a/kernel/crash_core.c
>>>> +++ b/kernel/crash_core.c
>>>> @@ -16,6 +16,7 @@
>>>>  #include <linux/mm.h>
>>>>  #include <linux/cpuhotplug.h>
>>>>  #include <linux/memblock.h>
>>>> +#include <linux/device.h>
>>>>  #include <linux/kmemleak.h>
>>>>  #include <linux/crash_core.h>
>>>>  #include <linux/reboot.h>
>>>> @@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> -			  unsigned long *nr_mem_ranges)
>>>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			    unsigned long *nr_mem_ranges)
>>>>  {
>>>>  	unsigned int max_nr_ranges;
>>>>  	struct crash_mem *cmem;
>>>> @@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>>> +			  unsigned long *nr_mem_ranges)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	lock_device_hotplug();
>>>> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
>>>> +	unlock_device_hotplug();
>>>
>>> I think this patch conflicts with my changes and would also conflict
>>> with the implementation of arm64 crash hotplug.
>>>
>>> https://lore.kernel.org/all/20260921090450.807575-15-ruanjinjie@huawei.com/
>>>
>> Have these patches already been merged? My current work is based on the latest
>> linux-next. If they have already been merged into the maintainer's branch,
>> please let me know, I will update my tree and rebase/re-adapt my changes accordingly.
>>
>>
>> Also, regarding the changes in kernel/crash_core.c: it looks like we modified
>> the same spot, the change is not wrong, is that right?
> 
> Hi Wandun,
> 
> However, I think someone should have informed me in advance; otherwise,
> doing duplicate fix work is pointless.
> 
> I see that part of your patch series modifies code I previously changed,
> but I was not CC'd.

Hi Jinjie,

Sorry for not CC'ing you. I keep the per-patch Cc lists short because
large recipient sets have caused my sends to be cut off midway before,
(I'm still trying to track down exactly where the problem is) you should
have been on the list that's my miss. You'll be on the Cc of every future
version.
> 
>>
>>> arm64 crash hotplug:
>>> https://lore.kernel.org/all/20260918100442.3841135-18-ruanjinjie@huawei.com/
>>
>> In addition, if arm64 gains crash hotplug support, the code there would indeed
>> need to be modified (to avoid a deadlock). As of now, arm64 crash hotplug
>> support has not been merged yet either, has it? I just want to make sure I
>> haven't missed anything.
> 
> Yes, you are right. If your patch series will be merged soon, I will
> develop based on it.

Also thanks for your reminder, otherwise I might later overlook the case
where arm64 has already gained crash hotplug support, and introduce bugs
as a result.


Best regards,
Wandun>
>>
>>>
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  /**
>>>>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>>>>   * @mem: mem->range contains an array of ranges sorted in ascending order
>>>
>>
> 

