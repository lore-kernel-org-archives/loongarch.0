Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B7351C30
	for <loongarch@lists.linux.dev>; Thu, 28 May 2026 07:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954514; cv=none; b=Dlo/2oOZdfKqQbJcFy2+okR7h50YPffQm1l5XFWjK4tZXryTRxDYhjzhch8IHMwdjlYBDGMxOlaWQqPYaUgrQfVTzXy7RkVjY/AZxWSfnuTzTJJy1S1XnALERCBZ3SeM9qyRcbZLMKLnZYOMIQ/nw8pA0f5ruDuuFZFlkzLr5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954514; c=relaxed/simple;
	bh=nMN8OwxhDdLf9YlQ22VoLYVfKGZLM/ci0aISZWDApD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HU0LrZZpflwYlUoOO67Y6FVaQ4F0GRbOlHviJMVmjF1jgGBH0b+NIunm6hEcRaUZuIuom75HYjAR4LHcwcEFF25Xhe35+wAam2nS8xkfPRmFSLn3QSpg5qRi3T40OaBZLhah3V642Ym1Wnb6+92LXWlADcNwzPZVhHmvJW5Skq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1P43YydG; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1P43YydG"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dpnGK6j+kvjnma6YHvrd5wwrLUxTfDRQvHYx5YGFkW8=;
	b=1P43YydGlenQu7gtjAUK3WkAvoYefi1zaef3ts/PCFV8z8jXMftJzmpGqo5LjAapMRdRXr6/a
	N1fDE/FHFxcXRLBxskpsButEzn/mkgSXUmZGYLvw2ukswIM6zPl+B8AGyjYLYkBV/NlrO3ruwSZ
	nO8/hOI1gcFH8PiH3P2wFRQ=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gQz1K6V9Wz1cyQK;
	Thu, 28 May 2026 15:40:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 95504402AB;
	Thu, 28 May 2026 15:48:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 May 2026 15:48:16 +0800
Message-ID: <08ab6756-091c-4bee-9d49-cb84d0be027c@huawei.com>
Date: Thu, 28 May 2026 15:48:15 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Huacai Chen <chenhuacai@kernel.org>, Mike Rapoport <rppt@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <ardb@kernel.org>,
	<masahiroy@kernel.org>, <mark.rutland@arm.com>, <maz@kernel.org>,
	<james.morse@arm.com>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <kas@kernel.org>,
	<debug@rivosinc.com>, <namcao@linutronix.de>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <seanjc@google.com>, <guoren@kernel.org>,
	<chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
 <ahQ0WRiMsB011tym@kernel.org>
 <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 5/25/2026 9:17 PM, Huacai Chen wrote:
> On Mon, May 25, 2026 at 7:37 PM Mike Rapoport <rppt@kernel.org> wrote:
>>
>> Hi Huacai,
>>
>> On Mon, May 25, 2026 at 06:14:52PM +0800, Huacai Chen wrote:
>>> On Mon, May 25, 2026 at 4:50 PM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>>>
>>>> Jinjie Ruan (16):
>>>>   riscv: kexec_file: Fix crashk_low_res not exclude bug
>>>>   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
>>>>   arm64: kexec: Fix image->elf_headers memory leak during retry loop
>>>>   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
>>>>   arm64: kexec_file: Fix potential buffer overflow in
>>>>     prepare_elf_headers()
>>>>   riscv: kexec_file: Fix potential buffer overflow in
>>>>     prepare_elf_headers()
>>>>   LoongArch: kexec: Fix potential buffer overflow in
>>>>     prepare_elf_headers()
>>>>   crash: Add crash_prepare_headers() to exclude crash kernel memory
>>>>   arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
>>>>   x86/kexec: Use crash_prepare_headers() helper to simplify code
>>>>   riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
>>>>   LoongArch: kexec: Use crash_prepare_headers() helper to simplify code
>>>>   crash: Use crash_exclude_core_ranges() on powerpc
>>>>   arm64: kexec: Add support for crashkernel CMA reservation
>>>>   riscv: kexec: Add support for crashkernel CMA reservation
>>>>   arm64/crash: Add crash hotplug support
>>> I have some bikesheedings about the subjects. Can we unify the prefix formats?
>>> x86/kexec, arm64: kexec_file, riscv: kexec_file, LoongArch: kexec .....
>>
>> It might look weird in the series, but powerpc and x86 use '/' and arm64 and
>> riscv use ':' so in the logs in arch/ this would be actually fine.
> OK, but at least we can unify kexec and kexec_file.

That looks fine.

Jinjie

> 
> Huacai
> 
>>
>> With the only exception of arm64/crash that should have been arm64: crash:
>>
>>> Huacai
>>
>> --
>> Sincerely yours,
>> Mike.
> 

