Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C46111C
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 12:58:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-314-T0677u4MObuNSCaKuUVJww-1; Mon, 17 Oct 2022 13:58:27 +0100
X-MC-Unique: T0677u4MObuNSCaKuUVJww-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Oct
 2022 13:58:25 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Mon, 17 Oct 2022 13:58:25 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Huacai Chen' <chenhuacai@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>
CC: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Xuefeng Li
	<lixuefeng@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, Guo Ren
	<guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2] LoongArch: Add unaligned access support
Thread-Topic: [PATCH V2] LoongArch: Add unaligned access support
Thread-Index: AQHY4c+4g3BwiNKgXk2nk+NWr+NpZK4SijAg
Date: Mon, 17 Oct 2022 12:58:25 +0000
Message-ID: <b8792b1a71754d6eb88debe4d6c2c419@AcuMS.aculab.com>
References: <20221017022330.2383060-1-chenhuacai@loongson.cn>
In-Reply-To: <20221017022330.2383060-1-chenhuacai@loongson.cn>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Huacai Chen
> Sent: 17 October 2022 03:24
>=20
> Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> Loongson-3C5000) are configurable whether support unaligned access in
> hardware. This patch add unaligned access emulation for those LoongArch
> processors without hardware support.
>=20
...
> +=09/*
> +=09 * This load never faults.
> +=09 */
> +=09__get_inst(&insn.word, pc, user);

On what basis does it never fault?
Any user access can fault.
If nothing else another thread of the process can unmap
the page.

> +=09if (user && !access_ok(addr, 8))
> +=09=09goto sigbus;

Surely that is technically wrong - a two or four byte
access is valid right at the end of valid user addreeses.

> +
> +=09if (insn.reg2i12_format.opcode =3D=3D ldd_op ||
> +=09=09insn.reg2i14_format.opcode =3D=3D ldptrd_op ||
> +=09=09insn.reg3_format.opcode =3D=3D ldxd_op) {
> +=09=09res =3D unaligned_read(addr, &value, 8, 1);

That is the most horrid indentation of long lines I've
ever seen.
I'd also guess you can common up some of this code
by looking at the instruction field that include the
transfer width.

The long elsif list will generate horrid code.
But maybe since you've just taken a fault it really
doesn't matter.
Indeed just emulating in C using byte accesses
it probably fine.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

