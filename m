Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34919100C4
	for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 17:21:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f9085f97a4so2438745e9.1
        for <loongarch@lists.linux.dev>; Fri, 23 Jun 2023 10:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540865; x=1690132865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntAK1B+5vw3HAAUlUGNV/vS4Q4AxWXXi49cu3T21XNk=;
        b=CJMuOzhU1hCDkm3ez5Xcz+IEZNJKKHHImClccH8HpAye262qXD6UVIXd2iV+IjsEAQ
         QpQFFngOicBJP6jIZmsKOXeXVd58paHmf3UT+C54HcIGH5FGSsVBKpj91RgaMKUvq7t1
         eRbylTI8+nqDxKtZEy2sdVOy8XgpSqFQyJQ2Opyv6dHJ5roR7wFZtNq497VVtJGkfxQB
         JRgrUdfhtwiVBM4nmNpq4eU1KTNJO4j53jkm+2utl4pw5wFd5gj1enQ2Fl/P3blT4bJv
         ZEQNx7IEiN13hkitB8lZCHW8qagewxro3NFvH+lm+ED28BgNyGghctOvUtt310g+yTAh
         RS0A==
X-Gm-Message-State: AC+VfDxz1Qs6bqI+NckouLoPXJviwD8mRbwiEUKP6kMx7Cr9uIeM/iZ0
	/zYiAkFyR4F2NiUNwa/SIjFxaePQMyn7D/0Cf1d9hXixbZI=
X-Google-Smtp-Source: ACHHUZ5s7hIjRJWt2aNq/S9RVpCQRl3gycJ+MNERVjT2XPdcuh3lJ7bAqXNkUY7jxXN5Vx151d0Yb1vi8LdPv7jO4kM=
X-Received: by 2002:a05:600c:1e12:b0:3f9:92e:4d99 with SMTP id
 ay18-20020a05600c1e1200b003f9092e4d99mr15246678wmb.0.1687540864915; Fri, 23
 Jun 2023 10:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230614093755.88881-1-wangliupu@loongson.cn> <CAJZ5v0iTKPbpskDVcsnVaWnhdvb5a-W2TVBfd0c=H2hVv8mOog@mail.gmail.com>
 <CAAhV-H7=+cyLK=whuYL3qD+CwFqxvSWywnLEVJ5W=0uqH+ZKiQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7=+cyLK=whuYL3qD+CwFqxvSWywnLEVJ5W=0uqH+ZKiQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 Jun 2023 19:20:53 +0200
Message-ID: <CAJZ5v0jQD2ABKy3h9FXaKpvW9gcyTXngDAcVikZKQ5PxbyEH=g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add SMT (Simultaneous Multi-Threading) support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Liupu Wang <wangliupu@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, Len Brown <lenb@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Marc Zyngier <maz@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 4:31=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Rafael,
>
> On Thu, Jun 15, 2023 at 2:24=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Wed, Jun 14, 2023 at 11:38=E2=80=AFAM Liupu Wang <wangliupu@loongson=
.cn> wrote:
> > >
> > > From: Huacai Chen <chenhuacai@loongson.cn>
> > >
> > > Loongson-3A6000 has SMT (Simultaneous Multi-Threading) support, each
> > > physical core has two logical cores (threads). This patch add SMT pro=
be
> > > and scheduler support via ACPI PPTT.
> > >
> > > If SCHED_SMT enabled, Loongson-3A6000 is treated as 4 cores, 8 thread=
s;
> > > If SCHED_SMT disabled, Loongson-3A6000 is treated as 8 cores, 8 threa=
ds.
> > >
> > > Remove smp_num_siblings to support HMP (Heterogeneous Multi-Processin=
g).
> > >
> > > Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  arch/loongarch/Kconfig                |  8 +++++++
> > >  arch/loongarch/include/asm/acpi.h     |  9 ++++++++
> > >  arch/loongarch/include/asm/cpu-info.h |  1 +
> > >  arch/loongarch/kernel/acpi.c          | 32 +++++++++++++++++++++++++=
++
> > >  arch/loongarch/kernel/proc.c          |  1 +
> > >  arch/loongarch/kernel/smp.c           | 24 +++++++++-----------
> > >  drivers/acpi/Kconfig                  |  2 +-
> > >  7 files changed, 62 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > > index d38b066fc931..6d36b681068e 100644
> > > --- a/arch/loongarch/Kconfig
> > > +++ b/arch/loongarch/Kconfig
> > > @@ -5,6 +5,7 @@ config LOONGARCH
> > >         select ACPI
> > >         select ACPI_GENERIC_GSI if ACPI
> > >         select ACPI_MCFG if ACPI
> > > +       select ACPI_PPTT if ACPI
> > >         select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
> > >         select ARCH_BINFMT_ELF_STATE
> > >         select ARCH_ENABLE_MEMORY_HOTPLUG
> > > @@ -372,6 +373,13 @@ config EFI_STUB
> > >           This kernel feature allows the kernel to be loaded directly=
 by
> > >           EFI firmware without the use of a bootloader.
> > >
> > > +config SCHED_SMT
> > > +       bool "SMT scheduler support"
> > > +       default y
> > > +       help
> > > +         Improves scheduler's performance when there are multiple
> > > +         threads in one physical core.
> > > +
> > >  config SMP
> > >         bool "Multi-Processing support"
> > >         help
> > > diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/inclu=
de/asm/acpi.h
> > > index 976a810352c6..5c78b5d2bfb7 100644
> > > --- a/arch/loongarch/include/asm/acpi.h
> > > +++ b/arch/loongarch/include/asm/acpi.h
> > > @@ -13,6 +13,7 @@ extern int acpi_strict;
> > >  extern int acpi_disabled;
> > >  extern int acpi_pci_disabled;
> > >  extern int acpi_noirq;
> > > +extern int pptt_enabled;
> > >
> > >  #define acpi_os_ioremap acpi_os_ioremap
> > >  void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size =
size);
> > > @@ -30,6 +31,14 @@ static inline bool acpi_has_cpu_in_madt(void)
> > >  }
> > >
> > >  extern struct list_head acpi_wakeup_device_list;
> > > +extern struct acpi_madt_core_pic acpi_core_pic[NR_CPUS];
> > > +
> > > +extern int __init parse_acpi_topology(void);
> > > +
> > > +static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> > > +{
> > > +       return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
> > > +}
> > >
> > >  #endif /* !CONFIG_ACPI */
> > >
> > > diff --git a/arch/loongarch/include/asm/cpu-info.h b/arch/loongarch/i=
nclude/asm/cpu-info.h
> > > index cd73a6f57fe3..900589cb159d 100644
> > > --- a/arch/loongarch/include/asm/cpu-info.h
> > > +++ b/arch/loongarch/include/asm/cpu-info.h
> > > @@ -54,6 +54,7 @@ struct cpuinfo_loongarch {
> > >         struct cache_desc       cache_leaves[CACHE_LEAVES_MAX];
> > >         int                     core;   /* physical core number in pa=
ckage */
> > >         int                     package;/* physical package number */
> > > +       int                     global_id; /* physical global thread =
number */
> > >         int                     vabits; /* Virtual Address size in bi=
ts */
> > >         int                     pabits; /* Physical Address size in b=
its */
> > >         unsigned int            ksave_mask; /* Usable KSave mask. */
> > > diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acp=
i.c
> > > index 98f431157e4c..9450e09073eb 100644
> > > --- a/arch/loongarch/kernel/acpi.c
> > > +++ b/arch/loongarch/kernel/acpi.c
> > > @@ -33,6 +33,8 @@ u64 acpi_saved_sp;
> > >
> > >  #define PREFIX                 "ACPI: "
> > >
> > > +struct acpi_madt_core_pic acpi_core_pic[NR_CPUS];
> > > +
> > >  void __init __iomem * __acpi_map_table(unsigned long phys, unsigned =
long size)
> > >  {
> > >
> > > @@ -99,6 +101,7 @@ acpi_parse_processor(union acpi_subtable_headers *=
header, const unsigned long en
> > >
> > >         acpi_table_print_madt_entry(&header->common);
> > >  #ifdef CONFIG_SMP
> > > +       acpi_core_pic[processor->core_id] =3D *processor;
> > >         set_processor_mask(processor->core_id, processor->flags);
> > >  #endif
> > >
> > > @@ -140,6 +143,35 @@ static void __init acpi_process_madt(void)
> > >         loongson_sysconf.nr_cpus =3D num_processors;
> > >  }
> > >
> > > +int pptt_enabled;
> > > +
> > > +int __init parse_acpi_topology(void)
> > > +{
> > > +       int cpu, topology_id;
> > > +
> > > +       for_each_possible_cpu(cpu) {
> > > +               topology_id =3D find_acpi_cpu_topology(cpu, 0);
> > > +               if (topology_id < 0) {
> > > +                       pr_warn("Invalid BIOS PPTT\n");
> > > +                       return -ENOENT;
> > > +               }
> > > +
> > > +               if (acpi_pptt_cpu_is_thread(cpu) <=3D 0)
> > > +                       cpu_data[cpu].core =3D topology_id;
> > > +               else {
> > > +                       topology_id =3D find_acpi_cpu_topology(cpu, 1=
);
> > > +                       if (topology_id < 0)
> > > +                               return -ENOENT;
> > > +
> > > +                       cpu_data[cpu].core =3D topology_id;
> > > +               }
> > > +       }
> > > +
> > > +       pptt_enabled =3D 1;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  #ifndef CONFIG_SUSPEND
> > >  int (*acpi_suspend_lowlevel)(void);
> > >  #else
> > > diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/pro=
c.c
> > > index 0d82907b5404..d4b270630bb5 100644
> > > --- a/arch/loongarch/kernel/proc.c
> > > +++ b/arch/loongarch/kernel/proc.c
> > > @@ -49,6 +49,7 @@ static int show_cpuinfo(struct seq_file *m, void *v=
)
> > >         seq_printf(m, "processor\t\t: %ld\n", n);
> > >         seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> > >         seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> > > +       seq_printf(m, "global_id\t\t: %d\n", cpu_data[n].global_id);
> > >         seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
> > >         seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
> > >         seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
> > > diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.=
c
> > > index ed167e244cda..062f3fe8df60 100644
> > > --- a/arch/loongarch/kernel/smp.c
> > > +++ b/arch/loongarch/kernel/smp.c
> > > @@ -8,6 +8,7 @@
> > >   * Copyright (C) 2000, 2001 Silicon Graphics, Inc.
> > >   * Copyright (C) 2000, 2001, 2003 Broadcom Corporation
> > >   */
> > > +#include <linux/acpi.h>
> > >  #include <linux/cpu.h>
> > >  #include <linux/cpumask.h>
> > >  #include <linux/init.h>
> > > @@ -37,10 +38,6 @@ EXPORT_SYMBOL(__cpu_number_map);
> > >  int __cpu_logical_map[NR_CPUS];                /* Map logical to phy=
sical */
> > >  EXPORT_SYMBOL(__cpu_logical_map);
> > >
> > > -/* Number of threads (siblings) per CPU core */
> > > -int smp_num_siblings =3D 1;
> > > -EXPORT_SYMBOL(smp_num_siblings);
> > > -
> > >  /* Representing the threads (siblings) of each logical CPU */
> > >  cpumask_t cpu_sibling_map[NR_CPUS] __read_mostly;
> > >  EXPORT_SYMBOL(cpu_sibling_map);
> > > @@ -228,9 +225,12 @@ void __init loongson_prepare_cpus(unsigned int m=
ax_cpus)
> > >  {
> > >         int i =3D 0;
> > >
> > > +       parse_acpi_topology();
> > > +
> > >         for (i =3D 0; i < loongson_sysconf.nr_cpus; i++) {
> > >                 set_cpu_present(i, true);
> > >                 csr_mail_send(0, __cpu_logical_map[i], 0);
> > > +               cpu_data[i].global_id =3D __cpu_logical_map[i];
> > >         }
> > >
> > >         per_cpu(cpu_state, smp_processor_id()) =3D CPU_ONLINE;
> > > @@ -271,10 +271,10 @@ void loongson_init_secondary(void)
> > >         numa_add_cpu(cpu);
> > >  #endif
> > >         per_cpu(cpu_state, cpu) =3D CPU_ONLINE;
> > > -       cpu_data[cpu].core =3D
> > > -                    cpu_logical_map(cpu) % loongson_sysconf.cores_pe=
r_package;
> > >         cpu_data[cpu].package =3D
> > >                      cpu_logical_map(cpu) / loongson_sysconf.cores_pe=
r_package;
> > > +       cpu_data[cpu].core =3D pptt_enabled ? cpu_data[cpu].core :
> > > +                    cpu_logical_map(cpu) % loongson_sysconf.cores_pe=
r_package;
> > >  }
> > >
> > >  void loongson_smp_finish(void)
> > > @@ -380,14 +380,10 @@ static inline void set_cpu_sibling_map(int cpu)
> > >
> > >         cpumask_set_cpu(cpu, &cpu_sibling_setup_map);
> > >
> > > -       if (smp_num_siblings <=3D 1)
> > > -               cpumask_set_cpu(cpu, &cpu_sibling_map[cpu]);
> > > -       else {
> > > -               for_each_cpu(i, &cpu_sibling_setup_map) {
> > > -                       if (cpus_are_siblings(cpu, i)) {
> > > -                               cpumask_set_cpu(i, &cpu_sibling_map[c=
pu]);
> > > -                               cpumask_set_cpu(cpu, &cpu_sibling_map=
[i]);
> > > -                       }
> > > +       for_each_cpu(i, &cpu_sibling_setup_map) {
> > > +               if (cpus_are_siblings(cpu, i)) {
> > > +                       cpumask_set_cpu(i, &cpu_sibling_map[cpu]);
> > > +                       cpumask_set_cpu(cpu, &cpu_sibling_map[i]);
> > >                 }
> > >         }
> > >  }
> > > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > > index ccbeab9500ec..00dd309b6682 100644
> > > --- a/drivers/acpi/Kconfig
> > > +++ b/drivers/acpi/Kconfig
> > > @@ -542,10 +542,10 @@ config ACPI_PFRUT
> > >
> > >  if ARM64
> > >  source "drivers/acpi/arm64/Kconfig"
> > > +endif
> > >
> > >  config ACPI_PPTT
> > >         bool
> > > -endif
> >
> > x86 doesn't use PPTT as of today.  Why do you enable it for them?
> ACPI_PPTT is an invisible symbol, it cannot be enabled by explicitly
> selecting and its default value is n, so I think it isn't enabled for
> x86. On the other hand, moving it out of ARM64 can make other archs
> don't need to modify this file any more if they need PPTT.

AFAICS, setting ACPI_PPTT causes pptt.c to be compiled and if it is
never going to be used by the given arch, it will just be dead code.

Can't this be avoided?
