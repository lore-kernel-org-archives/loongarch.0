Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50C450918
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 18:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934747; cv=none; b=EnQD/JSonU813OmPOyoJpRxYIBTUbvabfa0b7XingfXoTx3Z0zfnJctpp720KDnk4I+/LzrW5tcmcKm2Fuc8f+644IfV52a1NN6QV7bxZeQFW2+vkhrPBh83Oo/bGMMFlDJtHZJtPl24k6+U68JV84B9tZtx0QdcNM33mQAUufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934747; c=relaxed/simple;
	bh=yDbiboXvrRh+ivSKcybv8FalD/6w3BtuEBLuaJUmJwE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KTvujJSHhWUJVf8TdCs1/DsQ7b+RJLBA0ULOsGKruw/a9wSisior0qMoe+/96wuZhtAvWB6ywEZajgw0QxgiztBISPhEEEkF8qgVGmrV/ceAP8VBGpTUlYvr7OdmzR+Hh0mqShGPbJixHgPxV/7ft8A6y5MtK8H2bsa2U3cLstE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh+BoQxD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh+BoQxD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4358fb60802so65968f8f.1
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 10:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768934743; x=1769539543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=Oh+BoQxDu6tf0tCpKKUqV6RM9hMQbK0WtBKY98FzNvNqPRJj5xvOnMq8IlpmHDglyg
         77nR101RshebWyt/t2I5qRotUcIDE3wHikxWiJLL7NWLCTgWUs8hyyK/nezdAJ8JhqiJ
         Oyej4trZI0es35KnhO5P9pjxJMwfZCdSSc6ah5TV7OTxm4HbO42Eq2j3pFSk9PIk4w4b
         WU9CzLdJhsbZWRDw9HUTq/Tp24plYIUzYJ5X1LgyKMkN5MZ/LsNoU3uMf+QxLW9Nts5x
         COXohqgBiltDwthE9Dk+4XxZZXPYmM1/t6rNU14sPsvynUEA98GoTe8G6LROiYePdzmR
         wW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768934743; x=1769539543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=UsYx1fdKV7meKkf7Hn1nRLl9HEIFQEoF5JyOo0ykA4+TNkuVYxuTqziJvoAXS1eRGS
         zpmV9Y2euLBLzdGVRV3GXlL2VTsMVKJSHIFxDNYdDdXGAH68XLR/UaNovLZV/27WIi7Z
         v1+F6A9F3p4kv2WIjxSmKHjR8ZgWwUyc7NUAiYNt2/vPSwpWUXVqdE1hvBUqW8GEqKRV
         X14d4iQj3W0UMDKKf839Lb/LulhzWvzUtAvqMub03mKEszXgyLuiHcWprGZkQP9ogmUp
         yDwtgA3sxLauz+JxkcGHL6ipl5frb+2+RrlmVY12ne1lu6ktDjwOVsB4eCtx+cRTW81N
         ophg==
X-Forwarded-Encrypted: i=1; AJvYcCWfvRlsGaJIJOOyJ6Y6KMoxZTfMuoFXX662LBxLIrK6Rh8JHp+RCGJOHWz889bFCi/5HtqPDl3Ukog=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqWUet2GZ277XQusqKJcf6K3HssFuvtIo1PSQppgYagH5lE3D7
	rnmNQp+1eMy/d1TwTDFI6JvmacVYjal0RQ8Xt5RXMPteiRvbxRI/K58l
X-Gm-Gg: AZuq6aIa159SlqhdDWLGPfeJD/zAN561oiaRC5JsQQXt4Hj2QvWqE4ZX6rcv+C31TT6
	peZCGd0TfA/zmJkHNdWbO3jzMQRu3MUpHpM9/TAQ30XxTkvRmQoty41EXMlq0tgTZd+9S9PDReP
	QBIUNhrFnkv4wyBUgbJclq5qv320TrBaSEsEDlN3lPQ+5vynPZtcg3iiZsHnI0Jf4jtz123ap5k
	LzgWRFt4Di1WnZt/Q89ayRGYMT8sTjS7d3+n6sTMmattIsKnIscXWVr0/IElWyN8JS/0a1ID/Es
	o5qu28SBihPm42+nEngB/QzXvZ4I7tapNNvt/wlh6rOQ4q3gRGedu05C5gltcCn13eoVwEeArH5
	X9R8WhPWaLkgmLH6a8IFz/Riws4LlKyLTJVmJdqnFCT1Jr7z1PPIRtdNmFdq5glAXB5mAkbzFX0
	drZf66/uQGpwPpDPvKFzOx7e/qaENOrLxHtKvgT2+JpRWAzDOChHaA
X-Received: by 2002:a05:6000:2484:b0:430:fcbc:dc4a with SMTP id ffacd0b85a97d-434d75c16c1mr25592154f8f.19.1768934743113;
        Tue, 20 Jan 2026 10:45:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm30869735f8f.35.2026.01.20.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:45:42 -0800 (PST)
Date: Tue, 20 Jan 2026 18:45:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260120184541.0a463cd1@pumpkin>
In-Reply-To: <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
	<C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
	<785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
	<a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Jan 2026 08:37:43 -0800
Dave Hansen <dave.hansen@intel.com> wrote:

> On 1/20/26 08:32, Ryan Roberts wrote:
> > I don't think this question was really addressed to me, but I'll give m=
y opinion
> > anyway; I agree it's pretty binary - it will either work or it will exp=
lode.
> > I've tested on arm64 and x86_64 so I have high confidence that it works=
. If you
> > get it into -next ASAP it has 3 weeks to soak before the merge window o=
pens
> > right? (Linus said he would do an -rc8 this cycle). That feels like eno=
ugh time
> > to me. But it's your tree =F0=9F=98=89 =20
>=20
> First of all, thank you for testing it on x86! Having that one data
> point where it helped performance is super valuable.
>=20
> I'm more worried that it's going to regress performance somewhere and
> then it's going to be a pain to back out. I'm not super worried about
> functional regressions.

Unlikely, on x86 the 'rdtsc' is ~20 clocks on Intel cpu and even slower
on amd (according to Agner).
(That is serialised against another rdtsc rather than other instructions.)
Whereas the four TAUSWORTHE() are independent so can execute in parallel.
IIRC each is a memory read and 5 ALU instructions - not much at all.
The slow bit will be the cache miss on the per-cpu data.
You lose a clock at the end because gcc will compile the a | b | c | d
as (((a | b) | c) | d) not ((a | b) | (c | d)).

I think someone reported the 'new' version being faster on x86,
that might be why.

	David
