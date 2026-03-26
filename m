Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0120CCDC
	for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511414; cv=none; b=XxU4waeu23ptfO2m0N4wGgCxUaN9EbCXdkK0nzl6vfmE9t3xABS380KIWvomKDG4/FjJ/6uMHwJuAiibOB84l+lJ/rrC80fkzi0C04jkjzLPe+5OZtAlrL4TjeO3yb1xjaTQWsP2Gqc9b3ug+3Y46FjVaJZiy5jsvRjNtoay840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511414; c=relaxed/simple;
	bh=CidhCkxqlmlhREGUgMDvYlj86xoccIq7LTI+/JoLyZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHl06PAZJBWMIQeyg+i/Bfl85y6PnkhmKaRArtZr5s1Ten6Kw0BI5b+gZsHxQQfwWqWlDbFw4Je1ZxT6YlKLM1oVw4+ZTOnxSdbkhM0ncsffpIWLFok6/i556Q36z/DcYkOvdtNa+egLBYhKDqUo2jTz6krl4P5OsBHltdsnI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGwvJqBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGwvJqBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74CDC2BCB3
	for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774511413;
	bh=CidhCkxqlmlhREGUgMDvYlj86xoccIq7LTI+/JoLyZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qGwvJqBMyqAlyZXvw0pdOSbXDhRHajlR/t2bPHcuRUmTNBAgYS9SjT9bUjXaT8wcJ
	 dfPUALk0bAFQGTT4XYU/fiPNLmyuu1Ld1kZByB/O4IOxvxX0YYVEIaituQda6yluKW
	 hfoUxvc275/uG055GnafTGnxphLAtmh+nKNbXmeF+IFL00yOFnuvIy/VzYfuu1hlqC
	 M6qnfN5k6IH7JVI5gW6pZk4xZeK8TySZ8685GTVaYm6BUvLPIJz5EzVaMbi18eIkvY
	 QWh7/3dEW+JA3hfp67G/A/OwA1fsT2wyCdxNwDBygL+f9SfdashxxuMrueQCgqucIW
	 GW/xeGjKc4zDg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66b05026e82so452630a12.3
        for <loongarch@lists.linux.dev>; Thu, 26 Mar 2026 00:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9UpYdy15gjVSusOcA/EM7x+AyuCtVeLcAtAInR6tOPZ3F0mn9sz8ng7l8gehUS57ugR2ksUbrQg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEcVkJl8Mm86Rn1aXmuaQTEJv1gpgyht32eiJa7KQydg5Cf7Op
	Xzz6YQk7URF0JqR7Rf7hHxFThtiSyA0CGaE2QH7Kdyb1pFLuwFMvNpA+nAWTNMID0KXGKlA9hbN
	D483i0WwmZFyMysTltWml/Gr4Z/zK/eA=
X-Received: by 2002:a17:907:6d05:b0:b99:7462:3c57 with SMTP id
 a640c23a62f3a-b9b0f0ffb2dmr362584866b.14.1774511412117; Thu, 26 Mar 2026
 00:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324031506.264062-1-maobibo@loongson.cn>
In-Reply-To: <20260324031506.264062-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 26 Mar 2026 15:50:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6T46kbfHz-mhFVMy=JGkF3Vz9SjBeyBx=OCLiGJWjR1w@mail.gmail.com>
X-Gm-Features: AQROBzBwOrxmFRO_JN7udjv0Dk91DmL0OdTTwak67tLk1zOK-VjDTxgp8v4hUQU
Message-ID: <CAAhV-H6T46kbfHz-mhFVMy=JGkF3Vz9SjBeyBx=OCLiGJWjR1w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Fix base address calculation problem in kvm_eiointc_regs_access()
To: Bibo Mao <maobibo@loongson.cn>
Cc: Aurelien Jarno <aurel32@debian.org>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Mar 24, 2026 at 11:15=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> In function kvm_eiointc_regs_access(), register base address is caculated
> from array base address plus offset, the offset is absolute value from ba=
se
> address. The data type of array base address is u64, it should be convert=
ed
> into void * type and then plus the offset.
>
> Cc: <stable@vger.kernel.org>
> Fixes: d3e43a1f34ac ("LoongArch: KVM: Use 64-bit register definition for =
EIOINTC").
> Reported-by: Aurelien Jarno <aurel32@debian.org>
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1131431
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/intc/eiointc.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/=
eiointc.c
> index d2acb4d09e73..71bd67b57338 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -472,34 +472,34 @@ static int kvm_eiointc_regs_access(struct kvm_devic=
e *dev,
>         switch (addr) {
>         case EIOINTC_NODETYPE_START ... EIOINTC_NODETYPE_END:
>                 offset =3D (addr - EIOINTC_NODETYPE_START) / 4;
> -               p =3D s->nodetype + offset * 4;
> +               p =3D (void *)s->nodetype + offset * 4;
>                 break;
>         case EIOINTC_IPMAP_START ... EIOINTC_IPMAP_END:
>                 offset =3D (addr - EIOINTC_IPMAP_START) / 4;
> -               p =3D &s->ipmap + offset * 4;
> +               p =3D (void *)&s->ipmap + offset * 4;
>                 break;
>         case EIOINTC_ENABLE_START ... EIOINTC_ENABLE_END:
>                 offset =3D (addr - EIOINTC_ENABLE_START) / 4;
> -               p =3D s->enable + offset * 4;
> +               p =3D (void *)s->enable + offset * 4;
>                 break;
>         case EIOINTC_BOUNCE_START ... EIOINTC_BOUNCE_END:
>                 offset =3D (addr - EIOINTC_BOUNCE_START) / 4;
> -               p =3D s->bounce + offset * 4;
> +               p =3D (void *)s->bounce + offset * 4;
>                 break;
>         case EIOINTC_ISR_START ... EIOINTC_ISR_END:
>                 offset =3D (addr - EIOINTC_ISR_START) / 4;
> -               p =3D s->isr + offset * 4;
> +               p =3D (void *)s->isr + offset * 4;
>                 break;
>         case EIOINTC_COREISR_START ... EIOINTC_COREISR_END:
>                 if (cpu >=3D s->num_cpu)
>                         return -EINVAL;
>
>                 offset =3D (addr - EIOINTC_COREISR_START) / 4;
> -               p =3D s->coreisr[cpu] + offset * 4;
> +               p =3D (void *)s->coreisr[cpu] + offset * 4;
>                 break;
>         case EIOINTC_COREMAP_START ... EIOINTC_COREMAP_END:
>                 offset =3D (addr - EIOINTC_COREMAP_START) / 4;
> -               p =3D s->coremap + offset * 4;
> +               p =3D (void *)s->coremap + offset * 4;
>                 break;
>         default:
>                 kvm_err("%s: unknown eiointc register, addr =3D %d\n", __=
func__, addr);
>
> base-commit: c369299895a591d96745d6492d4888259b004a9e
> --
> 2.39.3
>
>
