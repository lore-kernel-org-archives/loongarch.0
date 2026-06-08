Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5639D6FD
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905968; cv=none; b=cJ/+9pycQZYA16SFEzNnFakSrYxYIoaouPaF4cZfL+VmB+l61G5KZZFCS0HQfHH9y97Y5WsUUA+PzimM4tmAo6Wr+NLP26w4/wN43czin9zK95eMepEyaQsQHZeycspatiTu6xn8+zMVS3pHTvcUSXyDX3YL9BXzuLCzPkLDYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905968; c=relaxed/simple;
	bh=6PToavIyNhE+y/44j2T3NXffLZJqLNWCsQCag1hvqhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kUwhhJai1CYLDbE0QBed8aukCfWF0/poa+whwH7HSBIuyywZT4yOiEP1Q4NS6dMyUc9AdN0Gf798PI4JagvneDvfaSVw1nCCjYXljKzJ2zq1b9pdBR9cF8aM5bYAS/sp4VlN9OBLu896m+TnMsXPJ+ss5e8beWuvjTzvD5LCIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=joffotyX; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="joffotyX"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aATu7tVImBgCqv4P2EM9m+x6dmXEraQ/Wp+e4Xtstw4=;
	b=joffotyX/LhOXzhiBQJ687sy38LBkFUJN+eZBQ6HwEnnv/WXYE9RFRQJPrwqs8ryCNuwygPha
	aAN8S1aw1FDh7M8xsSR8XCsX1aJg2rLh13a7TIeKPo7PJIDFzY3c2nVzw9l2WmLjko13Jw1dYzD
	ObI9uC8v6xFF6F/dj6RUeS4=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gYktX2hLJznTXY;
	Mon,  8 Jun 2026 15:58:12 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A16F40571;
	Mon,  8 Jun 2026 16:06:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Jun 2026 16:05:59 +0800
Message-ID: <45fa93e6-dbeb-4844-bb19-f36fe642f362@huawei.com>
Date: Mon, 8 Jun 2026 16:05:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 01/10] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<leitao@debian.org>, <coxu@redhat.com>, <Liam.Howlett@oracle.com>,
	<ryan.roberts@arm.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>,
	<seanjc@google.com>, <fuqiang.wang@easystack.cn>, <ardb@kernel.org>,
	<chenjiahao16@huawei.com>, <guoren@kernel.org>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608073459.3119290-2-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260608073459.3119290-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/8/2026 3:34 PM, Jinjie Ruan wrote:
> As done in commit 944a45abfabc ("arm64: kdump: Reimplement crashkernel=X")
> and commit 4831be702b95 ("arm64/kexec: Fix missing extra range for
> crashkres_low.") for arm64, while implementing crashkernel=X,[high,low],
> riscv should have excluded the "crashk_low_res" reserved ranges from
> the crash kernel memory to prevent them from being exported through
> /proc/vmcore, and the exclusion would need an extra crash_mem range.
> 
> Just simply tested on qemu with crashkernel=4G with kexec in [1] mentioned
> in [2]. And the second kernel can be started normally.
> 
> 	# dmesg | grep crash
> 	[    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
> 	[    0.000000] crashkernel reserved: 0x000000017fe00000 - 0x000000027fe00000 (4096 MB)
> 
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> [1]: https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2
> [2]: https://lore.kernel.org/all/20230726175000.2536220-1-chenjiahao16@huawei.com/
> Fixes: 5882e5acf18d ("riscv: kdump: Implement crashkernel=X,[high,low]")
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>


The below AI reported TOCTOU bug is an existing artifact and completely
unrelated to this fix here. Therefore, we will skip fixing it in this
series to avoid unnecessary noise.

Link:
https://lore.kernel.org/all/20260608074809.EE4201F00893@smtp.kernel.org/

> ---
>  arch/riscv/kernel/machine_kexec_file.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index 54e2d9552e93..3f7766057cac 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -61,7 +61,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  	unsigned int nr_ranges;
>  	int ret;
>  
> -	nr_ranges = 1; /* For exclusion of crashkernel region */
> +	nr_ranges = 2; /* For exclusion of crashkernel region */
>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>  
>  	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> @@ -76,8 +76,16 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  
>  	/* Exclude crashkernel region */
>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (!ret)
> -		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> +	if (ret)
> +		goto out;
> +
> +	if (crashk_low_res.end) {
> +		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>  
>  out:
>  	kfree(cmem);

