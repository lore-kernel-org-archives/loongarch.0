Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483853;
	b=VnhAowdkcDYXL/RRRMVYXOOD1GcRIkbZQpWXJmDKGk9zXYYRE1emasWaZhLe0XnezsDN
	 /d7ThnIZ77+4OcamaeYSf4/x7LZDQp7szomYq/F2vLrC2+/Mx2U/sYeulV5AVaH/R5l9p
	 Ar+xn6ylXgV9iUmrJGVK26ojBIfZ/VJe2gfgCXdRefP7yFdZACGfprwUuQkrIP1eFLM2P
	 EqGtcJNNODbARibuHJ27EBPd6Ao1xs4H3rzQ7+pd9X51Qcg4B1d8T5yOW7csVjXAZ1p+x
	 rRRcTOMxh0fl2/To8ism57ANPlPQ9fEACDp6MOioWYbU/u/fVjXmdhNfAc0qsImxIVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483853;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=KZ1lrmFftcZp227HDnBABEgI98zobYONU8pPNNvhy9c=;
	b=uFIXsVYsxTddNwP3eikkCxIwBd+S1eEf/R47+nrbsapRpKFS2srDdn8+YY2okFA5Z73n
	 pwIhWy2AEkDoJxUadwlLpsgsN5fQaJAVbwzk09noBKilYhN8MT0BCXE3kAhRDl3L2k23X
	 CQ547O/IIPwRijJGuN2lN1+ocavxEiR4wbTtxUT0CCNTqRUm9Ysu2ItinsR2X6/KZ2RRR
	 ScMMR3AmsASxi2cycE/pa/T6cacV3OVFJ6+tv0D24r/xDLfnZIo8A3C6hXRWl2+8QPr+r
	 mWAhj4JFoByofA+F4IowEK4IhrVG/TKcQXJJKxdjDgdcxIE/lX7tTbRfONO2yL3wHEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Si5aKroF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33646606A31C;
	Tue, 20 Oct 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Si5aKroF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843E51F000C5;
	Tue, 20 Oct 2026 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483852;
	bh=KZ1lrmFftcZp227HDnBABEgI98zobYONU8pPNNvhy9c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Si5aKroFBRQWvoPfQiWUtXY5pV8QpgRTZoMyRO15GNPz4DBKDDZ4+iSIyNHYtvZqz
	 G8lOTVxx6NmBdsjO1UBSP1zEZT4qLneCQe7uGvJPIQWns6h93fPilB2DLZGNa+FI1X
	 oNs2kA2m181Alm8R8g1+o+T40SoWbc2YMPMz1bo6wE5Vo2J4fzJ+Of7PHBfk2YhNhd
	 LNw3L2V3Q9kl/VRl12GSWRwMxpeyB7LrxcW/Qgu01ReVPUn0VH6x9EK6nNiGmKVqO+
	 uomF8qMGugM60D+AO/F2HDVDsDC4mXpuL2c4vvdFyya6eaFTHDwOvRcep1YD0ejLSn
	 ILyvkm6wO3wvA==
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 09/14] x86/crash: Fix massive out-of-bounds write on
 32-bit Highmem
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
 ritesh.list@gmail.com, sshegde@linux.ibm.com, tglx@kernel.org, 
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
 leitao@debian.org, yeoreum.yun@arm.com, sourabhjain@linux.ibm.com, 
 robh@kernel.org, coxu@redhat.com, kees@kernel.org, tangyouling@kylinos.cn, 
 liukexin@kylinos.cn, zhangtianyang@loongson.cn, guodongtai@kylinos.cn, 
 maqianga@uniontech.com, chao.gao@intel.com, kai.huang@intel.com, 
 vishal.l.verma@intel.com, seanjc@google.com, piliu@redhat.com, 
 thuth@redhat.com, jbouron@amazon.com, me@linux.beauty, 
 mclapinski@google.com, graf@amazon.com, bgwin@google.com, 
 hbathini@linux.ibm.com, eric.devolder@oracle.com, 
 takahiro.akashi@linaro.org, james.morse@arm.com, palmer@rivosinc.com, 
 x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 kexec@lists.infradead.org
In-Reply-To: <20260921090450.807575-10-ruanjinjie@huawei.com>
References: <20260921090450.807575-1-ruanjinjie@huawei.com>
 <20260921090450.807575-10-ruanjinjie@huawei.com>
Date: Tue, 20 Oct 2026 11:09:39 +0300
Message-Id: <179248377976.302547.17579416672238014424.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Jinjie,

> On 32-bit x86 systems with HIGHMEM, kmap_local_page() only maps a single
> 4KB page. However, the elfcorehdr segment can span several pages (up to
> hundreds of kilobytes).
> 
> The original code blindly copies 'elfsz' bytes at once via
> memcpy_flushcache(), overwriting adjacent fixmap entries or critical
> virtual addresses.
> 
> Fix this by copying the new elfcorehdr page by page.

This is independed of other fixes and can be sent as a separate x86b fix.

> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Baoquan He <baoquan.he@linux.dev>
> Cc: Chao Gao <chao.gao@intel.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Eric DeVolder <eric.devolder@oracle.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: stable@vger.kernel.org
> Fixes: ea53ad9cf73b ("x86/crash: add x86 crash hotplug support")
> Link: https://sashiko.dev/#/patchset/20260907125404.922123-1-ruanjinjie%40huawei.com
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/x86/kernel/crash.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e681ec9cf1dc8..3c9f4fbbe7ff0 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -447,9 +447,10 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>   */
>  void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  {
> -	void *elfbuf = NULL, *old_elfcorehdr;
>  	unsigned long mem, memsz;
>  	unsigned long elfsz = 0;
> +	void *elfbuf = NULL;
> +	unsigned long done;
>  
>  	/*
>  	 * As crash_prepare_elf64_headers() has already described all
> @@ -484,21 +485,20 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  
>  	/*
>  	 * Copy new elfcorehdr over the old elfcorehdr at destination.
> -	 */
> -	old_elfcorehdr = kmap_local_page(pfn_to_page(mem >> PAGE_SHIFT));
> -	if (!old_elfcorehdr) {
> -		pr_err("mapping elfcorehdr segment failed\n");
> -		goto out;
> -	}
> -
> -	/*
> -	 * Temporarily invalidate the crash image while the
> -	 * elfcorehdr is updated.
> +	 * The segment is physically contiguous but can span several pages.
> +	 * On 32-bit Highmem architectures, kmap_local_page() maps only a
> +	 * single page at a time, so copy page by page.
>  	 */
>  	xchg(&kexec_crash_image, NULL);
> -	memcpy_flushcache(old_elfcorehdr, elfbuf, elfsz);
> +	for (done = 0; done < elfsz; ) {
> +		size_t chunk = min_t(size_t, PAGE_SIZE, elfsz - done);
> +		void *dst = kmap_local_page(pfn_to_page((mem + done) >> PAGE_SHIFT));
> +
> +		memcpy_flushcache(dst, elfbuf + done, chunk);
> +		kunmap_local(dst);
> +		done += chunk;
> +	}

HIGMEM is only enabled on 32-bit and there elfsz cannot be "massive"
because it is the size of the headers just built for the CPUs and RAM
ranges actually present, not the large memsz reserved for hotplug.
On x86_32 (NR_CPUS <= 64) that is a few KiB at most.

Also, crashkernel is capped at CRASH_ADDR_HIGH_MAX = SZ_512M on X86_32,
which is below the default lowmem limit. For lowmem pages,
kmap_local_page() returns the contiguous direct-map address, so the old
code was already fine.

So the overflow needs the crash region to be in highmem, either through
crashkernel=size@offset above lowmem or through a large vmalloc=
setting, and an elfcorehdr larger than one page.

It is still worth fixing, but please drop "massive" from the subject.

The changelog should also mention the conditions when this could happen.

-- 
Sincerely yours,
Mike.

