Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC131CB523
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571736; cv=none; b=HZPEDwIFJKtwc2zRJ20F6b1s/Qs+YDDP7LiZdQG9nFr2tQansvfI0S+Q1+7NhAscbgw7nzpfFoL9nNTeBknXwqHBBl5K7qj9amHhD36WXHoNYj8fjrcU7LoKnZpzvAZwJvuXbhU0K2T8teGWOCLlCUJpIfi9M2rtx5pwUoXJZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571736; c=relaxed/simple;
	bh=MD5Y1JFSub7m+UPd21beBuvfhWy8eN9Icl2C2agrsAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1fV4369kSldhWkeGM+aaDhD0wG0puQTFr5DoZ0fniUPThxgw1dD8fA36Ln9pFbr1ur07Iky536Hv69YNPovBQlu8dhGgxQ2tTVhAXsJKVG35bKrVl+MiSF7KGgvZmG+jTU8z2+bqUAM7d9NZjrqqRvoXI1fGcWbzkDdBYnuwu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONhuYHh7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONhuYHh7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e01eff868so86512b3a.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728571734; x=1729176534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk8mOEtaS0st9RtIbPiyvPicjXJuaraec7PuPjhsQZk=;
        b=ONhuYHh7Nyu3ioKbAqLliWVTTIAly7/f3g9VKJwkWET6A/g/8xUz04bQlBZLCAb3b/
         q7SLNrraKnfU+67VeHShPO20HtcKmOiMariCtcxUknWDLNW9XEppusEMVWAJZ1NohNw1
         gopXJqfj/sfgDMiLr07JIliFIlu0ScxQhbnAOR4Fr38brcJKem8vuAnoVbRk/4jhNCeE
         gytH03KBXutrXahE02lzeQrrEfUJgwRu1/4WOa6PsUW2CF8L4TaTtxjWJbGSUqHKquVa
         RJrMUfZj9El9fWgXL+l66mZ2Dq/bwEraMNCnjcJCOeffYd9hz1i1m9tacTdSbU+nc6+O
         JpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571734; x=1729176534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk8mOEtaS0st9RtIbPiyvPicjXJuaraec7PuPjhsQZk=;
        b=uTqoMWGtG1G2h9ItwxjgA6QBRZmmLzBgSigAGL1KcwvAytSFjUVnhVArJ7GIqg/NEN
         vCkft9MKTeMVcTd9dCGKIMJM85j+gA3/RxMcUChB6EFK1CPe7CCu4HZBPXtCFRgJIyaW
         IaMWmWN/qeLoduOmnOOi+MIldyQhj1naYpMxpbaKqDgEPVtPuSBqfyQzL38QEcQXSAfY
         csPU13LSMJ1CHQSuvV5aphuv9twW7tBum4hAis3aXA/exGWw5iaYBX4RS/aZz8ntce1q
         TBisnndOAFw5qKrFG1p26XuaJ1fwPff35+lIORwm37F04dFeiCJIPymkzuAuuYkRQCVw
         f30w==
X-Forwarded-Encrypted: i=1; AJvYcCWx6y6c3a8en8OiqnWO+Izi8f48w06G4cysLY1afL1CqdSolfcoMYtgFO3JUM686JFpifVu8/Gvh4c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyEaKljpm/PtFpyjuA9fj4aP+bEwu9qYjdiSfuP4NHH9gJFijK
	BTeBrTTIGR/0urIxyeVfRR4VOEsyEKyupJis59EnQswvbbdCsT/wBr4j9eVGiQpacUsNQ7FyBVK
	dWpwd5ptEt7rZAuApqDLm4JkMSnY=
X-Google-Smtp-Source: AGHT+IEljzpMu1ACQ6sQRA8RzgwL3HdCJr8K4MQxtTnAtECkzV3J/8bQwyLAxm6Zuns2qv11cRQg+5TXDKwx0rMQsBI=
X-Received: by 2002:a05:6a21:3397:b0:1cf:2be2:5e5b with SMTP id
 adf61e73a8af0-1d8a3c59cb2mr3823983637.11.1728571733800; Thu, 10 Oct 2024
 07:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3> <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net> <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
 <20241010130421.GG17263@noisy.programming.kicks-ass.net>
In-Reply-To: <20241010130421.GG17263@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Oct 2024 16:48:41 +0200
Message-ID: <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:04=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Also not rust-src, because for some reason you're not actually
> freestanding :/

It is there, but it is a suggested package, so I think you would need
e.g. `--install-suggests`:

    https://packages.debian.org/trixie/rust-all

Regarding freestanding, we use `no_std`, which one could argue is
similar to C's freestanding. That is, we use `core`, which is a subset
of the full (hosted) standard library, just like C requires some
headers even in freestanding.

However, I think you mean not even using those
headers/sources/libraries, which is fair. Rust calls that `no_core`,
but it is currently impractical to use/maintain and there are a lot of
useful things in `core` we want to use anyway, such as the `Result`
type:

    https://doc.rust-lang.org/core/

There are some things that we could remove, though, which is why I
asked long ago for ways to remove unneeded things for the kernel
("modularization of `core`"). We got `no_fp_fmt_parse`, implemented by
Gary back in 2021, and we could perhaps get more in the future if
really needed.

> Yeah, but then you have to first know that we have this file to begin
> with.

That is fair, but hard to fix. We try our best though: the "Rust"
entry is in the front page of the kernel docs already, and the first
paragraph of that page links to the "Quick Start" guide.

Cheers,
Miguel
