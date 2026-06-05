Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307FD2F0C62
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668162; cv=none; b=ZUC28k2I24cNTyP84bitwC/MXO/ltCdHIhP4D4DU8tRO0bMtVRX7RzX5H8iwwu2XVi6YVPIMIxq1dY9TEwCmmiJCZvpMNnUjsSSB1WKuon8wqG2iZyl8cswhnQcs+rLLeu48jpO/9S04+uHGE+3BWolgw7FytAstEkxuL88q7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668162; c=relaxed/simple;
	bh=gWBPtU2cqcbx/0cq5/3l1vBn3W8oqMiehaz14Dn6dAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dp2qpj6iGmxl39MJBr3LK9YTh3olK4ESPmkKvfDKujJA5GmZDs2LeMwY6hN4w4fIu9nCZtHMIhVPrxIis6RhCIW8eH61QKgjt4WCiZPmhqt0DQONDLYAatvOhBWVT4tc9p9mlVZYvpKBZVMf9g7c17NPfI2sJLXF7JxfNm2XVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+CyRjE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+CyRjE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2731F00898
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780668160;
	bh=nfiObLvmOcsNy4699AN1tPJ0/P9ewISVmQ3n+5gyZe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W+CyRjE2zwmLCNLzZyzHm/c1Q8OCzjSSvbrMoO5ThJ1Oa7AWzbvxpB30JYU664qhc
	 bn3NIF45HRVTRy+9gYlTpi1ZIua/Ysq9Qlx76cMz1lnue+lJoK9yk4PemgcRSgcT5C
	 ZGZ27dGqbsVkEdGBDsDqEFkO4/JtNNXgT3XpZ2l8PzHQPaISyWaxX5dvy/jWUnVzhv
	 JZURp9dEaOynmcMPH/Bl3hrTN1yV8v7gAJ2WImF9WdSwtrD+cvr0mpcVsradA3FFRT
	 mNy6jKVu7FuTgBmY8Cf4jJp8W5xvCXJcqEYY5aHZUCEEt5nxIghBBvFUPYUcdxB+T4
	 EHQ/DkYAkYuBw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6913160c9ddso192983a12.2
        for <loongarch@lists.linux.dev>; Fri, 05 Jun 2026 07:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qoTBAnRTaT0q7KFK2JMWcWJK9u/BD14bkQJY7iqnK2Xfctu9jNRHevT7H0WUU2JiVy2zovu3FCJU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6y84G+vc0GWDAkDdsarkX0qEBm4liVYGYnnj8+KkwHqA9k9u2
	/Z27r0xfZo6U+yxHNY/koEcINxPlceIl0xnsfoY3GBYJlGAjRdevvpV36Pq3mVSxbS45Oz5f0uY
	DMznxowLM3TazRDE20lIHJf6o+1MIHQI=
X-Received: by 2002:a17:907:94cc:b0:be5:2bc0:5370 with SMTP id
 a640c23a62f3a-bf373eec55emr180650066b.36.1780668159364; Fri, 05 Jun 2026
 07:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525092633.1706633-1-zeng_chi911@163.com> <20260605083108.2534481-1-zeng_chi911@163.com>
In-Reply-To: <20260605083108.2534481-1-zeng_chi911@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 22:02:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7yd7x_8Dj2=FckRO+cjF7+H+3MXbfscqtz+5zSJwqL8w@mail.gmail.com>
X-Gm-Features: AVVi8CfekefRdJ7Toyv8yVIDcC0Vphkua88IymWRs6Z4Ya24fhUvCwRyNPVjSwk
Message-ID: <CAAhV-H7yd7x_8Dj2=FckRO+cjF7+H+3MXbfscqtz+5zSJwqL8w@mail.gmail.com>
Subject: Re: [PTACH v3] LoongArch: KVM: Add missing slots_lock for IO bus
 device register/unregister
To: Zeng Chi <zeng_chi911@163.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, kernel@xen0n.name, 
	kees@kernel.org, maqianga@uniontech.com, gaosong@loongson.cn, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zengchi@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jun 5, 2026 at 4:31=E2=80=AFPM Zeng Chi <zeng_chi911@163.com> wrote=
:
>
> From: Zeng Chi <zengchi@kylinos.cn>
>
> kvm_io_bus_register_dev() and kvm_io_bus_unregister_dev() should be
> called under kvm->slots_lock. The unregister calls in ipi.c, pch_pic.c
> and eiointc.c were missing this protection. Add it to match the
> register side.
>
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> ---
> v3: fix subject prefix (drop "net", LoongArch KVM does not go through the
>     net tree); add Reviewed-by from Bibo Mao. No code change.
> v2: extend the fix from the EIOINTC virtual extension device registration
>     (v1) to the ipi.c / pch_pic.c / eiointc.c destroy paths as well.
> ---
>  arch/loongarch/kvm/intc/eiointc.c | 6 ++++++
>  arch/loongarch/kvm/intc/ipi.c     | 2 ++
>  arch/loongarch/kvm/intc/pch_pic.c | 2 ++
>  3 files changed, 10 insertions(+)
>
> diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/=
eiointc.c
> index 2ab7fafa86d5..2b14485d14a7 100644
> --- a/arch/loongarch/kvm/intc/eiointc.c
> +++ b/arch/loongarch/kvm/intc/eiointc.c
> @@ -645,10 +645,14 @@ static int kvm_eiointc_create(struct kvm_device *de=
v, u32 type)
>
>         device =3D &s->device_vext;
>         kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
> +       mutex_lock(&kvm->slots_lock);
>         ret =3D kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
>                         EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
> +       mutex_unlock(&kvm->slots_lock);
>         if (ret < 0) {
> +               mutex_lock(&kvm->slots_lock);
>                 kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device)=
;
> +               mutex_unlock(&kvm->slots_lock);
>                 kfree(s);
>                 return ret;
>         }
> @@ -667,8 +671,10 @@ static void kvm_eiointc_destroy(struct kvm_device *d=
ev)
>
>         kvm =3D dev->kvm;
>         eiointc =3D kvm->arch.eiointc;
> +       mutex_lock(&kvm->slots_lock);
>         kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device);
>         kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device_ve=
xt);
> +       mutex_unlock(&kvm->slots_lock);
>         kfree(eiointc);
>         kfree(dev);
>  }
> diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.=
c
> index 1f6ebbd0af5c..4fa0897d7bdb 100644
> --- a/arch/loongarch/kvm/intc/ipi.c
> +++ b/arch/loongarch/kvm/intc/ipi.c
> @@ -447,7 +447,9 @@ static void kvm_ipi_destroy(struct kvm_device *dev)
>
>         kvm =3D dev->kvm;
>         ipi =3D kvm->arch.ipi;
> +       mutex_lock(&kvm->slots_lock);
>         kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &ipi->device);
> +       mutex_unlock(&kvm->slots_lock);
>         kfree(ipi);
>         kfree(dev);
>  }
> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/=
pch_pic.c
> index aa0ed59ae8cf..175a630aceb4 100644
> --- a/arch/loongarch/kvm/intc/pch_pic.c
> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> @@ -481,7 +481,9 @@ static void kvm_pch_pic_destroy(struct kvm_device *de=
v)
>         kvm =3D dev->kvm;
>         s =3D kvm->arch.pch_pic;
>         /* unregister pch pic device and free it's memory */
> +       mutex_lock(&kvm->slots_lock);
>         kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &s->device);
> +       mutex_unlock(&kvm->slots_lock);
>         kfree(s);
>         kfree(dev);
>  }
> --
> 2.25.1
>
