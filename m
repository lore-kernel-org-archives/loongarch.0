Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEE23749E8
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134050; cv=none; b=fbqmgfY2YnmClWao1ZaEZnmQbdZ44Cv6HuMEkak32LQQSfNNc8842GxFKEthp5zXAIoD1j3wkKyp2sLnNDqEl4St6BGNVdJt/pUas9CFUzAwGcE5vA1oSkPPvH7aQCH9a/39pe+ETdwsd35GRDTZXeC/HVjU6HcTnVMKq+lZky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134050; c=relaxed/simple;
	bh=2LhZwei9uVYV+fWtaQ+UuqK3676UgkdxnXCOys3UUUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbTIZNVtlPT+WsE/21relAlgQc0CEfmy4K2Q6dDUQYfn/Wq5fEB7aMi311X3AtI2QGzNlHypL2AyraAEC8Ffm/47Q/uRxMtCBrwX5Ju129swPvj+0ybLR+XblKVDkSaGE5OwMbGs7NjpnGI1CoWHhJ7PEPV7kRJ7TA0frDtKP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UXE8XzkV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UXE8XzkV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 639A81576;
	Tue, 22 Sep 2026 20:27:24 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24DE53F632;
	Tue, 22 Sep 2026 20:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790134047; bh=2LhZwei9uVYV+fWtaQ+UuqK3676UgkdxnXCOys3UUUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UXE8XzkVvf3yIoiTHdAzHwgTw5QqdgILMiymmPuOEu4DA3OYvUXPgW6uQebZscGw6
	 w3wX7S5jWKD49txEUMuw6ny8fgbDt32gUaW2yySzymxAlLdnk2qLuam7IkiIyqpQpP
	 G/0Ai7X2QccdfHonMs1/BPLBqUejjFwNssIR2L5U=
Date: Wed, 23 Sep 2026 08:57:24 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Helge Deller <deller@gmx.de>, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arch/mm: Drop similar platform overrides for
 pxdp_get()
Message-ID: <qg52wppwfjfv6s7dxmeefuadraz2hxp3wp3nqs6nxf7pflrtrv@5embd4fiz2k6>
References: <20260919101343.1959572-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260919101343.1959572-1-anshuman.khandual@arm.com>

On Sat, Sep 19, 2026 at 03:43:38PM +0530, Anshuman Khandual wrote:
> There are many platforms with similar pxpd_get() overrides like the generic
> memory default helpers which use READ_ONCE() for reading page table entries
> These overrides could be dropped safely letting their platforms fallback on
> the defaults instead. Although it requires some code movement from platform
> headers to avoid build failures.
> 
> This series based on v7.2-rc3 after the following patch.

This has been based on wrong tag, will resend. Please ignore this series.

> 
> https://lore.kernel.org/linux-mm/20260918064928.793742-1-anshuman.khandual@arm.com/
> 
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: “James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-mm@kvack.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-s390@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (3):
>   s390/mm: Drop all pxdp_get()
>   loongarch/mm: Drop all pxdp_get()
>   parisc/mm: Drop all pxdp_get()
> 
>  arch/loongarch/include/asm/pgtable.h | 20 ++--------------
>  arch/loongarch/mm/init.c             | 19 +++++++++++++++
>  arch/parisc/include/asm/pgtable.h    | 20 +---------------
>  arch/parisc/mm/init.c                | 13 +++++++++++
>  arch/s390/include/asm/pgtable.h      | 35 ++++------------------------
>  5 files changed, 40 insertions(+), 67 deletions(-)
> 
> -- 
> 2.43.0
> 
