Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38A224CC
	for <loongarch@lists.linux.dev>; Fri, 28 Feb 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752005; cv=none; b=rO+2XwcXjm/ywlcTTOe9kPkPileoFxTf2b2Z33HG5c8q1tPgB72HfjBGnhHvbvJMlcBA4IXl66cXNZJHV3yhBQ4Z4xMOHnZDuZjcmUTKciOIBzJS00dRN1Qtgts8kShznzw8KQ8ZaVmXiLRZKOM0aSPGjDQHjXnMIE8a9uu4ls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752005; c=relaxed/simple;
	bh=VVIDcMnoH7hPbhberNOLlP1qoZPeOV5SLRdCSsFHrj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TibHz3HpcIS/RDWPSV1ctBggf8Mw4W3mjMUhygmgcprrPiot5d6E0sTNGuT3WefqjI9nAdlhWpiht3EqhVMqrxqK7ekvcfGDbM8oLxB9LkWidfhg3gtT3KjwzxgHm5nPKLvCOxHJfy+YfLyDwhHlEaa0KkSp9VzCNjx/HpAvTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPGtgMHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPGtgMHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D32AC4CEE8
	for <loongarch@lists.linux.dev>; Fri, 28 Feb 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752005;
	bh=VVIDcMnoH7hPbhberNOLlP1qoZPeOV5SLRdCSsFHrj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YPGtgMHVnFo6x/h0FPQLBRnMNZB6FnypZxZR3uZI1gWQ6UNlGANox19PF8DYna/O0
	 qobyT3f4YyyjwvTdh72X+kWeXt1sNVR7WVo6qakTEuRHLI1LGURjtO+plFbW5sZspv
	 9MvVh7j9WxEjv9uHwN9HC0SCokPuu+m9KXhEecjsubF2d60EO28GzJKjWJjjlRc6Ps
	 6/INyLqxvwpOjwY4YSWqd83+3m+JcJX5Bl5jDxC11DEpUeEfN30BqrpSIkRNf9cnLS
	 uIvEUfzNSFwmrrq15l1TMcPZW6oCfUv7cITz01NGRBEQ+f173t+DRILYGiD+vEdx35
	 bwJS3EPjuo33Q==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso413522166b.2
        for <loongarch@lists.linux.dev>; Fri, 28 Feb 2025 06:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuZIwK7AFsz2I3cn09jIWKBFHgWy9ENmY9mUYL7IF3uBGZlH1O8eSDV0cRH+XCOGzbwjxJ1AEnuMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNBT27JQcfcE8XUH4dMwSLbk3PUabDcuIlarysjbpvk8PRx72x
	VLwTN+SdipKOWhdJOGczNTGKTWku1qM89tDJ/Zd8uCqaqvxYJ32iRbOKOOWVgF3XJA9nJWjO0RT
	byvRngsPnL/K0K4nAy3UOw4kUo+s=
X-Google-Smtp-Source: AGHT+IHQV0/AoJbVv8/kktbul8lIZMTIcX8dgu+kgyS+lgEw8A+QnIjYp0ZnMf504B6etDxi6Jc/pi7Nqua0hYQXf8c=
X-Received: by 2002:a17:907:7f91:b0:abf:24c7:f81b with SMTP id
 a640c23a62f3a-abf25f8db0amr324317566b.6.1740752003900; Fri, 28 Feb 2025
 06:13:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250226030358.15924-1-zhaoqunqin@loongson.cn>
In-Reply-To: <20250226030358.15924-1-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 28 Feb 2025 22:13:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5xyRrF1_=E7rLM3dHeYAEBdMufYQvgoxAq6+d6s5U4Eg@mail.gmail.com>
X-Gm-Features: AQ5f1JrCZ9bfAhFSbtUzVcSFF_xizdCX_Qw-twqvCYIPSVnkRJ_jehWs1iBzR1U
Message-ID: <CAAhV-H5xyRrF1_=E7rLM3dHeYAEBdMufYQvgoxAq6+d6s5U4Eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Drivers for Loongson security engine
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, 
	peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

On Wed, Feb 26, 2025 at 11:04=E2=80=AFAM Qunqin Zhao <zhaoqunqin@loongson.c=
n> wrote:
>
> Loongson security engine supports random number generation, hash,
> symmetric encryption and asymmetric encryption. Based on these
> encryption functions, TPM2 have been implemented in it.
>
> mfd is the baser driver, crypto and tpm are users.
Loongson SE should not strongly bound to LS6000, so the naming can be impro=
ved:

MFD_LS6000SE -> MFD_LOONGSON_SE,  ls6000se.c -> loongson-se.c
CRYPTO_DEV_LS6000SE_RNG -> CRYPTO_DEV_LOONGSON_RNG,  ls6000se-rng.c ->
loongson-rng.c
TCG_LSSE -> TCG_LOONGSON, tpm_lsse.c ->tpm_loongson.c


Huacai

>
> v4: Please look at changelog in tpm and MAINTAINERS. No changes to tpm
>     and crypto.
> v3: Put the updates to the MAINTAINERS in a separate patch.
> v2: Removed misc driver. Added tpm driver.
>
> Qunqin Zhao (6):
>   mfd: Add support for Loongson Security Module
>   MAINTAINERS: Add entry for Loongson Security Module driver
>   crypto: loongson - add Loongson RNG driver support
>   MAINTAINERS: Add entry for Loongson RNG driver
>   tpm: Add a driver for Loongson TPM device
>   MAINTAINERS: Add tpm_lsse.c to LOONGSON CRYPTO DRIVER entry
>
>  MAINTAINERS                            |  14 +
>  drivers/char/tpm/Kconfig               |   9 +
>  drivers/char/tpm/Makefile              |   1 +
>  drivers/char/tpm/tpm_lsse.c            | 103 +++++++
>  drivers/crypto/Kconfig                 |   1 +
>  drivers/crypto/Makefile                |   1 +
>  drivers/crypto/loongson/Kconfig        |   6 +
>  drivers/crypto/loongson/Makefile       |   2 +
>  drivers/crypto/loongson/ls6000se-rng.c | 190 +++++++++++++
>  drivers/mfd/Kconfig                    |  10 +
>  drivers/mfd/Makefile                   |   2 +
>  drivers/mfd/ls6000se.c                 | 374 +++++++++++++++++++++++++
>  include/linux/mfd/ls6000se.h           |  75 +++++
>  13 files changed, 788 insertions(+)
>  create mode 100644 drivers/char/tpm/tpm_lsse.c
>  create mode 100644 drivers/crypto/loongson/Kconfig
>  create mode 100644 drivers/crypto/loongson/Makefile
>  create mode 100644 drivers/crypto/loongson/ls6000se-rng.c
>  create mode 100644 drivers/mfd/ls6000se.c
>  create mode 100644 include/linux/mfd/ls6000se.h
>
>
> base-commit: bd315242821784e9384abae911a70d5fda9a3298
> --
> 2.43.0
>
>
