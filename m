Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C381E1C22
	for <loongarch@lists.linux.dev>; Wed, 28 May 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416646; cv=none; b=cW7Yp087+YU9ZIpc2PiH3FqvSygDh/tyn+Zjii6A/V9nlGSkyLqiJ6T/ZKqQbXGPvvVo/o/MPaQsSXYajo7hTqxeAHG6UAI9RTOq94gErRrNlbt5He7BJQHFxpZynR4j0VOom2+ZEUG0gX9iBrTnhOAxaqjg7RsWLSUoN8YUYJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416646; c=relaxed/simple;
	bh=R+f29xiLd8IReSQyDpamYthFgoEuOJOqeanA6Eoi8Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igLpMyKxTNdMCyYHfw8sIis9MER5HgNWwn00gZj7tP62TFIN6dMNhPjcZKwDRKjiF/IReSLuBLkxTIRotQcSzDIMaj66C3+TJhh1LOGRbPZDsguGDwAtmK/pGG2pPngMXU0YqS4RXlVZA+SZaeiyylTCBN/LvIrb7aArQtsWMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ced6P5O/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ced6P5O/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41D7C4CEEB
	for <loongarch@lists.linux.dev>; Wed, 28 May 2025 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748416645;
	bh=R+f29xiLd8IReSQyDpamYthFgoEuOJOqeanA6Eoi8Qk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ced6P5O/gL4/4hT7d4beZXNWruI6RNKDrJFw1HI2NaKeauOVVC0GSx3hOvXrzzHSm
	 y6EtHewr5HuyC8pRYGAYZ8xevfi4d0QhAHcpXl3WGO0/1oTC+PY9Cb0Ojx4gSFOnWm
	 M4cAeVDBqpfxXxXkJLrjv26i6FRzfYw7gvFEzE7GZ/2s+SP0n6RoLrtQiT4AB8/FXC
	 lVdDgO79mj5V0aMYNm5iokted9AQzDR4r76Ssw5j6BImRLqk4NSDIFanAyKnoUIIbg
	 om1fD21cq/eY0Kbre2i8gGGtqjyIA/mSF18LOcm39fOyHB7zHQbQ5RYot349fJQx+C
	 U8frzT9dX5Atw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so6197085a12.0
        for <loongarch@lists.linux.dev>; Wed, 28 May 2025 00:17:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVzAsujYT6dC1npw/L99CzKi4yrEu9Hl5bzlwU0qj5decgfmMq0St9Cf4CMASFWYYzq48IFgC1JiI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp99tuqZjzbNufNXEUKa8Q0fV9oum1kkIy2kBdsLR8LrZpdc57
	cvEKdDvWLvRS91a5qGfia13sJkqMggO9oyzkyr77Ke0MB1FWbaeHGIJzzUz5jviVSpwhiqwDbEK
	5Ee0WQ0aO4Z/1c3RBp2PIFSfrki/rKLA=
X-Google-Smtp-Source: AGHT+IHCLtdmroV2Jn717BjtWj2/PFsHPpgneov+NHQPQi7ryO9RQG3YNYf02S1+/qgP7fr2xVHK2n+PMl/EbxAxjb0=
X-Received: by 2002:a05:6402:27d2:b0:5fb:c4be:b1e with SMTP id
 4fb4d7f45d1cf-6051c377803mr795235a12.11.1748416644421; Wed, 28 May 2025
 00:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528065944.4511-1-zhaoqunqin@loongson.cn>
In-Reply-To: <20250528065944.4511-1-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 May 2025 15:17:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7hBksA2P+vfMbpDVnbjW1Mo09Out_wOQLgLRXPLaFCfA@mail.gmail.com>
X-Gm-Features: AX0GCFv1PqBc0S9eTI_-YpcpFrAcsFhiOkHWorIkKM40rfRHllkBaZF6-n5uegw
Message-ID: <CAAhV-H7hBksA2P+vfMbpDVnbjW1Mo09Out_wOQLgLRXPLaFCfA@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] Add Loongson Security Engine chip driver
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, jarkko@kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

As I said before, why the patch "MAINTAINERS: Add entry for Loongson
Security Module driver" is missing?

Huacai

On Wed, May 28, 2025 at 2:59=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn=
> wrote:
>
> The Loongson Security Engine chip supports RNG, SM2, SM3 and SM4
> accelerator engines. Each engine have its own DMA buffer provided
> by the controller. The kernel cannot directly send commands to the
> engine and must first send them to the controller, which will
> forward them to the corresponding engine. Based on these engines,
> TPM2 have been implemented in the chip, then let's treat TPM2 itself
> as an engine.
>
> v10: mfd: Cleanned up coding style.
>      crypto: Unlimited tfm
>      tpm: Added error check
>
> v9: Moved the base driver back to drivers/mfd. Cleanned up coding style.
>
> v8: Like Lee said, the base driver goes beyond MFD scope. Since these
>     are all encryption related drivers and SM2, SM3, and SM4 drivers
>     will be added to the crypto subsystem in the future, the base driver
>     need to be changed when adding these drivers. Therefore, it may be
>     more appropriate to place the base driver within the crypto
>     subsystem.
>
>     Removed complete callback in all driver. Removed the concepts of
>     "channel", "msg" and "request" as they may be confusing. Used
>
> v7: Addressed Huacai's comments.
>
> v6: mfd :MFD_LS6000SE -> MFD_LOONGSON_SE,  ls6000se.c -> loongson-se.c
>
>     crypto :CRYPTO_DEV_LS6000SE_RNG -> CRYPTO_DEV_LOONGSON_RNG,
>     ls6000se-rng.c ->loongson-rng.c
>
>     tpm: TCG_LSSE -> TCG_LOONGSON, tpm_lsse.c ->tpm_loongson.c
>
> v5: Registered "ls6000se-rng" device in mfd driver
>
>
> Qunqin Zhao (5):
>   mfd: Add support for Loongson Security Engine chip controller
>   crypto: loongson - add Loongson RNG driver support
>   MAINTAINERS: Add entry for Loongson crypto driver
>   tpm: Add a driver for Loongson TPM device
>   MAINTAINERS: Add tpm_loongson.c to LOONGSON CRYPTO DRIVER entry
>
>  MAINTAINERS                            |   9 +
>  drivers/char/tpm/Kconfig               |   9 +
>  drivers/char/tpm/Makefile              |   1 +
>  drivers/char/tpm/tpm_loongson.c        |  84 ++++++++
>  drivers/crypto/Kconfig                 |   1 +
>  drivers/crypto/Makefile                |   1 +
>  drivers/crypto/loongson/Kconfig        |   5 +
>  drivers/crypto/loongson/Makefile       |   1 +
>  drivers/crypto/loongson/loongson-rng.c | 211 +++++++++++++++++++++
>  drivers/mfd/Kconfig                    |  11 ++
>  drivers/mfd/Makefile                   |   2 +
>  drivers/mfd/loongson-se.c              | 253 +++++++++++++++++++++++++
>  include/linux/mfd/loongson-se.h        |  53 ++++++
>  13 files changed, 641 insertions(+)
>  create mode 100644 drivers/char/tpm/tpm_loongson.c
>  create mode 100644 drivers/crypto/loongson/Kconfig
>  create mode 100644 drivers/crypto/loongson/Makefile
>  create mode 100644 drivers/crypto/loongson/loongson-rng.c
>  create mode 100644 drivers/mfd/loongson-se.c
>  create mode 100644 include/linux/mfd/loongson-se.h
>
>
> base-commit: c89756bcf406af313d191cfe3709e7c175c5b0cd
> --
> 2.45.2
>
>
