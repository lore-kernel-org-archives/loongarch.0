Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466BA1DDFF
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1690888984;
	bh=MppDrBnXdUlmfC3sOWixz1Op3KV6t+4ylVpzcvMVzpw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jEA33zTpKmX+tV6nGCvpO/xo4sCZxJf7xjIBk5iHrliSEsk+6ovRZx/oIIsKcZ4nE
	 nltLYOYoFd4/lvYwtI2a+s8SaAX9+T0jpi9YzVfMTRIfjKYF6zqZ+X/UN+L91HH9ZV
	 E2ocilZvJwtpCmLoWM1iuQyXncloedFPkwTRfEPU=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id C7A0E6599C;
	Tue,  1 Aug 2023 07:23:01 -0400 (EDT)
Message-ID: <44a99b78933afeb1b33d8c51487fe0673281af9b.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>, WANG Rui <wangrui@loongson.cn>
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, Guo Ren
	 <guoren@linux.alibaba.com>
Date: Tue, 01 Aug 2023 19:23:00 +0800
In-Reply-To: <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
References: <20230801011554.3950435-1-guoren@kernel.org>
	 <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
	 <CAJF2gTRa5erHomJzLgUFO4SGqd5zSDwn6r3WN7kM8aWpv1vesg@mail.gmail.com>
	 <CAJF2gTQ1hV1vipAo3H4X4WiPO84kVVFZcdGq7u4f0bVTry_akQ@mail.gmail.com>
	 <CAHirt9gVqE=9vviJEY=kY=booVRmFPHrnFsKCXPXnXiWTB8bZQ@mail.gmail.com>
	 <CAJF2gTR2ON33wc87iV564rkDbNiE56h_t0kzKKXdJtGqgJ1sOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-08-01 at 18:49 +0800, Guo Ren wrote:
> > On Tue, Aug 1, 2023 at 5:05=E2=80=AFPM Guo Ren <guoren@kernel.org> wrot=
e:
> > >=20
> > > > The CoRR problem would cause wider problems than this.For this case=
,
> > > > do you mean your LL -> LL would be reordered?
> > > >=20
> > > > CPU 0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> > > > LL(2) (set ex-monitor)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 store (break the ex-monitor)
> > > > LL(1) (reordered instruction set ex-monitor
> > > > SC(3) (successes ?)
> > > Sorry for the mail client reformat, I mean:
> > >=20
> > > CPU0=C2=A0 LL(2) (set ex-monitor)
> > > CPU1=C2=A0 STORE (break the ex-monitor)
> > > CPU0=C2=A0 LL(1) (reordered instruction set ex-monitor
> > > CPU0=C2=A0 SC(3) (success?)
> >=20
> > No. LL and LL won't reorder because LL implies a memory barrier(though
> > not acquire semantics).
> That means we could remove __WEAK_LLSC_MB totally, right?

As I've said, to implement CAS on LA464 this barrier is *really* needed.
I initially didn't believe it then I spent one night (from 11 PM to 04
AM) debugging GCC libgomp test failures.

On LA664 (3A6000) things may change though.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
