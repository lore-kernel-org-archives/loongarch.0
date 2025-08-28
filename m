Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC92557A
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756362871; cv=none; b=tMOlKQBEZHjl048CiGZEWTrWKEvTTUIBf7zQ7RUo4PqL2IeizPZaHSm6hDOzs00D+Lj18S5JtF2CQSrptq++DoTwTkF374wpAKd3tWSGW1ABQwkS9X021AFzCRDMd1de+c6SGk4SU+MO4NYaIVQTARBfQSR1Tw20A4FN69C77dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756362871; c=relaxed/simple;
	bh=oDqhsUVoor8SfB72OMc8fRM70YsagjBrulWe6+faUX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPe6sC6/pd0gCaK0ZLgxzdbtRv74Xe4wRtuPkavjQEbRqssuHrt680sAHeJaiSD/wjLY34u7Rir4fSS9dEycNm53p1059bQr5TuUoZU4F/NmOt21pdb+qiHo5V8LJoa/kjqnk+6dVv6SBL1IN2WhMQEOzDyVf8WLdSYhWbZIQ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izg6L+ry; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izg6L+ry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8895FC4CEF4
	for <loongarch@lists.linux.dev>; Thu, 28 Aug 2025 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756362869;
	bh=oDqhsUVoor8SfB72OMc8fRM70YsagjBrulWe6+faUX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=izg6L+ryHYRPFev4a7YIp1ed3HMGhubyz0QjJ1P5AVn73xq1BWNKYMCNw2fBFUuMf
	 2pDzNbnCEuo58YB7UVJH0L13EtNNUaH3J+n1Z5hDdhrs0/wJaL6LMJ3tayCJwIbHZn
	 W0cDst1uESXDZDG6zHwgkzGguwzMUatmDs2oLGJ9W90qRTJom4kzILwSWzTuS9zJeS
	 teaD/pXBNRwD5wUhlA8R06Q85OENkf3sHZAlhXEBrTs0LfZev7ou5TlMxN2KSYQrdQ
	 yrnOk50xOg9Cm2u6GzClY2z3pKZH5kjHMrdN4olxilsPOf/jDZrHl8cMK0+okJ2JJ8
	 qdXJRs5Kkt1YQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb731caaaso78671966b.0
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 23:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwaUF3m5Lyp6E5zGBcLpbmD1QUn07imoWkGoA94NOojWnSK4eZaFtRC6TcjlOlH57fgL6f7hNJJ7M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0b8BosnHkavjFGidUk9dUYSM9h6O26o/xPjIPMGVRX/d7/iqM
	H0EdLSxKB9HIbMFS3e+nQjKZ+L1SdUHv4P1QKdzctalhuWVSUaTCxyMrqQcFXYc8SpASyJr0i+W
	pBY+CM0Q6gUEeCu6aCUqwEsDyCi+EXpo=
X-Google-Smtp-Source: AGHT+IHwzNu4KWfEQAtdDGT30qlIbF+VfbdLWOPpxjl7W4o6cZ/mwTJZC8jeanKnfMWD6fCZHLonOA3S2LHds8/N1nE=
X-Received: by 2002:a17:907:1c28:b0:afe:d62a:f053 with SMTP id
 a640c23a62f3a-afed62af70bmr209509266b.10.1756362868057; Wed, 27 Aug 2025
 23:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250513101948.000036d6@linux.dev> <20250821030500.373806-1-dongtai.guo@linux.dev>
In-Reply-To: <20250821030500.373806-1-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 28 Aug 2025 14:34:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4_d3m+1=2-Syfg0mU5avV8t=AemyU-c=Gc=bD7xQE-uw@mail.gmail.com>
X-Gm-Features: Ac12FXx7LIkOTYf2Up48vsCGEgCPJSyrzS805lFr8Jk945we_DmINQR-T_s8LEc
Message-ID: <CAAhV-H4_d3m+1=2-Syfg0mU5avV8t=AemyU-c=Gc=bD7xQE-uw@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: mm: remove redundant pte occupancy check in __set_fixmap()
To: george <dongtai.guo@linux.dev>
Cc: kernel@xen0n.name, hengqi.chen@gmail.com, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, geert@linux-m68k.org, 
	guoweikang.kernel@gmail.com, loongarch@lists.linux.dev, 
	George Guo <guodongtai@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 11:05=E2=80=AFAM george <dongtai.guo@linux.dev> wro=
te:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> This check could falsely report errors when PTEs are remapped:
> arch/loongarch/mm/init.c:204: bad pte 0000000107b601c3.
>
> The check was unnecessary because:
> - Fixmap slots are designed to be reusable
> - Callers are responsible for proper mapping management
>
> Changes in v2:
> - modify commit messages
>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  arch/loongarch/mm/init.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> index c3e4586a7975..626c99b803a3 100644
> --- a/arch/loongarch/mm/init.c
> +++ b/arch/loongarch/mm/init.c
> @@ -192,10 +192,6 @@ void __init __set_fixmap(enum fixed_addresses idx,
>         BUG_ON(idx <=3D FIX_HOLE || idx >=3D __end_of_fixed_addresses);
>
>         ptep =3D populate_kernel_pte(addr);
> -       if (!pte_none(ptep_get(ptep))) {
> -               pte_ERROR(*ptep);
> -               return;
> -       }
This only makes sense if we have FIX_TEXT_POKE, if without it, fixmap
won't change at runtime.

Huacai

>
>         if (pgprot_val(flags))
>                 set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> --
> 2.34.1
>
