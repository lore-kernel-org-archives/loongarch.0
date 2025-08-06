Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE6E1F19A
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455079; cv=none; b=sv7uCkc/2jFni6Mo+DMpYbUK2iJIrxUSF9UVBYipitkXldV/96Yq4+BdsrVITkHC8U8fXVAhKlAlgWy2LsSV5MOHrW7XIkp7RvBtYIb0idY2lkQHN1rjXX7iYCfXKCCb5kOh6636dru+GWpXqBm+8Y4VCy44xVpDQd3ydRp4dA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455079; c=relaxed/simple;
	bh=9nHRt5BtZeZhDnL6jV7L7PCFuH5fnkwqdN9wXO/76Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0UXHRYDhp8h9s7haD96kolf6na9vBIffQG7gLw4R1HPQtf3o2oQ973/T2xLlk9L5hNW2eSMUGxKpSHMr/5DLqpQKyvysCAgxRhUDEHz8uBz+TR2CocH+zsR2ZwDEG3wACm8+/Gtwqn4FGv4judFXsv4LWYu34i3OswinsAloMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjDpdRcZ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjDpdRcZ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3322d10e29dso49261501fa.0
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754455075; x=1755059875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo/Viw2qcvpv/MoBS3iI99BxX9ghV/qd2Tz3ezwRf/E=;
        b=WjDpdRcZTCTJ9FmbOdiYXQGmmFDQhriJQS+uZeG2SFVjlAkr3v5795Ha47ukpkhTTj
         OHGALsD+tyc8FxIzJtA5tVJNhWByVPqw4fR6+Y1GQAsDY7HNwnqJQIaxXWDc4ViWxcwz
         QqPggioRppDR/DheJz5ivzMOZYCq4JnwarQhSIpWm8Tx+y1+kgH2uFnlWUAh/Ibb2l+S
         4sjpZ6IFuGRBwq7+dmPDzol8xTIJ3DLKi38mqkdOfBfWYc3T1uJ3G6Fu5UuFcmGbSbmr
         O3Pk+rOlfygzmJQxN/ZhXuViD+po7y3/gZ8fCkuvlWAqlICPMLwUPqH+ab7lbDQ+gRDN
         J0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754455075; x=1755059875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo/Viw2qcvpv/MoBS3iI99BxX9ghV/qd2Tz3ezwRf/E=;
        b=MZlzMP6kNIaKBvLMYgnBtSK3poZiLqYrfC9xCWUr3425YMoTQUSXSawouCajaDTJhn
         6I4TdMOVki7uY94TKRmv382y/JHhGZc95qFQk30c02bTy4yAp56EDRUE5jCIB+C1lYNP
         Hdn7deC+x2Y3oAEqviiuxbDAR6/uNTSZA3yr4IFEmTD67T+2UI7CxbvdRNisbiPVBGvC
         2hniyUt7dws89qjiUyirNw+RKmgdw5+N2HyO0t63Vr7kls3NFZVPUxT9xM2ud9KBQ7jo
         6vK8w6fpUppai9ryFwXMM/vMtg6gQvgm+Z2JG64w8ONRadWrnacDgpYCi3Ye8XzaNZ1w
         q0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQiYXdsA4MoFxzV/3HmGdX0/BiLnRlS0NpXwpYect7id8FhuLX5Q4soFO+SHSqHaE27z6piKWqQ0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOdM4kayre9CyBy75lr4Oe4vWmMOZuhYn4HDIRoA/jD5zgZUGK
	rG0U0rsVd4HQnNzuM4pTOK10BDR1Jqe32oTKXnnY46tBAvSOZLlaG3HRxI4v4O/3ey1jiK0T9Mv
	bPbZMsncRoXIBmXUyHul9SeHEiCKrPVo=
X-Gm-Gg: ASbGncvP8KLR9Y0Pc6X5y49qWBwgUYxyg8tPc4OhGcucTvz+kDJKZSZADW9JXHma+A5
	1uc7CMC5zfwAju8eQu/aqX2Fmg9npn3PyYokpUExmX4+9Wlv+QlbJkdaU29aeLtZMM4Nr0jxKDQ
	Y7VHaBK4KUTr0loEvx1y/TiiBHSVXmpiZN2paFKHyfi/yQ2aZIBeC/TQbcctgZZ0BSyzhg7HwDF
	50B63w=
X-Google-Smtp-Source: AGHT+IFdsEW+IENwPRijll82h/DPiknLKACQZ/o9KWIJ/PhoBk1+OGng4Q7CbEgSQ8dHEzo+wdS/ckXYJp2kTJF5j88=
X-Received: by 2002:a05:651c:1509:b0:32a:739d:fac with SMTP id
 38308e7fff4ca-3338144cd8fmr3796161fa.36.1754455075078; Tue, 05 Aug 2025
 21:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805142622.560992-1-snovitoll@gmail.com> <20250805142622.560992-6-snovitoll@gmail.com>
 <e15e1012-566f-45a7-81d5-fd504af780da@gmail.com>
In-Reply-To: <e15e1012-566f-45a7-81d5-fd504af780da@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 6 Aug 2025 09:37:38 +0500
X-Gm-Features: Ac12FXyJN7pElMlaw_o-aZoTkQ3byDjTMvUiVf1-1J0u8uF_nrAwTbgiBAXxjhE
Message-ID: <CACzwLxj0nOQT0+Z+AFDG3Cvun5jGaET6C3mp9PnLbCHjdw51Pg@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com, 
	glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 10:18=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmail=
.com> wrote:
>
>
>
> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> > LoongArch needs deferred KASAN initialization as it has a custom
> > kasan_arch_is_ready() implementation that tracks shadow memory
> > readiness via the kasan_early_stage flag.
> >
> > Select ARCH_DEFER_KASAN to enable the unified static key mechanism
> > for runtime KASAN control. Call kasan_init_generic() which handles
> > Generic KASAN initialization and enables the static key.
> >
> > Replace kasan_arch_is_ready() with kasan_enabled() and delete the
> > flag kasan_early_stage in favor of the unified kasan_enabled()
> > interface.
> >
> > Note that init_task.kasan_depth =3D 0 is called after kasan_init_generi=
c(),
> > which is different than in other arch kasan_init(). This is left
> > unchanged as it cannot be tested.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> > Changes in v4:
> > - Replaced !kasan_enabled() with !kasan_shadow_initialized() in
> >   loongarch which selects ARCH_DEFER_KASAN (Andrey Ryabinin)
> > ---
> >  arch/loongarch/Kconfig             | 1 +
> >  arch/loongarch/include/asm/kasan.h | 7 -------
> >  arch/loongarch/mm/kasan_init.c     | 8 ++------
> >  3 files changed, 3 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index f0abc38c40a..f6304c073ec 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -9,6 +9,7 @@ config LOONGARCH
> >       select ACPI_PPTT if ACPI
> >       select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
> >       select ARCH_BINFMT_ELF_STATE
> > +     select ARCH_DEFER_KASAN
> >       select ARCH_DISABLE_KASAN_INLINE
> >       select ARCH_ENABLE_MEMORY_HOTPLUG
> >       select ARCH_ENABLE_MEMORY_HOTREMOVE
> > diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/includ=
e/asm/kasan.h
> > index 62f139a9c87..0e50e5b5e05 100644
> > --- a/arch/loongarch/include/asm/kasan.h
> > +++ b/arch/loongarch/include/asm/kasan.h
> > @@ -66,7 +66,6 @@
> >  #define XKPRANGE_WC_SHADOW_OFFSET    (KASAN_SHADOW_START + XKPRANGE_WC=
_KASAN_OFFSET)
> >  #define XKVRANGE_VC_SHADOW_OFFSET    (KASAN_SHADOW_START + XKVRANGE_VC=
_KASAN_OFFSET)
> >
> > -extern bool kasan_early_stage;
> >  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
> >
> >  #define kasan_mem_to_shadow kasan_mem_to_shadow
> > @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
> >  #define kasan_shadow_to_mem kasan_shadow_to_mem
> >  const void *kasan_shadow_to_mem(const void *shadow_addr);
> >
> > -#define kasan_arch_is_ready kasan_arch_is_ready
> > -static __always_inline bool kasan_arch_is_ready(void)
> > -{
> > -     return !kasan_early_stage;
> > -}
> > -
> >  #define addr_has_metadata addr_has_metadata
> >  static __always_inline bool addr_has_metadata(const void *addr)
> >  {
> > diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_i=
nit.c
> > index d2681272d8f..57fb6e98376 100644
> > --- a/arch/loongarch/mm/kasan_init.c
> > +++ b/arch/loongarch/mm/kasan_init.c
> > @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata _=
_aligned(PAGE_SIZE);
> >  #define __pte_none(early, pte) (early ? pte_none(pte) : \
> >  ((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_sha=
dow_page)))
> >
> > -bool kasan_early_stage =3D true;
> > -
> >  void *kasan_mem_to_shadow(const void *addr)
> >  {
> > -     if (!kasan_arch_is_ready()) {
> > +     if (!kasan_shadow_initialized()) {
> >               return (void *)(kasan_early_shadow_page);
> >       } else {
> >               unsigned long maddr =3D (unsigned long)addr;
> > @@ -298,8 +296,6 @@ void __init kasan_init(void)
> >       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_S=
TART),
> >                                       kasan_mem_to_shadow((void *)KFENC=
E_AREA_END));
> >
> > -     kasan_early_stage =3D false;
> > -
>
> There is a reason for this line to be here.
> Your patch will change the result of the follow up kasan_mem_to_shadow() =
call and
> feed the wrong address to kasan_map_populate()

Thanks, I've missed it. Here the upcoming v5 for this:

diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.=
c
index d2681272d8f..0e6622b57ce 100644
--- a/arch/loongarch/mm/kasan_init.c
+++ b/arch/loongarch/mm/kasan_init.c
@@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata
__aligned(PAGE_SIZE);
#define __pte_none(early, pte) (early ? pte_none(pte) : \
((pte_val(pte) & _PFN_MASK) =3D=3D (unsigned long)__pa(kasan_early_shadow_p=
age)))
-bool kasan_early_stage =3D true;
-
void *kasan_mem_to_shadow(const void *addr)
{
- if (!kasan_arch_is_ready()) {
+ if (!kasan_shadow_initialized()) {
return (void *)(kasan_early_shadow_page);
} else {
unsigned long maddr =3D (unsigned long)addr;
@@ -298,7 +296,10 @@ void __init kasan_init(void)
kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
kasan_mem_to_shadow((void *)KFENCE_AREA_END));
- kasan_early_stage =3D false;
+ /* Enable KASAN here before kasan_mem_to_shadow() which checks
+ * if kasan_shadow_initialized().
+ */
+ kasan_init_generic();
/* Populate the linear mapping */
for_each_mem_range(i, &pa_start, &pa_end) {
@@ -329,5 +330,4 @@ void __init kasan_init(void)
/* At this point kasan is fully initialized. Enable error messages */
init_task.kasan_depth =3D 0;
- pr_info("KernelAddressSanitizer initialized.\n");
}
--=20
2.34.1

>
>
> >       /* Populate the linear mapping */
> >       for_each_mem_range(i, &pa_start, &pa_end) {
> >               void *start =3D (void *)phys_to_virt(pa_start);
> > @@ -329,5 +325,5 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized.\n");
> > +     kasan_init_generic();
> >  }
>
