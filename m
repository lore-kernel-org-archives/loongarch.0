Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF311C3C18
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896526; cv=none; b=DXkd/e3vYGCsggk+cEqHDuH4C9SZW50W/LSIIPC6NIc8eaCjdddvOrsv+U6baTN8o5ZH0/1Bhx/6UXkx+dULLIBY0K4Ph3iWFvl5rBVBO31CxANADvqwK7oZ+nrBjZh5iurrWjhNH3G294/3lsshg2kpYdZ5iJ8SuWum/Yte668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896526; c=relaxed/simple;
	bh=xVM8ZrJ45RTV7GrP2aiuBqST95WVx505qjUq4Txc6Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfGw1HELMWTnehvSsLuehAcjb7KBbWLHssZ1NSCl6cQ+9gwMk5HjiwmCCt80a9jmTYlSsyBrBArjxy6UlCi2hzGaF1XecABHxdW5Yg3BwqRC4xAF23UgCqPCloai5Ma/ZlbBfxPgPN39Izg23T2X8zQLLwZX4ycoZH5Bva9XF44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C0AF1480;
	Fri,  3 Jan 2025 01:29:12 -0800 (PST)
Received: from [10.57.92.237] (unknown [10.57.92.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8B153F673;
	Fri,  3 Jan 2025 01:28:35 -0800 (PST)
Message-ID: <80cf6cae-11f6-4db2-816b-b1dcca3cee3e@arm.com>
Date: Fri, 3 Jan 2025 10:28:32 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Account page tables at all levels
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org,
 Joerg Roedel <jroedel@suse.de>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <a7398426-56d1-40b4-a1c9-40ae8c8a4b4b@intel.com>
 <765aec36-55a4-4161-bb30-4ff838bc2d98@arm.com>
 <989b55cf-1f9e-4b73-b3dd-d8b6a62be3f2@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <989b55cf-1f9e-4b73-b3dd-d8b6a62be3f2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2024 20:31, Dave Hansen wrote:
> On 12/20/24 02:58, Kevin Brodsky wrote:
>>> One super tiny nit is that the PAE pgd _can_ be allocated using
>>> __get_free_pages(). It was originally there for Xen, but I think it's
>>> being used for PTI only at this point and the comments are wrong-ish.
>>>
>>> I kinda think we should just get rid of the 32-bit kmem_cache entirely.
>> That would certainly simplify things on the x86 side! I'm not at all
>> familiar with that code though, would you be happy with providing a
>> patch? I could add it to this series if that's convenient.
> I hacked this together yesterday:
>
>> https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/log/?h=simplify-pae-20241220
> It definitely needs some more work. I'm particularly still puzzling
> about why SHARED_KERNEL_PMD is used both as a trigger for 32b vs.
> PAGE_SIZE PAE pgd allocations _and_ for the actual PMD sharing.
>
> Xen definitely needed the whole page behavior but I'm not sure why PTI did.
>
> Either way, that series should make the PAE PGDs a _bit_ less weird at
> the cost of an extra ~2 pages per process for folks who are running
> 32-bit PAE kernels with PTI disabled.
>
> But I think the diffstat is worth it:
>
>  5 files changed, 16 insertions(+), 96 deletions(-)

That does look like a nice simplification! After the first patch, with
my series, we could get rid of _pgd_alloc() and _pgd_free() in
arch/x86/mm/pgtable.c and just call __pgd_alloc() and __pgd_free() directly.

Considering that these changes are not trivial and may need more work,
should I let you post those patches as a separate series? If it gets
merged soon, I'll adapt my series, otherwise I can post a follow-up
patch later if needed.

- Kevin
