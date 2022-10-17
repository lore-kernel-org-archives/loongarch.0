Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C7137C
	for <loongarch@lists.linux.dev>; Mon, 17 Oct 2022 13:11:30 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-220-pP_sGcqFMfKL-aotPu7y3w-1; Mon, 17 Oct 2022 14:11:26 +0100
X-MC-Unique: pP_sGcqFMfKL-aotPu7y3w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Oct
 2022 14:11:24 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Mon, 17 Oct 2022 14:11:24 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Huacai Chen' <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
CC: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Xuefeng Li
	<lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3] LoongArch: Add unaligned access support
Thread-Topic: [PATCH V3] LoongArch: Add unaligned access support
Thread-Index: AQHY4ieF1YXwdHBLG0is9Yy/swO7xa4SjkhQ
Date: Mon, 17 Oct 2022 13:11:24 +0000
Message-ID: <39ea2a6fee654b68974ef38237a61e80@AcuMS.aculab.com>
References: <20221017125209.2639531-1-chenhuacai@loongson.cn>
In-Reply-To: <20221017125209.2639531-1-chenhuacai@loongson.cn>
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
> Sent: 17 October 2022 13:52
>=20
> Loongson-2 series (Loongson-2K500, Loongson-2K1000) don't support
> unaligned access in hardware, while Loongson-3 series (Loongson-3A5000,
> Loongson-3C5000) are configurable whether support unaligned access in
> hardware. This patch add unaligned access emulation for those LoongArch
> processors without hardware support.
>=20
.....
> +=09} else if (insn.reg2i12_format.opcode =3D=3D fstd_op ||
> +=09=09insn.reg3_format.opcode =3D=3D fstxd_op) {
> +=09=09value =3D read_fpr(insn.reg2i12_format.rd);
> +=09=09res =3D unaligned_write(addr, value, 8);
> +=09=09if (res)
> +=09=09=09goto fault;
> +=09} else if (insn.reg2i12_format.opcode =3D=3D fsts_op ||
> +=09=09insn.reg3_format.opcode =3D=3D fstxs_op) {
> +=09=09value =3D read_fpr(insn.reg2i12_format.rd);
> +=09=09res =3D unaligned_write(addr, value, 4);
> +=09=09if (res)
> +=09=09=09goto fault;

Are those right?
Shouldn't something be converting from 'double' to
'float' in there?
And generating SIGFPE (?) if the exponent is out of range.

(And the same for write_fpr().)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

