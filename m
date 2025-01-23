Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFE1E4A6
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641079; cv=none; b=ZZB9rthoWVeRzgrt0MCIQnchy02ZRxVOVginF66MGvTxBP8qnH892CrVeWoAZlJ3vhR8k3waq4yrdbfx8GLaf8MUpXHuTL1sIAMi1A5/l8kqxaBdsHjn9A2t0uF3YjEKHHV1O66BJ7FgsK7DKK/4Xst3w4N50Bd/sdCGJrNLdq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641079; c=relaxed/simple;
	bh=LvjuLJ61ExR/VDCzctgBj+Rvhuo5ezlhWZ7K6WMqoXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FnLjsrYSOJx2MygtH74BwoxUQ8k8IK9IXq1RWv7UkKzLXvpCelBJJHoUV7OPhme6qM9m4i51zgIdwxZjrobHVrI2LpRIlr30IeiEtJ+R9be7Kw+IVamixsAPN9Q1KpRKykdk0/I2mIfv0gVeQF7YtMlGA4gkWf24oGN87AyH7uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=L2BHQ2kW; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="L2BHQ2kW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1737641072;
	bh=C3LZOlcY6oTkAAQHuha3Jjhl9H7BgwsoXcKhXQVMnoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L2BHQ2kWgzxoFwCjLAZt33YSKk+hPS1Ic0feerTK26GHyEoujnp8MTrd+ya8Fxvug
	 HOeG3MQt+djd1D/DkZqT3zTftAsNW0/uEWsB5iKbuU+aaQddj9Buk63nFvx2i1JRBS
	 5TftvsAAiYR4lY/16Fwpm3hhMB/2v5IRmXxh/7uI=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id AAADB66FFF;
	Thu, 23 Jan 2025 09:04:30 -0500 (EST)
Message-ID: <ade86769d44670a1cb91842bb6d5d60f4a25f5d2.camel@xry111.site>
Subject: Re: [PATCH v2 2/2] LoongArch: Extend the maximum number of
 watchpoints
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 23 Jan 2025 22:04:28 +0800
In-Reply-To: <20250122032310.26729-3-yangtiezhu@loongson.cn>
References: <20250122032310.26729-1-yangtiezhu@loongson.cn>
	 <20250122032310.26729-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-01-22 at 11:23 +0800, Tiezhu Yang wrote:
> The maximum number of load/store watchpoints and fetch instruction
> watchpoints is 14 each according to LoongArch Reference Manual, so
> extend the maximum number of watchpoints from 8 to 14 for ptrace.
>=20
> By the way, just simply change 8 to 14 for the definition in struct
> user_watch_state at the beginning, but it may corrupt uapi, then add
> a new struct user_watch_state_v2 directly.
>=20
> As far as I can tell, the only users for this struct in the userspace
> are GDB and LLDB, there are no any problems of software compatibility
> between the application and kernel according to the analysis.
>=20
> The compatibility problem has been considered when developing and testing
> the patches, when the applications in the userspace get watchpoint state,
> the length will be specified which will not bigger than the sizeof struct
> user_watch_state or user_watch_state_v2, the actual length is assigned as
> the minimal value of the application and kernel in the generic ptrace:
>=20
> kernel/ptrace.c: ptrace_regset():
>=20
> 	kiov->iov_len =3D min(kiov->iov_len,
> 			=C2=A0=C2=A0=C2=A0 (__kernel_size_t) (regset->n * regset->size));
>=20
> 	if (req =3D=3D PTRACE_GETREGSET)
> 		return copy_regset_to_user(task, view, regset_no, 0,
> 					=C2=A0=C2=A0 kiov->iov_len, kiov->iov_base);
> 	else
> 		return copy_regset_from_user(task, view, regset_no, 0,
> 					=C2=A0=C2=A0=C2=A0=C2=A0 kiov->iov_len, kiov->iov_base);
>=20
> For example, there are four kind of combinations, all of them work well.
>=20
> (1) "older kernel + older gdb", the actual length is 8+(8+8+4+4)*8=3D200;
> (2) "newer kernel + newer gdb", the actual length is 8+(8+8+4+4)*14=3D344=
;
> (3) "older kernel + newer gdb", the actual length is 8+(8+8+4+4)*8=3D200;
> (4) "newer kernel + older gdb", the actual length is 8+(8+8+4+4)*8=3D200.

OK, I think it has cleared my doubts.

Reviewed-by: Xi Ruoyao <xry111@xry111.site>

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
