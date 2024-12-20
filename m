Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D71A2C11;
	Fri, 20 Dec 2024 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734734048; cv=none; b=VQrm89ba0+md4uUXz27fMCOl/Hf7/Md97AROWBvjUg4AyHGCDqSGStTtkFLdEvZXAh4qkNs5e3Zeg8N/zrhwks/u5pWmRRCLU2/PM3qYkRLiX7XQ/DV9v5AgTEhG1f3FGA9tMK9lM9mJ5XkS9mkEGOBdkDicJ1UxtZqhKy6K61w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734734048; c=relaxed/simple;
	bh=j40tsMuvCA5xpLi/dRCtR36EFBNLsw5eZK2Xf4svG3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKaTidWl8bWo1z3ttqoj8e2FM4hzwYRuNpJPlkmML4m73g3HSCKFwvH4AtD6DEGZkVV6y1KO9ycBcVjuCL/2cTcfjDQYcPdg1OeTDAfrbYk9cX6Q7e8FCBy0b31uYHdipwwzJdsRvQ1FUrlzXlhAvClpGYaG2ALdG88k71kO8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+YsW1sh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+YsW1sh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B96C4CECD;
	Fri, 20 Dec 2024 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734734047;
	bh=j40tsMuvCA5xpLi/dRCtR36EFBNLsw5eZK2Xf4svG3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+YsW1shxBhOXiRRwlgK7xa5cZH8IbSHgwyja1e6KYMCRvL7lKYCHCSdU8di9TEkE
	 BCFcJKU8I5zbiupe6nT4wHiRQNJTXMs5yfygBGjCnLMZSGmSX3TN6F4TVjVkFTM+pS
	 zLuteCc8zOzq31HCIw8kBxyIYsNx0jubvS8ae++/5wN5ULjJAwGmoa41tTUocFVrPt
	 N7Tn7tF/F/Qt4Zel/ltWk4SntkthXhf7j8I0TXKcmMO592a8BQoRLQkEGqqvNlbBDG
	 Nvllw7AIoMAitKbnjjDu/hbZYNijH+h7OUodTmM+gvqhZhlsTi3CN7p0caxmE2urXr
	 5OwX+0L13HR5A==
Date: Fri, 20 Dec 2024 15:34:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Alex Deucher <alexdeucher@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
Message-ID: <20241220223403.GA2605890@ax162>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
 <20241220103100.GB17537@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220103100.GB17537@noisy.programming.kicks-ass.net>

On Fri, Dec 20, 2024 at 11:31:00AM +0100, Peter Zijlstra wrote:
> Also, curse the DRM Makefiles, you can't do:
> 
>   make drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.s

Small tip: You can get the path of the target by building
drivers/gpu/drm/amd/amdgpu/ and finding it in the output. In this case,
it'd be

  $ make drivers/gpu/drm/amd/amdgpu/../display/dc/basics/fixpt31_32.s

Not excusing that it does not work as it should but sometimes you have
to work with what you can *shrug*

> > $ clang --version | head -1
> > clang version 20.0.0git (https://github.com/llvm/llvm-project.git
> > 8daf4f16fa08b5d876e98108721dd1743a360326)
> 
> So I didn't have a recent build at hand.. so I've not validated the
> below.
...
> If you put them size-by-side, you'll see it's more or less the same
> code-gen (trivial differences), but now it just stops code-gen, where
> previously it would continue.
> 
> So this really is a compiler problem, this needs no annotation, it's
> straight up broken.
> 
> Now, the thing is, these ASSERT()s are checking for divide-by-zero, I
> suspect clang figured that out and invokes UB on us and just stops
> code-gen.

Yeah, I think your analysis is spot on, as this was introduced by a
change in clang from a few months ago according to my bisect:

https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448

Since the ASSERT does not do anything to prevent the divide by zero (it
just flags it with WARN_ON) and the rest of the code doesn't either, I
assume that the codegen stops as soon as it encounters the unreachable
that change created from the path where divide by zero would occur via

  dc_fixpt_recip() ->
    dc_fixpt_from_fraction() ->
      complete_integer_division_u64() ->
        div64_u64_rem()

Shouldn't callers of division functions harden them against dividing by
zero?

> Nathan, Nick, don't we have a compiler flag that forces __builtin_trap()
> whenever clang pulls something like this? I think UBSAN does this, but
> we really shouldn't pull in the whole of that for sanity.

Right, I think that LLVM has a hidden flag for this:

  -mllvm -trap-unreachable

That makes this particular warning disappear.

It isn't the greatest because '-mllvm' flags need to be passed along to
the linker for LTO but that's easy enough to deal with. I know we have
talked about enabling that flag in the past but I cannot remember why we
decided against it (maybe code size concerns and other optimization
restrictions)? It looks like GCC has a similar flag,
-funreachable-traps.

Cheers,
Nathan
