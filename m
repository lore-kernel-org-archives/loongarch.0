Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A392104
	for <loongarch@lists.linux.dev>; Tue,  8 Aug 2023 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1691481389;
	bh=XGCtQaY1fBiZaLV8w8R9Yc6KVjaILCVagr6X2S6pXBs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X3/gIFazMGASFfLBwiDYLPix2AKIiATjzprJlsPAl4xiCUigQljLY98J4WWoopYQO
	 QS5sqT1u/8cjGe3zP9YtNTAuMRd+iv/tt0GPDZZXVjg9LDMZM9+fKw25HnnCbQSN3R
	 ArECw1kqC2XSoCZ2/kEXx9aWSwbfr4wdTZ00QQZ4=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 57600659C7;
	Tue,  8 Aug 2023 03:56:28 -0400 (EDT)
Message-ID: <843a059dec8607ce694adb82ddcbda2dfc01f833.camel@xry111.site>
Subject: Re: [PATCH] loongarch: Remove spurious "source
 drivers/firmware/Kconfig"
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org
Date: Tue, 08 Aug 2023 15:56:26 +0800
In-Reply-To: <CAAhV-H5=FJqx3FcR71LXuMB51PBAKXMO-t7DqJj_dr2BD-JtZw@mail.gmail.com>
References: <20230808034836.418485-1-xry111@xry111.site>
	 <CAAhV-H5=FJqx3FcR71LXuMB51PBAKXMO-t7DqJj_dr2BD-JtZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-08-08 at 15:16 +0800, Huacai Chen wrote:
> Hi, Ruoyao,
>=20
> I think the title should be "LoongArch: Remove redundant "source
> drivers/firmware/Kconfig""?

Yes, it looks better.  I've sent v2 with the change.

Thanks!

>=20
> Huacai
>=20
> On Tue, Aug 8, 2023 at 11:49=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wr=
ote:
> >=20
> > In drivers/Kconfig, drivers/firmware/Kconfig is sourced for all
> > ports so
> > there is no need to source it in the port-specific Kconfig file.=C2=A0
> > And
> > sourcing it here also caused the "Firmware Drivers" menu appeared
> > two
> > times: once in the "Device Drivers" menu, another time in the
> > toplevel
> > menu.=C2=A0 This was really puzzling.
> >=20
> > Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> > ---
> > =C2=A0arch/loongarch/Kconfig | 2 --
> > =C2=A01 file changed, 2 deletions(-)
> >=20
> > diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> > index e71d5bf2cee0..465759f6b0ed 100644
> > --- a/arch/loongarch/Kconfig
> > +++ b/arch/loongarch/Kconfig
> > @@ -662,5 +662,3 @@ source "kernel/power/Kconfig"
> > =C2=A0source "drivers/acpi/Kconfig"
> >=20
> > =C2=A0endmenu
> > -
> > -source "drivers/firmware/Kconfig"
> > --
> > 2.41.0
> >=20

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
