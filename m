Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674013D646E
	for <loongarch@lists.linux.dev>; Fri,  7 Aug 2026 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141170; cv=pass; b=nNWo61uXkyaqxOcTmP5CUcTYs63NN6xFZhpHOLHYIlfDOU3TkWEQF+i0JsP4uHzn1wy1hq4bnpNJYO15gc0Kel/d562vDECiQC28YOCWuW8nwBj9TTzUbA0b6H4mbrI83BqS6wmE/LdLAmGv7KG8i8RLFF0/ajypUzlXRmO0Q48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141170; c=relaxed/simple;
	bh=e8Y1Xf7NJBWvn3GcoXqfY0ReAr4Anku3u7aZBDyqicM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scP3BsYjcLB0RINlT9kEGiH5NaU9/jLd3r3UiwJNmLH84YaCleFQPIYiRdbNWhXPFiJkFNlos+4MyEjJWA8Sp2FwYf8/Eczge4evOBb6G6ZVAhcLqQlxveQcAD9eZ9AfJFxmkyUpW54XNslqZIdZyPIVUz3xSTCF/OmHIUXmAC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmiOav4A; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmiOav4A"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf49dc28ccso157985ad.0
        for <loongarch@lists.linux.dev>; Fri, 07 Aug 2026 15:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141169; cv=none;
        d=google.com; s=arc-20260327;
        b=s1YwfD16jFzPj9AMuCb8QKcvH/Pv+RNnIs0DJVcWLrBN5OTjLkDRmPWuij5R0Yfbe5
         Wx8FpdWgJcuGqHHz5uowyFWcnLSE0TBPhE6JPtJcGmARYf1NboPjd9eBzUadX4yym2mF
         Z2gaHBSfdgFiGsSkDKu95nq1n/Bahz/c2YxshU33oqIoF3hxQ9kLNRecjS2tXI6j8Wzn
         JeEViLD0Yq0mPT+eNZL5XSEjZt33WubhdF0nnu/+B9I/BwVLFuP4q5ll4Hbd0I1j3I1k
         IxQNwLdydbtXzO8rSUykPtnhBnmAbSLwTkF9prT4esN6TD//l5RheH1B7fsAoCBznfxN
         OAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        fh=DVBiSahlZeGV0GuhlzPvHoplF6pXmJbhVEGfs6nA2W0=;
        b=V6YWhJKOq3EqS8rbIwyY/R7Z72vN8jXz64Yi8NyeHQmRt6aiiFLPJJlLFy9iziChQT
         cgM+lhAriJ1+AJCTFl6tBPr0xYm6MXRe0kiWugNtcZmaVouD4zV8i5urQ3LE93u8/3wg
         Up1z45Dr/WRa2TM1Eq2ZJ0fy1LwLV63dB/QgqxTV5F3M1zI9+FYu7qHWvCpplip1/QlR
         6dDsYTjVYE0xtKqdD6xCyh1phkriTPsw1i6B9Rn/7eu4RSCg6ZBpVhJ7hDWqtiUGo5aG
         giU4R9OglPzy7VCtmyBzLjpweP04doZIKlVDzyHsixQuVzOIKTVN/1eXcQ5Ad0z2bUoa
         jQ4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141169; x=1786745969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=YmiOav4AUwxNTa+yDGmlyMTOiHLZpNX6QDaOlZN6iA8Ka65rH3wQxwwt/XvoR2yPdT
         bmSMk0WWZaOoM4p8Hd4bpOFxbbSqNfGwJ6yioRiC4mcGIfdyqOIrbTbf3sCISJZDjAhT
         1WzRd+JB7aCA0eqKaGqq164hAHo5nVUKIIZE2NFgRBPnLOX1MsYfIb5TFUIdLATsFB51
         UhHvz8OmEeYBaF/Aw5teGtg8Wx1sCu02BKIUgQes++QwypTCn8lb1RWGWn07E5iNbJKy
         7/tPfd3DIPTEbXV2guANPW5V0/kKhnfLfSqskC3yjEjgZqXx990eYswS0QqnuOlD526q
         n4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141169; x=1786745969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=istCBJIb25EokFV0uCELEuPod+qhXPUVdJGngOk83YbuHL2Fs51L2+Ksx6W325JKSf
         RUbCEosNZOk+kfV5D9WYVkxTW/lbav605NgmP6vB6q7Hdy9sOtueFKFTJmPrlzylstY4
         tICmq0Qpu7k58jKjJuA+15y9BgupXSxPhWV89CJYdFz1BFtMQspK9ogHFrTzMJH33KMN
         Gy24EiABokQa3spqbMxlwH2ei+1NZ1ZbB39Em8K0TYrxuuE98gfY58tauEunDNV17g/q
         EdrkFW/Z1+pAlfoTEl85CsuqtL+vpAk+MNrIVe58eACaiarqKMADR8L5s4Xj3o/vZTJp
         bfCA==
X-Forwarded-Encrypted: i=1; AHgh+RqRgFTviHw9gNim09fJ9pUQ4WFQE5NXMfhl1mokD3t+/LkUxWQFhPyM/Grf+eXjKLOz2irvADNgQHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdfGTSZfVq0o63clfncdUI5PXw7W9D/RmClK6v+G/BUcWGPq7t
	p0TBiLQNUXedpMAgqc2/mfUA3SZ2ZeR7hP+jgT/tmI4GkYDSDsMP6yS3bGLTo91AKsaNfh2lmZW
	ycP3E2mfQCwEUPppV4h9d0EI4yQdaP9g=
X-Gm-Gg: AR+sD126z5ZLdpCzSERWrDbOeTEDk7SreiFeS8Kgjlfs++8Rd7CeFbeaZ3dLgMUTk/S
	PltLXPCP41TR1FmAY4cC5iUJBu8G5d3ADJyXaB86HuAsZtpl6oAaFG/2Z1W52dy4uHPBdSRwFDV
	oh+mhkjdhovCVJCiY6aCfJHY6Aq3O0cITIfls32YbcgBQnZhJ4SFF/tP6f2PU58Lt0A20cRwuY+
	CCt3mPKMfm0V9MMKfqDiN095Bq9S8x7zcPZZA+ShMZFJvsmQmv08xaY/bvSs8yqU0GX8NOK8gCg
	PclPwiFmtL6dDxI3IOMoJ0BTP6UmxNNP2QcXJyH04PULJm1VSBWLxaL5WNnGQno2UrGx6Y35Yhl
	rrRqcdwt+ErqFuMck7zA4TggGmfrbdbMp/BBR6vCkm4DATkXknQ0VswnwBfvG
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr199280125ad.1.1786141168638; Fri, 07 Aug 2026
 15:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org>
In-Reply-To: <20260807221429.155946-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 00:19:13 +0200
X-Gm-Features: AUfX_mwU-H5_dufTVjV8Trje33MyfE-Oane2tYYmAglrqJ8h4ShpzMvOIUP5krs
Message-ID: <CANiq72kz2Ec119ZW2uiu0-RPHr=Zy5-WRA5tSOYk5it6PqpH2g@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: Miguel Ojeda <ojeda@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:14=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> On arm and loongarch64, or under `CONFIG_BUG=3Dn`, the upcoming SRCU
> abstractions from commit
>
>   59cf3a5bda61 ("rust: sync: add SRCU abstraction")
>
> use `warn_on!`, which in turn warns:
>
>     error: constant `WARN_ON_FLAGS` is never used
>        --> rust/kernel/bug.rs:126:19
>         |
>     126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag=
_taint($crate::bindings::TAINT_WARN);
>         |                     ^^^^^^^^^^^^^
>         |
>        ::: rust/kernel/sync/srcu.rs:106:12
>         |
>     106 |           if crate::warn_on!(
>         |  ____________-
>     107 | |             // SAFETY: By the type invariants, `self` contain=
s a valid and pinned `struct srcu_struct`
>     108 | |             // and `srcu_readers_active()` only checks the ac=
tive reader count.
>     109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>     110 | |         ) {
>         | |_________- in this macro invocation
>         |
>         =3D note: `-D dead-code` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>         =3D note: this error originates in the macro `crate::warn_on` (in=
 Nightly builds, run with -Z macro-backtrace for more info)
>
> The reason is that `warn_flags!` discards both arguments in those cases,
> and so the `const` becomes unused. And since it is a macro, it went
> unnoticed so far.
>
> Thus fix it by simplifying by removing the `const`.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc to Tomonori:

Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>

Cheers,
Miguel
