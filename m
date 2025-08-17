Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75FF4F1
	for <loongarch@lists.linux.dev>; Sun, 17 Aug 2025 03:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755402361; cv=none; b=q8WZ9MYxnWZ98BmtDpcp8TVFtr7jYLtJOI9/PZZmMqZ7NvHZrhQyZmzvAV9P3toWWOhxmricedbpTPyRR4pTIy3Ku7ReBq9FWgpUfawE0wOFCuXbeQ4uglMfczgswbD2a+gupygMGS+XroXO1DP8a2n7OfpIZQ4QV8mYdYgstKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755402361; c=relaxed/simple;
	bh=FbBf6K49g5uG/OvWKAgJlk4llLTweZMsbI/rMlDt2SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUCM+J/jnWefjE8mPH55nhGRzOk0Nr8iOYD54Q8t00duVvJtsQHsuVGA2s4PM1VOezP8Iw0AoRz28BO4bHQPEb5dVd7nTN8kjb38WubMriOvEftSGcsPMoMpkK/6dxoLpitfJGmriZCIvOKmsgM8th7FyfkfCa9N65iHDjWFN6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YV8i3slE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YV8i3slE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E91C4CEED
	for <loongarch@lists.linux.dev>; Sun, 17 Aug 2025 03:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755402360;
	bh=FbBf6K49g5uG/OvWKAgJlk4llLTweZMsbI/rMlDt2SI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YV8i3slEz7vFGoLu4gtF0Zkm4WfMhQUXdCwWxrgfm5USuafbu/zj9C90DxC2ivceM
	 PegEcK9fO5fv1yfVc39G1+TOXSOF9inqNpR3C87m5xF5AOnTHB5UVZu4adsuVA+OOY
	 FODxMo+3uYtUkDzK19UaFxFpQRMGM2efBJ9ms7+liCVHTnT2m1+TZNMxQkbvOAh7CM
	 45lp82iE5sPAHA+DY31ZCvq0zj8Y+X24NGQAJSUOjFAHxhC/pNLxrYpYAgj70xYgnY
	 /xz9KX7ZzvnJqjHsKfXS3XooHg7zk8tRYvxQHHWzVMsPPrKNSdeyyQqRyCic1ZrNyd
	 vOij9FXYAbVNA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso3688690a12.2
        for <loongarch@lists.linux.dev>; Sat, 16 Aug 2025 20:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcQYox+DCjmT627LzLoWs3fSuKtZ+cCDJiAKbJE2sRkPwbtX2uH9nkIXxdsrA6gnyR2xsmpcCbSCk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfs9cj3pc4wviYpdUWPDTzGkwmmc6399Y00hG8RNtHhqUenWJd
	hurGywPI2mjg4mXAaZt9RoYywRI1ztsOXJ/G8DsLzsNGcR2CsM+Y8+scYtYO3rkAQ/woVpr2kRw
	piYSiIT/QGHhK5rMobpKe1SzpnoZN7NQ=
X-Google-Smtp-Source: AGHT+IHUIXO9sSVSL/WQ4WQeurIylSuToovpBc+MPQErPaLPG5zOmAYue23ItDx9DXRnTT2ZHL7o/6ktOjRxAPdDG1k=
X-Received: by 2002:a05:6402:5114:b0:618:1250:ac54 with SMTP id
 4fb4d7f45d1cf-619bf1d67f8mr3332590a12.21.1755402359322; Sat, 16 Aug 2025
 20:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811021344.3678306-1-maobibo@loongson.cn> <20250811021344.3678306-6-maobibo@loongson.cn>
In-Reply-To: <20250811021344.3678306-6-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 17 Aug 2025 11:45:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6rQVVF_Z+5A7AR+5Q-A2ydw4sxc9Qq6+-r33kRwYjwAA@mail.gmail.com>
X-Gm-Features: Ac12FXxEqC-ac5xhYMZHIixPaMqxZZClPatbquOFPIPi5bPfcu5INPJZbWyfjUE
Message-ID: <CAAhV-H6rQVVF_Z+5A7AR+5Q-A2ydw4sxc9Qq6+-r33kRwYjwAA@mail.gmail.com>
Subject: Re: [PATCH 5/5] LoongArch: KVM: Add address alignment check in
 pch_pic register access
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This one is applied for loongarch-fixes.

Huacai

On Mon, Aug 11, 2025 at 10:15=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> With pch_pic device, its register is based on MMIO address space,
> different access size 1/2/4/8 is supported. And base address should
> be naturally aligned with its access size, here add alignment check
> in its register access emulation function.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/intc/pch_pic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/=
pch_pic.c
> index 0710b5ab286e..5ee24dbf3c4c 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -151,6 +151,11 @@ static int kvm_pch_pic_read(struct kvm_vcpu *vcpu,
>                 return -EINVAL;
>         }
>
> +       if (addr & (len - 1)) {
> +               kvm_err("%s: pch pic not aligned addr %llx len %d\n", __f=
unc__, addr, len);
> +               return -EINVAL;
> +       }
> +
>         /* statistics of pch pic reading */
>         vcpu->stat.pch_pic_read_exits++;
>         ret =3D loongarch_pch_pic_read(s, addr, len, val);
> @@ -246,6 +251,11 @@ static int kvm_pch_pic_write(struct kvm_vcpu *vcpu,
>                 return -EINVAL;
>         }
>
> +       if (addr & (len - 1)) {
> +               kvm_err("%s: pch pic not aligned addr %llx len %d\n", __f=
unc__, addr, len);
> +               return -EINVAL;
> +       }
> +
>         /* statistics of pch pic writing */
>         vcpu->stat.pch_pic_write_exits++;
>         ret =3D loongarch_pch_pic_write(s, addr, len, val);
> --
> 2.39.3
>
>
