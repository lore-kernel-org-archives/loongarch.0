Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A75BA27
	for <loongarch@lists.linux.dev>; Tue,  3 Sep 2024 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725389877; cv=none; b=osDEvlkicepqoIDi6YkMcZWxN+ThWtheudVRx2lUBU3gAzX7QC3HD3JClu5Fg945V7474//trqGYHdPxHaHmgIBKqbmFb1Bft2FVH3nQ29VcfrNBautRJ3v8suq3iQ3Mk1177sDzJGgc8KBOqGdsQXylGAn8ewZCl+ssMIALzdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725389877; c=relaxed/simple;
	bh=LtSe41g4xMT3I6xsCi6Abnp6KgGqZSsfBXDPXJAFdFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnkopmbciqyRgLUEPNMB7y34xrbNVYVzC0nQKlhTjl2+CgDuR59Y/WosgQAXr/erxcvj6tx8IaaHOxp4063iYsJP3Y16buQvGV6UZN7x1FMHZqlEIKvx/AXj1Afz48E8gRgzKu6LG82xtSku9MUtrV0/3fnL7NM3PgY0XKmoQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 0C72366A44;
	Tue,  3 Sep 2024 14:57:53 -0400 (EDT)
Message-ID: <e01dcb5fc34b4686c7fb32d1644802c164910ecb.camel@xry111.site>
Subject: Re: [PATCH] longsoon/percpu: Simplify _percpu_read() and
 _percpu_write()
From: Xi Ruoyao <xry111@xry111.site>
To: Uros Bizjak <ubizjak@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Gleixner <tglx@linutronix.de>
Date: Wed, 04 Sep 2024 02:57:52 +0800
In-Reply-To: <20240903102342.36957-1-ubizjak@gmail.com>
References: <20240903102342.36957-1-ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-09-03 at 12:23 +0200, Uros Bizjak wrote:
> +#define _percpu_write(size, _pcp, _val)					\
> +do {									\
> +	unsigned long __pcp_val =3D __pcpu_cast_##size(_val);		\
> +									\
> +	__asm__ __volatile__ (__pcpu_op_##size("stx") "%[val] $r21, %[ptr]	\n" =
\

Missing a comma before $r21 (as the bot already pointed out).

> +		:							\
> +		: [val] "r"(__pcp_val), [ptr] "r"(&(_pcp))		\
> +		: "memory");						\
> +} while (0)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
