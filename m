Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12608244679
	for <loongarch@lists.linux.dev>; Thu, 11 Dec 2025 01:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416245; cv=none; b=MX+A3CDgpvrK05XdcGotGuB5bjTnq4vln7OyUwPBxMd5kXaa5zlJs5aQ9UUx+dqw/hlqvOLvNyYcvAAps00qWDwe5c7JeRuEHdutkqmTImY7TbxL3dpLHmVIoTppgOjJwkfEPdJUZoBtNZV597yHaDw3QvArDq/oaeX6L9VEkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416245; c=relaxed/simple;
	bh=C2ta94CRs3VICn+bBXXG+PkfIdbhlF4ERT4DpD03fSM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r81nMZs0qmM3mWKGVBLp6aOoDR7T4aPOtT6eQ8NakJDMaU2r2vrwVMQ0v65dq7UPHs9sDJp+xDuoe6L8PLJPngPhNPwOKDVaw7W4xou5lrMZo/MwTJqn83BWY5ubdK/hEBJjQ0Je0+3C9/ApPa6fZeVfwqyfadJJjYUclohaR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZX/pN64H; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZX/pN64H"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47918084ac1so2722845e9.2
        for <loongarch@lists.linux.dev>; Wed, 10 Dec 2025 17:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416242; x=1766021042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxxXRwsWEsqRRffHVSb+23LtgwKIm4MJ8u5lYVxmQbI=;
        b=ZX/pN64HCSNM2xjbT0DvrfGglFHn7C11Av5KposwONeYstbhKar/3q4jCEBVIDJAgK
         eKFg2h2FHW2a908+Q/pMCy9HK4jgNHjWe4ndyICvPhFBzhtuqtZsNKLQnliKheAqxl8q
         Clufne/yFNj7rNXGy56DxJL0y0TwymtFddUUjxsLPtW2ogLUmQoL3rR1LvkY5XGEFWf0
         +s4BeKh4UA/SjUT8U5Zz4hIFd/DlCMsMeM4C56Cge7FC+RCwTCaSRY7londL/+zEKNAn
         lslX9AUP7MI8rZrPGXOja/e4kjgZ0BDCAShAe/k5ix9KnX2oUr+HRlzKtArBHXOBQ3jZ
         +rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416242; x=1766021042;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TxxXRwsWEsqRRffHVSb+23LtgwKIm4MJ8u5lYVxmQbI=;
        b=ciR1wD/4AxXOVuXigNWR7Mm1BEWlST9+jdZnpUn9XMN2UFmtCPUe8zVpax67PxWGPf
         +h9bY4EsdZPX+eTQ/Kkat+flXC2AIMwQTzmCrdSTeO5ATyrUEEEjixlMSyH0iVkh4UzV
         BH/gBPATgsxN7DsRfnGl0EDF9i4U3P5NB6WLkKar7RpTeDR1aRpkNMVH1ZYoA3PO8jwF
         zYTMtWZnz8rz1TFQ1PcgZ9n4ra1vBKp9i+RTNEDFxl/KdJiLWeR6ob54zgP8VSA43JOW
         7flj/d4+3DqqnYEo7kfRy9e3/fWtREmObk0RuLSzQfqUZ30HiRaYm1dH2tv/No9fu5Mz
         H9DA==
X-Forwarded-Encrypted: i=1; AJvYcCXpbabZ5fExTfuMkChNlYNT15OI/7gV9Vw16XAQAqyoZaNFsrfbJ+p157teTrTYdWsih/t5biySaLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+4ptIFNhm+QlyDoRXfdjIleEU770iq46Yo27JVjGSM1YS6gsl
	nxVvwU11KyDWszdmEkxc8vPRK7m6f6VP3M7pX8nvJeIxcj16BCM8uoQbUWV5B24C1S8GESTtzSL
	q+PblfhrMwezsd22coA==
X-Google-Smtp-Source: AGHT+IHYCR566J9f+32HVBr5wdE3KPxKy1eDzSwAbbJWbbIpgNXaxbqPp8NBIxhDUtDSXRPXvOWZ86SytCdRWms=
X-Received: from wmbh25.prod.google.com ([2002:a05:600c:a119:b0:477:7ad9:2aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed1:b0:477:1bb6:17e5 with SMTP id 5b1f17b1804b1-47a8384d12dmr41973755e9.30.1765416242290;
 Wed, 10 Dec 2025 17:24:02 -0800 (PST)
Date: Thu, 11 Dec 2025 01:24:01 +0000
In-Reply-To: <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
 <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Message-ID: <aTodMdEWuXQXuLyy@google.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
From: Alice Ryhl <aliceryhl@google.com>
To: hev <r@hev.cc>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 08:20:46PM +0800, hev wrote:
> On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi all,
> >
> > I am seeing in mainline loongarch64 defconfig+Rust the following build
> > error [1].
> >
> > Cheers,
> > Miguel
> >
> > [1]
> >
> >  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
> >      --> drivers/android/binder/rust_binder_main.rs:317:38
> >       |
> > 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
>=20
> It looks like the rust binder driver also needs to handle
> !CONFIG_COMPAT. Here's a reference for that:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/r=
ust/kernel/miscdevice.rs?h=3Dv6.18#n410

Yeah, it just needs a `#[cfg(CONFIG_COMPAT)] like miscdevice. Do you
want to add it? Otherwise I'll get to it soon.

Alice
