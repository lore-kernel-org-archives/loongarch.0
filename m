Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930363A758A
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332870; cv=none; b=lSxfu2o6j0ZTIVtW/2OeI35hIzRaCfezG+6+GylpEDOheufeeqJ7HhYGyokTHWmi3iGpblUxBe51PfJjbAg6lp67KgeE9WrmJqeMZIpU8y65dSSzWcmsvELlDj/MaDytMizJ66/UbJaO/N+Q08q73hQKRVM4cTK3af+yCo/s0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332870; c=relaxed/simple;
	bh=kNeCzHN9m3XWkpbevz8LJ6DnLZ6XMrA3XVh7yVPFY4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MdHBbJjtwKo2u+2A9k5f8n1u+9kThYzdje53Mx0Go4xIIN2TrJKIEMLKg/0U/omYWuI5egEG2e86rXeXewi0NbVTXHBH10hYmZlJYBDCyrJdU2Ewkn3F1SCskXfEluAE4Hysh0H6wTxQaMuJ+xze9h5txxOI67v2wGnQR+CzcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=jpV0OS8P; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="jpV0OS8P"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qfaMojy4YCJI6x7hn3yLKKO+h1WPTwEnl4yVpQYK7UQ=;
	b=jpV0OS8P669YME8Q51wZE1sJYxg0mWoQB30y8MPrPMbvQ22ehAAXuIqteUT/3sIxyL1MmSP7h
	RbyG9KeFJGYgssJdZyGAsROKKri5Ypb8c7977na6j8YwpXxHoqMP1oXnnOWDxdKrCxthN2TlvfT
	lJ1A1OOOgmTlVrMeRWDFqEE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fg02m0NPjz1prkX;
	Tue, 24 Mar 2026 14:08:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B7AF22012A;
	Tue, 24 Mar 2026 14:14:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 14:14:20 +0800
Message-ID: <e51d5a5d-40d4-950b-274f-229e1d72e60d@huawei.com>
Date: Tue, 24 Mar 2026 14:14:18 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<peterz@infradead.org>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
 <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
 <595e793d-adc3-4acb-af18-f0a3cf2d5e73@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <595e793d-adc3-4acb-af18-f0a3cf2d5e73@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/3/24 12:29, Sourabh Jain wrote:
> 
> 
> On 24/03/26 09:32, Jinjie Ruan wrote:
>>
>> On 2026/3/24 0:55, Andrew Morton wrote:
>>> On Mon, 23 Mar 2026 15:27:40 +0800 Jinjie Ruan
>>> <ruanjinjie@huawei.com> wrote:
>>>
>>>> The crash memory allocation, and the exclude of crashk_res,
>>>> crashk_low_res
>>>> and crashk_cma memory are almost identical across different
>>>> architectures,
>>>> This patch set handle them in crash core in a general way, which
>>>> eliminate
>>>> a lot of duplication code.
>>>>
>>>> And add support for crashkernel CMA reservation for arm64 and riscv.
>>> Thanks.  AI review has completed and it asks questions:
>>>     https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie@huawei.com
>> I believe it identified 4 valid issues:
>>
>> - The already discovered crashk_low_res not excluded bug in the existing
>> RISC-V code.
>>
>> - An existing memory leak issue in the existing PowerPC code.
> 
> Yes and suggested approach to fix the issue looks good.
> Which is basically replace return with goto out.
> 
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 898742a5205c..1426d2099bad 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -440,7 +440,7 @@ static void update_crash_elfcorehdr(struct kimage
> *image, struct memory_notify *
>         ret = get_crash_memory_ranges(&cmem);
>         if (ret) {
>                 pr_err("Failed to get crash mem range\n");
> -               return;
> +               goto out;
>         }
> 
>         /*
> 
> Are you planning to handle this in this patch series? Or do you want me
> to send a separate fix patch?

Yes, will fix it in v10, thanks for the clarification.

Best regards,
Jinjie

> 
> 
>>
>> - The ordering issue of adding CMA ranges to "linux,usable-memory-range".
>>
>> - An existing concurrency issue. A Concurrent memory hotplug may occur
>> between reading memblock and attempting to fill cmem during kexec_load()
>> for almost all existing architectures，I'm not sure if this is a
>> practical issue in reality..

What are your thoughts on this concurrency issue?

>>
>>   Race Condition Scenario
>>
>>    Timeline:
>>    ---------------------------------------------------------------------
>>    T1: kexec_load() syscall starts
>>    T2: kexec_trylock() acquires kexec_lock
>>    T3: crash_prepare_headers() is called
>>    T4: arch_get_system_nr_ranges() queries memblock → finds 100 memory
>> ranges
>>    T5: cmem = alloc_cmem(100) allocates buffer for 100 ranges
>>    T6: [RACE WINDOW] Another process triggers memory hotplug
>>    T7: add_memory() → lock_device_hotplug() → memblock_add_node()
>>    T8: New memory region added to memblock
>>    T9: arch_crash_populate_cmem() iterates: now finds 102 ranges
>>    T10: cmem->ranges[100] → OUT OF BOUNDS WRITE!
>>    T11: cmem->ranges[101] → OUT OF BOUNDS WRITE!
>>    T12: Kernel crash or memory corruption
>>
>>    Why This Happens
>>
>>    1. Different locks used:
>>      - kexec_load() uses kexec_trylock (atomic_t)
>>      - Memory hotplug uses device_hotplug_lock (mutex)
>>    2. No synchronization between these two operations
>>    3. Time-of-check to time-of-use (TOCTOU) issue:
>>      - Step T4-T5: We query the number of ranges and allocate buffer
>>      - Step T6-T9: Memory hotplug adds new ranges between query and
>> population
>>
>>
>>
>> Any comments or suggestions on the following approach?
>>
>>
>> int crash_prepare_headers(...)
>>    {
>>        unsigned int max_nr_ranges;
>>        struct crash_mem *cmem;
>>        int ret;
>>
>>        lock_device_hotplug();
>>
>>        max_nr_ranges = arch_get_system_nr_ranges();
>>        // ...
>>        ret = arch_crash_populate_cmem(cmem);
>>        // ...
>>
>>        unlock_device_hotplug();
>>        return ret;
>>    }
>>
>>
> 
