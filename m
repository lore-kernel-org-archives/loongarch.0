Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20571C3F0A
	for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728669139; cv=none; b=V3C2AjlaGEC0QZ+08DhGQgcT0gZOFXOa8CID9CkYwqPvWiuvHcWAt3R7W5dBhLkHAfDHA6GpuIH/nqgE9PU9iu8Ff2//VJTjcwEJyxiWeAHdRx/dUONTpK8wv7g8gCJAncOnkVR9sLwnsh6Vi3zH54uMGnjP/8TVnAsSfrW9jX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728669139; c=relaxed/simple;
	bh=UbA/iFDHRQ6qK3Ht4X9Feltcke5IsxxCQungku19kWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcjSdVTU/wOlhdFMxnP8FVwtG/K4zHaRP0vZz3lgcgI9zRj5+oV7QshGwCgpwhnHp6zGQkMfmHTsFWA+xpakxZi7KKn672CGAE4LpxiGXP1iMLJ/1g7MYa33LoItBSL0uH2VZ9WvX/NqQYT6R3AJeq0efQXpj2aPO7KeKR4DDQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=msv88HU+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="msv88HU+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4601a471aecso7801cf.1
        for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728669137; x=1729273937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFVu/0Ci5Drk+gHVAbW8VDcAFM6IjgK0BzGcAxp3FVw=;
        b=msv88HU+ojcdg278EP6ERc75vxctAHM1KZMAAyimzBtLQUhcvRA2jtheN4VMvUBWDp
         pFEmevRxRmZN9Nvc6CCnyCf6zwZOeEddy0hTet5cJ1CoC7lHnJ/EeRq+it2IqlSCCdcd
         qiD4F43/cT/QmzeFQUN/sEGpdiFKeQ9GUSbVqwbMW/637G3qFpK3+DZCN/DloUMjhUHX
         SyI+JN8+bAJ7Rv/q1wZxbNyxIrJRQBu9Jq5s8VvNHRHYH6nyHLK/88lX+NE0whT7SvS3
         lDV1rLQ4sFCWCIwvg21qcJNL90zFuZsdnWHIJWDCNo7mcnCq7yUxS0q42MCtwPm0jSIw
         HrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728669137; x=1729273937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFVu/0Ci5Drk+gHVAbW8VDcAFM6IjgK0BzGcAxp3FVw=;
        b=xAgRTfeROqXjAiio7kXGUyMYXoUI73L74O9hNtlcZQE3iLN7oWnhiJv+h/7GZ7E4fi
         BUgMddUzZnv4BfccEak/Y5gqVmK3F2mH0pgLXvDhiG790WVXjTqpldEauCJBk2ri0OAj
         3aH78GJIElcwx+6mhhWDyKn0CC6zWWT2bRFe3yHBNJShwJ+dOy55Qkey9AytmXrm0amf
         +tnOpFTHUcQIVgZcOzKyjlZr2CbJznrwzdNJ0fQBv3+G2kA0+Euyf/s3G8e4Djff8e4C
         aTHFSJmeg900/HoFYMIgzFUdEhyirlJpaAOqAqSwRaUAlHCIoVh0egtr1oH5iSPOpr47
         V6eA==
X-Forwarded-Encrypted: i=1; AJvYcCU/w0KnLyngulH5hV1xf6nFzbAEuVGgMq3T5+BI122KZ3aduxwvS3c/bGw/7w4YjA9FhOln8YIWAuc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Z8sfhTabCvq7jYWTJmWO7HY+QFAjcuk48E1g26DfeF0EImMq
	y+WU2sp+aWnrx4BjKqEfXd2wR3WTwFoSiB/8lrDIvgf/mcbf477stxYOHHvF48rKPr8s2o/8iRB
	fnt3K7gdyTCmJwphYQ64QSVCjyDQ5VrTaIzXD
X-Google-Smtp-Source: AGHT+IEEPPLA8HdfmHuDQ6n+ZWN9VIwgJKQNohNKF/6PyZg/dJQ0X34S6H6r+67M6aytOK48Tol7C6iHV8tyTZjxViQ=
X-Received: by 2002:a05:622a:2d11:b0:447:f108:f80e with SMTP id
 d75a77b69052e-46058edff6amr144611cf.16.1728669136519; Fri, 11 Oct 2024
 10:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
 <20241011-tracepoint-v10-1-7fbde4d6b525@google.com> <20241011131316.5d6e5d10@eugeo>
 <CABCJKuesYQWvfScFaqv_rW5ZqAJNn4zK9iOFAmyTaYKO3S5hgw@mail.gmail.com> <20241011171251.0bd53f01@eugeo>
In-Reply-To: <20241011171251.0bd53f01@eugeo>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 11 Oct 2024 10:51:37 -0700
Message-ID: <CABCJKue7qT9drhgrXPEjBO=gPw79vYELAZxz747Z8WMF=vj2MQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: add static_branch_unlikely for static_key_false
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

On Fri, Oct 11, 2024 at 9:12=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 11 Oct 2024 08:23:18 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > On Fri, Oct 11, 2024 at 5:13=E2=80=AFAM Gary Guo <gary@garyguo.net> wro=
te:
> > >
> > > On Fri, 11 Oct 2024 10:13:34 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > > +#ifndef CONFIG_JUMP_LABEL
> > > > +int rust_helper_static_key_count(struct static_key *key)
> > > > +{
> > > > +     return static_key_count(key);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_static_key_count);
> > >
> > > ^ Explicit export should be removed. This only works because we didn'=
t
> > > remove export.h from all helpers.c yet, but there's a patch to do
> > > that and this will stop working.
> >
> > What's the benefit of removing explicit exports from the Rust helper C
> > code? It requires special casing things like modversions for these
> > files, so I assume there's a reason for this. I asked about it here,
> > but never got a response:
> >
> > https://lore.kernel.org/rust-for-linux/CABCJKudqAEvLcdqTqyfE2+iW+jeqBpn=
TGgYJvrZ0by6hGdfevQ@mail.gmail.com/
> >
> > Sami
>
> Ah, I didn't saw that email, probably because I archived the mails after
> the patch is applied.

Sometimes you might get pings about patches that are already applied too. :=
)

> We're working towards having an option that enables inlining these
> helpers into Rust; when that option is enabled, the helpers must not be
> exported. See
> https://lore.kernel.org/rust-for-linux/20240529202817.3641974-1-gary@gary=
guo.net/
> and https://lwn.net/Articles/993163/.

Interesting, thanks for the links. It would have been helpful to
explain the motivation for the change also in the patch that was
applied.

Did you consider using the preprocessor to simply skip exporting the
helpers when cross-language LTO inlining is used? This would allow us
to use the existing C build rules for the code instead of adding a
separate rule to handle Rust-style exports, like I'm doing here:

https://github.com/samitolvanen/linux/commit/545277e4d0432dafc530b1618f0152=
aed82af2f5

> It's also quite tedious for every helper to carry this export.

It's just one line per helper, but sure, I do see your point.

Sami
