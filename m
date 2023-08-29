Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD42EC0
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693291386; x=1724827386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l6EQb03vUZXiHl4ARNYeFbVDCeOWZOXZsCmr3pHxMcY=;
  b=M/oK0qNtmBdgpCWpG0Zmpad9OxDz52sOisD2CnMV9VVoPpGGNxT4wq5f
   JQqbRqWd28QX4jznmKIKCpvMEgpojz1H/0weXJYcGG0cx3y9KCMCM/Wcb
   DW8D0aPfy6MFvwvJ+FpcMHnM/tWzdVjOImF0sLEqU01UsitpTmlHslnlo
   sGkP2r2zdRuwUDMG5+EehWayCGTrrPQL9prsUFfHClZTofEay4u77gbpR
   9PuFOiSjVLhBwUhmDRzlxwZY5NpadnaHReeDlqfJ0JlPJ9ikbVBZiUL/9
   bU2gOTJ6+4hoPCA/xZKGXLOsTKsy088gT6O0gjmv8ZZMClviYGie6cnqg
   w==;
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="asc'?scan'208";a="1766695"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2023 23:43:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 28 Aug 2023 23:42:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 28 Aug 2023 23:42:56 -0700
Date: Tue, 29 Aug 2023 07:42:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Binbin Zhou <zhoubb.aaron@gmail.com>, Conor Dooley <conor@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, <loongson-kernel@lists.loongnix.cn>,
	<devicetree@vger.kernel.org>, <linux-pm@vger.kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH 2/5] dt-bindings: soc: loongson,ls2k-pmc: Add missing
 compatible for Loongson-2K2000
Message-ID: <20230829-patient-jugular-61e2ce821870@wendy>
References: <cover.1693218539.git.zhoubinbin@loongson.cn>
 <54ee114c08f35ab8b5dc584fd76135ac9076f5a7.1693218539.git.zhoubinbin@loongson.cn>
 <20230828-shrewdly-payee-c5eb091a0417@spud>
 <CAMpQs4Jp0rb8sbrLrPnNziLph4Ym4LxBsFt-00G69ecd8bUHNg@mail.gmail.com>
 <3fd27e64-2221-ec38-1320-9ae966f998aa@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+UWvU2UwwOv2UET"
Content-Disposition: inline
In-Reply-To: <3fd27e64-2221-ec38-1320-9ae966f998aa@linaro.org>

--U+UWvU2UwwOv2UET
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 08:29:43AM +0200, Krzysztof Kozlowski wrote:
> On 29/08/2023 05:21, Binbin Zhou wrote:
> > HI Conor:
> >=20
> > Thanks for your reply.
> >=20
> > On Mon, Aug 28, 2023 at 11:49=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >>
> >> On Mon, Aug 28, 2023 at 08:38:32PM +0800, Binbin Zhou wrote:
> >>> Document the Power Management Unit system controller compatible for
> >>> Loongson-2K2000.
> >>>
> >>> This is a missing compatible, now we add it.
> >>>
> >>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> >>> ---
> >>>  .../devicetree/bindings/soc/loongson/loongson,ls2k-pmc.yaml      | 1=
 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/soc/loongson/loongson,=
ls2k-pmc.yaml b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2=
k-pmc.yaml
> >>> index da2dcfeebf12..7473c5659929 100644
> >>> --- a/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> >>> +++ b/Documentation/devicetree/bindings/soc/loongson/loongson,ls2k-pm=
c.yaml
> >>> @@ -15,6 +15,7 @@ properties:
> >>>        - enum:
> >>>            - loongson,ls2k0500-pmc
> >>>            - loongson,ls2k1000-pmc
> >>> +          - loongson,ls2k2000-pmc
> >>
> >> Same thing here as the driver patch, the pmc on this newly added SoC
> >> appears to use the same codepaths as the existing ones. Does it share a
> >> programming model & should there be a fallback compatible here?
> >=20
> > I noticed the guideline about fallback compatible:
> >=20
> > "DO use fallback compatibles when devices are the same as or a subset
> > of prior implementations."
> >=20
> > But in fact, ls2k0500/ls2k1000/ls2k2000 are independent, there is no su=
bset.
>=20
> We do not consider here ls2k0500/ls2k1000/ls2k2000, but PMC in each of
> them. If they are independent, why would they use the same interface?
>=20
> > Can we define a "loongson,ls2k-pmc" superset for each ls2k SoC
> > compatible fallback.
> >=20
> > Such as:
> >=20
> >   compatible:
> >     oneOf:
> >       - enum:
> >           - loongson,ls2k0500-pmc
> >           - loongson,ls2k1000-pmc
> >           - loongson,ls2k2000-pmc
> >       - const: loongson,ls2k-pmc
>=20
> This is discouraged. Use 0500 as fallback.

The "code" here is also invalid, the oneOf would been to be items.

--U+UWvU2UwwOv2UET
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO2TRgAKCRB4tDGHoIJi
0hViAP4w2a6FRgFMEcasI7XhAMThs9iPwKoDnDMSgVFql+q5zgD+KfLGKQe20Ip0
MksyWv81K6+s0s2qOi3k0/lKvlDdvAM=
=S5yb
-----END PGP SIGNATURE-----

--U+UWvU2UwwOv2UET--
