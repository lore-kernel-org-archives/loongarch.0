Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB98214232
	for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733859603; cv=none; b=pw5vTOSiGEF1cNLvDvHv0de8o2TEyyowywe+tdIvbcyx5ukJMulmfaty9qp9ZLF+Acuk0If3PA2SpaWl3DOfC4b6WcMBf+d9OLq/H5edeWyCxguh/ytvEzlvbmQuiO2LNAnkzKej9wKSvKs3Z6YhCWZ4HL6VzQoVhwCKIOSlPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733859603; c=relaxed/simple;
	bh=dv49gsM9X6vxEVxhRoy9UrWifvJpzPiOHoKBO4dRQCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPYAAJ4l2PGROjMfpOxbWqwEXy/Yy+lx3FSpFmpbvLXRf/Kt+0P0RhSsbTMR1RdVIKO3SsLdRKPog3UDQHZGsBpbhr7OKn3v29zKnefXTPA44hfieHqZl1btHf4LyiGrD7wnEf7sx9u500kS9xNLUjC1XPMgu0GukRVzkIgKv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqw16D30; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqw16D30"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so5263643a12.3
        for <loongarch@lists.linux.dev>; Tue, 10 Dec 2024 11:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733859600; x=1734464400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=nqw16D30JyrvIUUSzmCarmFy/kExEbqdzF4ZnkqwZ8sp98igqwyRVdjj/OTV27+sD9
         WmOAvcxnqbsK1lMrKvxRLgeVoaoawqd3WczMrLzAYQNcV748KV/Rei+0TgR2EILUiC5o
         +qVf3kQ6k/QaU+n/himS9B/bGtG0bSiJS9awDGdhT2f+q37lsbx1tNH7wKgyB4whwCNP
         Czzv8cQc1+IqFaOXuuiAuRJwJwZi4Vmtif3Belz5/5ZpwqQUDHALNhhvAPx+zfmxR723
         nwtUVbC+K9Ch/WfxnIn7yCaS3jOhfxs6CkhK+efXuCky0tLsEFuMzeI252vJp5wvRU88
         Jjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859600; x=1734464400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=GB1GxbSHc7sSzMaqfBNv/6ufmgyGMPaJgW1xVKtjv/v3JM3IQ8jCiKmYpwAmAKiXJo
         rWa/OHeabWqB/Z9W1rELgsm5Hrok9pWE0NXJ6dWjrvGvQtA3rIKwXE8cNxZrqKTvGV/F
         TJciY0nRGnCWYj6NyTTlkfFmYRvw7tkKgiK2LUb6AzbT5q/5S4PRN9XoDxcTouHwqx/g
         CHaQAyn0Bi7k0+iZTe6wlPlgCVsBq6oziw4Y8pVrPk/vDsUinkGU3mrVaKrel9DzkhGX
         hsfeiFzf9KNn+88j9kf+uCrCrqqcQwK7vGHx1GQnP7eySl3vpwnPyoNp54Ntoz0TN+VB
         io9A==
X-Forwarded-Encrypted: i=1; AJvYcCWZnRL9bIxuWyTJSd5ve8PUPqwPTvAiVFiomec/7vRwGzkT4oThiI9SwaY/+CfxyIlIgwCFqzWdmyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGi3fMU8QSTGydZRvLQltGYMTZb9g//MPXb2oib/ippC6Vk9tu
	dZbFTepvbmvta5eE079RMsZxJVHPpWFoLeifLPTJoziFMx/ZNLuj0cUGaFWLpRNLdC/fmRUOstp
	+BT1hmRD3vD5QTL7FJUQXQIgEPs4=
X-Gm-Gg: ASbGnctQ2VhW5YNBYeGeVnepzC1i266HQAQnRmtKyP6PUK1+WgyUCT57rX989mY8R6C
	STxBZ2iTEzggdbUyWYceujuOtx0jpYeog/H7k5Q==
X-Google-Smtp-Source: AGHT+IGn1TGMw5Q3ZRvX4tSkpBgSMsKO1aElzvBulPGolgowmhm7A7II8tzVQjdTXusigtkhjHD3HA/xYigxPDvvUCI=
X-Received: by 2002:a05:6402:5299:b0:5d0:c9e6:30bc with SMTP id
 4fb4d7f45d1cf-5d4330814d0mr38059a12.10.1733859599911; Tue, 10 Dec 2024
 11:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
 <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
In-Reply-To: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 10 Dec 2024 11:39:48 -0800
Message-ID: <CAHbLzkqbH_AR2jy_6LZ7KSh6bcf4L5B51Mq9DwYtdBcVz1Lu6w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 9:34=E2=80=AFAM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wro=
te:
> >
> > On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google=
.com> wrote:
> > >
> > > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for=
 THP")
> > > fallsback to PAGE_SIZE alignment instead of THP alignment
> > > for anonymous mapping as long as a hint address is provided by the us=
er
> > > -- even if we weren't able to allocate the unmapped area at the hint
> > > address in the end.
> > >
> > > This was done to address the immediate regression in anonymous mappin=
gs
> > > where the hint address were being ignored in some cases; due to commi=
t
> > > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries"=
).
> > >
> > > It was later pointed out that this issue also existed for file-backed
> > > mappings from file systems that use thp_get_unmapped_area() for their
> > > .get_unmapped_area() file operation.
> > >
> > > The same fix was not applied for file-backed mappings since it would
> > > mean any mmap requests that provide a hint address would be only
> > > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > > the hint address or not.
> > >
> > > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > > address and fallback to THP alignment if that fails.
> >
> > Thanks for taking time to try to fix this.
> >
> > >
> > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > ---
> > >  mm/huge_memory.c | 15 ++++++++-------
> > >  mm/mmap.c        |  1 -
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 137abeda8602..f070c89dafc9 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         loff_t off_align =3D round_up(off, size);
> > >         unsigned long len_pad, ret, off_sub;
> > >
> > > +       /*
> > > +        * If allocation at the address hint succeeds; respect the hi=
nt and
> > > +        * don't try to align to THP boundary.
> > > +        */
> > > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > > +       if (addr)
> > > +               return addr;
> > > +
>
> Hi Yang,
>
> Thanks for the comments.
>
> >
> > IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> > arch_get_unmapped_area_topdown() again. So we will actually look up
> > maple tree twice. It sounds like the second hint address search is
> > pointless. You should be able to set addr to 0 before calling
> > mm_get_unmapped_area_vmflags() in order to skip the second hint
> > address search.
>
> You are right that it would call into arch_mmap_hint() twice but it
> only attempts the lookup once since on the second attempt addr =3D=3D 0.

Aha, yeah, I missed addr is going to be reset if arch_mmap_hint()
fails to find a suitable area.

>
> Thanks,
> Kalesh
> >
> > >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> > >                 return 0;
> > >
> > > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         if (IS_ERR_VALUE(ret))
> > >                 return 0;
> > >
> > > -       /*
> > > -        * Do not try to align to THP boundary if allocation at the a=
ddress
> > > -        * hint succeeds.
> > > -        */
> > > -       if (ret =3D=3D addr)
> > > -               return addr;
> > > -
> > >         off_sub =3D (off - ret) & (size - 1);
> > >
> > >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 59bf7d127aa1..6bfeec80152a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned l=
ong addr, unsigned long len,
> > >         if (get_area) {
> > >                 addr =3D get_area(file, addr, len, pgoff, flags);
> > >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > > -                  && !addr /* no hint */
> > >                    && IS_ALIGNED(len, PMD_SIZE)) {
> > >                 /* Ensures that larger anonymous mappings are THP ali=
gned. */
> > >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, le=
n,
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
> > >
