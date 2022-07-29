Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB131360
	for <loongarch@lists.linux.dev>; Fri, 29 Jul 2022 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1659090968;
	bh=AQluCe9tYg8P4Z6By9UHYkmtvJhh74/Ae6etuZ3j5Cg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LF4caX0W8RrHqEOOZ77BLU28EjL4fjDa/hBrDvWR+ogyu82RsMVuVIMJl4JaQxOJh
	 KJ22VzLuc9lg5lnrDkzkmLXdr1WnZC6fnp5aUoJNQz0waO9uuZWl6sF4Pn5i5NkYHk
	 dereLgnisAz3xQD4b2mBnIwKRerMMs24+iiN33mk=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3376866A12;
	Fri, 29 Jul 2022 06:36:07 -0400 (EDT)
Message-ID: <a139a8475fe295ac9f17064269cd0312dca6f96e.camel@xry111.site>
Subject: Re: [PATCH v4 0/4] LoongArch: Support new relocation types
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <tangyouling@loongson.cn>, loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>
Date: Fri, 29 Jul 2022 18:36:05 +0800
In-Reply-To: <0179679b736aea7258981dec2d83107cce74dfc1.camel@xry111.site>
References: <32a74a218c76611f897fd1df1ad0059068621133.camel@xry111.site>
	 <ec52fd49-4a30-15d9-3d32-fd7bc6d8b3f0@loongson.cn>
	 <0179679b736aea7258981dec2d83107cce74dfc1.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2022-07-29 at 18:18 +0800, Xi Ruoyao wrote:
> On Fri, 2022-07-29 at 17:49 +0800, Youling Tang wrote:
> > Hi, Ruoyao
> >=20
> > Tested this series of patches v3 on a CLFS 5.5 system, using the new
> > cross toolchain,
> > $ dmesg | head
> > [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 5.19.0-rc7new-toolchain+ (l=
oongson@linux)
> > (loongarch64-unknown-linux-gnu-gcc (GCC) 13.0.0 20220726 (experimental)=
=20
> > [master revision=20
> > cf7eac5805e:1e0611b64d8:3fb68f2e666d9de7e0326af9f43b12c9e98f19a6], GNU
> > ld (GNU Binutils) 2.39.50.20220726) #1 SMP PREEMPT Fri Jul 29 05:24:15
> > EDT 2022
> >=20
> > Relocation error when manually loading nf_tables.ko module,
> > $ sudo modprobe nf_tables
> > odprobe: ERROR: could not insert 'nf_tables': Exec format error
> >=20
> > $ dmesg
> > [=C2=A0=C2=A0 61.506737] kmod: module nf_tables: PCALA offset =3D 0x900=
07ffffed8c000=20
> > does not fit in 32-bit signed and is unsupported by kernel! dangerous=
=20
> > apply_r_larch_pcala_hi20 (71) relocation
> >=20
> > Do you have the same problem over there?
>=20
> I can reproduce it with "modprobe x_tables".=C2=A0 Will try to debug...

The relocation against local percpu variable is broken up.  I'll try to
fix it.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
