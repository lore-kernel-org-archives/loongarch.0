Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C84160
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 22:39:22 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-129-d_gHFPeOPuyKwE1OvMCryA-1; Wed, 08 Feb 2023 22:39:19 +0000
X-MC-Unique: d_gHFPeOPuyKwE1OvMCryA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 8 Feb
 2023 22:39:18 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 8 Feb 2023 22:39:18 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'chris.chenfeiyang@gmail.com'" <chris.chenfeiyang@gmail.com>, "w@1wt.eu"
	<w@1wt.eu>, "paulmck@kernel.org" <paulmck@kernel.org>
CC: Feiyang Chen <chenfeiyang@loongson.cn>, "arnd@arndb.de" <arnd@arndb.de>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "jiaxun.yang@flygoat.com"
	<jiaxun.yang@flygoat.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
Thread-Topic: [PATCH v2 2/5] tools/nolibc: Add statx() and make stat() rely on
 statx() when available
Thread-Index: AQHZO6bWNfcYoy9T2k+HhbOMxyXnuK7FpFaw
Date: Wed, 8 Feb 2023 22:39:18 +0000
Message-ID: <de9439e489684965989ac4e96b87de41@AcuMS.aculab.com>
References: <cover.1675851111.git.chenfeiyang@loongson.cn>
 <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
In-Reply-To: <b9bbf73286238bb4657d855c9d50983aa17953e2.1675851111.git.chenfeiyang@loongson.cn>
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

From: chris.chenfeiyang@gmail.com
> Sent: 08 February 2023 10:18
>=20
> loongarch and riscv32 only have statx(). arc, hexagon, nios2 and
> openrisc have statx() and stat64() but not stat() or newstat().
> Add statx() and make stat() rely on statx() to make them happy.
>=20
...
> +#ifdef __NR_statx
> +static __attribute__((unused))
> +int sys_stat(const char *path, struct stat *buf)
> +{
> +=09struct statx stat;

If seems wrong that 'stat' has type 'struct statx'
and 'buf' type 'struct stat *'.

Maybe s/stat./statx./ and s/buf->/stat->/ ?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

