Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476BE2560
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 13:01:53 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-310-HOsBnwgIOVGa0u6OTwu1Cg-1; Wed, 08 Feb 2023 13:01:50 +0000
X-MC-Unique: HOsBnwgIOVGa0u6OTwu1Cg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 8 Feb
 2023 13:01:49 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 8 Feb 2023 13:01:49 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Willy Tarreau' <w@1wt.eu>, Arnd Bergmann <arnd@arndb.de>
CC: chris.chenfeiyang <chris.chenfeiyang@gmail.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
Thread-Topic: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
Thread-Index: AQHZO5YhungOnDr9CUOf3i4ypB/xIK7FAt/A
Date: Wed, 8 Feb 2023 13:01:48 +0000
Message-ID: <d0df35466db74097b8e70e28d35a4776@AcuMS.aculab.com>
References: <cover.1675734681.git.chenfeiyang@loongson.cn>
 <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com>
 <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
 <Y+MXk9A+gB1W6T/n@1wt.eu>
 <CACWXhKn1N6f7XvtrbDno4UyAhMZbV_htQoRbm0ws9gjF08wnBw@mail.gmail.com>
 <7c98aac5-6b64-4f6b-b242-7ad3b8a334a8@app.fastmail.com>
 <Y+NbF6OrYu62OQCX@1wt.eu>
In-Reply-To: <Y+NbF6OrYu62OQCX@1wt.eu>
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

From: Willy Tarreau
> Sent: 08 February 2023 08:20
....
> Also looking at the man page I see that statx() only appeared in 4.11,
> and here we're targetting userland so I'd rather keep a bit of margin
> when it comes to backwards compatibility, thus not dropping stat() and
> friends too early when not necessary. However using statx() by default
> when available sounds fine to me!

Does that really matter?
Isn't 'nolibc' really just used for programs built in the
kernel source tree to be release/run with the current kernel?

I also wonder if building a 'mini_libc.a' that the programs
can be linked against might be easier than having to
generate inline versions of everything?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

