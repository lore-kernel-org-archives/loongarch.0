Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337781D2AD
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 20:39:06 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-bacf685150cso182100276.3
        for <loongarch@lists.linux.dev>; Thu, 25 May 2023 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=hsCL+sMjCSPEeQwY9ipI1+Ugi88AzJEwmAmsO1IR16vD0JLbTTRj1EWY5Xyhze+GRV
         OIRanM33HOk1xRjR7/GHHUD5lVS6HFpcFxeDfzeE8/I0OcBZz8czUxvwLPGCPl3ZI/jZ
         DVqHoFaNkDaMUMuSYvpfhlO6EV7GylFCaeIZ84F6j+93L973raF6hD3O66C/pZ4eWLz+
         QLbFT/lbaOp/9U1+H051UFvXelrd7lzOtz3vj1HsEWe84ksN1HTRbSJYJedE8uZu9k6u
         F1jI+oM85Ujez7vT22bFzFiXTlvVTKRouPJkd38Xldm/McWaSi1VxP376ACeyocGF45q
         tGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=gElrqZj5IJhL2yNUyjAvXpkcB7/jFkActPS57f+W+5XW3qSpHR0uAzcwIpTSgR7keN
         O0y1bJ1IPgrwp6W1IIWg3AjV+ujUv/JS7OEsR5QL5JctUImnzaz//NVqDuBruC9G0DWp
         QDDurs6Jfd+lpTsTWDQReQnT3FTj8uyzEJK6IDudX1fmOhyl9DHbfrOZ/YNtHg8G3i2X
         KtUexeUYOl3pj3ICHEh9LPoUgPuj0xREfz+Sd5ktia/NLg4ewHSsY0odpLL1fnx+BQGX
         4fTW7y3qznIMiG351svFsq5E9mw+/8bhxpkG97lOxbiV4at01fkpqJPn17XGBrwkZOjb
         Q/ag==
X-Gm-Message-State: AC+VfDwL5OwypBJ+a2FbASxuTkmuRSy6yuipkUN+ZPBdYsT7+pTa2v86
	WFrjBOmr2Y0GLTlE1mDH8Ulmg/L5GHKbTO1yh9w=
X-Google-Smtp-Source: ACHHUZ4OcPsUwJDpZZlKfNKbpYbRuRkX6Q4UETTfFRyNyytwfdAtGP02e8IuqJSt1+a/7sd0aU+yePVkYawV73NLE1o=
X-Received: by 2002:a25:d111:0:b0:ba8:4b48:1de0 with SMTP id
 i17-20020a25d111000000b00ba84b481de0mr4810389ybg.47.1685047145065; Thu, 25
 May 2023 13:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com> <20230525202011.GZ4967@kernel.org>
In-Reply-To: <20230525202011.GZ4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:38:54 -0700
Message-ID: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:20=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> > On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > Hi,
> > >
> > > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote=
:
> > > > No folio equivalents for page type operations have been defined, so
> > > > define them for later folio conversions.
> > >
> > > Can you please elaborate why would we need folios for page table desc=
riptors?
> >
> > Thanks for the review!
> >
> > These macros are for callers that care about the page type, i.e. Table =
and
> > Buddy. Aside from accounting for those cases, the page tables don't use=
 folios.
> > These are more for the cleanliness of those callers.
>
> But why using folio APIs for PageType will be cleaner than using page API=
s?
> Do you have an example?

Ah, for example in mm/memory-failure.c there are a couple uses of PageTable=
.
Like the line :
if (folio_test_slab(folio) || PageTable(&folio->page) ||
folio_test_reserved(folio))
where that PageTable(&folio->page) can now be written as folio_test_table(f=
olio)
instead.

Also there are numerous uses of PageBuddy in mm/compaction.c that will
likely need to be converted to folios as well.
