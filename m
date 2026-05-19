Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B30391842
	for <loongarch@lists.linux.dev>; Tue, 19 May 2026 20:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223997; cv=pass; b=QR2Rr1YCxo5lEeWMDKzp7jC6Lz+prbxBsb+usINKp+9idVpQh1X/AxIGcFKfa2nCKDAXGTYjkdzWSQMgAI8GUS9Gn+yPJWw1q8HZuTg+j3q7xf1TP5sb9q626Z/uFkUNUjOZC7c+GYZ2TO7IP6qrSbL73dBcHBZdXyvtiW0r3DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223997; c=relaxed/simple;
	bh=Xti6w1fFLSrp3hpFJbLrU3tBigKjJTy7h0r4uGouDhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkRuLfA9Hh3z1b5V+VnrCQxeicjyOnlU7X2+WvgV1kpHDq7ALix7DZB5dgBLQXO6Q3JAH9XWBHx4c+mXfxpqittILyLZbX7hgNzVM1OHts/PUXVgCxQKBwOYtq6Udxa9jpjhaBTlWqtgPqwr1/QetMZSi9d1QpyWXIaEFLhOEOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSUd0dly; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSUd0dly"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso7216511a12.3
        for <loongarch@lists.linux.dev>; Tue, 19 May 2026 13:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779223995; cv=none;
        d=google.com; s=arc-20240605;
        b=CsG3CAaV6h4SuEMbs6WxCRopBABJjVWqozbkknjMaORdAYvqSWw26Ev/4/SqYH6VM5
         siJWKWMYp9yb7bkhE5ASu/2s3A/EoZueh9I8vU6G0J+5Ij1yx7gCEeZJjnud/hiUAOox
         OkvA7b0y6+iSp2UqspQR06PLqI8HPDMWl6CMw3Jusd147sA4Wt3fqD96+N7HcPO035nK
         SK5fMVxTKH+VpoxOHT87d/DCPzILu/VRCb7CzMqq3bE1Jar+Ci4QHLEEfRvqwGjUkWfR
         i52n+61X1TgtcHODZbaxzL0TPW3K+mTlvJRUCxKN3sPtO3nbWT/mXDntdh+kcwneQIbq
         XYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        fh=DJxLn8HuARX0ga4+UonUWUKXkgHGO7LNvXipJ9D25eI=;
        b=hY+Mvvoq7LsV5eN+47QhSXm4hCekum5TWKZ0XFnls6Ul6u6bQuSzfU6uu/JkbJXOmL
         5TsYp+5GO02OdIb0ZPS52OGcQGoV0V2ps/wzZAO+Uvg0rLpWCIlL32TltSDEMC9/Av39
         VmhWMQ5lNAehMOrbalFuuOvWYZODNzkRDyUW3yBj38+dl29Zv0CZJaJnZBeI9iV1DS+Z
         stduu/vzlUDYE2OFKx/1CerOUsqCkw8Gft8QMNU11szd3x64cyRAPYEw1QqUMy+jO8xM
         C/EjkTJKnnJg2hdQrBV9C9eexVr/FDA3kdQtvb9fz1MpHdwBRLkvhN7Py6dQIRrx6zOy
         tgGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223995; x=1779828795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=HSUd0dly7CYRg99rPtd2yF/x0XZJgFXZdvCOA0Xj3elHgNng8FGyWG0cqXNR5xK7iX
         GjEU7mFZbxzC9uUFr9edd0IibvxmRdawHm89ZKn2vNvTZHRA0QBql3fV4A5Mdm+D5sKe
         0bPgt3ksW9hSQvUaOJ9IXdaLtWjesNDk7fW8ewJ6UPSefqB49YtYvByoq/OS5Ltnn2fG
         mHkhXquocJmV306QM4F/KPlkPobHiWlRUL3Mai5npu2tJTxFIX0PbCYNOyUS1SVGegFh
         2jyUs7x/eDzig+Vx2XMjxNSvSiyLRptodP6oSRlyMEffL3tPuW0rP2LB3OV8M46aHc3E
         nziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223995; x=1779828795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ae+dijTOTo/8e3HvGN3FEZCQc/7H0q/1pnPZoGZAADo=;
        b=gKB8djpkwrQmL1t9DoaZ5TXqW8qomA3fWWXLSqHkAFtB22Wzdo/pPwbt3Hu+tQQcwU
         1NvHa9uZtvXgiR5Wz5ptZv3YOm/6E51kPF6WX9fq7R5LK1cijEueb1Mgy1+IzUFUqjSg
         CmCzFOvcYNhdVFPfFqmolvM2FYaRBMwIUpCuRgKdYbPqhaksGJZm9cadMtRsBnLMhCKW
         bONdvkmIebtCZedXVCTnBBphdC7bFsOP0RM5tFxUojFHFGQE0fd/hEeU1UFlSGS3R2Br
         6lSrQGApca3aiM/e9Cfaque/KdxXI1O2jCnz+iwc0F16+fPgkzIIIDlZ8xqz9GsYi96M
         6KQw==
X-Forwarded-Encrypted: i=1; AFNElJ/DcQW/k70flIj1f+zKsygb1LcTQKWs+Nz2SgT2t61u3EWVVPOaNKsljN5TeZQ72cHa1BV9KvovCFY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0RW7ZZa9ftqdrKBmP94bdd7V54dj68HaFz++7qM67jnDVTo5l
	6bJ+Sc5ic4Czz7cUKfhKR2ys/yOjn6/rDIQMlOeeT3wD5pmYSEaZ1svSaljoSNsZOJD0+9oOdxn
	z8pp7ZwjsjW63s9IDR/3dD/7BNJ41t9k=
X-Gm-Gg: Acq92OG8rUmUc0RT+tz+GDTOGJFwY/B/XtysmZZGmNamXE5y0GiXke0ROnxz1Yz0+5K
	kJUrbl0et9bb5GxFEa03nRD8Ysj4HKC8VdVkYvwZt1ems3RlbYpRT+C3HTjmJqsG26sOL5yf1hq
	YDGxlHpzT/i2P+gs3/Jgur3/cBBa9F9g2rTxC75OgnwmrsSoVl6NRFTEO/exzNkBod1eY/Wu10o
	iqksipcvUBU3l4zurI2dRq5nRf6wbJQYGQXCyZGIgnn9NSrkXVRw4azMGrxftW4i5lCmVikmutR
	rHRuWz89mg==
X-Received: by 2002:a05:6402:24ce:b0:683:1cc8:84b5 with SMTP id
 4fb4d7f45d1cf-683bc1b7472mr10554792a12.4.1779223994390; Tue, 19 May 2026
 13:53:14 -0700 (PDT)
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
 <CAGsJ_4w_-Y8qNLDeLX9OWpLpK01YG2bF-N6_mGypgsauvfCvkA@mail.gmail.com> <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
In-Reply-To: <CAHbLzkpbQ4Ca0xC74BJ6iJUVKdpH90qE+E=g7HkDXvcNH1+8+w@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 13:53:03 -0700
X-Gm-Features: AVHnY4IimOZqeIRblNaSy2KsMS8vB_GzCmlGYie_zXnP_ZtHrsCb1dPTmYJGNBE
Message-ID: <CAHbLzkp7WcXA6Zey2QjBDrcs1w2hP4dhBoda2G3XF+Q0h_hwsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, surenb@google.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, 
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:50=E2=80=AFAM Yang Shi <shy828301@gmail.com> wro=
te:
>
> On Tue, May 19, 2026 at 4:07=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > On Tue, May 19, 2026 at 5:21=E2=80=AFAM Yang Shi <shy828301@gmail.com> =
wrote:
> > >
> > > On Sun, May 17, 2026 at 1:45=E2=80=AFAM Barry Song <baohua@kernel.org=
> wrote:
> > > >
> > > > On Sat, May 2, 2026 at 1:58=E2=80=AFAM Matthew Wilcox <willy@infrad=
ead.org> wrote:
> > > > >
> > > > > On Sat, May 02, 2026 at 01:44:34AM +0800, Barry Song wrote:
> > > > > > On Fri, May 1, 2026 at 10:57=E2=80=AFPM Matthew Wilcox <willy@i=
nfradead.org> wrote:
> > > > > > >
> > > > > > > On Fri, May 01, 2026 at 06:49:58AM +0800, Barry Song wrote:
> > > > > > > > 1. There is no deterministic latency for I/O completion. It=
 depends on
> > > > > > > > both the hardware and the software stack (bio/request queue=
s and the
> > > > > > > > block scheduler). Sometimes the latency is short; at other =
times it can
> > > > > > > > be quite long. In such cases, a high-priority thread perfor=
ming operations
> > > > > > > > such as mprotect, unmap, prctl_set_vma, or madvise may be f=
orced to wait
> > > > > > > > for an unpredictable amount of time.
> > > > > > >
> > > > > > > But does that actually happen?  I find it hard to believe tha=
t thread A
> > > > > > > unmaps a VMA while thread B is in the middle of taking a page=
 fault in
> > > > > > > that same VMA.  mprotect() and madvise() are more likely to h=
appen, but
> > > > > > > it still seems really unlikely to me.
> > > > > >
> > > > > > It doesn=E2=80=99t have to involve unmapping or applying mprote=
ct to
> > > > > > the entire VMA=E2=80=94just a portion of it is sufficient.
> > > > >
> > > > > Yes, but that still fails to answer "does this actually happen". =
 How much
> > > > > performance is all this complexity in the page fault handler buyi=
ng us?
> > > > > If you don't answer this question, I'm just going to go in and ri=
p it
> > > > > all out.
> > > > >
> > > >
> > > > Hi Matthew (and Lorenzo, Jan, and anyone else who may be
> > > > waiting for answers),
> > > >
> > > > As promised during LSF/MM/BPF, we conducted thorough
> > > > testing on Android phones to determine whether performing
> > > > I/O in `filemap_fault()` can block `vma_start_write()`.
> > > > I wanted to give a quick update on this question.
> > > >
> > > > Nanzhe at Xiaomi created tracing scripts and ran various
> > > > applications on Android devices with I/O performed under
> > > > the VMA lock in `filemap_fault()`. We found that:
> > > >
> > > > 1. There are very few cases where unmap() is blocked by
> > > >    page faults. I assume this is due to buggy user code
> > > >    or poor synchronization between reads and unmap().
> > > > So I assume it is not a problem.
> > > >
> > > > 2. We observed many cases where `vma_start_write()`
> > > >    is blocked by page-fault I/O in some applications.
> > > >    The blocking occurs in the `dup_mmap()` path during
> > > >    fork().
> > > >
> > > > With Suren's commit fb49c455323ff ("fork: lock VMAs of
> > > > the parent process when forking"), we now always hold
> > > > `vma_write_lock()` for each VMA. Note that the
> > > > `mmap_lock` write lock is also held, which could lead to
> > > > chained waiting if page-fault I/O is performed without
> > > > releasing the VMA lock.
> > > >
> > > > My gut feeling is that Suren's commit may be overshooting,
> > > > so my rough idea is that we might want to do something like
> > > > the following (we haven't tested it yet and it might be
> > > > wrong):
> > > >
> > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > index 2311ae7c2ff4..5ddaf297f31a 100644
> > > > --- a/mm/mmap.c
> > > > +++ b/mm/mmap.c
> > > > @@ -1762,7 +1762,13 @@ __latent_entropy int dup_mmap(struct mm_stru=
ct
> > > > *mm, struct mm_struct *oldmm)
> > > >         for_each_vma(vmi, mpnt) {
> > > >                 struct file *file;
> > > >
> > > > -               retval =3D vma_start_write_killable(mpnt);
> > > > +               /*
> > > > +                * For anonymous or writable private VMAs, prevent
> > > > +                * concurrent CoW faults.
> > > > +                */
> > > > +               if (!mpnt->vm_file || (!(mpnt->vm_flags & VM_SHARED=
) &&
> > > > +                                       (mpnt->vm_flags & VM_WRITE)=
))
> > > > +                       retval =3D vma_start_write_killable(mpnt);
> > > >                 if (retval < 0)
> > > >                         goto loop_out;
> > > >                 if (mpnt->vm_flags & VM_DONTCOPY) {
> > >
> > > Maybe a little bit off topic. This is an interesting idea. It seems
> > > possible we don't have to take vma write lock unconditionally. IIUC
> > > the write lock is mainly used to serialize against page fault and
> > > madvise, right? I got a crazy idea off the top of my head. We may be
> > > able to just take vma write lock iff vma->anon_vma is not NULL.
> > >
> > > First of all, write mmap_lock is held, so the vma can't go or be
> > > changed under us.
> > >
> > > Secondly, if vma->anon_vma is NULL, it basically means either no page
> > > fault happened or no cow happened, so there is no page table to copy,
> > > this is also what copy_page_range() does currently. So we can shrink
> > > the critical section to:
> > >
> > > if (vma->anon_vma) {
> > >     vma_start_write_killable(src_vma);
> > >     anon_vma_fork(dst_vma, src_vma);
> > >     copy_page_range(dst_vma, src_vma);
> > > }
> > >
> > > But page fault can happen before write mmap_lock is taken, when we
> > > check vma->anon_vma, it is possible it has not been set up yet. But i=
t
> > > seems to be equivalent to page fault after fork and won't break the
> > > semantic.
> >
> > Re-reading Suren's commit log for fb49c455323ff8
> > ("fork: lock VMAs of the parent process when forking"),
> > it seems that vm_start_write() is used to protect
> > against a race where anon_vma changes from NULL to
> > non-NULL during fork. In that scenario, we hold the
> > mmap_lock write lock, but not vma_start_write(), so a
> > concurrent anon_vma_prepare() could still install an
> > anon_vma.
> >
> > "    A concurrent page fault on a page newly marked read-only by the pa=
ge
> >     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on th=
e
> >     source vma, defeating the anon_vma_clone() that wasn't done because=
 the
> >     parent vma originally didn't have an anon_vma, but we now might end=
 up
> >     copying a pte entry for a page that has one.
> > "
> >
> > If that is the case, then your change does not work.
> >
> > Nowadays, nobody calls anon_vma_prepare(vma) directly.
> > Instead, vmf_anon_prepare() is used, and we always
> > require the mmap_lock read lock before calling
> > __anon_vma_prepare(). As a result, anon_vma cannot
> > transition from NULL to non-NULL during fork.
> >
> > So the original race condition has effectively
> > disappeared.
>
> anon_vma_prepare() has some usecases too, but it seems like it
> requires taking read mmap_lock too if I read the code correctly.
>
> >
> > You also mentioned the madvise() case. If I understand
> > correctly, madvise() should take mmap_lock before
> > modifying anon_vma. Only some parts of madvise() can
> > support per-VMA locking. Therefore, we probably do not
> > need:
> >
> > if (vma->anon_vma) {
> > vma_start_write_killable(src_vma);
> > ...
> > }
>
> I think we still need write vma lock to serialize anon_vma fork
> otherwise we may see:
>
>         CPU 0                                                 CPU 1
> fork                                                       page fault
>    src vma has no anon_vma
>        skip vma fork
>
> allocate anon_vma for src vma
> vma_needs_copy() sees anon_vma
> copy page
>
> Then we may end up being no anon_vma for dst vma, but with pages mapped i=
n it.

Sorry, this should not happen because creating anon_vma in page fault
needs to take mmap_lock.

Thanks,
Yang

>
> Thanks,
> Yang
>
> >
> > >
> > > Anyway, just a crazy idea, I may miss some corner cases.
> >
> > To me, it seems that we could remove vma_start_write()
> > entirely now. Or is that an even crazier idea?
>
>
> >
> > Thanks
> > Barry
