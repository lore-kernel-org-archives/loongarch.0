Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88076535C5
	for <loongarch@lists.linux.dev>; Wed, 14 Feb 2024 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916129; cv=none; b=o077hodF/iUa+JsCAcrjmUQoj1FPSB++lzBIRSHmEGr9oBrLFDU/cVwqOqQrkotgH3VwjXNADB/z+YSlO2n8SfiDU7ZB/MPdQBJwDWhz9E1KQsFS8VcLIPZpmYQh0eTOHEsfJU6v5T4aoMrCYPHf7eeiG3tvsidTaG9l6iGgzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916129; c=relaxed/simple;
	bh=LJKPHMPjmHlU2PJKYir/2UiQYp8Nni0aZPwyL3+QEQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jM6bJqdIAwCMYAy1+husjYlqsUVexXOfmm0xBObiM7BQ9fqYzCDcQvYlD2x79rANfRCUBukv4DPOLdK/FjdAtpH1Pj3BOEpsEkSyWOdafgbPDG0itFFwtF8UpvnO/TOREaGqnONYIXPpZUC2ZW45636eTLROIfsFzIYuALa/e8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDYMdqUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDYMdqUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9EAC433C7
	for <loongarch@lists.linux.dev>; Wed, 14 Feb 2024 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707916129;
	bh=LJKPHMPjmHlU2PJKYir/2UiQYp8Nni0aZPwyL3+QEQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dDYMdqUNK2cUFdZcoJQdatO9QdalPCDefOYbT/hPddd9+v387BHBT3h29qhAu0vVb
	 w0YvaKZ5ismqqrtF242BRBeoxLSX3yOJzMzHZ7WndxrY3IL8SzUdhpl55H0nLpD4S+
	 1n0lj0akqRz1z4YWAK7qavjSBPjRsVSISyTmPX7wYWNP8+wJb5useYbjCMz/1eqEQe
	 2wToUWXJaH6YJ7znkUNWjouGr7HvqJWnNVoFAQAQlako1Fd2N9jpPJaCXGiXzLb/8K
	 vC992tnsr6s3RvgVFxkTZbOiS8tLD+HzHwjSheJ+leg/ykyv9O9EhqK2cEQrdCrlVC
	 dgg+RStP2PFFw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so8366278a12.2
        for <loongarch@lists.linux.dev>; Wed, 14 Feb 2024 05:08:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtoXFw7NmeIuLcTc0Ke0RpuFhvKYDwhqzglMFeaXPKSzDzWQZL1IBHgzuKRjTcz78QRAq9pjlgIaKpNndcQQw+28E+PqNWinA3
X-Gm-Message-State: AOJu0YwImvFHuFMVHJnTQH64Nsx3xHXQ6r4LJ8WpIccM53C7OuqJ5djJ
	VvAcU7oaqeihKLQOOzKvTYAQROEDt/UxDXIjgwS2Wx6BYfgibPwMQsS85wL9j9qv9inIBdtbulP
	NB7nWTBDx1E7rUCZev4eS5nglokk=
X-Google-Smtp-Source: AGHT+IGQjdAs7/xBZGeUuHvsWykfdt4hjXWz/dkFlvTVpDXBTHOvjjDTopZjU++jNtkTn7NFKnZ8yTQpCvE0Tvz9jVc=
X-Received: by 2002:aa7:d3da:0:b0:561:c6fa:715a with SMTP id
 o26-20020aa7d3da000000b00561c6fa715amr1769221edr.40.1707916127870; Wed, 14
 Feb 2024 05:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240214101557.2900512-1-kernel@xen0n.name> <20240214101557.2900512-6-kernel@xen0n.name>
In-Reply-To: <20240214101557.2900512-6-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 14 Feb 2024 21:08:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H43mQy34FWqRCA4h9YxsFai3AsALvqNP82OZhYdAw5TbA@mail.gmail.com>
Message-ID: <CAAhV-H43mQy34FWqRCA4h9YxsFai3AsALvqNP82OZhYdAw5TbA@mail.gmail.com>
Subject: Re: [PATCH for-6.8 5/5] KVM: LoongArch: Clean up comments of
 _kvm_get_cpucfg_mask and kvm_check_cpucfg
To: WANG Xuerui <kernel@xen0n.name>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

On Wed, Feb 14, 2024 at 6:16=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> Remove comments that are merely restatement of the code nearby, and
> paraphrase the rest so they read more natural for English speakers (that
> lack understanding of Chinese grammar). No functional changes.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/kvm/vcpu.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 9e108ffaba30..ff51d6ba59aa 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -302,20 +302,14 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
>  {
>         switch (id) {
>         case 2:
> -               /* Return CPUCFG2 features which have been supported by K=
VM */
> +               /* CPUCFG2 features unconditionally supported by KVM */
>                 *v =3D CPUCFG2_FP     | CPUCFG2_FPSP  | CPUCFG2_FPDP     =
|
>                      CPUCFG2_FPVERS | CPUCFG2_LLFTP | CPUCFG2_LLFTPREV |
>                      CPUCFG2_LAM;
> -               /*
> -                * If LSX is supported by CPU, it is also supported by KV=
M,
> -                * as we implement it.
> -                */
> +               /* If LSX is supported by the host, then it is also suppo=
rted by KVM */
>                 if (cpu_has_lsx)
>                         *v |=3D CPUCFG2_LSX;
> -               /*
> -                * if LASX is supported by CPU, it is also supported by K=
VM,
> -                * as we implement it.
> -                */
> +               /* Same with LASX */
Consider a full description "If LASX is supported by the host, then it
is also supported by KVM"?

>                 if (cpu_has_lasx)
>                         *v |=3D CPUCFG2_LASX;
>
> @@ -336,21 +330,23 @@ static int kvm_check_cpucfg(int id, u64 val)
>
>         switch (id) {
>         case 2:
> -               /* CPUCFG2 features checking */
>                 if (val & ~mask)
> -                       /* The unsupported features should not be set */
> +                       /* Unsupported features should not be set */
>                         return -EINVAL;
>                 if (!(val & CPUCFG2_LLFTP))
> -                       /* The LLFTP must be set, as guest must has a con=
stant timer */
> +                       /* Guests must have a constant timer */
>                         return -EINVAL;
>                 if ((val & CPUCFG2_FP) && (!(val & CPUCFG2_FPSP) || !(val=
 & CPUCFG2_FPDP)))
> -                       /* Single and double float point must both be set=
 when enable FP */
> +                       /* Single and double float point must both be set=
 when FP is enabled */
>                         return -EINVAL;
>                 if ((val & CPUCFG2_LSX) && !(val & CPUCFG2_FP))
> -                       /* FP should be set when enable LSX */
> +                       /* LSX is architecturally defined to imply FP */
>                         return -EINVAL;
>                 if ((val & CPUCFG2_LASX) && !(val & CPUCFG2_LSX))
> -                       /* LSX, FP should be set when enable LASX, and FP=
 has been checked before. */
> +                       /*
> +                        * LASX is architecturally defined to imply LSX a=
nd FP
> +                        * FP is checked just above
I think "LASX is architecturally defined to imply LSX and FP" is enough her=
e.

> +                        */
>                         return -EINVAL;
>                 return 0;
>         default:
And I prefer to squash the last two patches together.

Huacai

> --
> 2.43.0
>
>
