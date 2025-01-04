Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD22914
	for <loongarch@lists.linux.dev>; Sat,  4 Jan 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735997783; cv=none; b=UMtMm4B7toYgurcKSl5vXs8Of9MW7hSek2MjM1DXnkiULxR+OnxWql+Vdyk0x+LYVvBrXMIEUDjJYnO9T3XBj9uSjeHGSmYGil4WR5MX8e6173RWx9r+HxJtFtj4kmy0C5C6hwsWy5rj2F9ds+rDLgU2On2/pGHYcWEtAPEWRN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735997783; c=relaxed/simple;
	bh=Aa988IaKLLG/zHzXrD4O7Agp+jWtMSt00/wImtOxjDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJG8uK5S5i8pr6ka0IzuyptdmAicqoqX950CjT3grrbL0BuQ1SEefdE1yQpNcF4jAdSipkjucQnznVM42jyqnOX5Qw4JZ99hQnyzGzPl0ERcBpEnRRSfPDH6+BEj0uyqLyx1dJS/rb4MnZX7rD+B5YFoG0xPOud1siAvnXZcB84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoOvv/h8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoOvv/h8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D620AC4CED1
	for <loongarch@lists.linux.dev>; Sat,  4 Jan 2025 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735997782;
	bh=Aa988IaKLLG/zHzXrD4O7Agp+jWtMSt00/wImtOxjDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eoOvv/h8OEut7ona0/MbXxHnztopemqLltNAgLsNMzHWUzJNEXhObYeLneKwXmJJK
	 aAemIg09lBfNH2u6CZfgTlfuBEXgyarwPI6ox0lURK1Unu01/pAM9VYOT3mtYSY1Us
	 Y7iQLBBgCVXlzqiEYvdJshMWCtTTWroHnMAfPzeVtJALiJLUi5wBqRSZBDOPqP2qK8
	 eXrTBZzxwbS8Ok1uoWGxqAqC7kCRH6be45x5QC34/6IXm8San92n4ad8AcQimj5wg+
	 y4n/uy/FHa7scsmJzoWRderomNtptrnQQQgn5vYzSdMjI5jKfByRi30qO1SsNEgGp0
	 0tCn1dPu1oIog==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2098113466b.0
        for <loongarch@lists.linux.dev>; Sat, 04 Jan 2025 05:36:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZ7PaYxPzutmT1yGFQT+N0huwuUL+ANR31HCt6YV56G81G4FzZHw9/XhjWRCdBj61wCNwcyV5/jS0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvwoK+LNZcsXJioTNce6RPCpptGnsxa419ciXCOmEo6pdqgBU
	Mx83AS/0e18qfJ1oKKhYQIzmLGCfmhob3RZBqhIow6DMMRaarrwxYVInVYMRG5eA0HKEJ6OLK4S
	LNhSlkzjnXWUc4Bqx0Ggp472B1sk=
X-Google-Smtp-Source: AGHT+IF4mAPJRZdYYJd0SyM0fjIVswQWP1UwYplLNiwwCFFy5/nwXb/2QrNI+tFQUZo/c8cAjMS1Ejk2CKRysxLxB2U=
X-Received: by 2002:a17:907:1c10:b0:aa6:ac9b:681f with SMTP id
 a640c23a62f3a-aac3355d85bmr4817960366b.43.1735997781432; Sat, 04 Jan 2025
 05:36:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250103-la-earlycon-fixed-map-v2-1-b328ec2564f7@flygoat.com>
In-Reply-To: <20250103-la-earlycon-fixed-map-v2-1-b328ec2564f7@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 4 Jan 2025 21:36:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40uX8xAnU2OsA_FQ6iA7aDmaOqWKH_hZYw6GAYZiEpAw@mail.gmail.com>
X-Gm-Features: AbW1kvaV4tpGf_cAUI5Q7sf8vJIulNdwTvhJEXf4JaS4xk04A9B5SMOy3raxvjU
Message-ID: <CAAhV-H40uX8xAnU2OsA_FQ6iA7aDmaOqWKH_hZYw6GAYZiEpAw@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: Disable FIX_EARLYCON_MEM when ARCH_IOREMAP
 is enabled
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Jan 3, 2025 at 7:36=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> When ARCH_IOREMAP is enabled, we are using always accessible DMW
> for ioremap. It makes no sense to create a dedicated mapping for
> earlycon given that we can access the region via DMW.
>
> Disable FIX_EARLYCON_MEM when ARCH_IOREMAP is selected. This can
> ease debugging for early mapping issues.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Drop changes to fixedmap.h
> - Link to v1: https://lore.kernel.org/r/20250102-la-earlycon-fixed-map-v1=
-1-23fe3a6681c4@flygoat.com
> ---
>  arch/loongarch/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1c4d13aa677e2e04b9791882fba7523f93d6a69d..ad8a8cf75343799ea626be52f=
521fa75e7cbe07b 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -246,7 +246,7 @@ config MACH_LOONGSON64
>         def_bool 64BIT
>
>  config FIX_EARLYCON_MEM
> -       def_bool y
> +       def_bool !ARCH_IOREMAP
>
>  config PGTABLE_2LEVEL
>         bool
>
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250102-la-earlycon-fixed-map-d6a48bd5b831
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>
