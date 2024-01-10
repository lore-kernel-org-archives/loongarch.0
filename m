Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C474776A
	for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhI+4Ajg"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dbeff495c16so2570594276.3
        for <loongarch@lists.linux.dev>; Wed, 10 Jan 2024 03:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704885625; x=1705490425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FW1K//afvn0Nho0TscAWU/eSRLYGsm+Sr/mW3eupyTw=;
        b=LhI+4AjgGylBnS2zKzk8sBbG35rSpM0BKXkWptyPQAVmWRrDLQmFaTqlgDL/v/h/qv
         YvzetUnSNcfGEPH0idEA/1CFi04SLLBT7w/NjCtCbG17P47U3ECQz58SWtku4iP7+UZY
         D6pqZZ2JCtRUwnSSBxGVdm8eSKEHGwvUDDYUsliAF7xA75NUPp9/XwItvzySxmH2htRk
         5DIOCmPW/FxAMJIj3mxmh2YifYvufeutyADYIn1g2RnX0uiGAPqlv6virdbwXFHF1R1T
         +DDx8DvnO1O/31v9EuOMsoUlYQ8qXXsanHzizefgQ8T/L9YLYIc2+ePdRozTyMSvztDZ
         9rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704885625; x=1705490425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW1K//afvn0Nho0TscAWU/eSRLYGsm+Sr/mW3eupyTw=;
        b=H+nnaa363TLN7uiZSk1uPdI6Ia+7/XcA0PHRH1HLLrbIGYP+gb9TyR+8DxOKEvvcqh
         X3+iuSoXWq9APDaW0PouuFETb9PgjYQXbG2u7nWZgcVCxNIqZE+VCcjFe0g77MpU7lJd
         4Fh/LI/x/vl1lsr8fe3dX8U/wH0bFHl57gNc9yXmcewDXa1GEapBimmfGBY6wvNjrGFE
         TtosfRDGayKqDa6WyE89FqOFm1VqzZiAEd7hFrd0YsKepUODkjfvugyat03RHIi2b2Yv
         ZUYmBDp7P6saQsmXs2GtzOMGYzPxqavCJ+AezxHQmSqmINm6TWVbatm1+Q2WY4fst7vo
         g/Ig==
X-Gm-Message-State: AOJu0Yw7q9lr0L9VmUrRE/QjfYJzCgM5EGu2vfbujr+Nphj+noygzmS1
	WhsoQUelENNZ+r89F06ZLGJqRP+er4ukJJth/Ts=
X-Google-Smtp-Source: AGHT+IHaa7xcgtCKMUHH4aDoyZhwFwZccl2P3DTlnAJLFyjFE/VpE1rrAyZzbqN6y/vAIhj6iEM0E8WaN6WqUlUJkC0=
X-Received: by 2002:a5b:d47:0:b0:dbe:ab05:a610 with SMTP id
 f7-20020a5b0d47000000b00dbeab05a610mr615185ybr.36.1704885625150; Wed, 10 Jan
 2024 03:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240106065941.180796-1-wangrui@loongson.cn> <CANiq72=M5TrUL+9Z0nqKKcD=KHwyDA79fNYHgU2EJ+7u6Ct8qw@mail.gmail.com>
 <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
In-Reply-To: <CAHirt9hd4W25p1kVNYXbEXrLj6NgT5r=EPWsoOmHZzS1qGR-yA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jan 2024 12:20:13 +0100
Message-ID: <CANiq72nw2UHd3Kek-Fmvk_3zE=z56wYJVQJq_syYagru5+wo8g@mail.gmail.com>
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

On Mon, Jan 8, 2024 at 4:22=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> Thanks for your comments. I noticed that the refactoring of the build
> system to support the use of Rust built-in targets is still ongoing.
> Could this take some time? In the meantime, let's proceed with the
> generation method.

My pleasure! If you mean the first patch of the arm64 series I linked,
we have been waiting for a while for that to get merged (hopefully
6.9?). So, yeah, as you say, it is probably best to continue with this
and then you can change it later after the arm64 series lands. Thanks!

Cheers,
Miguel
