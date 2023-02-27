Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF979EF
	for <loongarch@lists.linux.dev>; Mon, 27 Feb 2023 19:46:48 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id s12so7972382qtq.11
        for <loongarch@lists.linux.dev>; Mon, 27 Feb 2023 11:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgbfP6t1iEXlYeQDHgpgkGKrmlu/wPbkfmiZJDZsq5c=;
        b=CuDTGVyS/TeSP2rxTGjDXSIQ02tvZFOJOD4mxr6lOw4FxhqXg/hODAMUnGzbSrMCrC
         bASdwGz16M4a9h2a+0dxlwVWasjquoMlmatwbCeX6Q81wc2HaYny+wPgQrKuRzIj+Ni1
         ILoX6Sm7oohZ+YiR6Qi6rssz7ns5jmtNEfgk5/yaWExtBEBYjQOfCsu44L/gsHaWnJSY
         4JKPhwOR2XbHA3mHEJIGWUJx1MenN317TvVgldlqb6HwCiAS+fZKF6AnT2VxQysKG5N3
         Q0Cx43DeOLAtktMFbkF0KHzJyoro9DMjwm+F8oQ8S5Nc2dlztCxN3nEDKcL/9VUB7oH4
         JLIA==
X-Gm-Message-State: AO0yUKVFJLXGIft/s+Ebg4ZR73dRveGetLQGM660Zq8jqkaGBAdKzycx
	fjRQ5DkCSB/q0x9eGdz9L25IqNL3Khz35w==
X-Google-Smtp-Source: AK7set+pcj4fk4l0vlToUeQCBKs+4YAzbmD9Jod4TWkKE5jgyYhfBLYY3Jidlr6mFq3+hIj2WMjbqw==
X-Received: by 2002:ac8:5bcc:0:b0:3b8:4adb:c604 with SMTP id b12-20020ac85bcc000000b003b84adbc604mr881931qtb.14.1677527206921;
        Mon, 27 Feb 2023 11:46:46 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8454f000000b003b848759ed8sm5164432qtn.47.2023.02.27.11.46.45
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 11:46:45 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5384ff97993so207994007b3.2
        for <loongarch@lists.linux.dev>; Mon, 27 Feb 2023 11:46:45 -0800 (PST)
X-Received: by 2002:a5b:d4e:0:b0:967:f8b2:7a42 with SMTP id
 f14-20020a5b0d4e000000b00967f8b27a42mr7816406ybr.7.1677527205039; Mon, 27 Feb
 2023 11:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230113171026.582290-1-david@redhat.com> <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
 <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com> <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
 <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
In-Reply-To: <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Feb 2023 20:46:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
Message-ID: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Mike Rapoport <rppt@linux.ibm.com>, Yang Shi <shy828301@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Nadav Amit <namit@vmware.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Feb 27, 2023 at 6:01 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>    /*
> >>>>     * Externally used page protection values.
> >>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
> >>>> index 42f5988e998b..7e3de54bf426 100644
> >>>> --- a/arch/microblaze/include/asm/pgtable.h
> >>>> +++ b/arch/microblaze/include/asm/pgtable.h

> >>>>     * - All other bits of the PTE are loaded into TLBLO without
> >>>>     *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
> >>>>     * software PTE bits.  We actually use bits 21, 24, 25, and
> >>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
> >>>>    #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
> >>>>    #define _PMD_PRESENT   PAGE_MASK
> >>>>
> >>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
> >>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> >>>
> >>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> >>> wrong?
> >>
> >> In the example, I use MSB-0 bit numbering (which I determined to be
> >> correct in microblaze context eventually, but I got confused a couple a
> >> times because it's very inconsistent). That should be MSB-0 bit 24.
> >
> > Thanks, TIL microblaze uses IBM bit numbering...
>
> I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?

Correct, as seen in s370 and PowerPC manuals...

> I recall that I used the comment above "/* Definitions for MicroBlaze.
> */" as an orientation.
>
> 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G

Indeed, that's where I noticed the "unconventional" numbering...

> So ... either we adjust both or we leave it as is. (again, depends on
> what the right thing to to is -- which I don't know :) )

It depends whether you want to match the hardware documentation,
or the Linux BIT() macro and friends...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
