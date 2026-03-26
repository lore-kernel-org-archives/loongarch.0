Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769CE186E58
	for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 10:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522409; cv=none; b=n1zgUzOrTLKhnFiLE1qEmnqzgnlRkEAk+WO26cdqwEdudDxDl7ov1/xBc36toWCb/1NXV6mAdcU0xY+YF1SPLGufkZv0ShFDEXl+CqYo7MKa92iWLkwnr7iLMHaAz/DrGGFNo54DN4ettuJZb2LAECHOLEcdTCLx/aofc4nlrrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522409; c=relaxed/simple;
	bh=TbxaIif3p8WQ6+e44Bzl22FNO5C/zwaxFLGv4rhnrAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACFB1BXf+AC92LjPauiF7ngPURuBmB3W+a0tlS/b9MGbz3WdC9AR3ge1ScLMhTnKk99ppEPcvZPRIHbUH0k6aPMultvmjELIcw7zv1PvtnR2Vjx5CjFQXsRkCU3Yw+pSXm+vfrDCr2rkGlat1BO3B25b4ICkrHOzhxxX+CBvzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b4O8r4Jq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b4O8r4Jq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9604175A;
	Thu, 26 Mar 2026 03:53:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BEE03FB90;
	Thu, 26 Mar 2026 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774522406; bh=TbxaIif3p8WQ6+e44Bzl22FNO5C/zwaxFLGv4rhnrAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4O8r4Jq2CFcar+ykaYubGzY5y5qXmjwpctKmzjtCbYrCy7ZWRYDuVV6rw/K5YRYE
	 cFU8FIDuxcRiwzgg6ypdQsF6ZJHHAtZPQCtyFE9nn5+FJpKL3uUn2slYkKqObCNZpl
	 vTALvEOciub+LB3zvVDl3q8MoMa8BSfaYZ27RjFc=
Date: Thu, 26 Mar 2026 10:53:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
	peterz@infradead.org, pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, paulmck@kernel.org,
	lirongqing@baidu.com, rppt@kernel.org, ardb@kernel.org,
	leitao@debian.org, osandov@fb.com, cfsworks@gmail.com,
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, eajames@linux.ibm.com,
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
	samuel.holland@sifive.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	jbohac@suse.cz, fuqiang.wang@easystack.cn, guoren@kernel.org,
	chenjiahao16@huawei.com, hbathini@linux.ibm.com,
	james.morse@arm.com, takahiro.akashi@linaro.org,
	lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v10 4/8] crash: Exclude crash kernel memory in crash core
Message-ID: <acUQHCETMXaEtdK5@arm.com>
References: <20260325025904.2811960-1-ruanjinjie@huawei.com>
 <20260325025904.2811960-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325025904.2811960-5-ruanjinjie@huawei.com>

On Wed, Mar 25, 2026 at 10:59:00AM +0800, Jinjie Ruan wrote:
> The crash memory alloc, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> handling them in the crash core would eliminate a lot of duplication, so
> do them in the common code.
> 
> To achieve the above goal, three architecture-specific functions are
> introduced:
> 
> - arch_get_system_nr_ranges(). Pre-counts the max number of memory ranges.
> 
> - arch_crash_populate_cmem(). Collects the memory ranges and fills them
>   into cmem.
> 
> - arch_crash_exclude_ranges(). Architecture's additional crash memory
>   ranges exclusion, defaulting to empty.
> 
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
