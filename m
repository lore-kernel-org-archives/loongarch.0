Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CFC10F1;
	Tue, 31 Dec 2024 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634751; cv=none; b=kaQ/n06O7erNvxr9PvPHa+EHEl5a7nBt6LtmeJOEwlrDtAWW8Omh5KUOKvt9wmP+E9yx+ovak1csTDHzjXAUZdMdiqddSqOiaC/FH8rrkcWMs6JKG/lJ15vTA5byRnAIMLQf2KMdVbqnvlCkuJGhrLyKwcuk6MhbFtdxzFkS/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634751; c=relaxed/simple;
	bh=C+UQz/nc6bBAYUdBdips7Iqq3f5dlWZNk33voQGhfVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CE77ZqiFZAQdSv8ErNyJBDJTNJV4wyf2uVw3Z7Eo+kRYTkobCy3Qtlc1JYGt15N/abUjr0pGBBuZQNIEXZJRYqPp4StS4T0y7tNnnYa1UdsmQMUOXmXdHQ6MFvZptFjT05rIhHKSJhZOcDei50scFPNscovwf1xOXcyB+iqouvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fp05W0HM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fp05W0HM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA167C4CEDE;
	Tue, 31 Dec 2024 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735634750;
	bh=C+UQz/nc6bBAYUdBdips7Iqq3f5dlWZNk33voQGhfVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fp05W0HMGGyveouJg3wGMHMI9Wsq734JOjrx0/GykjO/97ctetpRKzruE2CI9Gmxb
	 yVflswyCuQmhVgm+HRISNRIZ/vjdnfEs431tcr1TBB3OK361A5WlCNAO4GDwxbKD/V
	 JFNjuIxtAkxpv0H6FyQyQUGK41nt61YX0ybtGiGAsgm+C6e3o6+hVd0v8J6SIumaKR
	 tVpyA2GarG3J7EJzsZzE02DymaTA4aHwPN+IIx9+nqdFpoep/toyNuIQT0/yfKe7Mh
	 W9fcawsR638ejjkmExcNgnL52VVNHyvFx8gY6dhSjmAZ1+GC8ewhmVhb1K4cn9La8C
	 XLPkMW0HYGWVA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so13502473a12.3;
        Tue, 31 Dec 2024 00:45:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz0qx13oJSvlBBtH1kVEIC9+lWFOAjRBbIgZz/8V9qK7mIvv8j3bvArodp18T5rbI/Oc9P5FZZshzH@lists.linux.dev, AJvYcCWMt2uGhbxWnu94FtbjCXLQccxfCJNpfhcV/V7nGABCJkRCMLdBkUbbKUBEtYnL3zsKEzJd@lists.linux.dev
X-Gm-Message-State: AOJu0YwNsM/31kWbhjPQjrnuPvVsNYnCaXVxNmjjvfkcO+4MGjfvTnfz
	2G5rIAZCV0uAEbtdV31oiZPG3xUUOtpi8tD8Dr0Ha/dxQ0z8kgoP92wfuG5b5ydyXyIvU7GfJmF
	nuZzOrHBWvcR84cxR9PNOL52dWx8=
X-Google-Smtp-Source: AGHT+IG84TtjHESOMq9FoZL4Pm5fRrf90fimurFofMW2Rx/qHlRyMup3BnauOQooZDKmpdYvvoXRRGP3rPsuokeyEtU=
X-Received: by 2002:a17:907:7284:b0:aa6:8430:cb02 with SMTP id
 a640c23a62f3a-aac3397d1ccmr3489379866b.61.1735634749256; Tue, 31 Dec 2024
 00:45:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241231072806.4936-1-yangtiezhu@loongson.cn>
In-Reply-To: <20241231072806.4936-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 31 Dec 2024 16:45:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WyFqw4FDnMHN=AFOBvzSXDC+OWhjwrej1SFVat9E_xw@mail.gmail.com>
Message-ID: <CAAhV-H7WyFqw4FDnMHN=AFOBvzSXDC+OWhjwrej1SFVat9E_xw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Harden callers of division functions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Dec 31, 2024 at 3:28=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> There are objtool warnings compiled with the latest mainline LLVM:
>
>   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
>   spl_fixpt_recip() falls through to next function spl_fixpt_sinc()
>
> Here are the call paths:
>
>   dc_fixpt_recip()
>     dc_fixpt_from_fraction()
>       complete_integer_division_u64()
>         div64_u64_rem()
>
>   spl_fixpt_recip()
>     spl_fixpt_from_fraction()
>       spl_complete_integer_division_u64()
>         spl_div64_u64_rem()
>
> This was introduced by a change in Clang from a few months:
>
>   [SimplifyCFG] Deduce paths unreachable if they cause div/rem UB)
>   https://github.com/llvm/llvm-project/commit/37932643abab
>
> Since the ASSERT does not do anything to prevent the divide by zero
> (just flags it with WARN_ON) and the rest of the code doesn't either,
> the callers of division functions should harden them against dividing
> by zero to avoid undefined behavior.
>
> Keep the current ASSERT for the aim of debugging, just add BUG() to
> stop control flow if the divisior is zero.
>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Xi Ruoyao <xry111@xry111.site>
> Suggested-by: Rui Wang <wangrui@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Link: https://lore.kernel.org/lkml/20241220223403.GA2605890@ax162/
> ---
>  drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  | 1 +
>  drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers=
/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..e15391e36b40 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -52,6 +52,7 @@ static inline unsigned long long complete_integer_divis=
ion_u64(
>         unsigned long long result;
>
>         ASSERT(divisor);
> +       BUG_ON(!divisor);
ASSERT() calls WARN(), so the warning message will print twice, but I
don't have a better suggestion. :)

Huacai

>
>         result =3D div64_u64_rem(dividend, divisor, remainder);
>
> diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/driver=
s/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> index 131f1e3949d3..ce2036950808 100644
> --- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
> @@ -30,6 +30,7 @@ static inline unsigned long long spl_complete_integer_d=
ivision_u64(
>         unsigned long long result;
>
>         SPL_ASSERT(divisor);
> +       BUG_ON(!divisor);
>
>         result =3D spl_div64_u64_rem(dividend, divisor, remainder);
>
> --
> 2.42.0
>
>
