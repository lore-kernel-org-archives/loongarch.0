Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14D7FA
	for <loongarch@lists.linux.dev>; Sat, 17 Jun 2023 09:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F86C433C8;
	Sat, 17 Jun 2023 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686995066;
	bh=4VRCSjLyFEKt1E90Lp4P4+ANdjWWgRwqDNQs93ufpg0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=toj1Qncs9YohzQX7ic/5RB/PAiUnUYhZNsjKHvWzBg2wE68q8PL7B929mPI3SIvds
	 xAActnC7yKfo/DfEAJpEZrQjcHDomI/NuNOVTi8VbrhgIc7pnGJo/5lXZG4LmEtm+j
	 wGkSiHeUdV/INSt0W7yJ6XQ2uPIBiunTwO2DnpEHfgzeheMh1iUottUb4SXvZcDT58
	 PIHeGvfo6A5ubQG3u4pdIza4o4xJNTGbORq5Qs/6v9unWNW6BcS4oaiTChZNEzZAPJ
	 PDpQaPfT+/kYEORnzjhelRaC7+wKCZpxHCTM9ExU+2yTd9Qo3BII+cxatIKtfAtq1c
	 CYY86eb/uX5mA==
Date: Sat, 17 Jun 2023 10:44:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
CC: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/6=5D_dt-bindings=3A_loonga?= =?US-ASCII?Q?rch=3A_Add_CPU_bindings_for_LoongArch?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMpQs4J4hOAFaarv9O3u20czpNjeHfBoPHWOzY7Y_Zno0R3vYg@mail.gmail.com>
References: <cover.1686882123.git.zhoubinbin@loongson.cn> <c1f86e5d1026937abda331ce564e5ee96b7114c7.1686882123.git.zhoubinbin@loongson.cn> <20230616-gallon-shrank-42613cd73666@wendy> <CAMpQs4J4hOAFaarv9O3u20czpNjeHfBoPHWOzY7Y_Zno0R3vYg@mail.gmail.com>
Message-ID: <47CA141F-464F-4FD1-AD7D-DBE6B3C4A0DC@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 17 June 2023 07:29:06 IST, Binbin Zhou <zhoubb=2Eaaron@gmail=2Ecom> wro=
te:
>On Fri, Jun 16, 2023 at 5:34=E2=80=AFPM Conor Dooley <conor=2Edooley@micr=
ochip=2Ecom> wrote:
>>
>> On Fri, Jun 16, 2023 at 02:10:38PM +0800, Binbin Zhou wrote:
>> > Add the available CPUs in LoongArch binding with DT schema format usi=
ng
>> > json-schema=2E
>> >
>> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson=2Ecn>
>> > ---
>> >  =2E=2E=2E/devicetree/bindings/loongarch/cpus=2Eyaml   | 65 +++++++++=
++++++++++
>> >  1 file changed, 65 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/loongarch/cpus=
=2Eyaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/loongarch/cpus=2Eyaml =
b/Documentation/devicetree/bindings/loongarch/cpus=2Eyaml
>> > new file mode 100644
>> > index 000000000000=2E=2Ec3e2dba42c81
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/loongarch/cpus=2Eyaml
>> > @@ -0,0 +1,65 @@
>> > +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> > +%YAML 1=2E2
>> > +---
>> > +$id: http://devicetree=2Eorg/schemas/loongarch/cpus=2Eyaml#
>> > +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> > +
>> > +title: LoongArch CPUs
>> > +
>> > +maintainers:
>> > +  - Binbin Zhou <zhoubinbin@loongson=2Ecn>
>> > +
>> > +description:
>> > +  The device tree allows to describe the layout of CPUs in a system =
through
>> > +  the "cpus" node, which in turn contains a number of subnodes (ie "=
cpu")
>> > +  defining properties for every CPU=2E
>> > +
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - loongson,la264
>> > +      - loongson,la364
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  device_type: true
>> > +
>> > +  clock-frequency:
>> > +    description: The frequency of cpu in Hz=2E
>>
>> Why don't you just add a ref to the common cpu schema and use the
>> standard properties for communicating clock frequencies?
>> You then get the standard properties for l1 caches, power management,
>> frequency scaling etc as a side effect=2E
>
>Hi Conor:
>
>Sorry, not sure if I understand correctly=2E Do the standard attributes
>refer to the following:
>
>power-domains =3D <>
>clocks =3D <>
>i-cache-size =3D <>
>d-cache-size =3D <>
>next-level-cache =3D <>

Yes, those are the sort of things I meant=2E

Cheers,
Conor=2E
