Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436942E428
	for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 08:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758372; cv=none; b=NPW3JU2MMoB3sWWcc8BkhHgIOs5p1Obar0650EEE0UEHYZ3AIisvccjbS/AhFnD857uQVm9WIPbm1XuBmZ9aqmOO9wrYg5BOqHxo8L7TvClBEffe28haWHpUuvxysyI8XOAB8P2Oluo3cRXhpZBYkpefOUO+0+djXPQnQpa6SJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758372; c=relaxed/simple;
	bh=HjElaxntY8xnUxhw6KQZuVVuhU+lxBDtJVBz5oaE+hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0RAoWhs5eEfuR+uH7ez7Ggtqkcd3tAM4EYgs0Xhoc8xVNga9QF1ReVcdm2iI6zdCASNwTB4209dhdcbJ3zsWB0RWXBJH0gM5ghmXSJU4em7J7H66Y55xOVkE2mfZKt0v1MJiExfLZj5JGbZjBe5R/mRfgczSHtnySygHG46bIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+6naRo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+6naRo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173341F00898
	for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790758368;
	bh=tEqMa2rUJnofnf9+/PGZs419jdFRhPt0Rh3AWnCfvOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e+6naRo/66HizpxyLJ4XZNSl1LayN9tKis4PWJ/F+A/mlVnTiLifmBtkmq/34mXP0
	 aVWPS2EcY9oWo2jFjNsEvHUANWeOR+P5TQ7YdXWmEyR12qAkdPoKlG1Hv5mb9hPKah
	 03XT8UNxxB1y3Kca4Ih+6dfKR6YmVy4soxuNs5HwSVH54EvurpFBKih9CbpoFbQWBz
	 1OIvx3Z6dE0Vxaxs93ZzexAPhm6tBsxLSD+a5sqqOIlg0JDxOq8Vpm/n9fMIhDyEzA
	 QrWMJhAg/g+GuRr5DlsW/qztfSHHYkY20QZmyopzOQGA20IvhoGzhdKa7LG6rlao5F
	 QizvtOaLJ5Gxg==
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19959791so278222a12.3
        for <loongarch@lists.linux.dev>; Wed, 30 Sep 2026 01:52:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaTIFdkyAMOgWwKAIb9oJoQe/knENNNeMybusn+tUpLoCjcI2TI5tv6mB5QU55k99ybWfhyngZJMY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLnA6kFcSTc5dq+9YNuUURuJuQqNB0pW9pmm56DyY+IlsiBHbmq
	b+MSGZUv3HPEeFsxNUgwXRO3yx2R/kP0jj31W5IUo5tJ6j5bBO/6w8BWacY1gkldCaeR0NEEIWA
	iF+IKuz2aqj8ACK6gaT3VFhsKNjEiBfE=
X-Received: by 2002:a05:6402:274d:b0:6ac:7077:6c4b with SMTP id
 4fb4d7f45d1cf-6ae19861970mr414122a12.5.1790758366653; Wed, 30 Sep 2026
 01:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929102821.36112-1-cui.tao@linux.dev> <20260929102821.36112-5-cui.tao@linux.dev>
 <CAAhV-H5GNKZSjB_MN2Vi7uhbf1q9nqqvsfwqF+THpkwk3dEhGQ@mail.gmail.com>
 <9a59af62-3e8a-12f5-4e6c-38c1953adb37@loongson.cn> <CAAhV-H6cgiMQn=1oct6KHaLADwWQJ7Ow3iT14_Gj5BQxMW22Sg@mail.gmail.com>
 <be33489e-fec4-ba52-45d9-6323b14da593@loongson.cn>
In-Reply-To: <be33489e-fec4-ba52-45d9-6323b14da593@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Sep 2026 16:52:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5yXR8vN0NdiHWRTbGOsrqrVxZFd9g9QdaZGhdLR=BA7A@mail.gmail.com>
X-Gm-Features: AclHuK_TEVxOW5DK4WmijFXjcynX_8-WBz5OQUA00LjYbfGDjBNBBC0jU6pQ-hE
Message-ID: <CAAhV-H5yXR8vN0NdiHWRTbGOsrqrVxZFd9g9QdaZGhdLR=BA7A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
To: Bibo Mao <maobibo@loongson.cn>
Cc: Tao Cui <cui.tao@linux.dev>, gaosong@loongson.cn, zhaotianrui@loongson.cn, 
	loongarch@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@xen0n.name, nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:33=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
>
>
> On 2026/9/30 =E4=B8=8A=E5=8D=8810:24, Huacai Chen wrote:
> > On Wed, Sep 30, 2026 at 9:53=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> =
wrote:
> >>
> >>
> >>
> >> On 2026/9/29 =E4=B8=8B=E5=8D=888:43, Huacai Chen wrote:
> >>> Hi, Tao,
> >>>
> >>> On Tue, Sep 29, 2026 at 6:29=E2=80=AFPM Tao Cui <cui.tao@linux.dev> w=
rote:
> >>>>
> >>>> From: Tao Cui <cuitao@kylinos.cn>
> >>>>
> >>>> KVM_DEV_LOONGARCH_PCH_PIC_CTRL_INIT has no guard against repeated
> >>>> invocation: every call overwrites pch_pic_base and registers the sam=
e
> >>>> kvm_io_device on the MMIO bus at the new address, while
> >>>> kvm_pch_pic_destroy() unregisters only one bus range.  After a repea=
ted
> >>>> init, MMIO to the stale ranges computes its register offset against =
the
> >>>> new base and silently reads 0 / drops writes, and the leftover bus
> >>>> entries persist until the VM is destroyed.
> >>>>
> >>>> Reject repeated initialization with -EEXIST, tracking the state with
> >>>> a has_init flag so the check and the MMIO base update are atomic
> >>>> under slots_lock.  The base is only committed after a successful bus
> >>>> registration, and the real registration error is propagated instead
> >>>> of being replaced with -EFAULT.
> >>>>
> >>>> Fixes: d206d9514873 ("LoongArch: KVM: Add PCHPIC user mode read and =
write functions")
> >>>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> >>>> ---
> >>>>    arch/loongarch/include/asm/kvm_pch_pic.h |  1 +
> >>>>    arch/loongarch/kvm/intc/pch_pic.c        | 12 ++++++++++--
> >>>>    2 files changed, 11 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/loongarch/include/asm/kvm_pch_pic.h b/arch/loongar=
ch/include/asm/kvm_pch_pic.h
> >>>> index 887b0431fd20..679132d840e6 100644
> >>>> --- a/arch/loongarch/include/asm/kvm_pch_pic.h
> >>>> +++ b/arch/loongarch/include/asm/kvm_pch_pic.h
> >>>> @@ -53,6 +53,7 @@ struct loongarch_pch_pic {
> >>>>           spinlock_t lock;
> >>>>           struct kvm *kvm;
> >>>>           struct kvm_io_device device;
> >>>> +       bool has_init;
> >>>>           union pch_pic_id id;
> >>>>           uint64_t mask; /* 1:disable irq, 0:enable irq */
> >>>>           uint64_t htmsi_en; /* 1:msi */
> >>>> diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/=
intc/pch_pic.c
> >>>> index 7a704f18880d..a884a043feef 100644
> >>>> --- a/arch/loongarch/kvm/intc/pch_pic.c
> >>>> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> >>>> @@ -282,16 +282,24 @@ static int kvm_pch_pic_init(struct kvm_device =
*dev, u64 addr)
> >>>>           struct kvm_io_device *device;
> >>>>           struct loongarch_pch_pic *s =3D dev->kvm->arch.pch_pic;
> >>> Why so complicated? The below is enough, no?
> >>>
> >>> diff --git a/arch/loongarch/kvm/intc/pch_pic.c
> >>> b/arch/loongarch/kvm/intc/pch_pic.c
> >>> index 2b63b0c2c7ce..7855d78304b7 100644
> >>> --- a/arch/loongarch/kvm/intc/pch_pic.c
> >>> +++ b/arch/loongarch/kvm/intc/pch_pic.c
> >>> @@ -281,6 +281,9 @@ static int kvm_pch_pic_init(struct kvm_device
> >>> *dev, u64 addr)
> >>>           struct kvm_io_device *device;
> >>>           struct loongarch_pch_pic *s =3D dev->kvm->arch.pch_pic;
> >>>
> >>> +       if (s->device->ops)
> >>> +               return -EEXIST;
> >> This can work, however I think that it is not a good idea to access
> >> internal structure field about kvm_io_device. If so, there is no use
> >> about API kvm_iodevice_init(), just s->device->ops =3D &kvm_pch_pic_op=
s is ok.
> > I'm a little not agree. :)
> >
> > I think kvm_iodevice_init() is designed to do more work rather than
> > just set the ops (though it just set the ops now), otherwise its name
> > should be kvm_iodevice_set_ops().
> >
> > In addition, even if kvm_iodevice_init() is really a setter, there is
> > no getter for the ops, so when we need to access ops, we can only
> > open-code it.
> if so, you can try to add kvm_iodevice_get_ops API and check the
> response of KVM community.
There is not a setter, so I don't think a getter is necessary.

Moreover, you said "no other architectures directly access ops", but
in fact, __vgic_doorbell_to_its() from arch/arm64/kvm/vgic/vgic-its.c
directly accesses ops.


Huacai

>
> Regards
> Bibo Mao
> >
> >
> > Huacai
> >
> >>
> >> If adding has_init is redundant, maybe we can set s->pch_pic_base with
> >> INVALID_GPA in kvm_pch_pic_create() or some other methods. However I
> >> think directly accessing kvm_io_device::ops is not a good method, no
> >> other architectures do in such way.
> >>
> >> Regards
> >> Bibo Mao
> >>> +
> >>>           s->pch_pic_base =3D addr;
> >>>           device =3D &s->device;
> >>>           /* init device by pch pic writing and reading ops */
> >>>
> >>>>
> >>>> -       s->pch_pic_base =3D addr;
> >>>>           device =3D &s->device;
> >>>>           /* init device by pch pic writing and reading ops */
> >>>>           kvm_iodevice_init(device, &kvm_pch_pic_ops);
> >>>>           mutex_lock(&kvm->slots_lock);
> >>>> +       if (s->has_init) {
> >>>> +               ret =3D -EEXIST;
> >>>> +               goto out;
> >>>> +       }
> >>>>           /* register pch pic device */
> >>>>           ret =3D kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, addr, P=
CH_PIC_SIZE, device);
> >>>> +       if (!ret) {
> >>>> +               s->pch_pic_base =3D addr;
> >>>> +               s->has_init =3D true;
> >>>> +       }
> >>>> +out:
> >>>>           mutex_unlock(&kvm->slots_lock);
> >>>>
> >>>> -       return (ret < 0) ? -EFAULT : 0;
> >>>> +       return ret;
> >>>>    }
> >>>>
> >>>>    /* used by user space to get or set pch pic registers */
> >>>> --
> >>>> 2.43.0
> >>>>
> >>
>
>
