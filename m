Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841C420C474
	for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 10:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641789; cv=none; b=Fpm76gOmtZewKFopPs2FwpDftf2gQCNWDznVllr8BLS8M4WQBPZGn8wXpezihZIKfZdGo8urcsGYiEKp+Zz4rlA8NLbkJkI7Os2XQV8w5iZLlQg4RoOOC/F3UEZ9ac2FpCtzczslEBVEDXMcYJpKZQHhXJB85A6q2Vqs7UET0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641789; c=relaxed/simple;
	bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=feBjf6ZHwnKieqvC0tuVbuxQfjjvH0yluCZqiEJO6c4ddY42Z7IyJya+W8Atwun7zayIZJ0BvFD3TSUlWWjvfIcAtwOhe42m4GPmuNBwWH8skCqE0b0x8M6OLN2cy2DduugY7tc0T47UpJb9vWzik0lp5GKyiQWdocWpTJd7AD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GU4eAf3h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GU4eAf3h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-430576ff251so16208365e9.0
        for <loongarch@lists.linux.dev>; Fri, 11 Oct 2024 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641785; x=1729246585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=GU4eAf3hL1PCWPwppVO7JbHw6HO+VnUSRr97jwNBts9N04em0YcMaOJwngD4UDdtyg
         XwdNyBMNXKAgRv2eDI95+iyljMsVUgyuu67/hwRU2T5eu8hCKNmy4MgE76E7NDUcj6at
         hZOpxPfCJxzG0PYVUldOnyGOoji5Pbjmovzokgqn1iH2xPoLVwwTjh9EoUwPeiHe+h0Y
         C7YqXa8+KwE13I8Z2PtZMtOOAcZyrvgLyhIDkeZ4PKarAKFllOc7Ba3XN46S0oSpqmFv
         rr1U04cw81Vb7ke9cLayqXVV3b1Z+iXZFDd+n+64/1OvUVZ6/c/Z0kuSJM1f38AwMsbs
         L8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641785; x=1729246585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnRcOvG00eDk9unXV1hgFBknglSVE5O1qDH//99Y1Rw=;
        b=WnhSnUpaI2DYDbAcWLM5LJDHl5CvpcnQk3oEQXlTPiUhfNZXAe4ANm3t8LxpxsbqP7
         fHHKfD3Bgb9t0oZUmFSHtoOtql/hYeLAIEutFHcpJ88OtKEdHWwumxLO0DDakciLAH/S
         uoXl1FwvvYjdeHm2/bbBAYxurkshUPWQqteHD2Lv6p55NdfdwMN0hpj2LDGWm1sfMArW
         4uEoEdwCzDOVhJXAWwjqVEwHmoDqgATCSGanJhzCgTmGmXL3hkNVc+SKQXlUxrKM8G5r
         jORFJdxd6kKvlfNDA8E5td5K3avOaXMFlCvbtGmVz6EDNFEN6LTQjfSeW9IvVhHXoFk7
         GnVw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUm9QAQdqHy7XJgzfvkK+IRngAIKKj3LSLLZBQGJjb3/A28W5UUsWl6I+u4X+VPrAnUHCfn5lSEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkG6AirQN5vj0u8JAkBghSb0vh2wcpXy1KxOUbWmeaLIeQYdVr
	6QRmHLnQibJUpsamqKPl0ocxyVxrgP0jRr3vAjB5wgyblBqLSOj2t9RkNt0KzZVpNgx3ANmWPuL
	qdAcufTRErrZwhewNH6+OEAiiDHSVml9UqOHQ
X-Google-Smtp-Source: AGHT+IGMNjtCG9rpECyAAco9DzsrUijuUFkuK2ogFVx/VRCgWggYYygWbJym2kgBDSGBNFLXnFb7cUmfBa/gllnaBLs=
X-Received: by 2002:a05:600c:4e8a:b0:42c:af06:718 with SMTP id
 5b1f17b1804b1-4311df435e7mr16515715e9.28.1728641784578; Fri, 11 Oct 2024
 03:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241001-tracepoint-v9-0-1ad3b7d78acb@google.com>
 <20241001-tracepoint-v9-1-1ad3b7d78acb@google.com> <20241001211543.qdjl4pyfhehxqfk7@treble>
 <20241010154320.6d17ba69@gandalf.local.home>
In-Reply-To: <20241010154320.6d17ba69@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Oct 2024 12:16:10 +0200
Message-ID: <CAH5fLgiW-AEN-YN3YoW66hV2w6eEP03OC4oefg0N-tdwyLx8cA@mail.gmail.com>
Subject: Re: [PATCH v9 1/5] rust: add generic static_key_false
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Thu, Oct 10, 2024 at 9:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Tue, 1 Oct 2024 14:15:43 -0700
> Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> > On Tue, Oct 01, 2024 at 01:29:58PM +0000, Alice Ryhl wrote:
> > > Add just enough support for static key so that we can use it from
> > > tracepoints. Tracepoints rely on `static_key_false` even though it is
> > > deprecated, so we add the same functionality to Rust.
> >
> > Instead of extending the old deprecated static key interface into Rust,
> > can we just change tracepoints to use the new one?
> >
> > /me makes a note to go convert the other users...
> >
> > From: Josh Poimboeuf <jpoimboe@kernel.org>
> > Subject: [PATCH] tracepoints: Use new static branch API
> >
> > The old static key API based on 'struct static_key' is deprecated.
> > Convert tracepoints to use the new API.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>
> Alice,
>
> Can you send a v10 with the added acks and whitespace fixes as well as
> using static_branch_unlikely(), and I'll pull it into my tree.
>
> Base it off of v6.12-rc2.

Here you go:
https://lore.kernel.org/all/20241011-tracepoint-v10-0-7fbde4d6b525@google.c=
om/

Alice
