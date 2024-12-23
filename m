Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8621422AB;
	Mon, 23 Dec 2024 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734990411; cv=none; b=SYHqIsGEdae1pOVdvPMKcSXtu01/8t1nvxqWFuR1L7Uk5WCX2cs3lbU86b3TLLfgR4LABPUx/mecbT3lyL7Vuw6p3FOWGGZOFi81ciELYOC8t9bOcETsWNxqL4ZkjS96MzQo9ldGPlUUCBXeqLXG5o3bTfgnBzxxo1X+XuWcfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734990411; c=relaxed/simple;
	bh=EcRnBES9getb7jyJ3nW5CUt2aefkz9Gd9cOtql0TrMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6mjtQoIDNfO2QXmMx6FTRtwxch6Nf4/9a46yQnvDfHBVKKYMHBZvUTurpstsBk46AWqQI9mKIko9euFadNyn0N9CtO338LjG8KPelLOWDtPcJXHOAhI+iX/7Qz4vTGU4LpP/hmZUz8EHOYmyXSUbEhtYvrrDZWlkzsfh3BFsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9cZ2duo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9cZ2duo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DE4C4CED3;
	Mon, 23 Dec 2024 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734990410;
	bh=EcRnBES9getb7jyJ3nW5CUt2aefkz9Gd9cOtql0TrMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9cZ2duoFJD3ZZw8B7pKJDf5Ab4af4L0W/q1MWgOzMWSDl/iwTvvivpvzcjG3qA0n
	 ZGbMI2nwalavhhiWwCj473yDy8HCruI5EZi0x08zN7/7we8A2nT/zXo0oKuFlNxf7a
	 BOxi1MmIihJFc4MKDbyaQfcnaFuL4cDV0Ea2yZ+eRJzn0tSffairx+R/B8yjEanMe0
	 0sYE5ZMTXcNrzL2q7a99RP2u0WEOayhBceo8AL++LvLz7Zh/vmRPL2YGKsDLC/5AQ2
	 qU2tDJ3Qfcc1FIw3lMa0RCPXTimxVWAUQlkKgcAEPw2+HG1DvrPxJBYIjv+0aQGixa
	 uZ9Wz+FYxqHMQ==
Date: Mon, 23 Dec 2024 14:46:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Xi Ruoyao <xry111@xry111.site>, Peter Zijlstra <peterz@infradead.org>,
	Alex Deucher <alexdeucher@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
Message-ID: <20241223214645.GB1188382@ax162>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn>
 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
 <20241220103100.GB17537@noisy.programming.kicks-ass.net>
 <20241220223403.GA2605890@ax162>
 <05cdb3b4c9bddf25f7b839229b635d2dec5140a4.camel@xry111.site>
 <bc35fddc-498a-cc58-b6a1-f5234a4f6d0d@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc35fddc-498a-cc58-b6a1-f5234a4f6d0d@loongson.cn>

On Sun, Dec 22, 2024 at 12:27:47PM +0800, Tiezhu Yang wrote:
> On 12/21/2024 03:40 PM, Xi Ruoyao wrote:
> > On Fri, 2024-12-20 at 15:34 -0700, Nathan Chancellor wrote:
> > > > Now, the thing is, these ASSERT()s are checking for divide-by-zero, I
> > > > suspect clang figured that out and invokes UB on us and just stops
> > > > code-gen.
> > > 
> > > Yeah, I think your analysis is spot on, as this was introduced by a
> > > change in clang from a few months ago according to my bisect:
> > > 
> > > https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb4eae7ff1448
> > > 
> > > Since the ASSERT does not do anything to prevent the divide by zero (it
> > > just flags it with WARN_ON) and the rest of the code doesn't either, I
> > > assume that the codegen stops as soon as it encounters the unreachable
> > > that change created from the path where divide by zero would occur via
> > > 
> > >   dc_fixpt_recip() ->
> > >     dc_fixpt_from_fraction() ->
> > >       complete_integer_division_u64() ->
> > >         div64_u64_rem()
> > > 
> > > Shouldn't callers of division functions harden them against dividing by
> > > zero?
> > 
> > Yes I think it'd be the correct solution.
> 
> Thank you all. Do you mean like this?
> 
> --- >8 ---
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..848d8e67304a 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -79,11 +79,13 @@ struct fixed31_32 dc_fixpt_from_fraction(long long
> numerator, long long denomina
>         unsigned long long arg2_value = arg2_negative ? -denominator :
> denominator;
> 
>         unsigned long long remainder;
> +       unsigned long long res_value;
> 
>         /* determine integer part */
> 
> -       unsigned long long res_value = complete_integer_division_u64(
> -               arg1_value, arg2_value, &remainder);
> +       ASSERT(arg2_value);
> +
> +       res_value = complete_integer_division_u64(arg1_value, arg2_value,
> &remainder);
> 
>         ASSERT(res_value <= LONG_MAX);
> 
> @@ -214,8 +216,6 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 arg)
>          * Good idea to use Newton's method
>          */
> 
> -       ASSERT(arg.value);
> -
>         return dc_fixpt_from_fraction(
>                 dc_fixpt_one.value,
>                 arg.value);
> 
> With the above changes, there is no "falls through" objtool warning
> compiled with both clang 19 and the latest mainline clang 20.

I am somewhat surprised that changes anything because the ASSERT is not
stopping control flow so I would expect the same problem as before. I
guess it does not happen perhaps due to inlining differences? I looked
at this code briefly when I sent my initial message and I was not sure
where such a check should exist. It does not look like these functions
really do any sort of error handling.

> If you are OK with it, I will send a separate formal patch to handle
> this issue after doing some more testing.

It may still be worth doing this to get some initial thoughts from the
AMD DRM folks.

Cheers,
Nathan
