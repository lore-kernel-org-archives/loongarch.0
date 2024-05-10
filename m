Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028416191A
	for <loongarch@lists.linux.dev>; Fri, 10 May 2024 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336130; cv=none; b=fsfRvwCA3etsPo02ZjCDZtOB4sPPEXYzuey7bzpmUlfm8f86RHmkzv2htczHojX7joTZNuFDgCHPacwSsS3C6NJYHr4P9fz2aMLBP6OfT0Ydh0VGtwgKOhmk9B839YVKgDX9Ykvmg09SnOBOd+FZR1lzkA4NAN+/6qSf7fmGs5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336130; c=relaxed/simple;
	bh=fuG/C5uoVJeB5he1R13vlv6JaFjBkCsdLihkGnNnFR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRbOUesdYDd9VjJX7808mS7aJiYZqiRhQy2DA3yKKqocK/2FGrv8wvqjuMLDJIfa0mZ8mujIexsL/ZxhTuU4hfdhylomWoyVgSnnjDm71m2VchbAsa4vQXubDixqWi6D+8HufglJmALP6CTZM5tNHatNaFlF9k0+wAOClX9z6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb5PoYI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb5PoYI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EC3C4AF08
	for <loongarch@lists.linux.dev>; Fri, 10 May 2024 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336130;
	bh=fuG/C5uoVJeB5he1R13vlv6JaFjBkCsdLihkGnNnFR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yb5PoYI2f7kUeYKqTZbff2GCwQp1ZjLw9Xt2sP75SjPUcGOKJKOQ7nMCWK9RWGzvr
	 f8qNfy+akA6GeuOf8WqHbEU6rArH8P1sqMttbrizRlKyiw5DJZtglpRf/wx2e5Figq
	 FXmMn1o6CzTHTxEzZIOiq1xarbgk1yS3f4xi3SoaPlRH8wiuJj3vLrbVO5mzAiCbD1
	 ByKXixmGvFP/e1TZNyMMuAL5aGcQGNb7zu3qom/eoFF45o1yqW3ezoP312fi4pZFkT
	 GppWP1aWQc0/5AGHYXSriklh48pIdt8nQ9pnUrxHyyhYXj6v2cSdtcEjLtOFoyaFR7
	 8uvZV9+09Oorw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51fdc9af005so2945842e87.3
        for <loongarch@lists.linux.dev>; Fri, 10 May 2024 03:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvmM9NHwL7+QQMYbJCphNe2O9007lZ/0I34o6qfrGtNt2z+F5PjWLkrCHEnfCje/36bQZGB1+k9tkZRYTPAr24/I9zOephKfJa
X-Gm-Message-State: AOJu0YzXCttk100t0l6ySwqDa3A273+WEblrSlDiO+Jv5nCe56bsUool
	x2ub44yarqfaxHCMqmTQIl42dEeVNVxk/U4RZxXYiwfnXOEHBZLadfDZkLsxzvfjJEElny+2FAo
	ZauPVg6uu/ZJW6II6hWtNkL7FxrQ=
X-Google-Smtp-Source: AGHT+IHpA2hPeDINGwm2WivqVOTAivdj4Jj7oKDeK5FXs6PTXHahRnc0Iu44THVQzOHir8WHa1oL8OV0PP9125lWzzU=
X-Received: by 2002:a05:6512:3e17:b0:51d:605e:f0ce with SMTP id
 2adb3069b0e04-52210278698mr2442032e87.50.1715336128324; Fri, 10 May 2024
 03:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1715222938.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1715222938.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 10 May 2024 18:15:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7+htp6nX6gTtdPSjN1H7UNgOv7M7=Jn5eJuqWfm0=OwQ@mail.gmail.com>
Message-ID: <CAAhV-H7+htp6nX6gTtdPSjN1H7UNgOv7M7=Jn5eJuqWfm0=OwQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: dts: Add more support device ndoes to Loongson-2K
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Thu, May 9, 2024 at 2:18=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> Now, more Loongson-2K related deviers are supported, this patchset add
> these device nodes to dts files.
>
> Additionally, we remove the "disable" state of the ls2k1000 clk node as
> it was unnecessary.
>
> Thanks.
>
> -------
> V2:
> patch(1/3):
>  - New patch. Follow Conor's comment, remove the "disable" state of the
>    ls2k1000 clk node as it was unnecessary.
> patch(2/3)(3/3):
>  - Remove the "disable" state of the clk node as it was unnecessary;
>  - Add cpu-alert trips.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1715156107.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (3):
>   LoongArch: dts: Remove "disabled" state of clock controller node
>   LoongArch: dts: Add new supported device nodes to Loongson-2K0500
>   LoongArch: dts: Add new supported device nodes to Loongson-2K2000
>
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  | 85 ++++++++++++++++++-
>  .../boot/dts/loongson-2k1000-ref.dts          |  4 -
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi  |  1 -
>  arch/loongarch/boot/dts/loongson-2k2000.dtsi  | 48 ++++++++++-
>  4 files changed, 126 insertions(+), 12 deletions(-)
>
> --
> 2.43.0
>
