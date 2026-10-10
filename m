Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254CB3E00A9;
	Sat, 10 Oct 2026 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662476; cv=none; b=OGTBYb43qKU5hVvUEKtY5MXrwXX9LzVrQPVeydSDHUfjJcTbWfHIkIILFU+X5O0O7YjYjmS1MT2KVNh732bFMcYH4qSxk73vb2aGaVv53o5r30O3atx5mId+1EytPQrbQkUbjmdeWuUwGog4EsCNKM37dI8C3GevX1dULqI8csE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662476; c=relaxed/simple;
	bh=0ej4w9K2k1nE5MBAzVddXwAyLDwy2dxb36CJ0bopUEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caXjXQ/aABZyl3+y13LrKFIcSvj2Eyl1fSSjZUgO5S3e7Y4HQEo5do68rQFO4SjpncSubBZEaHERYnCwHhle8ZeXkUHBP82mPPio8bUBz70vpRVSRxm4euavEKvIkOMvCihNZOY+tWpEV/DNVPqaQQxj1WxrNx71RBcyJR6of5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WRSxdsDg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WRSxdsDg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC41E1692;
	Sat, 10 Oct 2026 13:01:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0AC3F882;
	Sat, 10 Oct 2026 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791662472; bh=0ej4w9K2k1nE5MBAzVddXwAyLDwy2dxb36CJ0bopUEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRSxdsDg02jA7Wxmfp7hUM+7z5or2VN4zazCFutQjZjCNRVVo7Znbg22CVLNz7YAi
	 ObuzEMW4ie3Brz5P5fTbQVvsd7oFGit6h9P3YDLOgc08xfbI46WYb8fvEkIjCXqCBo
	 Fa+IHGI5x3Zu1VuORzdk3Muk8yB8P1D4NRA1la+w=
Date: Sat, 10 Oct 2026 21:00:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
	sshegde@linux.ibm.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, leitao@debian.org, yeoreum.yun@arm.com,
	sourabhjain@linux.ibm.com, robh@kernel.org, coxu@redhat.com,
	kees@kernel.org, tangyouling@kylinos.cn, liukexin@kylinos.cn,
	zhangtianyang@loongson.cn, guodongtai@kylinos.cn,
	maqianga@uniontech.com, chao.gao@intel.com, kai.huang@intel.com,
	vishal.l.verma@intel.com, seanjc@google.com, piliu@redhat.com,
	thuth@redhat.com, jbouron@amazon.com, me@linux.beauty,
	mclapinski@google.com, graf@amazon.com, bgwin@google.com,
	hbathini@linux.ibm.com, eric.devolder@oracle.com,
	takahiro.akashi@linaro.org, james.morse@arm.com,
	palmer@rivosinc.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	driver-core@lists.linux.dev, kexec@lists.infradead.org
Subject: Re: [PATCH v6 05/14] arm64: kexec_file: Fix elf_headers memory leak
 in retry loop
Message-ID: <asqZcwg99QbA7Sma@arm.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-6-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921090450.807575-6-ruanjinjie@huawei.com>

On Mon, Sep 21, 2026 at 05:04:41PM +0800, Jinjie Ruan wrote:
> If load_other_segments() fails after image->elf_headers is assigned,
> the memory lifecycle is safely managed by the global kimage object
> and will be freed in arch_kimage_file_post_load_cleanup().
> 
> However, during a retry loop in image_load(), a subsequent iteration
> will allocate a new buffer and overwrite image->elf_headers. This
> permanently leaks the stale memory from the previous iteration before
> the global cleanup can track it.
> 
> Fix this by explicitly freeing the stale `image->elf_headers` buffer
> before assigning the newly allocated headers.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 108aa503657e ("arm64: kexec_file: try more regions if loading segments fails")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
