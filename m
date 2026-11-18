Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987826;
	b=4u7IWCYrU1oy4oGYjShdiC0p/ZeEsmS2DA9DpM7gps3OtxFM44GTSdFO3Rs3Jc1UW7qf
	 MaCc92M9yFl+p03VhFkL/+guZgH+wXv9nuZ8SYfMvYtWp+Thvds+QjegN+J91S35bo4hA
	 xeyKyZAw9OyPTwY81L0rOD96K9CnmL4aCIot+zl9eghyFC7rlg6i3Bpl6z1Xkl/5HtG0/
	 yGqhOFXytD52F3tThPrFNWe3DsdEbfhcPa8yx83Vw4bSBEIQu2grbuJ/iP5eBL09MAj/o
	 tnIJjSNXsOWP8cy6UMCrw6CwakqjrLRO289dy3vnHTeDQxVBs+HndUDQ/X2/Pc7LOYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987826;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/qN+6LtVRqzfP3UHzEAgHQks8jfWwjKEKIfLOFdp7dY=;
	b=PRwUaLAJl2rba32mYUPdobenDDKC5c7nWrOzF12YPkStxGJXCh4RMF61AifrVD/o+T8n
	 rD61icAoWPG/39hOSwtdSuaQ+RGdbn7BMgwk7KPtwpiRFh5o+QQmNClCBBjK8l3+X2wKR
	 5cSXlbZZPEF7OYTZl/UV3cFCH28v7pfh7xcqK6+epXNi0dK1hdCgrz4mX4mvLXFVQSo/C
	 CHx/9XTQ8SNq31Y1uOKGlJWeBwCDTsN2nve9IAjOLY+yIXFn6poMFuEV91KAZIDCfwBi2
	 LyfJ4/KcNfD5RFO8HwekItFY7vqLewfxZw1IyEMCZ2hLnSK9CNOMlWH+c0WujsS3iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BuW/Sl7f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA471606A31C
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BuW/Sl7f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85521F000C8
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987825;
	bh=/qN+6LtVRqzfP3UHzEAgHQks8jfWwjKEKIfLOFdp7dY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BuW/Sl7fLdIK7h5FbOk8PcU1Ls2wIFrmkLJqlyrHBJv6Y9rMXd7f5jL86LaMqP2Fv
	 la7qi5e2oJe2osDafmmCGnZIiy9AI1FR1qAxhzw2HAJ1If2to0egBqCJHTteUn/HVQ
	 6MPCR6iKg0Bfecoafi3BrqDlbpCCobiet5rUkMncu56nlelQu4tUXjiuy0BcwJeo28
	 JW9XkUt6O/xBznxycAYAiAfaIeaG9gGWScTMfeLphwCIMSJ2TEAkeez/zvMkYegNei
	 DnYyOcttFgZyp7NMkXdzLheHflJtAo1/YC6No9Vah3s+ML2iEUKKi8O7cMjUWTgkD9
	 puwmFBvlBGwPQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so459231a12.2
        for <loongarch@lists.linux.dev>; Tue, 17 Nov 2026 23:43:45 -0800 (PST)
X-Gm-Message-State: APuU4Z9hX/3AzIXk0pVu8rRC1KTvhE62+qngvPCTxU/EmUCjHWIeSbl2
	6pQNqWuFw9MhN/vKpBCvfbOE+w+q4k7Z2ays39Xpesn5+grqIaXt8aUojlXLzxZosU3DHALGR/W
	8ksJC4dJ5q7A3VMRuDx5xbh+uWKhfp6M=
X-Received: by 2002:a05:6402:a510:20b0:6b6:8ed8:765a with SMTP id
 4fb4d7f45d1cf-6b887ec9568mr795186a12.38.1794987824468; Tue, 17 Nov 2026
 23:43:44 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111113738.862-1-yangtiezhu@loongson.cn>
In-Reply-To: <20261111113738.862-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:43:34 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WtgeVh2TDYd_g7t6M=uHHzA+8hm2YcuUSZ4GY2vfB5g@mail.gmail.com>
X-Gm-Features: AclHuK_h8JNTX-5Meu7QfVVVQqwUSxk0h8ch28jLABiFynCybHXEvnfXl6-LMUc
Message-ID: <CAAhV-H4WtgeVh2TDYd_g7t6M=uHHzA+8hm2YcuUSZ4GY2vfB5g@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix preemptible warnings in cacheinfo and
 local TLB flush
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Wed, Nov 11, 2026 at 7:37=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
> smp_processor_id() (including via current_cpu_data) in preemptible
> contexts trigger many "BUG: using smp_processor_id() in preemptible"
> warnings during cacheinfo setup and local TLB flushes.
The cacheinfo part is fine, but the tlb part can just use
raw_processor_id(). For the SMP case, tlb functions are already
protected, and for the UP case, migration is impossible.

Huacai

>
> Moreover, accessing current CPU data without preemption disabled in
> local TLB flushes is also unsafe on SMP systems.
>
> Fix the callers properly:
> - Use the passed-in 'cpu' parameter to index cpu_data[cpu] directly
>   in init_cache_level() and populate_cache_leaves().
> - Protect the critical sections with get_cpu()/put_cpu() and reuse
>   cpu_data[cpu] in local_flush_tlb_{range, page}().
> - Also convert local_flush_tlb_mm() to use get_cpu()/put_cpu() for
>   consistency.
>
> This eliminates the warnings on Non-SMP builds while ensuring strict
> preemption safety on SMP systems.
>
> Fixes: b61a40afca16 ("LoongArch: Refactor cache probe and flush methods")
> Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
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
