Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705A4183098
	for <loongarch@lists.linux.dev>; Thu,  2 Jan 2025 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837219; cv=none; b=bffxkCGvKSmZ5JqPlKnpFO/3OTVa606Oi6Y2vnGLkIj5ay7Ml9mHgw/vFDNV1cEgwCpg3UCBl84T/qGEriJXi0hezjHgy4t3S0c+d9mXGRMRWFzg16iqCiwy/dmpFK29PBrGQsQu8M7a11ASENscW7XkPtFacaHK8SLZFR0d8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837219; c=relaxed/simple;
	bh=kKPcW5SP3t49iESF+fPdcZdBskM2E5K8YtDFi72drHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAtmCGdYNT6K2q7PhyE7j3kZ3dHlNOHDj1Oe1FI30/kVtVPp8fXxtx1sUfa1AGZh0E9aPbkyZ+WIBLDJhlg6z+xbtZXjnO1WzKzyPonCQUkECx0xB5knBEkSZ3SfXJKjDT3PX41wqeLULP/OCPRwPgXpnsjCXmJDGyRx2rUGhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B9911FB;
	Thu,  2 Jan 2025 09:00:44 -0800 (PST)
Received: from [10.57.91.208] (unknown [10.57.91.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91B853F673;
	Thu,  2 Jan 2025 09:00:07 -0800 (PST)
Message-ID: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Date: Thu, 2 Jan 2025 18:00:05 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 10:07, Qi Zheng wrote:
> Qi Zheng (13):
>   Revert "mm: pgtable: make ptlock be freed by RCU"
>   mm: pgtable: add statistics for P4D level page table
>   arm64: pgtable: use mmu gather to free p4d level page table
>   s390: pgtable: add statistics for PUD and P4D level page table
>   mm: pgtable: introduce pagetable_dtor()
>   arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   s390: pgtable: also move pagetable_dtor() of PxD to
>     __tlb_remove_table()
>   mm: pgtable: introduce generic __tlb_remove_table()
>   mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>   mm: pgtable: introduce generic pagetable_dtor_free()

Aside from the nit on patch 4 and the request for clarification on patch
10, this is looking good to me, so for the whole series (aside from my
own patches of course):

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

And happy new year!

Cheers,
- Kevin
