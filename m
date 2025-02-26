Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3DD258CDF
	for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558771; cv=none; b=J5fQfLJhtX0FCVW9xRmsrp8+IaDGZbDgSlsBMUUioS29ixCxMztmPRxX8iOqEC7ia70MulluExYwYRSoXLobBgk8cmL1JQs7/HTyNBy7YgOVEA4cfbAUXp1lgjXqLnir3Qu9xOoCDxikYTmYX9X37OoqheRPejkMZpRApQ4kQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558771; c=relaxed/simple;
	bh=7pU1bTs6zExJNZzR8vWaDHfqRCQs2gbgxqw5feS2tCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMfpNsI6h1Y5KCEb8ifevDWByhcXQlI2es/bQ0Zp//jA4Vev2NAEwKXzk34QcQIapgtyOh1DXFJsXVU4bfgvpRT6MPgK+cx1LkJEyosNGbfafdfzPFbn4iZduwZ8NfCfWNCaufGn/u0BDITwkTqTvHdJm3e/HAffAciTlnFCc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D78141516;
	Wed, 26 Feb 2025 00:33:05 -0800 (PST)
Received: from [10.57.78.248] (unknown [10.57.78.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E3B3F673;
	Wed, 26 Feb 2025 00:32:42 -0800 (PST)
Message-ID: <528335f4-0648-4d49-992b-10c4d1949d0c@arm.com>
Date: Wed, 26 Feb 2025 09:32:40 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm: pgtable: remove tlb_remove_page_ptdesc()
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
 <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <3df04c8494339073b71be4acb2d92e108ecd1b60.1740454179.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 04:45, Qi Zheng wrote:
> The tlb_remove_ptdesc()/tlb_remove_table() is specially designed for page
> table pages, and now all architectures have been converted to use it to
> remove page table pages. So let's remove tlb_remove_page_ptdesc(), it
> currently has no users and should not be used for page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
