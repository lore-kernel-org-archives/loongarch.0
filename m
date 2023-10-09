Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A31946D
	for <loongarch@lists.linux.dev>; Mon,  9 Oct 2023 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id ACBC36340DFB;
	Mon,  9 Oct 2023 15:09:20 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id fAqWxJUbVZPL; Mon,  9 Oct 2023 15:09:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 86D316234897;
	Mon,  9 Oct 2023 15:09:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qGg_8h5ogqvU; Mon,  9 Oct 2023 15:09:19 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2312E6340DFB;
	Mon,  9 Oct 2023 15:09:19 +0200 (CEST)
Date: Mon, 9 Oct 2023 15:09:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: masahiroy <masahiroy@kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um <linux-um@lists.infradead.org>, 
	loongarch <loongarch@lists.linux.dev>, 
	sparclinux <sparclinux@vger.kernel.org>, x86 <x86@kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, bp <bp@alien8.de>, 
	dave hansen <dave.hansen@linux.intel.com>, hpa <hpa@zytor.com>, 
	mingo <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	tglx <tglx@linutronix.de>
Message-ID: <687416388.7594.1696856958852.JavaMail.zimbra@nod.at>
In-Reply-To: <20231009124210.1064021-2-masahiroy@kernel.org>
References: <20231009124210.1064021-1-masahiroy@kernel.org> <20231009124210.1064021-2-masahiroy@kernel.org>
Subject: Re: [PATCH 2/5] UML: remove unused cmd_vdso_install
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: remove unused cmd_vdso_install
Thread-Index: 3hBejy77kYh6pqow8LgNKN8Tb77OsQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "masahiroy" <masahiroy@kernel.org>
> An: "linux-kbuild" <linux-kbuild@vger.kernel.org>
> CC: "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-arm-kernel" <li=
nux-arm-kernel@lists.infradead.org>,
> linux-csky@vger.kernel.org, "linux-parisc" <linux-parisc@vger.kernel.org>=
, linux-riscv@lists.infradead.org,
> linux-s390@vger.kernel.org, "linux-um" <linux-um@lists.infradead.org>, "l=
oongarch" <loongarch@lists.linux.dev>,
> "sparclinux" <sparclinux@vger.kernel.org>, "x86" <x86@kernel.org>, "masah=
iroy" <masahiroy@kernel.org>, "anton ivanov"
> <anton.ivanov@cambridgegreys.com>, "bp" <bp@alien8.de>, "dave hansen" <da=
ve.hansen@linux.intel.com>, "hpa"
> <hpa@zytor.com>, "mingo" <mingo@redhat.com>, "Johannes Berg" <johannes@si=
psolutions.net>, "richard" <richard@nod.at>,
> "tglx" <tglx@linutronix.de>
> Gesendet: Montag, 9. Oktober 2023 14:42:07
> Betreff: [PATCH 2/5] UML: remove unused cmd_vdso_install

> You cannot run this code because arch/um/Makefile does not define the
> vdso_install target.
>=20
> It appears that this code was blindly copied from another architecture.
>=20
> Remove the dead code.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
