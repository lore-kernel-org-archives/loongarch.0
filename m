Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9269313E37
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767175741; cv=none; b=FsQa3TIH4un5vviBt9TSmZhVNtYKMnrlSZtnjrLNBZpZsaN0lDlO3oftflo828YR3qrl7cC8kv9EOFAJj3x9bFgSCqP7DvDfwk1XnHPXep7bUmuSZSYAiZpPLw0KK3EyFlVFWdT6dFROBuGQdI3zv/pRcSCuLpR1jVO6g9kc0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767175741; c=relaxed/simple;
	bh=QB666z0WcUC/viohN8xjIcPSHIzzC1N7fVP0HdlRvIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZYyiIynXSVMFVmirSiBlyThg3dlPBGqoId8EfY4OvDeKDBxvUQUnJnj5APlxP5l5PbZq+UhQuClrofFGDOW0Pv7nFbX7EcSZ/mbzUsWfYVWaVff1BM+bYqmxK5ZOGH6FtYW4O+hhZVdSl0saNE2xM4Kb/TOJdnmLOapS7VboGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XizlKlDM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XizlKlDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA48C4AF0B
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767175741;
	bh=QB666z0WcUC/viohN8xjIcPSHIzzC1N7fVP0HdlRvIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XizlKlDMPw4EWKzueJlEuaQgKavUYoFXHnNGNXZfQ7NHuX4uO1ZkeX6fofuABleZo
	 mPC391tzdIGG8x34cvMXl+9jv/MkZDaFt3w36lZBj9lJwgZOpGwuhaxN157oK7Y9hf
	 5+LshpSPyKX3MCfTF1vgzAMY1lvjDfvhn7GMrLbN3KyKtbqcFSLREPJHQqUY9p5pV9
	 AOvH9Xjgz23JIGdAqyf6tbQxzK+xZCIPLLhGwJLhzPiCp4LNWbg69R0ON1ZwC0WNvP
	 XTWlSNPQSXo7lL+tceHTz0hkM+Z3SRe6yHlKJLrJQ55Esp/Zd8x8lnNwEzjVgYvfQ8
	 ixvw3q8Ksu/GQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b725ead5800so1506964266b.1
        for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 02:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8wLTW2c2b5NhAZG52cHpULGitjcaERXbLYJXuvXQYN6IcRbDdzY6kdX4t1ZznM8MwnTE1kuBm30k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx63equOzrPHSDxlenoexsM3yDogeZZ7a5SWgD0DYNM20Wpoxxi
	nZ7vK3mi1yHx+rmCthxwx0ldvx49wvrllwgKiVrdtvM5SqEhvtRPt7snbrHdEJtrx58xoWMUOiJ
	bq7GwzAk7Maqio5/J1uYWaUHOU5qDT5w=
X-Google-Smtp-Source: AGHT+IFTUyzn1b3cAIZ/oQN/MhAntxBWi/Ew6QqFWoEvDuEWuQlCiSCn8Zz0270Z9EIfBpri+XHm6zgHVBi+B8B/85M=
X-Received: by 2002:a17:907:1c17:b0:b76:31e6:2ee1 with SMTP id
 a640c23a62f3a-b8036f65331mr3513451766b.18.1767175739871; Wed, 31 Dec 2025
 02:08:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766037997.git.zhoubinbin@loongson.cn> <fa13f6bc32832085fa06ec004ff0e8b6464e7a7d.1766037997.git.zhoubinbin@loongson.cn>
 <CAAhV-H4KpOGn44jDf09S2NVOnCD2KHbspK9OtZnrQd8Or+-UWg@mail.gmail.com> <CAMpQs4Lw3OTe53RXtZzCrj2u0O=ytcNpF+_39j7YsFbnLujSvQ@mail.gmail.com>
In-Reply-To: <CAMpQs4Lw3OTe53RXtZzCrj2u0O=ytcNpF+_39j7YsFbnLujSvQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 31 Dec 2025 18:09:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Y+-VUHLn=cPYUw8sneS8QNqDUOiNL-5xJvjJ0e7uP7A@mail.gmail.com>
X-Gm-Features: AQt7F2rEoyJ4aMR2EREhwxbdd2jRSruEINqnfCTTyB6Egs9-AxwUtIczEPTYhks
Message-ID: <CAAhV-H4Y+-VUHLn=cPYUw8sneS8QNqDUOiNL-5xJvjJ0e7uP7A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] LoongArch: dts: loongson-2k0500: Add default
 Extend I/O Interrupt controller address cells
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Yao Zi <me@ziyao.cc>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 3:39=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi :
>
> Sorry for the late reply.
>
> On Sun, Dec 21, 2025 at 8:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Binbin,
> >
> > On Fri, Dec 19, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongso=
n.cn> wrote:
> > >
> > > Add missing address-cells 0 to the extend I/O interrupt controller no=
de
> > > to silence W=3D1 warning:
> > >
> > >   loongson-2k0500.dtsi:513.5-51: Warning (interrupt_map): /bus@100000=
00/pcie@1a000000/pcie@0,0:interrupt-map:
> > >     Missing property '#address-cells' in node /bus@10000000/interrupt=
-controller@1fe11600, using 0 as fallback
> > >
> > > Value '0' is correct because:
> > > 1. The extend I/O interrupt controller does not have children,
> > > 2. interrupt-map property (in PCI node) consists of five components a=
nd
> > >    the fourth component "parent unit address", which size is defined =
by
> > >    '#address-cells' of the node pointed to by the interrupt-parent
> > >    component, is not used (=3D0)
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loon=
garch/boot/dts/loongson-2k0500.dtsi
> > > index 357de4ca7555..0594da1ea83d 100644
> > > --- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > > +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > > @@ -164,6 +164,7 @@ eiointc: interrupt-controller@1fe11600 {
> > >                         compatible =3D "loongson,ls2k0500-eiointc";
> > >                         reg =3D <0x0 0x1fe11600 0x0 0xea00>;
> > >                         interrupt-controller;
> > > +                       #address-cells =3D <0>;
> > >                         #interrupt-cells =3D <1>;
> > >                         interrupt-parent =3D <&cpuintc>;
> > >                         interrupts =3D <3>;
> > Like Patch-5, I think liointc also need #address-cells, so does Patch-6=
.
>
> As Rob said[1], the `#address-cells` attribute isn't required unless
> it's always referenced by the ` interrupt-map` attribute, so I'd like
> to leave the liointc node unchanged.
I think "not required" doesn't mean "should not exist"?

In my opinion I don't want to add #address-cells again when we add
'interrupt-map' for downstream devices in future.

So, I want to add #address-cells for all interrupt controllers, except
"cpu-interrupt-controller" because it won't have direct downstream
devices.


Huacai

> Add attributes as needed based on existing DTB warnings, and Patch-6
> will do the same.
>
> [1]: https://lore.kernel.org/all/20251229234931.GA2804566-robh@kernel.org=
/
> >
> > Huacai
> >
> > > --
> > > 2.47.3
> > >
>
> --
> Thanks.
> Binbin
>
