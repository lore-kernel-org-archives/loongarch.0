Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC773A1E94
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567703; cv=none; b=Z7FRt0ST7R67MA9fbMDLC0Fh4TEbUwX29HY1HPsOqfG++jEnjhzS78jRC/emiwyKfguerawK6KCjyhZIF5Cl2syrSMMvwWKgxSROL6bO0P4i/tIMe7GmrzNWJPBe7wp76H9h2vVEHUSKJe+MYLQzkv2LrKlDpHPC4uo38iLspOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567703; c=relaxed/simple;
	bh=Dx1KQa5I1r3Fu8oJQBMaJqVN516QSYERTBkF+neq+3A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k94CZr1fchKADmTqiFLGlK05JfNR8qN0ahBszeRQAgWjtkV0CKWhts6qTgsnsHuCACNYVD5OqOhv7Izjfsbn0BIN4SQCTXsyojiUp9j0ZJEHtoVcxdUpZxrRO062aKAfXEwmPmsL4YSVOaHUoYD5Zsq1H+UI8+N3vEy1FQoq3UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLOXntnK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLOXntnK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-431048c4068so709849f8f.1
        for <loongarch@lists.linux.dev>; Sun, 04 Jan 2026 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567700; x=1768172500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=jLOXntnK62xAxEsNhiEK8UBLeZ+u1EnfjMJzJvakJDhdoBMWjelIJbO12ABTxXsh97
         bGAQ8ke8aZwjViO5NqE4rsdzHkuAcvL7hfQ/hfiDoXUzTI4jHXA7lcKvAvmLxqVxAE+/
         zQ5OxPOIB0Gs1IIslDTawYRZFXPcvLBBiXreISrycWB+h87thNzmAdT/fNdLRzZD8/m7
         nav/jO5eEvAPelVVVZfoA4xVf8vENwOcTY6Ws8mOJ1AcC2HW3m+u0fJJmG877FHPfv03
         Ar8YXgfWBvztt1QpUE60nJMmJieERbb8VhNnOdgZue8PyIwBC3tZcCCsxInYP/Tq6Ft/
         Vzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567700; x=1768172500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=pGUMCDOE262IJOYROs2/4hu7qckdfiE9GM/Gpiw9XjrjfxIQbQ/jy4ufQQhC4/wPXV
         /cnFLBRhKCayJf93WDrMVVrdLexLYP6unNIdKJTKl3MyJ8sIxANUIwX5an1+4B9Qz4y9
         yD7GP2s5a4krWF0kyuCnqJFKc/2OAAnSjSvFzuGCCaftjkj4P9KfLLRIr7msR1Vn2ZMf
         HjNuIC0KLnjQBlPOxGrrBuFSXXwkBUeJKtnIn+hZbrIzxvswnt1n+09FccPGe+Zy1MLy
         ttTkYmSL0xKgdCuoc/gSykelauJcXvxaK14QkvF3sOnZtLmXhh6JfphneT9NAUzhdNqv
         tjQg==
X-Forwarded-Encrypted: i=1; AJvYcCW6/vp3AazCjcHsIjt+wKuh8v/UhR0bIcuO56cyb/W2fM4BCT8YtH6YlxRhijJ1v1dFKg9iKdfYOn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYnRRrjP3i33hGYvgpmphlvX6V0bsCZYzln4YM5wRK3ka7gcng
	1cwDKoRTcYD20noi2hZzjhHzkolVg/UHyE+C7G41jIZOdbziUMwQD+PM
X-Gm-Gg: AY/fxX6nDg7GvnM/Zd6jK8TqL+MLbFrgAl8OKYXUrKlqzgnvrH0G42NpTlsWTAAYC8a
	mBwSGHthBa6wiAXrr5jLOgiNqYksPBFQKZBT2xvUCNtrwbsh/G6lnZ0Vkc9FdGr+jgMfpoWR9+e
	B/pjYdhKTDqkNdlmG1PzEpujVW7/gXmh+wsmNYtFEp5xpLy+SvlgdmJ+kYRZEgPvJ3Vi5rQrAFP
	6LmBukQ67+/W+nq9xCVLCuKkI3NGMJZA5G7Kv+IefcLgCm68yIENXUsEDpZzsHzZ3ZAmJBUpjgz
	fXEVMkFhzqcvy8vdxkWQlNedzac1YUO8r/wVxhcha2COz8lZ0zStKcxKdHB5GKfVuakVnSbgstY
	ztT1Cgc5oetOKk2+YwSVabBMZkBRTQhrNpl81zF8N0Hoz8RRP8mGV2SlNA1Oa19WSseb7clXvbc
	R+F920cQanIq2ZlKaqTZ5jbTGRIeQZzfjp8TBXV2UO83LdPch5qZoa
X-Google-Smtp-Source: AGHT+IEPxlgtmoJsOcbnrDXHkchjsFc7moeHiVQTpzEoBA2t+H1hGAq+A791EuxHgrzC5U6Ox/NHuQ==
X-Received: by 2002:a05:6000:3111:b0:430:fe6c:b1aa with SMTP id ffacd0b85a97d-432aa434e77mr7977363f8f.26.1767567699992;
        Sun, 04 Jan 2026 15:01:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm99650545f8f.17.2026.01.04.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 15:01:38 -0800 (PST)
Date: Sun, 4 Jan 2026 23:01:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260104230136.7aaf8886@pumpkin>
In-Reply-To: <20260102131156.3265118-4-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Jan 2026 13:11:54 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Previously different architectures were using random sources of
> differing strength and cost to decide the random kstack offset. A number
> of architectures (loongarch, powerpc, s390, x86) were using their
> timestamp counter, at whatever the frequency happened to be. Other
> arches (arm64, riscv) were using entropy from the crng via
> get_random_u16().
> 
> There have been concerns that in some cases the timestamp counters may
> be too weak, because they can be easily guessed or influenced by user
> space. And get_random_u16() has been shown to be too costly for the
> level of protection kstack offset randomization provides.
> 
> So let's use a common, architecture-agnostic source of entropy; a
> per-cpu prng, seeded at boot-time from the crng. This has a few
> benefits:
> 
>   - We can remove choose_random_kstack_offset(); That was only there to
>     try to make the timestamp counter value a bit harder to influence
>     from user space.
> 
>   - The architecture code is simplified. All it has to do now is call
>     add_random_kstack_offset() in the syscall path.
> 
>   - The strength of the randomness can be reasoned about independently
>     of the architecture.
> 
>   - Arches previously using get_random_u16() now have much faster
>     syscall paths, see below results.
> 
> There have been some claims that a prng may be less strong than the
> timestamp counter if not regularly reseeded. But the prng has a period
> of about 2^113. So as long as the prng state remains secret, it should
> not be possible to guess. If the prng state can be accessed, we have
> bigger problems.

If you have 128 bits of output from consecutive outputs I think you
can trivially determine the full state using (almost) 'school boy' maths
that could be done on pencil and paper.
(Most of the work only has to be done once.)

The underlying problem is that the TAUSWORTHE() transformation is 'linear'
So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
(This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
This means that each output bit is the 'xor' of some of the input bits.
The four new 'state' values are just xor of the the bits of the old ones.
The final xor of the four states gives a 32bit value with each bit just
an xor of some of the 128 state bits.
Get four consecutive 32 bit values and you can solve the 128 simultaneous
equations (by trivial substitution) and get the initial state.
The solution gives you the 128 128bit constants for:
	u128 state = 0;
	u128 val = 'value returned from 4 calls';
	for (int i = 0; i < 128; i++)
		state |= parity(const128[i] ^ val) << i;
You done need all 32bits, just accumulate 128 bits.  
So if you can get the 5bit stack offset from 26 system calls you know the
value that will be used for all the subsequent calls.

Simply changing the final line to use + not ^ makes the output non-linear
and solving the equations a lot harder.

I might sit down tomorrow and see if I can actually code it...

	David

 
