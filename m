Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4CE287265
	for <loongarch@lists.linux.dev>; Thu, 11 Dec 2025 01:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416429; cv=none; b=qmLz7KXr4HplP2uvBY1lbUgdyibuS9He51dW0V0WI5J9KAxjthldvsMV/vq1jddea2QrK/CxkfxfDX2HJMiQQcLcoWMTuqDMilhne7n7NQJeYN2hcrhX2TBmn6nI4gDifkSoExBBQSrirrsSAZvf0+CoELMJlZPihz8F3rmJwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416429; c=relaxed/simple;
	bh=FtvR3TcXmArFBAGCWvI7194TwzmNDHpOH4im/F1ixdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPyvyInNQxWxjdUWzGXOFGEuR9YCHu9isuq3/aF9iFz5r5b9LacKestNjjoRScD1Aqe5HnCBaop1fqeOdKTNHu5W4Q+Nt2B9zED36HW+oM5Rg6Gn6Do3KXffl5KDrZ7ZOCyo4hillCHlNAkcrpLCF17qv23ya9EDypm3gBUN+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHdCyegv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHdCyegv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2d44c727so145804f8f.0
        for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 17:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416426; x=1766021226; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg1YsISuOnCUtqvnZMML82MlmfwHoeNJCmajJONCOpo=;
        b=zHdCyegveYm0PlIKwfuNtZL59nVahNJ/Zpd8fuJEHaNLS+DKXevR58r02N9kQQn2zO
         US6n68edE3DoeleFM1uxLVq0n4XNZy2h9PgHBFG2hGElGYI7cdyL5F7dJIFlZAyhcwSR
         BC4KJqN9WYop2FB8M6blVyx7iQ3NEO5f9l0DrlQPQhK0rD/HtrH7/x2xoeIlen6SZ4/E
         x+lttqJfev9do5/KKg4LBb+YFDuRIlRRCpKpneAC/4pc/uacrplvYYQeDLKCPZg2yk87
         MHYRZdWBUfX//b/ntl4L2zlF73/gC9Q4Zpzw7LQa1tLVksZA8jZzEtnLEkywMy4WNOp9
         K4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416426; x=1766021226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cg1YsISuOnCUtqvnZMML82MlmfwHoeNJCmajJONCOpo=;
        b=tgLAFxVbnAewxv5iOn0TK6JuABH5E2s64i/aQmtwlJPq0Y99AUCKA2CsIqe0NNC0BD
         nht59ZeIHuIIfHFDZLlY0W8jK2hIG3GHVcl1KtlqhWHZGUsZS0hDyYsTgzk6/dPOM7pW
         KNo5XexOpy/j9TZxrNDOpUGj9UyDLL/z0MNJDELAW6mwWb/PZobYmtegHvQRzBEd+xa8
         bVKRI3fVU0mlb0EJoL7Rg1Jf3rDJmg8mmePCJnf5UJZFRk+xgYwHGc1rUiERbCZ5YVyL
         ZdWHjxqPcKpwpWOoXTvQHekSbD7LOOTrW5Q2q+l0RE3WH0tFemJBboKP8eAARTxlFK8P
         bm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+lxxkh9tbpilkt2OOlZGONBAohuAzTHNMLIUrtZaBGavOEDQdWAdo2Kn5HdrNIVvenNBQt/gCNs0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjTVsVIovtsbEQPhvB1ZJOtdPQGwTvqc8JB+2MYwWx+jePJ5tS
	ObzzLLmZRlL5xFE/QSahawc5M3s+K2R+ANVycy614RZRxhhgoaIChTXEQVoIwqiOtsoq/VBVtqM
	RV0UlDXo6VpoTdoOpVaLfTLp+pGKQAkq2Nzg8xbil
X-Gm-Gg: AY/fxX61cQ1Gqo5Wf8goqdBcS+2laNkp8TVGN9LKx2GdFNSEONklWbCBOJtX6zVQav8
	R+4DCTb5Xkx9N6iu9JjhhbmbJ+obCLNhucvPwFL4OzJt3AQ1dWrW4cqCVJL53dT5SbTQ6ZgAWQC
	aIaPV+VAfGXI+f+QGAGEXcg3EljE+uDbeES0kPGb4o01cPoc1mBFQn3p09Rgzvxp6dYIVK0Dhfw
	7KwliaSut3BdagAm4FK6CJ0E9Au/T+kaAAYyZtXiuCWiBzqgQTx+mtbIkJJ4hic/q8GIWlD0JET
	wQIBt1x6AUu3SC9EJUyYPW9zffNQcA==
X-Google-Smtp-Source: AGHT+IEkPrObU4LOsralZszxoL+/0wR9jmBsyTvSNG+zgAyCHSCocYJceeycj2ERlpWd+v4ydylPnqE5DukdwysBKgo=
X-Received: by 2002:a05:6000:2002:b0:42b:2dd5:42be with SMTP id
 ffacd0b85a97d-42fa39d9345mr3567379f8f.8.1765416426005; Wed, 10 Dec 2025
 17:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
 <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com> <aTodMdEWuXQXuLyy@google.com>
In-Reply-To: <aTodMdEWuXQXuLyy@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 11 Dec 2025 10:26:52 +0900
X-Gm-Features: AQt7F2rK7pXCmA7VyJjwGa7eI1ghKkOyj9hqhJdsTRSoN7q4YTUxXw49mbaTXa4
Message-ID: <CAH5fLggC88btfpe0Z+4+AB2SRWRwejCk9afVSymMDUzKE-7DvA@mail.gmail.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
To: hev <r@hev.cc>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 10:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Tue, Dec 09, 2025 at 08:20:46PM +0800, hev wrote:
> > On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > Hi all,
> > >
> > > I am seeing in mainline loongarch64 defconfig+Rust the following buil=
d
> > > error [1].
> > >
> > > Cheers,
> > > Miguel
> > >
> > > [1]
> > >
> > >  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `binding=
s`
> > >      --> drivers/android/binder/rust_binder_main.rs:317:38
> > >       |
> > > 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
> >
> > It looks like the rust binder driver also needs to handle
> > !CONFIG_COMPAT. Here's a reference for that:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/rust/kernel/miscdevice.rs?h=3Dv6.18#n410
>
> Yeah, it just needs a `#[cfg(CONFIG_COMPAT)] like miscdevice. Do you
> want to add it? Otherwise I'll get to it soon.
Oh looks like there is already a patch for it.

Alice
