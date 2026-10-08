Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388C1B4F0A;
	Thu,  8 Oct 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441766; cv=none; b=HuNzVj+XrFZGvUqd/OXsc38MjVT+VQ+smjEtU2gjG7uI9J1mbK27Z3bsiBsmfJuWxwcjlpaZbZ6+6J/q6Jlhfo0b4OK0Faf8RAAtJI2v/BDJHLSwHRuCddlKdLodnIn94xay4IBFqx31KObOczAewL6ges856GzLaneivhxPbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441766; c=relaxed/simple;
	bh=gMtBmjb8PEyCjTU9lBWISEAPQcRPvGaHz8QkfLqMP/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so27Mhxf7/DW3oShwOT9jXYiIcEbTFF/8rnqDzZOnYwjv+4W7CdgqzGgGlfhziR+xj+9HFjhIN2YpNJ6jRg7ZkCSQ/F6SG5h/VHQeYIitSw00mZ7rxbAh6KmfwlUSd5m5BPW90ccWB/daLX+HbGcC3mmiv5bY/4Hii64DBaXfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzwrJChR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzwrJChR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9461F000FF;
	Thu,  8 Oct 2026 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791441765;
	bh=QYjlbETRxQW9RMjfplUAnmTLI8vDWVyFt6dBT1ysNAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LzwrJChRSmVjEsRakCz7KZMyALTXRiMMTQqt+Pq1DfhvTRhANdPa2qsjY85CoeKmU
	 +smyn7Lotjz8Z+6My1XtXdRcAWv0Bk3+so9601+yHD0hXOPoxrMliq4uNlyMYvPyEN
	 /KxKGNEGsRLbC5gh5Fpx/irufkYMSkObZy2nAEfpl7+01CgTBFC4KUpi+Rt44aL8Zf
	 NTIbo4/T2UBb6sZftaMcHpGWW78wNUfUZX3n+aegjkdkvaCrfhtnmdLmCzyRFXWi5O
	 KzhbRY6JsNtjGiT0SU3GKlmfmu9GhVSnGRLyWq6PEohhumSDv1uECF+lTxE7sLA503
	 DyPwUh9lm6nsw==
Date: Thu, 8 Oct 2026 08:42:25 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, akpm@linux-foundation.org, baoquan.he@linux.dev,
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
Subject: Re: [PATCH v6 00/14] crash: Fix several bugs
Message-ID: <asc7UdlRsy7502j8@kernel.org>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <f4ba3a6b-537d-4328-b0c1-c0e5aa61924f@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4ba3a6b-537d-4328-b0c1-c0e5aa61924f@huawei.com>

Hi Jinjie,

On Thu, Oct 08, 2026 at 09:57:30AM +0800, Jinjie Ruan wrote:
> 
> 在 2026/9/21 17:04, Jinjie Ruan 写道:
> > As Baoquan and Catalin suggested, this patch set fixes
> > several pre-existing code issues found by Sashiko AI [1][2][3].
> > 
> > The major improvements and fixes included in this series are:
> > - Fix several memory leaks for arm64, and similar issues on LoongArch.
> > - Fix out-of-bounds write on 32-bit Highmem for x86.
> > - Fix TOCTOU race in crash memory range collection.
> 
> Hi all,
> 
> Gentle ping.
> 
> Could anyone take a look or let me know if there's anything
> else needed? I can rebase/resend if required.

Sorry for the delay, I was travelling for the past few weeks.
I'm planning to review this next week. 

And we do need acks from arch maintainers for most of the patches in this
series.

> > Jinjie Ruan (14):
> >   kexec: Fix CMA segment address translation with non-zero text_offset
> >   kexec: Record allocated CMA pages to fix release size mismatch
> >   kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
> >   arm64: kexec_file: Fix CMA page leaks in segment placement retry loops
> >   arm64: kexec_file: Fix elf_headers memory leak in retry loop
> >   LoongArch: kexec_file: Fix CMA page leaks in segment placement retry
> >     loops
> >   LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
> >   LoongArch: kexec_file: Fix a modified_cmdline leak
> >   x86/crash: Fix massive out-of-bounds write on 32-bit Highmem
> >   crash: Extract crash_get_memory_ranges() helper
> >   crash: Factor out crash_find_elfcorehdr() helper
> >   crash: Normalize the kexec_load elfcorehdr at load time
> >   driver core: Add device_hotplug_lock_assert_held() helper
> >   crash: Fix TOCTOU race in crash memory range collection

-- 
Sincerely yours,
Mike.
