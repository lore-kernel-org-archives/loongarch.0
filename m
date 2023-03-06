Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94C63C02
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 12:07:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id DB22A5C0306;
	Mon,  6 Mar 2023 07:07:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 06 Mar 2023 07:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678104452; x=1678190852; bh=mwc7EIuNo/MyjfHlnoYb4hr47GPIMP//VDK
	N9qy5o3w=; b=sOsIioPkIoTlw/AhoEbbn92CM8ytuVYhAK4AqH1ZfkJ4IKgj+e1
	GVZbZScRbf1AyDzUOc5MxXn8Ps7R2g7B52QNvjKLpQivb8jC4vDtrxO7l/wAMApJ
	gnEPEqvmDUPCiLfovBf9UO6SAwLZucWwEOI0nfe5pVkoy3ekC8AISxMKsGeulRxE
	vZkhKmJBoP+1/AyebeAeZSxK4PU+YjNnLKDHdDhY/Acm10imOuyninyfR5rSJJiZ
	TkOLvGq1i8YNmC4+FHf26qfu+NF8uOhugL+d8cWlagP//+QpdSmdVCeM8hQ0YQgO
	/oJV4cauHONDS2e81ujQOW5ld1/RQfNuT2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1678104452; x=1678190852; bh=mwc7EIuNo/MyjfHlnoYb4hr47GPIMP//VDK
	N9qy5o3w=; b=KbBPICOviy1ta5mkDBkc7dt4W6IBMk+Mx4HtK3UvpLRSjnp7d2S
	48AqcxienxXhPJVJ6K4T6DHkkl5omxqoRmH3wpyc0YdlM7mxiESA/xWHK2WCcd6u
	Z8AP4XgSOjr++aYpCqsGe4V+UEnGy3tHJAvt0T0bY8auApAgGUYg/OSHkMZgePiw
	ZfopmnuKU1qqOZ2u5w8C7FBROyvuYXKR0KKBCk3k6VF5EuLZ2GiKxFY+1rpVtrvi
	ryZNlDm9I61SVOGru4KTorJaCtQXg/CQidTDZ+ZGJ84VLpMhTH+jBV75ktaf0qBS
	9ohfKFzo3t3x9J+bkOwvnvXIlbRKYsd1Ybg==
X-ME-Sender: <xms:hNcFZM2kPPOQou0beoIZVboKuGd65hFIXT_QVGoirHNNZCA9xgJvnA>
    <xme:hNcFZHF11AfjkPhFKRqKg1yGOYLVikaZfgQS2Vn3xtBict6ySLT7BOxXapLnqNDaM
    vkjQkgPaULQEYsTBu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:hNcFZE7fhXD3h1BUbtr2q8z6Py5FB10iBXBZK3qDFeFFtLsC1tUrMQ>
    <xmx:hNcFZF2Ua_TjD3C5UeCGpyLldQhj7H7--77l_4Ik4iiRpwsWPw_aBQ>
    <xmx:hNcFZPF9GWF5Jir3yoxQJ1CCWvlYiSkHbHP8ctFz3FolX30_MY8i5A>
    <xmx:hNcFZET4IfmY4U9aPjuxGdcSdQRHXlsUiV0V4rff3SkTQReOzoDy7A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 395A6B60086; Mon,  6 Mar 2023 07:07:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <40b324af-3483-4b3d-b65a-a97944aa4a70@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H7Nt+OKAnN1GsYCZCb2SUa3r7zRFRsy3fjMX+TAp1_7Uw@mail.gmail.com>
References: <20230306032854.254700-1-dzm91@hust.edu.cn>
 <73cd36b6-c6ee-5c55-e2e1-31cae2f712f7@loongson.cn>
 <CAAhV-H7Nt+OKAnN1GsYCZCb2SUa3r7zRFRsy3fjMX+TAp1_7Uw@mail.gmail.com>
Date: Mon, 06 Mar 2023 13:07:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Huacai Chen" <chenhuacai@kernel.org>, "Yinbo Zhu" <zhuyinbo@loongson.cn>,
 soc@kernel.org
Cc: "Dongliang Mu" <dzm91@hust.edu.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v3] drivers: loongson: fix memory leak in loongson2_guts_probe
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 6, 2023, at 11:01, Huacai Chen wrote:
> CC + Arnd&SOC list

Note: adding me on Cc is not the best way to get me to
apply patches through the SoC tree, as it's not obvious
if you just want a review or asking for it to be
integrated.

My preferred way would be to have a pull request or a set
of patches that you send (with your Signed-off-by added when
forwarding) to soc@kernel.org, with Cc to the loongarch list
and lkml. This ends up in the patchwork system at
https://patchwork.kernel.org/project/linux-soc/list/ and
guarantees that I'll get to it eventually.

When you start sending patches for arch/loongarch/boot/dts,
you can send them the same way as drivers/soc/ patches, but
please keep the two sets separate, as I keep them in separate
branches of the soc tree as well.

> On Mon, Mar 6, 2023 at 11:48=E2=80=AFAM zhuyinbo <zhuyinbo@loongson.cn=
> wrote:
>> Tested-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>
>> =E5=9C=A8 2023/3/6 =E4=B8=8A=E5=8D=8811:28, Dongliang Mu =E5=86=99=E9=
=81=93:
>> > drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
>> > warn: 'guts->regs' from ioremap() not released on lines: 131,135,13=
9,143.
>> >
>> > Fix this by modifying ioremap to devm_ioremap.
>> >
>> > Note that, this patch is not tested due to the loongson architectur=
e.
>> >
>> > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

The patch looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

>      res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -     guts->regs =3D ioremap(res->start, res->end - res->start + 1);
> +     guts->regs =3D devm_ioremap(dev, res->start, resource_size(res));

The best way to write this is probably using
devm_platform_ioremap_resource() to combined those two lines into one,
but either way is correct.

     Arnd
