Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296E923C5
	for <loongarch@lists.linux.dev>; Mon, 23 Oct 2023 08:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="jKwtdBW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1698050611;
	bh=5sGQLj6Xe46sp6vsAAGQQglvUAz3OFwB9FX1yIiN66M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jKwtdBW+zLw3ADx5pYsywAV1ucmNbz6JD+sg07zzSGSUugKIlUoR15wdiiV3kaC5y
	 8EP6476kRPacm9EeenCUuq1xlgM2E6S7d03kNNRJxtN2diKnEax/6f5B35Pek9i8db
	 gZUbxUemJbCybBSBA/TfbxYLTlNX9Gy7CSYQEA5M=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1495866B50;
	Mon, 23 Oct 2023 04:43:28 -0400 (EDT)
Message-ID: <4d3363eb5f4d864cfd171d89b1a13da5ef8b784c.camel@xry111.site>
Subject: Re: [PATCH v4 8/8] LoongArch: Add ORC stack unwinder support
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf
 <jpoimboe@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Huacai Chen
 <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	loongson-kernel@lists.loongnix.cn
Date: Mon, 23 Oct 2023 16:43:26 +0800
In-Reply-To: <1698048691-19521-9-git-send-email-yangtiezhu@loongson.cn>
References: <1698048691-19521-1-git-send-email-yangtiezhu@loongson.cn>
	 <1698048691-19521-9-git-send-email-yangtiezhu@loongson.cn>
Autocrypt: addr=xry111@xry111.site; prefer-encrypt=mutual;
 keydata=mDMEYnkdPhYJKwYBBAHaRw8BAQdAsY+HvJs3EVKpwIu2gN89cQT/pnrbQtlvd6Yfq7egugi0HlhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPoiTBBMWCgA7FiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQrKrSDhnnEOPHFgD8D9vUToTd1MF5bng9uPJq5y3DfpcxDp+LD3joA3U2TmwA/jZtN9xLH7CGDHeClKZK/ZYELotWfJsqRcthOIGjsdAPuDgEYnkdPhIKKwYBBAGXVQEFAQEHQG+HnNiPZseiBkzYBHwq/nN638o0NPwgYwH70wlKMZhRAwEIB4h4BBgWCgAgFiEEkdD1djAfkk197dzorKrSDhnnEOMFAmJ5HT4CGwwACgkQrKrSDhnnEOPjXgD/euD64cxwqDIqckUaisT3VCst11RcnO5iRHm6meNIwj0BALLmWplyi7beKrOlqKfuZtCLbiAPywGfCNg8LOTt4iMD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-10-23 at 16:11 +0800, Tiezhu Yang wrote:
> +ifdef CONFIG_OBJTOOL
> +KBUILD_CFLAGS			+=3D -fno-optimize-sibling-calls -fno-jump-tables -falig=
n-functions=3D4
> +endif

Why do we need to regress the code generation so much for objtool?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
