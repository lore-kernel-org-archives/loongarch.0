Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029E41A23AC
	for <loongarch@lists.linux.dev>; Sun, 21 Dec 2025 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766319206; cv=none; b=T4+1XxUbU8No6WKfqz7JQL2LrTehMcuLLENdQbr6OdqzW+NH8i0w6G/ZEn6sfHMAbCxCC7P8r03EmItXpnImRrN+QiBW3BvQvBSuv9PnA1ylTPt0NQdqqkbHVEZ9IEOhwqNcCENsn+q/AG89ivJPDDBmBvRwbrO0Km9qE8TyGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766319206; c=relaxed/simple;
	bh=/pqvN6zS+uS1k7VJPZV5BzH6CpTgwWTsDlh2GGynWDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fp34Rid8RsqijtWXCfQPs2yNvtcesWysbMUgiuNkcahDvT/B5OqBnjvBzUpQrK6FHKvbxT4gsBc98HeiBJG2+g5JXimSJ5Tb5Oq+GCuskrSgsZZe8WzCKUMFoPYxEcLYe4yBJ9xqlRoWnAIY999FSptqFZjdb6RKTjq9H1F5txQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ1I4fhU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ1I4fhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90560C116C6
	for <loongarch@lists.linux.dev>; Sun, 21 Dec 2025 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766319205;
	bh=/pqvN6zS+uS1k7VJPZV5BzH6CpTgwWTsDlh2GGynWDg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pQ1I4fhUg8dNDdT5pHL0EsuU/QLdf8QKgT77uCHKwIN7FBlcmFaSDtgLVpvOXcvqK
	 LPG1XdDnNGBi0kP4uY8hgNktnKcA60eIFCXyal1XUMzmwzxHQOqUcfYCP3x1D4qQsE
	 Xkz+foT+8ggMbC3/nVDUMbF5VVbg5r64Sdg357iFzyXXMGCLTjea3lPCio2+4z2KJT
	 pnc/w+LnfvsToB/1sE8y+derREGgmaLe34nSQB9E7IKn4VugG4U+TW+GwM6+YlI1Fo
	 BMxpQXPe7dxgR5Cc2RxQ1+R1xwL7SvtjIxguVeSNrymY2aMIUkpB+C3SUsynp7XRNr
	 t+C2Kp43cx6tg==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b725ead5800so441914666b.1
        for <loongarch@lists.linux.dev>; Sun, 21 Dec 2025 04:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu7hiFiV9bpZGdsZ5MST/4obMIYhlK1xvlPtU7HxDECg10mH7lGs2kCGaAYhdVx5tZL3fsCbxrYLM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+tfG+dzDUBBa7qCJaRUA/XgjKYIMHJfpbzZzoYmu7UvKMQkW6
	thQ4SS9pxaZLfYILx6RVt4aZyf1MzetKtGsipgHl8afd+Q+YaXCj0VAZQ/eOCtoftfqfOfpsMhY
	2pmhHyWYW5mIzx95nouBT+yQBxUN9X4Q=
X-Google-Smtp-Source: AGHT+IEvlU0DXt5Sz2jGcYlp64KD4kqEOcGKDLqL9IBv0fK39+9pStKuxkLUOYgV4GXWWYIrOr7Us7cIYmPQUi1j3YY=
X-Received: by 2002:a17:907:9717:b0:b72:8e31:4354 with SMTP id
 a640c23a62f3a-b8036f947c5mr858924566b.25.1766319204153; Sun, 21 Dec 2025
 04:13:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1766037997.git.zhoubinbin@loongson.cn> <fa13f6bc32832085fa06ec004ff0e8b6464e7a7d.1766037997.git.zhoubinbin@loongson.cn>
In-Reply-To: <fa13f6bc32832085fa06ec004ff0e8b6464e7a7d.1766037997.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 21 Dec 2025 20:13:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4KpOGn44jDf09S2NVOnCD2KHbspK9OtZnrQd8Or+-UWg@mail.gmail.com>
X-Gm-Features: AQt7F2qKJXC1y2xdyeoGu2h_pPLv_P5F8vGOhuTKl-PQ6t7HGEJb1uhlRDEnV6k
Message-ID: <CAAhV-H4KpOGn44jDf09S2NVOnCD2KHbspK9OtZnrQd8Or+-UWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] LoongArch: dts: loongson-2k0500: Add default
 Extend I/O Interrupt controller address cells
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Fri, Dec 19, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Add missing address-cells 0 to the extend I/O interrupt controller node
> to silence W=3D1 warning:
>
>   loongson-2k0500.dtsi:513.5-51: Warning (interrupt_map): /bus@10000000/p=
cie@1a000000/pcie@0,0:interrupt-map:
>     Missing property '#address-cells' in node /bus@10000000/interrupt-con=
troller@1fe11600, using 0 as fallback
>
> Value '0' is correct because:
> 1. The extend I/O interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=3D0)
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500.dtsi b/arch/loongarc=
h/boot/dts/loongson-2k0500.dtsi
> index 357de4ca7555..0594da1ea83d 100644
> --- a/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> +++ b/arch/loongarch/boot/dts/loongson-2k0500.dtsi
> @@ -164,6 +164,7 @@ eiointc: interrupt-controller@1fe11600 {
>                         compatible =3D "loongson,ls2k0500-eiointc";
>                         reg =3D <0x0 0x1fe11600 0x0 0xea00>;
>                         interrupt-controller;
> +                       #address-cells =3D <0>;
>                         #interrupt-cells =3D <1>;
>                         interrupt-parent =3D <&cpuintc>;
>                         interrupts =3D <3>;
Like Patch-5, I think liointc also need #address-cells, so does Patch-6.

Huacai

> --
> 2.47.3
>
