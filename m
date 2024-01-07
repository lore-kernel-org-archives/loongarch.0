Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A476134B2
	for <loongarch@lists.linux.dev>; Sun,  7 Jan 2024 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPKQoiOX"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6dc02ab3cc9so886635a34.3
        for <loongarch@lists.linux.dev>; Sun, 07 Jan 2024 06:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704637771; x=1705242571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGfKDZU2v02JYj8j4xt04rkLEro10sjs/HZeZU+mIfg=;
        b=SPKQoiOXyKxsL6d+YqyKIzv9tCwOYgv680eXHTMSFkSSM2v3k0yPnoNS1LfOXKJmpK
         GssI0T2vAqFCJLa+Wg790qF2yG9/tZClWgBTkSTTyhB4RrLViwLNctAmFrY41SH3vLrp
         i1gLHOsA7uR2USW5KE0tF+6blfev+AeFxNmhYQoB0D5CYO3bD7y28Os6sAPMKInX4QPB
         neJThMuB3X3kZ/1JYjxiYOdZptnuSQQ+co0lffdkE/oV1QeRd+aMdSvPA0A3WG21t8AC
         eReF4i8Vpj2iSiVMLB6Q8aN3wjzbv5vnPOXe8gQqbOL51vlm/C1TB07q1WIjzFJRA4WJ
         KIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704637771; x=1705242571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGfKDZU2v02JYj8j4xt04rkLEro10sjs/HZeZU+mIfg=;
        b=PjKbwq3M6vksQCB4snvoM7equ0lnFIIsd6a7o7mraGxLwTk3mKbk98s2rof2M6QU7q
         /MAxDcxfSnvvFwY9lYmBwc8Lu0KmRx9Ry42RvPAAw1S5s+GAb2OvhmeCWSOxJvy0nJTS
         HRluWGmxgvHkF1AcLNwEjFojkmk+CkwPJ8YvAM+QRWE1ggrn+uy97wMatTBzJHqoVDMo
         BH0i8vlqmMnJFX7Zj6xCviMJ/qaVdEsy52mxGjxZg7qm8AnfUL0vEIaZUEpthlp7I87U
         U456y/rUpzHDfdiBQlvh0Yfb/wiFBE7TNmA//j29p6exKqVoMyXki3vzfy8mrUg3jy6x
         B0nw==
X-Gm-Message-State: AOJu0Ywif1JEzQ1qryyZCIXacjWgn79Cr2OPfmpKUK8AcSut+0qIMs4T
	AHjfxJJH6vWVEVSEBgRcWXXQKwUkgGkKz2Zw25I=
X-Google-Smtp-Source: AGHT+IGN0eC3tUJD1D2LgL2Ag3j92/KIUXQUEmoyoyxjkJa09kgyiqq1FJMICAshXVC9CqeiXAALCcuMb3opn+/A8cc=
X-Received: by 2002:a05:6830:314e:b0:6db:e5a0:f142 with SMTP id
 c14-20020a056830314e00b006dbe5a0f142mr2422716ots.58.1704637771617; Sun, 07
 Jan 2024 06:29:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240106065941.180796-1-wangrui@loongson.cn>
In-Reply-To: <20240106065941.180796-1-wangrui@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jan 2024 15:29:20 +0100
Message-ID: <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Enable initial Rust support
To: WANG Rui <wangrui@loongson.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, WANG Xuerui <kernel@xen0n.name>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 6, 2024 at 8:04=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrote=
:
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>  Architecture  Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +``loongarch`` Maintained

On top of what Huacai said, it would be nice to add another character
and realign the table so that `loongarch` it doesn't overflow (perhaps
best done in an additional, previous patch).

> +    } else if cfg.has("LOONGARCH") {

Would it be possible to do it without a custom target in
`scripts/generate_rust_target.rs`? If it is not possible (e.g. there
is something that you cannot tweak otherwise on top of a built-in
target via the CLI flags), it is fine to use a custom target for the
moment.

For instance, this is how ARM is doing it:
https://lore.kernel.org/rust-for-linux/20231020155056.3495121-1-Jamie.Cunli=
ffe@arm.com/

Thanks!

Cheers,
Miguel
