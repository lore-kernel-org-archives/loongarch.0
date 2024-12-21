Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36A646;
	Sat, 21 Dec 2024 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734767260; cv=none; b=Uqp2jpzL+JBqQQ1Q2w1etJa1khfvpOsmw+eUmvR03+SU85StNGkkFd1LwuJUrac4gh9mpLI2cu+eWnb+nQtCUhdQuKQ4Qn6/ARG0+yyp8lUZLaSnRQlqKwnRh1sB9oo8oca+EXkzYRlriEilRmcoS5zCLH0KUmkiFGMimHfqHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734767260; c=relaxed/simple;
	bh=qRqAXKm2HRVn9eGyJUn2NuNThJt4E57rt97nhcHUOpI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=faWAd4q6pbY7yTbSXSeMZTOJmebcA4W4TnUTv/WUlnFWtvCmmUI0flIxj7maIACYglFGerDkCLasLP+/XgerzxV3SM9TJhxR8b1v/Jsj04WdfmkpoOJGQhF1GSy3gQ+pWmOOFH3xmcVgCAhb9L5BwjmJgnX6vEHpBixQ30+F+xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=PlO8lUo6; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="PlO8lUo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1734766817;
	bh=qRqAXKm2HRVn9eGyJUn2NuNThJt4E57rt97nhcHUOpI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PlO8lUo6Puxwx7/wEJVnN7NM1NK7/khxtONLqm9gWj490s7zIL6zxJbgEPRcGx6VV
	 a90P4x2VIoeSJcZT1J4yAasJOBLqO1stvf9lRZcEsQUsJhHu2s2/+VL23JFrUaP4Co
	 u+GcBhfWLcOdxUUkikqYnv6dJYRU8eAkTRVK6swQ=
Received: from [192.168.124.9] (unknown [113.200.174.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E0FC967827;
	Sat, 21 Dec 2024 02:40:14 -0500 (EST)
Message-ID: <05cdb3b4c9bddf25f7b839229b635d2dec5140a4.camel@xry111.site>
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction()
 noinline
From: Xi Ruoyao <xry111@xry111.site>
To: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Alex Deucher
 <alexdeucher@gmail.com>,  Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Nick
 Desaulniers	 <ndesaulniers@google.com>, llvm@lists.linux.dev
Date: Sat, 21 Dec 2024 15:40:12 +0800
In-Reply-To: <20241220223403.GA2605890@ax162>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
	 <20241217015006.30305-1-yangtiezhu@loongson.cn>
	 <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
	 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
	 <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
	 <4bace457-cc26-13a3-bc90-ad6ad12bc2ed@loongson.cn>
	 <20241220103100.GB17537@noisy.programming.kicks-ass.net>
	 <20241220223403.GA2605890@ax162>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2024-12-20 at 15:34 -0700, Nathan Chancellor wrote:
> > Now, the thing is, these ASSERT()s are checking for divide-by-zero, I
> > suspect clang figured that out and invokes UB on us and just stops
> > code-gen.
>=20
> Yeah, I think your analysis is spot on, as this was introduced by a
> change in clang from a few months ago according to my bisect:
>=20
> https://github.com/llvm/llvm-project/commit/37932643abab699e8bb1def08b7eb=
4eae7ff1448
>=20
> Since the ASSERT does not do anything to prevent the divide by zero (it
> just flags it with WARN_ON) and the rest of the code doesn't either, I
> assume that the codegen stops as soon as it encounters the unreachable
> that change created from the path where divide by zero would occur via
>=20
> =C2=A0 dc_fixpt_recip() ->
> =C2=A0=C2=A0=C2=A0 dc_fixpt_from_fraction() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 complete_integer_division_u64() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div64_u64_rem()
>=20
> Shouldn't callers of division functions harden them against dividing by
> zero?

Yes I think it'd be the correct solution.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
