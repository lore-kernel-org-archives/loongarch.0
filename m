Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B9649D5AB
	for <loongarch@lists.linux.dev>; Thu, 17 Sep 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668942; cv=none; b=h8RQcU3fH2zMB5Y6yqikHdx9V2pZU79ds7I2RsYxEGor8TWus3keSKnGvXE2fZGEpQkAGuWkYr2jTgDc+ezFxYjB5owTXa8d7giMtgatlMK44ewvMQhjZ/4gEXDnf44jGFtI1h+WtdwO6CAN4t/p6VCqj80ribDQW6NLbwdMcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668942; c=relaxed/simple;
	bh=H8Wh7N4cq/t88nKN8ZqZ4f+oRUbvezWnn3f++63qp34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7zskgHK7kXHiM4dDj8mOF6dAXX3NwzOKxHpUEetwWT49zpyoNwQ837htBAlG7DkTqgvXq02azISdS5bk1JgNFys0a+a534O1FnA5eSjYV8rSxAFentBidvLAy8MEZ67I/Uv4zpZxhYP8nat2lq1l3V9ekqbSWj6Z/ekN3S1EDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=roYFaSY2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="roYFaSY2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B37601F91;
	Thu, 17 Sep 2026 11:15:36 -0700 (PDT)
Received: from [10.57.7.135] (unknown [10.57.7.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C76C3F86F;
	Thu, 17 Sep 2026 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789668940; bh=H8Wh7N4cq/t88nKN8ZqZ4f+oRUbvezWnn3f++63qp34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=roYFaSY285gwN/8IzsFOtN0+e8Iltix2FpDfvQ3utTYL+K/fJKmz1KXzTmdsXwN+S
	 WAMAddn6lBMF4PqxGiGTEo0pOprPlbr/cZxNj8ql3o575Mymat7lIXSIibWHw+fpmU
	 bkqsEF4P/sS5BnYk4WQFSwVQavKpnE4kImkX3gsQ=
Message-ID: <258a124e-bdc5-4c25-b649-b4ed0a1415ac@arm.com>
Date: Thu, 17 Sep 2026 20:15:31 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] Revert "arch: introduce
 set_direct_map_valid_noflush()"
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
 <20260903-execmem-set-vm-perms-v0-2-v3-6-949b64a9f755@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-6-949b64a9f755@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2026 11:28, Mike Rapoport (Microsoft) wrote:
> Commit 0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
> added set_direct_map_valid_noflush() to allow updating the direct map
> for a physically contiguous range in execmem.
>
> As Brendan recently pointed out [1], this API is confusing because on
> arm64 it means that is sets VALID bit in ptes, while on other
> architectures it is an analog of set_direct_map_default_noflush().
>
> The only user of set_direct_map_valid_noflush() was execmem's ROX cache
> freeing path and it was switched to utilize VM_FLUSH_RESET_PERMS for
> resetting permissions of the direct map alias.
>
> With the last user gone and with set_direct_map_{invalid,default}_noflush()
> accepting number of pages as a parameter, set_direct_map_valid_noflush()
> become a copy of set_memory_valid() on arm64 and a duplicate of
> set_direct_map_{invalid,default}_noflush() on other architecture, it is
> safe to remove set_direct_map_valid_noflush().
>
> Also drop a stale comment in arm64::__kernel_map_pages() that Linus
> bothered to add when merging changes containing set_direct_map_valid_noflush()
> to his tree.
>
> This reverts commit 0c6378a71574daa6cd1534ad42a956e3262756c7.
>
> [1] https://lore.kernel.org/all/DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev
>
> Reviewed-by: Brendan Jackman <brendan.jackman@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

It's a great feeling to see the set_direct_map API get a little
streamlined :D

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
