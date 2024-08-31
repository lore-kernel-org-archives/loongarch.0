Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F423AD55
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725115763; cv=none; b=MqSMhP0/4kxAcOvcPqM/jZ9jLaKNEwORYVTj0CIbjhx+3Yu7o+JW4YyRZmzsuSgUGb5cmXxu7d7USIz0wCkwoeap7nevL7dwRLNgjM3YeBZ+UpSBjnZfspQVbAE5sWtQBA4j9ZFpgcV3YiGMemuUpN04imfIekpnHPaTe6SAipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725115763; c=relaxed/simple;
	bh=ul22cGzg/y/wzPvndu09rS+5D0Nsx6rH4s6YJFxOfo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZI2gnea6C6Vxe6OX0AyXa9DaIGH4owhKQKfmqT+hnUNIxEimRTDftOlh2AeDr79gSfNp0dmyJrWya7rNNb+VktGS+ZU7z2QFVn+ODrlRyDcXkTVUb9Q8tPnX9j50ASBBWW+VXGwOLyejl39N/MnBb5FYWiEtvrc+sDGd6mmexg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZW5Zsw6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZW5Zsw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C6BC4CEC7
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725115763;
	bh=ul22cGzg/y/wzPvndu09rS+5D0Nsx6rH4s6YJFxOfo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CZW5Zsw6LCx09XOFSEJ0H8p7Du3sHFGMgf/2r7K+WQzGjo0lu0ZiHeK7X3igNfVVh
	 1XKXyT8c3NBP71u0Nqpdbz5TbXWg4BKV7e4SaXmrFdWebXC8Dt1s47yYzqLdBRb3Mh
	 BarhofUoPRxM2hJY8A1I9R8ULOBh6lemnUkVtIK8/oPhQ/ywI9gKGDeULTkX3OTjYL
	 RPvswnrFueCp2UHb2SG0CfnXwDBSOvRyKYK0tn8LbsR8Bq9d8HPhSdCnPNhqRL3x0W
	 mSlfrnqik7d8LTPw2Ci1aC7P9TNu5/B8tDdOoltXIiyHgSFyp+tPZ+qQeSdUXnabok
	 YPOY1S8cs7+EQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so37018981fa.1
        for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 07:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlTjOfjRKmEfXTS1e6k7zskYtcSJ7xpbZSyBc9KrMaWaeP0wasgY5U8YfKcFz0EOCtrcAKJOPDLZA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3k8NGE8HH3Gl8wRb76IRdGYEyoX9BaTdbXWbdo/GfsILeKqLI
	lV4oYYwx7nygCnD0zA73nwh8CiolhJlrYgmLSyQT3lUNN0oEXTGCO9kSpDytPg2YelIJi3d/cDO
	9Sk0uWxXAkUKiAiNWP1ExyuQEoW4=
X-Google-Smtp-Source: AGHT+IF0DOpQUFnMmt0rOtn9iTeGRZ2ClptnzupGffGSjVCeD5VwLwe6ZPmMljgC020yrV2r1/evj+WWvQWcAvCLLIk=
X-Received: by 2002:a05:651c:b20:b0:2ec:4093:ec7 with SMTP id
 38308e7fff4ca-2f6108937e3mr80477691fa.30.1725115761651; Sat, 31 Aug 2024
 07:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730075744.1215856-1-maobibo@loongson.cn> <20240730075744.1215856-4-maobibo@loongson.cn>
In-Reply-To: <20240730075744.1215856-4-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 31 Aug 2024 22:49:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7D80huYzF6ewZqcgx8MTzWZNFXJHOahoJ33zJYX1kyAw@mail.gmail.com>
Message-ID: <CAAhV-H7D80huYzF6ewZqcgx8MTzWZNFXJHOahoJ33zJYX1kyAw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] LoongArch: KVM: Add vm migration support for LBT registers
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Tue, Jul 30, 2024 at 3:57=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Every vcpu has separate LBT registers. And there are four scr registers,
> one flags and ftop register for LBT extension. When VM migrates, VMM
> needs to get LBT registers for every vcpu.
>
> Here macro KVM_REG_LOONGARCH_LBT is added for new vcpu lbt register type,
> the following macro is added to get/put LBT registers.
>   KVM_REG_LOONGARCH_LBT_SCR0
>   KVM_REG_LOONGARCH_LBT_SCR1
>   KVM_REG_LOONGARCH_LBT_SCR2
>   KVM_REG_LOONGARCH_LBT_SCR3
>   KVM_REG_LOONGARCH_LBT_EFLAGS
>   KVM_REG_LOONGARCH_LBT_FTOP
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/uapi/asm/kvm.h |  9 +++++
>  arch/loongarch/kvm/vcpu.c             | 56 +++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/inclu=
de/uapi/asm/kvm.h
> index 49bafac8b22d..003fb766c93f 100644
> --- a/arch/loongarch/include/uapi/asm/kvm.h
> +++ b/arch/loongarch/include/uapi/asm/kvm.h
> @@ -64,6 +64,7 @@ struct kvm_fpu {
>  #define KVM_REG_LOONGARCH_KVM          (KVM_REG_LOONGARCH | 0x20000ULL)
>  #define KVM_REG_LOONGARCH_FPSIMD       (KVM_REG_LOONGARCH | 0x30000ULL)
>  #define KVM_REG_LOONGARCH_CPUCFG       (KVM_REG_LOONGARCH | 0x40000ULL)
> +#define KVM_REG_LOONGARCH_LBT          (KVM_REG_LOONGARCH | 0x50000ULL)
>  #define KVM_REG_LOONGARCH_MASK         (KVM_REG_LOONGARCH | 0x70000ULL)
I think KVM_REG_LOONGARCH_MASK should contain all above register
classes, so should it be  (KVM_REG_LOONGARCH | 0x370000ULL)?

>  #define KVM_CSR_IDX_MASK               0x7fff
>  #define KVM_CPUCFG_IDX_MASK            0x7fff
> @@ -77,6 +78,14 @@ struct kvm_fpu {
>  /* Debugging: Special instruction for software breakpoint */
>  #define KVM_REG_LOONGARCH_DEBUG_INST   (KVM_REG_LOONGARCH_KVM | KVM_REG_=
SIZE_U64 | 3)
>
> +/* LBT registers */
> +#define KVM_REG_LOONGARCH_LBT_SCR0     (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 1)
> +#define KVM_REG_LOONGARCH_LBT_SCR1     (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 2)
> +#define KVM_REG_LOONGARCH_LBT_SCR2     (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 3)
> +#define KVM_REG_LOONGARCH_LBT_SCR3     (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 4)
> +#define KVM_REG_LOONGARCH_LBT_EFLAGS   (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 5)
> +#define KVM_REG_LOONGARCH_LBT_FTOP     (KVM_REG_LOONGARCH_LBT | KVM_REG_=
SIZE_U64 | 6)
FTOP is a 32bit register in other place of the kernel, is it correct
to use U64 here?

> +
>  #define LOONGARCH_REG_SHIFT            3
>  #define LOONGARCH_REG_64(TYPE, REG)    (TYPE | KVM_REG_SIZE_U64 | (REG <=
< LOONGARCH_REG_SHIFT))
>  #define KVM_IOC_CSRID(REG)             LOONGARCH_REG_64(KVM_REG_LOONGARC=
H_CSR, REG)
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index b5324885a81a..b2500d4fa729 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -597,6 +597,34 @@ static int kvm_get_one_reg(struct kvm_vcpu *vcpu,
>                         break;
>                 }
>                 break;
> +       case KVM_REG_LOONGARCH_LBT:
What about adding FPU/LSX/LASX registers (if needed for migration) in
kvm_{get, set}_one_reg() here?

Huacai

> +               if (!kvm_guest_has_lbt(&vcpu->arch))
> +                       return -ENXIO;
> +
> +               switch (reg->id) {
> +               case KVM_REG_LOONGARCH_LBT_SCR0:
> +                       *v =3D vcpu->arch.lbt.scr0;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR1:
> +                       *v =3D vcpu->arch.lbt.scr1;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR2:
> +                       *v =3D vcpu->arch.lbt.scr2;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR3:
> +                       *v =3D vcpu->arch.lbt.scr3;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_EFLAGS:
> +                       *v =3D vcpu->arch.lbt.eflags;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_FTOP:
> +                       *v =3D vcpu->arch.fpu.ftop;
> +                       break;
> +               default:
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +               break;
>         default:
>                 ret =3D -EINVAL;
>                 break;
> @@ -663,6 +691,34 @@ static int kvm_set_one_reg(struct kvm_vcpu *vcpu,
>                         break;
>                 }
>                 break;
> +       case KVM_REG_LOONGARCH_LBT:
> +               if (!kvm_guest_has_lbt(&vcpu->arch))
> +                       return -ENXIO;
> +
> +               switch (reg->id) {
> +               case KVM_REG_LOONGARCH_LBT_SCR0:
> +                       vcpu->arch.lbt.scr0 =3D v;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR1:
> +                       vcpu->arch.lbt.scr1 =3D v;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR2:
> +                       vcpu->arch.lbt.scr2 =3D v;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_SCR3:
> +                       vcpu->arch.lbt.scr3 =3D v;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_EFLAGS:
> +                       vcpu->arch.lbt.eflags =3D v;
> +                       break;
> +               case KVM_REG_LOONGARCH_LBT_FTOP:
> +                       vcpu->arch.fpu.ftop =3D v;
> +                       break;
> +               default:
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +               break;
>         default:
>                 ret =3D -EINVAL;
>                 break;
> --
> 2.39.3
>
