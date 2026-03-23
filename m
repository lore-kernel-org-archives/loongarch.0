Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98513C198A;
	Mon, 23 Mar 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284276; cv=none; b=XmOS0eUCy55CmzflKpUAqJ1U+tJBExYabonf/KZfZc9oiDs97TqrHluK0OWBPCmuxiRflCTuG8d05mzIgqY07/01qakNbVJRqBQbrS/uODKDwgIu46F6tYwHIkWyX1RcQQek6rcu3ligQetYwf5RIGB8VFeGLyIHt2SWTyeRZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284276; c=relaxed/simple;
	bh=rDr6NT1Sv35coLIThTn5ymCPYQNnEGzN4OhDYsaf3R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iC9zjGIcV/38d8pbvFTogYGedhIb8St5QE+6wev6kqyh9Kr1/bQP8QDSJZLUrpcIQPBaJXO45uZN46WSkxUE5BKll9gsAbq526rpz/6b833moRcuCZl3+MtiyRZus55ozv6AqEN5Vd29RKGXXs/irS3Mjsr1lTYB0jmq7Wwit9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=dlZIzt5Y; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="dlZIzt5Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=u646cOHMJ/zTHL9+VZ4W7Ux0q5cDJeWhhX/W1yOam3I=; b=dlZIzt5YzevTl4QnSJxxDuhppU
	q2WiFtssembwHpot97e7p66yyqpF3dN8xA6eo3mU9Y5cs77fG/ib/E0pmR2yPSYUbOk1yB04ldCYA
	8ZSzKzhPXOJ2uxLAeNtLzVEnC72HyX/Da0COA18pwxZ18OR3/xTPzoczvd+eOfdbXU+oe4D6zXNln
	RL3AID6EDlGZkPD4dqQGcVL8hyyuo84fScfgh1+HpHr0th+N7IyqowEsgziGLLV0rZFhpAPGgdSUN
	uSgV3My9CRMDXuTe1oUCC4dNUN3U7nThOJTD+Dmv8QRP2jO2Jg1/VT/h7vj784PI985iF8yh77g2G
	eh4Qqoxg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4iMe-007fRI-16; Mon, 23 Mar 2026 16:42:50 +0000
Date: Mon, 23 Mar 2026 09:42:38 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org, 
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	safinaskar@gmail.com, rppt@kernel.org, ardb@kernel.org, jbohac@suse.cz, 
	cfsworks@gmail.com, osandov@fb.com, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, samuel.holland@sifive.com, 
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [PATCH v9 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <acFtMLyCWbYOyFZT@gmail.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323072745.2481719-5-ruanjinjie@huawei.com>
 <acETyW3FYaWCShUc@gmail.com>
 <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5694ee0-7a95-4c15-6775-990d70c8d77b@huawei.com>
X-Debian-User: leitao

On Mon, Mar 23, 2026 at 07:17:21PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2026/3/23 18:20, Breno Leitao wrote:
> > On Mon, Mar 23, 2026 at 03:27:44PM +0800, Jinjie Ruan wrote:
> >> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> >> crashkernel= command line option") and commit ab475510e042 ("kdump:
> >> implement reserve_crashkernel_cma") added CMA support for kdump
> >> crashkernel reservation.
> >>
> >> Crash kernel memory reservation wastes production resources if too
> >> large, risks kdump failure if too small, and faces allocation difficulties
> >> on fragmented systems due to contiguous block constraints. The new
> >> CMA-based crashkernel reservation scheme splits the "large fixed
> >> reservation" into a "small fixed region + large CMA dynamic region": the
> >> CMA memory is available to userspace during normal operation to avoid
> >> waste, and is reclaimed for kdump upon crash—saving memory while
> >> improving reliability.
> >>
> >> So extend crashkernel CMA reservation support to arm64. The following
> >> changes are made to enable CMA reservation:
> >>
> >> - Parse and obtain the CMA reservation size along with other crashkernel
> >>   parameters.
> >> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> >> - Include the CMA-reserved ranges for kdump kernel to use.
> >> - Exclude the CMA-reserved ranges from the crash kernel memory to
> >>   prevent them from being exported through /proc/vmcore, which is already
> >>   done in the crash core.
> >>
> >> Update kernel-parameters.txt to document CMA support for crashkernel on
> >> arm64 architecture.
> >>
> >> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >> Acked-by: Baoquan He <bhe@redhat.com>
> >> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >> v7:
> >> - Correct the inclusion of CMA-reserved ranges for kdump
> >>   kernel in of/kexec.
> >> v3:
> >> - Add Acked-by.
> >> v2:
> >> - Free cmem in prepare_elf_headers()
> >> - Add the mtivation.
> >> ---
> >>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
> >>  arch/arm64/kernel/machine_kexec_file.c          | 2 +-
> >>  arch/arm64/mm/init.c                            | 5 +++--
> >>  drivers/of/fdt.c                                | 9 +++++----
> >>  drivers/of/kexec.c                              | 9 +++++++++
> >>  5 files changed, 19 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index cb850e5290c2..afb3112510f7 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -1121,7 +1121,7 @@ Kernel parameters
> >>  			It will be ignored when crashkernel=X,high is not used
> >>  			or memory reserved is below 4G.
> >>  	crashkernel=size[KMG],cma
> >> -			[KNL, X86, ppc] Reserve additional crash kernel memory from
> >> +			[KNL, X86, ARM64, PPC] Reserve additional crash kernel memory from
> >>  			CMA. This reservation is usable by the first system's
> >>  			userspace memory and kernel movable allocations (memory
> >>  			balloon, zswap). Pages allocated from this memory range
> >> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> >> index c338506a580b..cc577d77df00 100644
> >> --- a/arch/arm64/kernel/machine_kexec_file.c
> >> +++ b/arch/arm64/kernel/machine_kexec_file.c
> >> @@ -42,7 +42,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
> >>  #ifdef CONFIG_CRASH_DUMP
> >>  unsigned int arch_get_system_nr_ranges(void)
> >>  {
> >> -	unsigned int nr_ranges = 2; /* for exclusion of crashkernel region */
> >> +	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
> > 
> > You update arch_get_system_nr_ranges() to account for CMA ranges, but
> > prepare_elf_headers() in the same file (line 51) still has the
> > hardcoded:
> > 
> >         nr_ranges = 2; /* for exclusion of crashkernel region */
> 
> I don't see any logic related to prepare_elf_headers() or hardcoded
> nr_ranges = 2 in the arm64 implementation.

Just ignore me here, I've mis applied the patch, and then I got
arch_get_system_nr_ranges() and prepare_elf_headers(), but, they are the
same thing at in here.

> > 
> > and does not exclude CMA ranges from cmem. If the generic crash core
> > handles CMA exclusion from vmcore, then shouldn't
> > arch_get_system_nr_ranges() also not need this change?
> > 
