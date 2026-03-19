Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A718DF9D
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909058; cv=none; b=A5STp+kaRz6zsz0UANX7lIErEwSCz+js3WIF/I4mdzMM88/i3JXslnkgmgYdiF+yEreXEoNpF3YFfzRv5geXntt6vIfUseoa+tyi6iaFLeUIfQ8p8wltogoX9h9voMY6GZ84qVxrn2GZ1vd/JvtQXUZlmesKOkV6u4qMIxFxYw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909058; c=relaxed/simple;
	bh=/q62PxMTwT8xTvQD9mbJt20RvM+TuFD0D4p633toAWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuqTrtdaSHYr9Fk67usr8PCoDQx4IkbfJS7RCQFOTE/fGkPszz+JinvocJpbzjc+uEz1je2iHfMrOOOgF8LJurmbX5wRg9ZtsE+6USycKWQbbiFu/yQiGVdp24vdkPaccy3Qdkp+0+qmN2bvPA6DOplSoxRQZAT0no7z7nQ5Fvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t2DZVNKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2DZVNKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF46C19424
	for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773909058;
	bh=/q62PxMTwT8xTvQD9mbJt20RvM+TuFD0D4p633toAWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t2DZVNKlagBCDHbonduEI4J7GfFxGmiA3e/ZNhFT3tX28YkjFfQkV9a8tJa8NqjxX
	 Za9PBJXmnxm62V9e2/Andq4Wiwq8g5jhmDuQlNxdJ5QvFGKqci/WkqUuVmDxLpPeHw
	 HfhC0QOxE97mOmaChLRA8GGVxDBTIXFjZ4lbfCfUCg24JjuwGTrpaNijicHIw3LsSP
	 XNEO0WK4fqQkNpvryhx+5DeW+dM80tNLWzXF5QnCtEYOERIZAWoSJslrBKsYQqHSz1
	 A1altDBa3Jf6bfreah2mC82tk01hOFOZYXqj/4YSrKn8CwkKbXU654S7DITkzCsTwz
	 XhWpy+ZsGMb1Q==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso101335966b.0
        for <loongarch@lists.linux.dev>; Thu, 19 Mar 2026 01:30:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLc+gxnk6iLXn/qs1V5oUslerUv9ZreEoOsFP+0KwyWivLmzNR
	AicDA9r8LY9J++Sndq50iBnLfyy7epGUzQ3C6VozW6y4BKpmyrjrhBmTy4h1ouvEEC1ZRnfWkvI
	SpMsoefnN+m5LYHpvsXRJ7TKr1lRsS5c=
X-Received: by 2002:a17:907:a0e:b0:b97:f28c:fea6 with SMTP id
 a640c23a62f3a-b97f486677amr378433166b.8.1773909057032; Thu, 19 Mar 2026
 01:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318151821.190439-1-lorenz.hetterich@cispa.de> <20260318151821.190439-3-lorenz.hetterich@cispa.de>
In-Reply-To: <20260318151821.190439-3-lorenz.hetterich@cispa.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 19 Mar 2026 16:30:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H42kvs79-bTR+E-89Lthb9F=o8P4_q7ZYwMgEyjywT+kw@mail.gmail.com>
X-Gm-Features: AaiRm50P3vZqGEH5Ll1n0yExG9Wjsm4WR0u16113GSWzGvK5_HqpZXZrni-zGeM
Message-ID: <CAAhV-H42kvs79-bTR+E-89Lthb9F=o8P4_q7ZYwMgEyjywT+kw@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: Set FAULT_FLAG_INSTRUCTION in __do_page_fault()
To: Lorenz Hetterich <lorenz.hetterich@cispa.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Lorenz,

On Wed, Mar 18, 2026 at 11:18=E2=80=AFPM Lorenz Hetterich
<lorenz.hetterich@cispa.de> wrote:
>
> The page-fault handler never sets the FAULT_FLAG_INSTRUCTION flag.
>
> Set FAULT_FLAG_INSTRUCTION for faults related to instruction fetches.
>
> Signed-off-by: Lorenz Hetterich <lorenz.hetterich@cispa.de>
> ---
>  arch/loongarch/include/asm/exception.h | 3 +++
>  arch/loongarch/mm/fault.c              | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/exception.h b/arch/loongarch/incl=
ude/asm/exception.h
> index c6d20736fd92..7305b7065a43 100644
> --- a/arch/loongarch/include/asm/exception.h
> +++ b/arch/loongarch/include/asm/exception.h
> @@ -6,6 +6,9 @@
>  #include <asm/ptrace.h>
>  #include <linux/kprobes.h>
>
> +#define EXC_PIF        3  /* Page Invalid Fetch */
> +#define EXC_PNX        6  /* Page Non-eXecutable */
Needn't, you can use EXCCODE_TLBI/EXCCODE_TLBNX in loongarch.h directly.


Huacai

> +
>  extern void *exception_table[];
>
>  void show_registers(struct pt_regs *regs);
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index c7703bdec4fc..7cd422c1224e 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -215,6 +215,9 @@ static void __kprobes __do_page_fault(struct pt_regs =
*regs,
>         if (user_mode(regs))
>                 flags |=3D FAULT_FLAG_USER;
>
> +       if (current->thread.trap_nr =3D=3D EXC_PIF || current->thread.tra=
p_nr =3D=3D EXC_PNX)
> +               flags |=3D FAULT_FLAG_INSTRUCTION;
> +
>         perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
>
>         if (!(flags & FAULT_FLAG_USER))
> --
> 2.43.0
>
