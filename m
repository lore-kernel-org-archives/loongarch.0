Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706352E8DF2
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756894292; cv=none; b=E9PWXzZ53xzXv0OHRpc0pAbYM9GCqhIU2pvTS8cQdpuavAvziEL4ku/lhJmrJrUJD/MV2+zARBhwi38fZfCo9fTgtyPm1rLzUgN9Us7l8UBgFpW5AnavOGxGi9zuc1eZoTlAnqiTCa2BC7eDqBXi8R9OCZ5cO9fKRgbXT3ksFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756894292; c=relaxed/simple;
	bh=U4MZoi8oLGDJoMxDELHFZu0xWz5d5A+jT4oMO7QogZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7t7HTJezRsl4b7y0JbYWZmjkXOgkXrfzleTBDX4Eqn38lAAMvleg7YI/yFX8WSSJtOxXJK3UisfcbLMX3OobSQxQoN6G7/LrHzSHEKGQuu4IMNwpRT1Am4FbNWiXeT4GrX/G2FxEr/EYCiW8oMZduUVdvkc/X3JiY52fnQtu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGHh82LK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGHh82LK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24b1331cb98so3005355ad.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756894290; x=1757499090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4MZoi8oLGDJoMxDELHFZu0xWz5d5A+jT4oMO7QogZU=;
        b=dGHh82LKF9jqqj2D3OdbB4Ah1Fgqn4a/CEfv8gkWkOmfdEqvrirlDS/WC9xkEQ9Yn2
         JauoCLuY0S6X+AzPcMqhF1rQx75vJz78hbxLEappTVJtscaPQeA7BflHsZzrb3A6DteL
         WGbe0kLvHXsBai8mUWJTPV3tZkKmvIsaWOCiM6MfxJY3tl5Yhb5hOKffoPml+9F2tEE3
         s1/FD3bdH6/4Zv9HFkerUhKV+5nAqGrvBrotLGdXkYXArWwh6c9RkIrNxOGKyRksbbeD
         obxLpeyrWA7BkT3R3RxgT8YgQvCzQ9wgWHvkeH7fI8MSoDtWYrVAFByMManTEUC6atyG
         /Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756894290; x=1757499090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4MZoi8oLGDJoMxDELHFZu0xWz5d5A+jT4oMO7QogZU=;
        b=WIwAh3fmrJ3vLntF4IPxKQNyPJOOkGK8odql5rZMxZ5dd1Vjvq6KHP9142/1joxGB3
         islOgYAUOHeY8AA0BUSIHrq/s/cpoM/YLIbz4ELf/UUmMH0rnBAWrEcQRE10EuUoiiDM
         Xv/2oZxY/DqiHlDcQGXFnK/YotXFvvOGngJysO8/TXOtsR5owYF45E6fq3N9J1sPFnLV
         mIqbWfP9mzVOgmfq7ydjsrjIPxmJX++2iviEK7i3rrkOy8EWteD1qZHkSqoph1cy4Cyn
         XGnG5TYDcSeS06J9+YX0Ug2YWmBAGdP5jRVUuUWXCwNSabZ9eODoKxhVr3FElkE43Ep9
         Ewqg==
X-Forwarded-Encrypted: i=1; AJvYcCXqCn1lNo8IKXJqAQgDJ2c4YA81uQtUpdOQaOCfWuDuvaqbOefgS45vZRHVNrOYwLbO1rH08ZBLSfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YycQRhUNZxHIYwIYrfzULpbDv+gtBgPsQ/tDM5vzeFVboe48xHz
	MdpgWgH3InOiwNzzbsMghSbDwiMgEFqG/YQxtkFPtSmoFjvQ0hLir0ftDj9fUL/ZGOh1nsJgGbO
	SuqHq5r2vz6B8/3xxuSPwnwChxjT+svQ=
X-Gm-Gg: ASbGnctuVNFonfSIffJEAenJVskktCnYx+kvo84OKNZhl8vMItOi3Hksjnujez6oI9O
	gnVf+eAxk5ZZfVgOFoqHP1qUSxPQtlMSK6MP0Blz4nYlP6AbJiqoGzohGVl6rOqufEecghK5dWD
	T5tdhf0aeyTfixDNrTVryAgHe7bPYKnpwl8x7UrdYPyoDVR+hOqZZN8e9wz6q0prb0p0eQEE9Q3
	lgO9P9Vg8zW/5foMnJ2XQ1e9O3OKO2c9kVLZvOvTmQczRtQw2G7fk+xCd1bHgKq9dBiAUUg83Sj
	TkK6SWn+W5lQBNF61NI3IrHIng==
X-Google-Smtp-Source: AGHT+IFwGI9nyWNoJg8uwXwGJ3TxB4TNP09lA7q7e9wGdXtNR/k17bCYNPM3BYw+7ukDm+E8vdiADOOngjA3baARINM=
X-Received: by 2002:a17:902:e804:b0:245:f85c:8c6f with SMTP id
 d9443c01a7336-2491e5df36fmr128836005ad.3.1756894289581; Wed, 03 Sep 2025
 03:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903095315.15057-1-yangtiezhu@loongson.cn> <20250903095315.15057-2-yangtiezhu@loongson.cn>
In-Reply-To: <20250903095315.15057-2-yangtiezhu@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Sep 2025 12:11:16 +0200
X-Gm-Features: Ac12FXx73Wpq1b-4qjn_jQh2j4PxEmWDtbARo9rp6bgf8M0PObw8Mg54qeDFzjg
Message-ID: <CANiq72m0HO91gFcVuH3kPz6b6fZ_vrbO3BGmb3DpyhuRnvGkeQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] docs: rust: quick-start: Add another way to install
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 11:53=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> It seems that the latest version of rustc is not compatible, in order to

This is only in nightly Rust -- we have a couple commits in -next that
make Rust >=3D 1.91 work. Could you please try those? i.e. starting at
8851e27d2cb9 ("rust: support Rust >=3D 1.91.0 target spec"). They should
land in e.g. -rc5.

Regarding `rustup`: we could link to the install instructions, but I
don't think it is a good idea to replicate a particular `curl` line
that could change upstream (e.g. the domain changing hands),
especially one that installs something on the fly.

Thanks!

Cheers,
Miguel
