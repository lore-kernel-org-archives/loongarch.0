Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D64E4229B0
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504716; cv=none; b=tW0p80kKjKsWDygxlIYd6zg9/12Na3XiyuI/kmQyGRrPS+Kk5uVebyTWd20quxLMcgexYmPWkw0dtwCRTya1rYRw5l2nN67rEamGtdtpb3cORpcYCse6bUxIt6v6o8Rpr2WXpR1HfBgDDidOh7CJCDy1XSzZDYD3gfyN8m3BUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504716; c=relaxed/simple;
	bh=nT63MBjGYKXTBb/NSuHd+oJTrFjNQs+xdTT7XV7D6U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOC9g2YUZcCOEczATYXLLHjULi9tIn8Nqb5gddbXtU6cwmINUDenkGU9HKiEyt+jxPoh/nZyvkXewSXJd+5hkl3IFhAJqc8QO8dacSjC7aNz40+rWtmWGU+N+J64At1571DzUrFe70EDKxAy90eAce2OomyTgiHpjJft95uhP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hoixS568; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hoixS568"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB51F00A3E
	for <loongarch@lists.linux.dev>; Fri,  4 Sep 2026 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788504715;
	bh=CrsDik+i/dqZ6n3D5e69L4gx5T8tSTpe8l3r/D5fJtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hoixS568WhHyYz0u5xdHJORIzc0XJOSda/Nt4wA1f51JJq2NoZr+T8MQ6cNjBSEq/
	 a29dssHaIINvDBPXBcBPL1dMwUR/elqI7MGHyJlwML1Lq1d98fJO6MghEPk9WKwvs3
	 V5rqria8mN8IJjc0xaeuuAzA1L+a+QF4kxa53zalhvoSAHk/uT0fBZf5+zGZuafSCy
	 7oc2PtkNOvYWlbXX1GEJFcNshj+TUqC1UqKQS0Sr7Lx6itxcLjpEH514ImSYUY2YeU
	 CL3q9DVw6fNKpRL4/ByelAbqiRguhcGveBu4g4fF5/2Db5zqhPUD6m0HSSDOBQNjnk
	 JRTbNmEAA+3FQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso959806a12.1
        for <loongarch@lists.linux.dev>; Thu, 03 Sep 2026 23:51:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywiyE6PV1lbbUCFCf9XOtEOieBCS/c/VIy372OsTrskBFxBHz5sAk8ikhv54RuCbfQ3yhtmZqjtJY=@lists.linux.dev
X-Gm-Message-State: AFuF++kGYClKRSKpSnAjkP4Un/7I9WfYjTijiTchFF2c7km9XfmQD78Q
	9MmB1C2fyhjVJSy8NyvLnfRM1x0aRVF7wSwYBRadBS5g4uHKAPfP7zM8xNgBKQhwuSXsQOsriX7
	Z/vrgN8TkaMlkmLnSc+w5MJVIAVRKNXA=
X-Received: by 2002:a05:6402:3886:b0:6a7:ea53:f621 with SMTP id
 4fb4d7f45d1cf-6a7ea540b62mr646655a12.32.1788504713638; Thu, 03 Sep 2026
 23:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
 <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
In-Reply-To: <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 4 Sep 2026 14:51:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
X-Gm-Features: AcwNN1WVbV3UVJPY6vBHMoHJf_6Z9XFAkSpgPnoM44jiVUQuUMOn41ZyOzStCwQ
Message-ID: <CAAhV-H6QzYUmoErGUFecF1jptYekkuy-+iZtDXvY82wbr7+V4Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 7:04=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Sep 3, 2026 at 10:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
> > for better allmodconfig support"), which allows Rust to be enabled for
> > allmodconfig, ARCH=3Dloongarch allmodconfig starts failing with:
> >
> >   error: kernel-address sanitizer is not supported for this target
> >
> >   error: aborting due to 1 previous error
> >
> >   make[4]: *** [rust/Makefile:741: rust/core.o] Error 1
> >
> > For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
> > HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN i=
s
> > enabled until the loongarch64-unknown-none-softfloat target in rustc
> > supports KASAN.
> >
> > Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Sounds good to me -- if LoongArch gives their Acked-by, then I can
> take it in the rust-fixes PR I will send soon; otherwise, this can go
> through their tree or Kbuild's I guess.
I queued for loongarch-fixes, thanks.

Huacai

>
> Thanks!
>
> Cheers,
> Miguel
>
