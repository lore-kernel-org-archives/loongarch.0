Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B220EB
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:42:28 +0000 (UTC)
Received: from smtpclient.apple ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 3263gQmG008392-3263gQmI008392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 6 Mar 2023 11:42:26 +0800
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH v3] drivers: loongson: fix memory leak in
 loongson2_guts_probe
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <5523441e-6845-8e6b-52dd-aa7f1b444fd9@xen0n.name>
Date: Mon, 6 Mar 2023 11:41:18 +0800
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, loongarch@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <170E1961-F025-4790-963E-B4D535A7FEA4@hust.edu.cn>
References: <20230306032854.254700-1-dzm91@hust.edu.cn>
 <5523441e-6845-8e6b-52dd-aa7f1b444fd9@xen0n.name>
To: WANG Xuerui <kernel@xen0n.name>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
X-FEAS-AUTH-USER: dzm91@hust.edu.cn



> On Mar 6, 2023, at 11:35, WANG Xuerui <kernel@xen0n.name> wrote:
>=20
> On 2023/3/6 11:28, Dongliang Mu wrote:
>> drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
>> warn: 'guts->regs' from ioremap() not released on lines: =
131,135,139,143.
>> Fix this by modifying ioremap to devm_ioremap.
>> Note that, this patch is not tested due to the loongson architecture.
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>=20
> You may retain the R-b tags from Huacai and me, since v3 -> v2 changes =
was trivial.

I see. Thanks.

>=20
> But in this case the maintainer (Yinbo) could be aware of this when =
applying the patch locally, so you won't have to resend this time. You =
may do better for your future patches though, and thanks for your =
patience!
>=20
>> ---
>> v2->v3: change res->end - res->start + 1 to resource_size(res)
>> v1->v2: instead of modifying error handling code, directly change
>> ioremap to devm_ioremap.
>> ---
>> drivers/soc/loongson/loongson2_guts.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/drivers/soc/loongson/loongson2_guts.c =
b/drivers/soc/loongson/loongson2_guts.c
>> index bace4bc8e03b..ffee5a55a985 100644
>> --- a/drivers/soc/loongson/loongson2_guts.c
>> +++ b/drivers/soc/loongson/loongson2_guts.c
>> @@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct =
platform_device *pdev)
>> 	guts->little_endian =3D of_property_read_bool(np, =
"little-endian");
>> 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	guts->regs =3D ioremap(res->start, res->end - res->start + 1);
>> +	guts->regs =3D devm_ioremap(dev, res->start, =
resource_size(res));
>> 	if (IS_ERR(guts->regs))
>> 		return PTR_ERR(guts->regs);
>>=20
>=20
> --=20
> WANG "xen0n" Xuerui
>=20
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

