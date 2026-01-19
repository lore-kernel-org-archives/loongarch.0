Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3238E125B2
	for <loongarch@lists.linux.dev>; Mon, 19 Jan 2026 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825376; cv=none; b=mSpIFwvCIirE/nPs/fCEF2AtYStiD2UNpY51mxJdioCfTXMJMf1UYRM4yGgnGhOsM51QR99jlKIuf0VKr0GHNI51+UeuDFEXpIBWUzt8siwD2ki0waBKE63542HD6eV3EJ2ey5Cn+Pw9CCHIkbwMGarNgIsN3+ZsivanPvssbPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825376; c=relaxed/simple;
	bh=iL5a5vWD3elCqNsh2PkBrIKfV1bPfWFLdSevvtw348k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THXfbiwr1SD8lmLhq8SbZJKYkEdmbzSeOp2EVbQuIQVPVN8ak7ROuX2p1/Wv2PEFIRZjEJ2bX2brbCgp5oykg9eEMI4dMezOveN3X8brw6e0mwnmD9HqHder9TqNbNo39M7Nfaym/JWo7BVONUVGdcSOikMa+jDtNvJD6lMKH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoF5lxM2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoF5lxM2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so20180765e9.0
        for <loongarch@lists.linux.dev>; Mon, 19 Jan 2026 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825373; x=1769430173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=LoF5lxM2feU9Ukye9RG1D6Ep7vB3Qm94gvJ5VdvwXuXk0Lh7I8sPgUDfbcrCaad6hh
         Vy1W11ushi2g3Z4tMHZTjf97Ao/NI5yctAPNQ08ykfr0opBxYbUql0JcUiGCQ7MYrwFz
         jwgEgrTkQCwhsFfzscuvUx2YRPl8t1HQAj/Z1r0na/9rPVoWx4r4vZ3ohUZ0n5Uu5ePq
         S0cULVL/ObdvQ2KFGTOdlpA/opAv/k28f2isEiEdo01cyBTuarGB9qPxeuAAvcIV0YRc
         zJ5T3eidICVj1pAJhaw0qiQr4sWYhxm1XKfJFXb2nRRtRiGxn/LkWpchuSAB7113pKs9
         HlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825374; x=1769430174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=W74aa4kTS/Mk7nGX2PqsDYqx4AgnP233yBeRlhAiXPBqCe7FMi6UWh8/KRdPP3B4/g
         tqBxDw1eKhLD7VgKbVIJisz+DJbei3OS9oV/OvuUMXp826hLdIEbSV4pND0akWcDSVhJ
         qOPaNQlMyKPULpfoxYnabqAINoyHQQByyh4VcoTCeFYoyyXH6ADB5N4ATqyKalCBUsqw
         BzoJWqEIAWk0jMqh/7Ni82vJIvR3ECc1z4Il6XgHsUOahiK9SYFP/z0+iYIOvNJTKx6H
         C6jm0tJGAva532cYHNCK2fxsmq/tHqDu7N2rlA6aYpY/Mba5E1BBQu0FWh3RudlQJ/IU
         WxoA==
X-Forwarded-Encrypted: i=1; AJvYcCUwrs7RzgjtF14jC8XhvVtHiXZhiVL07wJf7qG79WfiWmS7iOrq9hBqREn/Cb7Zg6t6olu91EWe8bs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0mK8oQuTN5SvUtAR2HRBHU3ODY9l11cwcEZfN4aM4/PlflBNc
	QI4zZ2CHjCb4bcmOfYNcbb+hiBMMVgPRDmSsTW3yY8ZA9BqxtgaHDZYf
X-Gm-Gg: AY/fxX7G9ZaaWZCX800dE87Xg7Nw/8u0DUv8kH608CUJbahincyamGzxhAaZamRkLdv
	Jd7Q7a8JUYULZpS9OC8KJ4ljCXGh+lZQjiZWyr6WXgAeYf39iO6ocI4DVXYfOFv71B7krAL7Rk2
	2qNevm8IpB6FMrVbHStDlZsPYw0aJiXZ3EtTu9SwJwMHc4XN0iYR/4/ALUiQw/Lgp6sl5RX0TBQ
	U1PUO1cHSSYrKxOSAZmua820FKDRFcowAsiAorRR4cxVohnRhtBTfaFiYr1sWiArnGjqqGkoTHK
	0v7FVnPXCQemZ5gVcCFW0I87urF50iHsse7LN0Ft4EYjWqyhgVV1P27AWdmY6mm5VIe5m4scxji
	FCjs+GmkZYPKEP1mp4ox/AGqWoi03TwnM1TMvEZXs6DmVAK5rk6nXfpWfkbTIneGFR76d2JaFeR
	cNP+LmFf8DR0lrHpXH2WLn+2LX/lS+8Wpv6QOd7pEi7/diuYMcQuV+
X-Received: by 2002:a05:600c:3509:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-4801eab54e2mr107589925e9.2.1768825373288;
        Mon, 19 Jan 2026 04:22:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe67780sm78105625e9.16.2026.01.19.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:22:52 -0800 (PST)
Date: Mon, 19 Jan 2026 12:22:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260119122248.30974c78@pumpkin>
In-Reply-To: <aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Jan 2026 10:52:59 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Fri, Jan 02, 2026 at 01:11:51PM +0000, Ryan Roberts wrote:
> > Hi All,  
> 
> Hi Ryan,
> 
> > As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> > and, on arm64 at least, the performance is poor. This series attempts to fix
> > both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
> > propose a performance improvement approach.
> > 
> > I've looked at a few different options but ultimately decided that Jeremy's
> > original prng approach is the fastest. I made the argument that this approach is
> > secure "enough" in the RFC [2] and the responses indicated agreement.  
> 
> FWIW, the series all looks good to me. I understand you're likely to
> spin a v4 with a couple of minor tweaks (fixing typos and adding an
> out-of-line wrapper for a prandom function), but I don't think there's
> anything material that needs to change.
> 
> I've given my Ack on all three patches. I've given the series a quick
> boot test (atop v6.19-rc4) with a bunch of debug options enabled, and
> all looks well.
> 
> Kees, do you have any comments? It would be nice if we could queue this
> up soon.

I don't want to stop this being queued up in its current form.
But I don't see an obvious need for multiple per-cpu prng
(there are a couple of others lurking), surely one will do.

How much overhead does the get_cpu_var() add?
I think it has to disable pre-emption (or interrupts) which might
be more expensive on non-x86 (which can just do 'inc %gs:address').

I'm sure I remember a version that used a per-task prng.
That just needs 'current' - which might be known and/or be cheaper
to get.
(Although I also remember a reference some system where it was slow...)

The other option is just to play 'fast and loose' with the prng data.
Using the state from the 'wrong cpu' (if the code is pre-empted) won't
really matter.
You might get a RrwW (or even RrwrwW) sequence, but the prng won't be used
for anything 'really important' so it shouldn't matter.

	David
