Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552323ABB9
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 00:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304264; cv=none; b=WR955jgiYcnkvzi+MB/+S2mfZEr9v7BKD2lJXOCmpZ5UZnFJpWF/Q30MRvYuag2M/DLkseDEtymiAgXklx8VtwtXvBEr6cVma5HxjzXDV2hmM/EiE3dIr5B588/f55HUid8oRMP/U/CiKvsAGaG+YkC4KywEr09k/++qs8vFLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304264; c=relaxed/simple;
	bh=R2ULzT1ROAc+gRabXR8qulIwfehavOiQo/epHX3nGp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozXbPhHvNj5yP4a2NE3pOYC51sI+wnWfxch4fNDNhvDaxpH8wiHgYRzOFnAvKh1OTENkoVDFiWE/9WfyWvfLs9m45nt8VGrCcB4+QBI40BDju5UWAfuy9giTFfY4vejk5wE9uCutLfkQZD/0sEpS6PgHtDKV4gCImNANo9ujL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hev1h5RO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hev1h5RO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAABC4CEF7
	for <loongarch@lists.linux.dev>; Wed,  5 Nov 2025 00:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762304263;
	bh=R2ULzT1ROAc+gRabXR8qulIwfehavOiQo/epHX3nGp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hev1h5ROmIbMiLPtfKE0cvZnXsjyedxjgg0zm33Aq8jwyHBrB4wqRUkp8LJ9V4mJk
	 5jhfo5QRp96euk+3aKfcMbLA8+T0o1TTwQw5PjnR+cTIso5JPCgNumJ/1GAV0ofxfv
	 BDXRM7smhxGXXOJIoBUyNrEZH00gqV4RW9Cb2ZoBWNVF+DkRtnjaPRetqsxW4jgy5S
	 iZSJ6rOtrBjI5lBp4kFSC+PJEOygZjLmIU3d+NavTaUDGqA3l5iSjgOtKuqCrX8FDg
	 Vk2pTOrcj7abri45GIzhyxPqFcDWwepjNleFbyKt0PUNJMAbzgU30e7ldcXAAMgRpB
	 dUjjx5mgLIDUQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso75493566b.0
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 16:57:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfxbNKze+z94zs/UqTC4BENtnd2mGoykD9D0DyJmKW+sDibpcUPdXZrFtr1rTRDDyYgAX66Vi6Q18=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNKv9uBm87EhRq2A5Rhu/Kg8vPgQFKOmeDHgth6szclH69W1Wg
	oURMQqYWYjlTclm5uMuHQJXdMtwzO+MfpSOlC5mik4qLiC8hzuoyMQahlNcYP8e4eyjw6iwo3MP
	8kqYEt8utKunTsyfcXg6FBJYsQUSjq08=
X-Google-Smtp-Source: AGHT+IFeSBz7bs7u6rpSq+7VUa+zA4NlZ7MicraxVhwXsZ5G8cD5YwakyzfR7Z47dnQv1J0fLwegTPshYCmveN0pHmc=
X-Received: by 2002:a17:907:944f:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b7216f647f9mr566528666b.19.1762304262402; Tue, 04 Nov 2025
 16:57:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029153649.33345-1-b10902118@ntu.edu.tw>
In-Reply-To: <20251029153649.33345-1-b10902118@ntu.edu.tw>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 5 Nov 2025 08:57:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5E79jZ9rMYyP3h+KLX5rDGcB-Ec8WqyAhPC-pvuvv5UQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkNEemHAcWDyDDxk5bTowCAMrEyiXOGzsdx_zd4Dcx3GXm9MZaFWommniQ
Message-ID: <CAAhV-H5E79jZ9rMYyP3h+KLX5rDGcB-Ec8WqyAhPC-pvuvv5UQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: ptrace: Merge ptrace_hbp_set_*()
To: Bill Tsui <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, kernel@xen0n.name, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Wed, Oct 29, 2025 at 11:38=E2=80=AFPM Bill Tsui <b10902118@ntu.edu.tw> w=
rote:
>
> In hw_break_set(), those functions actually can be combined into one.
> This eliminates intermediate calls to modify_user_hw_breakpoint() that
> may leave hardware registers in a partially updated state.
>
> This redundancy was originally found in ARM ptrace, where it caused
> non-4-byte address alignment checks to fail.
>
> Link:
> https://lore.kernel.org/all/20251018133731.42505-2-b10902118@ntu.edu.tw/
>
> The LoongArch implementation appears to have been derived from ARM,
> so this refactor helps avoid the same issue and simplifies future
> maintenance.
What do you think about it?

Huacai

>
> Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
> ---
>  arch/loongarch/kernel/ptrace.c | 69 +++++++++-------------------------
>  1 file changed, 17 insertions(+), 52 deletions(-)
>
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrac=
e.c
> index 8edd0954e55a..c6cd51569a64 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -581,13 +581,15 @@ static int ptrace_hbp_get_addr(unsigned int note_ty=
pe,
>         return 0;
>  }
>
> -static int ptrace_hbp_set_ctrl(unsigned int note_type,
> +static int ptrace_hbp_set(unsigned int note_type,
>                                struct task_struct *tsk,
> -                              unsigned long idx, u32 uctrl)
> +                              unsigned long idx, u64 addr,
> +                                  u64 mask, u32 uctrl)
>  {
>         int err;
>         struct perf_event *bp;
>         struct perf_event_attr attr;
> +       struct arch_hw_breakpoint *info;
>         struct arch_hw_breakpoint_ctrl ctrl;
>         struct thread_info *ti =3D task_thread_info(tsk);
>
> @@ -597,6 +599,17 @@ static int ptrace_hbp_set_ctrl(unsigned int note_typ=
e,
>
>         attr =3D bp->attr;
>
> +       /* addr */
> +       /* Kernel-space address cannot be monitored by user-space */
> +       if ((unsigned long)addr >=3D XKPRANGE)
> +               return -EINVAL;
> +       attr.bp_addr =3D addr;
> +
> +       /* mask */
> +       info =3D counter_arch_bp(bp);
> +       info->mask =3D mask;
> +
> +       /* ctrl */
>         switch (note_type) {
>         case NT_LOONGARCH_HW_BREAK:
>                 ctrl.type =3D LOONGARCH_BREAKPOINT_EXECUTE;
> @@ -623,46 +636,6 @@ static int ptrace_hbp_set_ctrl(unsigned int note_typ=
e,
>         return modify_user_hw_breakpoint(bp, &attr);
>  }
>
> -static int ptrace_hbp_set_mask(unsigned int note_type,
> -                              struct task_struct *tsk,
> -                              unsigned long idx, u64 mask)
> -{
> -       struct perf_event *bp;
> -       struct perf_event_attr attr;
> -       struct arch_hw_breakpoint *info;
> -
> -       bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> -       if (IS_ERR(bp))
> -               return PTR_ERR(bp);
> -
> -       attr =3D bp->attr;
> -       info =3D counter_arch_bp(bp);
> -       info->mask =3D mask;
> -
> -       return modify_user_hw_breakpoint(bp, &attr);
> -}
> -
> -static int ptrace_hbp_set_addr(unsigned int note_type,
> -                              struct task_struct *tsk,
> -                              unsigned long idx, u64 addr)
> -{
> -       struct perf_event *bp;
> -       struct perf_event_attr attr;
> -
> -       /* Kernel-space address cannot be monitored by user-space */
> -       if ((unsigned long)addr >=3D XKPRANGE)
> -               return -EINVAL;
> -
> -       bp =3D ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
> -       if (IS_ERR(bp))
> -               return PTR_ERR(bp);
> -
> -       attr =3D bp->attr;
> -       attr.bp_addr =3D addr;
> -
> -       return modify_user_hw_breakpoint(bp, &attr);
> -}
> -
>  #define PTRACE_HBP_ADDR_SZ     sizeof(u64)
>  #define PTRACE_HBP_MASK_SZ     sizeof(u64)
>  #define PTRACE_HBP_CTRL_SZ     sizeof(u32)
> @@ -733,10 +706,6 @@ static int hw_break_set(struct task_struct *target,
>                                          offset, offset + PTRACE_HBP_ADDR=
_SZ);
>                 if (ret)
>                         return ret;
> -
> -               ret =3D ptrace_hbp_set_addr(note_type, target, idx, addr)=
;
> -               if (ret)
> -                       return ret;
>                 offset +=3D PTRACE_HBP_ADDR_SZ;
>
>                 if (!count)
> @@ -746,21 +715,17 @@ static int hw_break_set(struct task_struct *target,
>                                          offset, offset + PTRACE_HBP_MASK=
_SZ);
>                 if (ret)
>                         return ret;
> -
> -               ret =3D ptrace_hbp_set_mask(note_type, target, idx, mask)=
;
> -               if (ret)
> -                       return ret;
>                 offset +=3D PTRACE_HBP_MASK_SZ;
>
>                 ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &c=
trl,
>                                          offset, offset + PTRACE_HBP_CTRL=
_SZ);
>                 if (ret)
>                         return ret;
> +               offset +=3D PTRACE_HBP_CTRL_SZ;
>
> -               ret =3D ptrace_hbp_set_ctrl(note_type, target, idx, ctrl)=
;
> +               ret =3D ptrace_hbp_set(note_type, target, idx, addr, mask=
, ctrl);
>                 if (ret)
>                         return ret;
> -               offset +=3D PTRACE_HBP_CTRL_SZ;
>
>                 user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
>                                           offset, offset + PTRACE_HBP_PAD=
_SZ);
> --
> 2.51.0
>
