Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CC16EB56
	for <loongarch@lists.linux.dev>; Tue, 15 Oct 2024 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728961478; cv=none; b=b6kfcZESHdCWkZkZ0hRMkp1nTJNIA3cGzklDKZR2TsZAQGTjkGaCMkkjpFLwsiEEqA+OF8azsMMI1ox1IyNMqYkOETKNXqI5e2Q/fra/XRJSJtCiWjlJ62G/DYcTXH8AxURJK8lAfw1csql1XG8KGv4XeiX1MGU3K6LH+no3FNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728961478; c=relaxed/simple;
	bh=J9AXBLqUsBJ/yA85UVfPqaFq4TQ2jxzhw2ers6Fj2jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv3/Au62VqyWdPMDdbH4FI3nBAo1IcaD9sRGzP0WupqNd3ZI6VaQcTi6Hnw8CYSgQJulmRhGZshp9wGx12YP5Mv4U+iAWFYBLSj7XQiJLoCdn5ONUIlxtXlpmKGz8CVEKWglqdVe21uYZfPa7Sd1dLfgkHN2kWIG4ipCQq6e5bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LhA+lqqx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LhA+lqqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728961476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
	b=LhA+lqqx/PRbhSL0UIHw5uB90tDsym+Z6OdeYNQFLJNAAUIhlNm6MGLDsPrfN95J5JJ6pW
	Z4BGCguoysuS/C5Csi8zOk5hDjzDUk+8LUsPaaMT1umkDrFjbzmhNjONTS6CKfBx09FMbX
	aYBF6ECAiCSKzK9vZvLzkcwJTP58E+s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-ezh-_vKUNW-YKWf7_D-QmA-1; Mon, 14 Oct 2024 23:04:33 -0400
X-MC-Unique: ezh-_vKUNW-YKWf7_D-QmA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbf039dccfso77512116d6.0
        for <loongarch@lists.linux.dev>; Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961472; x=1729566272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
        b=HAyxI2sZTpXmEvMDb13Ge+DPnErG3U8M1kIdy5yWRcDQD/pOg6ww5l6k9d+Q4H4yu+
         MPAauH7l4WnTHApAoWHFGHF43cxFI7whsgw7h1Wu4+w9655qQtoPN6mzqjxQFDvGIRDq
         SZUdVwMs8XuX15czVbLoUERTuwdgvQDmU394m4INX9HLPQ8TQdAEQgm8WCNaEgjLXBE+
         WEFGl+G/8rs35Fveu/FgRzNWmna67JtmGS34pfdDROMd+rpo9gcA1jkCj3N0sBPQze2d
         V7CQsaJE3t3sZOn+Jl8t4x7yOLlRo8DhMkPM+F4x6pvR+fARoL1WFfrpa5mpHWDpjFxd
         Nsig==
X-Forwarded-Encrypted: i=1; AJvYcCUCKxjQvVxw1WnebRXAq9570cXc430iLH0ZcnoJupu73U52hh+cCKUztia9xqD6EONs83d6D2IXSZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwL/kknDEcpFJ9M1JD4S4k0WiknmQ7FmX0G+l5WZjqjv5WMLkGM
	ni5pxnRFQQkKmeWOskAoilcPBnxuxV02WKL2ziTKrcueUKH8Y8mII2r+Li9M59/KR4zQ+rki9lY
	4G/3YN9yi3gZQIRQVA7lR3iry/ds6scGFOn4ehUqrIDjYSSdeGIGiPRRdh+fAGWFpKlAoWfiuKF
	PyAh0MTSUpcU+vUJvAmB6BzdkLNddUBkWL
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id 6a1803df08f44-6cbeff63948mr208010326d6.24.1728961472396;
        Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp3T4Yepy5h5DQueUeaIl2hWfHF7EpApBAxl9jBnWIq5Z+upYe1XYSqd8+UMzLGOwXgyDg2kobb+ggSdFvo7w=
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id
 6a1803df08f44-6cbeff63948mr208010076d6.24.1728961472016; Mon, 14 Oct 2024
 20:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com> <Zw0iegwMp5ZVGypy@fedora> <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
In-Reply-To: <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 15 Oct 2024 11:04:21 +0800
Message-ID: <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, 
	Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>, 
	Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 10:07=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> On 14/10/2024 14:54, Pingfan Liu wrote:
> > Hello Ryan,
> >
> > On Mon, Oct 14, 2024 at 11:58:08AM +0100, Ryan Roberts wrote:
> >> arm64 can support multiple base page sizes. Instead of selecting a pag=
e
> >> size at compile time, as is done today, we will make it possible to
> >> select the desired page size on the command line.
> >>
> >> In this case PAGE_SHIFT and it's derivatives, PAGE_SIZE and PAGE_MASK
> >> (as well as a number of other macros related to or derived from
> >> PAGE_SHIFT, but I'm not worrying about those yet), are no longer
> >> compile-time constants. So the code base needs to cope with that.
> >>
> >> As a first step, introduce MIN and MAX variants of these macros, which
> >> express the range of possible page sizes. These are always compile-tim=
e
> >> constants and can be used in many places where PAGE_[SHIFT|SIZE|MASK]
> >> were previously used where a compile-time constant is required.
> >> (Subsequent patches will do that conversion work). When the arch/build
> >> doesn't support boot-time page size selection, the MIN and MAX variant=
s
> >> are equal and everything resolves as it did previously.
> >>
> >
> > MIN and MAX appear to construct a boundary, but it may be not enough.
> > Please see the following comment inline.
> >
> >> Additionally, introduce DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() which wr=
ap
> >> global variable defintions so that for boot-time page size selection
> >> builds, the variable being wrapped is initialized at boot-time, instea=
d
> >> of compile-time. This is done by defining a function to do the
> >> assignment, which has the "constructor" attribute. Constructor is
> >> preferred over initcall, because when compiling a module, the module i=
s
> >> limited to a single initcall but constructors are unlimited. For
> >> built-in code, constructors are now called earlier to guarrantee that
> >> the variables are initialized by the time they are used. Any arch that
> >> wants to enable boot-time page size selection will need to select
> >> CONFIG_CONSTRUCTORS.
> >>
> >> These new macros need to be available anywhere PAGE_SHIFT and friends
> >> are available. Those are defined via asm/page.h (although some arches
> >> have a sub-include that defines them). Unfortunately there is no
> >> reliable asm-generic header we can easily piggy-back on, so let's defi=
ne
> >> a new one, pgtable-geometry.h, which we include near where each arch
> >> defines PAGE_SHIFT. Ugh.
> >>
> >> -------
> >>
> >> Most of the problems that need to be solved over the next few patches
> >> fall into these broad categories, which are all solved with the help o=
f
> >> these new macros:
> >>
> >> 1. Assignment of values derived from PAGE_SIZE in global variables
> >>
> >>   For boot-time page size builds, we must defer the initialization of
> >>   these variables until boot-time, when the page size is known. See
> >>   DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() as described above.
> >>
> >> 2. Define static storage in units related to PAGE_SIZE
> >>
> >>   This static storage will be defined according to PAGE_SIZE_MAX.
> >>
> >> 3. Define size of struct so that it is related to PAGE_SIZE
> >>
> >>   The struct often contains an array that is sized to fill the page. I=
n
> >>   this case, use a flexible array with dynamic allocation. In other
> >>   cases, the struct fits exactly over a page, which is a header (e.g.
> >>   swap file header). In this case, remove the padding, and manually
> >>   determine the struct pointer within the page.
> >>
> >
> > About two years ago, I tried to do similar thing in your series, but ra=
n
> > into problem at this point, or maybe not exactly as the point you list
> > here. I consider this as the most challenged part.
> >
> > The scenario is
> > struct X {
> >       a[size_a];
> >       b[size_b];
> >       c;
> > };
> >
> > Where size_a =3D f(PAGE_SHIFT), size_b=3Dg(PAGE_SHIFT). One of f() and =
g()
> > is proportional to PAGE_SHIFT, the other is inversely proportional.
> >
> > How can you fix the reference of X.a and X.b?
>
> If you need to allocate static memory, then in this scenario, assuming f(=
) is
> proportional and g() is inversely-proportional, then I guess you need
> size_a=3Df(PAGE_SIZE_MAX) and size_b=3Dg(PAGE_SIZE_MIN). Or if you can al=
locate the

My point is that such stuff can not be handled by scripts
automatically and needs manual intervention.

> memory dynamically, then make a and b pointers to dynamically allocated b=
uffers.
>

This seems a better way out.

> Is there a specific place in the source where this pattern is used today?=
 It
> might be easier to discuss in the context of the code if so.
>

No such code at hand. Just throw out the potential issue and be
curious about it which frustrates me.
I hope people can reach an agreement on it and turn this useful series
into reality.

Thanks,

Pingfan

