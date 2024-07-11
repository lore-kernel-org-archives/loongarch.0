Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4716C856
	for <loongarch@lists.linux.dev>; Thu, 11 Jul 2024 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720712951; cv=none; b=sfULSmiNoSoXdVjzCBoJYnQfXWQKCVoCPzvuvy1/yUEqL5oqPirVhnMcWDPfpzYqQefOjoi80zl5faFyIwmM74GCQ2cnUldTJZo83S/I40FxBhCrYVU2798dhhsWv2KigBpKg6NyfFLtIbAOaYtvISJuUfC7BiJIQ6Cgxif5tZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720712951; c=relaxed/simple;
	bh=ZuSNhp04Wh6EW5lLCQ+g2TTMsPvkJdMs1uzOY5TVPg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+1cLEArUFXEGLth+CrFfvn9acA9r2kkBTvDdiICj3d8+viNAg2/9biFiMvttWFYeV3nVpRxwhWEcw0ge9Odk3CmXHUJe0VXJXNGmQGTXr0x5TL9ktl7+yka+tapt71KQitXTYSYCTjZSIzmMd/4QVJY7V6O9HzTGh6tNXyOSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEfV6QDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEfV6QDW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707E2C4AF52
	for <loongarch@lists.linux.dev>; Thu, 11 Jul 2024 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720712949;
	bh=ZuSNhp04Wh6EW5lLCQ+g2TTMsPvkJdMs1uzOY5TVPg0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iEfV6QDWwbMnp9Ta0Jer7ufy7zKuRm0UWvkJW72QY10t6ps7bgp01pqrrI/nPJYK4
	 aMRh9ZF/IE1zLE2CWaaFQqoH87euXHgcVDUCI8FRHQLRzl0Hn5cM5pGTcdcuB1ubWY
	 7C0umyGH23O1dml7/cbWgv+m1S0Z5bC39W80eVrXz6QNggeVgiL7GVN5GGQXoSyNXO
	 x9/a5jfhts/AMfl6Y1Ah/Pvl+GppiyWxzLsd7vdSq8U1uD/hk7ObzadMOrVkHQ6wWX
	 mp+jdOGkXJyV7+IWDlVnAzxY48Ah5kvgicHHgUyI46+s+fRE2+Q7aNoVeQ82HxcNNS
	 L2NSAQhoN06lw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so18789501fa.1
        for <loongarch@lists.linux.dev>; Thu, 11 Jul 2024 08:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAyAtuZhxTmDisfUWaJFIsFyHifNbGEiEk5Ugp7qnEkb/qRy2Lipr/4XGbQmAHga230N8SL30mT9YhjX/uJD72veEybfupNvU9
X-Gm-Message-State: AOJu0YxYqI2BoSIGYqyxVQ0ZzcIcVpAuzQEOwUAOHlO6ABbs5v05DbHU
	Ri4n0CWS0WSl3DOpNHNiRo262xo8Y9ZWftp2iGMktSDR/US9Nd/4fhqBXcFefvQY7xupcYmRYyA
	g3mBtiNX/18qM5itS56RgJj8smlU=
X-Google-Smtp-Source: AGHT+IF7NQdXn1ehcZ9BG8DZDkjb0sOdI+MsrOYGuBrT+fO/aduK2xqVz6OBibzkuFUSmSL45H3g6KQ3ZY2sharGRnY=
X-Received: by 2002:a2e:8ed3:0:b0:2ee:4d37:91df with SMTP id
 38308e7fff4ca-2eeb30fef50mr68275581fa.27.1720712947779; Thu, 11 Jul 2024
 08:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-3-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-3-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 12 Jul 2024 00:48:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
Message-ID: <CAK7LNATLVY1xtSMVMro-KMQVPgVHoiRKGX33ajCg8ZU0-EZS2w@mail.gmail.com>
Subject: Re: [PATCH 02/17] csky: drop asm/gpio.h wrapper
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 11:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The asm/gpio.h header is gone now that all architectures just use
> gpiolib, and so the redirect is no longer valid.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


>  arch/csky/include/asm/Kbuild | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
> index 1117c28cb7e8..13ebc5e34360 100644
> --- a/arch/csky/include/asm/Kbuild
> +++ b/arch/csky/include/asm/Kbuild
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generic-y +=3D asm-offsets.h
>  generic-y +=3D extable.h
> -generic-y +=3D gpio.h
>  generic-y +=3D kvm_para.h
>  generic-y +=3D mcs_spinlock.h
>  generic-y +=3D qrwlock.h
> --
> 2.39.2
>


--=20
Best Regards
Masahiro Yamada
