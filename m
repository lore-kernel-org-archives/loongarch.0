Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8236C5A1
	for <loongarch@lists.linux.dev>; Tue, 19 May 2026 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216106; cv=pass; b=gHombN5hauSGBUVug1MEGTPSQL8WOjtYyXYS+84uoRjGvMp5t0A+nIirH/4FpTGAFbrWRuKy5zQDvVfIBAwgLWlbcJszGa2wWtNFjDw4nwHvC9eYx8YysK3Kg/BZgJ7dIeB011RbVMpMqEpfBfwWD4CaKoMuB4Zb9UFCpJMDrC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216106; c=relaxed/simple;
	bh=NUS9DVD1uBsKADBy/TN1ttZZgthszq/ZhN8ehPHat48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUJ9vQN2hhMMlN9u33UCbpLbmv9Wda9s8Pkh4WdgZfP9jkL8CVDyUnZ84e7BFQB6KdpCFKkPznvg20QJ0CK/k4H3rhaMB5Kg8bX406lJSPpsFU7mwErJMNmjIUHPcAG6Un4jjHpuZyw6x6Wpc/i/DRNc6VOQ1oI5ElHFTMgnQWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUYLAwad; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUYLAwad"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so6917187a12.3
        for <loongarch@lists.linux.dev>; Tue, 19 May 2026 11:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216103; cv=none;
        d=google.com; s=arc-20240605;
        b=TsLkShYKX/YkOhtXrsJzA4wa4glri4oZZ2KaQ38wI4vlpnzD2J2eKr1E3F3Gm7XYUD
         z2mI/R8OwcrovQHO17rRsZ3squ4KbSsZtuWIBpvgig7u2FrZGhJGXP/WsTDzOk3ojLtB
         g4qxhuVtmBL5AGI9LVJQcbFtfYIq7A93oTZym8MpT2JrkDh3rRKmJVvaeRQEOIzW+vhn
         sefF8D9G964i35Pna06k4kXZufWA+WWSWbEHhKeJZV4+CiFbdkpJY2H1fBOKQiZ9i4vJ
         FVNc0/KqLCqiCy8rMzE242pQYOkLgHdiTyBEKXwamk6qL1eKt1XCNSlgEDSCtq7FyYgg
         ++lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        fh=tSmV5dK23M5jvSQlL4oz3mLgLfngVbqTnB4lNi2gHxU=;
        b=lQFd8tC+AVkx/t2Ubjl7gFw2bwDP5CJwLhXH4SITq4ImMZrJ0UhZkmuWPt1J3Zxd9E
         h6H47TEAbRnZlP694VpKAFdXp7t3K4Z2m1hz6Ae4LdpxWANb9BvFg/1XViZwMHpxpzY7
         ljhj9EQWLpEUCVCT4jPGNGptVg/u6UPgo36FeCcf6qcM/rh02n56BE0wN/XoQ+vnhQ3e
         XB1mo4YPyDkgjziM970lzcZXWEJ3npwvNvVzC1pc6CcYBaFCE0ykijXhWFKGrAVXpNDq
         pVjAFrbT58DzXK/iSMbwABOIIcqzr3Z15g5yu3w3/9ig1IiZBOFJIga8mqcPEozfmfS7
         ttZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216103; x=1779820903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=UUYLAwad9S+qA7rt96UDgaQep5qpHhyyszraMpDI9y1lcWJOl7LQ7bHNRqDV5dI8aP
         E+tnpbVbK0ffflfLvyF1dQKtliBUFcAf2hZLFQRqr9Fsrm3JJEu4Pehhjn5qeDmLXfWF
         QOXxCSvZWkVcA3qht+5JIzLGCvZb0mOnQI0Qr/BX+5sut2KxJH76d/Xq3m2g6g3IBDjC
         dNg5/OEJF4tq22ixnkjZ9LBfaQx0MSQlVlNDR0OpUnxjqGK1NBSx9ykIct1OHJXiDElt
         h62uwv4L6GYBUr/zSELAhDufcze6R173r/F7cNfq2mZZPKixNgP2lzNbZnHpugLUIOid
         Mx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216103; x=1779820903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=n2Vp1teuFeA1o6WOJDsHq+4Ae8F9gDs3fztm0OGFWF2t3/d3afzBR2lcwprBnK5Kxa
         Zq4kwwu+sl4BVm3J3MlhTdGqwMxO7gS2/KGi2xxO5o0M4kyA7P9oaKsBGi+Denyhqax6
         JtY9ZmXIM32fnCi0TR9Yc5PE37Yvv2y4hqwzjzwan4apFxrhExjAl5UPInSzVsnz0Op1
         zfvP7LJkQ8SSGYWFWYZgCYe/t0zCb+uUY84uwYGZtOdhG6nH7DiQ1eNK5mefHWRX1xAL
         8cbbxn2PCZImGFxZn5z6AW45iOyt139t1LHqz/XorKSsQEoefR1lR/xaYz3PzQwyOZfj
         ixzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l07ldHga9VCVZMb+urc8mPOs23Wn4b4gM1/Wdft6egqTnNEop5nLabARcAARg7RY+YPWCHVVeIag=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvwMBNPQSO8gGbetY78cQoXTWkiBeo1LzvwK8zcbgXG0SgraWV
	DJc40f9z129tuB/xVeO+AUTq37HCXCnkYLvQ48G02o6jkVFUu+NLb6DhQTs5w0Nv1EgdEhAd40G
	Wx6/hIWsbDq/8VXb20P8eCgJA5fUtAqw=
X-Gm-Gg: Acq92OGJjjRMQzJi4FGolYqjlp2Hl2gQMOook4LCeRn7MHLI0cZBRypH+oGyeeDys67
	k3VgS6VRqRTFsyp5wo0YAfyYG2NU8TlSlL5S9GMU4SF3SluXuWVsP3FILzcSGj1LBHzudj/Puyn
	RJAXyRDfUvbITtoz2Hp8YVDdyP8JfHOpbXu3cxRW3a9rERzpbJVbGIScZZobjsUNJk3r9HrH2fS
	W7gwhZHrIqK+We6rX4EQOu4kW9XFMObgOSetAgAX6tRZV0wuXnN4Ena3I2ynpEqS5oGAx/GJdqw
	SIEBpPdsuw==
X-Received: by 2002:a05:6402:524c:b0:67c:96e7:3427 with SMTP id
 4fb4d7f45d1cf-683bad350f8mr10588073a12.0.1779216103209; Tue, 19 May 2026
 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer>
In-Reply-To: <agxnJ8R-G3CRjeTR@lucifer>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 11:41:30 -0700
X-Gm-Features: AVHnY4KjLtyViRy-FP1MJx-LYZJZfACCXodkXf2RGwVY3_NriDPxFvXtK5Jn_zQ
Message-ID: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 6:39=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Tue, May 19, 2026 at 02:12:10PM +0100, Lorenzo Stoakes wrote:
> > On Mon, May 18, 2026 at 02:21:14PM -0700, Yang Shi wrote:
> > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > possible we don't have to take vma write lock unconditionally. IIUC
> > > the write lock is mainly used to serialize against page fault and
> > > madvise, right? I got a crazy idea off the top of my head. We may be
> >
> > Err no, it serialises against literally any modification or read of any
> > characteristic of VMAs.

If I remember correctly, you are not supposed to change VMA
flags/size/mm pointer/vm_file/pgoff/prot, etc, under read vma lock or
read mmap_lock.

> >
> > > able to just take vma write lock iff vma->anon_vma is not NULL.
> >
> > Except if we don't take it and vma->anon_vma is NULL, then somebody can
> > anon_vma_prepare() and change vma->anon_vma midway through a fork and c=
ompletely
> > screw up the anon_vma fork hierarchy.
>
> correction: this won't happen as per Barry (see - I managed to confuse my=
self
> here :), since for vma->anon_vma install we take the mmap read lock.
>
> BUT we also have to consider other cases.
>
> >
> > So no.
> >
> > >
> > > First of all, write mmap_lock is held, so the vma can't go or be
> > > changed under us.
> >
> > vma->anon_vma can be changed.
>
> Correction: no it can't :)

Yes, vma->anon_vma change should require taking read mmap_lock.

>
> >
> > >
> > > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > > fault happened or no cow happened, so there is no page table to copy,
> > > this is also what copy_page_range() does currently. So we can shrink
> > > the critical section to:
> >
> > Firstly, with no VMA write lock, !vma->anon_vma means a fault can race =
and
> > secondly copy_page_range() checks vma_needs_copy(), there are other cas=
es - PFN
> > maps, mixed maps, UFFD W/P (ugh), guard regions.
> >
> > So yeah this isn't sufficient.
>
> However this is true...

Yes, fault can race with fork. Basically this is actually the purpose
of this idea. We can have improved page fault scalability. In my
proposal (take write vma lock if vma->anon_vma is not NULL), the race
just happens on the VMAs which page fault has not happened on before.
vma_needs_copy() also skips the VMAs which don't have vma->anon_vma.
So there is basically no difference in semantics other than more page
fault races IIUC. It should be safe as long as we can guarantee there
is no writable PTE point to a shared page after fork.

For guard regions, it can be serialized by vma write lock if
vma->anon_vma exists. If vma->anon_vma is NULL, it will prepare
anon_vma, which will take read mmap_lock if I read the code correctly.

I have not investigated UFFD yet.

>
> >
> > >
> > > if (vma->anon_vma) {
> > >     vma_start_write_killable(src_vma);
> > >     anon_vma_fork(dst_vma, src_vma);
> > >     copy_page_range(dst_vma, src_vma);
> > > }
> >
> > Yeah that's totally broken fo reasons above as I said :)
> >
> > >
> > > But page fault can happen before write mmap_lock is taken, when we
> > > check vma->anon_vma, it is possible it has not been set up yet. But i=
t
> > > seems to be equivalent to page fault after fork and won't break the
> > > semantic.
> >
> > It will totally break how the anon_vma hierarchy works :) See the links=
 at the
> > top of https://ljs.io/talks for a link to various slides on anon_vma be=
haviour
> > (it's really a pain to think about because it's a super broken abstract=
ion).
> >
> > You could end up with a CoW mapping that's unreachable from rmap and yo=
u could
> > get some nasty issues with page table entries pointing at freed folios =
:)
>
> Correction: actually we should be safe given mmap read lock on anon_vma i=
nstall.
>
> >
> > >
> > > Anyway, just a crazy idea, I may miss some corner cases.
> >
> > Yeah sorry to push back here but this is just not a viable approach.

No worries. Thanks for all the feedback. Just tried to explore whether
such an idea is feasible or not.

> >
> > And this is forgetting that we have relied on page faults being blocked=
 by fork
> > _forever_, who knows what else has baked in assumptions about that
> > serialisation.
> >
> > Forking is one of the nastiest parts of mm and has had multiple, subtle=
, corner
> > case breakages that have been a nightmare to deal with.

Yes, this might be the biggest concern. The page fault can race with
fork. If some applications rely on such subtle behavior, it may break,
but such applications are fragile too.

> >
> > So I'm very much against changing this behaviour to try to fix somethin=
g in the
> > fault path.
> >
> > We should address the fault path issues in the fault path :)

Yeah, this idea was inspired by Barry's "not take vma read lock
unconditionally" idea. Maybe irrelevant to Barry's priority inversion
problem, just an idea for further optimization on page fault
scalability. This probably should be a separate topic.

Thanks,
Yang

>
> Above still all true though.
>
> >
> > >
> > > Thanks,
> > > Yang
> > >
> > > }
> > >
> > > >
> > > > Based on the above, we may want to re-check whether fork()
> > > > can be blocked by page faults. At the same time, if Suren,
> > > > you, or anyone else has any comments, please feel free to
> > > > share them.
> > > >
> > > > Best Regards
> > > > Barry
> > > >
> >
> > Cheers, Lorenzo
>
> So still a nope :)
>
> Cheers, Lorenzo
