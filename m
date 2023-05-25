Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B21D2A4
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 17:12:26 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-19a1ac5e200so1483768fac.1
        for <loongarch@lists.linux.dev>; Thu, 25 May 2023 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=hlN2P2+4u+i/qYY499lGWAoyNY/dboRXOhJznjo9Nm7b8P8cZFR+c+0fCkL2rW25CD
         +hZ5J0+Ex4V3ScR/Xe/US44TDdlNVBI/xdsG40Ua1AXHZ442jMGry74GV2BfJq0J5IYV
         u7lelVrP8y0maLYqq75TrtqE6TS9ejRf7OJtZV90tVtzTBQB8gLHvCfhdBCn30nX09L2
         ck5ghpRGKOeV6W36JYgZ3HGXIa/8ueDRuLasr3XHrrQINIR3LY+3Qk5dm5YcGu7+Oweg
         Z/YZFzs6cf7vI3ciL7ceyYyXeS7nwrYpgRm5g9mSuxHdlnBWIXgAoNtf5095aMXhJIqs
         nB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034745; x=1687626745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8r4ODEq2+fLCDOwkU0I9uMZzQGsmacbN0I7clioZxg=;
        b=Rn62TSMgRyzIUbS1686astG9mMcQu9MPwC0X2sSiMFVbKTkwSKaR/hmW4CEmNxY/X2
         S+7+t1iTv2g6ATwJJ+Q9eoq+pahMADT6FmSuFUAYCR8ttdyCExK7wyTDRlL2IMc31EEY
         zsaXqA8OJAYB13EM+9lsNAeF4BXVqzG66eSI73LLmDdZd1OqHNniL2cxH7LizltTxGfx
         tHzCs+y06FWBuvOS59kCFaWyg0mHtGS+I7x3zcvPrQbayZ+kuUP2FSpiWe8lQz+X2wf1
         r8tWsKEE0Cd+PZ208ZSv8txGVI6JDxZGplmZUZ2OybMOu/fiAwxBXn3bk0mXlhgSfLpB
         dlsQ==
X-Gm-Message-State: AC+VfDyNEz/oei5hZJw3+uDVJLcQp7rPn6r3DRkpu49UZHkZQ4EYJkk8
	kJzPmIApAYMisi42tF5cBTlcm84Voz2qD3qaClc=
X-Google-Smtp-Source: ACHHUZ7vTuIkb3AY2emRZbpynC4n929WANyhiAk9Z8pBe93X++8c36ksUYj3vhKz06//2+LG6F86/hC/ahr56+n93g0=
X-Received: by 2002:a05:6871:505:b0:19a:1694:f03f with SMTP id
 s5-20020a056871050500b0019a1694f03fmr1875889oal.47.1685034745319; Thu, 25 May
 2023 10:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-3-vishal.moola@gmail.com> <20230525085819.GW4967@kernel.org>
In-Reply-To: <20230525085819.GW4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:12:14 -0700
Message-ID: <CAOzc2pw63URkr08q4_VP+3wbRDnFjyUE8zxQrvQtnJ5kbtGhFg@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] s390: Use _pt_s390_gaddr for gmap address tracking
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, May 01, 2023 at 12:27:57PM -0700, Vishal Moola (Oracle) wrote:
> > s390 uses page->index to keep track of page tables for the guest addres=
s
> > space. In an attempt to consolidate the usage of page fields in s390,
> > replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >
> > This will help with the splitting of struct ptdesc from struct page, as
> > well as allow s390 to use _pt_frag_refcount for fragmented page table
> > tracking.
> >
> > Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> > before freeing the pages as well.
>
> Wouldn't it be easier to use _pt_pad_1 which is aliased with lru and that
> does not seem to be used by page tables at all?

I initially thought the same, but s390 page tables use lru.
