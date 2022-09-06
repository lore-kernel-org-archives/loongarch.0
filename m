Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAB15CE
	for <loongarch@lists.linux.dev>; Tue,  6 Sep 2022 04:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1662438428;
	bh=0cI1Rk0Un9o1Oj+XrrEKadSkkh9tk38OEijCtoyUORY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L3SS+6vzjxpAfuWaGy8T+L2LY/1t3nD6hbtrRRl0JyDEwty7AROoGIZCQunSQanUF
	 6d8QrqDI9jG93ZX0E9CwwDGIKfktQqEokFCabb8YggjAWAzAZ0UNeonF0LLOEc0vrQ
	 t6CoVqBp6DkGZs5nMYA3K2A8Ka4bj25oDCXK6AD0=
Received: from [IPv6:240e:358:116c:5200:dc73:854d:832e:4] (unknown [IPv6:240e:358:116c:5200:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 53EE466857;
	Tue,  6 Sep 2022 00:27:03 -0400 (EDT)
Message-ID: <8d0f96e2977c5c78f17bb410087f2aad986ef5a4.camel@xry111.site>
Subject: Re: [PATCH v7 0/5] LoongArch: Support toolchain with new relocation
 types
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, Youling
 Tang <tangyouling@loongson.cn>
Date: Tue, 06 Sep 2022 12:26:56 +0800
In-Reply-To: <CAAhV-H56TQeU54JjvNQg2qZ6L1aSbzbaM2a=VQr9ZcAn4uthyg@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2022-09-06 at 09:52 +0800, Huacai Chen wrote:
> > =C2=A0 cflags-$(CONFIG_LOONGARCH)=C2=A0=C2=A0=C2=A0=C2=A0 :=3D $(subst =
$(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fpic
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fpie
> >=20
> > =C2=A0 cflags-$(CONFIG_EFI_GENERIC_STUB) +=3D -I$(srctree)/scripts/dtc/=
libfdt
> >=20
> > (Some explanation: -fpic does not only mean "generate position-
> > independent code", but "generate position-independent code *suitable fo=
r
> > use in a shared library*".=C2=A0 On LoongArch -mdirect-extern-access ca=
nnot
> > work for a shared library so the "-fpic -mdirect-extern-access"
> > combination is rejected deliberately.)
> >=20
> > Not sure how to submit these changes properly...=C2=A0 Do you prefer me=
 to
> > send V8 of this series or a single patch on top of your tree on GitHub?

> Don't need V8, I will squash it into the previous patch myself. But
> can we keep efistub as is?

No, we can't allow -mdirect-extern-access -fpic on LoongArch because
without copy relocation such a combination just does not make sense (i.
e. we cannot find a sensible way to handle such a combination in GCC).=20
So such a combination will cause GCC refuse to run.

Note that -fpic/-fPIC is "position-independent code *suitable for
use in a shared library*", while -fpie/-fPIE is more like just
"position-independent code".  The names of those options are confusing.
(When -fpic was invented first time, people mostly believed "PIC had
been only for shared libraries", so it's named -fpic instead of -shlib
or something.)  IMO in the EFI stub for other ports, -fpie should be
used instead of -fpic as well because the EFI stub is not similar to a
shared library in any means.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
