Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9796FEAE7
	for <loongarch@lists.linux.dev>; Tue, 25 Nov 2025 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764039859; cv=none; b=bMsOf9G1MjD4rJ6Usa61VAQzLQwmOJur9z9J2OxN1Zba7nMwJSi0iDZywUOuURLsymu1zEuuI3QGeFljw/7UlcvYCBYo/n1XGNYLQJ7h1xcy7DqRVoWlHlHmKj+atinmSrXfuqLfXaqQun6WHmtk0mfwtGI5q2vWdi0CZXXR4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764039859; c=relaxed/simple;
	bh=JBl63hWAEK/GRojoZXokHB8Vq1ZBLQAF2hwWMnB/rTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qk9DCsTiufgJ0Xl3OkmB2KIW2Hr6KnzySCOj3XGvA//L5OKXGpsDc2P3t772RhrObiyIOWCqZuUUcai4tJEJWXZkEkWRUrACa/hibK8QrbAi/o67Ndg/7DH9MUpkqUZiT9ZzeY9t+jyMUTwzl8l2cXBNrwZNu3cDjKKlsN1qU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=B8rUZ0ID; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="B8rUZ0ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1764039850;
	bh=sKMyWSht7cvWRcQOXOzbe03MhESKEfY7g6L6ISDGDZw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=B8rUZ0IDX3OPRRNuSW3c5iCK9dkP2rgceILhNxJ/qOCpEDVZzXqEnWB5xJrKStiqU
	 o3O+UHFzvc65dXFK+yzSRkZolOeOL2MmwO2E5wNhkHzvVXE11RJ4AywzX44F8IP4eq
	 J9FGDpriVuCYWhTUkIWRETG/33Gc/ITG376NkUaE=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 507C566E56;
	Mon, 24 Nov 2025 22:04:07 -0500 (EST)
Message-ID: <d35ea927d520569ac8b7482f5fedbe916005ff83.camel@xry111.site>
Subject: Re: [PATCH v2 1/2] LoongArch: Add 128-bit atomic cmpxchg support
From: Xi Ruoyao <xry111@xry111.site>
To: George Guo <dongtai.guo@linux.dev>, hev <r@hev.cc>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, George Guo
	 <guodongtai@kylinos.cn>
Date: Tue, 25 Nov 2025 11:04:03 +0800
In-Reply-To: <20251125104316.00001294@linux.dev>
References: <20251124-2-v2-0-b38216e25fd9@linux.dev>
		<20251124-2-v2-1-b38216e25fd9@linux.dev>
		<CAHirt9gjjULM6CGDR2pHJkQAKMsoZ8kpqtPn79psJQP1uu6FsA@mail.gmail.com>
	 <20251125104316.00001294@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-11-25 at 10:43 +0800, George Guo wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=3DZB" (__ptr[0])
> > > =C2=A0=C2=A0=C2=A0=C2=A0 \
> >=20
> > "ZB" isn't a legal constraint for the address operand in sc.q. When
> > assembled, it turns into something like sc.q $r,$r,$r,0, which clearly
> > doesn't match the instruction format, yet gas happily accepts it wheil
> > clang rightfully rejects it. Classic GNU-as leniency biting again. :)

I clearly remember when Jiajie submitted the sc.q support to GAS
Qinggang was really insistent on supporting the additional ",0" here.=20
But I don't really understand why we must support it...
>=20
> Thanks for your advice, I tried sc.q with r or ZC. the result as
> below: (with gcc 14.2.1 in fedora-42)
> =C2=A0=C2=A0 - sc.q with "r"=C2=A0 caused system hang

It won't work because it'll pass the value (not address) of __ptr[0].

> =C2=A0=C2=A0 - sc.q with "ZC" caused compiler error:
> =C2=A0=C2=A0=C2=A0=C2=A0 {standard input}: Assembler messages:
> =C2=A0=C2=A0=C2=A0=C2=A0 {standard input}:10037: Fatal error: Immediate o=
verflow.

It won't work because the only accepted immediate of sc.q is 0, but ZC
would allow any factor of 4 in [-32768, 32768).  I.e. ZC is for
{ldptr,stptr,ll,sc}.{w,d}.

As ZB is only used for sc.q (yet) in GCC backend maybe we can change ZB
to print simply $rX instead of $rX,0 and make LLVM do the same.  Would
someone submit a GCC patch for that?  Or is there already such a
constraint but I don't know?

BTW for the barrier between ll.d and ld.d, "dbar 0x700" is enough to
order two loads on the same address, and a Loongson hardware engineer
just confirmed me privately that "same address" can be read as "in the
same cacheline" here.  Thus it's enough in our case and it has a lower
overhead than "dbar 0".

--=20
Xi Ruoyao <xry111@xry111.site>
