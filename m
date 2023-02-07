Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78813BD33
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1675780783;
	bh=qK47dEiG4b3VDhFuj1VyNuLxehj7dUGSdSUafKPadoU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bpJXwySm6en2juFW83O1jqw75uV/ssKIDmQpmVWeZZbnB/zwKimKOhfcl5je3ra3n
	 C0/yL8wnlm8OPt08XD0flQroTl7rGyLXYdj9IMdj5tGCMhJ0aYH2BZm8D1LaD18oTP
	 HLI3Jkxy29dW1vqznGQlEZY5Go70PIwMqtex6rI0=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4246F65EB0;
	Tue,  7 Feb 2023 09:39:41 -0500 (EST)
Message-ID: <657d46fa2290ccfacdf5ae0f8e313870405293bb.camel@xry111.site>
Subject: Re: [PATCH v2 2/5] LoongArch: Use la.pcrel instead of la.abs for
 exception handlers
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>,  Jinyang He <hejinyang@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Tue, 07 Feb 2023 22:39:39 +0800
In-Reply-To: <20230207142822.52172-3-xry111@xry111.site>
References: <20230207142822.52172-1-xry111@xry111.site>
	 <20230207142822.52172-3-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-02-07 at 22:28 +0800, Xi Ruoyao wrote:
> +struct handler_reloc *eentry_reloc[128] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[0] =3D NULL, /* merr handler =
*/

Self review:

This is actually incorrect.  Currently the merr handler (except_vec_cex)
is coded as:

SYM_FUNC_START(except_vec_cex)
        b       cache_parity_error
SYM_FUNC_END(except_vec_cex)

Once this is copied into the per-cpu handler page, the offset (coded in
the b instruction) will be absolutely wrong.  But it's already incorrect
in the current mainline, and I'm not familiar with CSR.CRMD.DA=3D1
configuration so I'm not sure how to fix it.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
