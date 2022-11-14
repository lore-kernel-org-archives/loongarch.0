Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63697749D
	for <loongarch@lists.linux.dev>; Mon, 14 Nov 2022 17:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1668447563;
	bh=X0L4Kmonn7g/I6ECLS9q/WYYrNp/WTtXHjeGlk1ZJfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h3dx4Qxwa0sMyhlLVa+JFCYVWJxXghUvwxBUJfH8/Brq5Q1a+lRI+yfKPfSE5RfIE
	 WrDqEve8/uYm0/h1jkNLLPqtV9Why32LERKqit2YMjMz9rEHEbFyAOTZiuQsJZhwVX
	 yhnaI9/EYYHYkB4Wj/0Zn8lFrj+y8fnt12dKUf3s=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EE9ED6698D;
	Mon, 14 Nov 2022 12:39:20 -0500 (EST)
Message-ID: <99422b6e8253e4fc1427859cc840bc0c5f8c307a.camel@xry111.site>
Subject: Re: [PATCH 0/2] LoongArch syscall ABI documentation
From: Xi Ruoyao <xry111@xry111.site>
To: WANG Xuerui <kernel@xen0n.name>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Cc: WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>, Alex
 Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, 
 loongarch@lists.linux.dev
Date: Tue, 15 Nov 2022 01:39:18 +0800
In-Reply-To: <1f353678-3398-e30b-1c87-6edb278f74db@xen0n.name>
References: <20221018100457.3440691-1-kernel@xen0n.name>
	 <874jvn6be7.fsf@meer.lwn.net>
	 <1f353678-3398-e30b-1c87-6edb278f74db@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2022-10-29 at 17:14 +0800, WANG Xuerui wrote:
> On 10/29/22 02:39, Jonathan Corbet wrote:
> > WANG Xuerui <kernel@xen0n.name> writes:
> >=20
> > > From: WANG Xuerui <git@xen0n.name>
> > >=20
> > > Hi,
> > >=20
> > > Due to popular demand [1] (even Loongson employees can get lost),
> > > the
> > > current LoongArch syscall ABI is now documented. A Simplified
> > > Chinese
> > > translation is included too.
> > >=20
> > > [1]: https://github.com/loongson/LoongArch-Documentation/issues/66
> > >=20
> > > WANG Xuerui (2):
> > > =C2=A0=C2=A0 Documentation: LoongArch: Document the syscall ABI
> > > =C2=A0=C2=A0 docs/zh_CN: LoongArch: Translate the syscall ABI doc
> > >=20
> > > =C2=A0 Documentation/loongarch/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > =C2=A0 Documentation/loongarch/syscall-abi.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 36
> > > ++++++++++++++++++
> > > =C2=A0 .../translations/zh_CN/loongarch/index.rst=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > =C2=A0 .../zh_CN/loongarch/syscall-abi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37
> > > +++++++++++++++++++
> > > =C2=A0 4 files changed, 75 insertions(+)
> > > =C2=A0 create mode 100644 Documentation/loongarch/syscall-abi.rst
> > > =C2=A0 create mode 100644
> > > Documentation/translations/zh_CN/loongarch/syscall-abi.rst
> > Would you like me to take these through the docs tree?
> That's fine by me, thanks. I'll send a v2 in the weekend (likely=20
> tomorrow) for the people who have commented to give their R-b's.

Ping ? :)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
