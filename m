Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413A523A
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626586; cv=none; b=kYNIn12EXJPCpghGFYTrdauVFMazCq0Pu2t4+QukaKtot07rmUqh2XcDOQbaM6VcSXj9dBjO2JeNmMNUtxoo9r0S6w0EcF1j1RVl9pM4nNZtyu3wlsEM/Kuth539hY8VUeHY1LTpLRI/sEOnMbgsyGMMv4b85fS8vQTiqQd3Haw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626586; c=relaxed/simple;
	bh=9VmKx3DsKgccHbRLWpfhAqN6UYvAPmeZ2H8WDGmj584=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IoVMM+1rjE3/kc8gdn18JMD/6RANhr8UnCUK4DLHBfR4epm4UobHm0x+xNQPD0jd3MySaX13rYiXPKy+G8tohLfge3PF3CdYIa1pqM/2GuIwhJ5jp0smO5V3pN/Y7tUeBin6KdUIov6EU3ztNzou7Rl/yaf/5inLH1Ochz6qNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAXukuLe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAXukuLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFF4C116B1
	for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626586;
	bh=9VmKx3DsKgccHbRLWpfhAqN6UYvAPmeZ2H8WDGmj584=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TAXukuLePG6F9dtZNooiC5ahNzyFi99YQ8XvjH0XzinFlSYhxeRfmqEe3KMm7979K
	 oIBI0wMaOGFZS/yG+al6U44+cHN4j9yh0egPaf0B+F541aQircrZvvJEcvNgXhDh/o
	 Jk1kYYUeC5bEtiUGc3SnKNzjusex0aGWtUKssK6/XhwNaMmjlhCf8+TUDtPPfr0ea1
	 nOSkHh4B99SAtAtqt2QGACPvrkulDgpNUqQkH1hmG+SkulkXoERv5J+wd1C5tWbEJl
	 K/QeuwFGrdR/JPxqxeu3sihVe/2fMyoTx2oP5lZoB66ycS7dJ19+T8FB8o8QIiXRKq
	 AEEJZzUgMqDEw==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so964713a12.1
        for <loongarch@lists.linux.dev>; Thu, 20 Nov 2025 00:16:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaWAgrLO/MK+05mNNgfAkoJqh/cwtxI4tt+17HC6TqcBy750ggmO3/4IrA6LgtgGYpdvXvxQj8J0U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy71wfPtmM8RxgZYKjqPng/GkzdXpp7vgu29R3ZtJsCZz3zx8qf
	BeHVWtInnsX/y8refEQkxGEYEVJP1+0dv5AjZ666SdXDVPwbYxON3q9dd7SGgu2xDYC2sr1tjIn
	0XxAa6Gk4gU3LyRHLNq50gORPr+vgiqU=
X-Google-Smtp-Source: AGHT+IHOAOXwgs9uq6iC/8iC5U2DujvoLlpN3kPnt3j5x/MXN7Xw7n2tHkKvyHkCMbQZ68l4jfPJfjD3DGhIDWmLWig=
X-Received: by 2002:a17:906:c109:b0:b72:6b3c:1f0d with SMTP id
 a640c23a62f3a-b7654fc9810mr269896566b.35.1763626584534; Thu, 20 Nov 2025
 00:16:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118112728.571869-1-chenhuacai@loongson.cn>
 <20251118112728.571869-14-chenhuacai@loongson.cn> <20251120090846-746f973f-e08a-46ab-a00d-87a5be759941@linutronix.de>
In-Reply-To: <20251120090846-746f973f-e08a-46ab-a00d-87a5be759941@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 20 Nov 2025 16:16:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H52FAORNDM48nYjQUWjnDFxc7+RGUsOW+JNteJrpbF6ww@mail.gmail.com>
X-Gm-Features: AWmQ_blKyIOJ5f9QG9XluvZKGjOdJIlJwU5_bDSgd8PEpdPgCaKn1AkBGV3rxuY
Message-ID: <CAAhV-H52FAORNDM48nYjQUWjnDFxc7+RGUsOW+JNteJrpbF6ww@mail.gmail.com>
Subject: Re: [PATCH V2 13/14] LoongArch: Adjust default config files for 32BIT/64BIT
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Thu, Nov 20, 2025 at 4:11=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Tue, Nov 18, 2025 at 07:27:27PM +0800, Huacai Chen wrote:
> > Add loongson32_defconfig (for 32BIT) and rename loongson3_defconfig to
> > loongson64_defconfig (for 64BIT).
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/configs/loongson32_defconfig   | 1110 +++++++++++++++++
> >  ...ongson3_defconfig =3D> loongson64_defconfig} |    0
> >  2 files changed, 1110 insertions(+)
> >  create mode 100644 arch/loongarch/configs/loongson32_defconfig
> >  rename arch/loongarch/configs/{loongson3_defconfig =3D> loongson64_def=
config} (100%)
>
> KBUILD_DEFCONFIG also needs to be adapted to this rename.
That is done in the last patch.

>
> FYI the cover letter says the series is based on v6.16-rc6, but the serie=
s
> doesn't apply to it.
Not 6.16-rc6, but 6.18-rc6, and the next version will be on top of 6.18-rc7=
.

Huacai

>
> (...)
