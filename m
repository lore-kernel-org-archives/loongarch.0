Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA9489FD8
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999439; cv=none; b=Y8Bl5D16EEZbxyCO5QsxbdjZAE3zkhrP/mYJafWuGCnsLrM7KqbfSFj0XlRIauXjXTu7yTueZfYi0U4NeKP5ZE3XMNcbu1z3EC4Cp83+ooPcEdmHIqS5otNt8sCpqKQv9c22fhGKAcRTKTRKFNd0zeWDQCOSn6in7wb1l3OUFDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999439; c=relaxed/simple;
	bh=9yxDWeoXyET7im0vPGRIQQJr112zR1B+CrfA3+RIFIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdZYIjMnejXp0sK6YggU3/k097R6l/PtIV8KNhKN/qWe0oBPMeo4qGABS92SU3AXbWFYDrgrpxj61JRHCwiW+iwkXuDj5DpAEkjzXn/KMwLkrYllqkoeJrlkTIJrGrRKX1S4dgWDm4mfOTzVJnimy4lpyPSVeBvHx7Y2BBUTQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAMZDbGf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAMZDbGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35C11F0089C
	for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999437;
	bh=Ds/j0lOmNgNcO3qKBdWYsVX1mHXVi4h0Q6BrQfEfK1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QAMZDbGfazVrrAbAqk2H2IDn8bX6MqsogvVz7NjCI3aA7PjmwbakDHVrUSW7YL/xE
	 IfELlwqp9rElU7H3VMOxoVKRLtWbfgrucLfxiCikFjrqTI0uZoouS/3OAyrNB04/A5
	 J2oBZp/eVZuNPGDUIZNsPAVM5wbfx3WclsCnchndo6LGcQwUzXHf0HFTozpuxLpVyF
	 RpK2iNsyA99qPqWJtGHvOyvBGqTVqQUcQf6GcHTVbA0aGjXBJN1mv0NCIpX2RnKSRo
	 5OWinWrrbhwFs/088JNoQ+RWKtN9ibfusfjr6bHUWy3UUWvrtCZjHyZQD0QeeIJofR
	 qrL9YlFUmMn1Q==
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a4fb331cc0so987678137.3
        for <loongarch@lists.linux.dev>; Mon, 21 Sep 2026 07:03:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzktqbD+MduObj3G4QJad2PAysxi3/jAGXks/W/+inPn7HnJTz1H3zzegAfsfCwxNenyN9lNs3j+aE=@lists.linux.dev
X-Gm-Message-State: AFuF++nQlT92L0Mu5YrrC8CZgQRhE8OQtR+uOCr4o1+EulJs4fdWWrvZ
	V7YrCoEUbX+Vxv4xCxmT9193aFtx5jafe8LxCOBEqbknA/zyasQ38ZKcPPD3lgpsdY0CjeYk49E
	9lEkBDTMw3bhC9oDN9fpVN1LVQh57ufw=
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e849 with SMTP id
 ada2fe7eead31-7a55e1a6309mr4024862137.25.1789999436903; Mon, 21 Sep 2026
 07:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:03:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q30Go9bTqxC6kZdCmRZbiC+4RjEdmvKd7FJe9brU0mw@mail.gmail.com>
X-Gm-Features: AcwNN1XoVcahAhjvpratz48o_Y5tLuUmFVbC1pwuKID2bA2ggRg42Clk-YHmhT4
Message-ID: <CAAhV-H6Q30Go9bTqxC6kZdCmRZbiC+4RjEdmvKd7FJe9brU0mw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: dts: loongson-2k0500: Drop unsupported bus_id
 in DWMAC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Sep 15, 2026 at 3:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> There is no "bus_id" property at all defined in the bindings and new DTS
> is not allowed to bring undocumented properties.  Fix dtbs_check
> warning:
>
>   loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): bus_id: =
b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loong=
arch/boot/dts/loongson-2k0500-ref.dts
> index 7ace54c84244..d2a3ed9fa578 100644
> --- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> @@ -73,14 +73,12 @@ &gmac0 {
>         status =3D "okay";
>
>         phy-mode =3D "rgmii-id";
> -       bus_id =3D <0x0>;
>  };
>
>  &gmac1 {
>         status =3D "okay";
>
>         phy-mode =3D "rgmii-id";
> -       bus_id =3D <0x1>;
>  };
>
>  &i2c0 {
> --
> 2.53.0
>
