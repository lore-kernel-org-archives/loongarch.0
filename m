Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F50D5C98
	for <loongarch@lists.linux.dev>; Fri,  1 Sep 2023 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693550009; x=1725086009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m64vTGuTn+LyymqjWnqc46/AIGoEDr1fAhPkx94h6g8=;
  b=1u8Es2s8UzlhfT+b++jKgycOBe+1SYWG2jIezQeA5wsWAxuwpTf9v9QS
   AQOeJXVVtbW7wZ/oyvghqLsVaotf/uKHMKt6sniF2Ztfu8vBfdOfPH9qp
   VdlPOS8WMfSjN80u3TA/7ujDKXfmXCUQHqQdAiN00YF+ryWhwvJCSUkGY
   gYPQhOtl7qc4sRdJqoJkh/kulMsYkYmTbOPOUB4PI6ot1uzdbkDyKeEB1
   l3P80c+QnkXjctiPz+OBz76fj0vc9dqXBR4/1+6ghXgrPCfmgft4sKfZl
   4iUJdzPcowlXBwC3QYcWGXffERJPn60XNHS704OG0N6kEb9L/4tHw1dt6
   w==;
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="asc'?scan'208";a="232862143"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 23:33:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 23:32:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 23:32:44 -0700
Date: Fri, 1 Sep 2023 07:32:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd
 Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	<loongson-kernel@lists.loongnix.cn>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pm@vger.kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v2 3/5] soc: loongson: loongson_pm2: Drop useless
 of_device_id compatible
Message-ID: <20230901-doubling-multiple-8b72b062e622@wendy>
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <bf09b11ec6a0102f85dc2b3289d003271304e24d.1693474728.git.zhoubinbin@loongson.cn>
 <20230831-ambition-refusing-08e63b345573@spud>
 <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HoQ3/6k+9svD/8I7"
Content-Disposition: inline
In-Reply-To: <CAMpQs4JbUx9N4MmfM6vRsdQBHyUcU9UHGX23UewL5Matt6iXnQ@mail.gmail.com>

--HoQ3/6k+9svD/8I7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 11:05:12AM +0800, Binbin Zhou wrote:
> Hi Conor:
>=20
> Thanks for your reply.
>=20
> On Thu, Aug 31, 2023 at 11:15=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, Aug 31, 2023 at 07:43:13PM +0800, Binbin Zhou wrote:
> > > Now, "loongson,ls2k0500-pmc" is used as fallback compatible, so the
> > > ls2k1000 compatible in the driver can be dropped directly.
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  drivers/soc/loongson/loongson2_pm.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/loongson/loongson2_pm.c b/drivers/soc/loongs=
on/loongson2_pm.c
> > > index 796add6e8b63..5ffb77afd9eb 100644
> > > --- a/drivers/soc/loongson/loongson2_pm.c
> > > +++ b/drivers/soc/loongson/loongson2_pm.c
> > > @@ -197,7 +197,6 @@ static int loongson2_pm_probe(struct platform_dev=
ice *pdev)
> > >
> > >  static const struct of_device_id loongson2_pm_match[] =3D {
> > >       { .compatible =3D "loongson,ls2k0500-pmc", },
> > > -     { .compatible =3D "loongson,ls2k1000-pmc", },
> >
> > What about older devicetrees that do not have the fallback? Aren't you
> > going to remove support for those?
>=20
> This driver was just merged in during the v6.6 window, and no release
> will use it until now.

Ahh, thanks for the info. Your commits 1-3 should then all have Fixes:
tags pointing to the commits tat introduced the problems, if you intend
getting these applied as fixes before v6.6 gets released.

Thanks,
Conor.

> commit 67694c076bd7 soc: loongson2_pm: add power management support
> commit 6054a676e969 soc: dt-bindings: add loongson-2 pm
>=20
> Of course, it was our mistake not to make better use of fallback
> compatible when submitting the driver, and we hope to fix this mistake
> soon.
> Also, this driver will only be used by the LoongArch architecture, no
> need to worry about other architectures.
>=20
> Thanks.
> Binbin
> >
> > >       {},
> > >  };
> > >
> > > --
> > > 2.39.3
> > >

--HoQ3/6k+9svD/8I7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPGFYgAKCRB4tDGHoIJi
0vSUAQDcrB5/73rfmCNAiT2jQA1ruGVppzf3RjC+q0NLyXn7+AD9FlXDDVIXG0U4
83Jc8qNKJVsTNg62hZ8YWLQVEyARvA8=
=1aNe
-----END PGP SIGNATURE-----

--HoQ3/6k+9svD/8I7--
