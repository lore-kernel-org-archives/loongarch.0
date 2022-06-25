Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E64A15
	for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 11:17:24 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-3178ea840easo45942907b3.13
        for <loongarch@lists.linux.dev>; Sat, 25 Jun 2022 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uiCn1wFahqAtSkOl35HmuzXqqUxjUEsg3PyPjnfHW9E=;
        b=3iCOnxC63zzWpEYXppJeaYfZNRtna889N688tU51Fz05zWDXd5qsW086aNb9+MwdJv
         O9EyqixJTnJa8+XS33NPHFlTPra87Yh3ffe2oDLnQiJLBi2R3Vd38kWvw9iGVRTv92+3
         LCEa3bFWRvLtfE/G8Hwknjj9IHh3hswmvsfFnbDG296N5regN/oIcPmqNRjlFXUARSIe
         kj9Q7PaPTaG5bVoYZbf8DHg0J/oRGOwIXWfNGVQmoFx98yuwo48VgRe3N2GRGx4KedLq
         ZcsbEmXYQaQF4cRtK7tpUvGlk1uXjKwda6GoKRmyLyoHRGI0fHKUsy2xipFdKbzqWmfa
         /QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uiCn1wFahqAtSkOl35HmuzXqqUxjUEsg3PyPjnfHW9E=;
        b=th17T4IAKNAaf9LXhr/f5/dFPdR9ydNivvKAIJsPah993nlGXlgOLcFLt7M0NSeush
         2DE3CTkyTQcOtFuf9iehzDlTA8/cyDxIGf9gvJaF1tzgvdZo8eBgTBlEkrrRoaa4N3fs
         4yra/f+7ePhfPsnRL/ZXUgvqU15yCc9eDaGV37jqO0/TDPuUV6h3pgYVW3a9zV5a6epU
         yEgf24PB51JH9/qoOcn+T3CuZ7z1Z5dzUt8oDv6JvmJG1xqgpd/4wEytefsZEHKEwDWv
         bLxnXgf/7nqBwZk7L7UE+vjUDTkRunuw8DKAGdbcA6oqGh1G2s/SgOwLCX5Vh0hqyknv
         BQlQ==
X-Gm-Message-State: AJIora99g8PH6rK3Yvn4HJnjgdMiPZ71I+HAwVBYvqALaFJ9NMA+ovom
	RFROxdEp976QcJBp2erZjxVw+jpR+X+V3LQ0tRYk5Q==
X-Google-Smtp-Source: AGRyM1uoUJNV+pWkUKZPyqoYjVU92W2AXcs0+oJA8ZTI80Wfq+v4vJ2sRUr54xc0spYE3wbFPeNslZTmLW60JMAY1vM=
X-Received: by 2002:a81:830b:0:b0:317:b41e:9e49 with SMTP id
 t11-20020a81830b000000b00317b41e9e49mr3977250ywf.458.1656155843079; Sat, 25
 Jun 2022 04:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220625080423.2797-1-chenfeiyang@loongson.cn>
 <CAMZfGtWT7oPq6bD_fRn2gVNX8Lj3=ev21EAoaCCPeq-P_NYF0g@mail.gmail.com> <CAAhV-H5K9LG5P6WYJ+64-fi+s=TZbbJQG9E0vHJwOf9Pai5z4w@mail.gmail.com>
In-Reply-To: <CAAhV-H5K9LG5P6WYJ+64-fi+s=TZbbJQG9E0vHJwOf9Pai5z4w@mail.gmail.com>
From: Muchun Song <songmuchun@bytedance.com>
Date: Sat, 25 Jun 2022 19:16:46 +0800
Message-ID: <CAMZfGtVq0VwMETGdzAXLkjes8W0gVBw=r0Xk5rpPnhe7x6tRiw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] page-flags.h: Fix a missing header include
 of static_keys.h
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Feiyang Chen <chris.chenfeiyang@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Feiyang Chen <chenfeiyang@loongson.cn>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 5:04 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Muchun,
>
> On Sat, Jun 25, 2022 at 4:50 PM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > On Sat, Jun 25, 2022 at 4:04 PM Feiyang Chen
> > <chris.chenfeiyang@gmail.com> wrote:
> > >
> > > The page-flags.h header relies on static keys since commit
> > > a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled
> > > with a static_key"), so make sure to include the header to avoid
> > > compilation errors.
> > >
> > > Fixes: a6b40850c442bf ("mm: hugetlb: replace hugetlb_free_vmemmap_enabled with a static_key")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
> > > ---
> > >  include/linux/page-flags.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > > index e66f7aa3191d..147b336c7a35 100644
> > > --- a/include/linux/page-flags.h
> > > +++ b/include/linux/page-flags.h
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/mmdebug.h>
> > >  #ifndef __GENERATING_BOUNDS_H
> > >  #include <linux/mm_types.h>
> > > +#include <linux/static_key.h>
> >
> > I did not include this. The change makes sense to me. But I am
> > curious what configs cause the compiling error. Would you mind
> > sharing the config with us?
> We found this problem when we add
> ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP to LoongArch. Since this isn't

Good news to me. I would love to hear more archs support for HVO (HugeTLB
Vmemmap Optimization).

> upstream yet, we cannot give such a config now (the default config of
> X86 and ARM64 is just OK).

All right. In this case, the "Cc: stable@vger.kernel.org" is unnecessary.

Thanks.
>
> Huacai
> >
> > Thanks.
> >
> > >  #include <generated/bounds.h>
> > >  #endif /* !__GENERATING_BOUNDS_H */
> > >
> > > --
> > > 2.27.0
> > >
> >
