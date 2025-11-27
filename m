Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF213043DA
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764275370; cv=none; b=YFuQDni9cYZckVACkNT3PtHn1Zh1djAKT0HnXivTQW8moB3DeHN2TCNjOnrvVxeOg+JXlzXmdO2joseaYYb1iNaa08RldxkR6UFgOja60DEh9SqI2/XWVCMuxOTsMhdANEcaJ9N55PW8GH+i+K2DEE/ssboSkeQncQTJt+8eVu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764275370; c=relaxed/simple;
	bh=6PZnzEVSmILv0n6Cfv6JbAHHBE4Y2JV+DHczBHGPSLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anBeLr8fwRiQ5B61b405ORhCoC+7F4ljTeew5tl5EVQZEf06zbjAblHsDutDzysk1Zkn7hYQfBV6QfY/4g4jNwoUjImQFHj6LsVZz95k6WIqnMSFQ00CitNhRhorwLb8ydyhVEuTlJz1AmtJwSixvSFDIJqlEnJdRMYPJo43UwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYS0W25I; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYS0W25I"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-880570bdef8so12066836d6.3
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275368; x=1764880168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=nYS0W25IKsyYg+v5HYirmjAOInr6Hy+hJD4w/ngPxk8a3vFgNLpM2fy/EwqkjJThVW
         ZghFikx+yPjHmdsYjp1oBEihzrVpP1KLFeMVEm6hLRRcQPGoEUi5k2zW1/ef+vBslmHA
         Q7rb154HLTD2lBO/we4LLOC10TCgGtTezHCpgrVBOUmFrx71qk1fyGiwX1yYNKF9kjrh
         1KOb139Lq3u1WjBK1PRp1RoKFscsuX711xCULk0icnVKhtzxmuNm+xxFKPBTEyNsLwVl
         q2iQSoxDDTypCVPvib9hpzLNaIvT61fGohh2VxrT4TsC11E8K5jNSBi8GaepA5UQeuBg
         wQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275368; x=1764880168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=oSU1hh/tNXx6qnAGOUP2pNYJ9NhWbozO5NJZjuKF1DfNHR6b3NMCEyHZtOjsV3TduU
         T21Px9dfr5RZW4XOIHzW1tkVLGaWyKyrBOa6NuTA8DDYFzKmKUo12rVW5TYHOGtprtp/
         6VK8/WyUryGDiTrsDKq+/AQqpXFEq9hSQ0ZJJjELWrifRf6R1T2h9LhEBfRIi5XiPkvH
         9CR473z+LI2EnjaO/LOFaZj//6ql/KBzBv6rPicYGwcG7LK02Snzus6c15SaM/S+NAyC
         viXO7UVCl2klLTklyAN9WAqr6tMPV4dZhqBhYzYMMraYWmjbI7GtYYt/sO/bFBAA28DT
         5ZQg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+s97B6pNV62f4Def9C76LMJWk2kK7KH7oxOt+e2L7zdJsJzrV5kawhAT4YalvWHqouqeLcu2css=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxly9zOELaor0dGN/X0Q3ov6IxH3rXFI4TkmOmLsUFb6gbojvGt
	RevCZNs7SpD6V2nKYsKqIhddQnXlJ4xrC8qTQ/qtrqzQrvKwJdAtZr3h3nfKZCT5U+gvv5HYzFm
	YxC+YYPMATDJ39hxyU6oPFr7R1uQ1JzI=
X-Gm-Gg: ASbGncu8FnGykp400/PZUj254+VzbEQSQx7it95qMEj0QJuBHiu/t7oYp8b6HOLFP1G
	2dPcDKQ1vMO4DI1ZkaJQg2qybk4hsl4Bh9BmM2JbP7akCiGikEwcwJIjMI1UiP25FaI/BZq8qq1
	CSZaiomFW4wHIfVdZgFFiaEGwsL8uoKEe93nAXxCSKAn1wZ+Tileh1Z2+RCAE59diAaOBIWfWi6
	ehwNcgtZFTxD+9LEuzY+Xi/BhM2iX+tOVkIBqDCNgG1tTBNGM0FBZdDrj19kfFw6ZctYw==
X-Google-Smtp-Source: AGHT+IG5GcGrOmVVsePre6BxCVhrhKY7NJnCRBVNCLt/HcgbymNTTZVjYmvrDTtjRkuAQ9GKsIJdwvx3BNDYrNQPC88=
X-Received: by 2002:a05:6214:234f:b0:880:486d:18dc with SMTP id
 6a1803df08f44-8863afb4d8fmr176925236d6.58.1764275367501; Thu, 27 Nov 2025
 12:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com> <aSip2mWX13sqPW_l@casper.infradead.org>
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:29:16 +0800
X-Gm-Features: AWmQ_bn_b-JGqeMVPQ751bNAv2Qsiauy9g_kN3cQ2gR4dkmeqYmOBAyRrjCf_ew
Message-ID: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> [dropping individuals, leaving only mailing lists.  please don't send
> this kind of thing to so many people in future]
>
> On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > lock was released only to wait for pagecache or swapcache to
> > > > become ready.
> > >
> > > Something I've been wondering about is removing all the "drop the MM
> > > locks while we wait for I/O" gunk.  It's a nice amount of code remove=
d:
> >
> > I think the point is that page fault handlers should avoid holding the =
VMA
> > lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> > writers and readers will be stuck for a while.
>
> There's a usecase some of us have been discussing off-list for a few
> weeks that our current strategy pessimises.  It's a process with
> thousands (maybe tens of thousands) of threads.  It has much more mapped
> files than it has memory that cgroups will allow it to use.  So on a
> page fault, we drop the vma lock, allocate a page of ram, kick off the
> read, sleep waiting for the folio to come uptodate, once it is return,
> expecting the page to still be there when we reenter filemap_fault.
> But it's under so much memory pressure that it's already been reclaimed
> by the time we get back to it.  So all the threads just batter the
> storage re-reading data.

Is this entirely the fault of re-entering the page fault? Under extreme
memory pressure, even if we map the pages, they can still be reclaimed
quickly?

>
> If we don't drop the vma lock, we can insert the pages in the page table
> and return, maybe getting some work done before this thread is
> descheduled.

If we need to protect the page from being reclaimed too early, the fix
should reside within LRU management, not in page fault handling.

Also, I gave an example where we may not drop the VMA lock if the folio is
already up to date. That likely corresponds to waiting for the PTE mapping =
to
complete.

>
> This use case also manages to get utterly hung-up trying to do reclaim
> today with the mmap_lock held.  SO it manifests somewhat similarly to
> your problem (everybody ends up blocked on mmap_lock) but it has a
> rather different root cause.
>
> > I agree there=E2=80=99s room for improvement, but merely removing the "=
drop the MM
> > locks while waiting for I/O" code is unlikely to improve performance.
>
> I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
> was written before the VMA locking code was written.  I don't know that
> it's actually helping these days.

I am concerned that other write paths may still need to modify the VMA, for
example during splitting. Tail latency has long been a significant issue fo=
r
Android users, and we have observed it even with folio_lock, which has much
finer granularity than the VMA lock.

>
> > The change would be much more complex, so I=E2=80=99d prefer to land th=
e current
> > patchset first. At least this way, we avoid falling back to mmap_lock a=
nd
> > causing contention or priority inversion, with minimal changes.
>
> Uh, this is an RFC patchset.  I'm giving you my comment, which is that I
> don't think this is the right direction to go in.  Any talk of "landing"
> these patches is extremely premature.

While I agree that there are other approaches worth exploring, I
remain entirely unconvinced that this patchset is the wrong
direction. With the current retry logic, it substantially reduces
mmap_lock acquisitions and represents a clear low-hanging fruit.

Also, I am not referring to landing the RFC itself, but to a subsequent for=
mal
patchset that retries using the per-VMA lock.

Thanks
Barry
