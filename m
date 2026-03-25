Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F1218845
	for <loongarch@lists.linux.dev>; Wed, 25 Mar 2026 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409205; cv=none; b=G8lcnARpYK2wkOTQQc4HjNVIV9hG/DAXztElU1m4CKvC3GZTKCDshjmnxknNnCzUXYttz+XBkST7sieWLc3N6hVMtft+c4/iOwZ4/CnuuoBCjy8tHR26BFPoCKXVB90mbXDrjYxs86MogaRvdw5ZgN72emliYaali2Yl+uWZtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409205; c=relaxed/simple;
	bh=6bAVPZN1mZgsk2TdUJZeP9VpieVDxb9weRrdrNnebDI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lD8lT1NBUo97nlhXCUpKPiCo2iWsPuF2RSyxjw/DTUkQFZyZXWORPYkDPW721qQ7WdIQtX3fqYc9QMDHM9CPg0fYlECvGlgPnERDVVFH0vupe1wrYl38EMhi9Z3WVWd/YKvDzfcFO4UMBEUtAo+z4njYWM2fsypgnqcjpvz+gUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=bMHbPdys; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="bMHbPdys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1774409196;
	bh=zZo58Go2tAecbMRj3oz2F/GuCV3eMntZ3HaMMfS6Z/M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bMHbPdysRYSWlloHqwdsmY3SQKZauvck6S7Dv6adhMlkIzg9xnOdsw9C4ofoavqIk
	 O92kCi/sf96q65ejlOYcwVcxHeN2sBvQH3djl/6Wm6VcIzPe7Z0H48U9/XW5A1ByNZ
	 bGpJXSp5AA3OOnHM+eNEF1iEzBatThRpwyV0PIeE=
Received: from [IPv6:240e:469:20a:7e7b:f432:5571:7278:2f40] (unknown [IPv6:240e:469:20a:7e7b:f432:5571:7278:2f40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D2D371A43D9;
	Tue, 24 Mar 2026 23:26:33 -0400 (EDT)
Message-ID: <f59de81b411d1a48f9f0fa4f8c9c553a92076817.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: add spectre boundry for syscall dispatch
 table
From: Xi Ruoyao <xry111@xry111.site>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	loongarch@lists.linux.dev
Cc: arnd@arndb.de, jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 stable <stable@kernel.org>
Date: Wed, 25 Mar 2026 11:26:29 +0800
In-Reply-To: <2026032456-crinkle-washable-96ea@gregkh>
References: <2026032456-crinkle-washable-96ea@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-03-24 at 17:30 +0100, Greg Kroah-Hartman wrote:
> The LoongArch syscall number is directly controlled by userspace, but
> does not have a array_index_nospec() boundry to prevent access past
> the
> syscall function pointer tables.
>=20
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Assisted-by: gkh_clanker_2000
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> My scripts caught this as I think LoongArch is vulnerable to the

There's no evidence.  The kernel currently report all LoongArch
processors invulnerable to spectre V1 via cpuinfo.

So NAK unless there's a reproducer of spectre V1 on LoongArch.  If so
we'd also need to adjust the cpuinfo output.

--=20
Xi Ruoyao <xry111@xry111.site>
