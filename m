Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109682C235B
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763095304; cv=none; b=nsjjsXgTOU+LuWjGnJqe36g186E6N1dFn96IhKljSciUol14+8cycCazt4OD6ecuMDJfh5oYydsl28FeP+mFox1SmTDV3diHipCo90OX3wtadGHYC7OkGnFm39sObBjSXyp1q63JkIsCNh5X2sbxpuI/zEN6HN/by1pRYLSRZQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763095304; c=relaxed/simple;
	bh=BP+lvYlPCIMGqHCye6E4q3NRRLNjbP1zDW3bstDguOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAZLI8h3m3CjCPUeeEyqGOf448joCNGIYYoEGAApa2XW+yV/n6lQ/YPdykdpHnoWIJzbf9nfbeHZmclgMtCOWMHj+M4PPJ0tShV7O7QdImVcS4jL+lAXQNxnWD8lolcYREtV2tuvVbg1QgaKXAcmaD0YPs9Xt0TeZFO2nTY4tCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWCwvSG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWCwvSG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DCDC4CEF8
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 04:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763095303;
	bh=BP+lvYlPCIMGqHCye6E4q3NRRLNjbP1zDW3bstDguOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cWCwvSG4G2rO6gi/gtoNmi21AXNu3HrbwqrmBrWSkmOXBdD9OMUa8euqNZgRs/DbF
	 sVkCQ5T9/yokFhv3YNowIbLyKpG7n2NhFStUZDcfgb/e7oHVoVGykmt6kREWp0gVXu
	 CDeXr1rT/NIJjLSh14WEUmCNAHtfYvN0u/Kf+3khmxXGFSWfj2f6hXSkwa2wmfqkGJ
	 suAyOb86UVtpC8FSAGrSlOuyX9PQmYYMHxaNdisoxq2emzxTVa2dOOmhUWxTFl/jM5
	 T3j67rzComUDqjiQjMK6qLdLWNHBheVHUO32suZbjeWrTrOjVGNrztBT2DAAmR6zH5
	 PVBbRYaf0loMQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73161849e1so261086466b.2
        for <loongarch@lists.linux.dev>; Thu, 13 Nov 2025 20:41:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9xqENReaTi4N6uOmACLQJ0Ns647PJszeYHnLEbxaDS0Dk0erVE8TDWKvLmCl23gRKY0WOp832m/w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxDGgkOef7RlDa46K0WQS28juvB5u/xyjsAK93mK1UNRlxgrvP
	5PW2ADso51hLj8oY4nwIYqx7+Ef9RuaROiWgE+dZz5b3u2hbIPO8vLeTzImY6+T1gQp6x8YEgnV
	aPzdPDvuQ5lVsWnayxhXq6/FZQuziLTo=
X-Google-Smtp-Source: AGHT+IGx348Z9htXNxF4A/qY236O4tQzxjSaA4OkaSP2ypZco6YPOFXPsEF0rxUA1gfGw/GdHTWDK3b/pU7VCRxOJ4c=
X-Received: by 2002:a17:906:d9b:b0:b73:68b3:bd2f with SMTP id
 a640c23a62f3a-b7368b3c0fdmr102135666b.40.1763095302264; Thu, 13 Nov 2025
 20:41:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029-loongarch-uapi-ptrace-types-v1-1-5c84855a348d@weissschuh.net>
In-Reply-To: <20251029-loongarch-uapi-ptrace-types-v1-1-5c84855a348d@weissschuh.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Nov 2025 12:41:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7smLd-Zn_kZZMpki6DzV+5905gSYs1EuL+ppYek4-iag@mail.gmail.com>
X-Gm-Features: AWmQ_bkF9RXRJigD75F7CCeZB90W0XCodKwH1y7I4uD2XBzvbYzop4Gv0GL92Qg
Message-ID: <CAAhV-H7smLd-Zn_kZZMpki6DzV+5905gSYs1EuL+ppYek4-iag@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: ptrace: Use UAPI types in UAPI header
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Oct 29, 2025 at 11:20=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> The kernel UAPI headers already contain fixed-width integer types,
> there is no need to rely on libc types. There may not be a libc
> available or it may not provide <stdint.h>, like for example on nolibc.
>
> This also aligns the header with the rest of the LoongArch UAPI headers.
>
> Fixes: 803b0fc5c3f2 ("LoongArch: Add process management")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> I'd like to take this through the nolibc tree, as this currently breaks
> the upcoming nolibc ptrace support.
> ---
>  arch/loongarch/include/uapi/asm/ptrace.h | 40 ++++++++++++++------------=
------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/arch/loongarch/include/uapi/asm/ptrace.h b/arch/loongarch/in=
clude/uapi/asm/ptrace.h
> index aafb3cd9e943..215e0f9e8aa3 100644
> --- a/arch/loongarch/include/uapi/asm/ptrace.h
> +++ b/arch/loongarch/include/uapi/asm/ptrace.h
> @@ -10,10 +10,6 @@
>
>  #include <linux/types.h>
>
> -#ifndef __KERNEL__
> -#include <stdint.h>
> -#endif
> -
>  /*
>   * For PTRACE_{POKE,PEEK}USR. 0 - 31 are GPRs,
>   * 32 is syscall's original ARG0, 33 is PC, 34 is BADVADDR.
> @@ -41,44 +37,44 @@ struct user_pt_regs {
>  } __attribute__((aligned(8)));
>
>  struct user_fp_state {
> -       uint64_t fpr[32];
> -       uint64_t fcc;
> -       uint32_t fcsr;
> +       __u64 fpr[32];
> +       __u64 fcc;
> +       __u32 fcsr;
>  };
>
>  struct user_lsx_state {
>         /* 32 registers, 128 bits width per register. */
> -       uint64_t vregs[32*2];
> +       __u64 vregs[32*2];
>  };
>
>  struct user_lasx_state {
>         /* 32 registers, 256 bits width per register. */
> -       uint64_t vregs[32*4];
> +       __u64 vregs[32*4];
>  };
>
>  struct user_lbt_state {
> -       uint64_t scr[4];
> -       uint32_t eflags;
> -       uint32_t ftop;
> +       __u64 scr[4];
> +       __u32 eflags;
> +       __u32 ftop;
>  };
>
>  struct user_watch_state {
> -       uint64_t dbg_info;
> +       __u64 dbg_info;
>         struct {
> -               uint64_t    addr;
> -               uint64_t    mask;
> -               uint32_t    ctrl;
> -               uint32_t    pad;
> +               __u64    addr;
> +               __u64    mask;
> +               __u32    ctrl;
> +               __u32    pad;
>         } dbg_regs[8];
>  };
>
>  struct user_watch_state_v2 {
> -       uint64_t dbg_info;
> +       __u64 dbg_info;
>         struct {
> -               uint64_t    addr;
> -               uint64_t    mask;
> -               uint32_t    ctrl;
> -               uint32_t    pad;
> +               __u64    addr;
> +               __u64    mask;
> +               __u32    ctrl;
> +               __u32    pad;
>         } dbg_regs[14];
>  };
>
>
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251029-loongarch-uapi-ptrace-types-0c5c6756f7e0
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
>
