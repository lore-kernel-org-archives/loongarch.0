Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB352D0C9C
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014822; cv=none; b=Nqntw49qpaNbVWKkwCGzvY5SKHcR29b1ifU9QaR+07rZUmZYHxrXOkDt8GnpCWscgtfY3EJZH6hgOL7pnSTz8NTkBCaR6TN/hrTmNDA3STkcSEu0F1WosJYDbxho4MUJOzcRhECMw/MvpSMh7AB4ppSO97D+L41OB4Plb10N9nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014822; c=relaxed/simple;
	bh=vs851JD4YJi5quwSJgEAPXIFVvfTEnRrWa8rETGfOVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quXzeZOMioOh3u8WWDPK1TBYCBoeLOYb+Fr+UP/Vi1aHCn4DA8i8unYhFtdIznQ6PgY1qLlHYJ+vo2Cossve+/g+m8XidgykLltBLXiNgjp2KmpzZd1ggtB0uidHqCyVjWq2BoMWR/y8pxK4/E+A9UXze4vH37bHzTYAus1yOnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6wqIJok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6wqIJok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90657C4CEF7
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014821;
	bh=vs851JD4YJi5quwSJgEAPXIFVvfTEnRrWa8rETGfOVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n6wqIJokwGAWW/QUCOGB3PLumL7zEPXkPX4KaY9AnhSFkPT+wFj+mwr25lmh3ErnF
	 Hyvs/OHqCIvqk7+aIj03B0KLdjNZJwBltdJctHP5Hqb7rjC35RLNPtuHjy5pThFP8o
	 /+aATiHohah+VWBY3nE1CeBg4YYchlRgQINtKKEBXuZKxVCPbynfybjZbsJkHtT05j
	 8ZmHSez4xvtbI7eU24PeePB29gH5v9xkOaM15eycMQ+c2kV0RNyS/OKsG1drl7arWo
	 SpCyvAOU6JjG6KAiOsPWYrHrNd9fb711+3ekPS8RZFsDAMFjK/Qkjli2skL1wTMR7s
	 +bDEHWdKF+WsA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so9621709a12.3
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 05:27:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxSzKAFiGxICqeoCVfLVnb343fklg30YOkFpVCUl4wi0OyHZZUy
	qtW4kI1vOODhMmVOyk+COD0VD8FeNzEP7rak/1e3M0n6xTeJgBEBzqfxqVqXNEcI0uMl1Tb43nX
	XYSfuTecpZ6pI/R/PaXNKW38L5CHieD8=
X-Google-Smtp-Source: AGHT+IFI7afL8xJwAO5NxvKriB4EkV+N3OT9Ea5U7UBwtjYUoW02clgoZRhsEuA9kKBQJzRM8lPwW3dgffbxVaEtao4=
X-Received: by 2002:a17:906:4fcd:b0:b83:3716:cf8d with SMTP id
 a640c23a62f3a-b833716e513mr1219193666b.42.1767014820183; Mon, 29 Dec 2025
 05:27:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216015327.7313-1-yangtiezhu@loongson.cn>
In-Reply-To: <20251216015327.7313-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 29 Dec 2025 21:26:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WVdR+M3QmQfr3NhsCzEzmcs_5X8gbOkfhPaaTGmzR2Q@mail.gmail.com>
X-Gm-Features: AQt7F2rKxRtvUCLTf19LfGtxf_NFOqoyUaIRvt5N3hhfwrE5mmaQCdhsFqBgvgc
Message-ID: <CAAhV-H7WVdR+M3QmQfr3NhsCzEzmcs_5X8gbOkfhPaaTGmzR2Q@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Remove some checks for ORC unwinder
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Dec 16, 2025 at 9:53=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> According to the following function definitions, __kernel_text_address()
> already checks __module_text_address(), so it should remove the check of
> __module_text_address() in bt_address() at least.
>
> int __kernel_text_address(unsigned long addr)
> {
>         if (kernel_text_address(addr))
>                 return 1;
>         ...
>         return 0;
> }
>
> int kernel_text_address(unsigned long addr)
> {
>         bool no_rcu;
>         int ret =3D 1;
>         ...
>         if (is_module_text_address(addr))
>                 goto out;
>         ...
>         return ret;
> }
>
> bool is_module_text_address(unsigned long addr)
> {
>         guard(rcu)();
>         return __module_text_address(addr) !=3D NULL;
> }
>
> Furthermore, there are two checks of __kernel_text_address(), one is in
> bt_address() and the other is after calling bt_address(), it looks like
> redundant.
>
> Handle the exception address first and then use __kernel_text_address()
> to validate the calculated address for exception or the normal address
> in bt_address(), then it can remove the check of __kernel_text_address()
> after calling bt_address().
>
> Just remove unnecessary checks, no functional changes intended.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 0d5fa64a2225..fe4fe5f266b9 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -360,12 +360,6 @@ static inline unsigned long bt_address(unsigned long=
 ra)
>  {
>         extern unsigned long eentry;
>
> -       if (__kernel_text_address(ra))
> -               return ra;
> -
> -       if (__module_text_address(ra))
> -               return ra;
> -
>         if (ra >=3D eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
>                 unsigned long func;
>                 unsigned long type =3D (ra - eentry) / VECSIZE;
> @@ -383,10 +377,13 @@ static inline unsigned long bt_address(unsigned lon=
g ra)
>                         break;
>                 }
>
> -               return func + offset;
> +               ra =3D func + offset;
>         }
>
> -       return ra;
> +       if (__kernel_text_address(ra))
> +               return ra;
> +
> +       return 0;
>  }
>
>  bool unwind_next_frame(struct unwind_state *state)
> @@ -512,9 +509,6 @@ bool unwind_next_frame(struct unwind_state *state)
>                 goto err;
>         }
>
> -       if (!__kernel_text_address(state->pc))
> -               goto err;
> -
>         return true;
>
>  err:
> --
> 2.42.0
>
>
