Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1ABEDF
	for <loongarch@lists.linux.dev>; Thu,  2 Feb 2023 09:01:38 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-190-XaP5QKFjNy-qcXJueChPsA-1; Thu, 02 Feb 2023 09:01:36 +0000
X-MC-Unique: XaP5QKFjNy-qcXJueChPsA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 2 Feb
 2023 09:01:34 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 2 Feb 2023 09:01:34 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Huacai Chen' <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
CC: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Xuefeng Li
	<lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] LoongArch: Make -mstrict-align be configurable
Thread-Topic: [PATCH] LoongArch: Make -mstrict-align be configurable
Thread-Index: AQHZNuKTZOpLs+GXMEuRBwFbIvBWLq67WwCQ
Date: Thu, 2 Feb 2023 09:01:34 +0000
Message-ID: <363cd09a5dcb4deab21f58c19025254f@AcuMS.aculab.com>
References: <20230202084238.2408516-1-chenhuacai@loongson.cn>
In-Reply-To: <20230202084238.2408516-1-chenhuacai@loongson.cn>
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
> Sent: 02 February 2023 08:43
>=20
> Introduce Kconfig option ARCH_STRICT_ALIGN to make -mstrict-align be
> configurable.
>=20
> Not all LoongArch cores support h/w unaligned access, we can use the
> -mstrict-align build parameter to prevent unaligned accesses.
>=20
> This option is disabled by default to optimise for performance, but you
> can enabled it manually if you want to run kernel on systems without h/w
> unaligned access support.

Should there be an associated run-time check during kernel initialisation
that a kernel compiled without -mstrict-align isn't being run on hardware
that doesn't support unaligned accesses.

It can be quite a while before you get a compiler-generated misaligned acce=
sses.

Also isn't there a HAVE_EFFICIENT_MISALIGNED_ACCESS define that would
also need to be set correctly??

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

