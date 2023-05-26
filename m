Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C742742C4
	for <loongarch@lists.linux.dev>; Fri, 26 May 2023 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685104750; x=1716640750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0eDJx4cPwsq80iImTB8nLrKWaWeH8p+wAFaX0YpCUpY=;
  b=HSSELNZpH6wuVX+rn33ma2ckbnZj4XxXM+T5bitFsjbx2cyy7a0g0nz9
   SNspmHSKsNAFwcUDCHFkIrNBMmc4QdvSQY6QK/YDZWjsi9kuKtLbWvYW7
   LDVmMVL2TWr1GKUDNkSv+EaaAD9azPxNZtYQN29mCLf/tEGCTBkJ9rX5C
   7uUcCNZbsSP8mgC/EEI/wmjW5R9jAulXbW6dx2oB+3IyoszFWfvhVTtB4
   1Sx8Q2CiS4wl1fMyR59mAgo+E4zMsc6puEWuv9JnoGjkeqt0Sj9h4N5A3
   4NTt0j7+th+TA1T21d0Qs/H1c8/MibznujBePNWErTmUUZHN6fszLD4Cb
   w==;
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="asc'?scan'208";a="154091159"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 05:39:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 05:38:55 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 05:38:52 -0700
Date: Fri, 26 May 2023 13:38:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Binbin Zhou <zhoubb.aaron@gmail.com>, Conor Dooley <conor@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Alessandro Zummo
	<a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Huacai Chen
	<chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, Kelvin Cheung <keguang.zhang@gmail.com>, zhao
 zhang <zhzhl555@gmail.com>, Yang Ling <gnaygnil@gmail.com>,
	<loongson-kernel@lists.loongnix.cn>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230526-hardwired-flashbulb-de3ef456f9a0@wendy>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
 <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
 <20230526-dolly-reheat-06c4d5658415@wendy>
 <1EAC8FA8-4125-4436-9EE1-13B61B5687AF@flygoat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WSYevugeXVX6hZ2M"
Content-Disposition: inline
In-Reply-To: <1EAC8FA8-4125-4436-9EE1-13B61B5687AF@flygoat.com>

--WSYevugeXVX6hZ2M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 01:22:15PM +0100, Jiaxun Yang wrote:
>=20
>=20
> > 2023=E5=B9=B45=E6=9C=8826=E6=97=A5 13:06=EF=BC=8CConor Dooley <conor.do=
oley@microchip.com> =E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>=20
> [...]
> My two cents here as Loongson64 maintainer.
>=20
> >=20
> >>> To maintain compatibility with the existing devicetrees, should the o=
ld
> >>> "loongson,ls2x-rtc" be kept in the driver?
> >>=20
> >> No, It seems that wildcards in compatible are not allowed."
> >> loongson,ls2x-rtc" itself was part of this patch series at one time,
> >> but apparently it is not the right way to describe these chips.
> >=20
> > Right, but it has been merged - you are deleting the driver that suppor=
ts
> > it after all - which means that any dtb with the old compatible will
> > stop working.
> It is perfectly fine to break DTB compatibility for Loongson64 systems
> As they *only* use builtin dtb. Bootloader will only pass machine type in=
formation
> and kernel will choose one dtb from it=E2=80=99s dtbs pool.

Ah, that is good to know thanks! I think that should be mentioned in the
commit messages for the next revision.

Cheers,
Conor.

--WSYevugeXVX6hZ2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCoRQAKCRB4tDGHoIJi
0m7HAQDegOrEFQvfjtNlpAP88Pr1kQ6xFHXGlHvSieXoat9fSAD/fQLNWWmCM9oI
Nebcr7/ygJ6fD/4udFPchcokkg67nA8=
=4uhD
-----END PGP SIGNATURE-----

--WSYevugeXVX6hZ2M--
