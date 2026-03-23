Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B669C38C434
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264653; cv=none; b=ii+m0OAp2uYtUi4LxfKbzCDHhlYWqjUQchSJLiptGnfhEAVnjRfC48UA+GvvwJ9hzcWgSpeXeDN5bunFdwQIi9skW7L2YdvPk73aHi0DCj8fgoBqclHUzKTQod8ccOoxEC84Ri1B25+CmetLWV2uwgYaua6bweQblsTjMwyp13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264653; c=relaxed/simple;
	bh=a+K21ycFsZx1aa5rX89PVqaXxVaYlFmDKUz60VkOv2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VMXOClO+91Yv5K1PsJROy2S+RL184Cge7SnlsyRykFWtYDHDBLduATsUkBYPgdohXH5+OMkA7wrzg7GqDzyqnslCD5MRZtn/SbSsuHpzdWnlAfQA1veHLzT4OHwslCaqDX+zSHdt9oeZJPlDSpG3h7KxlC/bu9dsVewCwIJRDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=WI3G5XBS; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="WI3G5XBS"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wSdOmMtQJa4WowpqlfcOJcehmFcXYtTS05KoePMKPVU=;
	b=WI3G5XBSvLw1Ei2KOl8bWUoPjcsVkaCWFhuxcWJmThK8RYco8rIJbvc4XJRxcYjdR3c6oop/z
	t3cQyEFjF4AU7xxJmO+zxXY1B8actvrXqxeVN6l+7rl7qve6RGVo3HX9lQ7j7A2FMHl37WUY9XJ
	2Tv/+h0JBqqA0gRXAB3ife0=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ffVpy6zGtz1cyP0;
	Mon, 23 Mar 2026 19:11:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A58F4056C;
	Mon, 23 Mar 2026 19:17:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 19:17:23 +0800
Message-ID: <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
Date: Mon, 23 Mar 2026 19:17:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <safinaskar@gmail.com>,
	<rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
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
 <20260323072745.2481719-5-ruanjinjie@huawei.com> <acETyW3FYaWCShUc@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <acETyW3FYaWCShUc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/3/23 18:20, Breno Leitao wrote:
> On Mon, Mar 23, 2026 at 03:27:44PM +0800, Jinjie Ruan wrote:
>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>> implement reserve_crashkernel_cma") added CMA support for kdump
>> crashkernel reservation.
>>
>> Crash kernel memory reservation wastes production resources if too
>> large, risks kdump failure if too small, and faces allocation difficulties
>> on fragmented systems due to contiguous block constraints. The new
>> CMA-based crashkernel reservation scheme splits the "large fixed
>> reservation" into a "small fixed region + large CMA dynamic region": the
>> CMA memory is available to userspace during normal operation to avoid
>> waste, and is reclaimed for kdump upon crash—saving memory while
>> improving reliability.
>>
>> So extend crashkernel CMA reservation support to arm64. The following
>> changes are made to enable CMA reservation:
>>
>> - Parse and obtain the CMA reservation size along with other crashkernel
>>   parameters.
>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
>> - Include the CMA-reserved ranges for kdump kernel to use.
>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>   prevent them from being exported through /proc/vmcore, which is already
>>   done in the crash core.
>>
>> Update kernel-parameters.txt to document CMA support for crashkernel on
>> arm64 architecture.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Acked-by: Baoquan He <bhe@redhat.com>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v7:
>> - Correct the inclusion of CMA-reserved ranges for kdump
>>   kernel in of/kexec.
>> v3:
>> - Add Acked-by.
>> v2:
>> - Free cmem in prepare_elf_headers()
>> - Add the mtivation.
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>  arch/arm64/kernel/machine_kexec_file.c          | 2 +-
>>  arch/arm64/mm/init.c                            | 5 +++--
>>  drivers/of/fdt.c                                | 9 +++++----
>>  drivers/of/kexec.c                              | 9 +++++++++
>>  5 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index cb850e5290c2..afb3112510f7 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1121,7 +1121,7 @@ Kernel parameters
>>  			It will be ignored when crashkernel=X,high is not used
>>  			or memory reserved is below 4G.
>>  	crashkernel=size[KMG],cma
>> -			[KNL, X86, ppc] Reserve additional crash kernel memory from
>> +			[KNL, X86, ARM64, PPC] Reserve additional crash kernel memory from
>>  			CMA. This reservation is usable by the first system's
>>  			userspace memory and kernel movable allocations (memory
>>  			balloon, zswap). Pages allocated from this memory range
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index c338506a580b..cc577d77df00 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -42,7 +42,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>>  #ifdef CONFIG_CRASH_DUMP
>>  unsigned int arch_get_system_nr_ranges(void)
>>  {
>> -	unsigned int nr_ranges = 2; /* for exclusion of crashkernel region */
>> +	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
> 
> You update arch_get_system_nr_ranges() to account for CMA ranges, but
> prepare_elf_headers() in the same file (line 51) still has the
> hardcoded:
> 
>         nr_ranges = 2; /* for exclusion of crashkernel region */

I don't see any logic related to prepare_elf_headers() or hardcoded
nr_ranges = 2 in the arm64 implementation.

Did I miss something here?

> 
> and does not exclude CMA ranges from cmem. If the generic crash core
> handles CMA exclusion from vmcore, then shouldn't
> arch_get_system_nr_ranges() also not need this change?
> 
