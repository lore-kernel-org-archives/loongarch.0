Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13B197A9A
	for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646379; cv=none; b=kd8BQQd46R/22KhGH5M7yw6OzMfFCURdM51mi48qyEDLdeU/mvCkAv776iUWk7ZaGODrNS59b/LgyXB34xrrAkbHeJziLW8iFKExx8WrNI9Rl+D7GmqpL+XMbzWpkNXH3alHV/mFeATfUQFnkYvWjlsXeGsY1ZpYJRlj1C1zpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646379; c=relaxed/simple;
	bh=az4hS+NK8zBr5UCFhRFct2ksVmIL42/RJE4tgtHk2Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OStks4/0o6mNrMyM5pryphE6dvtuV7U7d93o7zOi7DasIof1CCPSpFpU7elRCeDuTcSUfsNdH0JhOst+ORAH9kByjB0iX0mVuXWvZmytb0/zp99f3PMm9tBkPa03Br9uqZvrIdSFzqY1TqiYu8XIOgon5cCfDaGb7/eecQvlzB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atNoa3t3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atNoa3t3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9f377a3c9so149180a12.3
        for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728646377; x=1729251177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az4hS+NK8zBr5UCFhRFct2ksVmIL42/RJE4tgtHk2Hg=;
        b=atNoa3t3gjAMrQqX9TU97kRNsfrWZo/oheVOWjT0yQ1mhz+LOIshy55w0czBexTOO1
         8cx4LWgHy5iE8KmKP8oyVGNApoXU4UowjOONddN1fU9iQQoy2zsyIjKcLIpZwGK/OeGs
         Iz/xfcxW0q0XMWQehyXQIjrtQCy5WAyfu804nGMEKMBrx3LLvtE6VZIvIF2rx5taqMzw
         pdM5p23JqxRhRj/FDPVbP31Yy8B+a0MiY5IKJA1rDlEgUa7cSHw3tCayx6bfSWT8ZFuq
         e5yjKEMcSf2mGub8/hxCPE94uXkVbi8nkVr0V1jWMYlU/5wgXhUqJceXdF4J1GjDJ0uf
         Ck2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728646377; x=1729251177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=az4hS+NK8zBr5UCFhRFct2ksVmIL42/RJE4tgtHk2Hg=;
        b=Ee9JmEbup0vL/C8qPUvAGOd+KcVve/A7DeqKvHo6ntf4c+4BDiBFAdwN3fXD1ZLqLj
         yEAB8/wyLzlHHO9I7vUvL+xl41nO5MF45TIi3gkRUxxKxV/pLyZ0JnIMQtK3k688XxUy
         xq+6jGHvbZMbf+mCjE3LJ25YxgS4SplzYo+EaX5APfWr5cwOq/RuUynjT/T+ksAB72F2
         pUtVNfa4ru1MRVT/RDit2F0N5pYcKLHY5a2aiOUNdUzEHl9wHHmjNbAYXrRI6pnjKj1Y
         eRyui42isIyYH32He8o92XGHn6D4BKT6AQgyr9VuEiV5x4MfI5XLBCduwsBcXCwK+61L
         wmjg==
X-Forwarded-Encrypted: i=1; AJvYcCU9mNyb2jQrV7YnxD9sVed/jr7sJodomiULpvtAUksVWvGc0i/eP3ooLRLkvCH8MxpwQpgks7OUQa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgCg0AIUCmiP0hIwqBayWyucI7l63LdfOeRnJGLgkzn2MdRCI4
	+TuD+b3GAb4Fvsh5dZQpZNoq9fjrwK34KElidFr7K+Z5EGKCt0HmRFiOOu3TIiorhLhJl+6s7nu
	83XHKbqPDcL75dn+sBUbKlrNfGy0=
X-Google-Smtp-Source: AGHT+IECMXVvn0oo1MNjapLxNu2xErXjaCUcD29N0fsc68U7YJSRkD+W8Re/vBWLXWMsFfWDHfD0zZ1hSdE8Z8CiYOg=
X-Received: by 2002:a05:6a00:3e1d:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e37e25dedmr1609379b3a.1.1728646377173; Fri, 11 Oct 2024
 04:32:57 -0700 (PDT)
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
 <20241010130421.GG17263@noisy.programming.kicks-ass.net> <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
 <20241011105136.GP17263@noisy.programming.kicks-ass.net>
In-Reply-To: <20241011105136.GP17263@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 13:32:44 +0200
Message-ID: <CANiq72mYEbGxFZHQ_vfHTybuYO62As-23VR9yASo-b4LcZ_pkg@mail.gmail.com>
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

On Fri, Oct 11, 2024 at 12:51=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> So you could just copy the bits from core you need into the kernel tree
> and leave out those bits you do not, and ocassionally update them when
> needed, right?

Yes, but in practice it is a substantial amount of non-trivial code to
maintain and some of it is too tied to the compiler (e.g. using
compiler internal features), thus it would likely require maintaining
several variations in-tree to make it work across compiler versions.

Maybe when kernel has been compiling with stable Rust for a while, and
especially if `core` is split into "really tied to the compiler" and
"the rest", we could consider something like that. Personally I would
like to be in a position where we can try. Perhaps it could even help
to simplify gccrs' life compiling a smaller `core`.

Even then, we would need to see whether the tradeoff is worth it: we
may be able to customize `core` here and there, yes, but, for
instance, we could lose the ability to easily import other code out
there (virtually all Rust code uses `core`).

Cheers,
Miguel
