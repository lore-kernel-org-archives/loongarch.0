Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162685;
	b=xd6HnXqkTN7viKyRl/ChUIbFRa1yWGPTTGf21qrs4UuReTYBHg6cX9xLxSWBaCbkwuj+
	 pLBukW1SpbMNj5W3GW+yCeXdX7svNvuSaGzWIojREDHPJlqQ6V7HECSQaxaUjPjG+B9kt
	 NSO/G+gZmlSRvox70MB7nSJNklJXAsF1PhhXuECaWu7ujUfwu8Uw8XadYlTfGTAGd5lvb
	 q1dZtkOinYP1bL/BRWuKe1jNpkAp2nSK5SWYcZbX3m2XCaokO9nrmKIQIrcWg97mAxaTq
	 X3OsoZB0nXa+O1BRNIZtVMUjQBy7gf1i4P/asZXuUIEkyIl9NB4VEzDWXHHvux2KYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162685;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9/frLhMQMe7GkO3PY028XU6pdcaZkpb++W3LM91GcfM=;
	b=Q6LATQO53fqDH7df4+FdPJ7m7BggyVcLpkSNxEGwRgzNqNva9Ius5Vq1N96TQmkhh9VB
	 Hve3JvTgySgY8aDoAKv4zZnr2KWFeQFrfGZCIs9Jb0prUl/ez1M+qHRriwNaJ4Mmd+A9L
	 nXttuRyokxCRSWVloscjH7G9YgHHmAm+NtmsOjFPGKf1j7A7BO560nsQ42ZMHajyqs1dm
	 YGtpKyH1Dq20YFQ4LdanmaimIhvzlM8GTR5+cUDo5+EakQjvEugBhYhmRu1DeKz+l3ivQ
	 K0OdG35dtC8+sU8b/PrpQOT4uvFDmD8Qp+m8x+b/19sZx4gpecCCL8sLytrVsmyzHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RgjCEuZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A86F606A337
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RgjCEuZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86B11F000D0
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162684;
	bh=9/frLhMQMe7GkO3PY028XU6pdcaZkpb++W3LM91GcfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RgjCEuZoxvN4bg6ixS49y3kC3BwhT5nknkuaE26WVpUs8l9+QznK1mk6dWOmcvJgW
	 f9XH8jP2gyVzsCYdHrNgK5imAy0u1IbD4EJ16qFfz00V0AA+g/OuhoFsDsdz4GNdqD
	 8LApH8/1vr+XZd24/QLxbv3cH5Dvh2qharDJ+1gsys7svchPQj7vPwjjAeds+6ugkf
	 1QUDBl0A7UDQM+QBxQ399ZzSKHNzsdHyXoNfe/IXZOH5iFe75D91KMWBSzWuqrITIb
	 xw6fogEy3gOH0jdFNJ4OlHQ+5Px+/+P1Rj/eMSY4tyH9dHSJItqjWAJTWyVsTOgV4j
	 Dz+T4Hd81md2g==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so778479a12.3
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 00:18:04 -0800 (PST)
X-Gm-Message-State: APuU4Z96M5/5tAZcaHm6tQzJfAag/KVgs+wN+UZffsepyFsD1sXzk6DL
	zdWeBYJBhxNes9nf8NYMZmQo2nJWzJVLR62tncFWAarl++stvF1EsajIsn19LTk+kfY90wEK6Zh
	XEKp+VDzcqTypdi5cWVhiJG4qbVtQj7I=
X-Received: by 2002:a05:6402:3207:b0:6b5:8222:cd12 with SMTP id
 4fb4d7f45d1cf-6ba37eb3c1dmr1543593a12.37.1795162682105; Fri, 20 Nov 2026
 00:18:02 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119123307.28574-1-yangtiezhu@loongson.cn>
In-Reply-To: <20261119123307.28574-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:17:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6mWx+keyL-p9tpH3Feyd9N2ypz-DwncG_t=wJ0BbyatA@mail.gmail.com>
X-Gm-Features: AclHuK938omq3MLgH7c0mDyD4skIieIpBmCENxkKeJ91eNHkumIGDepo719KC4s
Message-ID: <CAAhV-H6mWx+keyL-p9tpH3Feyd9N2ypz-DwncG_t=wJ0BbyatA@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Fix preemptible warnings from smp_processor_id()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Nov 19, 2026 at 8:33=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
> smp_processor_id() (including via current_cpu_data) in preemptible
> contexts trigger numerous "using smp_processor_id() in preemptible"
> warnings during cacheinfo setup and local TLB flushes.
>
> Furthermore, disabling preemption in local TLB flushes is strictly
> required for safety even on preemptible UP kernels. On !CONFIG_SMP,
> flush_tlb_{mm,range,page}() map directly to local_flush_tlb_*(),
> bypassing the preemption protection in smp.c. Without preemption
> disabled, a context switch after asid_valid() can trigger an ASID
> generation rollover and corrupt the ASID state mid-operation.
>
> Fix the callers properly:
> - Use the passed-in 'cpu' parameter to index cpu_data[cpu] directly
>   in init_cache_level() and populate_cache_leaves().
> - Use get_cpu() and put_cpu() in local_flush_tlb_{range, page}(),
>   and reuse cpu_data[cpu] in local_flush_tlb_range().
> - Also convert local_flush_tlb_mm() to use get_cpu() and put_cpu()
>   for consistency.
>
> This eliminates warnings on Non-SMP builds while ensuring strict
> preemption safety in preemptible UP configurations.
>
> Fixes: b61a40afca16 ("LoongArch: Refactor cache probe and flush methods")
> Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> v3: Restore get_cpu()/put_cpu() in local TLB flush functions to prevent
>     ASID rollover races on preemptible UP kernels.
> v2: Use raw_smp_processor_id() instead of get_cpu()/put_cpu() in local
>     TLB flush functions.
>
>  arch/loongarch/kernel/cacheinfo.c |  8 ++++----
>  arch/loongarch/mm/tlb.c           | 22 +++++++++++-----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/loongarch/kernel/cacheinfo.c b/arch/loongarch/kernel/ca=
cheinfo.c
> index 8e231b0d2cd6..334d116e4c29 100644
> --- a/arch/loongarch/kernel/cacheinfo.c
> +++ b/arch/loongarch/kernel/cacheinfo.c
> @@ -11,11 +11,11 @@
>
>  int init_cache_level(unsigned int cpu)
>  {
> -       int cache_present =3D current_cpu_data.cache_leaves_present;
> +       int cache_present =3D cpu_data[cpu].cache_leaves_present;
>         struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>
>         this_cpu_ci->num_levels =3D
> -               current_cpu_data.cache_leaves[cache_present - 1].level;
> +               cpu_data[cpu].cache_leaves[cache_present - 1].level;
>         this_cpu_ci->num_leaves =3D cache_present;
>
>         return 0;
> @@ -67,10 +67,10 @@ static void cache_cpumap_setup(unsigned int cpu)
>
>  int populate_cache_leaves(unsigned int cpu)
>  {
> -       int i, cache_present =3D current_cpu_data.cache_leaves_present;
> +       int i, cache_present =3D cpu_data[cpu].cache_leaves_present;
>         struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>         struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> -       struct cache_desc *cd, *cdesc =3D current_cpu_data.cache_leaves;
> +       struct cache_desc *cd, *cdesc =3D cpu_data[cpu].cache_leaves;
>
>         for (i =3D 0; i < cache_present; i++) {
>                 cd =3D cdesc + i;
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index aaf7d685cc2a..ea52a55ca85e 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -40,25 +40,21 @@ EXPORT_SYMBOL(local_flush_tlb_kernel);
>   */
>  void local_flush_tlb_mm(struct mm_struct *mm)
>  {
> -       int cpu;
> -
> -       preempt_disable();
> -
> -       cpu =3D smp_processor_id();
> +       int cpu =3D get_cpu();
>
>         if (asid_valid(mm, cpu))
>                 drop_mmu_context(mm, cpu);
>         else
>                 cpumask_clear_cpu(cpu, mm_cpumask(mm));
>
> -       preempt_enable();
> +       put_cpu();
>  }
>
>  void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long sta=
rt,
>         unsigned long end)
>  {
>         struct mm_struct *mm =3D vma->vm_mm;
> -       int cpu =3D smp_processor_id();
> +       int cpu =3D get_cpu();
>
>         if (asid_valid(mm, cpu)) {
>                 unsigned long size, flags;
> @@ -67,9 +63,9 @@ void local_flush_tlb_range(struct vm_area_struct *vma, =
unsigned long start,
>                 start =3D round_down(start, PAGE_SIZE << 1);
>                 end =3D round_up(end, PAGE_SIZE << 1);
>                 size =3D (end - start) >> (PAGE_SHIFT + 1);
> -               if (size <=3D (current_cpu_data.tlbsizestlbsets ?
> -                            current_cpu_data.tlbsize / 8 :
> -                            current_cpu_data.tlbsize / 2)) {
> +               if (size <=3D (cpu_data[cpu].tlbsizestlbsets ?
> +                            cpu_data[cpu].tlbsize / 8 :
> +                            cpu_data[cpu].tlbsize / 2)) {
>                         int asid =3D cpu_asid(cpu, mm);
>
>                         while (start < end) {
> @@ -83,6 +79,8 @@ void local_flush_tlb_range(struct vm_area_struct *vma, =
unsigned long start,
>         } else {
>                 cpumask_clear_cpu(cpu, mm_cpumask(mm));
>         }
> +
> +       put_cpu();
>  }
>
>  void local_flush_tlb_kernel_range(unsigned long start, unsigned long end=
)
> @@ -112,7 +110,7 @@ void local_flush_tlb_kernel_range(unsigned long start=
, unsigned long end)
>
>  void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page=
)
>  {
> -       int cpu =3D smp_processor_id();
> +       int cpu =3D get_cpu();
>
>         if (asid_valid(vma->vm_mm, cpu)) {
>                 int newpid;
> @@ -123,6 +121,8 @@ void local_flush_tlb_page(struct vm_area_struct *vma,=
 unsigned long page)
>         } else {
>                 cpumask_clear_cpu(cpu, mm_cpumask(vma->vm_mm));
>         }
> +
> +       put_cpu();
>  }
>
>  /*
> --
> 2.42.0
>
