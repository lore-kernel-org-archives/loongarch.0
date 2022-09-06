Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF717D1
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 05:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1662440491;
	bh=1oNtxf1c5bbGEwVSqkKGWodjPqD73sS9Q23KWDUkQ6g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aX6nT/2JzHVMgDszWnrupgVW3cEl6rr1OHFw95xgVFGoIfsOSegPaE4yzhx5DK0Dd
	 folpTg84mXDIFjOPKbbx7TKGcYj4uBDfhJS5GDM7cFZpZbCd1sKLGix+GJQxKDM6JL
	 NDQYjTTvZo+xAf7IrRnSCKpkNRve+8QD07ZIXGz8=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 5BDB965C37;
	Tue,  6 Sep 2022 01:01:29 -0400 (EDT)
Message-ID: <6a3e185eaaac4a1397abe43026004548d47ee305.camel@xry111.site>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, Youling
 Tang <tangyouling@loongson.cn>
Date: Tue, 06 Sep 2022 13:01:27 +0800
In-Reply-To: <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com>
References: <20220830104806.128365-1-xry111@xry111.site>
	 <CAAhV-H5bH7xZTWLhqcZ_Bmh=RNaEVBy9523hmj-gTmitqqc8ag@mail.gmail.com>
	 <c0ba2e23-5be3-924d-554a-2f10272c05bc@xen0n.name>
	 <CAAhV-H7Dz21qRgwkMcJ0SnA9FNDN19E6mpa7C25LUitrO9LGeA@mail.gmail.com>
	 <5b87173faeef587a2ffaaa6f58d34e0940231067.camel@xry111.site>
	 <c53303bf-a5d2-098f-8975-efadbe0b2f2e@loongson.cn>
	 <bc323d8578d2f6ec580066bab181788b305ae3c3.camel@xry111.site>
	 <CAAhV-H4N_XvmP9KA1M5crU44kHr33MZUVSsMY4Ugu5wQSv_LOQ@mail.gmail.com>
	 <97291c0fe5a660c844475ff019c8db6af77ecf86.camel@xry111.site>
	 <CAAhV-H6wzw-MV+h225rM4PfK_HY0tAdSXcUG-2Hx+_gfhzQ4_g@mail.gmail.com>
	 <ae2652c5e140d407d523d7f35bee672cebe1b7a2.camel@xry111.site>
	 <CAAhV-H56TQeU54JjvNQg2qZ6L1aSbzbaM2a=VQr9ZcAn4uthyg@mail.gmail.com>
	 <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
	 <CAAhV-H7LjkY+XAzGs2K3544+CGOztCd4V8BuSjMJwZCgfBLDow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2022-09-06 at 12:43 +0800, Huacai Chen wrote:
> > Note that -fpic/-fPIC is "position-independent code *suitable for
> > use in a shared library*", while -fpie/-fPIE is more like just
> > "position-independent code".=C2=A0 The names of those options are confu=
sing.
> > (When -fpic was invented first time, people mostly believed "PIC had
> > been only for shared libraries", so it's named -fpic instead of -shlib
> > or something.)=C2=A0 IMO in the EFI stub for other ports, -fpie should =
be
> > used instead of -fpic as well because the EFI stub is not similar to a
> > shared library in any means.

> You are right, but I guess that Ard doesn't want to squash the efistub
> change into the LoongArch efistub support patch. :)

It only changes cflags-$(CONFIG_LOONGARCH), which is LoongArch specific.
And arm64 is also using -fpie.

Should I send the one-line EFI stub change to linux-efi first?

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
