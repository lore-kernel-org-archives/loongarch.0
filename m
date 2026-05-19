Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540EA3BB130
	for <loongarch@lists.linux.dev>; Tue, 19 May 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779224545; cv=pass; b=QqwBureAEoWgVbNhFG2IOmH20tRQqlspFce2pDJ2KnUrrZVy8Duf64gi6ZHA0ayEJpMXrEVpMWnyA38ALObgyBe3D+C2bSrZ1ItykQZvvQGPD8ZVq0DfQc6GCXTYL4wBZ9aIqcttsMM2c6JDzJGpA+1wxahSA2/NLH2uetKvS8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779224545; c=relaxed/simple;
	bh=e5d+bIM/QdyiHVru4Q09zvhy/PyIjYzi7G/q0e31bww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWE5BZVjKNWAhmlv3XYblng83ouR4UKNpZrXfZbN1S8gzB+3cisDI79CORlQUSY0LK5fuMealrdEgoiRQYGtpxFsQOGbipeYaJ0yzcgKeYvnbAOUXaO4Ufnl8GPZOJjer5rbI0FBz+ovHcEJx2igiNiSigbPQf58qch5Uz5z/E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4z6buMT; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4z6buMT"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b936331786dso533250966b.3
        for <loongarch@lists.linux.dev>; Tue, 19 May 2026 14:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779224542; cv=none;
        d=google.com; s=arc-20240605;
        b=UxEMcy0+J9Z392o9OCCuXJt31WGtSOWfWbMTGCriv/ciu6SVkq90zEtnp0V8hrrgeP
         TJi8ItGivoxymVRvmygOPcbJR1DVp6tIOWOTmkT3qxHheUe6C3dqfQh98/Aqe388APlX
         5kCOPue8wRL0qa75aZtTPOtTnxqGbH3mVzAuEVH9Uznjf3Kk+uesFcgm/28oJ9UcJblh
         Wy9xSk1pOTzg2WIyCeV+HQiIps6yt96NgNUJaHF/SPyEeLu/fYlTbORWSyeF1OH4H86b
         RsWGvFRczvbEOxLiNLl1Dkh/nR1nprvLMDzFpz5X+QtcUQ36xEei/SLeZJ6ng99FGH3N
         rHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        fh=qJrI+LV+z5FQDoxIeqwobCBstddiBRqj0FOqic5T+44=;
        b=dgUn2zyKT6IXmpwGNaLmpkP0d6UX2LTLplbMwVwfAcGE5COC4ICF9xt7LSM9+fsFFw
         Iu66cD5kJVHa8R/y+oN/9/JcpI9KtcajUQHWCEGperFzRkI0/miPeJWQJP5vlEUesjMj
         L22KolVMUy1mxtQB/6z/YvdNnOO2WAZ4UFLjtNNHAhyxv7cd1TimQlXW0mDtpK4UUalL
         LETKbjVTAasELLtuXrc+w0LKQOHXC3eLD+/tkCg632GHN9/7fFwebYUVmW28g4sWTJLD
         ym7JX+YIwrUUfXmUXVKbF7ueejOmuegWI0iyIUkA8w8i0etVr7VWwwv3yltT6jYEteyQ
         xF6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779224542; x=1779829342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=i4z6buMTqavdZa1vvSzQIygGlkbkwxW+U3b/sRQj54Sra0LTLVaeeD4oKOukCHZgzc
         O100URqF1g53BH3AkvJPFoLfAcK2UQ/n/o+6JlOPoVZV57WLAjPJPrXuBq1H+D5jV1GA
         +NEjPirgeUuThKqVx097k8BaewuSEexYXy/RsnbZTSBpoNG/m65v5SyhQ+QmfzqYP2Wf
         GCpDmFYLgO7TOqc2cd2viOcMI9jBaEVswBMiDo9jXZlZOyYh1GNACcvoFbUPLBU1Q7BE
         WGjWBcGx9Tyk4NmRMTu1q0BTZtkN6cwxsQnkhxplT3+MU/7pPwuMM4NT35QyokXcmxl3
         f23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779224542; x=1779829342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bg1sJVq29IP0l0ZfRic8XdzhSk92ovWlIbkT7xGYhvE=;
        b=gcZb66k8KkeFczWb5RxVWV7x6y4ikAAo/hh40sbZDBPUsFnqM+t7551Dvi8nQlQAhn
         fpeBym1CHap/wu1MTMDXYfO3e94jqXcHxDUsb14KOFIvf/dE/gYWRwQnP3UsnRnuwjOb
         2WAHhPS7cDo26FCXV2GYAin0e7WnNJkqwqLk6F2WkkjtD6jwdULsiL9NndPU8vAFqiGR
         7uMIRtanZn4+KiQPgwJNRo9jPyNw51oEQpskt6Lu2gq8obNx4eV4hYx4y6/mvo8lZ+XJ
         b3viPA5h5vhUurlI5POVsRV7Kzd3WFMC8WQQ0FPt3L70KsU9wm+jkXdWe4ycQODRU3EC
         n1WA==
X-Forwarded-Encrypted: i=1; AFNElJ/uc3gS7KBRpN1UJ2bGq4uMVZ6n/9ZLp873RLmCK+Jh9Q5VaiA0zjyu/ZVQ6M3/d4rlB2n/fLisq3c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgjyT3UWhmL9KbkvrnDJvaFQHuejdmnsrKerB0LlkCns2ks90Z
	oC30DjoWuQDvf9L4wAmc2fq0PRWQAj8jBZ2AVsEgORClXA7Aa8uPzIDXhNtL3pFasvGP5uJXMhM
	52/e+vHV0c6Yga9TLM3PZhoPE+KUD50M=
X-Gm-Gg: Acq92OHxNniAUz5eEhV4P+UnSrocQMhFSuerA6vjPNMrEIF3tra9tQDIRbHVuTFIiqU
	yMiNljGLETuwsAXuQo3sByyZq8G5MEQy2tkctzv5O0VldT6sVGcbKzkPJDHZ6HnWPNc21oosOFX
	0QH6KEbp8fxBeL4axm8jfM8Rw/C7WrF9Hcjp/7MqOWEiqs1B639bZdH4E1xyx3zvXmsIENKzh0u
	xDsFhiyj41FT+7MwyYBgODBKSE1IGtD2abGqUsk1oyQUs3QN8+H7Gd2R4kkxjzl6BTXRUVHr+id
	CKiY6si+YyYe6Ob9Gw==
X-Received: by 2002:a17:907:1b1c:b0:bd2:387:6bd with SMTP id
 a640c23a62f3a-bd5177afa91mr920483166b.4.1779224541529; Tue, 19 May 2026
 14:02:21 -0700 (PDT)
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
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer> <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
In-Reply-To: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 14:02:09 -0700
X-Gm-Features: AVHnY4IdUrtf0zjmci6G1wPksPxXO0JC_jVTm-UIYV_TFA36gqIEv83n9ohB0es
Message-ID: <CAHbLzkrTF7w+T5mGsQuDRuhnTk6evTKBNRcH4oS=nRcUg2zpsg@mail.gmail.com>
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

On Tue, May 19, 2026 at 11:41=E2=80=AFAM Yang Shi <shy828301@gmail.com> wro=
te:
>
> On Tue, May 19, 2026 at 6:39=E2=80=AFAM Lorenzo Stoakes <ljs@kernel.org> =
wrote:
> >
> > On Tue, May 19, 2026 at 02:12:10PM +0100, Lorenzo Stoakes wrote:
> > > On Mon, May 18, 2026 at 02:21:14PM -0700, Yang Shi wrote:
> > > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > > possible we don't have to take vma write lock unconditionally. IIUC
> > > > the write lock is mainly used to serialize against page fault and
> > > > madvise, right? I got a crazy idea off the top of my head. We may b=
e
> > >
> > > Err no, it serialises against literally any modification or read of a=
ny
> > > characteristic of VMAs.
>
> If I remember correctly, you are not supposed to change VMA
> flags/size/mm pointer/vm_file/pgoff/prot, etc, under read vma lock or
> read mmap_lock.
>
> > >
> > > > able to just take vma write lock iff vma->anon_vma is not NULL.
> > >
> > > Except if we don't take it and vma->anon_vma is NULL, then somebody c=
an
> > > anon_vma_prepare() and change vma->anon_vma midway through a fork and=
 completely
> > > screw up the anon_vma fork hierarchy.
> >
> > correction: this won't happen as per Barry (see - I managed to confuse =
myself
> > here :), since for vma->anon_vma install we take the mmap read lock.
> >
> > BUT we also have to consider other cases.
> >
> > >
> > > So no.
> > >
> > > >
> > > > First of all, write mmap_lock is held, so the vma can't go or be
> > > > changed under us.
> > >
> > > vma->anon_vma can be changed.
> >
> > Correction: no it can't :)
>
> Yes, vma->anon_vma change should require taking read mmap_lock.
>
> >
> > >
> > > >
> > > > Secondly, if vma->anon_vma is NULL, it basically means either no pa=
ge
> > > > fault happened or no cow happened, so there is no page table to cop=
y,
> > > > this is also what copy_page_range() does currently. So we can shrin=
k
> > > > the critical section to:
> > >
> > > Firstly, with no VMA write lock, !vma->anon_vma means a fault can rac=
e and
> > > secondly copy_page_range() checks vma_needs_copy(), there are other c=
ases - PFN
> > > maps, mixed maps, UFFD W/P (ugh), guard regions.
> > >
> > > So yeah this isn't sufficient.
> >
> > However this is true...
>
> Yes, fault can race with fork. Basically this is actually the purpose
> of this idea. We can have improved page fault scalability. In my
> proposal (take write vma lock if vma->anon_vma is not NULL), the race
> just happens on the VMAs which page fault has not happened on before.

Sorry, this is incorrect. Page fault can't happen on those VMAs
because page fault needs to create anon_vma, but it requires taking
mmap_lock.
If anon_vma is not NULL, vma write lock will serialize against page
fault. So there should be no race with page fault. Removing vma write
lock suggested by Barry may increase race.

Thanks,
Yang

> vma_needs_copy() also skips the VMAs which don't have vma->anon_vma.
> So there is basically no difference in semantics other than more page
> fault races IIUC. It should be safe as long as we can guarantee there
> is no writable PTE point to a shared page after fork.
>
> For guard regions, it can be serialized by vma write lock if
> vma->anon_vma exists. If vma->anon_vma is NULL, it will prepare
> anon_vma, which will take read mmap_lock if I read the code correctly.
>
> I have not investigated UFFD yet.
>
> >
> > >
> > > >
> > > > if (vma->anon_vma) {
> > > >     vma_start_write_killable(src_vma);
> > > >     anon_vma_fork(dst_vma, src_vma);
> > > >     copy_page_range(dst_vma, src_vma);
> > > > }
> > >
> > > Yeah that's totally broken fo reasons above as I said :)
> > >
> > > >
> > > > But page fault can happen before write mmap_lock is taken, when we
> > > > check vma->anon_vma, it is possible it has not been set up yet. But=
 it
> > > > seems to be equivalent to page fault after fork and won't break the
> > > > semantic.
> > >
> > > It will totally break how the anon_vma hierarchy works :) See the lin=
ks at the
> > > top of https://ljs.io/talks for a link to various slides on anon_vma =
behaviour
> > > (it's really a pain to think about because it's a super broken abstra=
ction).
> > >
> > > You could end up with a CoW mapping that's unreachable from rmap and =
you could
> > > get some nasty issues with page table entries pointing at freed folio=
s :)
> >
> > Correction: actually we should be safe given mmap read lock on anon_vma=
 install.
> >
> > >
> > > >
> > > > Anyway, just a crazy idea, I may miss some corner cases.
> > >
> > > Yeah sorry to push back here but this is just not a viable approach.
>
> No worries. Thanks for all the feedback. Just tried to explore whether
> such an idea is feasible or not.
>
> > >
> > > And this is forgetting that we have relied on page faults being block=
ed by fork
> > > _forever_, who knows what else has baked in assumptions about that
> > > serialisation.
> > >
> > > Forking is one of the nastiest parts of mm and has had multiple, subt=
le, corner
> > > case breakages that have been a nightmare to deal with.
>
> Yes, this might be the biggest concern. The page fault can race with
> fork. If some applications rely on such subtle behavior, it may break,
> but such applications are fragile too.
>
> > >
> > > So I'm very much against changing this behaviour to try to fix someth=
ing in the
> > > fault path.
> > >
> > > We should address the fault path issues in the fault path :)
>
> Yeah, this idea was inspired by Barry's "not take vma read lock
> unconditionally" idea. Maybe irrelevant to Barry's priority inversion
> problem, just an idea for further optimization on page fault
> scalability. This probably should be a separate topic.
>
> Thanks,
> Yang
>
> >
> > Above still all true though.
> >
> > >
> > > >
> > > > Thanks,
> > > > Yang
> > > >
> > > > }
> > > >
> > > > >
> > > > > Based on the above, we may want to re-check whether fork()
> > > > > can be blocked by page faults. At the same time, if Suren,
> > > > > you, or anyone else has any comments, please feel free to
> > > > > share them.
> > > > >
> > > > > Best Regards
> > > > > Barry
> > > > >
> > >
> > > Cheers, Lorenzo
> >
> > So still a nope :)
> >
> > Cheers, Lorenzo
