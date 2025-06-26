Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCD1922F6
	for <loongarch@lists.linux.dev>; Thu, 26 Jun 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945995; cv=none; b=JxV+mL6v5Ps2aWiDN844jvH+8ahJ2wbViQWpDNBlV46oC6ExoFs+hF1RWMezCuLY+/21Wmm5OP9y0cQdb7hVYGnD/y6P3pm9cY3UlyiQyzi7hcG1atGloMvIeiPmNzDzJNQDlSfY8NyPhQKPM1zGAqxqEtWRavOjOU8KhGI/VGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945995; c=relaxed/simple;
	bh=Br/k6gepM6isXrVyNOBC8je6Df6XarIs+ifkHTw16TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FiUKVpEcsaxLbH2QDTDkLRnWHSr7wOSYcVd4vGn2U3GgsXPbgwxd9ZWd6q6F+44jWC/6g10f5IS1g6zk32BFTe/TTzR2Neow2O6TeqqLC5nvi73cRXWxMyD3YCoR8nL6fOfjXW+rbKTrLHzuJZgOsJ09ijLFwwhwQF9HHekfhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/bvp93p; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/bvp93p"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso10383801fa.1
        for <loongarch@lists.linux.dev>; Thu, 26 Jun 2025 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750945992; x=1751550792; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlpUNKK3G9db+EdwcDWwBbzYx+1GRPZcFPyn0Q/NIe0=;
        b=W/bvp93poTpe8BsPlww1cenkWfbOgBSSNhvw4vfNYd7W/7t7A64ZsdZ+exwFc99Tzj
         fQfBGU2KMhQclvP37GKgq/J2/WmT7H3cOAgu0aKCDvyMkEk9Kg4KNR6m3UVDqiGCDr6d
         rLL/VzvgVUgoSVNs4x89jjA6sFfZLs0W4rre9Hvioy0Hi0HD+TGoZvJH5vEC96rEDdIu
         AAbCMtaWWo32pG/n59R1diXk21/PiyOne4skxJ5lx0s9tX+BYFFB0vEGgg3nq5bRi797
         g4bP6ojPzA+cm0xXCfloiRdqYmznQRlguhD/ddXGdRVaTYwhARJGxTIL9XxUnYWcroQN
         hWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945992; x=1751550792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlpUNKK3G9db+EdwcDWwBbzYx+1GRPZcFPyn0Q/NIe0=;
        b=UmH2lw3dLf7rfElcAnBapZ8I4yzZfn95zsVY1kThTPPCB8Rbr7WSjOyapqMMMdaPwf
         xz9ibxTZ9DxH1dDPfVXu1jyMjmqNES++chl6yUYqQLo1njWItiOnI59ygu81Ive9usNb
         C1D4kFW4nRPTJyj7edPCO1UlzTx8abNNEZquj7AtVfknej1me7dskSWhnZaegDo2opHd
         X2xc2kDUfUS0a0EesGC16Z3AwiHbcMfGIjdVmPLrt2gBDLyJDuQxeJ/+jzKIYn0lQUX2
         ewSF8EMdOt2O/MNrOjSjkOCe7buAWMdwS3JF0LdHta2FWIubao2SxPv9BKAh83z8C3M5
         mbVw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmM5Fg44obo1FRxeQE7mvw/DkwAb162JfYU6Wno9k0zLdHDpCIxg/LlCTqlbR0r0Z2mQkYc3t02w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9q3aKJs4xYn8BQr4XaAHBmkVAHA5QtadNFXmvpz78myWCfE9e
	QnaJEa5G4wU6iqdhzKP4Lv56ipFvx2PAUUO5CgRhzQpsBXDpvhzzd7YVS5GcPCd6u9Aonv3UXA8
	irXaLHJtUVO7nhKj2aRNsfwThxTTSPEU=
X-Gm-Gg: ASbGncttt/lm3KGANOgSggDNaU4ryt2o5wBrTL/ciZ8dpNPh3TejBgYjNyW7zY/3uCT
	nWaKWOYWmvf3VrzcCONlPvZhQM23Kd6ZKMfRm1xRLeRCaN9PeYL6RfD6Pg8L9fsdjiAuas2ItDl
	5VDjXxRhJRhwcLTsXQXGnBVlm4G86HmAeU2fJt6itUHQ==
X-Google-Smtp-Source: AGHT+IFp5i/0Kq3rabH9rf2kY42MbESDKtULRW6uJMn5QRZ8/Z9H2i8ntSIcRhBigiGO2NXAKYlXjXFM6g03B8Baa18=
X-Received: by 2002:a05:651c:f0b:b0:32b:7284:88 with SMTP id
 38308e7fff4ca-32cc6497155mr12421921fa.7.1750945991880; Thu, 26 Jun 2025
 06:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-6-snovitoll@gmail.com>
 <20250626132943.GJ1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250626132943.GJ1613200@noisy.programming.kicks-ass.net>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 26 Jun 2025 18:52:53 +0500
X-Gm-Features: Ac12FXynXHan9NKB65s06xjAcLer_ajNs_gE1LBlTEt_pC6nGG6YTexJKgab6gM
Message-ID: <CACzwLxj3WLTK+A7YLcYvg5ZwvQdvoBuZL3bmEF+ELinFZgU=Pg@mail.gmail.com>
Subject: Re: [PATCH 5/9] kasan/loongarch: call kasan_init_generic in kasan_init
To: Peter Zijlstra <peterz@infradead.org>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org, 
	guoweikang.kernel@gmail.com, geert@linux-m68k.org, rppt@kernel.org, 
	tiwei.btw@antgroup.com, richard.weiyang@gmail.com, benjamin.berg@intel.com, 
	kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 6:29=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Jun 25, 2025 at 02:52:20PM +0500, Sabyrzhan Tasbolatov wrote:
> > Call kasan_init_generic() which enables the static flag
> > to mark generic KASAN initialized, otherwise it's an inline stub.
> >
> > Replace `kasan_arch_is_ready` with `kasan_enabled`.
> > Delete the flag `kasan_early_stage` in favor of the global static key
> > enabled via kasan_enabled().
> >
> > printk banner is printed earlier right where `kasan_early_stage`
> > was flipped, just to keep the same flow.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218315
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> >  arch/loongarch/include/asm/kasan.h | 7 -------
> >  arch/loongarch/mm/kasan_init.c     | 7 ++-----
> >  2 files changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/includ=
e/asm/kasan.h
> > index 7f52bd31b9d..b0b74871257 100644
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
> > index d2681272d8f..cf8315f9119 100644
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
> > +     if (!kasan_enabled()) {
> >               return (void *)(kasan_early_shadow_page);
> >       } else {
> >               unsigned long maddr =3D (unsigned long)addr;
> > @@ -298,7 +296,7 @@ void __init kasan_init(void)
> >       kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_S=
TART),
> >                                       kasan_mem_to_shadow((void *)KFENC=
E_AREA_END));
> >
> > -     kasan_early_stage =3D false;
> > +     kasan_init_generic();
> >
> >       /* Populate the linear mapping */
> >       for_each_mem_range(i, &pa_start, &pa_end) {
> > @@ -329,5 +327,4 @@ void __init kasan_init(void)
> >
> >       /* At this point kasan is fully initialized. Enable error message=
s */
> >       init_task.kasan_depth =3D 0;
> > -     pr_info("KernelAddressSanitizer initialized.\n");
> >  }
>
> This one is weird because its the only arch that does things after
> marking early_state false.
>
> Is that really correct, or should kasan_init_generic() be last, like all
> the other architectures?

It really differs from other arch kasan_init(). I can't verify that
kasan_init_generic()
can be placed at the end of kasan_init() because right after
switching the KASAN flag, there's kasan_enabled() check in
kasan_mem_to_shadow().

In arch/loongarch/mm/kasan_init.c:

void *kasan_mem_to_shadow(const void *addr)
{
        if (!kasan_enabled()) {
                return (void *)(kasan_early_shadow_page);
        } else {
...
}

void __init kasan_init(void)
{
...
        kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_STA=
RT),
        kasan_mem_to_shadow((void *)KFENCE_AREA_END));

        kasan_init_generic();

        /* Populate the linear mapping */
        for_each_mem_range(i, &pa_start, &pa_end) {
....
        kasan_map_populate((unsigned long)kasan_mem_to_shadow(start),
}

>
> Also, please move init_task.kasan_depth =3D 0 into the generic thing.
> ARM64 might have fooled you with the wrapper function, but they all do
> this right before that pr_info you're taking out.

Please check "[PATCH 1/9] kasan: unify static kasan_flag_enabled across mod=
es",
where I've replied to Christophe:
https://lore.kernel.org/all/CACzwLxj3KWdy-mBu-te1OFf2FZ8eTp5CieYswF5NVY4qPW=
D93Q@mail.gmail.com/

I can try to put `init_task.kasan_depth =3D 0;` in kasan_init_generic(),
but in ARM64 kasan_init() we'll still need to have this line for
HW_TAGS, SW_TAGS mode.
