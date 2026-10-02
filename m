Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C39471421
	for <loongarch@lists.linux.dev>; Fri,  2 Oct 2026 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938749; cv=none; b=SJQcWjQytdg9qkttXz1Foz5HzMV9ZK2g1X/iJSKMxkPuxdvT1ZxSAypqsSkzF6WC667LIm+mPUzmiopzbfJktQs3quGtzmQPWPwiCGQ8V+HNy/TYWGnbAEdy9oMdx5OyY5tPQckUpJtUlszT6FHvwioUT+SyVAJO1SbmFLQb2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938749; c=relaxed/simple;
	bh=seIpiQO/SQt+kLtQXhAqbjI392mgv9fvCNqMmLtCxfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6vrh1B/vTbT0OxoL3yWLgz667DnAiMZWbNE7S1tdPO35D0pXD2cUYZbFvXY+ObEM5z5ZlPGYouFYEEXUYj4SfgO9s62cPEz9cfbzJi8GzOlcowIfZNrOc3cB4oyyT86I+zXVdMoj5m6XIqwpephSbK4CxcfmVmiBeSa1iSChJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=GFcq79Kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GFcq79Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED59B1F00893
	for <loongarch@lists.linux.dev>; Fri,  2 Oct 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GFcq79Kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790938741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pxei7jjMKgKYiJq7FPMIUgor4y30+Z660JBwkmAeSIU=;
	b=GFcq79KfRexVqilVjQe3T/gap32hK9qtzApE0XFvXwM/oaDLzOd7whYw4Kh6lglo15H2aR
	RtzjZBAdP97mxck7aFDAqWM8j3nNia5mfzweaufHZr5e1ofSYjFOWnoVXzgIvlsUtgQbv5
	8kteJa0XF5H880jzodM0MYuQAKRXNY8=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id b9ddbe7c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <loongarch@lists.linux.dev>;
	Fri, 2 Oct 2026 10:59:01 +0000 (UTC)
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e35c3bbdbso245254666b.1
        for <loongarch@lists.linux.dev>; Fri, 02 Oct 2026 03:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZ3KZII2Zi9kXpYpt5cDcYNb0dYuWgaWaFA7+9Ni1mvPwGpLajkgteifOorzSbcKfP4r6Pm2HvEss=@lists.linux.dev
X-Gm-Message-State: AFuF++kden+2o7xSVOS6nZv97ec7qp0M17RYr7GpLoQBDgLmdyFqGi8L
	CAicezLd/hwp8zzYpdkphp3tfhodUzqkARoeKmAu3kfUAv3mjmNpkQtVcJkXEj9JZSvNvv5sF58
	DDnHMGfZYGZGfaaERunuBDm8Q7pHTNBs=
X-Received: by 2002:a17:906:ba87:b0:c2e:3acb:34df with SMTP id
 a640c23a62f3a-c2e4b3ffd07mr185815666b.39.1790938736158; Fri, 02 Oct 2026
 03:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <179093852073.149722.832232613857480812.b4-ty@kernel.org>
In-Reply-To: <179093852073.149722.832232613857480812.b4-ty@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Oct 2026 12:58:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
X-Gm-Features: AclHuK806shnKBNqNgOvgQVyH7F2xaT6wyW4EoVyeu-ArFe_UTxaLC7DpGRwXbE
Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 12:57=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
> On Fri, 25 Sep 2026 22:46:32 +0100, Nathan Chancellor wrote:
> > After a recent change in LLVM [1], builds with the random vDSO
> > implementation, such as PowerPC and RISC-V, fail when checking the vDSO=
:
> >
> >   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not s=
upported
> >   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not suppo=
rted
> >
> > memset() is now generated when zeroing params->reserved for some builds
> > because LLVM has an optimization (now run in more instances) that can
> > recognize at compile time when it is assigning a static value to a
> > contiguous area of memory and turn that into a call to memset(). Both
> > clang and GCC assume memset() is always available [2].
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] random: vDSO: Avoid call to memset() when zeroing reserved in __cvd=
so_getrandom_data()
>       (no commit info)

That's not for you to apply. I'm sending this through my random tree,
along with a handful of other things I need to fix. But I wanted to
let this cook a bit more. I can add your reviewed-by line, though.

Jason
