Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ADE1304AB
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889519; cv=none; b=jPqwRLpF/e/xKgpugs/U3APR721gC5cqjRmqyLiVnCAhnLs5uNo+htMdekNGIaD9rJGSjFjHAvdRxmDgbttPQuBr/4Mp/hmpswIh7/DINSAxQI58/8yX7U9yTlh/5AS6AYEDtIBeZuH9v9e/OLFPSinoC5SWfDf5Tr2uAHtvcTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889519; c=relaxed/simple;
	bh=mese6oT1x19qVSHCIVBwQWAA4f2xJ/TUY1HmXrJBd1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+3HCEJCySzHv//IDjL4xNcJaMFXCFPedmYie4um6mefSiXpkHgZRKN8y49Hf76GaZSQNZ6DodTEasWJin4vxBnYCdR/rbUUkDM/LNKAzCNrJu6IL0RCUew94wJlkCNU5O/OBZTrsQb0cU8yZ0rPRqP4ay2U3VEP6FrEtmGRRzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shBxTmmh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shBxTmmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3A3C4CED0
	for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728889518;
	bh=mese6oT1x19qVSHCIVBwQWAA4f2xJ/TUY1HmXrJBd1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=shBxTmmhXBpFUMKgL/HP+UI4Z4sUkZ8oZiXliMM1o6cBLe6Yk2Wkh7lG1EVIBBB/6
	 HVf+wJTD6/P5B4LbXJDp9NQdIY1aredZmrY6RHIFEpcEEf99LIpAsePG6o3svxJDgQ
	 TQDNKd72KlbHgIuuSCCdbvcEYfTGY1JqL63dDcXCpgK9rq5ScXE959vATNgu/GxCJB
	 ebZoMaiUfBOzLIx47CpwiIcXPShapMjam3djISqtXfPnN5Q5YwFzMAuFPkLRzN0roa
	 sRV+rZmkulHwOcVrUWxONqN3zYQRzpgyq10Ixt4a9XuPx3plM5xQmCOXCS31QLh36E
	 VjQw4zenIDe7Q==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso652229066b.3
        for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 00:05:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx8KPrvvEZc1umU+i5+Tplfhb/clQyZz4HIyJsuISBRajfXW6Dd
	yhpdP/ZOK859+FuTjHPvr6qSBd6tFijzTcKDFBdErYFBAzfBUM7yBPoqkacJwADA6cTdgnEScyd
	A1ydy4iVOd5aBuc93gRK3gZoh8HE=
X-Google-Smtp-Source: AGHT+IEvsobYOwAEgBGxgglMFDAntbyiVLVCbK8eeJZO6bH/8h4webSPLkUjFLKIZD8Ux2h4J4cKxZ6BtLseSDotwr0=
X-Received: by 2002:a17:907:7f12:b0:a99:f945:8776 with SMTP id
 a640c23a62f3a-a99f94588c4mr433903166b.24.1728889517314; Mon, 14 Oct 2024
 00:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014063328.1216497-1-maobibo@loongson.cn>
In-Reply-To: <20241014063328.1216497-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 14 Oct 2024 15:05:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5_SUnrf0PwOUFOA0EumKvGOmgqUq=Cx61Ub5AW=MPo=A@mail.gmail.com>
Message-ID: <CAAhV-H5_SUnrf0PwOUFOA0EumKvGOmgqUq=Cx61Ub5AW=MPo=A@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix cpu hotplug issue
To: Bibo Mao <maobibo@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lixianglai@loongson.cn, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

I'm a little confused, so please correct me if I'm wrong.

On Mon, Oct 14, 2024 at 2:33=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> On LoongArch system, there are two places to set cpu numa node. One
> is in arch specified function smp_prepare_boot_cpu(), the other is
> in generic function early_numa_node_init(). The latter will overwrite
> the numa node information.
>
> However for hot-added cpu, cpu_logical_map() fails to its physical
> cpuid at beginning since it is not enabled in ACPI MADT table. So
> function early_cpu_to_node() also fails to get its numa node for
> hot-added cpu, and generic function early_numa_node_init() will
> overwrite incorrect numa node.
For hot-added cpus, we will call acpi_map_cpu() -->
acpi_map_cpu2node() --> set_cpuid_to_node(), and set_cpuid_to_node()
operates on __cpuid_to_node[]. So I think early_cpu_to_node() should
be correct?

Huacai

>
> Here static array __cpu_to_node and api set_early_cpu_to_node()
> is added, so that early_cpu_to_node is consistent with function
> cpu_to_node() for hot-added cpu.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/numa.h |  2 ++
>  arch/loongarch/kernel/numa.c      | 10 +++++++++-
>  arch/loongarch/kernel/smp.c       |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/numa.h b/arch/loongarch/include/a=
sm/numa.h
> index b5f9de9f102e..e8e6fcfb006a 100644
> --- a/arch/loongarch/include/asm/numa.h
> +++ b/arch/loongarch/include/asm/numa.h
> @@ -50,6 +50,7 @@ static inline void set_cpuid_to_node(int cpuid, s16 nod=
e)
>  }
>
>  extern int early_cpu_to_node(int cpu);
> +extern void set_early_cpu_to_node(int cpu, s16 node);
>
>  #else
>
> @@ -57,6 +58,7 @@ static inline void early_numa_add_cpu(int cpuid, s16 no=
de)    { }
>  static inline void numa_add_cpu(unsigned int cpu)              { }
>  static inline void numa_remove_cpu(unsigned int cpu)           { }
>  static inline void set_cpuid_to_node(int cpuid, s16 node)      { }
> +static inline void set_early_cpu_to_node(int cpu, s16 node)    { }
>
>  static inline int early_cpu_to_node(int cpu)
>  {
> diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
> index 84fe7f854820..62508aace644 100644
> --- a/arch/loongarch/kernel/numa.c
> +++ b/arch/loongarch/kernel/numa.c
> @@ -34,6 +34,9 @@ static struct numa_meminfo numa_meminfo;
>  cpumask_t cpus_on_node[MAX_NUMNODES];
>  cpumask_t phys_cpus_on_node[MAX_NUMNODES];
>  EXPORT_SYMBOL(cpus_on_node);
> +static s16 __cpu_to_node[NR_CPUS] =3D {
> +       [0 ... CONFIG_NR_CPUS - 1] =3D NUMA_NO_NODE
> +};
>
>  /*
>   * apicid, cpu, node mappings
> @@ -117,11 +120,16 @@ int early_cpu_to_node(int cpu)
>         int physid =3D cpu_logical_map(cpu);
>
>         if (physid < 0)
> -               return NUMA_NO_NODE;
> +               return __cpu_to_node[cpu];
>
>         return __cpuid_to_node[physid];
>  }
>
> +void set_early_cpu_to_node(int cpu, s16 node)
> +{
> +       __cpu_to_node[cpu] =3D node;
> +}
> +
>  void __init early_numa_add_cpu(int cpuid, s16 node)
>  {
>         int cpu =3D __cpu_number_map[cpuid];
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 9afc2d8b3414..998668be858c 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -512,6 +512,7 @@ void __init smp_prepare_boot_cpu(void)
>                         set_cpu_numa_node(cpu, node);
>                 else {
>                         set_cpu_numa_node(cpu, rr_node);
> +                       set_early_cpu_to_node(cpu, rr_node);
>                         rr_node =3D next_node_in(rr_node, node_online_map=
);
>                 }
>         }
>
> base-commit: 6485cf5ea253d40d507cd71253c9568c5470cd27
> --
> 2.39.3
>
>
