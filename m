Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7791A16A956
	for <loongarch@lists.linux.dev>; Wed, 17 Dec 2025 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765946946; cv=none; b=pjV7KVse4iUQJya42VOO1OFHyNzI9njU0zyuOkgBKP00vJDW39HoKna56u6Z+76wG8Iww273mU3wCAqavZNAFxmERCS3VRJpcejP/waSudAe2Osl/Ysrww2W8r7RzEvXOG4wc4S80+lKfW7pxZdTTJVV3G9/xtQ13gdF/MNAX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765946946; c=relaxed/simple;
	bh=DXiwutBlmL9LPij/j31IV4rTeagKy3s9gSqvJ5avzDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTXgnUvCdg0s/HBOBuIdPL19BM//AY9fTKw/G2+5AV+0T47Kuc39N8m5KO8945xfYamvN+/R3uAhXeiSGk8vkBwKRc6oI27P1btbVE0FUUBfZsLeRoutTtWKu03yWDm5ZWmDRbFqYPsM+uJrr4KzKKGXkISYkaHDfU+/Qm995RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVdo1Eu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVdo1Eu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5D5C4CEFB
	for <loongarch@lists.linux.dev>; Wed, 17 Dec 2025 04:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765946946;
	bh=DXiwutBlmL9LPij/j31IV4rTeagKy3s9gSqvJ5avzDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dVdo1Eu3kyiA1ohXn/6bnqFp0DAaMF8mjrqPnPqexvAQPyjYylzjswt7Ux84ylcp/
	 nGCWLkWPwnf9uWXZ1OC4Ggis9XGmhQbxjc216CpcL1LAPE7+QdAisLdjIpb9iqnqh5
	 Xk4PtDuoKHTwLEMYsPjSD0ELrkfsn/QKuApMT66A9x0vMGL2wPknzSTWoMWCjix349
	 lCtVW8ifOleJhZpXjOTfyPsKw/hkHV8jZDj5S5FVQEuP6lTTcQL+Axna8HVDOiLNNb
	 DsNEArS5DcoJQ+p/u9gKIaEr7D6w2aHUwBr+OSpMriP0n8Scto+ggSw5wM9RPlwCj4
	 E5LlQL6eg4nCQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b76b5afdf04so890832966b.1
        for <loongarch@lists.linux.dev>; Tue, 16 Dec 2025 20:49:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2hxal6tdakFT3sx/RktQZm0I4BZv2wlF82yp7ElYccP7iamh9bXGV/PY7vIV9wzyyIZzSzVrZkvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRWAk0QxkUXTE3eobDlITpCFOji/i6RV7da19AVAkQkWp6dUmU
	wdB8Ev9xshRjpRgRejKE73tDm+pEf1hVQIgzPAZBQ9G5h5qQ9z21RAsGXmgST6rsQIkWCTydfQ4
	SgRPIW/O7n/A+nE9MvtxesMaBPR7FhWg=
X-Google-Smtp-Source: AGHT+IEtm3jr7IIZEeexP+eQ8VNddB7s2khVWpB3Kl1wLasQQ7s6l+I0zvECeUKVsyCTd6ylyTKQVcyQPOiUF08PVU0=
X-Received: by 2002:a17:907:3f8a:b0:b7f:f812:d8dc with SMTP id
 a640c23a62f3a-b7ff812e591mr349300866b.1.1765946944939; Tue, 16 Dec 2025
 20:49:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1765778124.git.zhoubinbin@loongson.cn> <a8dd24fe5e2a28c5b5f121be5cc48f6289b0d603.1765778124.git.zhoubinbin@loongson.cn>
In-Reply-To: <a8dd24fe5e2a28c5b5f121be5cc48f6289b0d603.1765778124.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Dec 2025 12:49:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7XH-F8u1VFYtnULvT7AjL5u7XOB4dpbTxm-J9hvMZbJQ@mail.gmail.com>
X-Gm-Features: AQt7F2ruO1Ahpt-ei-Zlj8hxWuAjibVPLuN56pHvIWc6Yb9TPu7mTk9jaIOAxFs
Message-ID: <CAAhV-H7XH-F8u1VFYtnULvT7AjL5u7XOB4dpbTxm-J9hvMZbJQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] LoongArch: dts: loongson-2k1000: Add default Local
 I/O Interrupt controller address cells
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yao Zi <me@ziyao.cc>, Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Tue, Dec 16, 2025 at 3:56=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Add missing address-cells 0 to the local I/O interrupt controller node
> to silence W=3D1 warning:
>
>   loongson-2k1000.dtsi:498.5-55: Warning (interrupt_map): /bus@10000000/p=
cie@1a000000/pcie@9,0:interrupt-map:
>     Missing property '#address-cells' in node /bus@10000000/interrupt-con=
troller@1fe01440, using 0 as fallback
>
> Value '0' is correct because:
> 1. The local I/O interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=3D0)
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarc=
h/boot/dts/loongson-2k1000.dtsi
> index eee06b84951c..fa1c000fd3e0 100644
> --- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> +++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
> @@ -131,6 +131,7 @@ liointc1: interrupt-controller@1fe01440 {
>                               <0x0 0x1fe01148 0x0 0x8>;
>                         reg-names =3D "main", "isr0", "isr1";
>                         interrupt-controller;
> +                       #address-cells =3D <0>;
I think liointc0 also need address-cells, no?

Huacai

>                         #interrupt-cells =3D <2>;
>                         interrupt-parent =3D <&cpuintc>;
>                         interrupts =3D <3>;
> --
> 2.47.3
>
