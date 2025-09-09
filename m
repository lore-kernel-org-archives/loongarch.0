Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1031D37B
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441200; cv=none; b=DsZcbkD0ykVoJxnpB8KIxwH0qjFAXiRFimKPdiLC+p/bIEDDdxcQdjXCMSBCrTnHCqM1NqYQaCAcp9j7Xru5n8zYGRJTbXQyMb3O3G30LlNIV62116fsaSk2s2SzZFduR/sN3M+2khzYPVF8j5HS59uUaB7QXixGMAktzcawntQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441200; c=relaxed/simple;
	bh=jZ4q7/TmAhAt9Egg4Ce9ImZslltIxN0BNL1jgujUK+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLs/l/x9nsoWI/iMypNE+uD8QQ9v5yNhINI0TnTrIaBAr8yyIqTlv8s/2A3KvGD3TcvfbHuplgwYrRpe4WqUE/0Is6GmFb+LT2TNeW23bpgU5LzgZ+qZVvdKYjje6tMXkT20VJtwY45dJds4af4pZxC0MMMdpu0WOJ72fGR2mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xj7JK1W2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xj7JK1W2"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61d14448c22so1578a12.1
        for <loongarch@lists.linux.dev>; Tue, 09 Sep 2025 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757441196; x=1758045996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs2bT3Dg9Ff25HRhQXBnWG6WLypX8eEtjPTIvXY4ebI=;
        b=xj7JK1W2c0VVpASxUkbTINEV3E457qq0qxsAGMoRA/9m3THzl0SFBLS0ePImA7kv9H
         8I+V+kgjLTyB1up3gLxjjRMw4pGYGk4zccLCsFa98XUyg1P1abSf7plDvSBezUNVukPc
         JQVLI0ktXp03neVtnBWtdFOpZhc6J62YVsfaBA9IL7+9MHJfDP7N5ok7DybGBP4pO6Ba
         KB0R9UAIdL6Cxst2PXFgdrNC4a6e9xR/i7LNgDHhvNV0OkGQDScUQJM5Xqwc+p/nxGUg
         WnMtzBXpYbn2C1Bw8gG3h2X/LDa34/2LfKL8kHI8jBo+dHHwXOgik/+XSPidIG9WIRNI
         tZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441196; x=1758045996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs2bT3Dg9Ff25HRhQXBnWG6WLypX8eEtjPTIvXY4ebI=;
        b=WX++/jCytEkAvn9mz8rceSBrjQsJ5b5FcaViHnhd7Z5UK6aafY/cFtgmInOgo6AL+T
         OlSGw6pa8aMYtuN5Emkkip9IqBpjcucvpbw5Cka9SwGsa8i/njXQBqPv6Zhwk09d/Zy+
         2N5glZezZJiqwPLRyGGitV0WOERfsljE4ChwMUA4jQXGCLizOwKp1SM322P6tmgzohMK
         cEa0iwZnGTP97JFM62UwpxN/sJY3kEiHxojaolyoSu6Xx4ksqz34PG8BuCTQVsz+fEc/
         PN86AolqXrTSXm4lOHWcEsW/SGJMyLeBRVyiSsPqtQPwZm889Rh/alV3EvBDsOv5i9vL
         YKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAYEE+yliPrS9j8rxbpVgNP5djjDjH14qL5I30gpbxwrH9zWTmh4zK8ISQpk6iTVQU1t8U7930K1s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAr6vc13WY5tpz+kq/MNU6SYKohbULMrzVVoDgcH0xuum8u06r
	w0OeiWGJFk/wXoC7oG1fBtBTz0+OAGHyJWLtuMK+PZdNqopZAiNKhxSgQMeC3kQsiLnemeTquk3
	JHlAXe6UyPo9VgBBhHsuIpVkCUEFf/fg2GM64f6Xg
X-Gm-Gg: ASbGncvn9PITRCuUv/dgvLTYie3uygrdztL3AmxeUaHfDe+dICwDgXBB4rqkuLzs51a
	Xz0jPE7/qrRCb6cTkLOH6mCynbhaTx+wD6Mm7F3RSZkAZjzeRQB/tquCbeVxlcxyl1CzAUbkBJp
	mPoqM6lTV/Npgj0n8u/xz//0DP/L5O9F1OfEVar1Moq2a+GbVHuv8eLBckj93GGQpEydbWuTQHR
	E6uLD3AbduMq2pjDYAwS/LMdTJCf5QeUel8g5zelrLi
X-Google-Smtp-Source: AGHT+IGeH7jyX9ct4ZAzKinokBQ1+zc2FEaXfp6pE5j81gEVTiuyh5DC4nkYapGmxfFWYMAqNWcHbugCP2vmV3t5O7Q=
X-Received: by 2002:a05:6402:21d4:b0:61c:c08d:359d with SMTP id
 4fb4d7f45d1cf-62d27d84e7amr6983a12.4.1757441196486; Tue, 09 Sep 2025 11:06:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
 <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
In-Reply-To: <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 9 Sep 2025 11:06:25 -0700
X-Gm-Features: Ac12FXyLkTDu-xW8KQeBG2jwxZmVi08cxdiK25_6D-p0oCXaRRpW6X0CHqv7ho0
Message-ID: <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 3:16=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 11:27=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > +config RUSTC_HAS_ANNOTATE_TABLEJUMP
> > +       depends on RUST
> > +       def_bool $(rustc-option,-Cllvm-args=3D--loongarch-annotate-tabl=
ejump)
>
> I am not sure if this needs the `depends on` -- from a quick test, it
> seems to run regardless of it (and your `ifdef` below doesn't care
> either). Cc'ing Matthew in case he remembers why the docs mention that
> the Kconfig one should be guarded by `RUST_IS_AVAILABLE`.

I think this isn't needed. I added it initially because Kconfig was
dying when `rustc` was not on the path, but I'm not sure how I managed
that, since `success,trap` should guard against that (perhaps I was
doing something wrong in earlier development, fixed it, and didn't
remove the restriction). I have tested `rustc-option` with an
intentionally missing `rustc`, and Kconfig doesn't seem to be taken
down (and it gets a no answer), so the change to the macro means that
doc warning should be removed.

>
> In any case, it shouldn't hurt and it is only on the LoongArch Makefile.
>
> If you will be taking this through the LoongArch tree:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks again for fixing this!
>
> Cheers,
> Miguel
