Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB73C2E
	for <loongarch@lists.linux.dev>; Mon, 21 Nov 2022 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1669035799;
	bh=Tg4qUqjfq/bIqmyfzaioaevjhCCDlR5JL3/kzbueFh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HO6GoJkua5DEBYUge1nzP64yM8uPawhojg0C+G0dUV4JjHlgr19HGDsaZ8ZoWkmI6
	 Gh1f/X9Yyf20OssGAAjR0SuWobRwDRR/V2EJ73sL5VdBIHDbIZ/clbsrIdtsWcDSLk
	 ECotVSeMBFF4sblgC8rdK5fG9Ct1/xIzurUBz7To=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 8FECE65C5F;
	Mon, 21 Nov 2022 08:03:16 -0500 (EST)
Message-ID: <16d361992b707848c0b0258ad1d0e4c3958155e7.camel@xry111.site>
Subject: Re: [PATCH] stmmac: pci: Add LS7A support for dwmac-loongson
From: Xi Ruoyao <xry111@xry111.site>
To: Feiyang Chen <chris.chenfeiyang@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com,  Feiyang Chen <chenfeiyang@loongson.cn>,
 zhangqing@loongson.cn, Huacai Chen <chenhuacai@loongson.cn>, 
 netdev@vger.kernel.org, loongarch@lists.linux.dev
Date: Mon, 21 Nov 2022 21:03:14 +0800
In-Reply-To: <CACWXhK=YF+z0wofjDAo7XW8cSV2NZgHpAK3u5=rkvvKTd8MjFQ@mail.gmail.com>
References: <20220816102537.33986-1-chenfeiyang@loongson.cn>
	 <Yv2hlkIpd8A66+iP@lunn.ch>
	 <CACWXhK=YF+z0wofjDAo7XW8cSV2NZgHpAK3u5=rkvvKTd8MjFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2022-08-18 at 13:01 +0800, Feiyang Chen wrote:
> On Thu, 18 Aug 2022 at 10:19, Andrew Lunn <andrew@lunn.ch> wrote:
> >=20
> > On Tue, Aug 16, 2022 at 06:25:37PM +0800, Feiyang Chen wrote:
> > > Current dwmac-loongson only support LS2K in the "probed with PCI
> > > and
> > > configured with DT" manner. We add LS7A support on which the
> > > devices
> > > are fully PCI (non-DT).
> >=20
> > Please could you break this patch up into a number of smaller
> > patches. It is very hard to follow what you are changing here.
> >=20
> > Ideally you want lots of small patches, each with a good commit
> > message, which are obviously correct.
> >=20
>=20
> Hi, Andrew,
>=20
> OK, I will have a try.

Any progress on the refactoring? :)

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
