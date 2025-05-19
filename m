Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE921FF610
	for <loongarch@lists.linux.dev>; Mon, 19 May 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648316; cv=none; b=EB2GPIhWXW2wgFL5mRQ2o/TTWlonWhGfQULKcooJeFiM2Atp6dasOURFQoFRZSeqU0WGe5PIiskqukSvr/9c+JNTy4SOouQ93CuDXwHA19dNDe/r4//v+XfBqUCzflgsAB3jRiDURM2DlC9293wycOIO34rAnR3bR3paoMvbFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648316; c=relaxed/simple;
	bh=J79iIRh+mb98roAnS0bOZnbKEfcnEGQWJzqWX8EOWTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moXpfgzKx/0zAyJoJiceiehEnB5P7P48I4UwIFh/aWlQY4VjTd0rjLfmUx634koDn4JbfSCR8AeIRRo5eQZD1VPymorqx7Ki5d808WxwV/bBExfJm3GzlNlPid/nE2OPBpcOMxOfrjtQ/1VgIr7pAOpsTCpWLhkqoKldwVFO22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZy4K+Sl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZy4K+Sl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acacb8743a7so709018366b.1
        for <loongarch@lists.linux.dev>; Mon, 19 May 2025 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747648313; x=1748253113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTo67rYc6P2/pwOcsI2e9jMG4F7lh9l1foadztUAX5o=;
        b=YZy4K+SlDiVNbq11Yu/Vm0bSOgJB5032LntG+IPUd31033mAyqitma544ixpGGXfoh
         fQxKZcrh/NbGOBC3lXDqpNgJYXC2ZRAxqadBpuYWHtJDdLIIxDLnGaLEgVmZE4Gj7+g4
         lNlU2pPgpkWyt3USNav9tZTKPFRfXbXUASuxnSHjWlltBT46re5zI5hEAc/EhiBJaCm7
         rXTMvVX71rMgVanC98OzYqPVeP3EABzvbFGs8PwHR1il1cKqef/WpXjPA/zrN57tNPTT
         WNH9yo8AeOELxiuWaEF40IG8zKDvyfdDVVtoNrar+digEt/AL1VV0c/g4FFdQIn24uSp
         W+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648313; x=1748253113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTo67rYc6P2/pwOcsI2e9jMG4F7lh9l1foadztUAX5o=;
        b=KO0qixdWT5p9RWvMrxEHSqnmKi7wTTzfQSELX7U2dXRL+oY/TFjXiwdeczFr/fbkgW
         9QXFUOWOa7HlpM71IcOXSrSJDhcpxIFSnKWf8p/O9ihC6DbaJdSdQGtJu+Q3+c6eIsVe
         Bmmm91NF9lsmU8OBo9f6Lz99miuGYAVuZXmLORsZc29q1cXEcL/9q5Khus+EuoOiQK7H
         dtkk+TdXKMf+W9syzbg2QdYraK6SlrAXuYIuENRmIqEsBGyt7J22/JihWy5baTXYlI1S
         9i10zqgZQ9sujGpE3p9aEMWKSXr6R0oSz3d75nih9GoEg9SRoOXmpiM+cpI/jLUuc6Fp
         qzSg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4AWyHnzHMsA1F1ju8B/GOj7pGkYVWv5jUahLscQRZZBMidWYLSphnFJszNbp37qCHVnyMdr3DS8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEsUTQ1bSvp5caeI1JqAh2s9iwhC2k8+dJ0WBY/62b2XJXvOFs
	1bZ6OKg7rXr0UEnCfckoob80kuETkMG39tqdbVZ9RZqWfQM7+S0fIppQ+zWEw/NAkmlIUnn/9EM
	ZIDcaIyQu9n1GOMihHEc3HWqWh9IY4l4=
X-Gm-Gg: ASbGncvKI0BnFTeZQItuU9qqdirT2b2j9NKp7RwF+TxhzYRh/7iWL+ONmadyIurAw47
	XnR1RIP06t6U9KPARzvnQlAWakIqX0RhuPgzqoCHG5hmkJ2juihEvgS2AQjMBDfwgpR1z6DHZoP
	HHDhDuJUjisPx6Bp6CCAQxhjrP2A2TEScz
X-Google-Smtp-Source: AGHT+IGR+8e8x8Sok3xUZE8cgeqjUKnwOVhy4Sl4Kmx2qf8ehVBRuvTdCHw2VOyPB7/eKFtGOUM9ED8HbFP7y/UVPDw=
X-Received: by 2002:a17:907:6d0a:b0:ad5:4cde:fb97 with SMTP id
 a640c23a62f3a-ad54cdf0454mr725360066b.29.1747648312724; Mon, 19 May 2025
 02:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250518080356.43885-1-ziyao@disroot.org> <20250518080356.43885-5-ziyao@disroot.org>
 <CAMpQs4+GiZpLfSHx9k_QfWjXtyrNS4LS4dOuCKLbS-F8OhpoWg@mail.gmail.com> <aCr86zZWBu8yofdD@pie.lan>
In-Reply-To: <aCr86zZWBu8yofdD@pie.lan>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 19 May 2025 17:51:39 +0800
X-Gm-Features: AX0GCFupcvxY2bCkqvadgNQfWqHGYIwTvjOwJ7e2Dvl3xHsg7x1_J87MI46UxRE
Message-ID: <CAMpQs4LNr3oKXbJq0dQVuHg_xCih=8CQCAeqK=4JdF+WzaRhng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] LoongArch: dts: Add initial devicetree for CTCISZ
 Forever Pi
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:43=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> On Mon, May 19, 2025 at 03:58:29PM +0800, Binbin Zhou wrote:
> > Hi Yao:
> >
> > On Sun, May 18, 2025 at 4:05=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrot=
e:
> > >
> > > Enable UART0 as it's the boot UART used by firmware.
> > >
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  arch/loongarch/boot/dts/Makefile              |  1 +
> > >  .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   | 45 +++++++++++++++++=
++
> >
> > A minor suggestion:
> > As we can see, the existing dtsi/dts files are prefixed with
> > =E2=80=9Cloongosn-2k=E2=80=9D, would it be possible to keep the filenam=
es consistent?
>
> It's abbreviated since loongson-2k0300-ctcisz-forever-pi.dts seems a
> little too long for me, and naming devicetree files in form of
> <abbreviated-SoC-name>-<vendor>-<model> is common on other
> architectures.

Sorry, the length of the filename is not really a major concern for me.
>
> I won't insist and will change it if you consider consistency really
> matters.

Yes, I actually do mind, let's keep the naming consistent.
>
> > >  2 files changed, 46 insertions(+)
> > >  create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-p=
i.dts
>
> ...
>
> > --
> > Thanks.
> > Binbin
>
> Best regards,
> Yao Zi

--=20
Thanks.
Binbin
