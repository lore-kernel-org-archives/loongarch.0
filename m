Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9F01C29
	for <loongarch@lists.linux.dev>; Thu, 28 Jul 2022 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659015046;
	bh=5oTiHyOqGMawFY6tGFgbqtXOrPzO1JFb4QEGmlDiFJ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T54MoILf1qdvnrImPAyGaR/fk8q5mQMl1TZGl8Xf4ongKnRPe8RGkbU/TZrSpsTXZ
	 cstEVYH+ytGW4V0KbquVJ3QoIq3jtRBsOErQfTpre/ZYEhMMtT2NlbCFgtkPS+ZWEg
	 1LYw9k1bFEJqqn1xJoJrDOP0cxh2rAOR0nwJJQEc=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A808166970;
	Thu, 28 Jul 2022 09:30:44 -0400 (EDT)
Message-ID: <20d86df48af5e0f0f17a1b1bc6b365d1c158280f.camel@xry111.site>
Subject: Re: [PATCH v2 4/4] LoongArch: Support modules with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>
Date: Thu, 28 Jul 2022 21:30:42 +0800
In-Reply-To: <1c1b5d2f-84f0-534c-ace2-2da48b5a7419@loongson.cn>
References: <c596e7a73953a1c49e8f5e94ec2db642f72e7813.camel@xry111.site>
	 <93087353ec0d23c56345d4c05e3d9719b284942c.camel@xry111.site>
	 <1c1b5d2f-84f0-534c-ace2-2da48b5a7419@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-07-28 at 20:41 +0800, Youling Tang wrote:
> Unaligned is handled more efficiently before overflow checking, while
> being consistent with apply_r_larch_sop_imm_field.

Will move unaligned before overflow in V3.

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*location &=3D ~(u32)0x3ffff=
ff;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*location |=3D (offset >> 18=
) & 0x3ff;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*location |=3D ((offset >> 2=
) & 0xffff) << 10;
>=20
> It may be better to use the loongarch_instruction format to modify the
> immediate field of the instruction, similar to the following:
>=20
> union loongarch_instruction *insn =3D (union loongarch_instruction *)loca=
tion;
>=20
> offset >>=3D 2;
> insn->reg0i26_format.immediate_l =3D offset & 0xffff;
> insn->reg0i26_format.immediate_h =3D (offset >> 16) & 0x3ff;

Will use union loongarch_instruction in V3.  Why didn't I notice it
before? :(

Thanks for the review!

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
