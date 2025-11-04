Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18C2D3EE4
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 19:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762284330; cv=none; b=AmncCOvI1StFXb7PnS6EQXnmcQMTGVO01PlZGEQY2dRbgeRDpbNGhZCcE/hTNsyCehGkQK4APsJ691eEdYSjE3+RpjIRl58sAGCOky8zRNTBZrex9UR1zYXP02S+C/ljrbWVK04bIAAGhBz6zPlu0p+5F+sXEWGHQrYK28XjMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762284330; c=relaxed/simple;
	bh=K4Iyxi52gh1Iw5mMl2HUNeLP4ewV8sTogXEjAzGJ4AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXtK9looDdLCODmO+O1jNQXpDgit5fzr7BSZ1Go7DEgTOrTp4A58Di520mHlc5KuisBnAygr57+/iNrK08BF0gs+O/nIvn1e6uJllef3Dgvn+qABT0fZ+e1r48Rwhc0x98easzzXrvkFMeP7ZFuDoRO592YPqWpLsON8aBQrZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBV/ADBu; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBV/ADBu"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ba3b6f1df66so79984a12.3
        for <loongarch@lists.linux.dev>; Tue, 04 Nov 2025 11:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284328; x=1762889128; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=jBV/ADBueDvVPB7Yaf30iE7PsB3wAXzJZqFOG/krjCYKjORGHFK44Ud3VnQA4FnXlq
         v6VKIBP3faAe+lVnhhPl1M2agXB+8BF3f0D1EqTgvgxGFEhKvFLH0Jm0hciSorhunrvU
         TKtZMxEjDiihNYIMHQC29n4GdHpn7lFcuLOy59ViIvpUTOeKgqyiQzZGjgfcKMV+8/68
         k/RuuFL8Rur/x/4ZtPy5drsWEtsWdZWGdqGK3zCE8AVBq5LxI39bnqRdEUpw0G6c8MKj
         tckTjjsa94kKO5v7GBjkDAuS679sz8QE5lIsuNIcTpUMQ1fSb3nuailF3gyFUvVGnj6l
         EBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284328; x=1762889128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cZx+RW3Kt24V+mQj1nrZgt3YKwbbGOTRzEZ/APfqy8=;
        b=uUxTPynN552qlj755uizvmTsceybqk9SSBx5vz6LgPxYdV4XpdInwFvcKQLhkVfTa/
         +dBD6qcv/Zn4Xn/ExZahz7SdxzIxIdLeBZz0QI6704Xtlxj/ElQbA8hoqrpn/+Wr8w94
         nO4ilmbrJSNYByFluruUZ2bliLHG+1Qr+MilyUK8kIDKjH/iBe+KdnfVqGAMT66B/LAr
         AZRTjq8dQpgJE3fBxLD2gxz+5L6z5nKW3cBdEqXQRguo6fdfcn6mmSSxKHYLFp5YYvVN
         i9MYO4JGhuE3o/ck/RfBkC7e7g0ynrVWMlXl1IeSjKMKVWGdYPplJPziX44jKpUA/Isa
         kdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDIqzH2mrNYlAkmsQuMmBZd21BsLLYkimLITliZsFEbBeCmQM2870olpSKA2mK4w3b6kZgynnrxa4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzamrdGl8tVyEIKgyl3o4qa8pcTZRQsKNn0JK9SGf8D7iBDe3HX
	gMflzka9PoroDYjcUq+zDW0xlhh+cm9etqDcONkH5+E6qwGKoCVwqJpp+MgA/IERYzP/kQgaSL0
	dSiMX+gLJLoumR/4I8IL6QYRiyz1pMhY=
X-Gm-Gg: ASbGncvGZFl85Q48vz1FgJoL51QIPi95ScIeueMUrUGzG1zKFZqhJ69cldfLGa7hfGg
	Xn3xJXiE+jIeeOPe7Q6cVuuFxEyBsMsdMXUQ4YJDmD71W+2dzPZBhq+VnCVnvGwOhgy3E5g1F4p
	97Pjrk2gwUD0leJfhAQx1e3Mn1W6sphc82p+HUtJwlzstWkRWyL2Fr9Op/bNYwbA/pNJ9qNNC69
	E4AfqBKvFKWTGL2FlbNS5eFB55cIGqoZcy/+vXKp1W+EHpuq/7805fqmNawHoQepPeZZweoL94F
	/yw7CR5M0IFvMKIF32lIdYrIMRseU3xlnDnU+ymZs+26SdoWckjMH0pVlW05OKVhqqSfQmiHkab
	dNbA=
X-Google-Smtp-Source: AGHT+IFWzYsYUL37lFrxSC7sVl0Ij5MeA0lOHpSQOZvdZ7ftbuS95sPOKOarVGGOk6+VoduotS4rq+ThkHUUIHnXHbM=
X-Received: by 2002:a05:6a20:258b:b0:34e:8e9a:c610 with SMTP id
 adf61e73a8af0-34f8630155bmr221747637.6.1762284328313; Tue, 04 Nov 2025
 11:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org>
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:25:15 +0100
X-Gm-Features: AWmQ_bny94bBmKIB7QhLmeowyrAuyscE1LVW-SgNclTZu6rQpXUrhoj1poxn8j0
Message-ID: <CANiq72kWcptN+hu+gMwN2n8WkXrOku4kCHkSRsMzJmQeiCAJOQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 10:40=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
> [1][2] as `-Cjump-tables=3Dn` [3].
>
> Without this change, one would eventually see:
>
>       RUSTC L rust/core.o
>     error: unknown unstable option: `no-jump-tables`
>
> Thus support the upcoming version.
>
> Link: https://github.com/rust-lang/rust/issues/116592 [1]
> Link: https://github.com/rust-lang/rust/pull/105812 [2]
> Link: https://github.com/rust-lang/rust/pull/145974 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

It got stabilized and merged upstream.

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
