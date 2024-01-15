Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026518E20
	for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwvephFp"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bee328027bso171062139f.1
        for <loongarch@lists.linux.dev>; Mon, 15 Jan 2024 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705348930; x=1705953730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbP8f68FneqS35iMSb6Ai2Krkdv9R7DQjS6AqJROA3o=;
        b=AwvephFppslYEPgYpxSoLL0vcArIdRibcs0Cc+7Q97gKxjDEgMquOQ1CcQlno6xocE
         /tYD2PMeuuCMQcCB/MndnqiOZvTQ+ogxtGIzIWwu3XiVoFppgP6bg9RzU5MdV/9KXJYf
         JPTjUfk6u2pIWY6XIYG7rvtqPVeW3itlwKRyUTMLKPMvVwo/K6znnx7aUs2kFVGxcBgd
         Sa6JczOT4a6INNy4JKshDHdL6MrcwadFtJZKLqyJfiVnNIgUu9xapk6UwpMFIgF9HwAv
         3DnlP0+tilzqPqAyljzgSJIgMPNRIxU863KVtrKoMMx0V+vjzqjq858FqD7IvJFH9SG0
         juQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705348930; x=1705953730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbP8f68FneqS35iMSb6Ai2Krkdv9R7DQjS6AqJROA3o=;
        b=PWR1tdQWilixWxD/nTiERHhhB2DrZ/du2BVfCGoOrGK7xKCdNPskJVXK0H/i8pGG6i
         TWSBzU3mTjlNjrTke8rDDJq1LDP2cY/S9HGuaQFO5+pUDOlgYjGIWCV72b4Ny78B59NT
         GfJjZ0V6wZ2I0IRk/wNmq2lWszDEXPMCLOxGagduPfIdv33jQR4kr5ZfXZ4qH7oz80rG
         fJ5NuI3iPK6mNga4Wt9/Gu2y9aH9TG0yW9KSTfThU6YmVoGn8qkbaAbUKKqJWOKhWhtH
         qaABtbcXZgya57I2/Ra91LfGiSrBSJu/Zg5XS18TT0SVuq7JDMSnEX/avYAoji9ZdevC
         dfww==
X-Gm-Message-State: AOJu0YyELg9mIU85ZBtsQYy8Vr/+eUB+8VkFofGK2H7Y/caUh+uFjlkM
	PXEgeJvUz7Drq+qJMaDh4wIwBAK3CR5A3XKLIR4=
X-Google-Smtp-Source: AGHT+IGoOdW+aeoc91UwOnpg9hVQGt8tI8/aToJQfADXkg0FmKNY58cZw1wiDMwjHJuDhjzyx1g4Ij03JmdRrdylacs=
X-Received: by 2002:a6b:f017:0:b0:7bf:3b15:a4b8 with SMTP id
 w23-20020a6bf017000000b007bf3b15a4b8mr2795535ioc.37.1705348930027; Mon, 15
 Jan 2024 12:02:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
In-Reply-To: <CAM4kBBKPLwwp2H37q1nBSubFwaMiwdhC78f+n_0qpAHNODTYhQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 15 Jan 2024 12:01:58 -0800
Message-ID: <CAKEwX=Pskq2Rvi1bUaPHPoAfVv9h9_u40ytJa+hkYpxmKogbfw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 4:27=E2=80=AFAM Vitaly Wool <vitaly.wool@konsulko.c=
om> wrote:
>
> On Fri, Jan 12, 2024 at 8:31=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
> >
> > In hopes of having a single compressed pages allocator at some point,
> > and following in the footsteps of SLAB, deprecate z3fold. Rename the
> > user-visible option so that users with CONFIG_Z3FOLD=3Dy get a new prom=
pt
> > with explanation during make oldconfig. Remove CONFIG_Z3FOLD=3Dy from
> > defconfigs.
>
> I believe that having a single compressed pages allocator is a false goal=
.

I think it should be, where possible. Having fewer code will lower the
maintenance burden. Of course, this is not always possible, as one
option might be the best in one aspect/use case, but not so in others.
In the case of zswap (which is the only user for zbud and z3fold), it
seems (to me anyway) zbud and z3fold aren't really serious competitors
for zsmalloc anymore (outside of that aforementioned !MMU case). I'd
love to hear some use cases if I'm mistaken though :)

>
> > Existing users, if any, should voice their objections. Otherwise, we ca=
n
> > remove z3fold in a few releases.
>
> At this point I NACK this patch. We're about to submit an allocator
> which is clearly better that z3fold and is faster that zsmalloc in
> most cases and that submission will mark z3fold as deprecated. But for
> now this move is premature.

Ah, this sounds promising. I'd love to hear more about this new
allocator, and once it's available, experiment with it internally too
:)

That said, even at this point, does anyone actually use z3fold and/or
zbud, and cannot use zsmalloc? If yes, then yeah this is quite
premature. If not, then we can mark them as deprecate, no? Introducing
the other allocator and fixing zsmalloc for !MMU can be done in
parallel - we're not removing z3fold and zbud anytime soon even with
this deprecation notice.


>
> Best,
> Vitaly
>
> > Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> > ---
> > I have limited understanding of Kconfigs. I modelled this after commit
> > eb07c4f39c3e ("mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED"),
> > but one difference is that CONFIG_Z3FOLD is a tristate. I made
> > CONFIG_Z3FOLD_DEPRECATED a boolean config, and CONFIG_Z3FOLD default y
> > so that it is on by default if CONFIG_Z3FOLD_DEPRECATED is selected. I
> > am not sure if that's the correct way to do this.
> >
> > ---
> >  arch/loongarch/configs/loongson3_defconfig |  1 -
> >  arch/powerpc/configs/ppc64_defconfig       |  1 -
> >  mm/Kconfig                                 | 13 +++++++++++--
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarc=
h/configs/loongson3_defconfig
> > index 33795e4a5bd63..89b66b6c6a1d5 100644
> > --- a/arch/loongarch/configs/loongson3_defconfig
> > +++ b/arch/loongarch/configs/loongson3_defconfig
> > @@ -85,7 +85,6 @@ CONFIG_ZPOOL=3Dy
> >  CONFIG_ZSWAP=3Dy
> >  CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD=3Dy
> >  CONFIG_ZBUD=3Dy
> > -CONFIG_Z3FOLD=3Dy
> >  CONFIG_ZSMALLOC=3Dm
> >  # CONFIG_COMPAT_BRK is not set
> >  CONFIG_MEMORY_HOTPLUG=3Dy
> > diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/config=
s/ppc64_defconfig
> > index 544a65fda77bc..d39284489aa26 100644
> > --- a/arch/powerpc/configs/ppc64_defconfig
> > +++ b/arch/powerpc/configs/ppc64_defconfig
> > @@ -81,7 +81,6 @@ CONFIG_MODULE_SIG_SHA512=3Dy
> >  CONFIG_PARTITION_ADVANCED=3Dy
> >  CONFIG_BINFMT_MISC=3Dm
> >  CONFIG_ZSWAP=3Dy
> > -CONFIG_Z3FOLD=3Dy
> >  CONFIG_ZSMALLOC=3Dy
> >  # CONFIG_SLAB_MERGE_DEFAULT is not set
> >  CONFIG_SLAB_FREELIST_RANDOM=3Dy
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 1902cfe4cc4f5..bc6cc97c08349 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -193,15 +193,24 @@ config ZBUD
> >           deterministic reclaim properties that make it preferable to a=
 higher
> >           density approach when reclaim will be used.
> >
> > -config Z3FOLD
> > -       tristate "3:1 compression allocator (z3fold)"
> > +config Z3FOLD_DEPRECATED
> > +       bool "3:1 compression allocator (z3fold) (DEPRECATED)"
> >         depends on ZSWAP
> >         help
> > +         Deprecated and scheduled for removal in a few cycles. If you =
have
> > +         a good reason for using Z3FOLD rather than ZSMALLOC or ZBUD, =
please
> > +         contact linux-mm@kvack.org and the zswap maintainers.
> > +
> >           A special purpose allocator for storing compressed pages.
> >           It is designed to store up to three compressed pages per phys=
ical
> >           page. It is a ZBUD derivative so the simplicity and determini=
sm are
> >           still there.
> >
> > +config Z3FOLD
> > +       tristate
> > +       default y
> > +       depends on Z3FOLD_DEPRECATED
> > +
> >  config ZSMALLOC
> >         tristate
> >         prompt "N:1 compression allocator (zsmalloc)" if ZSWAP
> > --
> > 2.43.0.275.g3460e3d667-goog
> >
