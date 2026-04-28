Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41B238D27;
	Tue, 28 Apr 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380807; cv=none; b=Ph6pweTpy1uBoqS8xWFjABzUFMrW5AZyK0qJnMhsuvGYvbbJKRLShmocpdRkRhi01G9InhqxrYBhk8JiqSqcbHMjiMcJIQy7S8oXP6ePohEOaTWZvbOqREfkhj2zPmKiGKwwMRlJl7R98oLLaHgyoZ11HglNgDF6E8AdWAovWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380807; c=relaxed/simple;
	bh=MFTHBWIVPPds/6umCo+/GsrLJiT9dmnX5t+TJKOu5mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDYGS8RbJPrlRDAhl9FPqv0jQtkj1Fx4tsWu0ZCvlkjyfGDl9sthea/EMaoEMYRy1YY4ejmdI7KhLYJ563nD8Fv46cxW+Iw6DmQAiCak0hsdzsRJcwNj/HtMC7r7JnMJn7Gq921udEcXkjalJDGqVNZqdgO9qShVtBdxAfS9moI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2H9r0W1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2H9r0W1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3A7C2BCB7;
	Tue, 28 Apr 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380805;
	bh=MFTHBWIVPPds/6umCo+/GsrLJiT9dmnX5t+TJKOu5mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2H9r0W1pFFOcIVTMHsruFr/GMxPujb4LuXdLrJe3uKYcZNxQlHL325YdzeYIaqGb
	 YgUJCml9iD59Ml9MwxFlDl8g45HE5SHDfQGNKeas7kf1pYmKZ8jVqRDzf6HHicsR74
	 sZhFSzs8Ra8AOxlyR0j8SYeZmmbjYyl+cqItSnBMh0HfeU971hN2OffDpUKu+aAFBj
	 GLEtiSpFA8P4RWzmvn81yKRR+hygNgh10efvXltfAPPC4wXMVhE51Jp4/oUrhxxohi
	 717FMNQI5CLuRE78CHCswC/iUhsYlDYFPjyu26ZyBg3OTRsdTyrq/yecTvXuGJxsmB
	 j+0ksBK4wyZcg==
Date: Tue, 28 Apr 2026 14:53:01 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	paulmck@kernel.org, lirongqing@baidu.com, leitao@debian.org,
	ardb@kernel.org, jbohac@suse.cz, cfsworks@gmail.com,
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, hbathini@linux.ibm.com,
	eajames@linux.ibm.com, guoren@kernel.org,
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
	fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com,
	takahiro.akashi@linaro.org, james.morse@arm.com,
	lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, Baoquan He <baoquan.he@linux.dev>
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <afCtrXaUAGDcseq3@kernel.org>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
 <dfa24c4b-a423-4c80-9a8f-28c577c9ec11@huawei.com>
 <20260428035256.cbb3ac77c4bbb89bb7efcc19@linux-foundation.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428035256.cbb3ac77c4bbb89bb7efcc19@linux-foundation.org>

(added new Baoquan's email)

On Tue, Apr 28, 2026 at 03:52:56AM -0700, Andrew Morton wrote:
> On Tue, 28 Apr 2026 11:30:13 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
> > It seems the patches for crash core rework, powerpc, riscv, and arm64
> > are mostly ready to be merged. Could any maintainer help pick these up,
> > or should I rebase the entire series against v7.1-rc1?
> 
> April 2 is prehistoric ;)
> 
> Yes, refresh, retest, resend.  Note that there have been maintainership
> shuffles in this area.  
> 
> KDUMP
> M:	Andrew Morton <akpm@linux-foundation.org>
> M:	Baoquan He <bhe@redhat.com>
> M:	Mike Rapoport <rppt@kernel.org>
> M:	Pasha Tatashin <pasha.tatashin@soleen.com>
> M:	Pratyush Yadav <pratyush@kernel.org>
> R:	Dave Young <ruirui.yang@linux.dev>
> L:	kexec@lists.infradead.org
> S:	Maintained
> F:	Documentation/admin-guide/kdump/
> F:	fs/proc/vmcore.c
> F:	include/linux/crash_core.h
> F:	include/linux/crash_dump.h
> F:	include/uapi/linux/vmcore.h
> F:	kernel/crash_*.c
> 
> I believe that Pasha/Mike/Pratyush are setting up a git tree, but there
> isn't one listed here?

On it:
https://lore.kernel.org/all/20260428124833.1903302-1-rppt@kernel.org/
https://lore.kernel.org/all/20260428124325.4189486-1-pratyush@kernel.org/

-- 
Sincerely yours,
Mike.
