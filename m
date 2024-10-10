Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20E1C5783
	for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563374; cv=none; b=jgwvepnF9/YkoHr7SSeqgZD7wneQKzOTY+HInE+k3f0jLRXg+fWz+d5nksegwJ5y9h1BFaih9utKawiii16UcgouYKCeD12y55MPAq5jfeudHiKoObeN3YsL5RqdpHxLhpOzD17Loi093v1pJvijdHmXT6kRAWlScyZylF4MjwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563374; c=relaxed/simple;
	bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2hHS1Zk8G2XNzO3sW/VT4JVYJ3o1H2gwBdezvVbmhVKB0McQC7H3qbSDjLX920lUMg3l3MqffK3KCo3257/e1aDa9hwjQwB+ueiAz/aD0lCogWVaBX28T/AfPAayZjA/nKH/8K3pG2vL5TQ88V3r6+ch7Z7OberznkG6Wj9nfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UjB0Tkg/; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UjB0Tkg/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d39d9f782so504470f8f.1
        for <loongarch@lists.linux.dev>; Thu, 10 Oct 2024 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728563371; x=1729168171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=;
        b=UjB0Tkg/Ju+M53r94rf/pm8kTdORfuEAxZZ2AJ4b8gl6teIpw88UHj/PoMcGb+cd1B
         bd5hWLX0otpfE8573y3u5j7yLOWGsMjBsxMLCYGcNJNCZjRsRl6bS3dWgLIw8B51s6FP
         31Fu6CP3wqgJp5rgRlj7WDNfUOaqWbJQBiYWbgL3cYBHel8CBlvAy1etl8vMOPEclzCz
         aWOik+4+1r2S5lX6GoP5PCrw+nB1ccn/HRiMD+e5PNgQV+CYqec3sCxRUTl4RChiLzb2
         9shwhMg+hN2kkAnETVHKn5sQ+qApUapttyIseb3MOCCXHK/IpO7UjsA9SeuGyNeY5WiO
         bvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563371; x=1729168171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=;
        b=WSRq1H2VPvr1MCot0fXl9uSDf14FasDpOE+Dovd+NEoehPydTEFWCqsxqNziYbKedk
         VO9Xgja3N8XDtpYZgkW/zBITqzoEO1E35TNinKXUEpPYNW5cKjRAY7NH6FP0+LK59AyI
         mjtJP7gere5+DzST8WcxIUjJrATA+lpLenvSQASQmLc/35J++2/3Ayd52A8NIvAHAqQq
         l3ITnnOBScAylwXsrWnINrya/318pjvWjHtnkJEjGTBZBZLFP96MUgolKnWsRstISRhM
         qJlO7/a14cRbXe4cNjqAwq+iM6Y+rAFC8+6qSax47edIRNwSwTkQQi8f+WNo3mRKCsNm
         4gNA==
X-Forwarded-Encrypted: i=1; AJvYcCVjhCSwGvXVqItbaqRs849FLqsOeTon+pb+cH0FEDxoMsmwMVZUI2E9EEwq61vdI6okHTAIih7AaEc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4UsxTJWDTpJvjG77fUP35eAAhKQfO781oIJNsQJk7F0xTWEuw
	9d1KMGmau2tNedJ+iMlcTvZrDxb9O5TMqzRKwor9fZ75NPJXPPd6343VipTLPlcGgPgbivievjj
	jfdQi+pmVH2YsS/pCUYi0HmrB2Hq/WPa8LrCt
X-Google-Smtp-Source: AGHT+IFiEOCz+4oYVsNQrtIRYCVjfwTQ+GKkrbG7vHFiSh58inIZVKcmGsdJT2LV421GZQdW2+IWPpPAN1a2dPbCsIs=
X-Received: by 2002:adf:facd:0:b0:37d:39c8:ecca with SMTP id
 ffacd0b85a97d-37d3ab23165mr3640257f8f.55.1728563370779; Thu, 10 Oct 2024
 05:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
In-Reply-To: <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 14:29:18 +0200
Message-ID: <CAH5fLgi_Dg_a+-+KfKgzoo0z8vF5h7JT9DrFccx9C80qitsg7Q@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:45=E2=80=AFPM Mark Rutland <mark.rutland@arm.com=
> wrote:
>
> On Wed, Oct 09, 2024 at 10:15:35PM +0200, Alice Ryhl wrote:
> > On Wed, Oct 9, 2024 at 7:43=E2=80=AFPM Mark Rutland <mark.rutland@arm.c=
om> wrote:
> > >
> > > Hi Alice,
> > >
> > > On Tue, Oct 08, 2024 at 05:37:16PM +0000, Alice Ryhl wrote:
> > > > The KCFI sanitizer stores the CFI tag of a function just before its
> > > > machine code. However, the patchable-function-entry flag can be use=
d to
> > > > introduce additional nop instructions before the machine code, taki=
ng up
> > > > the space that normally holds the CFI tag.
> > >
> > > To clarify, when you say "before the machine code", do you mean when
> > > NOPs are placed before the function entry point? e.g. if we compiled
> > > with -fpatchable-function-entry=3DM,N where N > 0? I'll refer tho thi=
s as
> > > "pre-function NOPs" below.
> > >
> > > There's an existing incompatibility between CFI and pre-function NOPs
> > > for C code, because we override -fpatchable-function-entry on a
> > > per-function basis (e.g. for noinstr and notrace), and we don't
> > > currently have a mechanism to ensure the CFI tag is in the same place
> > > regardless. This is why arm64 has CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> > > depend on !CFI.
> > >
> > > For C code at least, just using regular -fpatchable-function-entry=3D=
M or
> > > -fpatchable-function-entry=3DM,0 shouldn't change the location of the=
 CFI
> > > tag relative to the function entrypoint, and so should have no advers=
e
> > > effect on CFI.
> > >
> > > Is Rust any different here?
> >
> > Ah, no it shouldn't be. Sami can you confirm?
> >
> > > > In this case, a backwards offset is applied to the CFI tag to move
> > > > them out of the way of the nop instructions. To ensure that C and R=
ust
> > > > agree on the offset used by CFI tags, pass the
> > > > -Zpatchable-function-entry to rustc whenever it is passed to the C
> > > > compiler.
> > >
> > > As above, I suspect this isn't necessary to make CFI work, for any ca=
se
> > > that works with C today, due to -fpatchable-funtion-entry being
> > > overridden on a per-function basis. Are you seeing a problem in
> > > practice, or was this found by inspection?
> > >
> > > However IIUC this will allow rust to be traced via ftrace (assuming r=
ust
> > > records the instrumented locations as gcc and clang do); is that the
> > > case? Assuming so, is there any ABI difference that might bite us? On
> > > arm64 we require that anything marked instrumented with
> > > patchable-function-entry strictly follows the AAPCS64 calling convent=
ion
> > > and our ftrace trampolines save/restore the minimal set of necessary
> > > registers, and I don't know how rust whether rust will behave the sam=
e
> > > or e.g. use specialized calling conventions internally.
> >
> > Well, I was told that it's a problem and was able to trigger a failure
> > on x86. I didn't manage to trigger one on arm64, but I wasn't sure
> > whether that was me doing something wrong, or whether the problem only
> > exists on x86. We already have the flag on x86 for FINEIBT,
>
> I believe that hte problem only exists on x86, becaause they use
> patchable-function-entry for their FINEIBT patching (and use -mfentry
> for ftrace), whereas everyone else uses patchable-function-entry for
> ftrace.
>
> > but I thought on the off chance that it's not a problem in practice on
> > arm, it still doesn't hurt to add the flag.
>
> It won't adversely affect CFI, but it will open up rust code for ftrace,
> so I'm not sure that "it doesn't hurt".
>
> AFAICT at the moment this isn't necessary for CFI, so can we drop this
> patch for now?

I'm okay with dropping this patch for now.

Alice
