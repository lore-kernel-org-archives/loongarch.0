Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C13E18C91F
	for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662480; cv=none; b=lXK3B7gtzCoPUmhQApE36vaVl6Wz/CzWbL2RtX/Nyt65La1TA18S0CIGm+sA5gRFbP4YSxRUN9F9g4UJVZ756FF5+W5nEy1i2XPzkzJZF5ddbbUEQaymUQJODLBqIlXRUDfOaOu5LwQWnWex5mCuk0iENr622tezPievti06qpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662480; c=relaxed/simple;
	bh=7iUIwNzlYmvXp7hwThAllikHvzT/UtKTKKu+tu2ruis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSh56nVl/3OOv2gv7Le2xbAp/IPU435hfK1w1N3FxgTI/n4ah80ysVzYQknJQaFiKhpbGPi7CrhpxPOnihV+K2dgl1WWCvJ2InDkYr0hV26CCNZvj1XKQYtxq94hNKCDDrUMKyrYpRTYWFQLZC0PyC+JjHATUfUIExeHILWa4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPDANzru; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPDANzru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7B9C4AF09
	for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662480;
	bh=7iUIwNzlYmvXp7hwThAllikHvzT/UtKTKKu+tu2ruis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rPDANzruQlJCO9Nt6jKQUyyShWPtDnDjnThZiop5gm5qehhLHgZSepBg2w5/NESfY
	 thsryg0I3UlEc4H6U89ysAuoEYDXD0w8wEPI+cGOV5skHfqE0PsejZjSiHVYWHeJAD
	 4eJaNG1E8ptDJmKriieQXHch3UJYr8k+R3I9TefLvvmqm4LoTBhn3aPusB/ndKghsC
	 OewaUMkpi4nnZYklkSoLHY8WIps8WTYOJVwb9pT7obM+69xNnclaW1jclJHN/voac2
	 wRc/hln1o4McZDD+bcnCikURY6H22i6ZhEwl/qNj3Xw3cis/F8BEe3hdz5ujSLq4Ow
	 EQ7H5tk9nlGLQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25d2b2354so454359666b.1
        for <loongarch@lists.linux.dev>; Sat, 26 Apr 2025 03:14:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCfAh4RXcrZSbZj2ZaGJI80jSr+ZRtv0sfE8OLpFl2atorqsSHsTMqC0bvmsKO4kL7wWTDlS13XNg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1qg/Lumi1wbg+PcuRT/YT/bWSriPkn5aKoPeNY2MO+6nVb2iW
	AJWtz35aeMn/XWFSc+5N1KOrwusI3CsEDXLxpQUyw+/8/8b8zBVjAY5pHQ+e6lEH39s4Xne1Stz
	4nx5hh3JM3y+rfVwMc2y07XwuYyg=
X-Google-Smtp-Source: AGHT+IFcwiMN85t40/cLjSE9iIPsNndZzMgOhumyyrprni3Lud3HSd4CTuxxCNydrObvZOVOpTvc8J0Espn93FV2N+c=
X-Received: by 2002:a17:907:8694:b0:ac7:7f13:2e80 with SMTP id
 a640c23a62f3a-ace7104821amr397849466b.9.1745662478544; Sat, 26 Apr 2025
 03:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420142208.2252280-1-wheatfox17@icloud.com>
In-Reply-To: <20250420142208.2252280-1-wheatfox17@icloud.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 26 Apr 2025 18:14:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H53PKkJJX5K=YuarTmm=ZJYx6m_uUyhY+W_dooLuL6r3A@mail.gmail.com>
X-Gm-Features: ATxdqUG6k7aBA0j5XyblETKQ7GP_Vr6uV7fmdKVn4YvwIZL1ffoofSEI51-6tI0
Message-ID: <CAAhV-H53PKkJJX5K=YuarTmm=ZJYx6m_uUyhY+W_dooLuL6r3A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixed multiple typos of KVM code
To: Yulong Han <wheatfox17@icloud.com>
Cc: zhaotianrui@loongson.cn, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sun, Apr 20, 2025 at 10:24=E2=80=AFPM Yulong Han <wheatfox17@icloud.com>=
 wrote:
>
> Fixed multiple typos inside arch/loongarch/kvm.
>
> Signed-off-by: Yulong Han <wheatfox17@icloud.com>
> ---
>  arch/loongarch/kvm/intc/ipi.c | 4 ++--
>  arch/loongarch/kvm/main.c     | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.=
c
> index 93f4acd44..fe734dc06 100644
> --- a/arch/loongarch/kvm/intc/ipi.c
> +++ b/arch/loongarch/kvm/intc/ipi.c
> @@ -111,7 +111,7 @@ static int send_ipi_data(struct kvm_vcpu *vcpu, gpa_t=
 addr, uint64_t data)
>                 ret =3D kvm_io_bus_read(vcpu, KVM_IOCSR_BUS, addr, sizeof=
(val), &val);
>                 srcu_read_unlock(&vcpu->kvm->srcu, idx);
>                 if (unlikely(ret)) {
> -                       kvm_err("%s: : read date from addr %llx failed\n"=
, __func__, addr);
> +                       kvm_err("%s: : read data from addr %llx failed\n"=
, __func__, addr);
>                         return ret;
>                 }
>                 /* Construct the mask by scanning the bit 27-30 */
> @@ -127,7 +127,7 @@ static int send_ipi_data(struct kvm_vcpu *vcpu, gpa_t=
 addr, uint64_t data)
>         ret =3D kvm_io_bus_write(vcpu, KVM_IOCSR_BUS, addr, sizeof(val), =
&val);
>         srcu_read_unlock(&vcpu->kvm->srcu, idx);
>         if (unlikely(ret))
> -               kvm_err("%s: : write date to addr %llx failed\n", __func_=
_, addr);
> +               kvm_err("%s: : write data to addr %llx failed\n", __func_=
_, addr);
>
>         return ret;
>  }
> diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
> index d165cd38c..80ea63d46 100644
> --- a/arch/loongarch/kvm/main.c
> +++ b/arch/loongarch/kvm/main.c
> @@ -296,10 +296,10 @@ int kvm_arch_enable_virtualization_cpu(void)
>         /*
>          * Enable virtualization features granting guest direct control o=
f
>          * certain features:
> -        * GCI=3D2:       Trap on init or unimplement cache instruction.
> +        * GCI=3D2:       Trap on init or unimplemented cache instruction=
.
>          * TORU=3D0:      Trap on Root Unimplement.
>          * CACTRL=3D1:    Root control cache.
> -        * TOP=3D0:       Trap on Previlege.
> +        * TOP=3D0:       Trap on Privilege.
>          * TOE=3D0:       Trap on Exception.
>          * TIT=3D0:       Trap on Timer.
>          */
> --
> 2.39.5
>
>
