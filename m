Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B32222A1
	for <loongarch@lists.linux.dev>; Sun, 30 Nov 2025 02:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764471394; cv=none; b=PbTM2KgrBWpX1H0Fl4X4LR78j6Zk44xlUYLcocrsz17uW/GTXIn0P8MhOqS3mXrIfTvqjofYalCh6+XQMAID8rKJ1b6eEo8pTp6yRRN8EG6wxHjO1LHaERIuJbbIEQVYtF2nFk/glzCf5xh3gIOIpaP2NK2g0QrbmUjhXcl64V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764471394; c=relaxed/simple;
	bh=OP8eZ/M54fHVsYMy44BgHRgd3kLpjJqrEEw30IldJYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfCkKmM0zSxS9RNQwqYb9IJgMa2HHsSXEEzaxFbKqS+8ZUBBt8eXrMJ2Rtb6YPV1+A88Q6JKtp086tI7eKG8y6GwVog4zh1C3I/xBklpE85trzOLHm/U9kVR+q54iWvgm+eO9zeQyEYSlu9fgILypte1GwEki0vvD8F1ogWPwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF2d2tJA; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF2d2tJA"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8826b83e405so42468896d6.0
        for <loongarch@lists.linux.dev>; Sat, 29 Nov 2025 18:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764471392; x=1765076192; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=lF2d2tJAD6PAYl5hSTrxR0MQ7nzvOP7QF4C2gYuhHNsN49d7Ovp2mgcFAxy0ludFaC
         q9jriG035/kaoG60LTjhX1Zdb/otuFGZVPK0FiQ8l1TpqtFNvpVooa/qNSG1LxxtyLvM
         PMf2wZSinRa8L6mSx+LZyxB7pbhXe4yLlkNSh8QM6YM9b8CYnJ83pi4sWuDmCQ+nKzGk
         AbuRH2XmX1xQFwz6rb65PGY9lgG9mlvi5GZukSaXV6iQ9zRA3RsciPe929S55+EbBX1x
         oiMEM/ep0GOubu46byjOo9ICo5bdHxfsZRQF5QqzPtQtYu/EeGztMJSrx2u+WZEBZywp
         4bRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764471392; x=1765076192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=IN5KyxSg7mG/asWM0onydcQjOT9b+v51wfJkxH7L5jvAEwHUfbuOA6E+/PxjBfw0F8
         tI+S5eO9CtIck9RZdT+zZ6ShV1qOK7dvbdxB4aJD8Yi0SQII9nLh1n+d+oKB0yMv8NyD
         nlUmbD3pSDWc/f0LGHVzqQZQv3Ni9kq01zzVm3y4V9soWriC1xl9i1Rr49fzM2+jAhfc
         dBjSdeifdPFb5H5xDKa4H2ytqd7TKdt+gt4ANaFx33PcwS6lXIPxPsSUh8OUDbR6Lxx3
         4YMVVAghU9MNwI8mgfPpIQIGeo7JfMW5/4ccx52gA4gTfRco/QeECHXuQfyAeYAZjl3R
         nKsg==
X-Forwarded-Encrypted: i=1; AJvYcCUEphnYRRHLtEzk9oYd8J0zD+orB2I5Sle8/tvWXesnIxe0rD/BWB7PeAmwARaEMDLxa9hR9d+dI5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy54cXzcnXaD0gN7VH80dnb8XMU4x06mYgZFICKLOGxSJLdCK1e
	P9p08wIg+v1dFcatoq8OQq85aX85YvC8APsrrd4o+Cv4vwKpwK7558TTR9G6ZJYHh35GMGIVFts
	tkRVvFDGAxhFKy4YKbdCRpm6Pijsk1c4=
X-Gm-Gg: ASbGncuV40pxHb3W1QCvapljiObjPcG4MyRk/zsQleWosUGGyLDHBdmhd09syrKvnzI
	wxOpAvduB6spC+Ocx79X7/f4gKeERTXyIbm+/sv7pmdOi3yrsrPLTa/kbWA0B9IiYC37KhH4AqB
	p0igYZO/nxnt3WPoE4rUPqDvvFTNVMBJ+lvzols6vpbDBnPT6i2W/bUOSf7CPLPPFwXilWKR4nn
	ce1XX2txmDGLXs2dw0nc5jYVx1or45ks8Am8zZHsa+cPQ0F59/rGCg2EgTtmQiZhc/nGQ==
X-Google-Smtp-Source: AGHT+IF/3KjmDnaoo/ldsvPnDlqyF1g2t85SJ38riWFY6aw2+Rx4sE2XTJgJQYrytReWz53k6ueQn63K+Iy7zP31uHo=
X-Received: by 2002:a05:620a:4407:b0:8b2:e565:50b5 with SMTP id
 af79cd13be357-8b33d49a212mr4299108585a.60.1764471391497; Sat, 29 Nov 2025
 18:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
 <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
In-Reply-To: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 30 Nov 2025 10:56:20 +0800
X-Gm-Features: AWmQ_bmtzU1YmYdPvDdBUL-_Xs4w9bVsuxx9pZGnImnoxnlMuoZQMERTeIMRpa0
Message-ID: <CAGsJ_4wnwAet4svDrxT4sTdp24sweAU-2VyYn3iNPOoaKdXxPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 8:28=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > [dropping individuals, leaving only mailing lists.  please don't send
> > > this kind of thing to so many people in future]
> > >
> > > On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > > > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infr=
adead.org> wrote:
> > > > >
> > > > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > > > There is no need to always fall back to mmap_lock if the per-VM=
A
> > > > > > lock was released only to wait for pagecache or swapcache to
> > > > > > become ready.
> > > > >
> > > > > Something I've been wondering about is removing all the "drop the=
 MM
> > > > > locks while we wait for I/O" gunk.  It's a nice amount of code re=
moved:
> > > >
> > > > I think the point is that page fault handlers should avoid holding =
the VMA
> > > > lock or mmap_lock for too long while waiting for I/O. Otherwise, th=
ose
> > > > writers and readers will be stuck for a while.
> > >
> > > There's a usecase some of us have been discussing off-list for a few
> > > weeks that our current strategy pessimises.  It's a process with
> > > thousands (maybe tens of thousands) of threads.  It has much more map=
ped
> > > files than it has memory that cgroups will allow it to use.  So on a
> > > page fault, we drop the vma lock, allocate a page of ram, kick off th=
e
> > > read, sleep waiting for the folio to come uptodate, once it is return=
,
> > > expecting the page to still be there when we reenter filemap_fault.
> > > But it's under so much memory pressure that it's already been reclaim=
ed
> > > by the time we get back to it.  So all the threads just batter the
> > > storage re-reading data.
> >
> > Is this entirely the fault of re-entering the page fault? Under extreme
> > memory pressure, even if we map the pages, they can still be reclaimed
> > quickly?
> >
> > >
> > > If we don't drop the vma lock, we can insert the pages in the page ta=
ble
> > > and return, maybe getting some work done before this thread is
> > > descheduled.
> >
> > If we need to protect the page from being reclaimed too early, the fix
> > should reside within LRU management, not in page fault handling.
> >
> > Also, I gave an example where we may not drop the VMA lock if the folio=
 is
> > already up to date. That likely corresponds to waiting for the PTE mapp=
ing to
> > complete.
> >
> > >
> > > This use case also manages to get utterly hung-up trying to do reclai=
m
> > > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > > your problem (everybody ends up blocked on mmap_lock) but it has a
> > > rather different root cause.
> > >
> > > > I agree there=E2=80=99s room for improvement, but merely removing t=
he "drop the MM
> > > > locks while waiting for I/O" code is unlikely to improve performanc=
e.
> > >
> > > I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" co=
de
> > > was written before the VMA locking code was written.  I don't know th=
at
> > > it's actually helping these days.
> >
> > I am concerned that other write paths may still need to modify the VMA,=
 for
> > example during splitting. Tail latency has long been a significant issu=
e for
> > Android users, and we have observed it even with folio_lock, which has =
much
> > finer granularity than the VMA lock.
>
> Another corner case we need to consider is when there is a large VMA
> covering most of the address space, so holding a VMA lock during IO
> would resemble holding an mmap_lock, leading to the same issue that we
> faced before "drop mmap locks for I/O". We discussed this with Matthew
> in the context of the problem he mentioned (the page is reclaimed
> before page fault retry happens) with no conclusion yet.

Suren, thank you very much for your input.

Right. I think we may discover more corner cases on Android in places
where we previously saw VMA merging, such as between two native heap
mmap areas. This can happen fairly often, and we don=E2=80=99t want long BI=
O
queues to block those writers.

>
> >
> > >
> > > > The change would be much more complex, so I=E2=80=99d prefer to lan=
d the current
> > > > patchset first. At least this way, we avoid falling back to mmap_lo=
ck and
> > > > causing contention or priority inversion, with minimal changes.
> > >
> > > Uh, this is an RFC patchset.  I'm giving you my comment, which is tha=
t I
> > > don't think this is the right direction to go in.  Any talk of "landi=
ng"
> > > these patches is extremely premature.
> >
> > While I agree that there are other approaches worth exploring, I
> > remain entirely unconvinced that this patchset is the wrong
> > direction. With the current retry logic, it substantially reduces
> > mmap_lock acquisitions and represents a clear low-hanging fruit.
> >
> > Also, I am not referring to landing the RFC itself, but to a subsequent=
 formal
> > patchset that retries using the per-VMA lock.
>
> I don't know if this direction is the right one but I agree with
> Matthew that we should consider alternatives before adopting a new
> direction. Hopefully we can find one fix for both problems rather than
> fixing each one in isolation.

As I mentioned in a follow-up reply to Matthew[1], I think the current
approach also helps in cases where pages are reclaimed during retries.
Previously, we required mmap_lock to retry, so any contention made it
hard to acquire and introduced high latency. During that time, pages
could be reclaimed before mmap_lock was obtained. Now that we only
require the per-VMA lock, retries can proceed much more easily than
before.
As long as we replace a big lock with a smaller one, there is less
chance of getting stuck in D state.

If either you or Matthew have a reproducer for this issue, I=E2=80=99d be
happy to try it out.

BTW, we also observed mmap_lock contention during MGLRU aging. TBH, the
non-RMAP clearing of the PTE young bit does not seem helpful on arm64,
which does not support non-leaf young bits at all. After disabling the
feature below, we found that reclamation used less CPU and ran better.

echo 1 >/sys/kernel/mm/lru_gen/enabled

0x0002 Clearing the accessed bit in leaf page table entries in large
       batches, when MMU sets it (e.g., on x86). This behavior can
       theoretically worsen lock contention (mmap_lock). If it is
       disabled, the multi-gen LRU will suffer a minor performance
       degradation for workloads that contiguously map hot pages,
       whose accessed bits can be otherwise cleared by fewer larger
       batches.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUw=
YiEotVqP-ndEQ@mail.gmail.com/

Thanks
Barry
