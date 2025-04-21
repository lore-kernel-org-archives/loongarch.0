Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17105D53C
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204318; cv=none; b=MckUA+cQFgJC6HZz6vwQoKH4rt7JpwIpphwqxGotYEADWx/OkO5tArJl8K1iVZxXYcUAElFPqxB8LheS3EkJ7cyJLrJOELqbc9nuMc0GJ/Ri75DEkOMvUBi5UxMiFMvukmppZRPEsYtmdt/DVme8E8AG8sDjc3M5pKTHnyrlXpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204318; c=relaxed/simple;
	bh=hE8w1YzAEtZJZFKTyI0hHFqprYHZcbNNVS6/qJEngQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQzbKu592fWmBiBay0qzKIZclHlGZ8TS1staxIsBPaPykZLhVjkpv2CEhLF2CPy5KnTWh9BG/0nnfDlN/sL3GalQpVdZh3CkzmSmbdWe7rRUW9mlOSOkdafuEGvs8zqPFkdPo2BHf14abMeWP4G5XBhQfmLSTphsKepcSQXPBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttnF4eBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttnF4eBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FD9C4CEEE
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745204317;
	bh=hE8w1YzAEtZJZFKTyI0hHFqprYHZcbNNVS6/qJEngQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ttnF4eBP6AGeMWnc2KnsHLcXkM4B/tv8EKq+1ZKjRFgG413xkEcXVWthXNMoxnPgB
	 Wts30XMWf8W4qbeqll5DkebzAE4ZytJdW4R2xSzsCBKixobNYaJRTKnqjKRINCaC2p
	 DQwJ4QEJY6ZkqUPOnDh5aOlEG5KvN/hs2shHp0684UDIdTaPcWYwbEQpI2EQW1Y88j
	 pvgP8QPnZvO2qXCW/addoqPTp4Fly6RSKEsb2QuSkulD0eVuYNSDzP4EQb0aiYAdEq
	 YifiUZTFxKGFzH0BIBmUS+mfJ3xbtmyC8lV31As4yyUN+NQ6BJsIKn6sHalf/leSUv
	 NJPQsfWE8EhcA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso5421820a12.0
        for <loongarch@lists.linux.dev>; Sun, 20 Apr 2025 19:58:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YytRukqEbg9mi5jdYwv03l+E79+Ieu+FNC7vrnDA189ybVvNmVr
	rujolr4gPDuCay3js35LC1RfzeoWuYNLf0oHsuAOCvWqSkFQQ3rc1uRp7u4tV4uqZnE92ilqduX
	OA8R6BFomDqmopCoj4iDvITblXb0=
X-Google-Smtp-Source: AGHT+IEuF5/Jj2X3EC4jHxfZQRgjX911vrp8aoXESTUHN0yerexn955nXTKv4CllaOCQ6SMbdicWVnvi+bZ9hCCEl4w=
X-Received: by 2002:a17:907:96ac:b0:ac3:8897:eb75 with SMTP id
 a640c23a62f3a-acb74ad94b2mr975637366b.10.1745204316074; Sun, 20 Apr 2025
 19:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421020301.34185-1-youling.tang@linux.dev> <20250421020301.34185-2-youling.tang@linux.dev>
In-Reply-To: <20250421020301.34185-2-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Apr 2025 10:58:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5CefePFu4ORCvO+-MOHj5agttVXXVSf5fO=-emBp+K_A@mail.gmail.com>
X-Gm-Features: ATxdqUEet03_FyI2TERKlbO51JrP6jcEn7Q-4rQq0_upjpSYovXS4-CF5HohCSg
Message-ID: <CAAhV-H5CefePFu4ORCvO+-MOHj5agttVXXVSf5fO=-emBp+K_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] LoongArch/build: Add fallback install.sh
To: Youling Tang <youling.tang@linux.dev>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

On Mon, Apr 21, 2025 at 10:03=E2=80=AFAM Youling Tang <youling.tang@linux.d=
ev> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> As specified in scripts/install.sh, the priority order is
> as follows (from highest to lowest):
>   ~/bin/installkernel
>   /sbin/installkernel
>   arch/loongarch/boot/install.sh
>
> Fallback to default install.sh if installkernel not found.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/boot/install.sh | 44 ++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100755 arch/loongarch/boot/install.sh
>
> diff --git a/arch/loongarch/boot/install.sh b/arch/loongarch/boot/install=
.sh
> new file mode 100755
> index 000000000000..c97f611ca913
> --- /dev/null
> +++ b/arch/loongarch/boot/install.sh
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# This file is subject to the terms and conditions of the GNU General Pu=
blic
> +# License.  See the file "COPYING" in the main directory of this archive
> +# for more details.
> +#
> +# Copyright (C) 1995 by Linus Torvalds
> +#
> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> +# Adapted from code in arch/i386/boot/install.sh by Russell King
> +#
> +# "make install" script for the RISC-V Linux port
> +#
> +# Arguments:
> +#   $1 - kernel version
> +#   $2 - kernel image file
> +#   $3 - kernel map file
> +#   $4 - default install path (blank if root directory)
> +
> +set -e
> +
> +case "${2##*/}" in
> +# Compressed install
> +vmlinuz.efi)
> +  echo "Installing compressed kernel"
> +  base=3Dvmlinuz
> +  ;;
> +# Normal install
> +*)
I suggest explicitly using vmlinux.elf and vmlinux.efi here, and print
a warning message for *, because we may add more kernel image types in
future.

Huacai

> +  echo "Installing normal kernel"
> +  base=3Dvmlinux
> +  ;;
> +esac
> +
> +if [ -f $4/$base-$1 ]; then
> +  mv $4/$base-$1 $4/$base-$1.old
> +fi
> +cat $2 > $4/$base-$1
> +
> +# Install system map file
> +if [ -f $4/System.map-$1 ]; then
> +  mv $4/System.map-$1 $4/System.map-$1.old
> +fi
> +cp $3 $4/System.map-$1
> --
> 2.38.1
>
>
