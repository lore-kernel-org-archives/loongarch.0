Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B2D3C0637
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158960; cv=none; b=HDvXCwhJ8UQot4E73F+qxAkqYOCTdtQV61uzRUTqL99DVtcg2Cm5BOrxKJS1OSJQWVsWEEWVxlgZZ6WNmv2gSLyQxDHxK7KbTMGDXBU6GdLTi//jJv2qjyqK5GbOXBlvRchLSD0CtB1a0NfiCqyIACNktIjc2OmR1Yw7gGRhZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158960; c=relaxed/simple;
	bh=UzZgy0NWc63K+ko4Xr6TdOnwA9EjAL5aleqBNdt6jY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCpqVoxxwiPeGPuSjWQ5XF1QqNwR1HtM8t1ReswomFO1aTcJDXup0zmnR8S8uSQlHhUP7mi5fSv7Js4VFCWUf5ath88uT7EyIUBsFSmybIUyOD1RSBqWBe35dl4O7VAg9MWV1xEw9ybj7nLtg4Toh82HiYk15x+OfjMrCwjPYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U7FcIb97; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="U7FcIb97"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B591414BF;
	Sun, 30 Aug 2026 23:49:14 -0700 (PDT)
Received: from [10.164.18.31] (J09HK2D2RT.blr.arm.com [10.164.18.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D75643F8C6;
	Sun, 30 Aug 2026 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788158958; bh=UzZgy0NWc63K+ko4Xr6TdOnwA9EjAL5aleqBNdt6jY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U7FcIb97JDEewur9Kf4radnvfeDHm6NiB7P5FNYX6eqEzgaSbcLTTz2427bXHEGdQ
	 uo4OFurjcGsPFnWvC+QS8s3MrHKwugc62Aj4Qy9UerHzl+ldPYjUgyGMq+omakELHp
	 zDbAViiLJS8zWjabH0UPjbR/p9ivvj9kKzLGGkiE=
Message-ID: <8ad05b11-5cc3-4682-b921-a0c7820b1f97@arm.com>
Date: Mon, 31 Aug 2026 12:19:08 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm: Drop pxd_ERROR()
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-mm@kvack.org
Cc: samuel.holland@sifive.com, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831054331.625505-1-anshuman.khandual@arm.com>
 <d766413f91cd778912f6af372d3d5429bac7765f.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d766413f91cd778912f6af372d3d5429bac7765f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31/08/26 11:38 AM, John Paul Adrian Glaubitz wrote:
> Hi Anshuman,
> 
> On Mon, 2026-08-31 at 11:13 +0530, Anshuman Khandual wrote:
>> pxd_ERROR() macros have been provided by all platforms, which are very much
>> identical and can be dropped off completely if these pgtable printing could
>> be moved to callers in generic MM aka all pxd_clear_bad().
> 
> If pxd_ERROR() macros are really all identical, why not provide a common definiton
> of that macro? I'm always a bit concerned about such changes as there is always
> a risk to oversee arch-specific peculiarities.

We don't those platform macros any more after converting generic MM into using ptval_bytes_to_hex_str()
which now handles different pgtable entry types.
> 
> Adrian
> 

