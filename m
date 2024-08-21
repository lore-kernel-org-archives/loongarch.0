Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308F199FA5
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724246084; cv=none; b=nG67sy+PUCpZJuakS4gdhFpoulgcaMuJamPm8IdlvmKDv+crl3jW4Pvo61Vrjohjln1a9xSvJnfmeSoRrjZe77GJdMM0trgf/XdVH1DydYmTlkhjxY7fDxjj8SLYG3RNPtlgQlfICsKymTv008juZZsu9mT9aCBKffboAWodJy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724246084; c=relaxed/simple;
	bh=zJVdbgK4PuySLtBpCnVhjJ0wV4eDUh7CxNJ/l6R0G/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfMYvU4P/j4MHKI7OwIVjNRok27naFbPqlj1IAkJ4XZw0hA0N0kF20xCJD8TbMPNH+BzakLo4AFU/AHSVSGr9SJaSNIGWdkugYHKGVC0zqpiMkrZ7jtuhCSg9+OuG+9ruunZcFTkLjl3QuT1AXJCOt9nI8wQBfwD9rb5kLVRx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0Cs+4a1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0Cs+4a1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2387FC4AF17
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724246084;
	bh=zJVdbgK4PuySLtBpCnVhjJ0wV4eDUh7CxNJ/l6R0G/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a0Cs+4a1gTfAA6Qpj52TLcexEzsTbt+8d6VXpd31V6hXIDKudKbHKsquHnrm2vN39
	 plx+DhDJC2YuoSh9bZCKOg1QAhmqRCVEM22t8YgC08eDli9NtWSQOdW6T6DkBJMWXY
	 rBplzcyegLGIJl/B3+ztDolv/kx2zvlYl71POvtAAetMVyWBcJA7082a0Kx2jj4Yxr
	 WlHaamwbfDRipl3PVh2TdQ4qPisA0SO/KkNViLoxwtQLQxZC7X5vwH6+DX9O9yHgxh
	 L8SVfPtXqCcYQDwGSX1xKfYpVUUyHxtzwePCDzTr2JYJ5k8As4pnHxt3OHvwcoHR21
	 CwgcO053Klo/Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so18671991fa.2
        for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 06:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmgFPu2lXUNyp9usRJXLuQE0sPeOMD2GAHdYkOjx2pSBG2Px2CUd1N/SBZ6oDgGAUWgRPtZE09Nd4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoKyN3rTM4aR1yloONNP4XJC7edAdeIBykEzbGaZJzZMBw79+p
	h+CT1pwdupOsYFNCkXZU9wRAtZcwrchyOGYq/WGg77jspi7ru4jmBfQavzul0D9f/oaWi7pe8Qs
	oAykvSEpMD/19N56M0Ufusa8YEog=
X-Google-Smtp-Source: AGHT+IFp/bJomoopeOJowttCDFy1h5Urtm6xc4mDMzGDWnQLDi3tEBgocFTcLWGoAEAIeiITNZsbaC1UCqGJx66FrKA=
X-Received: by 2002:a2e:4c0a:0:b0:2f3:f25a:15a3 with SMTP id
 38308e7fff4ca-2f3f88efccfmr13904561fa.25.1724246082131; Wed, 21 Aug 2024
 06:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815112608.26925-1-zhangtianyang@loongson.cn>
 <20240815112608.26925-3-zhangtianyang@loongson.cn> <87msl7jgye.ffs@tglx>
In-Reply-To: <87msl7jgye.ffs@tglx>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 21 Aug 2024 21:14:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H424SB_Ff6y4m4Cb7Cx9eWTLbK08Wycwa803y08qWVoOA@mail.gmail.com>
Message-ID: <CAAhV-H424SB_Ff6y4m4Cb7Cx9eWTLbK08Wycwa803y08qWVoOA@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] irqchip/loongarch-avec: Add AVEC irqchip support
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, corbet@lwn.net, alexs@kernel.org, 
	kernel@xen0n.name, jiaxun.yang@flygoat.com, gaoliang@loongson.cn, 
	wangliupu@loongson.cn, lvjianmin@loongson.cn, yijun@loongson.cn, 
	mhocko@suse.com, akpm@linux-foundation.org, dianders@chromium.org, 
	maobibo@loongson.cn, xry111@xry111.site, zhaotianrui@loongson.cn, 
	nathan@kernel.org, yangtiezhu@loongson.cn, zhoubinbin@loongson.cn, 
	loongarch@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

Just some complements for Tianyang.

On Wed, Aug 21, 2024 at 12:29=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> On Thu, Aug 15 2024 at 19:26, Tianyang Zhang wrote:
> >  .../arch/loongarch/irq-chip-model.rst         |  32 ++
> >  .../zh_CN/arch/loongarch/irq-chip-model.rst   |  32 ++
> >  arch/loongarch/Kconfig                        |   1 +
> >  arch/loongarch/include/asm/cpu-features.h     |   1 +
> >  arch/loongarch/include/asm/cpu.h              |   2 +
> >  arch/loongarch/include/asm/hardirq.h          |   3 +-
> >  arch/loongarch/include/asm/hw_irq.h           |   2 +
> >  arch/loongarch/include/asm/irq.h              |  25 +-
> >  arch/loongarch/include/asm/loongarch.h        |  18 +-
> >  arch/loongarch/include/asm/smp.h              |   2 +
> >  arch/loongarch/kernel/cpu-probe.c             |   3 +-
> >  arch/loongarch/kernel/irq.c                   |  15 +-
> >  arch/loongarch/kernel/paravirt.c              |   5 +
> >  arch/loongarch/kernel/smp.c                   |   6 +
> >  drivers/irqchip/Makefile                      |   2 +-
> >  drivers/irqchip/irq-loongarch-avec.c          | 426 ++++++++++++++++++
> >  drivers/irqchip/irq-loongarch-cpu.c           |   5 +-
> >  drivers/irqchip/irq-loongson-eiointc.c        |   7 +-
> >  drivers/irqchip/irq-loongson-pch-msi.c        |  24 +-
> >  include/linux/cpuhotplug.h                    |   3 +-
>
> This patch is doing too many things at once and is absolutely not
> reviewable.
>
> Please split it up into the obvious bits and pieces:
Splitting may cause another problem: some patches will get upstream
via the arch tree and others via the irq tree. These dependencies may
cause build errors in a certain tree. But anyway, we will try our best
to do this.

>
>    1) The IRQ_NOPROBE change
>
>    2) See below
>
>    3) Documentation
>
>    4) Add the arch/loongson parts, i.e. all the defines and
>       basic required function prototypes with a little twist.
>       Add a Kconfig symbol:
>
>         Kconfig IRQ_LOONGARCH_AVEC
>                 bool
>
>       in drivers/irqchip/Kconfig. This allows you to add all
>       arch/loongarch/ changes with the simple tweak:
>
>       #ifdef CONFIG_IRQ_LOONGARCH_AVEC
>       # define cpu_has_avecint          cpu_opt(LOONGARCH_CPU_AVECINT)
>       #else
>       # define cpu_has_avecint          false
>       #endif
>
>       and
>
>       #ifdef CONFIG_IRQ_LOONGARCH_AVEC
>       # define SMP_CLEAR_VECTOR         BIT(ACTION_CLEAR_VECTOR)
>       #else
>       # define SMP_CLEAR_VECTOR         (0)
>       #endif
>
>       That way the compiler will optimize out stuff like the
>       SMP_CLEAR_VECTOR handling and you only need the prototype of
>       complete_irq_moving(), but no implementation.
These macros are not in hot-path, and we have already tried our best
to avoid using #ifdefs for cpu_has_xxx, so I suggest not introduce a
new Kconfig option. Moreover, the new option should always be selected
due to the deep coupling among loongson's irqchips, which makes the
#ifdefs useless.

>
>    5) Change the CPU hotplug callback for EOINTC and do
>       the acpi_cascade_irqdomain_init() change.
>
>    6) Prepare get_pch_msi_handle() in the pch MSI driver
>
>    7) Implement the driver and select IRQ_LOONGARCH_AVEC
>       from IRQ_LOONGARCH_CPU
>
>    8) Remove the IRQ_LOONGARCH_AVEC helpers
>
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index 70f169210b52..0e3abf7b0bd3 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -85,6 +85,7 @@ config LOONGARCH
> >       select GENERIC_ENTRY
> >       select GENERIC_GETTIMEOFDAY
> >       select GENERIC_IOREMAP if !ARCH_IOREMAP
> > +     select GENERIC_IRQ_MATRIX_ALLOCATOR
>
> Please move this to IRQ_LOONGARCH_CPU in patch #7
>
> > @@ -92,15 +103,21 @@ int liointc_acpi_init(struct irq_domain *parent,
> >                                       struct acpi_madt_lio_pic *acpi_li=
ointc);
> >  int eiointc_acpi_init(struct irq_domain *parent,
> >                                       struct acpi_madt_eio_pic *acpi_ei=
ointc);
> > +int avecintc_acpi_init(struct irq_domain *parent);
> > +
> > +void complete_irq_moving(void);
> >
> >  int htvec_acpi_init(struct irq_domain *parent,
> >                                       struct acpi_madt_ht_pic *acpi_htv=
ec);
> >  int pch_lpc_acpi_init(struct irq_domain *parent,
> >                                       struct acpi_madt_lpc_pic *acpi_pc=
hlpc);
> > -int pch_msi_acpi_init(struct irq_domain *parent,
> > -                                     struct acpi_madt_msi_pic *acpi_pc=
hmsi);
> >  int pch_pic_acpi_init(struct irq_domain *parent,
> >                                       struct acpi_madt_bio_pic *acpi_pc=
hpic);
> > +int pch_msi_acpi_init(struct irq_domain *parent,
> > +                                     struct acpi_madt_msi_pic *acpi_pc=
hmsi);
> > +int pch_msi_acpi_init_v2(struct irq_domain *parent,
> > +                                     struct acpi_madt_msi_pic *acpi_pc=
hmsi);
>
> This is really the wrong place for all these prototypes. They are only
> used in drivers/irqchip/... except for complete_irq_moving().
>
> So the proper place for them is drivers/irqchip/irq-loongarch.h
irq-loongson.h is a little better because those drivers are shared by
MIPS and LoongArch.

>
> Move them there. This is patch #2 which I referred to above.
>
> >
> > +static phys_addr_t msi_base_addr;
> >
>
> So you have everything related to the avec chip in loongarch_avec, so
> why don't you move that into that data structure?
>
> > +struct avecintc_chip {
> > +     struct fwnode_handle    *fwnode;
> > +     struct irq_domain       *domain;
> > +     struct irq_matrix       *vector_matrix;
> > +     raw_spinlock_t          lock;
> > +};
>
> The lock should be the first member as spinlocks have alignment
> requirements....
>
> > +static int avecintc_domain_alloc(struct irq_domain *domain,
> > +                              unsigned int virq, unsigned int nr_irqs,=
 void *arg)
> > +{
> > +     guard(raw_spinlock_irqsave)(&loongarch_avec.lock);
> > +
> > +     for (unsigned int i =3D 0; i < nr_irqs; i++) {
> > +             struct irq_data *irqd =3D irq_domain_get_irq_data(domain,=
 virq + i);
> > +             struct avecintc_data *adata =3D kzalloc(sizeof(*adata), G=
FP_KERNEL);
>
> That was never tested with any debug. You _cannot_ do a GFP_KERNEL
> allocation with the raw spinlock held. And no, don't use
> GFP_ATOMIC. There is absolutely zero reason to hold the lock accross all
> of that. As you got your ideas from x86_vector_alloc_irqs(), you could
> have looked at how that's done correctly.
>
> > +             unsigned int cpu, ret;
> > +
> > +             if (!adata)
> > +                     return -ENOMEM;
> > +
> > +             ret =3D irq_matrix_alloc(loongarch_avec.vector_matrix, cp=
u_online_mask, false, &cpu);
> > +             if (ret < 0) {
> > +                     kfree(adata);
> > +                     return ret;
> > +             }
> > +
> > +             adata->moving =3D 0;
>
> Redundant. The struct is allocated with kzalloc()...
>
> > +             adata->prev_cpu =3D adata->cpu =3D cpu;
> > +             adata->prev_vec =3D adata->vec =3D ret;
> > +             adata->managed =3D irqd_affinity_is_managed(irqd);
>
> If you want to support managed interrupts, then you cannot allocate
> from the CPU online mask. See x86...
>
> > +             irq_domain_set_info(domain, virq + i, virq + i, &avec_irq=
_controller,
> > +                                 adata, handle_edge_irq, NULL, NULL);
> > +             irqd_set_single_target(irqd);
> > +             irqd_set_affinity_on_activate(irqd);
> > +
> > +             per_cpu_ptr(irq_map, adata->cpu)[adata->vec] =3D irq_data=
_to_desc(irqd);
>
> static int avecintc_alloc_vector(struct avecintc_adata *adata)
> {
>         int ret, cpu;
>
>         guard(raw_spinlock_irqsave)(&loongarch_avec.lock);
>         ret =3D irq_matrix_alloc(loongarch_avec.vector_matrix, cpu_online=
_mask, false, &cpu);
>         if (ret < 0)
>               return ret;
>
>         adata->prev_cpu =3D adata->cpu =3D cpu;
>         adata->prev_vec =3D adata->vec =3D ret;
>         per_cpu_ptr(irq_map, adata->cpu)[adata->vec] =3D irq_data_to_desc=
(irqd);
>         return 0;
> }
>
> static int avecintc_domain_alloc(struct irq_domain *domain, ...)
> {
>         for (unsigned int i =3D 0; i < nr_irqs; i++) {
>                 struct irq_data *irqd =3D irq_domain_get_irq_data(domain,=
 virq + i);
>                 struct avecintc_data *adata =3D kzalloc(sizeof(*adata), G=
FP_KERNEL);
>                 int ret;
>
>                 if (!adata)
>                         return -ENOMEM;
>
>                 irq_domain_set_info(domain, virq + i, virq + i, &avec_irq=
_controller,
>                                     adata, handle_edge_irq, NULL, NULL);
>                 irqd_set_single_target(irqd);
>                 irqd_set_affinity_on_activate(irqd);
>
>                 ret =3D avecintc_alloc_vector(adata);
>                 if (ret < 0) {
>                         kfree(adata);
>                         return ret;
>                 }
>          }
> No?
>
> > +static void clear_free_vector(struct irq_data *irqd)
> > +{
> > +     struct avecintc_data *adata =3D irq_data_get_irq_chip_data(irqd);
> > +     bool managed =3D irqd_affinity_is_managed(irqd);
>
> Don't even try. Your managed support is broken at the allocation side
> and at several other places.
I'm a bit confused here, irq_create_affinity_masks() marks some
interrupts "managed". So if we completely ignore "managed" here, then
can irq_create_affinity_masks() still work? Or the two has nothing to
do with each other?

Huacai

>
> > +     per_cpu(irq_map, adata->cpu)[adata->vec] =3D NULL;
> > +     irq_matrix_free(loongarch_avec.vector_matrix, adata->cpu, adata->=
vec, managed);
> > +     adata->cpu =3D UINT_MAX;
> > +     adata->vec =3D UINT_MAX;
> > +
> > +#ifdef CONFIG_SMP
> > +     if (!adata->moving)
> > +             return;
> > +
> > +     per_cpu(irq_map, adata->prev_cpu)[adata->prev_vec] =3D NULL;
> > +     irq_matrix_free(loongarch_avec.vector_matrix,
> > +                     adata->prev_cpu, adata->prev_vec, adata->managed)=
;
> > +     adata->moving =3D 0;
> > +     adata->prev_vec =3D UINT_MAX;
> > +     adata->prev_cpu =3D UINT_MAX;
>
> What's all the clearing for when you kfree() it two lines further down?
>
> > +     list_del_init(&adata->entry);
> > +#endif
> > +     kfree(adata);
>
> And no, not under the lock .... Move the locking into this function and
> kfree() at the call site. There is zero reason to hold the lock over the
> full loop.
>
> > +static int __init pch_msi_parse_madt(union acpi_subtable_headers *head=
er,
> > +                                  const unsigned long end)
> > +{
> > +     struct acpi_madt_msi_pic *pchmsi_entry =3D (struct acpi_madt_msi_=
pic *)header;
> > +
> > +     msi_base_addr =3D pchmsi_entry->msg_address - AVEC_MSG_OFFSET;
> > +
> > +     return pch_msi_acpi_init_v2(loongarch_avec.domain, pchmsi_entry);
> > +}
>
> ...
>
> > +int __init pch_msi_acpi_init_v2(struct irq_domain *parent, struct acpi=
_madt_msi_pic *acpi_pchmsi)
>
> The second argument is required because?
>
> Thanks,
>
>         tglx
>
