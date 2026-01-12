Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515F358D07
	for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224985; cv=none; b=TZ5jahGxbn2ib2GY/E6H7k1XxSjMQ+NpugUYKc0D1wLOUMfvS7NvokTLpPfqAbLw3Hwh4SH3zFIsBmamhtBudaS4+iPH88//zMUuCVg8hHPOi+Fpev6xL/GnjBBb3mH1E0z95+f33jtI8S9xASSrWgj4syNewWc3oaUOUgXgY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224985; c=relaxed/simple;
	bh=aaBMsDaRPA4eC7AULe89WndPY2/JAXufqja2AvkHIwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JeEOoSMyU9vPWrk45/Wxu2sALWhOcdeMlmumimkJQGpAS9kAb5VVTcpqiU5KdBkpXp7DjmJIbWKrpzxzgwYyroxjwwXNMAw7Kr1wjDYdc8yzPRbfyzWLasGEPRZd+Y6HqzTdJ4DGbloWcvfOEUwF2zEMGZ1/w0i9YobxhukErxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwlSTktw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwlSTktw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3025069f8f.3
        for <loongarch@lists.linux.dev>; Mon, 12 Jan 2026 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768224982; x=1768829782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=UwlSTktwfWLXns4RXGTrnApxlmNoe3B6cxJmrl0WF+mg6/sdNhmzfywG9ggcDMFXr3
         jeh/vOR8yYpXCSW8hyIGhvpbgknYW2AIoeXG7OE1rSJ4ZhYgeHRM3N8Idv3s5jlRsWfk
         CWsaIOqLwAEomIc7IU03m75i+UdGCx1Rv6hfGZoBlpcojQ3oPyDzt0zTm4YlhTtBPjys
         LXjAM35uOtv7XxhiSARwzbuQtSlaYDNPHSAtVJoehdDqI2wSy5DhQXpsC4eujhzgLY4g
         EihyuJSAZDNsAmYe/JVqtmbsOntvCaonBJck/baha+eHs9pW/SWJ6xOoNRiF0K44TQ21
         qxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224982; x=1768829782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLo3Abz9wAwu25esY4s8FeJ9KMDvXVIZnqcKTN+SMTE=;
        b=cg+IGpwFgsVLarK5GR7BHxhkGZiTeDhLbcLxPCZnLhbrWrJj77AhbGuWPidJ3spLyM
         sR4KzkeJzEPayVNa6Vqb8aD6mSOQWFVssr2nAfnAPlNZUjdY5e2hjVSi8EeXlBujcZRi
         ubA+RKTnAUiI9NHdpxyqOHaop0Mbc4rVVAyqAJz39e70CHPh0YcYwUloPgb0fbqo5cgG
         fXglDP9Y6Ke1Z76N40/ktq38H9Ja/xWN0kusRqCC330g0vB1PKH60EF0x7yKFTz82lkf
         SnNRd80xz+DrTy7fSHlMrPzfuV4UWDkgZLo+81eE2IVeE9UTNIy61bdN5H8w8Le6Q/JQ
         wscA==
X-Forwarded-Encrypted: i=1; AJvYcCWeUuKsyx2grLAJQ5tGSfFfcL/mByX6TfM/RutjNQvAPZtgSuGdJ7URn3XN0bFnhdveyvrfqLOh0xo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwd/tzoo8DN3GaR1RCi877RErhqsgldHa89BT+fwTjindZ5itM
	bbDCTlwmUWiqRoqDw/o/eo6/wzSvfAkfg7BaHbV1MTHE/kSl8pwMxj9s
X-Gm-Gg: AY/fxX73FLAaH01yeCO0Bg7Pu8vsG/RxNufbzPs7fm6Q9fnLVkqruuORSF5xR5pJHod
	pIDMLR1OzAUgEilotvGs7uBryoAF3YwXZVzsk7WxW/3zMnMLFrvrliSbqf+PZ13lvTnmgzrfTzy
	64E54q4jtQNRJoPnXpL3WTRBC/eNLUG+LPIp+Q+JyYwidxsHJsD4EFy9TxRbVpJctkuNhvS6RCf
	me5pT+fIFmF746Oh7MshQBbQpx05+c94Tl2pbhdqVOsjzQGpy+TBCfCw/jZuYx1+k/JXe563Fqx
	hwoMFDMVVFFn8RL99XF5Lei5TxU23aDtAivs36CeW0pndWIoLNhckfVutSx0v8MVBOCjTLT7jcf
	zodPJOKCsewrH9bBb0dnhdu3UMZ0dMyniR9fbpL//0sPsbcoTp36P6R9EZTwpLPPuLo+RJAdMhF
	m6r4tSWJv1iwC+t/cPb7HPvILIyvIfJAhMlEAYLYCU5J3SsfzvedTK
X-Google-Smtp-Source: AGHT+IGyxiv2XFt49Pj+G/FCKb6Do+/qO1fvIxMUjWKWGTcpTcAtASoZtqcJMaJZUWyMrmC4TwCROg==
X-Received: by 2002:a05:6000:40c9:b0:430:fafd:f1d2 with SMTP id ffacd0b85a97d-432c3628374mr22009793f8f.11.1768224982426;
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm41054434f8f.24.2026.01.12.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:36:22 -0800 (PST)
Date: Mon, 12 Jan 2026 13:36:20 +0000
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
Message-ID: <20260112133620.2863e1d6@pumpkin>
In-Reply-To: <09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<20260107140533.2b3c46a1@pumpkin>
	<09de87bc-d952-41e7-9657-852c2924aaa7@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 12:26:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 07/01/2026 14:05, David Laight wrote:
> > On Sun, 4 Jan 2026 23:01:36 +0000
> > David Laight <david.laight.linux@gmail.com> wrote:
...
> > I've trimmed the initialiser - it is very boring.
> > The code to create the initialiser is actually slightly smaller than it is.
> > Doable by hand provided you can do 128bit shift and xor without making
> > any mistakes.
> > 
> > I've just done a quick search through the kernel sources and haven't found
> > many uses of prandom_u32_state() outside of test code.
> > There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
> > bpf also has a per-cpu one for 'unprivileged user space'.
> > net/sched/sch_netem.c seems to use one - mostly for packet loss generation.
> > 
> > Since the randomize_kstack code is now using a per-task rng (initialised
> > by clone?) that could be used instead of all the others provided they
> > are run when 'current' is valid.
> > 
> > But the existing prandom_u32_state() needs a big health warning that
> > four outputs leak the entire state.
> > That is fixable by changing the last line to:
> >         return state->s1 + state->s2 + state->s3 + state->s4;
> > That only affects the output value, the period is unchanged.  
> 
> Hi David,
> 
> This all seems interesting, but I'm not clear that it is a blocker for this
> series. As I keep saying, we only use 6 bits for offset randmization so it is
> trival to brute force, regardless of how easy it is to recover the prng state.
> 
> Perhaps we can decouple these 2 things and make them independent:
> 
>  - this series, which is motivated by speeding up syscalls on arm64; given 6
>    bits is not hard to brute force, spending a lot of cycles calculating those
>    bits is unjustified.
> 
>  - Your observation that that the current prng could be improved to make
>    recoving it's state harder.
> 
> What do you think?

They are separate.
I should have a 'mostly written' patch series for prandom_u32_state().

If you unconditionally add a per-task prng there are a few places that could
use it instead of a per-cpu one.
It could be 'perturbed' during task switch - eg by:
	s->s1 = (s->s1 ^ something) | 2;
(The 2 stops the new value being 0 or 1, losing 1 bit wont be significant.)

This one is much nearer 'ready' and has an obvious impact.

	David

> 
> Thanks,
> Ryan
> 
> 
> > 
> > 	David
> > 
> >   
> 

