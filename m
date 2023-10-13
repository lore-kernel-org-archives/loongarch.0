Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B32421A0A
	for <loongarch@lists.linux.dev>; Fri, 13 Oct 2023 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgZz4xyv"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d9ac31cb051so2412164276.3
        for <loongarch@lists.linux.dev>; Fri, 13 Oct 2023 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697231000; x=1697835800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=lgZz4xyvxjtTfuCDgO3P3HZaXAFdlpc7nwqjurkbC0J2RHinoZ6Mv2qpLDp5JLU3OP
         dWse/kkaquoJBzypMqVcaKApH7rqPH4iIVrRRAL1Vpqc65i3LuSuMKojSEsZ/bRJCwF3
         bSLW6iGwuvj16wGJbisGzGT3yDiU7RDJE1KZxGaDuRcVqstbgNLDKHo4bt7n2jZTGSbi
         B6JO85I4aHzMQVLds2RmKeKs0ThM5hUxd1nz1miR5iAHhhXF51Urqn03xtsle7Kq9g7S
         jtU+VgOdkHwsTBgWX4VtFMGvW1+Gk8iDF/e5+/PieHVMLnqj17d8wtAKhrtiwEGYNAH0
         AtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231000; x=1697835800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtiOVCn2uSsz0FoSYRDQt6Ad/oEEDkzUyvmWznVzlSA=;
        b=RgG3GgZTAk7nXZ6b4AwemMfg9jsuhWeYZbQyC5QkYdM8NjoGkeNpSlLMRXpVtAYJsm
         Zx6hTpJvfH9u6HzMLonIWxcQiDcL6gGdylhvRxxxj3yp62SmuOJS6zE1BRWna5NVrbUD
         wLIPuburvfWOuOmyuQotYvwqPGcXVQh5DvmR8OkHM6vhPSku4ojjYBuEncIuPMvMMcJM
         EpreusUH8eaJwlctoU4NSTAJiRj0f826QQWZjEBcb8w3xH9DXeYhqjK+nl8iSBTVJbNy
         03bZYKpOBd2XS5jkH0egetjzFnRYJ2ReuzMOQTdBGILRk4Ybs2vufs6DPr/hCPk0QuCc
         P0KA==
X-Gm-Message-State: AOJu0Yzob0huLxHVVVgtuM6+8jRN/XNxP9uvSfgOaDhe2nM1CBEMnmW3
	7fAmdjbMpO0WLR6JdbRSPqgv3sGuQubCM66Q7hY=
X-Google-Smtp-Source: AGHT+IHWHj9ILTPWExZ8ekeA0/ryyRW0ZV6k5VhEVnOo+k5EpZsvEbKt/nom23K7vTTS2zHZvjjk2tEmm58T8MLLm1U=
X-Received: by 2002:a5b:64d:0:b0:d9b:3b3e:5a07 with SMTP id
 o13-20020a5b064d000000b00d9b3b3e5a07mr2004058ybq.5.1697230999223; Fri, 13 Oct
 2023 14:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807230513.102486-1-vishal.moola@gmail.com>
 <20230807230513.102486-15-vishal.moola@gmail.com> <20231012072505.6160-A-hca@linux.ibm.com>
In-Reply-To: <20231012072505.6160-A-hca@linux.ibm.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 13 Oct 2023 14:03:08 -0700
Message-ID: <CAOzc2px-SFSnmjcPriiB3cm1fNj3+YC8S0VSp4t1QvDR0f4E2A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v9 14/31] s390: Convert various pgalloc
 functions to use ptdescs
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 12:25=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Mon, Aug 07, 2023 at 04:04:56PM -0700, Vishal Moola (Oracle) wrote:
> > As part of the conversions to replace pgtable constructor/destructors w=
ith
> > ptdesc equivalents, convert various page table functions to use ptdescs=
.
> >
> > Some of the functions use the *get*page*() helper functions. Convert
> > these to use pagetable_alloc() and ptdesc_address() instead to help
> > standardize page tables further.
> >
> > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  arch/s390/include/asm/pgalloc.h |   4 +-
> >  arch/s390/include/asm/tlb.h     |   4 +-
> >  arch/s390/mm/pgalloc.c          | 128 ++++++++++++++++----------------
> >  3 files changed, 69 insertions(+), 67 deletions(-)
> ...
> > diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> > index d7374add7820..07fc660a24aa 100644
> > --- a/arch/s390/mm/pgalloc.c
> > +++ b/arch/s390/mm/pgalloc.c
> ...
> > @@ -488,16 +486,20 @@ static void base_pgt_free(unsigned long *table)
> >  static unsigned long *base_crst_alloc(unsigned long val)
> >  {
> >       unsigned long *table;
> > +     struct ptdesc *ptdesc;
> >
> > -     table =3D (unsigned long *)__get_free_pages(GFP_KERNEL, CRST_ALLO=
C_ORDER);
> > -     if (table)
> > -             crst_table_init(table, val);
> > +     ptdesc =3D pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, CRST_ALLO=
C_ORDER);
>
> I guess I must miss something, but what is the reason to mask out
> __GFP_HIGHMEM here? It is not part of GFP_KERNEL, nor does s390 support
> HIGHMEM.

You're not missing anything.

This was replacing __get_free_pages() which also doesn't support HIGHMEM,
so I had that in to ensure a non-HIGHMEM allocation in case a
passed-in gfp_flags
had it set. In hindsight since we're just passing in the GFP flags
directly here, we don't
actually need to mask out GFP_HIGHMEM.
