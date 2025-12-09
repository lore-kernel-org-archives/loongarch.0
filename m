Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B866285CB9
	for <loongarch@lists.linux.dev>; Tue,  9 Dec 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280367; cv=none; b=h0Ta+q6/rnMACz3hhajb+z2hnQOPvTu+cPOv7qJF5hlZpF7DPWLFyFk4Pmd6YFQz/fwgn1/igYlAXY2Ms0StsY/ga3dE8Z7hcVf4nVZhSPmnUYhKgzmWwPw7x79juLwBQe4cfnBRezyTprjnO+CYBppsaOUMINZYTDH5Gofa7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280367; c=relaxed/simple;
	bh=JASJFymmHEE+03TJCMcRA+WQT91fNCC9u7nLosB+wQk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ncgBu4scZ5+cDSToZPrWTWWfy5AWFkuJzukNfAL10uM4kBL7inf8TjPWMb99nJZReEPlduskddcvYvRkjkScgEXCTOERL6kGvYL2qCOYzM9fHUXoxAv3JmG5R+WiWBOftIS6Aa2Hfhay9VhCUXu95HdujpekSLJs9NX/kTPuouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=c4uCiPGR; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="c4uCiPGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1765279736;
	bh=feYjYZt3lAYhpw83489LQO33YflIoPzI0pKB0wBY1Hg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=c4uCiPGRyX5lEjNUNCePWqFiNTPtpRTKBK4zP45gsBIney4aCQYBQV9fiLKoGeO7P
	 0p8Wi79Xud9fz+XUnUuzQKvEIqDEGp5AlZSr7HBqaFIi/Vx1mSQqtRljuAeY9o09zr
	 Cccq9DjOnT9MzOGCMOL6V7jLf7HJgBhC/q8Rvqew=
Received: from [IPv6:2409:8a4c:e27:5840::b3c] (unknown [IPv6:2409:8a4c:e27:5840::b3c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C72A166B53;
	Tue,  9 Dec 2025 06:28:50 -0500 (EST)
Message-ID: <fb77069524eec1df222b2ecbc6ddf5c3b4b041bb.camel@xry111.site>
Subject: Re: Mainline loongarch64 defconfig+Rust build error
From: Xi Ruoyao <xry111@xry111.site>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Huacai Chen
	 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Alice Ryhl
	 <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?=
	 <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner
	 <christian@brauner.io>, Carlos Llamas <cmllamas@google.com>
Cc: =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>,  Andreas Hindborg <a.hindborg@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, loongarch@lists.linux.dev, rust-for-linux	
 <rust-for-linux@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Tue, 09 Dec 2025 19:28:33 +0800
In-Reply-To: <CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
References: 
	<CANiq72mrVzqXnAV=Hy2XBOonLHA6YQgH-ckZoc_h0VBvTGK8rA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-12-09 at 11:56 +0100, Miguel Ojeda wrote:
> Hi all,
>=20
> I am seeing in mainline loongarch64 defconfig+Rust the following build
> error [1].
>=20
> Cheers,
> Miguel
>=20
> [1]
>=20
> =C2=A0error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindin=
gs`
> =C2=A0=C2=A0=C2=A0=C2=A0 --> drivers/android/binder/rust_binder_main.rs:3=
17:38
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> 317=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compat_=
ioctl: Some(bindings::compat_ptr_ioctl),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^ help: a
> function with a similar name exists: `compat_sys_ioctl`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> =C2=A0=C2=A0=C2=A0=C2=A0 ::: /__w/quick/quick/linux/rust/bindings/binding=
s_generated.rs:78264:5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> 78264 |=C2=A0=C2=A0=C2=A0=C2=A0 pub fn compat_sys_ioctl(fd: ffi::c_uint, =
cmd: ffi::c_uint,
> arg: compat_ulong_t) -> ffi::c_long;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ----------------=
---------------------------------------------------------------------------=
---
> similarly named function `compat_sys_ioctl` defined here

I highly doubt if this is really a LoongArch-only issue.  We have:

#ifdef CONFIG_COMPAT
extern long compat_ptr_ioctl(struct file *file, unsigned int cmd,=20
                    unsigned long arg);
#else
#define compat_ptr_ioctl NULL
#endif

AFAIK bindgen does not translate C preprocessor macro definitions, so
when !CONFIG_COMPAT we won't have the Rust binding for it.

And as LA32 is not upstreamed it's pointless to support COMPAT for
LoongArch, yet.

--=20
Xi Ruoyao <xry111@xry111.site>
