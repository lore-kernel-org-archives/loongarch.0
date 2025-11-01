Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CB28C87C
	for <loongarch@lists.linux.dev>; Sat,  1 Nov 2025 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761995747; cv=none; b=WUjzVuY+Lg6NsP3h5L6UcsH1AtxXk6tinIcdLwLzbswAmbr9DNHUbpm6Tr+5Hwg68o/mRa6pT7t7D6lZ+HiiurTXKdXSIwDiNRRUnSDsv1arRuwdoAUWaAcrrNPyCws4LOL+ggF1zC3nhgwks1ZnelF5b5adgq2VjGOji7AzoQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761995747; c=relaxed/simple;
	bh=53L4Agml3krEnn3GEm4C8FtLZA7Y88RpvZUAfOW9in8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4E9iJfB+/UGB/8ysdPGVR1cd0obpjvuvm+5qU2hVPP3tAa6gtjVD7K/x3V7jLDPb0onNg9tMboU7MYyjC6P5D51QRiLmRzltdRlZqDEHA+9i+WxND5vbKRNuFPlx/VPXXdvM9xkTtpsAA89ZdliLzZ+JpEfn0FkaXQcDTfLrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QPewvctK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QPewvctK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47721743fd0so16275305e9.2
        for <loongarch@lists.linux.dev>; Sat, 01 Nov 2025 04:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761995744; x=1762600544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai02d9ytggMhjQZGGyjFxbHV7RPoREkTPHk/zt6GB60=;
        b=QPewvctKIOjXAdmCkaTKJppw0mGUoqQs9ayrbp4Ld+LiQJB1/SJd1BxVG2lbGC/zLF
         tX3mDrrq8Q93UkD6zXllo2zbmj/kQM9mHZ+uBuM+s1VF8IktwsdVQGssA2mikq3q2ihJ
         b96C+WW/FwYW/p46Yu0YC1uAUkdMXs7CRqMNZwgS4jxebB2V0scrkVGbIV1mMQh8A7lo
         d/DvTE5O71fsgZeTOKO9DrhAjh21qTaRMASIq9aum5+YymNRlba9WbvReDJuLBhwYThm
         JIsB1npBbUH/EEdD2/e+hKjQI2sVXGzL22W9g/o6Y6GXWbNRnEKuyKAUzxd3IrStVyXD
         q9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761995744; x=1762600544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ai02d9ytggMhjQZGGyjFxbHV7RPoREkTPHk/zt6GB60=;
        b=eoydBELwyLbX1rGia3Q54856eceVmfdumcd9N9ufXh1ZoykUdsVmno59o7VY0p/psn
         wcwh86UIMvvHkLEkA0p3EQknKZdaPwUZwggLUwdWgoPK0SWXcDBjjhcgK76gDvF1rphM
         KjDKCITfC+4JVb+tGKTRoFK0/lr6KLnEvj/CIc0L2PoyaLYoBfofmFIuYwVe7tXHvuxB
         SJ/ta2/ShFtVlriyStbQ+SV9++iAjpWZ/YOhvpac7Sh5Uh2v6ALmpVnukvtI0/1Xd4hC
         nUTvpsXvLQfe4d9+Y1gEbaIXMPqydtiQMYQw7LaZPCOU56O1nlhnS6MCQoA7D3pMWE0b
         6A3A==
X-Forwarded-Encrypted: i=1; AJvYcCWtFWCqOfFqLPvLRTrmNBFzRWp04F2Dk+mjtllRbzQE0Y/I2uZgq6uEs7X0E14It934NB0xFRWWJkI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8zX4yu8IHm5fers8I+ENV1ug7wm+XX3manZUJiG43Bu/zKwVw
	YNvmNZFfYuNY7dU+eb1aBhExpiZTYn4onBkIoP1uvq1t4SWl5GoIGr4bPOF55WawZogyScTGyXh
	byBfFHiXA9672M592ympYXjnZBuCHBUz6/CHzwXT6
X-Gm-Gg: ASbGncsyEPr9mFAZdGrtr24ljs5Upv/T+hKF6zugRICFP7roDKb99jTeq4NvO6TVT2x
	avz6BSAtQeFioaMTt/WToIDhgnfVfq5ClnT7CHU6778xn+xWAQmMzydnWEWxr8SGBZYNcUWfBSE
	QGPsCQC/AEAi626P+mEfxXsvx8NzpAT6pMK5Pdx5tO//j751H/TkDp0wDE6d0/PD+l5VcWdeso+
	g1hBzaNv9BKNmTwnJgZno0H9n7XsSu12u0sbDww3aWoJFzgYg7vwFs3T4HTe5i83YuuAx3ytQZV
	4S2XR6s=
X-Google-Smtp-Source: AGHT+IHrIEVELwPGMqLbRWNgWbAG7AKm0IuH/YHGr2zDN7xvNJeF7aEkl72R6eP6GC+NpxMmGv0UTbdaiKEnSuynERI=
X-Received: by 2002:a05:600c:4687:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-477307b6162mr64979195e9.2.1761995743628; Sat, 01 Nov 2025
 04:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org>
In-Reply-To: <20251101094011.1024534-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 1 Nov 2025 12:15:31 +0100
X-Gm-Features: AWmQ_bmbaSU9JnSKerRHv6L6osQHqI4rsJcPefb_e0R-EWm-pbSdfEtmq0KM5lk
Message-ID: <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
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

Does this need a CC stable too?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
