Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87A2110
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767080343; cv=none; b=kiBdxOop8LwEkDA8FvgI7PeGJZItaKgenLNglpMK5Q0KcDOwxg3IpAPeaDkz9VaprqfxU/emFarYNgZM1UTad8Ui5M2EDXj4QiNkdA6uwfLvEfWUWRdgm28ymQblzwsCIUhBr14gIntQKOIub9IB/WdztNbrhUvf+G169yCHzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767080343; c=relaxed/simple;
	bh=vgcUnS1052qwCBP6i7dco7h+vzHfUmkg5eMZKbGRNr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAuAKMQZGHPJkzJUOihtcmLHEy3nBXJZW38mtPoSn6kBp+rTKridhHBoJ0JQXWvht7JPepc4Vkxp88TBUIMvFSwKKSS2kZgzJkQ5kGnIewxN7EQfBVrHToeKUQLy3QkrY7PJfMrtJ7kTkT4EyRmQ1r/+Q6B9Rl4SYBkWkqedbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEq9fx75; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEq9fx75"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73a9592fb8so1886862166b.1
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 23:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767080341; x=1767685141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tmqv51wWnrt3khOKvuVGCkrOT4IpacjAgjWXw79Q7ps=;
        b=IEq9fx75IeGCuDiRnWDNZCQ+1OmcikhtqsiAzjsXklabdafCifnCUMpGDi5JS3h4/g
         pETBoFgFGmcsIZIEIbi7Tn1/cAs4HUqhzODfGCiem6yVT+1eM7JNExJyfw127AqjJuUi
         Oa7cNhccRiwMAtPbFTEdF+hCVpcLumLe42Ox/rQ4IY1x3YtNP8nV/OsAGS+iMDvQhdUl
         twhCczm3hOgd06AW+eBqw3Cnv2pLEYV1+KyGAE0WnzxPkiHnVd3s/bFXIk/74ybRWJRe
         wy37Cqqwr6o+dsS4nBLBO8jEbR2/HN5NxY2YRWLPG+TzhBKF4dxdkk4ceHUOyhMYga/t
         xslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767080341; x=1767685141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tmqv51wWnrt3khOKvuVGCkrOT4IpacjAgjWXw79Q7ps=;
        b=Vz+NWUbTgyI00GbdM3J5iuXYJg0Qkhqltk3J5kq8jkL84Ugo5k3p2Ghm1skb+M2ulb
         wvpBoz0sD4yC5zBwGif8HmhMUR5lHKbX4hct1CC79lTTTgMHY0QQmsfrzPjbDoF+A6l3
         HHTnEw8+fZtC5+ry/GjwsuSzDkAhtK/PFbTp4FVPe5P7BbDBiVhw3CZvt2uKmBIFwgoW
         Bb2ocSHzswmIzRAAU6BieNQ93TBnn0slfVbtG/D81l+ftFL/a81DhLjmczHGC51CPw9G
         QPv5C1nq9xoJ5h8IYkrxE9uDLs5s1UXFkjV+qWRFWnpDnD9Ny6oAVTMseA8qdnhg8R2e
         /T7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxIpzZq684l6QXs5+YyFH4OYmAgr62ZmchJF7wHnpdVEVQ+5uZfF1Zymh5ZBRHU/Kt1TRD1l5h5fM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE1IBmgoMy8OjopPp455GMheFBSQOBSz7txlu53AFLhp2G2qqE
	pYqAkKOmNjafkZ4VRvdps89Ag5ijcqUtjwsIc336FlOX5vES3e3eUzPzWozkR3xKenVRzem9RDk
	zcwIyh7dqOSE1sfb4mt9RKwDQ5rYjba0=
X-Gm-Gg: AY/fxX5iMxeX9cEGonKbnpQ/TBnc4xO6EqcJCjwF72sXlvfY7IrsCVQ31I6KtfUV2Va
	Z2kHjNBPkAmkSlb/MG2PchYGkNVXYd1UNb54/Vfq48U4l8PzU67T8vvoQzMraWwhmLnZ/c3UFu+
	p9EefSxm7WJ7BM4JDWGpR339BewflOYfwuSTwOyi47JrJA3xy98HxSYtfdjWULpsTH9c2DW8Cso
	oXYz0i5mDfFDTQsFmm1rxctD1mSYz9KJ9NMhX0jaZl36IuLduxe0cAsmmLw3yZNXMGV5CU=
X-Google-Smtp-Source: AGHT+IHAJA2AOTDuTqR84uN8GaoIGr40SvME92MC06j4BBxWbkvap6/SnuvE+IEmuyMd/yBZ9B48ALV/0MQM5/JfD0Q=
X-Received: by 2002:a17:907:fdc1:b0:b7d:266a:772c with SMTP id
 a640c23a62f3a-b803574c34fmr3563319966b.21.1767080340398; Mon, 29 Dec 2025
 23:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766037997.git.zhoubinbin@loongson.cn> <fa13f6bc32832085fa06ec004ff0e8b6464e7a7d.1766037997.git.zhoubinbin@loongson.cn>
 <CAAhV-H4KpOGn44jDf09S2NVOnCD2KHbspK9OtZnrQd8Or+-UWg@mail.gmail.com>
In-Reply-To: <CAAhV-H4KpOGn44jDf09S2NVOnCD2KHbspK9OtZnrQd8Or+-UWg@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Dec 2025 15:38:47 +0800
X-Gm-Features: AQt7F2qT8fMLe7RqULA_KkU7lSkbg6Oz1huOb4eO1oPpU_v58G5la13G1CATcu4
Message-ID: <CAMpQs4Lw3OTe53RXtZzCrj2u0O=ytcNpF+_39j7YsFbnLujSvQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] LoongArch: dts: loongson-2k0500: Add default
 Extend I/O Interrupt controller address cells
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Yao Zi <me@ziyao.cc>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi :

Sorry for the late reply.

On Sun, Dec 21, 2025 at 8:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Fri, Dec 19, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > Add missing address-cells 0 to the extend I/O interrupt controller node
> > to silence W=3D1 warning:
> >
> >   loongson-2k0500.dtsi:513.5-51: Warning (interrupt_map): /bus@10000000=
/pcie@1a000000/pcie@0,0:interrupt-map:
> >     Missing property '#address-cells' in node /bus@10000000/interrupt-c=
ontroller@1fe11600, using 0 as fallback
> >
> > Value '0' is correct because:
> > 1. The extend I/O interrupt controller does not have children,
> > 2. interrupt-map property (in PCI node) consists of five components and
> >    the fourth component "parent unit address", which size is defined by
> >    '#address-cells' of the node pointed to by the interrupt-parent
> >    component, is not used (=3D0)
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loonga=
rch/boot/dts/loongson-2k0500.dtsi
> > index 357de4ca7555..0594da1ea83d 100644
> > --- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> > @@ -164,6 +164,7 @@ eiointc: interrupt-controller@1fe11600 {
> >                         compatible =3D "loongson,ls2k0500-eiointc";
> >                         reg =3D <0x0 0x1fe11600 0x0 0xea00>;
> >                         interrupt-controller;
> > +                       #address-cells =3D <0>;
> >                         #interrupt-cells =3D <1>;
> >                         interrupt-parent =3D <&cpuintc>;
> >                         interrupts =3D <3>;
> Like Patch-5, I think liointc also need #address-cells, so does Patch-6.

As Rob said[1], the `#address-cells` attribute isn't required unless
it's always referenced by the ` interrupt-map` attribute, so I'd like
to leave the liointc node unchanged.
Add attributes as needed based on existing DTB warnings, and Patch-6
will do the same.

[1]: https://lore.kernel.org/all/20251229234931.GA2804566-robh@kernel.org/
>
> Huacai
>
> > --
> > 2.47.3
> >

--
Thanks.
Binbin
