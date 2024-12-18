Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5206D1B0417
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734532573; cv=none; b=qQObC9BL3GXlY2mxyRVG/tDfPG1XgSGiheIYK3UV8Qp0e0xxjzReZP8R7yQEnaV7EY6IkmJsk05aG/ByYNtvng7EvEmT74611zv5ctTZZ1O5MZ5Aw2SNgrzjKn1TvpfzOKaO6ptQytkYBUw2jtU6vGmiZKJc+ol0R/estE0PA/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734532573; c=relaxed/simple;
	bh=9n0ZAjSAIhk9F622B8IToa4qtHVMNl9mwzIDA2TI+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsqKrVo7AYVyo0MHRQqo91AZYoW7swgktXzjDeqAwq8OweDoI3EpWjup/Tn5BZeJtrFLUP9tVamhmK9pe8IlAFZXfdf2CaTcXhD6kV2aSV/rYqtRzfB/XByPTbZQdT4gPubhnbd4nUzKqSRQwXEigpbsSaVdilX8P5UQlE9bN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJCGs4Yz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJCGs4Yz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C4AC4CECD
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734532572;
	bh=9n0ZAjSAIhk9F622B8IToa4qtHVMNl9mwzIDA2TI+7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oJCGs4YzbcTcFVKmU3XFHzvQVR68fBsTxpeAJV9lZb7eTdjNIVA6BQcWBrY1t673i
	 dvHWg0AgSjOdYqxDZ3ktuaitcxSMduGGs+cSMYqZJqCn8vzFsznDrRgZamTD/eJ8Zj
	 VQr6q5j9cu6BpmdP99+KuOSFqIRVp/aRFZlkrgT96XzX9olRwpwOK4qxvGfIIAS80g
	 LlnKOBrI3qOjCDj/2KyyFBkajJHez/w8zbB8x2aIzxMfwHowwpKSSxHV9U1pObZYRM
	 DE3rNPOLNMFOjQ6Fb01zRwrL7vfgMLVtfipcS7OqXc8N4BFfXb/yyXdcJ4x1/W0TFN
	 tJTYxwUl0JFJw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1015597366b.1
        for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 06:36:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhHwUXBtkAMNGRmSzkJ2VgOExSh8VCOaeAyIlpKmFvJ80Eulc16ExWcoeav69Q7g/MAXsNEcnvHYI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdh1jWlOPkDlxhYjSjrkj3EovidIjSE21prT4GLe5CatJEkMKL
	0A4a+XufE4huKQffVZJnSK0IJrOAsQhjlNdFSFYi/G1Kyo+Bhtr/l+mrPgaWzeFVLe1djaZkS+R
	juJirSXLLYrknDV8onRuL6e2caN4=
X-Google-Smtp-Source: AGHT+IGH+ozXywB34VYVSAamVS+ZjQCypQ05xEGjN0SqCkq8/WyDDyS7rVXnhhMxnJivZ7v/JZDxOROVB65JAzdxhVI=
X-Received: by 2002:a17:906:328d:b0:aa6:1e9a:e45a with SMTP id
 a640c23a62f3a-aabf48c67c5mr231921266b.46.1734532571420; Wed, 18 Dec 2024
 06:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241217010905.13054-1-yangtiezhu@loongson.cn> <20241217015006.30305-1-yangtiezhu@loongson.cn>
In-Reply-To: <20241217015006.30305-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Dec 2024 22:36:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
Message-ID: <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction() noinline
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Tue, Dec 17, 2024 at 9:50=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When compiling with Clang on LoongArch, there exists the following objtoo=
l
> warning in drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.o:
>
>   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
>
> This is because dc_fixpt_from_fraction() is inlined in dc_fixpt_recip()
> by Clang, given dc_fixpt_from_fraction() is not a simple function, just
> mark it noinline to avoid the above issue.
I don't know whether drm maintainers can accept this, because it looks
like a workaround. Yes, uninline this function "solve" a problem and
seems reasonable in this case because the function is "not simple",
but from another point of view, you may hide a type of bug.


Huacai

>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers=
/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> index 88d3f9d7dd55..b40c6a21460d 100644
> --- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> +++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
> @@ -68,7 +68,7 @@ static inline unsigned long long complete_integer_divis=
ion_u64(
>  #define GET_FRACTIONAL_PART(x) \
>         (FRACTIONAL_PART_MASK & (x))
>
> -struct fixed31_32 dc_fixpt_from_fraction(long long numerator, long long =
denominator)
> +noinline struct fixed31_32 dc_fixpt_from_fraction(long long numerator, l=
ong long denominator)
>  {
>         struct fixed31_32 res;
>
> --
> 2.42.0
>
