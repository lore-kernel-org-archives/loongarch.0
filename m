Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B937B400
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172587; cv=none; b=ZIckwFgc4kHsflAjq0Z4GWE3xkXLK4npC8eWVg4D9KK+4mShXv0FZ/zk/4zphWUGjUQwN+oz0FNDqkKBtmQ+KpqC0MAElPrHYTckRPB08EimisAfdVO2W0Fjzhs5tTV7pGSA1Q/N8VrimZc6VKC03fyJ40akbPWsCJ6GP2o84As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172587; c=relaxed/simple;
	bh=hSL7AgWvVAVo8DbBzRKoIZjUcwgxeNHguFbQGBfc5fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wl8PPnE3kKCAOlCkGySBFbKzDchaa6NuApy3xT0/KVgT6oeDvulZwMitNdESiPngCVSNn7pfQJflLleQ/iU117WfXGUJchsKoyPqlHZ+68FSbE3Obmkz7a50dvcU/G7n122HbVUe7J3Yg9UI8UNpvP9fRSg9vzXbVeql8DEkwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiz8ARK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiz8ARK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0261F00893
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172584;
	bh=AzR8jjvvsTbu4EalP5UYzjETmzHFZnn5h+Mp2gBvyQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fiz8ARK28O8q6A/B6borEx38TESuRzJEu7pTceXN8GTkuKCt+ZrrlVpnVLRJgR0Dw
	 mW4Xwu07Z8W3Zav/dBxDW/HE0VFS06EvDGHOcrCui31POSRD/+NXUeREuVLp+XPtKi
	 UfdF1CfPGUNBzpY2i/FkbFz4BsXYfTuLfwYfzlx5vJa11jfeTQuvDwI4K54meHI5R5
	 5zFirww27H6KvIpdU23j+unZWywbeaLX7E+3SUWs5/4lKoCcnkHsAeChrSQOZ74zMx
	 kz7h0W86YnVdunMLdv6Sz/zaQG3GU9vzsgyidfJodYMp893EfpnT/0TH+NhdsfIwT8
	 OgUOKRNE+o4lA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so6410061a12.3
        for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 03:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qW7Qw9uIzGexF4pIPEukWBHQwsiRKivrOA4n6V3k2+gKF0kQNBjctjwlrzDX5LJ5TGBQI5y9Nmg8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxch+5Pbhir7RSOzXNjGy55BAqabAoQDjDdQCqmzCKXPsEXn4lD
	EU+gWwm9CftAn6eb6EO6NhoXmkfZeB1ZYDXVTUZ74d82zerKsAT4+JXyfkhYNAwvLzlRLb6n29Q
	z2KBYc06niQKBT4jIku8h+F/V/RZWnDw=
X-Received: by 2002:a05:6402:194a:b0:676:988e:8eb6 with SMTP id
 4fb4d7f45d1cf-6930e31053cmr951330a12.26.1781172583581; Thu, 11 Jun 2026
 03:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611065815.1439154-1-maobibo@loongson.cn> <20260611065815.1439154-6-maobibo@loongson.cn>
In-Reply-To: <20260611065815.1439154-6-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 11 Jun 2026 18:10:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7vMq+-nm8f8aL2CvmNYivaHgWj1cTuyv0BTfPQRKpSJA@mail.gmail.com>
X-Gm-Features: AVVi8CdwzFFYmFEPd-8FS8BfDaTAzx1vUsx6LelRHZFj3zaADFJBXNkhX14Q07U
Message-ID: <CAAhV-H7vMq+-nm8f8aL2CvmNYivaHgWj1cTuyv0BTfPQRKpSJA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] LoongArch: KVM: Add valid bit check when set ESTAT
 CSR register
To: Bibo Mao <maobibo@loongson.cn>
Cc: kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Thu, Jun 11, 2026 at 2:58=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> When set ESTAT CSR register in function _kvm_setcsr(), valid bit check
> is added here. Also interrupt CPU_AVEC is checked by msgint feature.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/vcpu.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index e986146d2272..4f67eefbd4f1 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -602,7 +602,7 @@ struct kvm_vcpu *kvm_get_vcpu_by_cpuid(struct kvm *kv=
m, int cpuid)
>
>  static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 *val)
>  {
> -       unsigned long gintc;
> +       unsigned long gintc, estat;
>         struct loongarch_csrs *csr =3D vcpu->arch.csr;
>
>         if (get_gcsr_flag(id) & INVALID_GCSR)
> @@ -621,8 +621,9 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigne=
d int id, u64 *val)
>                 preempt_enable();
>
>                 /* ESTAT IP0~IP7 get from GINTC */
> -               gintc =3D kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & 0x=
ff;
> -               *val =3D kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) | (gi=
ntc << 2);
> +               gintc =3D kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & KV=
M_GINTC_IRQ_MASK;
> +               estat =3D kvm_read_sw_gcsr(csr, LOONGARCH_CSR_ESTAT) & ~K=
VM_ESTAT_EXTI_MASK;
> +               *val =3D estat | (gintc << VIP_DELTA);
>                 return 0;
>         }
>
> @@ -637,7 +638,8 @@ static int _kvm_getcsr(struct kvm_vcpu *vcpu, unsigne=
d int id, u64 *val)
>
>  static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
>  {
> -       int ret =3D 0, gintc;
> +       int ret =3D 0;
> +       unsigned long gintc, estat;
>         struct loongarch_csrs *csr =3D vcpu->arch.csr;
>
>         if (get_gcsr_flag(id) & INVALID_GCSR)
> @@ -648,11 +650,16 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsig=
ned int id, u64 val)
>
>         if (id =3D=3D LOONGARCH_CSR_ESTAT) {
>                 /* ESTAT IP0~IP7 inject through GINTC */
> -               gintc =3D (val >> 2) & 0xff;
> -               kvm_set_sw_gcsr(csr, LOONGARCH_CSR_GINTC, gintc);
> -
> -               gintc =3D val & ~(0xffUL << 2);
> -               kvm_set_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, gintc);
> +               gintc =3D kvm_read_sw_gcsr(csr, LOONGARCH_CSR_GINTC) & ~K=
VM_GINTC_IRQ_MASK;
> +               gintc |=3D (val >> VIP_DELTA) & KVM_GINTC_IRQ_MASK;
> +               kvm_write_sw_gcsr(csr, LOONGARCH_CSR_GINTC, gintc);
I think read & write can be combined, which means it can be simplified as:
                gintc =3D (val >> VIP_DELTA) & KVM_GINTC_IRQ_MASK;
                kvm_set_sw_gcsr(csr, LOONGARCH_CSR_GINTC, gintc);

> +
> +               /* only set valid ESTAT bits */
> +               estat =3D val & ~KVM_ESTAT_EXTI_MASK;
> +               estat &=3D CSR_ESTAT_IS | CSR_ESTAT_EXC | CSR_ESTAT_ESUBC=
ODE;
> +               if (!kvm_guest_has_msgint(&vcpu->arch))
> +                       estat &=3D ~CPU_AVEC;
> +               kvm_write_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, estat);
I think write csr may lose bits from the original value, so
                kvm_write_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, estat)
should be
                kvm_set_sw_gcsr(csr, LOONGARCH_CSR_ESTAT, estat)

If you agree, I will change it when I apply because all others look good to=
 me.

Huacai

>
>                 return ret;
>         }
> --
> 2.39.3
>
