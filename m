Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B947C3A5430;
	Mon, 11 May 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492956; cv=none; b=Zrgn4YwP81zycy2MUBZ9yDE0PdPO/RocHO+9/GThLVmnajJOf1Y9T7SZv3ZytA9Hn2lC+OelVsnR3tLDH62OkRT9uMzyPynFall6/MqiDwZaOge/2i7N8U7zyh5Z8j9u4G34UdX9TqZY81SDHscLhM/8VwMNyR1kjyWDDggfNww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492956; c=relaxed/simple;
	bh=d15KOSaKBGpASg8GNtNb5Q4aDGvFAlqSQ2wlcRvSVRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzRHZTikVUxIKFXRpi6Oza6DAC+RWLGZj+oVvEBi6jexrb8/mW7JRtvXOjpL1hmV3q1KKw6rygMQRSAEg0NPj6ZNfuMP2kZnrCORmzd5R00sKA8DdGqJJHVtfS4mxPvo4mIt96tzSFhSyZMR5LaXSfDGN+4JulGBwUQBBu/2XYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=iJ89i0F6; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="iJ89i0F6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TE+A8gVsi33ADWPRsTq1jFWiY76eVCOBjR9gXM5fMfY=; b=iJ89i0F6NFZsu5G0fxn0HLYT+r
	l0SLLEDLG/yPloRHV0v1HlL5Yc01WpUF7lWffNA1KFgex0k3+bKbm0zzSupULh+T5t4eluweHQo9j
	KONzV42jkP7COLxrhglXtoOrqeqKupykQcuDBWXlXTFdmgrp/0e6EKUyXkYNAaPD5wqH7A75PO6XF
	yxQ5UuXHCKGt/3yK7FkKYGJo+BpAX/OGsR6mPO0bp/LCIi37AD//k/7owe+QOGFpJx+fFlLJM7FPy
	Gn4D99g4S4bjwfYMkgC9jwdc9OCVfhBC8G4M6jOz+mJb7qKKoa9+ZukNTqJvhkRjgX4s1RX0VDpnX
	fPtEV+WQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMNE5-001VdZ-2m;
	Mon, 11 May 2026 09:47:02 +0000
Date: Mon, 11 May 2026 02:46:43 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, kuba@kernel.org, 
	ebiggers@kernel.org, lirongqing@baidu.com, paulmck@kernel.org, 
	sourabhjain@linux.ibm.com, coxu@redhat.com, jbohac@suse.cz, ryan.roberts@arm.com, 
	osandov@fb.com, cfsworks@gmail.com, tangyouling@kylinos.cn, 
	ritesh.list@gmail.com, adityag@linux.ibm.com, guoren@kernel.org, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, wangruikang@iscas.ac.cn, namcao@linutronix.de, 
	chao.gao@intel.com, seanjc@google.com, fuqiang.wang@easystack.cn, ardb@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, takahiro.akashi@linaro.org, 
	james.morse@arm.com, lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Message-ID: <agGkvrg06KNDNfDi@gmail.com>
References: <20260511030454.1730881-1-ruanjinjie@huawei.com>
 <20260511030454.1730881-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511030454.1730881-5-ruanjinjie@huawei.com>
X-Debian-User: leitao

On Mon, May 11, 2026 at 11:04:43AM +0800, Jinjie Ruan wrote:
> There is a race condition between the kexec_load() system call
> (crash kernel loading path) and memory hotplug operations that can
> lead to buffer overflow and potential kernel crash.
> 
> During prepare_elf_headers(), the following steps occur:
> 1. The first for_each_mem_range() queries current System RAM memory ranges
> 2. Allocates buffer based on queried count
> 3. The 2st for_each_mem_range() populates ranges from memblock
> 
> If memory hotplug occurs between step 1 and step 3, the number of ranges
> can increase, causing out-of-bounds write when populating cmem->ranges[].
> 
> This happens because kexec_load() uses kexec_trylock (atomic_t) while
> memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
> with each other.
> 
> Add the explicit bounds checking to prevent out-of-bounds access.

It seems you have a TOCTOU type of issue, and this seems to be shrinking
the window, but not fully solving it?

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
> Closes: https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie%40huawei.com
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index e31fabed378a..a67e7b1abbab 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -59,6 +59,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  	cmem->max_nr_ranges = nr_ranges;
>  	cmem->nr_ranges = 0;
>  	for_each_mem_range(i, &start, &end) {
> +		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
> +			ret = -ENOMEM;

-ENOMEM seems to be the the wrong errno. This isn't an allocation
failure; it's a transient race. -EBUSY or -EAGAIN would be more honest
