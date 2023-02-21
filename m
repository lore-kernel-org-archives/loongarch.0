Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6365110D
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1676963552;
	bh=NT/bxUyjuTgTucQjfscaHAPS7A8qYlPCOPobgEa3YIs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Gb7iilyha/kuE2nXkDzG9kS3IfmZjb72Z9KoFm0gVyIRfrwlhx+sOSIInvQtmNVXK
	 H/SWHKGu0s89aHQBuuDJ+vvmQVYXQ8r3GO43D2HnQCjgHaURn+378TDcUfFIODg1Pj
	 Swic/omrgdMn8TyrUlLh73lzVmCHq/AO3sKDj7/o=
Received: from [IPv6:240e:457:1010:6c8d:9501:85b0:822b:e7ed] (unknown [IPv6:240e:457:1010:6c8d:9501:85b0:822b:e7ed])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 78D4E66B3F;
	Tue, 21 Feb 2023 02:12:22 -0500 (EST)
Message-ID: <4cd00b5cdc78da6357d2d326e607b169faee34a8.camel@xry111.site>
Subject: Re: [PATCH v2 05/29] LoongArch: KVM: Add vcpu related header files
From: Xi Ruoyao <xry111@xry111.site>
To: maobibo <maobibo@loongson.cn>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org,  kvm@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,  Alex Deucher
 <alexander.deucher@amd.com>, Oliver Upton <oliver.upton@linux.dev>
Date: Tue, 21 Feb 2023 15:12:16 +0800
In-Reply-To: <7d6125dd-29e8-14d8-b1d7-d8c14d7bec80@loongson.cn>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
	 <20230220065735.1282809-6-zhaotianrui@loongson.cn>
	 <497693ca2cbc443c1d9f796c3aace6c9987bec72.camel@xry111.site>
	 <7d6125dd-29e8-14d8-b1d7-d8c14d7bec80@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-02-21 at 14:46 +0800, maobibo wrote:
> > On Mon, 2023-02-20 at 14:57 +0800, Tianrui Zhao wrote:
> > > +/* GCSR */
> > > +static inline u64 gcsr_read(u32 reg)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 val =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0asm volatile (
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0"parse_r __reg, %[val]\n\t"
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0".word 0x5 << 24 | %[reg] << 10 | 0 << 5 | __reg\n\=
t"
> >=20
> > Don't do this.=C2=A0 You should add the instruction to binutils first, =
then
> > make CONFIG_KVM depend on the assembler supporting this instruction.
> > This is completely unreadable and only fine for an internal PoC.
>=20
> We are preparing to submit these instruction support for binutils,
> however it is still necessary. Supposing that it is supported in future
> gcc version, we can not drop existing gcc 12/13 supporting to compiling
> kernel with LoongArch architecture.

You can drop the support for KVM with less capable Binutils versions,
like:

config AS_HAS_LVZ
    def_bool $(as-instr some_gcsr_insn \$r0, \$gcsr0)

config KVM
    depends on AS_HAS_LVZ

>=20
> Maybe there will be human readable code like this:
> #if GCC_SUPPORT_KVM_INSTR
> =C2=A0 ...
> #else
> =C2=A0 asm volatile (".word=C2=A0=C2=A0 "
> =C2=A0 ...
> #endif
>=20
> Regards
> Bibo, Mao

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
