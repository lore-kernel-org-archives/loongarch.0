Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91D3B19F;
	Thu, 12 Feb 2026 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907440; cv=none; b=jDTIgvv+MgKMB7qeKYVO3W/+5X8n8evBoo3K92PqULDqsMavzuMV64jpNw1ZQFQbhshQaDLC/WErBQEWSVcM5cvEC/puuUPRacYDz3Q4+HGz+bPubNJWRtBKvK3eiT0r80EUUwukRaGh9JpAJjdzbrcED8PnaAzw8iM/oJfrkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907440; c=relaxed/simple;
	bh=JgHytrfIoVHvSrB+ZHqvgP9qOCOR6LftqPuUXmXPewE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpjjVrZ83di0z3LmzgvxetON0rqBxSxRvDlnOEEjgzckscP8Gq7ud0kPAQtYQCBsMT3f3ZOBNyk2BhxkH0evLLUb3Fc8G7wCtqelXULSn/Gyarm7yleGv90Rj6OviWWpNlmt0b88Oyb4OD0SipLk3Lp97oT4VI1xKh8mdfF7akc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko6YX0yE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko6YX0yE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E60C4CEF7;
	Thu, 12 Feb 2026 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770907440;
	bh=JgHytrfIoVHvSrB+ZHqvgP9qOCOR6LftqPuUXmXPewE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ko6YX0yEFe4E0jrbp3XxgX4zcX+pt5kKGo3qsoUNXAjP6BmajfjaWMR7EZwObD3mv
	 RaQE4z+0+Y4Gvw1ciyp3sCoy9AWoV51k6SCkkX3HI2r8w9NGPYJAIaOZZnUH2/CyAt
	 FCBngxnZE5xc2/k3bOXFQAM1G/mpwsKy3pmOJK8ljYA+CUHAY9etU2AWnTdKmHe6kI
	 HZlhRcgRSjONrL5wCWjVGmpSaYyE8ivrPjr5pZvM5QJmgaMHdUy9DFX0Ke6voUeoPk
	 feWHia6y6PLrBYPJdAa4URtO8gt/Nen7sw+LzrielacYjoBKTAX8sR6v3rAfEPlgAn
	 olPDejjZ8fPrA==
Date: Thu, 12 Feb 2026 16:43:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
	kees@kernel.org, elver@google.com, paulmck@kernel.org,
	arnd@arndb.de, fvdl@google.com, thuth@redhat.com, ardb@kernel.org,
	leitao@debian.org, osandov@fb.com, cfsworks@gmail.com,
	sourabhjain@linux.ibm.com, ryan.roberts@arm.com,
	tangyouling@kylinos.cn, eajames@linux.ibm.com,
	hbathini@linux.ibm.com, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, bjorn@rivosinc.com,
	samuel.holland@sifive.com, kevin.brodsky@arm.com,
	junhui.liu@pigmoral.tech, vishal.moola@gmail.com, dwmw@amazon.co.uk,
	pbonzini@redhat.com, kai.huang@intel.com, ubizjak@gmail.com,
	coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com,
	brgerst@gmail.com, jbohac@suse.cz, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v5 1/4] powerpc/crash: sort crash memory ranges before
 preparing elfcorehdr
Message-ID: <aY3nGuredkMTCZIm@kernel.org>
References: <20260212101001.343158-1-ruanjinjie@huawei.com>
 <20260212101001.343158-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212101001.343158-2-ruanjinjie@huawei.com>

On Thu, Feb 12, 2026 at 06:09:58PM +0800, Jinjie Ruan wrote:
> From: Sourabh Jain <sourabhjain@linux.ibm.com>
> 
> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
> 
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.
> 
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec_ranges.h |  4 +-
>  arch/powerpc/kexec/crash.c              |  5 +-
>  arch/powerpc/kexec/ranges.c             | 87 +------------------------
>  3 files changed, 7 insertions(+), 89 deletions(-)

This looks like a nice improvement!
FWIW

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.
