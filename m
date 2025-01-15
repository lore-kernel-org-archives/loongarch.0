Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5522B23243D;
	Wed, 15 Jan 2025 01:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904887; cv=none; b=RhxxcAQdTNmGi4C8lV8nJIv0T3aE1ElL+5+O53zVvD+isK5s2eaaThoX+Ivb5uF6QTFlU6qnq/ZtIpZdB0tRbl6dbkE1MqPNg8Qk531Xa2Fw8KxU39WcnYCrb0z5YKCuT/G8y0EIxQnzbKCtk3W5NqtOfCqwl9TpKaM98U2LC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904887; c=relaxed/simple;
	bh=OXCHDIVdFs+lD+uci6+EY4R2agA/+sdGam9mXKqjzhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9xjRimoD2L1b/gdLi0rHrue/NXi+fwJ2DoRbGh3a3vLl5QFrU143axTSl56ui9SbebJ+/bHMMG71nZ0Qmsqyss3t0CR3nepGi08VljUYp7IOZ8fHXtyCCHUqK4/+tW+coAsjlzxx08xRz6AMP6LE4VoJH2UDea8N2HDwlDzybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBygPGta; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBygPGta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25EC4CEDD;
	Wed, 15 Jan 2025 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736904886;
	bh=OXCHDIVdFs+lD+uci6+EY4R2agA/+sdGam9mXKqjzhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBygPGta7fs0zulpH4swS2t1N+kZKFXIxcKBmN2/Ewi5+DhA0Tzd8QYiC443tN3Q4
	 y0BHSYwNgpin/7LyzWaegxjAsGvBLd460uIHZV10W+qa1/CITbBl7UfpRG5lmvUCFw
	 BD51zpxDqMUaXWscGRP1R5kq/u7rjjpHxe8Y3hu7G5v2BC40+vWoemAFxrxfXzwNK8
	 982z7KSpsMYPbORmU3aI8MHxZ/SRBZoxDWrpWf7HB7/417YaCLrqlTIymAOdt5lljL
	 MkOkWT51DqyxUK/rUnyDmp76GLAiq/k4Iv68k5/QUbTHr0J8BSREMWBFoi5krlAo3D
	 lRebyjGXBsVBw==
Date: Tue, 14 Jan 2025 17:34:44 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
Message-ID: <20250115013444.anzoct6gvs56m225@jpoimboe>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>

On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
> Hi Josh and Peter,
> 
> On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
> > This version is based on tip/tip.git objtool/core branch [1], add some weak
> > and arch-specific functions to make the generic code more readable, tested
> > with the latest upstream mainline Binutils, GCC and Clang.
> 
> ...
> 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core
> > 
> > Tiezhu Yang (9):
> >   objtool: Handle various symbol types of rodata
> >   objtool: Handle different entry size of rodata
> >   objtool: Handle PC relative relocation type
> >   objtool: Handle unreachable entry of rodata
> >   objtool/LoongArch: Add support for switch table
> >   objtool/LoongArch: Add support for goto table
> >   LoongArch: Enable jump table for objtool
> >   LoongArch: Convert unreachable() to BUG()
> >   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
> 
> Are you OK with the first 8 patches?
> What's the merge plan for this series?

Sorry, my inbox is still reeling from the holidays.  I will review this
soon.

-- 
Josh
