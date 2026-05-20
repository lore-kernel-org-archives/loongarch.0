Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546633263B
	for <loongarch@lists.linux.dev>; Wed, 20 May 2026 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256298; cv=pass; b=sC0pHKG/pwVfC/Zv/ooB/ghncoUGo6OnmSxlq1TfZxLTVilH6VthgSZxzW/rhR46K8oZWZms43o9yc06C7BS39POnMQ67ngNN0/ZbW1KJXXi115lPU7t15t1AQISP/B8iR5phDvErr4MXB/SulhGqU98tsf3Q+tAJ0Q3qCcQF30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256298; c=relaxed/simple;
	bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCfuZYf83QypCxSFUrUFx1uLThYG3Y81x06nmehecplZ38OzMRYN+YkxxHCQHRdrEoaRfTdRg1BXxaJW/Z/w3sIVZIkWdU3TZX3laAGgNlsgR3ROR1BVgsAyZ/aCIf8GcHkwmz+Or+qWWmDMvEYD+FVAuv7a2/hMkYW0BPo4KpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ngl/v/hi; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ngl/v/hi"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-515548f390fso8091cf.0
        for <loongarch@lists.linux.dev>; Tue, 19 May 2026 22:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779256296; cv=none;
        d=google.com; s=arc-20240605;
        b=PINJrZv1mZilA7eXezUp2K3JQOC8IT+b0H3oEdj0T8FdR3JcarjMkEbNqlceCWeveo
         fckVe/ex63njt+AJdqG9nIg+mOuUZe61GwuNba59QTDO4yxnCQN86j4MFGxbrabdTShY
         5brrjkYbdWnyhwMLpHilJbXzBYdxZTUH33K/L3Cc8vftg0ZiVhw3nNosgHS0EV2o0LxC
         i1HBhMZcsjX//cog8xxEhRH5vbnWforqqk8mwZBV/9W+/UkW0vptVslI0IYHTfKisLBU
         FLybNK2TrCN/9ZOjeeYfHP1JLxClUCrf6Uq0SJwmuUDIJhKNpDUKhiaHfav3FQnD+8db
         Xt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        fh=6TwehHfsnnGE1BJMphUevb0JylENHLDJ7mQaCQQWZDc=;
        b=f53xYHTNtXBIr3sNvn56+c5t1UVtS45yWkGcK9Q+Bs2aYhsaa8+i+yFjbh8yuPUR6A
         nqZD8f3paEwbazUJkP3gvH2iQln2WbnfAIQcaxMgDWfEEpFXpJHfzLgP6LM8ASQZQOta
         K2lXpZatNQoCp8Paw/81m+0FoOdiI/jXQ+0AdeiWaxWFoY8gE1j7db76mdd6DAcDNsgd
         Ku7OZ71nE1ljY/vL9nZJIwQLxEJ3ZwusVsxr5nsMeHobDvmoDqDJk4o9g372jPtGfY0/
         UuQzDFw6WPKdACLweMK28PVjLyqssNV0fckRXBjA/XctHxPZJqR7r9ZCb6q/DhMwtUFR
         PoJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779256296; x=1779861096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=Ngl/v/hiy4dT9vyx48Mvc03edSMTAQJ/mPReJATLzqYgslUAGzLvb1ssz6P/DsGf1c
         d00oF2FFMxP7981pnfHkLJEEHii6Gmehm7uTUOoMBeADfMLrQM2RlRRiBpPn60zIdgUJ
         GiPt96kvpkumIh1gCJKmmJ5GT/6W8YLXxrPaAAYhgX0nzVKgVxszCsJ08FTlPCSElNxq
         1hKzF4pcasOItl0pGd7FT9fPTdlIATKqqLT5JJbTFmOydAFCI3lesIrQUy+NF32YMyVs
         66q4ALT1KKjOL9zdxUxC5ezkQaHPCDzlsRBTfwH4yGzKy2Zf6JLO/H/nyzVHy8pPA/8y
         OS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256296; x=1779861096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt9LoBM9h0v+gvRnQ1bJjfV7wmkEM4+ijibPUWac/Iw=;
        b=E/Iw7hx6/xb3mAl6d9yKnCgJOvW2JHFsL2wbpatKP7lkxSs4HqpJ0fJJWsB6K2liE5
         bHr5pc2XZvgjPRUUvp/WwH24r/kfBxB60DYwJ/zvvmXah1C2tUKQzvxrwUQ7Fi2yhtca
         T89wGAfpmHJcFXrbmLSr/Mqi+vWJLLAU9qK3HnimH/zJIDyMG/A68gs8A3SkY1k/Vi8Q
         AxavU+Ylz/UFljYxcbeu7fzH/aN1Fz9xOdQuRlc0yu8w27Y/OsI3+fRhlzIhBDUus/jS
         oHUE7Fsas5u7saSdAO/l+dkQCyImyubK99WDIe+3U+lwYybjTYw2eGXtEQhhmFbmgKcJ
         3+ZA==
X-Forwarded-Encrypted: i=1; AFNElJ/dCYRMeSBeBdS+kkSAMP4OT/vfUdCG2OJ8STKH7jfu/ConfpJ93rtjrYpmi2lnod+kefZKPAlqkJw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7EL3PcO0p9vSrg+Uet/M+LXlwVHCLWfLvLle9JSRVYrBnbkPG
	dJGWxgzbudKrN4+J3rFfb2r8H3CeBX4ypv3zSkkvN5kTZf1NIBNUmnPNRbZpvwv5rkY9jmUVWAe
	PZV81l7xb1XNhkuIuuvPNzyT4wYfs31TAnpcGw3De
X-Gm-Gg: Acq92OFwSp0JWC5PQrS7AEDVzixm44UPCHtg2tqw+4p2hG5A0kmsCeVDDrNeH0/ND35
	gaRV5uYJ2uSpVE0QbbwkSY5DX9NAc/LPNXFh46uIdGtFDmEOS9CEkNjKuHIZYIJ9M9rQf71zztx
	UdhxJtFx5EBo0tOOvnHp4G0657cn9MPba5jQUHU1bTlBVCwNTInaC+/ROpKDOr8I9zsgK9Og2Lg
	2oTRj7LouveutAiAFG58vu8WcBEg3KJ5Kg8OXU7jgTVnsnQ4Ngeq8CojZ/Np24FGc6qM3owCaXL
	vSezNqhVZrq9ixnTF5x7Zq/WjrKy8o0geB4NHR2Ih0IhrA==
X-Received: by 2002:a05:622a:1920:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-51679461795mr15633081cf.12.1779256295164; Tue, 19 May 2026
 22:51:35 -0700 (PDT)
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
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com> <agxbq1TxJdniMQT3@lucifer>
In-Reply-To: <agxbq1TxJdniMQT3@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 May 2026 05:51:23 +0000
X-Gm-Features: AVHnY4KMccW5pUeVLxDyTF9Gnh50gzRE3EOZpgiKFqqXipSU5KPE9rQdYzJrFBQ
Message-ID: <CAJuCfpG2Zmpf5N_ejB6ZDv8LDjpVtTfA_tYQ6sW+Noc9Y+XhdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
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

On Tue, May 19, 2026 at 12:53=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> w=
rote:
>
> On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:
>
> > >
> > > I think we either need to fix `fork()`, or keep the current
> > > behavior of dropping the VMA lock before performing I/O.
> >
> > I see. So, this problem arises from the fact that we are changing the
> > pagefaults requiring I/O operation to hold VMA lock...
> > And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> > is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> > anonymous and COW VMAs only while holding mmap_write_lock, preventing
> > any VMA modification. On the surface, that looks ok to me but I might
> > be missing some corner cases. If nobody sees any obvious issues, I
> > think it's worth a try.
>
> Not sure if you noticed but I did raise concerns ;)

Sorry, I didn't realize your first comment was a conceptual objection
to this approach of allowing page faults to race with the fork.


>
> I wonder if you've confused the fault path and fork here, as I think Barr=
y has
> been a little unclear on that.
>
> What's being suggested in this thread is to fundamentally change fork beh=
aviour
> so it's different from the entire history of the kernel (or - presumably =
- at
> least recent history :) and permit concurrent page faults to occur on a f=
orking
> process.
>
> I absolutely object to this for being pretty crazy. I mean I'm not sure w=
e
> really want to be simultaneously modifying page tables while invoking
> copy_page_range()? No?
>
> OK you cover anon and MAP_PRIVATE file-backed but hang on there's
> VM_COPY_ON_FORK too.. so PFN mapped, mixed map and (the accursed) UFFD W/=
P as
> well as possibly-guard region containing VMAs now can have page tables ra=
ced.

Ugh, yeah, I realize now this is a minefield. Resolving all possible
races there would not be trivial and might introduce other performance
issues.

>
> That's not to mention anything else that relies on serialisation here (th=
is
> would be changing how forking has been done in general) that we may or ma=
y not
> know about.
>
> The risk level is high, for what amounts to a hack to work around the fau=
lt
> issue.
>
> I suggest that if we have a problem with the fault path, let's look at th=
e fault
> path :)
>
> So yeah I'm very opposed to this unless I'm somehow horribly mistaken her=
e or a
> very convincing argument is made.

So, current approach of dropping locks during I/O sounds like still
the best solution.

>
>
> >
> >
> >
> >
> > >
> > > >
> > > > I'd also like to get Suren's input, however.
> > >
> > > Yes. of course.
> > >
> > > >
> > > > Thanks, Lorenzo
> > >
> > > Best Regards
> > > Barry
>
> Cheers, Lorenzo
