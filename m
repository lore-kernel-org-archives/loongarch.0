Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CEB262A3
	for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731608011; cv=none; b=EgAaFfDkKv+kFRjTioCBy6TgScpZ2Dv4TKxySgKskfULLn7EwZ38PjrhS+SvYhz/ywLifpQa9qA4DwFZoFE9PpTNFcFln8wr0FCK49jph6POFUmLBAO6W/7Rxw/Sq2yp7IpGHRHc7kOO3/kjr5kkA1k7KtLsHAe5mSawFDK2Ex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731608011; c=relaxed/simple;
	bh=NLgDE22Fgr28IerQrJWtzz18Brc1E2YLX4Gg1CiT0J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9JBhKfIfAdbYSM51QCgQuqpxcaaAlQsyKy9E73heJ0+EZRvzpRndstBW9tDWO4cfLECOEZCUO/Ru3knBXiQmUfcwphMpSGCnooiA+j567Z/YLIHIeCToGNuRem4YZtIWZBIJvQtW5Rae4petChYZnOvU/eKdQcRWzP0bx7c1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7ssn6lH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7ssn6lH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FF0C4CED0
	for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731608011;
	bh=NLgDE22Fgr28IerQrJWtzz18Brc1E2YLX4Gg1CiT0J0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T7ssn6lHMecFZldMS7b7tq6An9j2f1L/OfFxAvpTKz2qY8hsIZebpath9tkrU3RF7
	 86Kth9aF3BBw86Z/4QNPZ0vKcwiO6nGUOWnFxg3k/HWXDetlaAHUJNlhjJaBMsVGaM
	 T7nKZmXiOwhpF2TsgOKsO2f7HYndpKlLFykqevBbyQT973aC04oDcRiInK+tvFQAE9
	 iIYdtBYKvbPRGzY1BDILHse5cFwLQgy/E+BOj2slWYxgrIWG3lLzh9UDGmWjX71thA
	 iyk3MLt2/gg2nSPcLt3oXHp/vFN+tmeLm6aNa9Wq0RdWqumUH5hrfEWjMBGRbWY0FF
	 8WBvhsaXNan/g==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3110b964so8630371fa.1
        for <loongarch@lists.linux.dev>; Thu, 14 Nov 2024 10:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXISDM56kGxEZjet40c75KdPWbPV6KS349gpE80LB/W4PnzFGB1Yh5/DYPwFNnIyXbo3xDnj85sIvg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMsZQrLyw/+VDHHFe34NpQ10471MJLO2VInEE5np2VSN49WKGX
	zMMukE42Ep2k1IL3zu69/wHVEfhGZYJhdMlolXlHl88q+LqkULW84lxrsyGEdpjxtEqPzMfep5r
	xqFxl0UtExsoxYVEErnPuoUzxgwo=
X-Google-Smtp-Source: AGHT+IGvNLejd444qC8uClKJehJzpKPve3CeYkFzXqmAqqH/uTp3aqzZlL8Bc+Qa3yrtO+r3t5dbSOm5EZMKvJSPD1U=
X-Received: by 2002:a2e:a9a8:0:b0:2fb:6110:c5cb with SMTP id
 38308e7fff4ca-2ff6070e6c1mr124541fa.34.1731608009822; Thu, 14 Nov 2024
 10:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241105123906.26072-1-yangtiezhu@loongson.cn>
 <20241105123906.26072-6-yangtiezhu@loongson.cn> <20241105141530.GE10375@noisy.programming.kicks-ass.net>
 <62df4c24-68ed-fbfc-ed98-2df796697d89@loongson.cn> <9589c5b673f45f02e2b0fa9d9a96eff0f0df0920.camel@xry111.site>
 <7e8adb0b-e681-72ae-40d8-740dc3f9480b@loongson.cn> <20241113211119.lfwlxv2bjyqfqeh2@jpoimboe>
 <CAKwvOdmE7zZN2x9echrje7dqunda=SywqurkyXyJaaUp3M0aEg@mail.gmail.com>
In-Reply-To: <CAKwvOdmE7zZN2x9echrje7dqunda=SywqurkyXyJaaUp3M0aEg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 14 Nov 2024 19:13:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF=55+z6udToxO=CZdTK910-jxKdCXpryQGg580J9eXEA@mail.gmail.com>
Message-ID: <CAMj1kXF=55+z6udToxO=CZdTK910-jxKdCXpryQGg580J9eXEA@mail.gmail.com>
Subject: Re: annotating jump tables (Re: [PATCH v2 5/5] LoongArch: Enable jump
 table with GCC for objtool)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Xi Ruoyao <xry111@xry111.site>, Peter Zijlstra <peterz@infradead.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	Jan Beulich <jbeulich@suse.com>, "Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Nov 2024 at 18:13, Nick Desaulniers <ndesaulniers@google.com> wr=
ote:
>
> On Wed, Nov 13, 2024 at 1:11=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.o=
rg> wrote:
> >
> > On Tue, Nov 12, 2024 at 08:26:56PM +0800, Tiezhu Yang wrote:
> > > On 11/12/2024 11:15 AM, Xi Ruoyao wrote:
> > > > On Wed, 2024-11-06 at 13:03 +0800, Tiezhu Yang wrote:
> > > > > On 11/05/2024 10:15 PM, Peter Zijlstra wrote:
> > > > > > On Tue, Nov 05, 2024 at 08:39:06PM +0800, Tiezhu Yang wrote:
> > > > > > > For now, it is time to remove the compiler option -fno-jump-t=
ables
> > > > > > > to enable jump table for objtool if the compiler is GCC and i=
t has
> > > > > > > the compiler option -mannotate-tablejump, otherwise still kee=
p the
> > > > > > > compiler option -fno-jump-tables to maintain compatibility wi=
th the
> > > > > > > older compilers.
> > >
> > > ...
> > >
> > > > > ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
> > > > > KBUILD_CFLAGS                   +=3D $(call cc-option,-mannotate-=
tablejump)
> > > > > else
> > > > > KBUILD_CFLAGS                   +=3D -fno-jump-tables
> > > > > endif
> > > >
> > > > Has -mannotate-tablejump been added to Clang?
> > >
> > > Yes.
> > >
> > > > IMO it's better to add it
> > > > to Clang first, and add Clang & GCC support at once into objtool.
> > >
> > > Looks reasonable, the fact is that there are some corner issues
> > > compiled with Clang due to different compiler behaviors, most of
> > > the issues have been addressed and I need to do more test, I will
> > > send v3 with about 10 patches after the coming merge window.
> >
> > Hm, I didn't know -mannotate-tablejump existed.  We really need
> > something which supports all arches, not just loongarch.
> >
> > Others were looking at adding something similar (adding them to Cc).
>
> Looks like this was added to clang in:
> https://github.com/llvm/llvm-project/pull/102411
>
> A comment in llvm/lib/Target/LoongArch/LoongArchAsmPrinter.cpp
> describes the scheme:
> +  // Emit an additional section to store the correlation info as pairs o=
f
> +  // addresses, each pair contains the address of a jump instruction (jr=
) and
> +  // the address of the jump table.
>
> Ard had a prototype in:
> https://github.com/llvm/llvm-project/pull/112606
> which used relocations rather than a discardable section.

Thanks for the cc.

I haven't followed up yet because doing this generically is not
straight-forward. The main issue is that AArch64 jump tables could be
emitted into .text with scaled offsets, e.g.,

adr  x16, .Ljumptable
ldrb w17, [x16, xN] // xN is the lookup index
add  x16, x16, w17, sxtw #2  // x16 +=3D 4 * x17
br   x16

.Ljumptable:
.byte (dest0 - .Ljumptable) >> 2
.byte (dest1 - .Ljumptable) >> 2
.byte (dest2 - .Ljumptable) >> 2
.byte (dest3 - .Ljumptable) >> 2

So just emitting a relocation at the call site and a symbol covering
the jump table might work for x86, but if we want some that works in
general, we'll have to come up with some format that describes in more
detail how to infer the potential destinations of an indirect call it
is known to be a limited set at compile time.
