Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E9A937
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 23:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B04C433EF;
	Tue, 21 Feb 2023 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677020881;
	bh=g8YnvXSDdiBcJGkbnJUwhw1gZuR5pUkf8INqeaTaD20=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=tbgTptyIePR25r5jm0JW9KfWwmX6OyBxf4W62CcasLfpu27xEn87gaGhiK5VvxSqz
	 2bHAuMq/JFEKm5fsP9+TtRPOhCdzmyM9LwNDEZKhTDNWPQy4aoR1DRD6QUnzARUNQu
	 4rAEhcD3+501LmEJ0PHdzfe44NFwVvjAO9m83BPqp/hoJyXBjl0bTZ1bHSV8uRKG5H
	 c4nhdthU+doAe34dtum7/fH78bXCJ+nAhzEUJxJuc3mg7eAWyqQIFstkmjbELt2TRG
	 3lwmBkl8YIkDQzVlRi4iho5B+wmsxhRzAfguzMPILnS9EtzPt+nxke8EHy2Us3AlH/
	 e1xxZ3rntDwxQ==
Message-ID: <9e8952c9415973dc7276185e3cdf5ae7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01ee3dc6-a868-fd2b-93aa-11e6bdfcc9df@loongson.cn>
References: <20221129034157.15036-1-zhuyinbo@loongson.cn> <20221129034157.15036-2-zhuyinbo@loongson.cn> <31c690a347f858a477bbba9c838984ed.sboyd@kernel.org> <4b5fd886-57ce-01ef-8224-432898b7fb1c@loongson.cn> <8332a1cf44b01f06bdd5db9dc5d7f387.sboyd@kernel.org> <01ee3dc6-a868-fd2b-93aa-11e6bdfcc9df@loongson.cn>
Subject: Re: [PATCH v10 2/4] clk: clk-loongson2: add clock controller driver support
From: Stephen Boyd <sboyd@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Yang Li <yang.lee@linux.alibaba.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liupeibao@loongson.cn, loongarch@lists.linux.dev, wanghongliang@loongson.cn, zhuyinbo <zhuyinbo@loongson.cn>
Date: Tue, 21 Feb 2023 15:07:58 -0800
User-Agent: alot/0.10

Quoting zhuyinbo (2023-02-19 21:44:51)
>=20
> =E5=9C=A8 2023/2/18 =E4=B8=8A=E5=8D=886:15, Stephen Boyd =E5=86=99=E9=81=
=93:
> > Quoting zhuyinbo (2023-02-14 23:35:22)
> >> =E5=9C=A8 2023/2/11 =E4=B8=8A=E5=8D=887:42, Stephen Boyd =E5=86=99=E9=
=81=93:
> >>>> +
> >>>> +err:
> >>>> +       iounmap(loongson2_pll_base);
> >>>> +}
> >>>> +
> >>>> +CLK_OF_DECLARE(loongson2_clk, "loongson,ls2k-clk", loongson2_clocks=
_init);
> >>> Any reason this can't be a platform driver?
>=20
> Your question is that=C2=A0 why I don't use the platform_driver_register =
to=20
> register=C2=A0 clk and use CLK_OF_DECLARE ?

Yes.

>=20
> I was=C2=A0 consider other clock controllers of Loongson-2 series may be =

> different with 2k1000 and I can add a line
>=20
> CLK_OF_DECLARE() for compatible other platform in the future. eg.
>=20
> CLK_OF_DECLARE(loongson2_clk, "loongson,ls2k-clk", loongson2_clocks_init);
>=20
> +=C2=A0 CLK_OF_DECLARE(xxx1, xxx2,=C2=A0 xxx3);=C2=A0 // for other clock =
controllers of=20
> Loongson-2 series
>=20
> >> For the compatible consideration of other clock controllers of
> >> Loongson-2 series in the future, the way of using dts can be
> >>
> >> better compatible.
> >>
> > Sorry that sentence doesn't make sense to me. The use of dts doesn't
> > require the use of CLK_OF_DECLARE.
>=20
> yes, the use of dts doesn't require the use of CLK_OF_DECLARE and can=20
> use platform_driver_register
>=20
> but my drvier not use platform_driver_register to register=C2=A0 clk and =
use=20
> CLK_OF_DECLARE to match of_clk_init.

of_clk_init() is there to register clks that are needed for early init,
i.e. the clockevent/clocksource or the root interrupt controller
(irqchip). Otherwise, it isn't necessary to register clks via
of_clk_init().
