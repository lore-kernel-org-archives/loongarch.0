Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525372;
	b=bOpkrJRkkm+lRPPljfWVyL3M011aNEpoff+UvLgERCpE37sU9hprZDt+w9eHQNeQbbHI
	 P7P2hAy0Mk+eP1KRabOXmGx0li11Mba2bKbUAMr59lfljR8B2Vq/wTR7Lbz8KdhDxJ4Q6
	 wDNnfIaxWc9DPU1bh7gODdqFG9q9c6Ql4UqSkJe/SrgWh+5hsHwPUmnKyG/vbGaux5jrN
	 iEWmHjpda2V2rcqav61ZXwl558U4rg70WtXE8gS2cP1GBnbxlIzPW2xaBmaiuEdrvPZBf
	 4CeUpF7Q/lYkQ8/QVq6ORi0d6iXl374bBuYix330OsdW50nO3hADJE3ZXQ2WOK1XHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525372;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=e7umvq3b2Qjy6OI4P5AfLqfekqPHHMBAinW/wTd6ikg=;
	b=jQfxc8/F7mIoYg/qJLwPbaHaZAUho4kvwV4TawHNjZYFpKyimGkaZWWZfN8aAtufHPc0
	 sD5y5FqeYkKKFIPOOdt8ihW+Pa5cz1/HJvzh/vUTQgkKBTnww6IePoQsWonQwr2qaRjWl
	 x2hFetDsurvzA75XMnVNSVrvlOmfLo8xrS3aEMAiJa2zNfbAj5kvox3smzlWGhA8tvtoB
	 kI9Jv50px9UtBSF8WEhBBI/jKHi2IO+Cj+R8Jori1FkyDbHiV7BaazPNoBkjSAtWyiWKQ
	 iX1pIPcDW64LaYAV/W9rGfNxV6YShrOJJdy5jVQFcf//da4hhLHGmLbWgjF2kU+Ey/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xry111.site;
	spf=pass smtp.mailfrom=xry111.site;
	dkim=pass header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b="WTJzaO/Y";
	arc=none smtp.remote-ip=89.208.246.23
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A5606A31E
	for <loongarch@lists.linux.dev>; Tue, 24 Nov 2026 13:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=WTJzaO/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1795525359;
	bh=e7umvq3b2Qjy6OI4P5AfLqfekqPHHMBAinW/wTd6ikg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WTJzaO/Yml+FImT9nkd5vU/rhpD5MScZLTqBe9h2H2KF/kEbGMb2snKLIcuQAlk46
	 zYINEDApkRBq3QIrXE5VuLFFCjgLpMDPgqN6uIxu1rh7r4vpLuaw8zMrwoNEce0/CJ
	 gdKRKZJP/88mKPLaiAPcgKG93NE+MVrb0tMpbOyo=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3E28F65EC3;
	Tue, 24 Nov 2026 08:02:37 -0500 (EST)
Message-ID: <84a64a3f632f9e1e3208c0ceac55cedf0f266e9d.camel@xry111.site>
Subject: Re: [RFC PATCH v2] kbuild: modinst: drop orphaned local labels from
 stripped modules
From: Xi Ruoyao <xry111@xry111.site>
To: Wentao Guan <guanwentao@uniontech.com>, nathan@kernel.org, 
	mengqinggang@loongson.cn
Cc: chenhuacai@kernel.org, linux-kbuild@vger.kernel.org, 
	loongarch@lists.linux.dev, charlie@rivosinc.com, masahiroy@kernel.org
Date: Tue, 24 Nov 2026 21:02:34 +0800
In-Reply-To: <6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
References: <20261124035942.GB2738970@ax162>
	 <6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 18:54 +0800, Wentao Guan wrote:
> INSTALL_MOD_STRIP=3D1 maps to "strip --strip-debug", which is a section
> operation: it removes .debug_* and .rela.debug_* but leaves the symbol
> table alone.=C2=A0 When the assembler has to name gcc's -g labels in the
> relocations it emits for debug data, those labels stay in .symtab and
> survive the strip as orphans.=C2=A0 Whether that happens is a property of=
 the
> target's assembler, not of the kernel: the x86-64 and arm64 assemblers
> resolve the DWARF references against the section symbol with an addend,

Qinggang has recently improved ld.bfd to handle relocations against
section + addend in relaxation, thus I guess the assembler can be
modified to use section + addend like x86-64 and arm64 for DWARF now
(maybe opt-in with a switch to keep compatibility with old linkers).

--=20
Xi Ruoyao <xry111@xry111.site>
