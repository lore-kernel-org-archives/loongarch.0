Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F4184
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745203932; cv=none; b=MlmjTSctyefQ71fYsvrJ7/UUWh6VJurKfyMm/9kB5aMYQ2fr1BMQgbIc1wV2qjjteyCYQUnEfixokYnFZJ/zxvISGlN2JMWwvuBPPdelRY4Unz6Cws8h3itT4Qw7T2Shf7QhPCpAYuixDG8A6tXZ7F98OOFYzjUd46aEAfrY7SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745203932; c=relaxed/simple;
	bh=1tyuxvA5KZwNFB8vjMt8RKpVSmp5XWdH0wpl8cNCdBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5NpZXqkOHb8Nkz/S5ZUtqjezqgFoXpr3aLVcw6udgAZ4sicXWBuvoVXxzwRTm8U6a4hZiTg+Tx1xrEuQtP1XwqhX/MFmbHOzYnBdDYheAaWpOcIaWg0wDLTkTqXJwgAWj/0eyOUSdxmjHPhY7p54xrAhyr3WIXLW0vs1+ialxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4NWyam+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4NWyam+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C7BC4CEE2
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745203931;
	bh=1tyuxvA5KZwNFB8vjMt8RKpVSmp5XWdH0wpl8cNCdBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n4NWyam+7PYAeoQyCccGfYkBUtcQ9S/trpmI8Jo2Stt4l/0nmiTkOTXjwS1TMuWrx
	 qV22waVX9P1nuzv1LRPTtIhCG/npwJ6jL+U3FHBgEZGc54NH5XF5/EEtrFmffF04pB
	 i7VC5HXRO2wQy+s+HkYYEjK+l2bujltHf03jlY1loZizSke4+WSll48MhcVCrZxmst
	 YBP6gHoYOj7tTHWHYC2lA6kjZSk3YzwMwOAjrj874pB4U6wnl5QiyFZmwn+dg3etBK
	 QcHwdcfX9XRR7nGVNEjM0QsGnhUHkDFKeP/v+I1sg9aU/hIU9xJ7cnwkkEcJ4zREvV
	 Os3zfnqTOkwdw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac73723b2d5so675597466b.3
        for <loongarch@lists.linux.dev>; Sun, 20 Apr 2025 19:52:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJWWnIZaLTfx9RJNh0mq3lG7pQQc7aEpr3KR3UpoU8PCvGnwm8
	e46btmqbXhtjxX/kflj0yqRKsG3L25O2ixSkjJKvDR3GItPr0GHbJ1S0tj4KpdTrT/gadffSaRI
	RWykqU2eaT20G3f2M9AQdoBaQFeI=
X-Google-Smtp-Source: AGHT+IG6uFQScoDoyyMiRQrXZjxtO/plgmjJQBfCoYWeYOqgNCsXp9ts8wng47jizvhYQMoDcm+3hItSLHU1ovhkPmY=
X-Received: by 2002:a17:907:7b9e:b0:aca:c532:cf07 with SMTP id
 a640c23a62f3a-acb74ba563bmr956878366b.35.1745203929596; Sun, 20 Apr 2025
 19:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421020301.34185-1-youling.tang@linux.dev>
In-Reply-To: <20250421020301.34185-1-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Apr 2025 10:51:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H70t3mCE6ejZYpXwwDnn+TxubXzRuZ6_AKaGHW6M3eNng@mail.gmail.com>
X-Gm-Features: ATxdqUFq6x2q-x02QIn_riXrurmgYOh6okJPeHPLw9hLqBcNAvtKmfpgGdkE_nU
Message-ID: <CAAhV-H70t3mCE6ejZYpXwwDnn+TxubXzRuZ6_AKaGHW6M3eNng@mail.gmail.com>
Subject: Re: [PATCH 1/3] LoongArch/build: Using a generic scripts/install.sh
 in `make install`
To: Youling Tang <youling.tang@linux.dev>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

I think the 2nd patch really should be the 1st one, in case there is
no "installkernel" in the system.
And you can remove "build" in the title.

Huacai

On Mon, Apr 21, 2025 at 10:03=E2=80=AFAM Youling Tang <youling.tang@linux.d=
ev> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> Use the generic script/install.sh to perform the make install operation.
> This will automatically generate the initrd file and modify grub.cfg
> without manual intervention (The previous image and System.map will also
> be generated), similar to other architectures.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/Makefile | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 0304eabbe606..64bdb52ddf7c 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -181,9 +181,7 @@ vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
>         $(Q)$(MAKE) $(build)=3D$(boot) $(bootvars-y) $(boot)/$@
>
>  install:
> -       $(Q)install -D -m 755 $(KBUILD_IMAGE) $(INSTALL_PATH)/$(image-nam=
e-y)-$(KERNELRELEASE)
> -       $(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELE=
ASE)
> -       $(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KER=
NELRELEASE)
> +       $(call cmd,install)
>
>  define archhelp
>         echo '  install              - install kernel into $(INSTALL_PATH=
)'
> --
> 2.38.1
>
