Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C404D371
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 09:35:37 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-314-fI1z6-A-NXaR-V9G3rhcqA-1; Thu, 09 Feb 2023 09:35:34 +0000
X-MC-Unique: fI1z6-A-NXaR-V9G3rhcqA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 9 Feb
 2023 09:35:29 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 9 Feb 2023 09:35:29 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bibo Mao' <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] LoongArch: add checksum optimization for 64-bit system
Thread-Topic: [PATCH v2] LoongArch: add checksum optimization for 64-bit
 system
Thread-Index: AQHZPDrPjnYkuPc3GUK7DnTa61yn8K7GU7lQ
Date: Thu, 9 Feb 2023 09:35:29 +0000
Message-ID: <e6bb59c32134477aa4890047ae5ad51b@AcuMS.aculab.com>
References: <20230209035839.2610277-1-maobibo@loongson.cn>
In-Reply-To: <20230209035839.2610277-1-maobibo@loongson.cn>
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

From: Bibo Mao
> Sent: 09 February 2023 03:59
>=20
> loongArch platform is 64-bit system, which supports 8 bytes memory
> accessing, generic checksum function uses 4 byte memory access.
> This patch adds 8-bytes memory access optimization for checksum
> function on loongArch. And the code comes from arm64 system.

How fast do these functions actually run (in bytes/clock)?

It is quite possible that just adding 32bit values to a
64bit register is faster.
Any non-trivial cpu will run that at 4 bytes/clock
(for suitably unrolled and pipelined code).
On a more complex cpu adding to two registers will
give 8 bytes/clock (needs two memory loads/clock).

The fastest 64bit sum you'll get on anything mips-like
(no carry flag) is probably from something like:
=09val =3D *mem++;  // 64bit read
=09sum +=3D val;
=09carry =3D sum < val;
=09carry_sum +=3D carry;
which is 2 bytes/instruction again.
To get to 8 bytes/clock you need to execute all 4 instructions
every clock - so 1 read and 3 arithmetic.
(c/f 2 read and 2 arithmetic for 32bit adds.)

Arm has a carry flag so the code is:
=09val =3D *mem++;
=09temp,carry =3D sum + val;
=09sum =3D sum + val + carry;
There are still two dependant arithmetic instructions for
each 8-byte word.
The dependencies on the flags register also make it harder
to get any benefit from interleaving adds to two registers.

x86-64 uses 64bit 'add with carry' chains.
No one ever noticed that they take two clocks each on
Intel cpu until (about) Haswell.
It is possible to get 12 bytes/clock with some strange
loops that use (IIRC) adxo and adxc.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

