Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB46132111
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074576; cv=none; b=EW6R6sKSCFYMnnSMAgVNv3AvteNf/xvkXE35hH8Tqg8wLI4ps5OmOAlvNMbhNDya0c1wy6XXQayyGF1JBdSYnVVmX3re0HijNRkWzXCkTRPt7d0fDoga1525ZLkD4pVej5xZGd8Xhad8NvKY29MnphFjDhIKer8ub+RACMb9e0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074576; c=relaxed/simple;
	bh=0c/JgpmJ1xTs7JmUkSsvLVns0tnoWAn8saEOOAw9J1U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+4Tu+VA66bCRpUKIO0y3KQcSNNFNPhq1sH4ZMRFqRxm7wi17wPPRpQtWQoYzytJ+HPA/KXlKe+mBHcpWYpgh+x2TWYuNE+fpSHbuRs39iwzkCtImnpRfHjc4yXa6sNxQE8ZrUrfFts4IRzn5Q3sm/kH7sSYpQtf5gBqKomR+TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=hihqECuf; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="hihqECuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1741074568;
	bh=zIfEwkuAD57F3pZZRAjdPIKbEPJpjqKvEDPzL5jBHrg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=hihqECuf0P5oDT+4STeTsnZtLmnDYfVQXfuJMdd+ckCsztu+KGwHfcRyf/9XcGORe
	 SNqLlCFwPSUefVuPIfN0ZwPCSW6pFMqsD2Abw3iflLyQwHW3FnwaYFNAiHdm1TmHj3
	 j5UW0GlDTiQ77K56nW0HUTpL2arb0ibRKRqxzUCs=
Received: from [192.168.124.9] (unknown [113.200.174.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4316865901;
	Tue,  4 Mar 2025 02:49:25 -0500 (EST)
Message-ID: <aab657d72a3ee578e5c7a09c6c044e0d5c5add9a.camel@xry111.site>
Subject: Re: [PATCH] rust: Fix enabling Rust and building with GCC for
 LoongArch
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Rui <wangrui@loongson.cn>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich	 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, 	stable@vger.kernel.org
Date: Tue, 04 Mar 2025 15:49:22 +0800
In-Reply-To: <20250304073554.20869-1-wangrui@loongson.cn>
References: <20250304073554.20869-1-wangrui@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-03-04 at 15:35 +0800, WANG Rui wrote:
> This patch fixes a build issue on LoongArch when Rust is enabled and
> compiled with GCC by explicitly setting the bindgen target and skipping
> C flags that Clang doesn't support.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: WANG Rui <wangrui@loongson.cn>
> ---
> =C2=A0rust/Makefile | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index ea3849eb78f6..2c57c624fe7d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -232,7 +232,8 @@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-387 -mprefer=
red-stack-boundary=3D% \
> =C2=A0	-mfunction-return=3Dthunk-extern -mrecord-mcount -mabi=3Dlp64 \
> =C2=A0	-mindirect-branch-cs-prefix -mstack-protector-guard% -mtraceback=
=3Dno \
> =C2=A0	-mno-pointers-to-nested-functions -mno-string \
> -	-mno-strict-align -mstrict-align \
> +	-mno-strict-align -mstrict-align -mdirect-extern-access \
> +	-mexplicit-relocs -mno-check-zero-division \

Hmm I'm wondering if we can just drop -mno-check-zero-division from
cflags-y: for all GCC releases it's the default at either -O2 or -Os,
and AFAIK we don't support other optimization levels.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
