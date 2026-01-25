Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213718D658
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769314072; cv=none; b=uvEh+dLS/wj4OH9Q3Ixc4dXMk9BYSEcH+XxBP7llKAEFtFUqM0sN/8RphNZnWXbJ4QDiWCcfM7ADtrLilk9gDubBT6KpmznyCyt3oB8Ast2AJ5VUDgmJyCrtSJKGj1Rr4BLQJXfhVdT+XekBmQlXSOOEqRJ7FcUU9MVExJZ/7hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769314072; c=relaxed/simple;
	bh=6HMFheNv90M6EQv7Fin6Cqnf+zRs21vr9eimTrD5qAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMxU9KQFUBx3mu+A6uLKy+RJPq1OECupidD1FtUhPD6qIlkJ8j/cHwarxe7uIQMnaVASRIE0oXVIu0O4/5e9kraecyf71cIKEAM1dRbnMfB1MlpDsTyn+Y/hfd35XEpzS7ufdv2h+FZaURPJNq47Rz1nAFZ4GBbHIptSsRm3fP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaAjs3hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaAjs3hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC510C2BC87
	for <loongarch@lists.linux.dev>; Sun, 25 Jan 2026 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769314071;
	bh=6HMFheNv90M6EQv7Fin6Cqnf+zRs21vr9eimTrD5qAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QaAjs3hqvNSnRZzc1G46hhoPYctxjJtkPgCoK4VLEUIDMu+TG9USQKJOdp5I8+RTj
	 zTQQaoe2JlVeYxOrrgm7LN/pu8bW2UXjZ3usqbirgEyn+m+GVmOvrfVmp+vjuaBi05
	 3zbKnnq6CKZKHBsFxq7nxygBttn8Lw91pBN2PkynEZX68I2gEBvcWkIPXIj+xkgxwE
	 XxbXnUGgkzUVeve5CbYqwKQ1yR8au/t+vchzDr+Tr37ct2stinmNAUkS3QI1vf3KrJ
	 66a6MXsyaZgyoqK879VEzMNpM4e4ci+hWTBPtfGQqq7zjmK7rzYQxKxM2pl+EfYqnS
	 M6cFcKO4s4OoA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so6231368a12.1
        for <loongarch@lists.linux.dev>; Sat, 24 Jan 2026 20:07:51 -0800 (PST)
X-Gm-Message-State: AOJu0YxLRVOfXltMQkwrybq5/xcGteN7pyi7CWjHDI2RtScFDkafiZJF
	U8W5vxpnmKXj5ob0c/Mvf8f+6nvIlLYnnXrtlqzefA5xf57ckSoMBulFDqcDYM9o0G1Vkj5oVLo
	csauL6fUvSf26b2DdifB7jTokk8uVSFw=
X-Received: by 2002:a17:907:3e1a:b0:b87:35f:fa3 with SMTP id
 a640c23a62f3a-b8d3fa43e5dmr32999966b.16.1769314070444; Sat, 24 Jan 2026
 20:07:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122105636.89985-2-clopez@suse.de>
In-Reply-To: <20260122105636.89985-2-clopez@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 25 Jan 2026 12:07:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ffQ7zntWP16wRFP2gdd_RxBcBT0O==QKxOXVoHbiwtw@mail.gmail.com>
X-Gm-Features: AZwV_QhFOkNCxzf8D16wZs6PtgbrQDt37HCYjwFOVZz5StqT3euFb1xMxqjIb5I
Message-ID: <CAAhV-H6ffQ7zntWP16wRFP2gdd_RxBcBT0O==QKxOXVoHbiwtw@mail.gmail.com>
Subject: Re: [PATCH] loongarch/kgdb: use IS_ERR_PCPU() macro
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Jan 22, 2026 at 6:57=E2=80=AFPM Carlos L=C3=B3pez <clopez@suse.de> =
wrote:
>
> In a759e37fb467 ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and
> IS_ERR_PCPU() macros"), specialized macros were added to check an error
> within a __percpu pointer, so use them instead of manually casting
> with __force, like all other users of register_wide_hw_breakpoint().
>
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>
> ---
>  arch/loongarch/kernel/kgdb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> index 7be5b4c0c900..17664a6043b1 100644
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -697,7 +697,7 @@ void kgdb_arch_late(void)
>                         continue;
>
>                 breakinfo[i].pev =3D register_wide_hw_breakpoint(&attr, N=
ULL, NULL);
> -               if (IS_ERR((void * __force)breakinfo[i].pev)) {
> +               if (IS_ERR_PCPU(breakinfo[i].pev)) {
>                         pr_err("kgdb: Could not allocate hw breakpoints.\=
n");
>                         breakinfo[i].pev =3D NULL;
>                         return;
>
> base-commit: a66191c590b3b58eaff05d2277971f854772bd5b
> --
> 2.51.0
>
