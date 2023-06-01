Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66822626
	for <loongarch@lists.linux.dev>; Thu,  1 Jun 2023 20:43:32 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565a63087e9so13253247b3.2
        for <loongarch@lists.linux.dev>; Thu, 01 Jun 2023 13:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=qLgbJbj5g8WGk9vr+h5GU3VAGYoZuUQfYy+Jk03a6BWdaBQStekzq99EEhSRb/apVE
         r1wG5klq4xTuvlp4fzfvGwGvXsPOH5Z+EGzZ3xDm5VuokYBfnX2Z7EeXpvrNqoMOmFfA
         JBLO6CGLz8pEI44d71tWawLxUIyiVrcZLnzOInnX4NDx0adjPFt4WqdjoFpvwTeJeP42
         YdR8VtfFc5+TjUwWFHzsShyWmg/NGqDFZTc1nDT9EKaeGOrhYp9pTMhkn6c++xEXcw0Z
         7/JenW6z+3FLVb69Ur5a6g5NHDXYEBFsl6KltuWvHl5pgiI7Ar5zj9KICtB4zwOfTiPP
         PMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=cc+lydbAgYQ4lTLgXiKQcp6r7fK/cOEF3q/KplkjZURwIIjNKupDqgYJabTpObYj+6
         HxBHVCA1VPoVwSfT6ecNZZUNcmQWKnNiKDzCqB+vMN6ojH8j3e7wrOpj+wrzYZNZmJfD
         QHcXaFunZnmsHo+f+nusu6vB4aFM3rTq36T2NIU2IaMraYWi9cUC8Jebk4ti14R054AR
         SnMnJ2a+V8cYJA7fpYpqtHDy9ltItEJkniAKzbmrPbOjfWmoUNF4xZT2QcoSSdy/0bpN
         9EaS4kb6twrH5FXCmUSBJZa4uhVz+dbNA2ImT/wgIKpIFTLLj4c2T3P1oEA0DliwmaiG
         l6tg==
X-Gm-Message-State: AC+VfDwk69JY1gqQ1YG26pC4iUDVRKyDNTxJYnJ5AxWNXkkczJjwCMlk
	NOwWpbGSOEu1egUgGl1WMETqzU/ZQbgizIQdOyo=
X-Google-Smtp-Source: ACHHUZ5DfuhGus+PqmBDfDw3I8CUwiopOPmtEZnOXp6mFa4otjE0OnORW5aklQp2qVjtyKAx2ImFFxSDC1ok71Q6xew=
X-Received: by 2002:a0d:e84b:0:b0:565:f045:18c3 with SMTP id
 r72-20020a0de84b000000b00565f04518c3mr10614817ywe.20.1685652211220; Thu, 01
 Jun 2023 13:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-4-vishal.moola@gmail.com> <20230601151900.6f184e8c@thinkpad-T15>
In-Reply-To: <20230601151900.6f184e8c@thinkpad-T15>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 13:43:20 -0700
Message-ID: <CAOzc2pyjLh_GV1PL7CPkkPGcASHULhir_rJgB+UhwzPgQZD8Bw@mail.gmail.com>
Subject: Re: [PATCH v3 03/34] s390: Use pt_frag_refcount for pagetables
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hugh Dickins <hughd@google.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 1, 2023 at 6:19=E2=80=AFAM Gerald Schaefer
<gerald.schaefer@linux.ibm.com> wrote:
>
>  On Wed, 31 May 2023 14:30:01 -0700
> "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:
>
> > s390 currently uses _refcount to identify fragmented page tables.
> > The page table struct already has a member pt_frag_refcount used by
> > powerpc, so have s390 use that instead of the _refcount field as well.
> > This improves the safety for _refcount and the page table tracking.
> >
> > This also allows us to simplify the tracking since we can once again us=
e
> > the lower byte of pt_frag_refcount instead of the upper byte of _refcou=
nt.
>
> This would conflict with s390 impact of pte_free_defer() work from Hugh D=
ickins
> https://lore.kernel.org/lkml/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.=
com/
> https://lore.kernel.org/lkml/6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.c=
om/
>
> There he uses pt_frag_refcount, or rather pt_mm in the same union, to sav=
e
> the mm_struct for deferred pte_free().
>
> I still need to look closer into both of your patch series, but so far it
> seems that you have no hard functional requirement to switch from _refcou=
nt
> to pt_frag_refcount here, for s390.
>
> If this is correct, and you do not e.g. need this to make some other use
> of _refcount, I would suggest to drop this patch.

The goal of this preparation patch is to consolidate s390's usage of
struct page fields so that struct ptdesc can be smaller. Its not particular=
ly
mandatory; leaving _refcount in ptdesc only increases the struct by
8 bytes and can always be changed later.

However it is a little annoying since s390 is the only architecture
that egregiously uses space throughout struct page for their page
tables, rather than just the page table struct. For example, s390
gmap uses page->index which also aliases with pt_mm and
pt_frag_refcount. I'm not sure if/how gmap page tables interact
with s390 process page tables at all, but if it does that could
potentially cause problems with Hugh's patch as well :(

I can add _refcount to ptdesc if we would like, but I still
prefer if s390 could be simplified instead.
