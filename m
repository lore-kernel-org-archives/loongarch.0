Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC411E1DE4
	for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558657; cv=none; b=lHI02UBUP5humLin3qNVNnT0GjGX2QHjKqrNZUMjhj5S49u8NGt7x7d6Pnw3lHJCT8fWVZBWw60eBzPv1K1i2B231jY9T0l1oHuVa2SKKXazW/bir3HYuJ8mV3MPbbR2j5/SX0IxiW3fzboOdAMViUW94nWD9xxq1RcYFMoN4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558657; c=relaxed/simple;
	bh=8W1YS7kw1UYuPTog9vP2KQU1oV+SEgE+lxrN/xiMMxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rulj3ObHjY63oiHd8wHVL5oUznZw8tqjxMyn4QCfNLssQtJbhUTIrz1NZRnTieICgkg50Gaf2hRDTZxzEEFS2bEn48QU8T3A8YfuYe1RFgvB1t9+LYsSOyZiYdviyk8r9PPh8O2qr/7VV0sJuNzOukD4YqQmFiU7XWSsGO/Bscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4719D1516;
	Wed, 26 Feb 2025 00:31:10 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2A83F673;
	Wed, 26 Feb 2025 00:30:47 -0800 (PST)
Message-ID: <14fefa3a-9522-4995-8e51-662e80ae1747@arm.com>
Date: Wed, 26 Feb 2025 09:30:44 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] mm: pgtable: make generic tlb_remove_table() use
 struct ptdesc
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 riel@surriel.com, vishal.moola@gmail.com, david@redhat.com,
 jannh@google.com, hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5be8c3ab7bd68510bf0db4cf84010f4dfe372917.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> Now only arm will call tlb_remove_ptdesc()/tlb_remove_table() when
> CONFIG_MMU_GATHER_TABLE_FREE is disabled. In this case, the type of the
> table parameter is actually struct ptdesc * instead of struct page *.
>
> Since struct ptdesc still overlaps with struct page and has not been
> separated from it, forcing the table parameter to struct page * will not
> cause any problems at this time. But this is definitely incorrect and
> needs to be fixed. So just like the generic __tlb_remove_table(), let
> generic tlb_remove_table() use struct ptdesc by default when
> CONFIG_MMU_GATHER_TABLE_FREE is disabled.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
