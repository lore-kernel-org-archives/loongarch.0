Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273938F927
	for <loongarch@lists.linux.dev>; Mon, 18 May 2026 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134234; cv=pass; b=DTAGzoMU/9dDkjVVSQMcLQ4OpjRTvCB5f691x6wyBZUqceyYMme2Bt8H/evgGVRTOn3u1wzFzFy+XmnMg6hKpSaeeCCnjf4vjpHlcD1khKlvTc9zr6oCajiFlIhjxUg9+s8t0jveP9PUQQ2C7WKWVd7mam6vljRg6/2/ftej5WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134234; c=relaxed/simple;
	bh=//QAKU+P5LEJzESU7YlPORnYyIrpM6kedKaurl1UptU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXhHjmga/aX9Nd2mFRNSV9Z+4rjvVOQPSjKHfEtclo6cUTQT4/DSjnDT2zLCjo3BV2DySzhltxoth1t5msgfxq7n7syMv3g7TF3MIEUNDhKv7oFNI5SvfE5Jh0t5YIg9s8zk+e0Gv5A/nuwPWNPB5+qWlwzzzGsQ9jxO4vt3l0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNfau9fk; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNfau9fk"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e61648f10so5811cf.1
        for <loongarch@lists.linux.dev>; Mon, 18 May 2026 12:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779134232; cv=none;
        d=google.com; s=arc-20240605;
        b=CZCxTrx0mV2Bm0ukgxQO5vW7Jjx/019SK9nKsxF4B3cUPzL+OuSg/l0vKi8JIRhhmR
         mLBoJzxoL+iWh8SchyeoFrcSXMBH8i1z85GDHv7sbdyO0GZQQx/kdWdCw301QHJEAOVk
         L3JeVZaqDpFnOl7cmEcgJLBLDT4c5nTayjb7v8SgAqFwOmQ6uY1aVcWvR0OASE6NFQiI
         P06CSPwvNouyYMIYa9D3317GjPdRQHD1DGOlNkRI+yrkvL3TQUq+/RFNqxJzdCiWCyn5
         WN/YJhgqBPvxy6l12RWq6BDIJi5ZHlKrHQRhXj1jRWtPeeeRLK8jfG6KlNwKn7XQ8NnF
         RIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        fh=GCk8VxFhcseZY+qH8JQbPNaEG4SAtdhqqGPRAh21tnQ=;
        b=B+rhyYPLnhB4NaWL/XSHF2REkfDBZTOBzj8d3a4S7Ty9Sm7xkXE1aJDKRf4SIWeFC9
         H14THgXrw7knkQRf27sG2vFH0LSRX5/LGz0xB0iQpDGS6HXrVlzvaFg2/yC85OViH9ek
         cY7GVgPO5kWj9HjJgvbGRTfsDdmwxDhBwtus8oOG5IL1qFj5ifzGQGik4vhu9d8nExPF
         7u9H9SQ13PEX7kIWmws2ZMcfs4vDJB9BXlESGR/Nb3jCkyTZlbgYRZyUAQE/YmH/I0rA
         kboAFoxWMqdzMl6VVx0KbZBIFrIF/Qp7zKUpExuioWjsP03Qqivv5st3hN3eFfMwQKYF
         z99g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779134232; x=1779739032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=uNfau9fkofGSx8o84sQtyDgCCzBBGx8E6gUbZswp9KtK6gSEsXhzwfGBXC4hjkv2cL
         OEA3zxxoMgUqlAdAJIhbb+GjOIoJSOadbRaoUfNpXX/FX607ZzuL9P5aLg4lALexLkVR
         Oxo6ZTbZytuIqRmVgwJvcD3RhmEqyvV8B3cVyKrETGjTfAA31PlyuWiyw+2OuykyfVXs
         KRFYzPn5h2lknXPRISGDLRUwZACjEoJ7wtLq0d3e6tNBWx4+d37FF2ggKcZg4X/PVuLe
         i17ko1Zrwr46YWwdRH1twtcjWQAYK8YBD9pZuNYKzkz9IjEO4X3sbsYm3FCJ8F8ECxvz
         DQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134232; x=1779739032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/+TIJ7IgUqjV0Bv46HdaV7jQIvLaf/1u3zzskYDkTs=;
        b=JBGvU6zfucVz+RMXziH/ZnYs1AkCK0zDzRQBB9JUZVFyj6dGuFFpHGrNR1zlrT5DEq
         rKqGzV6k24vzD4LQSATS4npW4oojzHvQsv06li39it+mIDE85Cw7Ii6lSNzITLO4+4Rx
         xCcqZcM4GecQUwJaBKegcUsCplZhmUGvkmoVOfBUuzaBQhK/x6OVnpROCQuu7bSCXii3
         h+hN7tqtvF73rWcVhg/6lWxbEEKEEhiLpbtPKNrr0JQlk4TOPWXnC9C8c1sJN91XS/ld
         y5+GHU0g5eU6NsnuWCvP71+Jj4nrKNzAjtOaZ+POoFaRVZMz9vkCHHvkUjWY6XYdePHQ
         FMPw==
X-Forwarded-Encrypted: i=1; AFNElJ9WuPSLesk+Kl9UXVch0Obj1FxS608dJdPa2gH7vqEFBtHZOmg7RtOEov68RfmWUS7DfLiAH46kGzw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvQ57Fx9kL6b9eGXT2WaYfQlxtgPJb+7VfLzFHkAaqcAy5U99o
	ClhyPbWIo/zb0eJYahc4wk9j6hyi6pVusE1ocxkf+3Qk9ILXsHw6AYXqR/XWYzV1LqgInoNn0j7
	5GXezekSX6WcAEKRM9ta/zckSEZQHFVUwSxIoNJnR
X-Gm-Gg: Acq92OFvSGN93TCklA3RMtL3c1xIiZXllGRLm6ENcMzQSz/ObgFTQ5WXvC6zNPk6ClY
	8HUarTE0V2DJ1zZM9PZQwX8gQWztIED+pVG2rln7F0WwOtaK5D6/2V1OFDEGe7QLzT5W4ODSLoL
	RYOfL21oud97dn+FCOaSnsYUHxzAIms3VNU6H1tWNfMSt3NpUp+B6eI/WyvyuwvYBVcaCzUzYT7
	xynxz1yis2+D6oXemXcMGAT9uXbNyOmRCX8DQFML2X6J8KFG2sRU8b+1ZTh/tw8GYjMsmS6hvCl
	3ea1IKIaQ6SYfifU
X-Received: by 2002:ac8:5907:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51679440a95mr20949301cf.16.1779134231137; Mon, 18 May 2026
 12:57:11 -0700 (PDT)
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
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
In-Reply-To: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 18 May 2026 12:56:59 -0700
X-Gm-Features: AVHnY4LKURvCbX_IJPUmfCTmwYP6SL9RXK1r_86Qf4VKBQdD4r83VbCvOh5ZGPk
Message-ID: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 4:26=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Mon, May 18, 2026 at 5:47=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> =
wrote:
> >
> > On Sun, May 17, 2026 at 04:45:15PM +0800, Barry Song wrote:
> > > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > > >
> > > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@inf=
radead.org> wrote:
> > > > > >
> > > > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > > > 1. There is no deterministic latency for I/O completion. It d=
epends on
> > > > > > > both the hardware and the software stack (bio/request queues =
and the
> > > > > > > block scheduler). Sometimes the latency is short; at other ti=
mes it can
> > > > > > > be quite long. In such cases, a high-priority thread performi=
ng operations
> > > > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be for=
ced to wait
> > > > > > > for an unpredictable amount of time.
> > > > > >
> > > > > > But does that actually happen?  I find it hard to believe that =
thread A
> > > > > > unmaps a VMA while thread B is in the middle of taking a page f=
ault in
> > > > > > that same VMA.  mprotect() and madvise() are more likely to hap=
pen, but
> > > > > > it still seems really unlikely to me.
> > > > >
> > > > > It doesn=E2=80=99t have to involve unmapping or applying mprotect=
 to
> > > > > the entire VMA=E2=80=94just a portion of it is sufficient.
> > > >
> > > > Yes, but that still fails to answer "does this actually happen".  H=
ow much
> > > > performance is all this complexity in the page fault handler buying=
 us?
> > > > If you don't answer this question, I'm just going to go in and rip =
it
> > > > all out.
> > > >
> > >
> > > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > > waiting for answers),
> > >
> > > As promised during LSF/MM/BPF, we conducted thorough
> > > testing on Android phones to determine whether performing
> > > I/O in `filemap_fault()` can block `vma_start_write()`.
> > > I wanted to give a quick update on this question.
> > >
> > > Nanzhe at Xiaomi created tracing scripts and ran various
> > > applications on Android devices with I/O performed under
> > > the VMA lock in `filemap_fault()`. We found that:
> > >
> > > 1. There are very few cases where unmap() is blocked by
> > >    page faults. I assume this is due to buggy user code
> > >    or poor synchronization between reads and unmap().
> > > So I assume it is not a problem.
> > >
> > > 2. We observed many cases where `vma_start_write()`
> > >    is blocked by page-fault I/O in some applications.
> > >    The blocking occurs in the `dup_mmap()` path during
> > >    fork().
> > >
> > > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > > the parent process when forking"), we now always hold
> > > `vma_write_lock()` for each VMA. Note that the
> > > `mmap_lock` write lock is also held, which could lead to
> > > chained waiting if page-fault I/O is performed without
> > > releasing the VMA lock.
> >
> > Hm but did you observe this 'chained waiting'? And what were the latenc=
ies?
>
> We have clearly observed that the `fork()` operations of many
> popular Android apps, such as iQiyi, Baidu Tieba, and 10086,
> end up waiting on page-fault (PF) I/O when the VMA lock is
> held during I/O operations. This has already become a
> practical issue. I also believe this can lead to chained
> waiting, since the global `mmap_lock` blocks all threads that
> need to acquire it.
>
>
> >
> > >
> > > My gut feeling is that Suren's commit may be overshooting,
> > > so my rough idea is that we might want to do something like
> > > the following (we haven't tested it yet and it might be
> > > wrong):
> >
> > Yeah I'm really not sure about that.
> >
> > Prior to the VMA locks, the mmap write lock would have guaranteed no co=
ncurrent
> > page faults, which is really what fb49c455323ff is about.
> >
> > So Suren's patch was essentially restoring the _existing_ forking behav=
iour, and
> > now you're saying 'let's change the forking behaviour that's been like =
that for
> > forever'.
>
>
> I am afraid not. Before we introduced the per-VMA lock, we
> were not performing I/O while holding `mmap_lock`. A page fault
> that needed I/O would drop the `mmap_lock` read lock and allow
> `fork()` to proceed.
>
> Now, you are suggesting performing I/O while holding the VMA
> lock, which changes the requirements and introduces this
> problem.
>
> >
> > I think you would _really_ have to be sure that's safe. And forking is =
a very
> > dangerous time in terms of complexity and sensitivity and 'weird stuff'
> > happening so I'd tread _very_ carefully here.
>
> Yep. I think my original proposal did not require any changes
> to `fork()`, since it simply preserved the current behavior of
> dropping the VMA lock before performing I/O. In that model,
> `fork()` would not end up waiting on I/O at all.
>
> What you are suggesting now appears to be performing I/O while
> holding the VMA lock, which in turn introduces the need to
> change `fork()`.
>
> >
> > >
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 2311ae7c2ff4..5ddaf297f31a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_struct
> > > *mm, struct mm_struct *oldmm)
> > >         for_each_vma(vmi, mpnt) {
> > >                 struct file *file;
> > >
> > > -               retval =3D vma_start_write_killable(mpnt);
> > > +               /*
> > > +                * For anonymous or writable private VMAs, prevent
> > > +                * concurrent CoW faults.
> > > +                */
> >
> > To nit pick I think the comment's confusing but also tells you you don'=
t need to
> > specific anon check - writable private is sufficient. And it's not real=
ly just
> > CoW that's the issue, it's anon_vma population _at all_ as well as CoW.
> >
> > > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED) =
&&
> > > +                                       (mpnt->vm_flags & VM_WRITE)))
> > > +                       retval =3D vma_start_write_killable(mpnt);
> >
> > I think this has to be VM_MAYWRITE, because somebody could otherwise mp=
rotect()
> > it R/W.
> >
> > I also don't understand why !mpnt->vm_file for a read-only anon mapping=
 (more
> > likely PROT_NONE) is here, just do the second check?
> >
> > (Also please use the new interface, so !vma_test(mpnt, VMA_SHARED_BIT) =
&&
> > vma_test(mpnt, VMA_MAYWRITE_BIT))
>
> Yep, I can definitely refine the check further. But before
> doing that, I'd first like to confirm that we are aligned on
> the direction.
>
> If you still intend to hold the VMA lock while performing I/O,
> then I think we should fix `fork()` to avoid taking
> `vma_start_write()`.
>
> >
> > >                 if (retval < 0)
> > >                         goto loop_out;
> > >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> > >
> > > Based on the above, we may want to re-check whether fork()
> > > can be blocked by page faults. At the same time, if Suren,
> > > you, or anyone else has any comments, please feel free to
> > > share them.
> > >
> > > Best Regards
> > > Barry
> >
> > Technical commentary above is sort of 'just cos' :) because I really qu=
estion
> > doing this honestly.
>
> I think we either need to fix `fork()`, or keep the current
> behavior of dropping the VMA lock before performing I/O.

I see. So, this problem arises from the fact that we are changing the
pagefaults requiring I/O operation to hold VMA lock...
And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
anonymous and COW VMAs only while holding mmap_write_lock, preventing
any VMA modification. On the surface, that looks ok to me but I might
be missing some corner cases. If nobody sees any obvious issues, I
think it's worth a try.




>
> >
> > I'd also like to get Suren's input, however.
>
> Yes. of course.
>
> >
> > Thanks, Lorenzo
>
> Best Regards
> Barry
