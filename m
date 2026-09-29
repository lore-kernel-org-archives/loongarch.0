Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C1A545DA3
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 17:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703869; cv=none; b=Lgln91Q1TYgfCc1mWhf+iEfIE+ajgyKxyA7CFLo5Md7DbvVd4Scjn4iPZ5vSpoRTJO8fKtSBnO/um1LNNKcb9NqIkpDTYWX5cb5ggtC7MI2OnIJXo59hxDaSSP/4YkUN07DMbnFvIrb9ltcNpjFmxtESsuydKQ8JWp9mf+NIfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703869; c=relaxed/simple;
	bh=0xBkcPblbpjG4vkQkMpJRewja3D/3gtloFXrU9YBVy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q7PG/2ddg3h17wRyWcGvDFueyrv7PcididOkBpdaoxGHOT391mulcSrjKScqJXjXxunGHx5D3xrjG39gVbPVk4qPsQh6Ss7gvb1/YkHHJZ0ldl3GJER9tqeC1Sh507FkRaBYkpS1bxbav7PvwWzpMY2QWpKjoq31wZUKFJ9vge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2M/WdWh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2M/WdWh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so33857145e9.2
        for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703864; x=1791308664; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=f2M/WdWhjvYeUw4INxVoYvctqz2nqxBhbvt4rliPkoI8tQYNLD/EUwOUH1R/81UNas
         IXn3G6i4sY2c/36jspUK8WwOlOqlfe2kdNCnoZ3i2qv8Dy1GFcr9jOVPHLLanhhDKeQX
         +wY+Nzj3gjtv8tBLCwQTOUSEPzkPjL9UDwAt90e/D4g+HmqDc9X1AsK2mspa7YGg0Kev
         OcF2tcYWRrCHcUOizkq2imyuyDydiXzZqEAYunLOWjGPGGSn5LpQzQgxgOsdTOLQd+y1
         BoMYNyztcj8cRTJ1MPUemqKq/NmBrGURzU+mI78waS21ZtecTrZJvSjPudnrVJCHxQuZ
         rwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703864; x=1791308664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=SielE4T0zIICMZvMUrJHBJlYdPi7KXGu7xHuEz/pkWQsrQKwKOepPjiPUjpOolNbiI
         JXRbL+jrfxTV+/SxItL2coUzLBSRUvzlr0OgGYz9r8sCbme10LRkdoyltsKg8mplC7Un
         pSMOiXbnVJakzvYqAB2Q9zaOYwlrmTzeyOo1fdapVLs81TCB4zd+fjEPEXf07UE0vr07
         IJe+MT4lI97SIUtkhm/8h0TJE3b7xM5Qw1uLFPBx0RrrxEeeKmVz8brD3PTeOpbmsER+
         zTAsGaKEAQrtsAwbfD6AzTOPvSNY5EXHSdQkFCa5Tlh1boAzlpAQZZJEhfSlO39g+2WF
         ykeg==
X-Forwarded-Encrypted: i=1; AKwUvByPcxuDvzmK/9Q+o5o54jOEG0yEibMFX80cukRF4E9hTJJHP+Xn6UbPQkBzEJjmTMftAQD/VreLlgA=@lists.linux.dev
X-Gm-Message-State: AFuF++njtzF0m7+pwC6/tzzvYAvNdu6EmE+t61wX+k5+qGiM/zoYTDOd
	ByMbczjdVpBKzWhWPm18FgmwI+U57XpJ4MjNbcnOKNkl3lD988kes1we
X-Gm-Gg: AYBFou2q4Ox2mRvv4DmQSLiCNNFDt84PIMq7m3pffYESXsuwi10dqhXVxLZmNlteomw
	GjzLHZjmVeM8eYVvR9ACsQUFqLkF7c8kS5aKgBs4Wd8tzAuYi82Y3VRLnCcV/R4T5doGz+sWpmS
	VEMCOrGYnJIeSwiYEkg/vtLhW43l719OYNFm93mpTPMOO//v0wwf6fN6gwhk/3agPN5DKlrBsJ+
	J/KdnEboWyvHPsdyvQYl9IipVn552Wb58v2pGXfGGZWeHhorQhsFzBIs1EdPpKTvfYAA2MuDhP2
	JUmIhrFm5pm40SP0nOKL8qmnjTCBbVrGcrUYXlWH+pvM/X64rG8drz3kHJ1YnjWi8kEKoXwVkcO
	lkW1fLMkhtggGBvA3zW9cGc91EN41ohkfzgSLLFyvSML76AWhqvTLt7f0+XNiYjCNbY9ll3zxQy
	iP6gHe0Rnhu2S99FyfPY+M5PtPl0skdHc38+yBMJc07IlLOxs7k8YEP6O4NaCQdxeGe2GTBzNtH
	RMCuqr8ZZmT6uHl1NOw3XidWC1lnxgBG/w=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr305056015e9.14.1790703863276;
        Tue, 29 Sep 2026 10:44:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm103285395e9.13.2026.09.29.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:44:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929184415.1920fe91@pumpkin>
In-Reply-To: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
	<20260927080225.37534e7c@pumpkin>
	<20260929165939.GA1890629@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 18:59:39 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

> On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> > On Sat, 26 Sep 2026 14:32:49 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:  
> > > Do we even need to return a value at all? Might as well just make the
> > > function two lines:
> > > 
> > > +       for (char *d = dst; size--;)
> > > +               *d++ = value;  
> > 
> > Wouldn't it be better to add a barrier() or similar in there to
> > stop the compiler playing unwanted games>  
> 
> Wouldn't that just result in the same code generation issue that Jason
> pointed out on my v1?
> 
>   https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

I missed that one going past....
You only get 'rep stosq' because the compiler first converts it to memset(). 

> Maybe that doesn't matter because modern compilers have better options?

A lot of cpu will run the 'rep stosq' very slowly (it has a big fixed cost).

At a guess the loop is 3 clocks (possibly 2; but that usually needs
you to use negative offsets from the end - and gcc doesn't like that).
That is comparable to a mispredicted branch (and you might get two of them).
It still might actually be faster than the 'rep stosq' version!

I suspect the fastest code is to unroll the loop.
	xor %eax, %eax
	movl %eax, 12(%rbx)
	movq %rax, 16(%rbx)
	movq %rax, 24(%rbx)
	movq %rax, 32(%rbx)
	movq %rax, 40(%rbx)
	movq %rax, 48(%rbx)
	movq %rax, 56(%rbx)
8 clocks on old cpu, 4 on newer ones.
But more likely to be limited be I-cache reads.

If you are going to use 'rep stos' then you might as well write
13 32bit words.

David

