Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72704A2C
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EEC341CA
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656165654;
	bh=t0wqaEAT95jEcBs2WtJA4yI32Lyw6AFlDCsfOkURjBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TdoAg3zvctWPn9sTc/JsN9ZOr5JTEREYZPRnJwnNTebnN1xf6ishvrLBGE8Glb/md
	 mjt6gZofTuO1t5d5KPPqGSIQMIlyIS2lKt0OcJUFUtxsZlMeszosch+FafTLSJyrQh
	 CznIA0KZIQB4WNr526ko6F5BMQMkhbLWKLJ+5mYjIlefIhjCcgGE/thjF79lzBgFr+
	 FsfzaG59RGfMWd0hFavU/r+7jzAan6QjBMYWyZ1821Y161Uih+xauFoZc3pEgRJfWA
	 J7tk/xKikJf5FhoHoXguZ2wZOy/W0pRrjihMDMuBfdGR8Y5L6hVhe1R1zNb8yb9h2i
	 lIzMgmzWJN3cQ==
Received: by mail-vs1-f41.google.com with SMTP id h38so4853786vsv.7
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 07:00:54 -0700 (PDT)
X-Gm-Message-State: AJIora/BBA16fH0cjNUufzoLC8gSi7Ymvgeh4Y212IsyJmBZRMkW0Pq/
	PilAxcMSBR5QcZ8J1vBhNTFX6bj1zn3wThsrqfQ=
X-Google-Smtp-Source: AGRyM1tifc9J0S1N4mqgBfibJ6KQ39UMSRNc3CynbAEj61eOx7fHO87FxOw8W9F9Sk2ELboBFgtduKSv66mU1Ha0xxs=
X-Received: by 2002:a67:7347:0:b0:354:3f46:21ec with SMTP id
 o68-20020a677347000000b003543f4621ecmr1331348vsc.70.1656165653567; Sat, 25
 Jun 2022 07:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220625080423.2797-1-chenfeiyang@loongson.cn>
 <CAMZfGtWT7oPq6bD_fRn2gVNX8Lj3=ev21EAoaCCPeq-P_NYF0g@mail.gmail.com>
 <CAAhV-H5K9LG5P6WYJ+64-fi+s=TZbbJQG9E0vHJwOf9Pai5z4w@mail.gmail.com> <CAMZfGtVq0VwMETGdzAXLkjes8W0gVBw=r0Xk5rpPnhe7x6tRiw@mail.gmail.com>
In-Reply-To: <CAMZfGtVq0VwMETGdzAXLkjes8W0gVBw=r0Xk5rpPnhe7x6tRiw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 25 Jun 2022 22:00:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4T3ixOWB67XOij3P1xvM+_BUu+THLGtx-VvrCYUgjZyw@mail.gmail.com>
Message-ID: <CAAhV-H4T3ixOWB67XOij3P1xvM+_BUu+THLGtx-VvrCYUgjZyw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] page-flags.h: Fix a missing header include
 of static_keys.h
To: Muchun Song <songmuchun@bytedance.com>
Cc: Feiyang Chen <chris.chenfeiyang@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Muchun,

On Sat, Jun 25, 2022 at 7:17 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Sat, Jun 25, 2022 at 5:04 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> >
> > Hi, Muchun,
> >
> > On Sat, Jun 25, 2022 at 4:50 PM Muchun Song <songmuchun@bytedance.com> wrote:
> > >
> > > On Sat, Jun 25, 2022 at 4:04 PM Feiyang Chen
> > > <chris.chenfeiyang@gmail.com> wrote:
> > > >
> > > > The page-flags.h header relies on static keys since commit
> > > > a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled
> > > > with a static_key"), so make sure to include the header to avoid
> > > > compilation errors.
> > > >
> > > > Fixes: a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > > > ---
> > > >  include/linux/page-flags.h | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > > > index e66f7aa3191d..147b336c7a35 100644
> > > > --- a/include/linux/page-flags.h
> > > > +++ b/include/linux/page-flags.h
> > > > @@ -11,6 +11,7 @@
> > > >  #include <linux/mmdebug.h>
> > > >  #ifndef __GENERATING_BOUNDS_H
> > > >  #include <linux/mm_types.h>
> > > > +#include <linux/static_key.h>
> > >
> > > I did not include this. The change makes sense to me. But I am
> > > curious what configs cause the compiling error. Would you mind
> > > sharing the config with us?
> > We found this problem when we add
> > ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to LoongArch. Since this isn't
>
> Good news to me. I would love to hear more archs support for HVO (HugeTLB
> Vmemmap Optimization).
>
> > upstream yet, we cannot give such a config now (the default config of
> > X86 and ARM64 is just OK).
>
> All right. In this case, the "Cc: stable@vger.kernel.org" is unnecessary.
Maybe make randconfig will have problems on X86/ARM64, so backporting
to 5.18 seems reasonable.

Huacai
>
> Thanks.
> >
> > Huacai
> > >
> > > Thanks.
> > >
> > > >  #include <generated/bounds.h>
> > > >  #endif /* !__GENERATING_BOUNDS_H */
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > >
