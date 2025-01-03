Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3471D3576
	for <loongarch@lists.linux.dev>; Fri,  3 Jan 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735897329; cv=none; b=E1dNq504ptHJkJs2M227ujdjXXMa76VM384i1A5Q3cPuIyM86rMNoS3vlCDcOOHngdff0KMp1zCszeyU3eF5eyELomt8DgxC9aohyM4kBgChIAFWKOXok7fR4iHuvdCymXrmo6G/VGUWOtaTQHZe+G5kdRHAk/ooHg8PGg7aAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735897329; c=relaxed/simple;
	bh=CGLMG7TWbT18wPalcBlEAr7kX3RzDHHN+5a5kcr18Ws=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qz7MvmqsODxH27rF2ScfLmYF7VGuNkgwiVI/62KEiMOAB7O+XN51lK1Lyklj3cVSnwCf2pxkystxQ+Ag6/eGE+Or87IfNF/6LLi23KAoFl6rv1kJfAsTJpolZWZRdTksN7gIA7WLblR4BVwLywXCflanLA3DbQVt34xgUSJvXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bSF8Di6w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RmUKf6ol; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bSF8Di6w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RmUKf6ol"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 345491380775;
	Fri,  3 Jan 2025 04:42:07 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Fri, 03 Jan 2025 04:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1735897327;
	 x=1735983727; bh=C6dK7zO9Zin8vFgMtRgcOQ+IvhDxaO98RU1GGNOThdI=; b=
	bSF8Di6wT+WCfW4L37LpBLW1Ew/Z+U7ggjrVXYOmYZN3KZJkzCgqADUDIpFLvM1X
	lGb1VZNENe9IBgFLlcpmEk5uXGMZFZA/rMOsJ5bgapjhJRUf53DkMtStaX9VHYa+
	+s1LOR8JIV5nx8Z/KKxTA2Lg9OPIsG8N6+jEyWeWtpuFytX80k1Re+gVudLbrGtZ
	bwCDMmzeHy7gyfxMcPuSYJrwRkXpPBoUuedx1ZPZSIPfOCOlsj/KMtxS2Llye91Y
	hNw7WXx+Zajr//88Xzvt0gMIPuhRpiCdXFPLWujlVttVFWi+oyQOgm3fm2XgZmnh
	SNsUyCoDUVWid+L+26dGkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735897327; x=
	1735983727; bh=C6dK7zO9Zin8vFgMtRgcOQ+IvhDxaO98RU1GGNOThdI=; b=R
	mUKf6olfL1ejskOfnTeiT1GxDwAazw2DlBGQdMHRdzmmHkHLd4OdQk+QTA7Aav7n
	xwj/mQL/N0yX1+ZVFYkWJGMgG+qnZNQcHSo+CquNF5jlnsYckpp65RY160MM4+Pk
	MKMqKPurTwEAVtSA89BURtXsJwEkq7B3KjUDMRoaq17k+0TdNQn+TcxykMU4L1cQ
	tVOfjLOO5eqZbclGu4BP93TsS4VSwjoQrfH7/Knxoptu5Om+XFVdhBKZWvhKRftr
	6BwgET0mED+3yln954TtlOeiV2l2sB+WNbYB9qDX9Qbi/66LFClGVDxIUoNgnVhT
	hfcHHjPEhinHtbpI8XkHw==
X-ME-Sender: <xms:7rB3Z5DQAySW9ZRQ2R1ba_7BT6gdL-TzjgVGp-ut15GZb86XUgR74Q>
    <xme:7rB3Z3hJty89cSXRH1ifK9OeFebNBc7Fmy2U-coHM7uWzpTRWxrowc08SC4w5sX60
    42dKzyx3h4VNtMDGhs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohho
    nhhgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhn
    vghlseigvghntdhnrdhnrghmvg
X-ME-Proxy: <xmx:7rB3Z0lwDL8yQbM5JJQ4M1Opddq6PTVBMzMWCnSpMSloG3HNhYyXgg>
    <xmx:7rB3ZzzRXJt-H-UrRjxo_nHZzaOvSV5R4gh_cJELpooZDkA4Wi6o2w>
    <xmx:7rB3Z-TCFLL4hdZTmrnOVLnWL93SA-C3Bh9QD4l6_eiF4cRIDioHug>
    <xmx:7rB3Z2ZvBl0ILJE7PbcQ5lEIAkONhVwjtcGCJgQLbtAsYR8MaeaYJw>
    <xmx:77B3Z8cba1Zsv5YydJi7FdAxkpEdNseVb8dni0cXr41BeAYnKrQ0jiwS>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6C9201C20066; Fri,  3 Jan 2025 04:42:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 03 Jan 2025 09:41:44 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Xuerui Wang" <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <6160921c-7761-46d1-9d13-f26af5873b2e@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H6Bji1FKcuhxLntfWe4iJGpr-tmWLt7q3L55sVPHrH7AA@mail.gmail.com>
References: <20250102-la-earlycon-fixed-map-v1-1-23fe3a6681c4@flygoat.com>
 <CAAhV-H44VvyxHqmyQ3K8qC+HERH0FjheqAJpDCiYkQ2oK2woAg@mail.gmail.com>
 <05ac2a87-7f60-4336-a323-443967a77a76@app.fastmail.com>
 <CAAhV-H6Bji1FKcuhxLntfWe4iJGpr-tmWLt7q3L55sVPHrH7AA@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is enabled
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=883=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=889:35=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Jan 3, 2025 at 5:02=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
>>
>>
>>
>> =E5=9C=A82025=E5=B9=B41=E6=9C=883=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=882:38=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
>> > Hi, Jiaxun,
>> >
>> > On Thu, Jan 2, 2025 at 10:34=E2=80=AFPM Jiaxun Yang <jiaxun.yang@fl=
ygoat.com> wrote:
>> >>
>> >> When ARCH_IOREMAP is enabled, we are using always accessible DMW
>> >> for ioremap. It makes no sense to create a dedicated mapping for
>> >> earlycon given that we can access the region via DMW.
>> >>
>> >> Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
>> >> ease debugging for early mapping issues.
>> > Fixmap has nothing to do with IOREMAP, whether you use ARCH_IOREMAP=
 or
>> > GENERIC_IOREMAP, earlycon is mapped by fixmap rather than ioremap().
>>
>> When you have ARCH_IOREMAP it=E2=80=99s not necessary to create fixed=
 map for earlycon.
>>
>> As ioremap along is sufficient to access MMIO.
> It's sufficient but ioremap() doesn't need to control everything about
> MMIO, and I don't like the #ifdef in fixmap.h.

It=E2=80=99s fine do drop that ifdef and keep Kconfig change.

I can do it in v2.

Thanks
-Jiaxun

>
> Huacai
>>
>> I=E2=80=99m doing this as it can help with debugging early mapping is=
sues.
>>
>> Thanks
>>
>> >
>> > Huacai
>> >
>> >>
>> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> >> ---
>> >>  arch/loongarch/Kconfig              | 2 +-
>> >>  arch/loongarch/include/asm/fixmap.h | 2 ++
>> >>  2 files changed, 3 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> >> index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea6=
26be52f521fa75e7cbe07b 100644
>> >> --- a/arch/loongarch/Kconfig
>> >> +++ b/arch/loongarch/Kconfig
>> >> @@ -246,7 +246,7 @@ config MACH_LOONGSON64
>> >>         def_bool 64BIT
>> >>
>> >>  config FIX_EARLYCON_MEM
>> >> -       def_bool y
>> >> +       def_bool !ARCH_IOREMAP
>> >>
>> >>  config PGTABLE_2LEVEL
>> >>         bool
>> >> diff --git a/arch/loongarch/include/asm/fixmap.h b/arch/loongarch/=
include/asm/fixmap.h
>> >> index d2e55ae55bb9c499b9a685509bc26d663054b58e..905dc7a5f9fa52ac92=
4fe832749f39283c28a9f8 100644
>> >> --- a/arch/loongarch/include/asm/fixmap.h
>> >> +++ b/arch/loongarch/include/asm/fixmap.h
>> >> @@ -12,7 +12,9 @@
>> >>
>> >>  enum fixed_addresses {
>> >>         FIX_HOLE,
>> >> +#ifdef CONFIG_FIX_EARLYCON_MEM
>> >>         FIX_EARLYCON_MEM_BASE,
>> >> +#endif
>> >>         __end_of_fixed_addresses
>> >>  };
>> >>
>> >>
>> >> ---
>> >> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> >> change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831
>> >>
>> >> Best regards,
>> >> --
>> >> Jiaxun Yang <jiaxun.yang@flygoat.com>
>> >>
>>
>> --
>> - Jiaxun

--=20
- Jiaxun
