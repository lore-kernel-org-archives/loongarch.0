Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4828D8D1
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489722; cv=none; b=tDwiFtGEhC1iOsnKnQdVh5mvkFfpAAL/jtGTKEtKeYhdjC3AdmgB/WRm3hltE04bVS/ufII/KtSUtCRiZu0RVenPUYv6Sb/kvfuMbYSzViM2zhb+rYs19cXphZGEDOp8dzwRadqT3WMR3/c/ZotOv0/Xg/jfljsPXKJhBuuMBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489722; c=relaxed/simple;
	bh=U7dlzHue4VhWRIDqsRai/aSFudxQE0s2ZhnoNyUgtAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYnLelwHdRr5CMZ3VA7e5QDj/cvOzoa36ErZ+h4ixO36E1KRFtLa4CK7ZcHByAyNR6Y+zMDyhnupnur/SpjgF6u5wjmiejyeo9hoI1WsINWt5wnDOEZpz6MHr54ovM0bxHNLR3KgGn42+bMMndcwdtcGMz9FxyB6zPcEtSxH/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0z5EpVz; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0z5EpVz"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55b7e35a452so8322519e87.2
        for <loongarch@lists.linux.dev>; Wed, 06 Aug 2025 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754489718; x=1755094518; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHHtXBq5WO+vvcc0f+jtGoFoRXRDF9tjNLE6vwGhp98=;
        b=Q0z5EpVzmsme1sLL8ekomny4l9hQ42jJQaTBTlReVNtn59JHPW5nbLqQ8vm3VQDFMR
         FFSz0pvvFnv5Q5OiUsYSnHeGQqI3EhGo5ABrrMw214Nz0+P2/CIW1k82AAXsnMvcL30j
         NGNJ02tv5SlEjfTz+ODyhj2pctHdpM9dMC9d7cpJwLx85maj7+1TbA3oasA4cOAyYrWr
         2hhCk3wi/lxHBmlJ7hkBvLybxFFKhq4TpcxXd53CXoT587pCSFWuGXDPVtiboDgE+iQf
         9rPUCH0cWDASyQrXY2WWb4BE11bJ8eKxeqPD5G0prFsl5mBgdX8GhqXTvoGFNcT8keAj
         aZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489718; x=1755094518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHHtXBq5WO+vvcc0f+jtGoFoRXRDF9tjNLE6vwGhp98=;
        b=TOzcl1cazPKu3vNtQqNi8j+gsvrwnRAcfMDOVrbKh9BQmR75g3TtIfcAQR0HIAOO+W
         Ch9nV0RbZEXigEwQAwGldj8EUbc1dx7Ckr12H5j25R+S7k6Z8y8Pfw89ohOBHhe/1d+g
         NEVfh07egx8HAumskybr+0HhGIpQcIyfbr3GkGn2A2Wb8op3aW+WLxppTmhO3ctY8fcB
         Hpc0BtVvGLyj0zyBphQVEY4bMKOH1blTkskfKbC1hzGPApDqDkt1Y82mNZJzCA8Rl9c+
         m/7jQNbuClO94/EQCfZ6i0QveDT5tGXkV9IjcIivNLZQt6TMLEMcg9lb3BAaJ3CZ7U6h
         8txw==
X-Forwarded-Encrypted: i=1; AJvYcCX5m+1UzVWGc6B6X7Sz50brqXhQ3D/XfYRVDAC1s46vEC8EtwN4IUNfgFfpM0SgtPe4n3lIUwyps9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmhRFuZzLi5RWz0lj36h0gM1FxfHP4hWIgNFtMayJYpDHVunZE
	cBwK3VjFyN21ocD+UH+lwxNNFou0/T7/HtJy2rnCWNFVZscvDofBVxVylT6M1JyRfJn1f6Lkz+I
	t+PeUH4ayhhdojJ+ISPwaP7/tCOU09sc=
X-Gm-Gg: ASbGncvFrDaR8ovF4BOlqGQeeIFTSgQ7gGbd9BPMbVn6elDhZlEdUObttjNu52S1Oan
	J+UnznrDHtd6uHew3xVbLrjxGhHMhO/4JCnM9ECJ/B9jzjL7JU7VVaRIIQDJppDSCU4PXuGa3OI
	jJNFPn8FRWN0/Lh5tZiw4v6VqL5I9u9G+NyvT0aX/cGOLhUwWs6II7fuTYlxcNJJwlv0CUNXXJM
	dkv0KZLDAXgwzteTA==
X-Google-Smtp-Source: AGHT+IGJIXTvnACCtHBTy4xxxFNjsKAhes5Wv7IRo3RcAz7+56gG6smaMf7pNYbDbu4cgI3F5Fzl+OIwDZB8GhsMAoI=
X-Received: by 2002:a05:6512:144c:10b0:55a:90b:7a37 with SMTP id
 2adb3069b0e04-55caf3b36c2mr652245e87.50.1754489718011; Wed, 06 Aug 2025
 07:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805142622.560992-1-snovitoll@gmail.com> <20250805142622.560992-2-snovitoll@gmail.com>
 <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
In-Reply-To: <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 6 Aug 2025 19:15:01 +0500
X-Gm-Features: Ac12FXyPyQ2NShErRdFgyvw5rZUg2mPvtAtIHmw2QjkFVe_vIUdzA6ST_4dfZTU
Message-ID: <CACzwLxg=zC-82sY6f-z0VOnmbpN2E8tQxe7RyOnynpbJEFP+NA@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
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

On Wed, Aug 6, 2025 at 6:35=E2=80=AFPM Andrey Ryabinin <ryabinin.a.a@gmail.=
com> wrote:
>
>
>
> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> > Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> > to defer KASAN initialization until shadow memory is properly set up,
> > and unify the static key infrastructure across all KASAN modes.
> >
> > Some architectures (like PowerPC with radix MMU) need to set up their
> > shadow memory mappings before KASAN can be safely enabled, while others
> > (like s390, x86, arm) can enable KASAN much earlier or even from the
> > beginning.
> >
> > Historically, the runtime static key kasan_flag_enabled existed only fo=
r
> > CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> > architecture-specific kasan_arch_is_ready() implementations or evaluate=
d
> > KASAN checks unconditionally, leading to code duplication.
> >
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217049
> > Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> > ---
> > Changes in v4:
> > - Fixed HW_TAGS static key functionality (was broken in v3)
>
> I don't think it fixed. Before you patch kasan_enabled() esentially
> worked like this:
>
>  if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))
>         return static_branch_likely(&kasan_flag_enabled);
>  else
>         return IS_ENABLED(CONFIG_KASAN);
>
> Now it's just IS_ENABLED(CONFIG_KASAN);

In v4 it is:

        #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAG=
S)
        static __always_inline bool kasan_shadow_initialized(void)
        {
                return static_branch_likely(&kasan_flag_enabled);
        }
        #else
        static __always_inline bool kasan_shadow_initialized(void)
        {
                return kasan_enabled(); // which is IS_ENABLED(CONFIG_KASAN=
);
        }
        #endif

So for HW_TAGS, KASAN is enabled in kasan_init_hw_tags().

>
> And there are bunch of kasan_enabled() calls left whose behavior changed =
for
> no reason.

By having in v5 the only check kasan_enabled() and used in current mainline=
 code
should be right. I've addressed this comment below. Thanks!

>
>
> > - Merged configuration and implementation for atomicity
> > ---
> >  include/linux/kasan-enabled.h | 36 +++++++++++++++++++++++-------
> >  include/linux/kasan.h         | 42 +++++++++++++++++++++++++++--------
> >  lib/Kconfig.kasan             |  8 +++++++
> >  mm/kasan/common.c             | 18 ++++++++++-----
> >  mm/kasan/generic.c            | 23 +++++++++++--------
> >  mm/kasan/hw_tags.c            |  9 +-------
> >  mm/kasan/kasan.h              | 36 +++++++++++++++++++++---------
> >  mm/kasan/shadow.c             | 32 ++++++--------------------
> >  mm/kasan/sw_tags.c            |  4 +++-
> >  mm/kasan/tags.c               |  2 +-
> >  10 files changed, 133 insertions(+), 77 deletions(-)
> >
> > diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enable=
d.h
> > index 6f612d69ea0..52a3909f032 100644
> > --- a/include/linux/kasan-enabled.h
> > +++ b/include/linux/kasan-enabled.h
> > @@ -4,32 +4,52 @@
> >
> >  #include <linux/static_key.h>
> >
> > -#ifdef CONFIG_KASAN_HW_TAGS
> > +/* Controls whether KASAN is enabled at all (compile-time check). */
> > +static __always_inline bool kasan_enabled(void)
> > +{
> > +     return IS_ENABLED(CONFIG_KASAN);
> > +}
> >
> > +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> > +/*
> > + * Global runtime flag for KASAN modes that need runtime control.
> > + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
> > + */
> >  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
> >
> > -static __always_inline bool kasan_enabled(void)
> > +/*
> > + * Runtime control for shadow memory initialization or HW_TAGS mode.
> > + * Uses static key for architectures that need deferred KASAN or HW_TA=
GS.
> > + */
> > +static __always_inline bool kasan_shadow_initialized(void)
>
> Don't rename it, just leave as is - kasan_enabled().
> It's better name, shorter and you don't need to convert call sites, so
> there is less chance of mistakes due to unchanged kasan_enabled() -> kasa=
n_shadow_initialized().

I actually had the only check "kasan_enabled()" in v2, but went to
double check approach in v3
after this comment:
https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=3DApHfOnbAY3NqtFH=
ZvceZw@mail.gmail.com/

Ok, we will have the **only** check kasan_enabled() then in
kasan-enabled.h which

        #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAG=
S)
        static __always_inline bool kasan_enabled(void)
        {
                return static_branch_likely(&kasan_flag_enabled);
        }
        #else
        static inline bool kasan_enabled(void)
        {
                return IS_ENABLED(CONFIG_KASAN);
        }

And will remove kasan_arch_is_ready (current kasan_shadow_initialized in v4=
).

So it is the single place to check if KASAN is enabled for all arch
and internal KASAN code.
Same behavior is in the current mainline code but only for HW_TAGS.

Is this correct?

>
>
> >  {
> >       return static_branch_likely(&kasan_flag_enabled);
> >  }
> >
> > -static inline bool kasan_hw_tags_enabled(void)
> > +static inline void kasan_enable(void)
> > +{
> > +     static_branch_enable(&kasan_flag_enabled);
> > +}
> > +#else
> > +/* For architectures that can enable KASAN early, use compile-time che=
ck. */
> > +static __always_inline bool kasan_shadow_initialized(void)
> >  {
> >       return kasan_enabled();
> >  }
> >
>
> ...
>
> >
> >  void kasan_populate_early_vm_area_shadow(void *start, unsigned long si=
ze);
> > -int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> > -void kasan_release_vmalloc(unsigned long start, unsigned long end,
> > +
> > +int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> > +static inline int kasan_populate_vmalloc(unsigned long addr, unsigned =
long size)
> > +{
> > +     if (!kasan_shadow_initialized())
> > +             return 0;
>
>
> What's the point of moving these checks to header?
> Leave it in C, it's easier to grep and navigate code this way.

Andrey Konovalov had comments [1] to avoid checks in C
by moving them to headers under __wrappers.

: 1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
: implementation and move these checks into include/linux/kasan.h (and
: add __wrappers when required).

[1] https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=3DApHfOnbAY3N=
qtFHZvceZw@mail.gmail.com/

>
>
> > +     return __kasan_populate_vmalloc(addr, size);
> > +}
> > +
> > +void __kasan_release_vmalloc(unsigned long start, unsigned long end,
> >                          unsigned long free_region_start,
> >                          unsigned long free_region_end,
> >                          unsigned long flags);
> > +static inline void kasan_release_vmalloc(unsigned long start,
> > +                        unsigned long end,
> > +                        unsigned long free_region_start,
> > +                        unsigned long free_region_end,
> > +                        unsigned long flags)
> > +{
> > +     if (kasan_shadow_initialized())
> > +             __kasan_release_vmalloc(start, end, free_region_start,
> > +                        free_region_end, flags);
> > +}
> >
>
> ...> @@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kme=
m_cache *cache, void *object,
> >  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
> >                               unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
> >               return false;
> >       return check_slab_allocation(cache, object, ip);
> >  }
> > @@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache=
, void *object,
> >  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool in=
it,
> >                      bool still_accessible)
> >  {
> > -     if (!kasan_arch_is_ready() || is_kfence_address(object))
> > +     if (is_kfence_address(object))
> >               return false;
> >
> >       poison_slab_object(cache, object, init, still_accessible);
> > @@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, vo=
id *object, bool init,
> >
> >  static inline bool check_page_allocation(void *ptr, unsigned long ip)
> >  {
> > -     if (!kasan_arch_is_ready())
> > -             return false;
> > -
>
>
> Well, you can't do this yet, because no arch using ARCH_DEFER_KASAN yet, =
so this breaks
> bisectability.
> Leave it, and remove with separate patch only when there are no users lef=
t.

Will do in v5 at the end of patch series.

>
> >       if (ptr !=3D page_address(virt_to_head_page(ptr))) {
> >               kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_F=
REE);
> >               return true;
> > @@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsig=
ned long ip)
> >               return true;
> >       }
> >
> > -     if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> > +     if (is_kfence_address(ptr))
> >               return true;
> >
> >       slab =3D folio_slab(folio);
>
>
