Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF911420DD
	for <loongarch@lists.linux.dev>; Sat, 29 Mar 2025 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743237959; cv=none; b=fNYA0CKmY/RXhnDgeFzLAbt8/+m1ZzQztvlFZyuTxlxIgCNRBB3NwSnero2RQVKRc0Szh5FOpUabmwERQEsOlO/uAGjpO2Ka5qwR8SL57zlPpWIuZlnzr6sx/60PlivcSxAhXTjYJ54CTX2VGxo0OnIFf9SalG7EFU9+50KT/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743237959; c=relaxed/simple;
	bh=VuNKaSttNCraDAMFXX4IwdkGLy4R9KErqa/ImpP7GDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQzujo/qEVQj3WbuLYYuZMFqsHS0OIeVzQvkZ/W+I/hepH/BFGl1RSLXjjf8jkngYMjiTajIbWXmYsqzwUIodfuffZ8sEeH851qrDkKG5YbvC81CJFAKg1n224pmWeLYwddGiFfHc1HBJW/jpg3RFV+rrluGG4LBJB1CPDtXoSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDTetxsQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDTetxsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8398FC4CEE2
	for <loongarch@lists.linux.dev>; Sat, 29 Mar 2025 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743237958;
	bh=VuNKaSttNCraDAMFXX4IwdkGLy4R9KErqa/ImpP7GDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TDTetxsQPSKIakOcDLvU/t64wXX8BepEtCt0Q4F8Oa2TWcetOfgFIGIqa+TlwanNu
	 +a7w8+nY3oxzI8TXpyT14O57Dtzw7QZFSAmAE8gNBJlXapX2VXeePtnZZtIuQP7Bw6
	 6kMZTINMQc0FVcWBb37lLYF3gL/PHOvQRuyLbbnc2jiVscrCPMwhfpW1znEKBWd/7z
	 mTZU7nlhiLQtG+pgOM3jZNvIgjHNyK7lGz0qGnBiGrJJ03Orbw9e5Cm6PfrUeZYv71
	 Dt2P74mG7UqfegzlzEhQsnum+s/4BR2YyMZL3F5GszCDQC0qLehmpx5Sca68B2Uyd+
	 +BZ8Y/CeYBW3g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso576574466b.0
        for <loongarch@lists.linux.dev>; Sat, 29 Mar 2025 01:45:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS7XF0Fsq3aKGZJKBs4gZjScNd1+ImpvmybGUbkIekSE4WEsTkCB9OPK6mut8C3cEHhprX6ESHIQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHCWXhEx5sHDzvbG9Ngr5bRs3mZj+YFKU/5a3aF6CiX9SlI8Co
	AqXGpLk7PD0EEpwxw5LZxdonGaSGanLK3qJWxZiPbNsSKUnsu6Je2z+leGSY35CtrlgFWwsFNVG
	xgJIbJDq078GuoqA+EF/McbK0DVg=
X-Google-Smtp-Source: AGHT+IFcTBlHFMe+cnzJ3GscmxD7DadfgO659/mYjAgkv2zsYhCstTT+cs4vEk+dCL2YR1W8PvXdP/Jf5yhQc854D64=
X-Received: by 2002:a17:907:6092:b0:ac4:491:1549 with SMTP id
 a640c23a62f3a-ac738a088edmr212495866b.1.1743237957112; Sat, 29 Mar 2025
 01:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304073554.20869-1-wangrui@loongson.cn> <aab657d72a3ee578e5c7a09c6c044e0d5c5add9a.camel@xry111.site>
 <CAAhV-H5ayw7NxbSbCeAFaxOz+TZ8QeghmhW6-j2B1vTcjYxsJQ@mail.gmail.com> <CANiq72=AZ+CN4SScZcnRBpkS8ogCaZ=Uhe=k7fhGCVyecyRu5g@mail.gmail.com>
In-Reply-To: <CANiq72=AZ+CN4SScZcnRBpkS8ogCaZ=Uhe=k7fhGCVyecyRu5g@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 29 Mar 2025 16:45:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Yc8d4qSN0Fwe=wShXHzJrdJ0KX87kV0_0ToQiHBEECQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jo_BhIWW_S-wVrrfYgevxjvR72OSEu-wwQPjbXYleu9ZtV1saltGmiCwUg
Message-ID: <CAAhV-H5Yc8d4qSN0Fwe=wShXHzJrdJ0KX87kV0_0ToQiHBEECQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Fix enabling Rust and building with GCC for LoongArch
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Rui <wangrui@loongson.cn>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Miguel,

On Sat, Mar 29, 2025 at 12:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 4, 2025 at 10:12=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Don't rely on  default behavior, things may change in future.
> > Acked-by: Huacai Chen <chenhuacai@loongson.cn>
>
> I was pinged about this one -- are you picking this one through your tree=
?
OK, I wll pick it to the loongarch tree, thanks.

Huacai

>
> I didn't test it, but the change seems safe to me for other
> architectures that we have at the moment, since they don't seem to set
> any of those three from a quick look, so:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> In any case, the usual question for these "skipped flags" is whether
> they could affect the output of `bindgen`, i.e. could they modify
> layouts somehow?
>
> Also, it would be nice to mention a bit more what was the build error
> and the GCC version in the commit message.
>
> Finally, regarding the Cc: stable, I guess that means 6.12+ since it
> is the first LTS with loongarch64, right?
>
> Thanks!
>
> Cheers,
> Miguel
