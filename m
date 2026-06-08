Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0E3B27E1;
	Mon,  8 Jun 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908649; cv=none; b=Mf4vQ0u2ftIAzxc5YrFIF3/5LbT75u1dgBkxbJVu4PtjXcJKylTlPs7VuqlU5x5jk25O2dVp+r3SrSt3RJVB1jVJTvVLEIygUSU1iUHEiU327Xh3FSdUrlml+cKs5ltnQ6uC+lSTLGWKHx83pEwB51CsB1CaYJax+uI4xTxJMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908649; c=relaxed/simple;
	bh=B/lsomBiRVL9mQdaJ38PILug80vLR9tO1ueasoxijW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbxQjXb1iDELoAWSj2kcYLgbRqEPbMXv+JlEROj7zpE/Qlveyn0YvzUV+zvDxGy7sQSsYMnRqBmIGURhl+8nLyhfEEVyOgo2yL7SBNamdklUX5nfXZWgDldkyhwNjwtxsQndXjYN3U1Qnq5LN0jGxDcIYTT5bkC3yuoQX7hbuRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=vejwWx6V; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="vejwWx6V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dluz+I3N22ywYzoz/gAwyyxGhCLB7ATDVpgZxGTd1Hg=; b=vejwWx6VMa39pTZib49M1u2r0C
	Mrn0/A5J9513XAgHtk8Kc1CYh3TI47gau+fhR5slOP8jFMeLmvBEkCNn+19iNKIFPdFa6WE8c/gMz
	t99Ie63OWcvhMhtDDCnkve8QzJTAG4GOsX2xkBYXCKc6Q5v0qsFAbaF2hKBz8hrhVx12IhVGRRlWw
	/fSo+694x+90ee0pNT1hAtVxcLtMYrqb6l8/0GAl9mOeoYjSxWYQgsLPdtK3SnuYybkJanG8qaQaT
	ylzuIsGC80K9maerJAYZM7CdzO20xRUnZQqGLQPiWDxuQ1wpIcGbXE0U4+rbWltECyITWI9vcAHM2
	p5vwQpHQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWVfH-007VKw-26;
	Mon, 08 Jun 2026 08:48:59 +0000
Date: Mon, 8 Jun 2026 01:48:47 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ruirui.yang@linux.dev, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org, 
	coxu@redhat.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, osandov@fb.com, 
	jbohac@suse.cz, cfsworks@gmail.com, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, adityag@linux.ibm.com, 
	liaoyuanhong@vivo.com, seanjc@google.com, fuqiang.wang@easystack.cn, ardb@kernel.org, 
	chenjiahao16@huawei.com, guoren@kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v16 08/10] powerpc/kexec_file: Use
 crash_exclude_core_ranges() helper
Message-ID: <aiaB45VXyCv4pUBW@gmail.com>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608073459.3119290-9-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608073459.3119290-9-ruanjinjie@huawei.com>
X-Debian-User: leitao

On Mon, Jun 08, 2026 at 03:34:57PM +0800, Jinjie Ruan wrote:
> The crash memory exclude of crashk_res and crashk_cma memory on powerpc
> are almost identical to the generic crash_exclude_core_ranges().
> 
> By introducing the architecture-specific arch_crash_exclude_mem_range()
> function with a default implementation of crash_exclude_mem_range(),
> and using crash_exclude_mem_range_guarded as powerpc's separate
> implementation, the generic crash_exclude_core_ranges() helper function
> can be reused.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Acked-by: Breno leitao <leitao@debian.org>
