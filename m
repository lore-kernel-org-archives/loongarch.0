Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5A72397B0
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046275; cv=none; b=uwj0HtWrXRkkE4bkpHjMBTZ0j+PW+fViBn0PNSp8sZTvyOQQeLCa0ySVK8BvFC8zCEvvPBGU31cJ6+EplBIO1uRdGf+jVjUIx7H+gqiEvwyogfMS9hESLHjP/OitGovoPCI6NPgQ6rhttkFa4Cj4+y8KS6jy/Q9EeiM/UYBRoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046275; c=relaxed/simple;
	bh=cxwVxt7AXhTCwBVtm7LVh36MZ/2nhUco0/ReA/YOTOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0bJPwKqV57UCB32VM06ZKxYHdnpCZ9uDdKCSZaaQfMB31RSeQzTa6fQlcF9a5JTH78bWmZfuWvgd4te0Q7dx+XK8W1bCEjp2pCT+Uk7SE1DsYTqE+8JvACVeB5NQVC6pOnpkzx602S9BpiQcHEDSR9/qGCavhpALjA0nNqT8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyGPXKDA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyGPXKDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF26C4CEEF
	for <loongarch@lists.linux.dev>; Wed,  4 Jun 2025 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749046275;
	bh=cxwVxt7AXhTCwBVtm7LVh36MZ/2nhUco0/ReA/YOTOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iyGPXKDAC7PlXIm2HDKSGNsrGkuuAEYgNFkPhCGMVprCnctbUTRbgpftE95f8rDUb
	 ksyA7c5qh3B/1r+j6pFzZ52LkbRNmiHhHdJqYj6Nm0BIhWWtZrXy4rNff0uDsgmnFy
	 cET4nm/HyW/wCuOrllsKQrhP86w8v5cRyccFBIkHHFJQOxRPHTUCnxyWy9dbgN85Dn
	 6MuyXIkvOc4m2nhqePti1bswl/T2xA4uXUIi+QyIm1/IN8phCweSIArHBVaYghtsau
	 uP/qunteaW/P4KvmbArOs+mKZ4nMIk2nXpuI1XIvJ7FCCpl9AMxjcuVVAt1AglbPFw
	 3ETNHaqoLStLA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so12083973a12.3
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 07:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0ur2iG7oOE9PqaB8ittNMugsm+xNUxpnvr0L6yx5Hj3vHjtCxNkh412fk+HVguP1B2jHGb/HCnqo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVfxiEBjCkpyejrw2h8JjuNThrUBACrYYNNdi02sXrM5+1y8UJ
	WIOU9A1fAxjaIuZnjB92TF6Hcn4voJg/koVh4z3d1P+rXTb8U4uAU29+wKNfqQj/gUhUIFR5jW6
	3hP5OY3rrE/pl7K4LTHrifxlbVmcLo84=
X-Google-Smtp-Source: AGHT+IG3rypmG89aVxKI+FXVftURLGFhsucH3kSLKFF5FCwocsYo859IxK5aLGNpBJzxGkYCyFuQY15TeWJrkZ2pdUA=
X-Received: by 2002:a05:6402:4303:b0:607:f1c:bfed with SMTP id
 4fb4d7f45d1cf-6070f1cc298mr734029a12.12.1749046273473; Wed, 04 Jun 2025
 07:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604065647.113148-1-lijun01@kylinos.cn>
In-Reply-To: <20250604065647.113148-1-lijun01@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Jun 2025 22:11:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
X-Gm-Features: AX0GCFsfee1klIWvJzxKKbOCEjksiHbw_y_wDLRu1XV1YZo_OsyS6SdQZR-JD9Q
Message-ID: <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: kgdb: remove unnecessary init variable
To: Li Jun <lijun01@kylinos.cn>
Cc: si.yanteng@linux.dev, kernel@xen0n.name, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 2:57=E2=80=AFPM Li Jun <lijun01@kylinos.cn> wrote:
>
> The compiler generates initialization instructions,
> which consume additional CPU cycles. the
> get_step_address(regs, &addr) should assign a value
> to 'error' before it is read.so the var don't need init
> to 0.
Why do you think the compiler generates initialization instructions,
have you found any difference in the binary after your patch?

Huacai

>
> Signed-off-by: Li Jun <lijun01@kylinos.cn>
> ---
>  arch/loongarch/kernel/kgdb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> index 7be5b4c0c900..df85d6a0dc74 100644
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -379,10 +379,9 @@ static int get_step_address(struct pt_regs *regs, un=
signed long *next_addr)
>
>  static int do_single_step(struct pt_regs *regs)
>  {
> -       int error =3D 0;
>         unsigned long addr =3D 0; /* Determine where the target instructi=
on will send us to */
> +       int error =3D get_step_address(regs, &addr);
>
> -       error =3D get_step_address(regs, &addr);
>         if (error)
>                 return error;
>
> --
> 2.25.1
>
>
