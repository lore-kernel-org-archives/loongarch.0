Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D895665
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 16:58:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-267-eKtrbf90My6ZKBR6Hk0zIA-1; Mon, 06 Mar 2023 16:58:01 +0000
X-MC-Unique: eKtrbf90My6ZKBR6Hk0zIA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.47; Mon, 6 Mar
 2023 16:57:57 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.047; Mon, 6 Mar 2023 16:57:57 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Huacai Chen' <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>
CC: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Xuefeng Li
	<lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
	<kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>
Subject: RE: [PATCH V3] LoongArch: Provide kernel fpu functions
Thread-Topic: [PATCH V3] LoongArch: Provide kernel fpu functions
Thread-Index: AQHZUBJ45VTcAaETSEKOkFhUUQ2cwq7t95nA
Date: Mon, 6 Mar 2023 16:57:57 +0000
Message-ID: <5171500c01604a70b55529d8cd780a57@AcuMS.aculab.com>
References: <20230306095934.609589-1-chenhuacai@loongson.cn>
In-Reply-To: <20230306095934.609589-1-chenhuacai@loongson.cn>
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
> Sent: 06 March 2023 10:00
>=20
> Provide kernel_fpu_begin()/kernel_fpu_end() to allow the kernel itself
> to use fpu. They can be used by some other kernel components, e.g., the
> AMDGPU graphic driver for DCN.
>=20
...
> +void kernel_fpu_end(void)
> +{
> +=09if (!this_cpu_read(in_kernel_fpu))
> +=09=09return;

Shouldn't it be better for that to be a counter?
Not sure what anyone else does.

> +
> +=09if (!is_fpu_owner())
> +=09=09disable_fpu();
> +=09else
> +=09=09_restore_fp(&current->thread.fpu);

Does that actual do the restore?
You really don't need to do it until 'return to user'.
That will speed up a subsequent kernel_fpu_begin().

If fact, couldn't kernel_fpu_end() just be preemt_enable()?

=09David

> +
> +=09this_cpu_write(in_kernel_fpu, false);
> +=09preempt_enable();
> +}
> +EXPORT_SYMBOL(kernel_fpu_end);
> --
> 2.39.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

