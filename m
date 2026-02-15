Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B9121423C
	for <loongarch@lists.linux.dev>; Sun, 15 Feb 2026 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771119916; cv=none; b=QWFktkNEekMVcmrOXtt0dXpt5BQ0Nm8vJqL6l5UIwwFn/YL2hhUb9PHK12eucqMHI/DJKI0E4eEbP5Goz3lcTSXwH/h/0CJFwVk/u3hTLHemjr8jxE+6xkcTFS8kcrdemuxe79RjHzAwjFLAQQLukOZp/Cj2U162OR36fxHQLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771119916; c=relaxed/simple;
	bh=+Ea9uuDxuwAxMR3n5hCMzRptnqMr7YUhvoaXYvakIcc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DPcNDhbVITZ2PK7cVrCdcFhJTn2mVa9tHcY6mU4hEVsyWSfgUGM/dlZF4SacGIuFXvD1g3bbOZkosc0TQP69LOJnRxKJbtuTgdAJS+dC+gmycfvol8gstRjyhplsMD5SZnGGDRpj57GeYIEECaz3RY8v62sJyaxHjZIcb3ZHljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=PPVUolSl; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="PPVUolSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1771119911;
	bh=+Ea9uuDxuwAxMR3n5hCMzRptnqMr7YUhvoaXYvakIcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PPVUolSlSHFJZlNgVHRAVI/TMEduVyfjtXavr9qjg6lPrtGlxwp+H4Wq4ayrRSIjx
	 SHUzRwmYSZxlTf9hhfbfnE1RKZ/6VGhK+OUT3h772R0D8TQkfYWC6cZevPO3qNiA09
	 K42SSwm3fO+ign3xW6Gu6ZYvC6n4TMok4mRF7KX4=
Received: from [IPv6:2408:8427:6a1:ffef:e8db:401f:fb26:6337] (unknown [IPv6:2408:8427:6a1:ffef:e8db:401f:fb26:6337])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 0B83766F88;
	Sat, 14 Feb 2026 20:45:04 -0500 (EST)
Message-ID: <02ca50afa03cb21088d67bac055f0e08f70e6d1e.camel@xry111.site>
Subject: Re: [PATCH v2] rust_binder: Fix build failure if !CONFIG_COMPAT
From: Xi Ruoyao <xry111@xry111.site>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>,
 loongarch@lists.linux.dev, hev <r@hev.cc>,  Miguel Ojeda
 <ojeda@kernel.org>, stable@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?=	
 <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner	
 <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Matt Gilbride	
 <mattgilbride@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, 	linux-kernel@vger.kernel.org
Date: Sun, 15 Feb 2026 09:45:01 +0800
In-Reply-To: <CANiq72naHZT+CuuMBFAoKmzTjVRZpicL+Wo9ai3QY5Rja-v1sA@mail.gmail.com>
References: <20260214133337.112720-1-xry111@xry111.site>
	 <CANiq72naHZT+CuuMBFAoKmzTjVRZpicL+Wo9ai3QY5Rja-v1sA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-02-14 at 23:18 +0100, Miguel Ojeda wrote:
> On Sat, Feb 14, 2026 at 2:34=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wr=
ote:
> >=20
> > Reported-by: Miguel Ojeda <ojeda@kernel.org>
> > Closes:
> > https://lore.kernel.org/all/CANiq72mrVzqXnAV=3DHy2XBOonLHA6YQgH-ckZoc_h=
0VBvTGK8rA@mail.gmail.com/
>=20
> Hmm... Wasn't this applied as:
>=20
> =C2=A0 174e2a339bf7 ("rust_binder: Fix build failure if !CONFIG_COMPAT")
>=20
> Then there was also this other thread:
>=20
> =C2=A0
> https://lore.kernel.org/rust-for-linux/20260105-redefine-compat_ptr_ioctl=
-v1-1-25edb3d91acc@google.com/
>=20
> which got applied as:
>=20
> =C2=A0 68aabb29a546 ("rust: redefine `bindings::compat_ptr_ioctl` in Rust=
")

Oops, just saw the mail regarding your email address yesterday when I
was archiving mails in 2025 and I thought the patch was blocked by the
issue.

Disregard this then.


--=20
Xi Ruoyao <xry111@xry111.site>
