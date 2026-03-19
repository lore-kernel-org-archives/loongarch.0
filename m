Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B418DF9D
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909053; cv=none; b=FTQDDFO/iBNMdkapjYTrbWO27XiHVVFmjykcxvjX5dzBZnMl3jrm7jfKh1FblDgW57L5lLoGSKI/CTJkDuvXQEirfmUjgBB92uOrhKTlc3zIUh7sng/OWORDCJX1esdKW626BNlUp6C9/DhOmNsq/sl3j+45PO94iaV1uggmu7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909053; c=relaxed/simple;
	bh=pPhB3x1zhi2ZWSpZK+uJgszcaFeZzpVG3AzzYkK7IWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpIAr11dSI9U+hvzVIOGc9dz905QiccEQZChAy8gJaALUM6Bt+u/IeIjUxKkSnLWJgaBaphPCmPU3DS+J4q8pd4BJFCncIFjkJjeV22BDugq/gSh4yryXCYWAa2p0VRXDU1tsBiMJpK5F1xUB2t+A18xUzEVlthTEz1jAirxBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tD3QeISJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tD3QeISJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0766C19424
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773909053;
	bh=pPhB3x1zhi2ZWSpZK+uJgszcaFeZzpVG3AzzYkK7IWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tD3QeISJCvfZA7kBcZQUhxjP5SFMinY+QX4tc3yXOm1LjMyopwty3f1RkSwIMJSW3
	 ej2DjFyetujXmm188l6ASreULsab9uvBTV77Yaep+EVKuS4GifI1ascHMFGO+/iMZo
	 CMV/KELowwoGv92OAlIuFprWIInp37WL4AfKFq8ocaEHp7M7O6jo7bvkVQElaAFBdF
	 GGX6oFXSpBRCn2e26K2HcnzgnaWOaqoyH/qQOh1D88Wxg1zDldn18xTj/tpNCgfXI+
	 tFH9KF4aVPNjxZTr+Ejjx3pegYhmNCZe5OpFXA3iZEiApHokPKbsu8YaM0X7L4SLbV
	 XFux58Ol3XjIw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f9568e074so97141466b.0
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 01:30:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz6enuEzSeVFl3TxGcxgJmggBRp1BZ+Uo9o5qvvcS9Q24/c6iJH
	v5qA3GVSW5mGUzZnc9OTqwnsKbYAkiDV1g3pj+Xfn/mvzAIkl85aXdu7O5jr/EEAfIeutSm4NyX
	w/ZGB88N0EN1RjLY5leTGXDZeTGAtWAc=
X-Received: by 2002:a17:907:a06:b0:b97:d55a:cd6b with SMTP id
 a640c23a62f3a-b97f498c190mr389278666b.29.1773909051544; Thu, 19 Mar 2026
 01:30:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318151821.190439-1-lorenz.hetterich@cispa.de> <20260318151821.190439-2-lorenz.hetterich@cispa.de>
In-Reply-To: <20260318151821.190439-2-lorenz.hetterich@cispa.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Mar 2026 16:30:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5pM0Rx2kZOJ69mrCK313D9Vd4qi3HCe_zC-F4q8Xft_Q@mail.gmail.com>
X-Gm-Features: AaiRm52CkJdD-Yis23GI4rDHu6_Iy31XVC2_LKllcymqQOBBLNYJc-lMiudG4Es
Message-ID: <CAAhV-H5pM0Rx2kZOJ69mrCK313D9Vd4qi3HCe_zC-F4q8Xft_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Loongarch: Fix stale value in __do_page_fault()
To: Lorenz Hetterich <lorenz.hetterich@cispa.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Lorenz,

On Wed, Mar 18, 2026 at 11:18=E2=80=AFPM Lorenz Hetterich
<lorenz.hetterich@cispa.de> wrote:
>
> __do_page_fault() calls kprobe_page_fault without setting
> current->thread.trap_nr first.
> Hence, kprobe_page_fault is called with a stale trapnr.
>
> Set current->thread.trap_nr before calling kprobe_page_fault.
>
> Signed-off-by: Lorenz Hetterich <lorenz.hetterich@cispa.de>
> ---
>  arch/loongarch/mm/fault.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index 2c93d33356e5..c7703bdec4fc 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -182,6 +182,7 @@ static void __kprobes __do_page_fault(struct pt_regs =
*regs,
>         struct vm_area_struct *vma =3D NULL;
>         vm_fault_t fault;
>
> +       current->thread.trap_nr =3D read_csr_excode();
>         if (kprobe_page_fault(regs, current->thread.trap_nr))
>                 return;
kprobe_page_fault() doesn't really use trap_nr, but this doesn't mean
this patch is useless, at least the second patch need this one.

But you can remove "current->thread.trap_nr =3D read_csr_excode()" in
do_sigbus() and do_sigsegv() at the same time.


Huacai

>
> --
> 2.43.0
>
