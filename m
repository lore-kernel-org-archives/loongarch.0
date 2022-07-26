Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22672568
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1658841409;
	bh=RIm3DXyPj/WtOc/AdUg+ib7WOWK+AmMUDo4YcNKQR44=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eQToV5gkpO+Kg8oNqoWz9GxY7fJGwoQCfYwXZbsyqDeFdYLcwew61HkJC7h3TeuA/
	 zdv8aVZw5o00be5JkIWtkAyYIpwS2bDqd7pfL/HrBGEFe2vQrgvRjiFWS3XLK8CrTe
	 kJ7isMljJ4QV7Nx2Azf5m5rm8KQwCZQ0es5rtzD8=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E650566828;
	Tue, 26 Jul 2022 09:16:47 -0400 (EDT)
Message-ID: <c66894dff7cdcef019a7b942b40427dd2fbfbcee.camel@xry111.site>
Subject: Re: [PATCH v2 5/6] LoongArch: Simplify "BLT foo, zero" with BLTZ
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Jinyang He <hejinyang@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Date: Tue, 26 Jul 2022 21:16:46 +0800
In-Reply-To: <7222c4df-a21d-8149-4618-c1961959244a@xen0n.name>
References: <20220726122920.2291947-1-kernel@xen0n.name>
	 <20220726122920.2291947-6-kernel@xen0n.name>
	 <8a2ea087-ac01-e644-3460-0ceb8685e792@loongson.cn>
	 <7222c4df-a21d-8149-4618-c1961959244a@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2022-07-26 at 21:12 +0800, WANG Xuerui wrote:

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrrd=C2=A0=C2=A0 t0, =
LOONGARCH_CSR_BADV
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 blt=C2=A0=C2=A0=C2=A0=C2=A0 t0, $=
r0, vmalloc_modify
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltz=C2=A0=C2=A0=C2=A0 t0, vmallo=
c_modify
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrrd=C2=A0=C2=A0 t1, =
LOONGARCH_CSR_PGDL
> >=20
> > =C2=A0=C2=A0vmalloc_done_modify:
> >=20
> >=20
>=20
> Heck. Not even the usage of register ABI names is consistent, maybe I=20
> over-estimated the code quality in general...

Frankly, sometimes I deliberately write "$r0" instead of "$zero" in
assembly code because I think "0" is explicit enough and "zero" is too
long :(.


--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
