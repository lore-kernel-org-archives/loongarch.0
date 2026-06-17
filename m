Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7A25B663;
	Wed, 17 Jun 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781722110; cv=none; b=JpIwoZy1moMTaEOdpmJS8MI9LyHvPq3VHW3bWtbp9IEflXuK5nF8ZZvHdZ05Fm2J2xG4mr/UGAo0PbPHTvmyWXm1Bdfn6bZZ2pxbCFWyqR27VuNBWZ2mUxBi9hiPn6DuxN3T87XqDEg6VdCh4h/7+ZbomzDK5FoMM93XViFHrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781722110; c=relaxed/simple;
	bh=mLFLeNpmjzgehFww9fNDVoyDeR9A/LMo8QS8CQ7CBIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mar7I9LqH4uMyoVA77b+8X6Q4K1yi4/EKhDZf+EDBYQcK29qv5K699H7wd+WRER+ldXLkca/5JKAxngkt2lDoReBFJd1q6FEI/r/QP5lN7Ss7HbNZLN3Xlbzc/6tJOObub31SLUb/CZiTTUnC6P33LIEf0hig9JvBmdpqmYDiRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0jjWACc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0jjWACc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB851F000E9;
	Wed, 17 Jun 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781722108;
	bh=wAJ/16SDwjLEOofHEjGBdhyMJ22bR01mfpkTmi9LqFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S0jjWACcAyI73k4vozNk2hdrYq1Z/OE/QQr/fRC/3Fl/wMR6SalSveexvcnvhtP8P
	 sq0k5gKrOkUnhySqDsFacXi4LLQFsE4ZV+6S6Ub2Ztim/SxxqlIirTQTZyDMRypJg5
	 kTkhhdh10kVYN7b1AVsMojdJHHdWirds7fJByCy/bVzEjtn4hCnNqlP4c2Q76E07+J
	 eG9/Y/c55qkexQaoCzKYrj0bGXa4hlplXuQ+cWnkw9qoLKXnMxH0IxuDBclIZDg6JE
	 0jZ9y0rnn+J0b0RDlvVliyoQmsfZfKdlnUO5gBx+frcYJ50r+myYpGn0tA3W9QyChl
	 toG4cYtw/dfLQ==
Date: Wed, 17 Jun 2026 21:48:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
	leitao@debian.org, coxu@redhat.com, Liam.Howlett@oracle.com,
	ryan.roberts@arm.com, osandov@fb.com, jbohac@suse.cz,
	cfsworks@gmail.com, tangyouling@kylinos.cn,
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com,
	adityag@linux.ibm.com, liaoyuanhong@vivo.com, seanjc@google.com,
	fuqiang.wang@easystack.cn, ardb@kernel.org, chenjiahao16@huawei.com,
	guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <ajLr53EK6mJbng-7@kernel.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-1-ruanjinjie@huawei.com>

Hi Jinjie,

On Mon, Jun 08, 2026 at 03:34:49PM +0800, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> This patch set is rebased on v7.1-rc1.

Please rebase this set on v7.2-rc1 once that's out.

I'm going to queue it in the liveupdate tree then to expose to the wider
testing.

Meanwhile it would be great to chase riscv and x86 maintainers for acks :)

-- 
Sincerely yours,
Mike.
