Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468CCA55
	for <loongarch@lists.linux.dev>; Fri, 25 Aug 2023 15:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91253C433C8;
	Fri, 25 Aug 2023 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692976137;
	bh=9vNizx1+9O0KC3M0H0J5rAKXThJFEy55qKjjq7BwuPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h62atMn+qoh4TUlPmUGCC3+68ax31VdF7m4QXHSI8Dopd1FUg9Tbob9gxp6twCIyj
	 LfhsyqSS0pTnXPqxgBMzO3tkMiBw2vU22dbHxPea3tH2BmJ/XVJPLe79uvtxI5W6dT
	 wDMBbF/1ZbvDukEiL4n0Wnc6qQeqYMA9Cj8CYjUcuRl7dXqPHxcIYqY0w6kLH3FgjS
	 y1DJIiy1mg49HnQUNcyIvkmXGB5dINN1/CJ51XVb4+43cPMVYXUXC5Wk3rvwjoX4N5
	 I3oDljGFz3F9s/1mBI9dlm79sM5ygraR9zgqYdNXOfUo2yQFWJMwIkivbvnvZ+jHJa
	 xRNxoKS4sucfw==
Date: Fri, 25 Aug 2023 16:08:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v4 0/7] LoongArch: Add built-in dtb support
Message-ID: <20230825-exorcist-periscope-045ad906d919@spud>
References: <cover.1692783907.git.zhoubinbin@loongson.cn>
 <CAAhV-H7hi=yc=PfDBafXVS5CSwEeE2WmbAAhnnDm6iYFF3YzkQ@mail.gmail.com>
 <20230825-doubling-waltz-6444e26152db@wendy>
 <CAAhV-H7FAKa2_+rfyboVYxvQA0sJmaWnKj3yCJZkqe_FEx9J2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1pDqvKmd8N2geUhn"
Content-Disposition: inline
In-Reply-To: <CAAhV-H7FAKa2_+rfyboVYxvQA0sJmaWnKj3yCJZkqe_FEx9J2Q@mail.gmail.com>


--1pDqvKmd8N2geUhn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 11:06:40PM +0800, Huacai Chen wrote:
> Hi, Conor,
>=20
> On Fri, Aug 25, 2023 at 7:59=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Fri, Aug 25, 2023 at 07:38:31PM +0800, Huacai Chen wrote:
> > > This series looks good enough to me now, if no one has objections, I
> > > will queue it to loongarch-next.
> >
> > Have you not read Rob's replies?
> I'm sorry, I have read but I thought Binbin's reply has answered Rob's qu=
estion.

As far as I can tell, it didn't - but there were was a reply from Rob
about dtbs_check issues too IIRC.

--1pDqvKmd8N2geUhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOjEBAAKCRB4tDGHoIJi
0raOAP0UwLxEnXtbN9grQbymd9p1UoXvDccNBGkF/eb9t4F9FwD9Hf1N4jR7loX7
B9yhkVb11Cgjsz5Kox0NN02UFECO1gk=
=VK0e
-----END PGP SIGNATURE-----

--1pDqvKmd8N2geUhn--
