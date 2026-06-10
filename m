Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2811CBA
	for <loongarch@lists.linux.dev>; Wed, 10 Jun 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781064931; cv=none; b=Bhdagbl9zv+6bkRJlgrM6R8Q8mIsabXPa/PvejR4mOvwqsd6G4ChxQY2jx2DKJaxiH964qzfSD9i2ZgMuc8jHpktPeCshcVyrE5YipdyMJmwXwEbWvWOwPl4FOJQ3/5wDTZYDSlTRuFqMtHwGpYj8vsIVN9Pbofj158A18iPsB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781064931; c=relaxed/simple;
	bh=eUPE8jGfX6oj2FLEcxkOZeoAc9Fk+di5f1uC42SHEEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRPBKL4vCUB1mcExp6+Sf0v4G0Oxb4tZVOaMtCTPtC/EJQqH0blGvRfcO81l8bKrxhbxU1AuhjAiScRnTKDj78GWFXuQAQ/f8+DCXlkAUCCM+4zcz/qlLV8HFFm3KdN5YDnJ99oWsR776HDmbiv2sKadCxkkb46J2U5GwcyrVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVAv/P1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVAv/P1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D341F00899
	for <loongarch@lists.linux.dev>; Wed, 10 Jun 2026 04:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781064930;
	bh=FOb09lhVyzCo5zVnmWS90KSnu3Di5QWTaMjXUNZXMAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bVAv/P1vWSpoX8qLcxvbxuWuwCP3U5CdRvnwQzW0yM9ucD1S43C1RZL0sPiznJL0X
	 aBlgx2YXHjVLhoFoEawfRcpoFB4o2QsvvrCEHbJIGAPlJamN0IVLf446NJivRg2nZS
	 LQiHXh/N8/61C5OKIIe3NkOTAEs/hrSq7VYsH4EDa5uwaSpOGiVJwhcFkW/6/ixF9f
	 JXjIa/VznJOlc/Sbxf5dPpNfVlFzBO+PMxQhBGszgCdh/TutBhOMSYxeRHEZSr2Z0i
	 eqzE9HKzTHeKoiNHjKeUux9pMKkhCtXDojpcf77NjeSOEHLRRAJRMuP0qUJb5pqf8B
	 E7N/r58CYJ4lg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso8802201a12.0
        for <loongarch@lists.linux.dev>; Tue, 09 Jun 2026 21:15:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qDwv7Y1hQZsffCOVUTwgU+TtT13UViKhlBGifyRtAh+x/y22oDhmbpI8cwcecCtQNard6MvILwyg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxegUs/Tnn4DHHiXHCeJyy7osP/2wGGDJj2FmWvRc1APzuQFZIa
	6BcWHJzDRrZQTP7yYEI0xEgwqErQEo8hHxB2WryL0HZ4PKCHUZlXbDOM6TB8yHxsyaGvT/TlMyE
	h7XbVxo88rXOiSWleqDms7PKmRjpIOlY=
X-Received: by 2002:a50:eb47:0:b0:68f:cc95:ba5c with SMTP id
 4fb4d7f45d1cf-68fcc95bb2bmr6751799a12.28.1781064928879; Tue, 09 Jun 2026
 21:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609090543.1462-1-wanghongliang@loongson.cn>
In-Reply-To: <20260609090543.1462-1-wanghongliang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 10 Jun 2026 12:15:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5UHa+AZG_NQ_Y6Q69TNRYnM8dYKfnz8m7VPEOB_1mSKw@mail.gmail.com>
X-Gm-Features: AVVi8Cc1jdTH3h7ZNmpNTCXkEU-TRVFKam_RyKaNX1XQp4hhaEffQ7iNGthpn6s
Message-ID: <CAAhV-H5UHa+AZG_NQ_Y6Q69TNRYnM8dYKfnz8m7VPEOB_1mSKw@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] LoongArch: dts: i2c: Add clocks and
 clock-frequency properties
To: Hongliang Wang <wanghongliang@loongson.cn>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Jun 9, 2026 at 5:06=E2=80=AFPM Hongliang Wang <wanghongliang@loongs=
on.cn> wrote:
>
> Hi all:
>
> This patch set adds clocks and clock-frequency properties to i2c nodes of
> LS2K0500/2K1000/2K2000 dts.
>
> Hongliang Wang (3):
>   LoongArch: dts: i2c: Add clocks and clock-frequency properties to
>     2K0500
>   LoongArch: dts: i2c: Add clocks and clock-frequency properties to
>     2K1000
>   LoongArch: dts: i2c: Add clocks and clock-frequency properties to
>     2K2000
>
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi | 12 ++++++++++++
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi |  4 ++++
>  arch/loongarch/boot/dts/loongson-2k2000.dtsi |  4 ++++
>  3 files changed, 20 insertions(+)
>
> --
> 2.47.2
>
>
