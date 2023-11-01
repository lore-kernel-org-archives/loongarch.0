Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B92E63B4;
	Wed,  1 Nov 2023 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myCbG9LB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69483C433C8;
	Wed,  1 Nov 2023 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698825579;
	bh=jiCwSEELbO1aW3JJpzVrDphDytx3euzZUFBmwq0P4mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myCbG9LBEhZlDR0A7XU7TJjnyaoZ3odUM+NAMFt1QAbCQW1BYt6H2PornxifIDPNm
	 WkBY/PLCDYAeYJ/vZHaySk6oe9vC8WB1M/kAq5hMurOdPftFxvIDqg3Vz+gq7kpW6V
	 xON1cuHiSCDPOPhVzFRF8YhJKL8fZSSZZ7Nb1ergh9f7yzVOl2ZzztI2SzjM++P8BA
	 8kwDoZq/RBZlyPOIOGfRu4/x7sody6NxoBZtqSFU5cF5iFMlGlZWsyU1SI7+EWsHSm
	 1KDleqCpiUUgNyX/RrM2LMMOvCZM8tFbZPFI7geiWLDeOpQIPybnvP56CmgKDSNOyQ
	 2J00rnoM59hAQ==
Date: Wed, 1 Nov 2023 07:59:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>,
	WANG Xuerui <git@xen0n.name>, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: thermal: loongson,ls2k-thermal: Fix
 binding check issues
Message-ID: <20231101-clone-facsimile-fd4c37333842@spud>
References: <cover.1698743706.git.zhoubinbin@loongson.cn>
 <944559ea3bf7ba0a1540f831ccd7d33591622b22.1698743706.git.zhoubinbin@loongson.cn>
 <20231031-negative-giveaway-6191a2da0cd5@spud>
 <CAMpQs4+3T9RATpJ5VycnEzkOTx_M2vdt6WPJv_B1Efy81RzCjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CBXhjm54eJnDaEDF"
Content-Disposition: inline
In-Reply-To: <CAMpQs4+3T9RATpJ5VycnEzkOTx_M2vdt6WPJv_B1Efy81RzCjA@mail.gmail.com>


--CBXhjm54eJnDaEDF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 07:38:39AM +0600, Binbin Zhou wrote:
> On Tue, Oct 31, 2023 at 10:58=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Tue, Oct 31, 2023 at 07:05:49PM +0800, Binbin Zhou wrote:
> > > Add the missing 'thermal-sensor-cells' property which is required for
> > > every thermal sensor as it's used when using phandles.
> > > And add the thermal-sensor.yaml reference.
> > >
> > > Fixes: 72684d99a854 ("thermal: dt-bindings: add loongson-2 thermal")
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  .../bindings/thermal/loongson,ls2k-thermal.yaml        | 10 ++++++++=
+-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-=
thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-ther=
mal.yaml
> > > index 7538469997f9..b634f57cd011 100644
> > > --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal=
=2Eyaml
> > > +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal=
=2Eyaml
> > > @@ -10,6 +10,9 @@ maintainers:
> > >    - zhanghongchen <zhanghongchen@loongson.cn>
> > >    - Yinbo Zhu <zhuyinbo@loongson.cn>
> > >
> > > +allOf:
> > > +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> > > +
> > >  properties:
> > >    compatible:
> > >      oneOf:
> > > @@ -26,12 +29,16 @@ properties:
> > >    interrupts:
> > >      maxItems: 1
> > >
> > > +  '#thermal-sensor-cells':
> > > +    const: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > >    - interrupts
> > > +  - '#thermal-sensor-cells'
> >
> > Why does it need to be a required property now though?
> > Adding new required properties is technically an ABI break.
>=20
> Hi Conor:
>=20
> I don't think it makes sense to have a separate thermal sensor
> definition, it needs thermal-zones to describe specific behaviors,
> e.g. cpu-thermal, so we need '#thermal-sensor-cells' to specify the
> reference.
> And the Loongson-2K1000 has 4 sets of control registers, we need to
> specify the id when referencing it.

Unfortunately, none of this is an answer to my question.

--CBXhjm54eJnDaEDF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUIFZQAKCRB4tDGHoIJi
0k/YAP9nZLjoFPxaiAxkL9a6JHwwaHqBVMqOAAr9maCqVYmckAEAqzEhbz1o4upc
Q+0rBHfXJBsJYwze5G9Iusc+4I3JPQo=
=JvQD
-----END PGP SIGNATURE-----

--CBXhjm54eJnDaEDF--
