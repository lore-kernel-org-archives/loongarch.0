Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA794482DF
	for <loongarch@lists.linux.dev>; Mon,  4 Mar 2024 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709568436; cv=none; b=GC8kcfEDXoSmoCHy6vhG8u8SDfs4t9iovST9PGU410FhflZa2du26F6AmCQ3xf/7R5lLnUObuaKvZ/IYUtDp/hy8j8xkjAFczeo0zXtEy6M+6XYR9kK/d/UeEBBzAiGnlu+GZgptrMBLKI6ZvSw6XocMhm4Yxe5K8DLNczbb5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709568436; c=relaxed/simple;
	bh=k4TR10OnNmINkmPorunrjDAzeD+rHb7FeAaVbqOaY1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crgQkzjNO49RtuL7ubKsaH/L7I8yOth4BTr99jMxsKOXIb4nrHTbMlBxsDXEc6VS47oIsFg/g4cfd+CBDlLa9m7C1sjpbKhNZwcvCZNOvk/8Y7ZBGTOC8xaoZlYD6kbxeWy46iL9f3XhaJIEyx/0cs22Rwos5yCxvLKbmrv3Dq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJeivYzK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJeivYzK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so4427202b3a.2
        for <loongarch@lists.linux.dev>; Mon, 04 Mar 2024 08:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709568434; x=1710173234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4TR10OnNmINkmPorunrjDAzeD+rHb7FeAaVbqOaY1M=;
        b=NJeivYzKkIh6NN214ngL7au03A043hLAC9GtV80CbM+eZpzbJtWXhyQ9h3dAvqXFBs
         FgQKWbKBdeo8yAb1d2M61ngLrlJcTFtxPjgMOGre2wkXOE/A88Ym5Fts4Phs/CRh6QM1
         GFFqhtLe3CjfvpkFQ/sSLahY8LDYC6coXfkVU8lPDhs/ZmNBoHAvaHyp2G2YPAmq0Q3c
         Bl4nhsoVkok2AwJpLv0jcVK4AzFj8XJBXaAjvPancHd9Pp8XxxTJZVkzZBoEE7ZZ4j4d
         D3yjPd+wvquSRgxkNo9wBdgcw4chssqRFdGUQsNpxwRuPx1QQTRItooqywiSgoYRTJnJ
         9tfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709568434; x=1710173234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4TR10OnNmINkmPorunrjDAzeD+rHb7FeAaVbqOaY1M=;
        b=uXSwwIPC4ZAOpM/+kZRi5Spzo633fY/RzlL4NmsuOUJ9DC/8ydH7O7v2hIT3eBuT7o
         TFUtIeNGt4kCQvwqVoXy07Z0WkLJ6ZpNP8YwFbgMyqJ9HTUX2dBvyWdHDu+zXZpCB48I
         FZdQ/+TWzz/U4O8tovTEIt5M5xyR0nYH0u8jeWP0joDirF0kU615v3dmtYnCWSVA22H1
         JZikuMbH7vgO9e45cFPgXy+U52gFH1GpSYVf9zOeEH03AicHuYAMXnqZ9E1InX3yVsEC
         s0ZDp45+PU1t9s0i1bmBT8daquEsMQRHSE8qmTUXFfl5daOm8/toriuzx9ptI93pnRUr
         1fDw==
X-Forwarded-Encrypted: i=1; AJvYcCVtKkQJ+9C8+hsAxkBNKivfr6E87z18cmaLcOOstV8n0GXXMu/EwWNcIpnTE6fz9KupWw3q6AVpxjSJdPjchxEBDdRMX+dn66Zr
X-Gm-Message-State: AOJu0Yw7i1zJDKqMmXzOfAft2yUm0J2AXSFXIdYuHsvinpdyzAK7UwhV
	ZYJD+hnn49cn/xGcHhYIq1Ft4XkePUZGme0n7rpoTVfWCppp2B+dXBEpDIiuxZfGErNiHK60qmM
	x4oLhtoSKo+RJKzmxff4u/JCrEJg=
X-Google-Smtp-Source: AGHT+IFlTw+graS1GYFpuHX/+si581ZuRx910SbrbDYCgQI+m5x+oiChingS48e76W97/gjoZixOgklCOzjzBhM/d4E=
X-Received: by 2002:a05:6a20:160d:b0:1a0:dbf2:fd8f with SMTP id
 l13-20020a056a20160d00b001a0dbf2fd8fmr11819869pzj.21.1709568434111; Mon, 04
 Mar 2024 08:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240304141426.163517-1-wangrui@loongson.cn>
In-Reply-To: <20240304141426.163517-1-wangrui@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Mar 2024 17:07:00 +0100
Message-ID: <CANiq72mvdVrzN19PC8pNrvuBLkOEEQ3yX0WG6JcWc+RVaSM2nA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: rust: Switch to use built-in rustc target
To: WANG Rui <wangrui@loongson.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, WANG Xuerui <kernel@xen0n.name>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 3:14=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> This commit switches to using the built-in rustc
> loongarch64-unknown-none-softfloat target for LoongArch.
>
> The Rust samples have been tested with this commit.
>
> Signed-off-by: WANG Rui <wangrui@loongson.cn>
> ---
> base-commit: ("rust: Refactor the build target to allow the use of builti=
n targets")

I couldn't apply it on top of commit f82811e22b48 in arm64's tree
(which is the base? -- the offset differs significantly in the arch
Makefile), but I nevertheless applied it manually on top of that one,
build-tested it for loongarch64 and boot-tested it for x86_64:

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
