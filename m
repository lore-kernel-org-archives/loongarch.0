Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86189470
	for <loongarch@lists.linux.dev>; Tue,  2 Jul 2024 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719885555; cv=none; b=d8Dyopw/WWbiKCP+RC3/80tNj2OPsS/+zl1e518KgeizMwc1eF7QF3TYkDkP2/7GrYNoZzog+vZmYlqfnft6OKAYf9e1gNSDuGoWmEk6cocAJzmEeH2zyukHhKzn0JxBCeHKxGbxasjCJ5bnqAtj/0ufyJFNUP44B36Ia1+Z7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719885555; c=relaxed/simple;
	bh=R8ygghPnMfeWQ9Y4PoN7pER1HV/QcG/H9FSCeeKEm4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMvNLRHD8yNbC4al0Xx9j5NmGWlGB+V6iBJRIvDn2hyjRe4FQ4WtrHfGLwB3RrdZAwtjNKxyveEiZGxEhtt2UjQsqJFQa7NGaE4uY56W5NHrTsH4hUkC5tMviLAEptOm5YjuBZ4R9vqNptJKq+bEpsrW3m6jzhDm+Ja0eeNihpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gzo4mmP4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gzo4mmP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700B3C4AF0A
	for <loongarch@lists.linux.dev>; Tue,  2 Jul 2024 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719885554;
	bh=R8ygghPnMfeWQ9Y4PoN7pER1HV/QcG/H9FSCeeKEm4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gzo4mmP4ASTKe1swkDTOnnNFG8ffE9s9UJAD8iT1kulSuTuGODqy2c5WIQhEhssal
	 OZNPBS8BZcquJZzT9MFyzHT9C1QXKQ63dnJKYgGKpJr7Y8Ohp5N9yOaV4JGCQxcabH
	 drnaFsX37xy8YdLQ0ZhGVGSj2nVDpESXbGvs07mc4vxHC2wUnQbdxVmX9kIiq/Xw4T
	 HBpaeUqmW2lZw1trUyisJdMdqcu8TNjSudZe5LeVHZgXFQmAtRe2WyM5td22ow6bdj
	 7Hsea9WOvpktPQ5viknXFW8/x0Fm5UsXmHWUg8RqmuQT3acu3KShFthaK4M7EMICCg
	 QmqM+WVOww8KA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7245453319so573427366b.1
        for <loongarch@lists.linux.dev>; Mon, 01 Jul 2024 18:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUx8pS3rYvWSlnXQ9uU3rMi6tRu/zBcSt4Q0me4rzG8Go+LtR5XR4+49y3P6UqaT/4NSR0ofGFV2w/3ZeTf54DsmwpO+jQTg/kR
X-Gm-Message-State: AOJu0YxZ6MkgTRnhUGpUj5Sz+5iAP6IM6YndBwaqj4wjrkd2vzlFZPM3
	XJP1UJkmqVWNCMe/9AHI/PLhqEtgEPU8mxqSH5Uwmj0jISjp3nYYA3qj1TI7qk+/7DEu1WAYD5R
	jmxcX8RYmG52hUrX3zvFh+wTogec=
X-Google-Smtp-Source: AGHT+IFtsV1QUGIFWF3mQ/wUe8OQuXpfXGrZ6rn6PRIo37hgmZtPg1Xazv1l/NOIgekb2HfJCqfdflFbHBYjUx00tNc=
X-Received: by 2002:a17:906:2709:b0:a6f:e699:a9f8 with SMTP id
 a640c23a62f3a-a72aeeb255fmr645830866b.18.1719885552896; Mon, 01 Jul 2024
 18:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626063239.3722175-1-maobibo@loongson.cn> <20240626063239.3722175-3-maobibo@loongson.cn>
 <CAAhV-H4O8QNb61xkErd9y_1tK_70=Y=LNqzy=9Ny5EQK1XZJaQ@mail.gmail.com>
 <79dcf093-614f-2737-bb03-698b0b3abc57@loongson.cn> <CAAhV-H5bQutcLcVaHn-amjF6_NDnCf2BFqqnGSRT_QQ_6q6REg@mail.gmail.com>
 <9c7d242e-660b-8d39-b69e-201fd0a4bfbf@loongson.cn>
In-Reply-To: <9c7d242e-660b-8d39-b69e-201fd0a4bfbf@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 2 Jul 2024 09:59:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4wwrYyMYpL1u5Z3sFp6EeW4eWhGbBv0Jn9XYJGXgwLfg@mail.gmail.com>
Message-ID: <CAAhV-H4wwrYyMYpL1u5Z3sFp6EeW4eWhGbBv0Jn9XYJGXgwLfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] LoongArch: KVM: Add LBT feature detection function
To: maobibo <maobibo@loongson.cn>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 9:51=E2=80=AFAM maobibo <maobibo@loongson.cn> wrote:
>
> Huacai,
>
> On 2024/7/1 =E4=B8=8B=E5=8D=886:26, Huacai Chen wrote:
> > On Mon, Jul 1, 2024 at 9:27=E2=80=AFAM maobibo <maobibo@loongson.cn> wr=
ote:
> >>
> >>
> >> Huacai,
> >>
> >> On 2024/6/30 =E4=B8=8A=E5=8D=8810:07, Huacai Chen wrote:
> >>> Hi, Bibo,
> >>>
> >>> On Wed, Jun 26, 2024 at 2:32=E2=80=AFPM Bibo Mao <maobibo@loongson.cn=
> wrote:
> >>>>
> >>>> Two kinds of LBT feature detection are added here, one is VCPU
> >>>> feature, the other is VM feature. VCPU feature dection can only
> >>>> work with VCPU thread itself, and requires VCPU thread is created
> >>>> already. So LBT feature detection for VM is added also, it can
> >>>> be done even if VM is not created, and also can be done by any
> >>>> thread besides VCPU threads.
> >>>>
> >>>> Loongson Binary Translation (LBT) feature is defined in register
> >>>> cpucfg2. Here LBT capability detection for VCPU is added.
> >>>>
> >>>> Here ioctl command KVM_HAS_DEVICE_ATTR is added for VM, and macro
> >>>> KVM_LOONGARCH_VM_FEAT_CTRL is added to check supported feature. And
> >>>> three sub-features relative with LBT are added as following:
> >>>>    KVM_LOONGARCH_VM_FEAT_X86BT
> >>>>    KVM_LOONGARCH_VM_FEAT_ARMBT
> >>>>    KVM_LOONGARCH_VM_FEAT_MIPSBT
> >>>>
> >>>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> >>>> ---
> >>>>    arch/loongarch/include/uapi/asm/kvm.h |  6 ++++
> >>>>    arch/loongarch/kvm/vcpu.c             |  6 ++++
> >>>>    arch/loongarch/kvm/vm.c               | 44 ++++++++++++++++++++++=
++++-
> >>>>    3 files changed, 55 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/loongarch/include/uapi/asm/kvm.h b/arch/loongarch/=
include/uapi/asm/kvm.h
> >>>> index ddc5cab0ffd0..c40f7d9ffe13 100644
> >>>> --- a/arch/loongarch/include/uapi/asm/kvm.h
> >>>> +++ b/arch/loongarch/include/uapi/asm/kvm.h
> >>>> @@ -82,6 +82,12 @@ struct kvm_fpu {
> >>>>    #define KVM_IOC_CSRID(REG)             LOONGARCH_REG_64(KVM_REG_L=
OONGARCH_CSR, REG)
> >>>>    #define KVM_IOC_CPUCFG(REG)            LOONGARCH_REG_64(KVM_REG_L=
OONGARCH_CPUCFG, REG)
> >>>>
> >>>> +/* Device Control API on vm fd */
> >>>> +#define KVM_LOONGARCH_VM_FEAT_CTRL     0
> >>>> +#define  KVM_LOONGARCH_VM_FEAT_X86BT   0
> >>>> +#define  KVM_LOONGARCH_VM_FEAT_ARMBT   1
> >>>> +#define  KVM_LOONGARCH_VM_FEAT_MIPSBT  2
> >>>> +
> >>>>    /* Device Control API on vcpu fd */
> >>>>    #define KVM_LOONGARCH_VCPU_CPUCFG      0
> >>>>    #define KVM_LOONGARCH_VCPU_PVTIME_CTRL 1
> >>> If you insist that LBT should be a vm feature, then I suggest the
> >>> above two also be vm features. Though this is an UAPI change, but
> >>> CPUCFG is upstream in 6.10-rc1 and 6.10-final hasn't been released. W=
e
> >>> have a chance to change it now.
> >>
> >> KVM_LOONGARCH_VCPU_PVTIME_CTRL need be attr percpu since every vcpu
> >> has is own different gpa address.
> > Then leave this as a vm feature.
> >
> >>
> >> For KVM_LOONGARCH_VCPU_CPUCFG attr, it will not changed. We cannot bre=
ak
> >> the API even if it is 6.10-rc1, VMM has already used this. Else there =
is
> >> uapi breaking now, still will be in future if we cannot control this.
> > UAPI changing before the first release is allowed, which means, we can
> > change this before the 6.10-final, but cannot change it after
> > 6.10-final.
> Now QEMU has already synced uapi to its own directory, also I never hear
> about this, with my experience with uapi change, there is only newly
> added or removed deprecated years ago.
>
> Is there any documentation about UAPI change rules?
No document, but learn from my more than 10 years upstream experience.

> >
> >>
> >> How about adding new extra features capability for VM such as?
> >> +#define  KVM_LOONGARCH_VM_FEAT_LSX   3
> >> +#define  KVM_LOONGARCH_VM_FEAT_LASX  4
> > They should be similar as LBT, if LBT is vcpu feature, they should
> > also be vcpu features; if LBT is vm feature, they should also be vm
> > features.
> On other architectures, with function kvm_vm_ioctl_check_extension()
>     KVM_CAP_XSAVE2/KVM_CAP_PMU_CAPABILITY on x86
>     KVM_CAP_ARM_PMU_V3/KVM_CAP_ARM_SVE on arm64
> These features are all cpu features, at the same time they are VM feature=
s.
>
> If they are cpu features, how does VMM detect validity of these features
> passing from command line? After all VCPUs are created and send bootup
> command to these VCPUs? That is too late, VMM main thread is easy to
> detect feature validity if they are VM features also.
>
> To be honest, I am not familiar with KVM still, only get further
> understanding after actual problems solving. Welcome to give comments,
> however please read more backgroud if you insist on, else there will be
> endless argument again.
I just say CPUCFG/LSX/LASX and LBT should be in the same class, I
haven't insisted on whether they should be vcpu features or vm
features.

Huacai

>
> Regards
> Bibo, Mao
> >
> > Huacai
> >
> >>
> >> Regards
> >> Bibo Mao
> >>>
> >>> Huacai
> >>>
> >>>> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> >>>> index 233d28d0e928..9734b4d8db05 100644
> >>>> --- a/arch/loongarch/kvm/vcpu.c
> >>>> +++ b/arch/loongarch/kvm/vcpu.c
> >>>> @@ -565,6 +565,12 @@ static int _kvm_get_cpucfg_mask(int id, u64 *v)
> >>>>                           *v |=3D CPUCFG2_LSX;
> >>>>                   if (cpu_has_lasx)
> >>>>                           *v |=3D CPUCFG2_LASX;
> >>>> +               if (cpu_has_lbt_x86)
> >>>> +                       *v |=3D CPUCFG2_X86BT;
> >>>> +               if (cpu_has_lbt_arm)
> >>>> +                       *v |=3D CPUCFG2_ARMBT;
> >>>> +               if (cpu_has_lbt_mips)
> >>>> +                       *v |=3D CPUCFG2_MIPSBT;
> >>>>
> >>>>                   return 0;
> >>>>           case LOONGARCH_CPUCFG3:
> >>>> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
> >>>> index 6b2e4f66ad26..09e05108c68b 100644
> >>>> --- a/arch/loongarch/kvm/vm.c
> >>>> +++ b/arch/loongarch/kvm/vm.c
> >>>> @@ -99,7 +99,49 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,=
 long ext)
> >>>>           return r;
> >>>>    }
> >>>>
> >>>> +static int kvm_vm_feature_has_attr(struct kvm *kvm, struct kvm_devi=
ce_attr *attr)
> >>>> +{
> >>>> +       switch (attr->attr) {
> >>>> +       case KVM_LOONGARCH_VM_FEAT_X86BT:
> >>>> +               if (cpu_has_lbt_x86)
> >>>> +                       return 0;
> >>>> +               return -ENXIO;
> >>>> +       case KVM_LOONGARCH_VM_FEAT_ARMBT:
> >>>> +               if (cpu_has_lbt_arm)
> >>>> +                       return 0;
> >>>> +               return -ENXIO;
> >>>> +       case KVM_LOONGARCH_VM_FEAT_MIPSBT:
> >>>> +               if (cpu_has_lbt_mips)
> >>>> +                       return 0;
> >>>> +               return -ENXIO;
> >>>> +       default:
> >>>> +               return -ENXIO;
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +static int kvm_vm_has_attr(struct kvm *kvm, struct kvm_device_attr =
*attr)
> >>>> +{
> >>>> +       switch (attr->group) {
> >>>> +       case KVM_LOONGARCH_VM_FEAT_CTRL:
> >>>> +               return kvm_vm_feature_has_attr(kvm, attr);
> >>>> +       default:
> >>>> +               return -ENXIO;
> >>>> +       }
> >>>> +}
> >>>> +
> >>>>    int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsi=
gned long arg)
> >>>>    {
> >>>> -       return -ENOIOCTLCMD;
> >>>> +       struct kvm *kvm =3D filp->private_data;
> >>>> +       void __user *argp =3D (void __user *)arg;
> >>>> +       struct kvm_device_attr attr;
> >>>> +
> >>>> +       switch (ioctl) {
> >>>> +       case KVM_HAS_DEVICE_ATTR:
> >>>> +               if (copy_from_user(&attr, argp, sizeof(attr)))
> >>>> +                       return -EFAULT;
> >>>> +
> >>>> +               return kvm_vm_has_attr(kvm, &attr);
> >>>> +       default:
> >>>> +               return -EINVAL;
> >>>> +       }
> >>>>    }
> >>>> --
> >>>> 2.39.3
> >>>>
> >>
>
