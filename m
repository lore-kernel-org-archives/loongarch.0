Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417867;
	b=gXCqWoU4G7jB2pyPJz6ZgV6PezpCsM4AtUHzx1iFypPxNOPuik1URY+ZwGm1xV++NSJ6
	 j+0bDwXmz8GUWZsBsA9LBQAgI7p+rSX1OC0XhU6zX4pVP026cAh7BRNbbiJOrFWYtCVbH
	 pPxfnpVhD8UsRkvSfQdeeCkFinTOd+HjC2n7bKHx2w1/8cEI41JNof/8XEFP2Myeyn+3W
	 MzMufjzvNEUfIn8in5mi+rFNgma3UtQ7Tr/33JGP+5M3mN/B+QxKrj4+r0vjFd4VWL70I
	 l82M97h93Q8vHLRjwPvo8aDBVuHB4exPXfLHj3bzhKU7Ym8iRHyNTJrFltqjx2VJH9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417867;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=aUC6dwvADLWcIIFgIfO7ZojWD6NXidysfo4b9W39AAY=;
	b=XyLM7ryr6N6M4eYhB7dB55eFkRHraW3O1Q5H6XkrcRxKSLgG0rAMUFoX8bTzc5byIOLT
	 uiApSzVMgxq0H9S6ojUpVBQG+9X5AvwlP/gLGinLUQkx9WY4IhD0ZNNGv7w411QdNI/JB
	 Sru2dFHIW8Sra0VINFlcl6upO1qJKwQLbgvW2gh4mSwp159Xnt2+aNj7x1eO+Tp8CTFaE
	 3YqO9kcfKh+r8MjihiD72uK/ejGupOgvvmfHsxLpex0LgLasb+m0a4joPwrI9OTMKRe+N
	 UanncBMfNa1/hSCXzZxXmgXYAFBCEEayeijS7nyC0msJyQL2Bz4fxjhamDWUysolezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=guV9eUba;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401C606A31A
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 07:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7401C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=guV9eUba
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aUC6dwvADLWcIIFgIfO7ZojWD6NXidysfo4b9W39AAY=;
	b=guV9eUba+R5PDayFm8H06i5ZTYBsUhnHD4vQWNFcLcZtduyG4gmBeeAB+LML0q7m2R3X3WcAk
	hq/BWQ1RYPlOPu9P52463fbpuoyQt2HGQ1Yx/Ul7gbqJV/FVf0Mc5IJKgZSNsosmbXxuWk9wJBd
	tEXKc1taTNkcoLdTc3eqClM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jXxt80klzzRhRC;
	Mon, 23 Nov 2026 15:10:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 81BD440579;
	Mon, 23 Nov 2026 15:10:57 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 15:10:54 +0800
Message-ID: <584a0e7a-230e-4a95-9e09-a1d6499a6ea9@huawei.com>
Date: Mon, 23 Nov 2026 15:10:53 +0800
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
Subject: Re: [PATCH v8 00/11] kexec: Rework segment loading and fix CMA
 retries
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <leitao@debian.org>, <yeoreum.yun@arm.com>,
	<mpilaniy@redhat.com>, <robh@kernel.org>, <coiby.xu@gmail.com>,
	<Yeking@Red54.com>, <prudo@redhat.com>, <brads@mainlining.org>,
	<sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <qirui.001@bytedance.com>, <hui.wang@canonical.com>,
	<sohammetha01@gmail.com>, <guoren@kernel.org>, <gaohan@iscas.ac.cn>,
	<ionut.nechita@windriver.com>, <vishal.l.verma@intel.com>,
	<seanjc@google.com>, <ardb@kernel.org>, <richard.lyu@suse.com>,
	<arnd@arndb.de>, <tzimmermann@suse.de>, <rick.p.edgecombe@intel.com>,
	<kai.huang@intel.com>, <kas@kernel.org>, <piliu@redhat.com>,
	<thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/12 21:34, Jinjie Ruan 写道:
> ARM64, LoongArch, RISC-V, x86 and powerpc build the elf core header
> and place it together with the initrd and the DTB with almost identical
> code.
> 
> This series reworks that path into common helpers that the architectures
> reuse, and fixes the CMA page and elf core header leaks in the arm64
> and LoongArch placement retry loops.
> 
> The patch organization is as follows:
> 
> - Patch 1 moves the release of the elf core header into the generic
>   post-load cleanup, so that the architectures no longer free it
>   themselves.
> 
> - Patch 2 adds the common helpers
> 
> - Patches 3-7 convert arm64, LoongArch, RISC-V, X86 and Powerpc to
>   reuse the common helpers
> 
> - Patches 8-11 fix the CMA pages leaked by the retry loops and
>   the loop that makes no progress
> 
> Tested with kexec_file_load() on arm64, LoongArch, RISC-V, X86 and
> Powerpc under QEMU, including the CMA retry paths, loading a crash
> kernel and booting the second kernel, with the agent help.
> 
> This series is also available at:
> 	https://github.com/ruanjinjie-eng/linux/tree/kexec_rework_cma_bugfx_v9
> 
> Changes in v8:
> - Rework the common code as Mike suggested: the core provides building
>   blocks and the architectures uses them (Mike)
> - Build the elf core header once and only place it on the retries (Mike)
> - Keep the segment order and the arch placement policy unchanged (Mike)
> - Convert x86 and powerpc as well
> - Move the CMA fixes to the end of the series (Mike)

Hi Mike,

Does this refactoring now meet your expectations?

In my view, there is still an issue worth discussing: should we reserve
for the crash hotplug elf core header in the framework code
kexec_add_elf_core_header(), or only implement it in the x86
architecture code, and consider generalizing it after the ARM64
implementation is available?

Best regards,
Jinjie


> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
> 
> Previous Versions are as below:
> - v6: https://lore.kernel.org/all/20260921090450.807575-1-ruanjinjie@huawei.com/
> - v5: https://lore.kernel.org/all/20260918100442.3841135-1-ruanjinjie@huawei.com/
> - v4: https://lore.kernel.org/all/20260907125404.922123-1-ruanjinjie@huawei.com/
> - v3: https://lore.kernel.org/all/20260826092541.3905933-1-ruanjinjie@huawei.com/
> - v2: https://lore.kernel.org/all/20260729031235.2840255-1-ruanjinjie@huawei.com/
> - v1: https://lore.kernel.org/all/20260723131242.1537633-1-ruanjinjie@huawei.com/#t
> 
> Jinjie Ruan (11):
>   kexec: Free the elf core header in kimage_file_post_load_cleanup()
>   kexec: Add helpers to load the elf core header, initrd and FDT
>   arm64: kexec_file: Load the other segments with common helpers
>   LoongArch: kexec_file: Load the other segments with common helpers
>   riscv: kexec_file: Load the extra segments with common helpers
>   x86: kexec_file: Use the common segment helpers
>   powerpc: kexec_file: Use the common segment helpers
>   kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
>   kexec: Add kexec_rollback_segments() helper
>   arm64: kexec_file: Fix CMA segment placement retries
>   LoongArch: kexec_file: Fix CMA segment placement retries
> 
>  arch/arm64/include/asm/kexec.h             |   4 +-
>  arch/arm64/kernel/kexec_image.c            |  15 ++-
>  arch/arm64/kernel/machine_kexec_file.c     |  87 ++++----------
>  arch/loongarch/include/asm/kexec.h         |   3 +-
>  arch/loongarch/kernel/kexec_efi.c          |  15 ++-
>  arch/loongarch/kernel/kexec_elf.c          |   3 +-
>  arch/loongarch/kernel/machine_kexec_file.c |  80 +++++--------
>  arch/powerpc/kexec/elf_64.c                |   9 +-
>  arch/powerpc/kexec/file_load_64.c          |  18 +--
>  arch/riscv/include/asm/kexec.h             |   4 +-
>  arch/riscv/kernel/kexec_elf.c              |   3 +-
>  arch/riscv/kernel/kexec_image.c            |   3 +-
>  arch/riscv/kernel/machine_kexec_file.c     |  83 ++++----------
>  arch/x86/kernel/crash.c                    |  25 +----
>  arch/x86/kernel/kexec-bzimage64.c          |   8 +-
>  arch/x86/kernel/machine_kexec_64.c         |   4 -
>  include/linux/kexec.h                      |  14 +++
>  kernel/kexec_core.c                        |  25 +++--
>  kernel/kexec_file.c                        | 125 +++++++++++++++++++++
>  19 files changed, 254 insertions(+), 274 deletions(-)
> 

