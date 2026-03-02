Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9E175A93
	for <loongarch@lists.linux.dev>; Mon,  2 Mar 2026 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418159; cv=none; b=ZnFo1wtyvuAle5dvDJ1kLCNMGCfFtSc/2TYu+HFWaPhf0elxLXxWgf4M6dpD02ZWiBsB37XRrkVyT9pxT9Vx9SuW2Kc9XJMoFUJrfV1ox0DAfOs2awLEeO2shJWgzOjC19/MyhCxyLXKUu6cI/p0ADxXMjtHK37Kl0OnBvr5x9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418159; c=relaxed/simple;
	bh=6zAy6gReJcleCqNHP1MmxDQ9Xz+aQderSR0GGhLr1pI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ViGNVwb4kjQ7WxaPPt4T3F5eDqvjyPZji1Y26L2VdvLJcGAGQyaQTHKHjDrjE51QL3Z/M7C+zpom26WdJL4mnrmvGxFLbaQ3MDV8qso8idxnRKKlbBr7588WFegK2E4KhUzsHzWP33tBaCO/AXQlUIkvntfqxQUPN0+YL7VQhdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=lm7N2ZIm; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="lm7N2ZIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772418148;
	bh=6zAy6gReJcleCqNHP1MmxDQ9Xz+aQderSR0GGhLr1pI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lm7N2ZImQhodvGc2BqpdKduMN036R8BbCgpOTPJDmWK/nKCMuzHMa0C6dKfWZXUzm
	 9CWJVusSrx5JxW6d4BY32NmVQxOIoUAszHDJFUx6iZAb2IXdPfy367PzVLrwjYnqVR
	 qKsf7Gm5OBLno2fMOQze9cpj+0blCrMDRRGsJKsQ=
Received: from [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8] (unknown [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 512C16760A;
	Sun,  1 Mar 2026 21:22:25 -0500 (EST)
Message-ID: <9bb8b1ae61ccebec6460e2b271cbcc709aba9765.camel@xry111.site>
Subject: Re: loongarch64 objtool warning with LLVM 18 in Rust object file
From: Xi Ruoyao <xry111@xry111.site>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Josh Poimboeuf
	 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Huacai Chen
	 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, 	loongarch@lists.linux.dev, rust-for-linux
 <rust-for-linux@vger.kernel.org>,  Nouveau Dev
 <nouveau@lists.freedesktop.org>
Date: Mon, 02 Mar 2026 10:22:20 +0800
In-Reply-To: <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
References: 
	<CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-03-02 at 00:42 +0100, Miguel Ojeda wrote:
> Hi objtool & loongarch,
>=20
> I noticed an objtool warning in a Rust object file for loongarch64 in
> mainline:
>=20
> drivers/gpu/nova-core/nova_core.o: warning: objtool:
> _RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
> return with modified stack frame
>=20
> From a quick test, I saw it happened only with older upstream Rust
> binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
> version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.

/* snip */

> While with LLVM 19 I get:

/* snip */

> =C2=A0=C2=A0=C2=A0 lu12i.w=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $a2, 1
> =C2=A0=C2=A0=C2=A0 ori=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 $a2, $a2, 0x870
> =C2=A0=C2=A0=C2=A0 sub.d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 $sp, $sp, $a2
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 lu12i.w=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 $a0, 1
> =C2=A0=C2=A0=C2=A0 ori=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 $a0, $a0, 0x870
> =C2=A0=C2=A0=C2=A0 add.d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 $sp, $sp, $a0

/* snip */
>=20
> So I suspect the stack pointer is not getting tracked properly and
> thus the mismatch. Is it a known limitation for `objtool` on
> loongarch64?

It indeed looks like objtool cannot handle the sp update using a scratch
register above.

--=20
Xi Ruoyao <xry111@xry111.site>
