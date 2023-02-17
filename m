Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66107F
	for <loongarch@lists.linux.dev>; Fri, 17 Feb 2023 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676620955;
	bh=pOjzgFRo1D4loi7HlOELrLpIqKfwTeGmDwGBycgjXiM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z0Q/kP+JmbyQ5z0lZ1bYAlA3gTCVOIZ7uNIb7qZxvDnTyYta22iOmoi5S3Ju5LaAZ
	 nW62HsrLuObYhdD7hlaDc3bs6KwWRui3GCrm165l7+QyYZ4lK/vtvcX1lcAQO31lfI
	 7MKwrRMtoHTH7xuxkooZ5AxLARXQRo33gFRdfh7I=
Received: from [IPv6:240e:358:1156:5900:dc73:854d:832e:4] (unknown [IPv6:240e:358:1156:5900:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E875365CDC;
	Fri, 17 Feb 2023 03:02:31 -0500 (EST)
Message-ID: <5ac82f53aeb6a040be90eac2be7c64055e62f0ef.camel@xry111.site>
Subject: Re: [PATCH v5 4/5] LoongArch: Add support for kernel relocation
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  Jinyang He <hejinyang@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 17 Feb 2023 16:02:25 +0800
In-Reply-To: <1676618789-20485-5-git-send-email-tangyouling@loongson.cn>
References: <1676618789-20485-1-git-send-email-tangyouling@loongson.cn>
	 <1676618789-20485-5-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-02-17 at 15:26 +0800, Youling Tang wrote:

> This config allows to compile kernel as PIE and to relocate it at
> any virtual address at runtime: this paves the way to KASLR.
> Runtime relocation is possible since relocation metadata are embedded
> into the kernel.
>=20
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site> # Use arch_initcall
> Signed-off-by: Jinyang He <hejinyang@loongson.cn> # Provide la_abs idea

Use Suggested-by if only "idea" is provided.

> +struct rela_la_abs {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0long offset;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0long symvalue;
> +};

Use one tab instead of two for the indent.

Otherwise LGTM.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
