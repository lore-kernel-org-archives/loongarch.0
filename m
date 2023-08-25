Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F7CA52
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692964896; x=1724500896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZeZyfeKGvQL1c/itO010dweirYa6Wn++IE4GN+lXY78=;
  b=2LWdaWFPhNxCHj9NcJcAQgDb3uJs18gQvNvwKblBVuLOHj0iOsiFE23h
   20gbeg1C7Kkg6NigE30wuFUTCImmmESE+tuSh3pOIwZVXPahwBttkwzai
   giPfvGM72Xn0N1EVMeIl5cNciJnxxopWOKxqnB5/7KxDO+42uIIyrcwow
   hXFMMqulkjyGaGawm6LJHIA7DIosNqnp1EKmsv1AvNdyxLyjsaTCeRJyL
   MejMEAqbiFdHDoACTaBhob/r9M3YYn4/ITqKirMRX5xdGxp/i/rdDRIoc
   nZ9SenBgDE4UxAlHWPK8+bfO+sWhLiBZqkpjCBEtvg/ZCWq2iBFpdPcPd
   w==;
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="asc'?scan'208";a="1305684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Aug 2023 05:01:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 25 Aug 2023 05:01:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 25 Aug 2023 05:01:31 -0700
Date: Fri, 25 Aug 2023 13:00:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
CC: Rob Herring <robh@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	<loongson-kernel@lists.loongnix.cn>, Xuerui Wang <kernel@xen0n.name>,
	<loongarch@lists.linux.dev>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Hongliang
 Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v4 3/7] LoongArch: Allow device trees to be built into
 the kernel
Message-ID: <20230825-hypocrite-smoking-cc6ce8c2936b@wendy>
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
 <3e69929008c8190cff331941dd4d34f748e5e44a.1692783907.git.zhoubinbin@loongson.cn>
 <20230823194250.GA2768550-robh@kernel.org>
 <CAMpQs4KQzXYDsMJesGGRVX=e_psyiik-Th2Y0CV=keU+-v86mQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsqxT0t8TAxpVqE1"
Content-Disposition: inline
In-Reply-To: <CAMpQs4KQzXYDsMJesGGRVX=e_psyiik-Th2Y0CV=keU+-v86mQ@mail.gmail.com>

--KsqxT0t8TAxpVqE1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 11:20:34AM +0800, Binbin Zhou wrote:
> Hi Rob:
>=20
> On Thu, Aug 24, 2023 at 3:42=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Wed, Aug 23, 2023 at 05:54:51PM +0800, Binbin Zhou wrote:
> > > Some systems do not provide a useful device tree to the kernel at boot
> > > time. Let's keep a device tree table in the kernel, keyed by the dts
> > > filename, containing the relevant DTBs.
> >
> > Support for this in other arches was added to support legacy bootloaders
> > with no DT support. You should not need this for a new architecture. Fix
> > the bootloader to provide a useful DT.
> >
> Yes, our bootloader already supports DT.
>=20
> Our original intention of providing kernel built-in DTS is to describe
> all possible device information of that SoC, so that everyone can use
> it as a reference during development; we will unlikely to add more
> .dts files to the kernel besides the reference ones.
>=20
> And as a reference, our built-in DTS provides the most basic bootable
> combinations (so it is generic enough) as an alternative in case the
> DTS in the bootloader is unexpected.
>=20
> Does this make any sense?

I don't see how this answers the question - as far as I can tell Rob was
asking specifically about the building the dtb into the kernel, whereas
your response seems to talk about havint the dts files in the kernel
tree.

--KsqxT0t8TAxpVqE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOiX8QAKCRB4tDGHoIJi
0mMdAQCaaVLfZyKQ+j/RLCRL7NKg22cLE3B7zY7QFUv8jaSxEQD+POPxvl8zvCSb
lmpG4BcHfRU8QKAVQj8AuJ57nfm8eg0=
=9MR/
-----END PGP SIGNATURE-----

--KsqxT0t8TAxpVqE1--
