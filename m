Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E801B640
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282860; cv=none; b=fKfp3d4IRMTz+fkEu73+4wvyB2oyujbI5LNg6SDbuLXWf8Hw9++dfNKkq/zZ+ftk/cgMONEMJtWQSGttbAKrqP0rn3QutpvvCx2TLF/NXskr5oKWl6oZtjnuOW/0oXSBQyOGggj1Bwyn7ia6eOewCDxZwNZ6a4Wo1nFMYPtGPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282860; c=relaxed/simple;
	bh=DcVyOJl4N6JdMEGdilhfvPdRdPphDjnHsE6G+MUXMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq0lhS/RhXoZKc8a/aJhU7/wA5j3Y4iVkawOxUtObRvrNTOC77TUocMHUxu67jFWjaigFiK+CMjWdI1Tep3K32miEnxjZH3d/+HQ26UGL4m++aJhKWEruFiyf7Sz2wWPsp8dpam0TjJ+bz9ws4FyvrvqiG0Co7QLA+hDIlL0wrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b=DrWiy2J7; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20230601.gappssmtp.com header.i=@hev-cc.20230601.gappssmtp.com header.b="DrWiy2J7"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6433f99eb15so4900235d50.3
        for <loongarch@lists.linux.dev>; Tue, 09 Dec 2025 04:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1765282858; x=1765887658; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtHvUJyJXoAPcA7ybAhgBQ3UgpJaoreQlfcUOq89mJ8=;
        b=DrWiy2J7CII3/7AO0+M86L+U+JFFz0gQQOh0gvQLlsf9E5/12PXvXqk9QyDFlBd78M
         u3xB4c1pEshGUk1P0OeR1bXX6oOYEP+oKV6TrES3QVCbMfWOZcab6XdGIEg1CpHg9WRF
         jmHacuRov/fmdEbSoWVoWlW9n3aP4C9BBPWIGAQ3qVJ4wUpIX/bRUJLVDFgRRiExOSr8
         PEA2nXqTVicEW9S+s+6nxd+jpJ1IF624i/aHc9p9cgXbES8ixDVWnBvaPfJlUvw8r/Lw
         pwDn853RbuXMd0JTSiiJaqizKzwV25EAIN7epiqiXXs62nchm7w5olGD/UkEPmMGJEVv
         4leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765282858; x=1765887658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BtHvUJyJXoAPcA7ybAhgBQ3UgpJaoreQlfcUOq89mJ8=;
        b=V2mTKBbnonimTLRrv5ycdsFVUyYoGo0Id9mPxwUSUYBGrjBHfPOcsj5kYsn2AsdbSD
         p7suEmQ4YyxXXKWdYuZ1v9UsVYqD3fafsKDubP/MHQx/QRUd/epP94+xWdy6LhtwBHkt
         K+iz6+u/X34MA+AiOEHBQCH+az3pUWQRj3hD0mW4fckkQdrySNw2DXKT+9JX0RZUZxK7
         L/UNtdgJ78kmDCnOAcRJ7RB5vLkzSssqyLnSmGzv8IVG6My7rasiLX8tcwiTlxFOQcX9
         osDfHZN78AV6KXZy9no3ZZnI6bfbdm74aDguqXnuKxGSTOliX+wgykrD1cWfWItYcyUR
         19Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV67B3dUS2jbIPW2NoWW/cPW5Ga5I6RV6viL+et/6iS5rHDC0LUHureZxhI8l4JefYEYanQL9gK+XY=@lists.linux.dev
X-Gm-Message-State: AOJu0YymhV1Z32f15S+guGz+GWujBewmQkAAaiSHoKkxhk5RbrYhXk5C
	lL8e0xzIyv6XWqAUxQZiCo9GeBHH4+PzKzxcc5fGzbGeksJ0Vq1IE1unh4ZuK9+JybvXNbokbuB
	g32rQ1CR2XvYq0PPOOO50ac3rb5DGkAIzNEMDGTfZXQ==
X-Gm-Gg: AY/fxX6i92jqLQ8GmbPFhmCFnP7DWVFZ3o7GmZeGQr1fmqxoDsI3rMO8lZb4DbwbMmO
	0ffXqYee+MvVuKNOnZi4f31RH8UoHAj04cRP3M0lPTTZQR7LGgPXtdKT3fu8Yoo7JPzTrtf/vAb
	x3k+yLApnnAGjKP6b3HU5qjwLgq6zltZ/5M41P9y99gcTUh2FrhZqiqAOYOA18q4aqOUHlvvJAH
	2SV8hgacZdnkUfzMifC0TNkAuINRgFWqXdhtehTroipPLeyGZE+153DRhLDM2MREWws3Z8I7Ky4
	hyVvOZweZTFFGhhleLHT3ZfWRtg=
X-Google-Smtp-Source: AGHT+IGSi78moVcosHIfBwAfq+G4VFa7OB4Cez2Hw1OSe5QP5qYgyYT8Biof6X5zCF2lqk/czc0BtFWe4bp0TMbUHrQ=
X-Received: by 2002:a05:690e:e89:b0:644:60d9:867a with SMTP id
 956f58d0204a3-64460d9885bmr3111728d50.95.1765282858146; Tue, 09 Dec 2025
 04:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
In-Reply-To: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
From: hev <r@hev.cc>
Date: Tue, 9 Dec 2025 20:20:46 +0800
X-Gm-Features: AQt7F2ra6QRDCLAUZ7aPEt6QG53BMFnNndcmdPbdE559yaO6Mfa35aKGedA7raE
Message-ID: <CAHirt9i3q2Ny=m_kjCO=ARnO22Kmf-f2jVSGmYATG61euzh2gQ@mail.gmail.com>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 6:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> I am seeing in mainline loongarch64 defconfig+Rust the following build
> error [1].
>
> Cheers,
> Miguel
>
> [1]
>
>  error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
>      --> drivers/android/binder/rust_binder_main.rs:317:38
>       |
> 317   |         compat_ioctl: Some(bindings::compat_ptr_ioctl),

It looks like the rust binder driver also needs to handle
!CONFIG_COMPAT. Here's a reference for that:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rus=
t/kernel/miscdevice.rs?h=3Dv6.18#n410

>       |                                      ^^^^^^^^^^^^^^^^ help: a
> function with a similar name exists: `compat_sys_ioctl`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:78264=
:5
>       |
> 78264 |     pub fn compat_sys_ioctl(fd: ffi::c_uint, cmd: ffi::c_uint,
> arg: compat_ulong_t) -> ffi::c_long;
>       |     -------------------------------------------------------------=
---------------------------------
> similarly named function `compat_sys_ioctl` defined here
>

--
hev
