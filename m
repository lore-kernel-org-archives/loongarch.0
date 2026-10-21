Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576138;
	b=mJyalEUCp3Uy0vxZI0CA+5kn8+VgZmoQ2ZrpYDkFt3tb0DlR9v4UEoglyTUSbAyPDMLQ
	 PMh81IFM7aQIPlbsFJS2n3MwloB6FffV/ShZZeZkr9Uug+HG91WdAzsQ3tbHcNGq5N1F9
	 DLWvtuRQeHiATfgqOXBKK4TfDthB+8CLIyztwUggAJN38ANU8h/0B3pcjx2E6D3UD6Tn9
	 sXPiejU4qgZg9xsOzOT3efYGVJKBhKIVENhUpZVa5ncerS/U6audAkmHWuX+OPTIyId5y
	 7FavqSjFrq5H/18b36gFSiWsBJhkz8Xn6VbVTZ/4L9iM5jrwyESXM3a9j6O4AuoGvzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
	b=khWDs4r37ONHttPTwe/yOwuCbNZJGAahs3pz7mix6PUu/L5w9zT6LCdACxFyNoSE/NHX
	 Krjocg6djQ74EVjApwxStKb6/xsydkz1Hoezh67kQugEQKt6LO9/P5ZI80cgMSJbqG7uG
	 tmlIwLVzN+GAi25U+2zXf1nbqa8KJ5ln7RDCUVIFF0RVl9JM9C810Kml8eUvjhcJlPHjO
	 TbDrLp2hb6de/LOUsG2m0lFtcELfTByJRL7YPp0TOYNdOXmSaRRMps5Ct3MAK48yqoSxZ
	 iuxHojoFBA6Sk5JlOAz9qPCOiZwOaVTguNAe7pWWG4bPrHrWFFmS7wFP4eGAfFNIgSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W9Xsm/L1";
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48F8606A31A
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 09:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W9Xsm/L1
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso2703175ad.0
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576137; x=1793180937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=W9Xsm/L114qOVc+H9WnV3LSeZJNA5/nyEVFjvokmHXiU3AJws1E1dPvPBzj0tPaCPr
         0XuMG7NaPyzGOEvVzCTy74kvzV0HlNS2j/xZ0QX7WWd5fktl0kedzxKNmGi7okcxmxVc
         jzHzPkbQQ8G7PY9FXe0n2jalhWbZuGOUs2TShXuFsHfn82Lc2SKA+yUb/9ZeyUUqy2kJ
         PCxz1JxHJZgQGb3DzxO8YtAaN+13poc5N3hXWhSQAHr4VQnjyeLzbEJMRsiorEjS0o7r
         1HflssKVpl1jrLXWH/pSTOEZ+jqM3amEzq5AYsbuumOTPFZ+phh0bcP0s0aWxPlh4fEO
         JrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576137; x=1793180937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=z3mghZFSaXtCTCBbxZKwWHZUv7EHvr7r9m0vkeu0QNhLmnLHB48EtJqbk67rOpEG9y
         KgR2shJrMiOLfFcFE0pY++//+vOQOkPyKD4NkEke20jkxjyQrwKBf7FmUeIMf221mKPv
         lYm/a5yGyUvl0Gi3IrpNk4ExtYqvidgyzqcUbeMbS/xzU1JZvtLGuoSOWGEWW85cayzJ
         L/gFVOyZGjzFAhyzW9wyh8fGMSPC7G0HQCcmn1Tjl4HN3kq2GLhYptHidrZwwtDzwHLK
         EQCz+SYFCqiAE34ERSLjVW85ws5fi5CC/0atGtvXqlytkTr3yxBaPkCWOxMfxhDciyzj
         zACQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6acJiV1Gs5+YKJAiql8PXwjsFVXM4ASK3BGlLxSuJ6sPjsjiJ/kn4VPSN/F4PiUr48yfQLNDGS64=@lists.linux.dev
X-Gm-Message-State: AFq9FYKdoHzW51eZx9LrYDXz9KfOUdEKh6XB6Yng0vdfarcFRzEYH1KM
	D/mA/aaWDjA12HZ3DpvUWW0R9q6caray5pIZwIVxhGwAO4ie4XFEfomI
X-Gm-Gg: AYBFou0oixdEcCS6ruX+dc9SkpzAbpFdfmNfuow8BnH9giyb4afIaYY0BHQ0OqckuCp
	u7WcksjqSZFVzPZcBwIFYoxsNkkLMv/MB47CXbKSW+kaEC8bfgFrDSZNzIsSz9ac4MFwnOKXBHc
	BV5fbjcSrxoKKfO6/qfJeuWAVTcyYRldf8F/eIYMSupXl+sBXM4VhdKHObY61mRwqWk9PFZ7Brb
	xWHKAOuKc07XEqjyT//0B91GyeHawoKLPKUitEF5Ejr2AP7uegFpA6jldzVLliV01NNlxRQRfNs
	juVsVU5nApywwCTZV7H11QeE95AbBiEj4qazNNaiB1Pj3T4G0LMG8bFURWhW1QzRRYeeqYwaHzX
	pAEvjTsBzmdJG0/jQ/Aj5AFGigaWooGepCrcLBSsBGJ3oMNpKBOHIWzXWVMI0Lq2U3zN2hICj7u
	rzvatm7ljxzOsBNRrterpGqkUVBiExQfZZflwtHGUeapb8hVLv4AvjQtoEs9ae1tlwVOP9LFlql
	+oKQJDOX3NmpgWNJdjzf4oo0C5cPVn3IwcAGm/jQrftZ9qwHj1fQLUhQFqoUz0=
X-Received: by 2002:a17:902:f60e:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea43a13e4fmr10496695ad.20.1792576137131;
        Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486970sm8858055ad.62.2026.10.21.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:48:56 -0700 (PDT)
Message-ID: <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
Date: Wed, 21 Oct 2026 17:48:37 +0800
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
To: Jinjie Ruan <ruanjinjie@huawei.com>, robh@kernel.org,
 baoquan.he@linux.dev, rppt@kernel.org, m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/21/26 17:13, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/21 16:30, Wandun Chen 写道:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> crash_prepare_headers() counts memory ranges before populating the
>> allocated crash_mem array. The weak implementation used by ARM64,
>> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
>> two-pass operation over system RAM resources. Concurrent memory hotplug
>> can change range source between the two walks and make the populate
>> pass overflow cmem->ranges.
>>
>> Take device_hotplug_lock when preparing crash headers during
>> kexec_file_load(). The x86/riscv memory hotplug path already takes
>> device_hotplug_lock, so call __crash_prepare_headers() directly
>> to avoid recursive locking.
>>
>> Sashiko reported this issue in [1].
>>
>> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
>> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
>> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
>> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
>> Acked-by: Baoquan He <baoquan.he@linux.dev>
>> ---
>>  arch/riscv/kernel/crash.c  |  2 +-
>>  arch/x86/kernel/crash.c    |  2 +-
>>  include/linux/crash_core.h |  2 ++
>>  kernel/crash_core.c        | 17 +++++++++++++++--
>>  4 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
>> index fe5a4b306aae..ac8df2edf2a7 100644
>> --- a/arch/riscv/kernel/crash.c
>> +++ b/arch/riscv/kernel/crash.c
>> @@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>  	 * memory resources.
>>  	 */
>> -	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>> +	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>  		pr_err("unable to create new elfcorehdr");
>>  		goto out;
>>  	}
>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index e6f23933a6df..bef008a0cb22 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>  	 * memory resources.
>>  	 */
>> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>  		pr_err("unable to create new elfcorehdr");
>>  		goto out;
>>  	}
>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>> index bc087124cd78..28e7a81cf263 100644
>> --- a/include/linux/crash_core.h
>> +++ b/include/linux/crash_core.h
>> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>>  				       void **addr, unsigned long *sz);
>>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			    unsigned long *nr_mem_ranges);
>>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>>  
>>  struct kimage;
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index faa0f22dbb41..8a861a946e26 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/mm.h>
>>  #include <linux/cpuhotplug.h>
>>  #include <linux/memblock.h>
>> +#include <linux/device.h>
>>  #include <linux/kmemleak.h>
>>  #include <linux/crash_core.h>
>>  #include <linux/reboot.h>
>> @@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>>  	return 0;
>>  }
>>  
>> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> -			  unsigned long *nr_mem_ranges)
>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			    unsigned long *nr_mem_ranges)
>>  {
>>  	unsigned int max_nr_ranges;
>>  	struct crash_mem *cmem;
>> @@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>  	return ret;
>>  }
>>  
>> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			  unsigned long *nr_mem_ranges)
>> +{
>> +	int ret;
>> +
>> +	lock_device_hotplug();
>> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
>> +	unlock_device_hotplug();
> 
> I think this patch conflicts with my changes and would also conflict
> with the implementation of arm64 crash hotplug.
> 
> https://lore.kernel.org/all/20260921090450.807575-15-ruanjinjie@huawei.com/
> 
Have these patches already been merged? My current work is based on the latest
linux-next. If they have already been merged into the maintainer's branch,
please let me know, I will update my tree and rebase/re-adapt my changes accordingly.


Also, regarding the changes in kernel/crash_core.c: it looks like we modified
the same spot, the change is not wrong, is that right?

> arm64 crash hotplug:
> https://lore.kernel.org/all/20260918100442.3841135-18-ruanjinjie@huawei.com/

In addition, if arm64 gains crash hotplug support, the code there would indeed
need to be modified (to avoid a deadlock). As of now, arm64 crash hotplug
support has not been merged yet either, has it? I just want to make sure I
haven't missed anything.

> 
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>>   * @mem: mem->range contains an array of ranges sorted in ascending order
> 

