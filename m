Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8E2F9D85
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767532157; cv=none; b=IXT27KRvT+nVDIenZ5gqCNSIzLYH0ruJCjJSdBY6SZs5PxaMHhi/p++++whukg47aRdj17Jo9+2faLtNJmACYu9OsG5kYOLlqF+pAQU/uvpnPT7ZvXXLsdDHl1vgakntquKbMCN8ElgSnBC8VoZMxaaFtl8Th0S1t53h+xu3Ttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767532157; c=relaxed/simple;
	bh=xhbBpZPjeFau9TEO0yHrCoV89RWRT3dACYB9ZeecuX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV02oyXiDGz07ADMHYl+rW/3D6j8ZBJhhh3e/l9F0VJy+Fs2KInGxKsKhMpe6b0ahGapUGeggH/SFt6hmej40lvp8f4Qjai+AUnjB2mkyEoAKawBa7E9c2Tpd0Ur/zV5Ab1BBVgYjPGnDobAtfwJnmTj+J6rg/lDu0KlduY3DKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb1nuK4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb1nuK4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBABC19424
	for <loongarch@lists.linux.dev>; Sun,  4 Jan 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767532156;
	bh=xhbBpZPjeFau9TEO0yHrCoV89RWRT3dACYB9ZeecuX8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fb1nuK4wKOB4Zvj7Emeltybcths6AjP3kHZ1Mtbso+hI3XI+m6bhJWRP3OPe9CH4a
	 SB0vcex//y5dounwSuAGCTqT/BYfmEA6Bdu0qwVLIAbXLr58p6DlXjIH8V7mRYBLb3
	 p12W2UqfIk4UVic2W/UZXH/EWqFK2VyuJ8SHD2ZxEV8+uNyiNAFpVCQP0hsMqFodtp
	 P/d8/pvayEZjiTtSklyoLteU00Ij3RK0EPgH2we4TOyINQIFai+Djd1EgIGkQhxUjv
	 F2Eq+tzbH7sTwbIRAZ3EPwJks83eXFdx3eFjRLTqUoRfVsFfDoUvFhvk761ddcRlMY
	 XTcuQ6br98iYw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b76b5afdf04so2038868566b.1
        for <loongarch@lists.linux.dev>; Sun, 04 Jan 2026 05:09:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlbs2bdJe0nT/EwG7eXflnIu1+NFcuVl7rK5rmI7ZU4c4w8xDLaB5ebFfoV3NuKtPLYbpx1zI860w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yysmo2A/DC2TulJKEOsVjcePKul3wkUM7pIqRED/sMaWbArmwlp
	Ur0Rdqq84/qTmuKaKazZTlt0RxCj0jL90tls/OrFvC6tKoi+iHe6f77dkrdJw1YoT8CWU2r7wv3
	zK4mMCcW7SiDKdgWWF6e4ssGDmDa8+/Y=
X-Google-Smtp-Source: AGHT+IHTd7+rkGWj+5amevkc7uqoJRZS0EY40dfZqALuYmRhehRsVVSUnLbKz8VkocRwjK1iryHSKjtruaQIC8y9D/Y=
X-Received: by 2002:a17:907:724e:b0:b6d:5bc3:e158 with SMTP id
 a640c23a62f3a-b8036f2ac34mr5020185266b.17.1767532155199; Sun, 04 Jan 2026
 05:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260104-loongson-pci1-v2-1-d151e57b6ef8@uniontech.com> <9ddf7822-eda7-4c6c-9240-31ab1c4708c3@aosc.io>
In-Reply-To: <9ddf7822-eda7-4c6c-9240-31ab1c4708c3@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 4 Jan 2026 21:09:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5xfqXQA600YPAB43H9phOyUAnTiPsOH7Qxztu=D+-9Fw@mail.gmail.com>
X-Gm-Features: AQt7F2qLjPUqyx4dpaY_lZeOY3JtwPHfi0peRTrmFWBxFvPwpqtwUyeT2MtSjw0
Message-ID: <CAAhV-H5xfqXQA600YPAB43H9phOyUAnTiPsOH7Qxztu=D+-9Fw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: loongson: Override PCIe bridge supported speeds
 for older Loongson 3C6000 series steppings
To: Mingcong Bai <jeffbai@aosc.io>
Cc: liziyao@uniontech.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	niecheng1@uniontech.com, zhanjun@uniontech.com, guanwentao@uniontech.com, 
	Kexy Biscuit <kexybiscuit@aosc.io>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lain Fearyncess Yang <fsf@live.com>, 
	Ayden Meng <aydenmeng@yeah.net>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 7:03=E2=80=AFPM Mingcong Bai <jeffbai@aosc.io> wrote=
:
>
> Hi Ziyao Li,
>
> =E5=9C=A8 2026/1/4 18:00, Ziyao Li via B4 Relay =E5=86=99=E9=81=93:
> > From: Ziyao Li <liziyao@uniontech.com>
> >
> > Older steppings of the Loongson 3C6000 series incorrectly report the
> > supported link speeds on their PCIe bridges (device IDs 3c19, 3c29) as
> > only 2.5 GT/s, despite the upstream bus supporting speeds from 2.5 GT/s
> > up to 16 GT/s.
> >
> > As a result, certain PCIe devices would be incorrectly probed as a Gen1=
-
> > only, even if higher link speeds are supported, harming performance and
> > prevents dynamic link speed functionality from being enabled in drivers
> > such as amdgpu.
> >
> > Manually override the `supported_speeds` field for affected PCIe bridge=
s
> > with those found on the upstream bus to correctly reflect the supported
> > link speeds.
> >
> > This patch was originally found from AOSC OS[1].
>
> Thanks for the patch. Looping loongarch.
I prefer naming consistency, which means loongson_pci_bridge_speed_quirk().

Huacai
>
> Best Regards,
> Mingcong Bai
>
