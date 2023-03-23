Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473E23C3
	for <loongarch@lists.linux.dev>; Thu, 23 Mar 2023 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1679554976;
	bh=kPusCXazgWVH4g9ObHa+7OH3KfxjLbHZCO1dh/gQDoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Uu3e7L4fKG4q6wwuewrmVw45wMsvyFXRthz0HbcbonRAptSyJMRg8KMNj2rKHvFIH
	 o6TppyVEwZXwdJLrnIt+RXqd61bfcvJZfbirNMgdAzngYDhc2h7Pcyo0GQt5i1BvE2
	 XWBHTxmv1m+ovUbvD19IoDCDT9OLwJ37ZbvExo6o=
Received: from localhost.localdomain (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B24AF65BFF;
	Thu, 23 Mar 2023 03:02:55 -0400 (EDT)
Message-ID: <d6423a5f92b44c65327cc01abe4b29fa9d7072aa.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
From: Xi Ruoyao <xry111@xry111.site>
To: Enze Li <lienze@kylinos.cn>, WANG Xuerui <kernel@xen0n.name>, 
	chenhuacai@kernel.org
Cc: loongarch@lists.linux.dev, enze.li@gmx.com
Date: Thu, 23 Mar 2023 15:02:54 +0800
In-Reply-To: <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
References: <20230322090533.4079453-1-lienze@kylinos.cn>
	 <c6096bc7-4325-a826-4ff0-eaa4c8067e91@xen0n.name>
	 <df8b7ec01580cb1ea825a409b53155121f44754c.camel@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-03-23 at 14:37 +0800, Enze Li wrote:

>=20
> > NAK: it's userspace-visible ABI change. AFAIK there are already
> > multiple=20
> > downstream adaptations (made by Loongson folks) that rely on the
> > current=20
> > spelling, which may not have any fallback mechanism built in (e.g.=20
> > recognize both "Model Name" and "model name", match case-
> > insensitively,=20
> > etc).
>=20
> I can hardly believe that the 'Model Name' has been widely adopted.
> AFAIK, the latest official releases[1][2][3] use 'model name'(*NOT* the
> same with the upstream).=C2=A0 Wouldn't Loongson folks use their own
> distribution for downstream software development?

No they wouldn't.  Loongnix is fundamentally incompatible with whatever
in the upstream code base.  Xuerui has explained it before:

   As of 2022-07-18, all commercial LoongArch distributions are
   incompatible with all community distributions. All binary software built
   on community distributions, and some software written in high-level
   languages and existing in forms like source code or bytecode (such as
   those written in Python or Java) cannot run on commercial distributions,
   and vice versa. All closed-source software from ISVs such as WPS Office
   are built on commercial distributions, so they are extremely unlikely to
   work as-is on community distributions.
  =20
   This is the so-called compatibility problem between the old-world and
   the new-world. Because the Loongson Corporation finished all commercial
   moves before announcing the LoongArch to the open-source community, the
   open-source LoongArch ecosystem is the new world; in contrast to this,
   all commercial distributions and the ecosystem associated make up the
   old world. The two worlds are to be united eventually, but are two
   parallel universes for now; and the technical difficulty of making the
   two worlds compatible with each other is enormous.

> It's undeniable that there are still a few developers who develop
> downstream software based on the upstream kernel, but it's only a small
> portion.=C2=A0 AFAIK, there are three pre-release versions that use the
> upstream kernel, namely Archlinux, fedora-remix-loongarch, and Gentoo.
> However, none of them have released an official version, which means
> they are not widely used.

<sarcasm>
   Then should we switch to the old MIPS-style UAPI, like Loongnix? =C2=A0A=
nd
   get arch/loongarch kicked out from linux.git by Linus?
</sarcasm>

> Considering that the 'Model Name' field only exists in upstream code
> and hasn't been widely adopted so far, I cautiously believe that this
> issue needs to be fixed as soon as possible to avoid disrupting the
> LoongArch ecosystem.

It's already disrupted, unfortunately.  And the disruption cannot be
"fixed" with a little adjustment here, a little adjustment there.

> > It's better to adapt the downstream projects instead, for example
> > you=20
> > could make them more resilient to a hypothetic future arch's similar
> > change by making them match case-insensitively.
>=20
> Yes, I used to think the same way.=C2=A0 But then I found out that almost
> all architectures, except for LoongArch, use the 'model name' field for
> identification.=C2=A0 In this case, if I were a maintainer in the util-li=
nux=20
> community, I don't think I would approve the change if someone
> submitted a patch like that, because the code would disrupt the overall
> structure and make it less aesthetically pleasing.

It would not disrupt the overall structure.  I know because I've already
written the code:

https://github.com/util-linux/util-linux/pull/2128

There is already many architecture specific code in lscpu (with a
comment like /* aarch64 */ or /* sparc */).


--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
