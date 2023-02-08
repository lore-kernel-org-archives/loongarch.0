Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7AF947C
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 13:12:51 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-270-BBR2dVL9Mgyb8fRo4ZZDyQ-1; Wed, 08 Feb 2023 13:12:48 +0000
X-MC-Unique: BBR2dVL9Mgyb8fRo4ZZDyQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 8 Feb
 2023 13:12:47 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 8 Feb 2023 13:12:47 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bibo Mao' <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
CC: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] LoongArch: add checksum optimization for 64-bit system
Thread-Topic: [PATCH] LoongArch: add checksum optimization for 64-bit system
Thread-Index: AQHZOqjw3I588J9fP0akyPjC04Hova7FBpIA
Date: Wed, 8 Feb 2023 13:12:47 +0000
Message-ID: <8fa91bca5e624861b190917933951c7e@AcuMS.aculab.com>
References: <20230207040148.1801169-1-maobibo@loongson.cn>
In-Reply-To: <20230207040148.1801169-1-maobibo@loongson.cn>
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
> Sent: 07 February 2023 04:02
>=20
> loongArch platform is 64-bit system, which supports 8 bytes memory
> accessing, generic checksum function uses 4 byte memory access.
> This patch adds 8-bytes memory access optimization for checksum
> function on loongArch. And the code comes from arm64 system.
>=20
> When network hw checksum is disabled, iperf performance improves
> about 10% with this patch.
>=20
...
> +static inline __sum16 csum_fold(__wsum csum)
> +{
> +=09u32 sum =3D (__force u32)csum;
> +
> +=09sum +=3D (sum >> 16) | (sum << 16);
> +=09return ~(__force __sum16)(sum >> 16);
> +}

Does LoongArch have a rotate instruction?
But for everything except arm (which has a rotate+add instruction)
the best is (probably):
=09(~sum - rol32(sum, 16)) >> 16

To the point where it is worth killing all the asm
versions and just using that one.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

