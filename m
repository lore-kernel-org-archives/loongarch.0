Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AE17E01E
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724681386; cv=none; b=tH8eMEwSbawP7Gz/WIrx8HFOMpWJ/u+uqXWk20dnMlQ/2LRh+D0UwZ1BQAZMSXf/2CuJv9OaSQ85aDKldS9jiQnFzByEA0RmUWywtLdlyrfGRhdb7nbAt9PIzUspWLntA+aOUZrccJ9D4OZ2zavA890zYbz3joRNudfipohKp5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724681386; c=relaxed/simple;
	bh=zqGmo8gp2JteG5/sJycf0vqTzJavG7LNENMm46BKWiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaSV0WRO54/rYuIbRmZIP8lxowSRUICY+XLzFYSQIU1qzYIfebQVwXPZVa2zBnN6eEL1Igw/v8WAo5ZSq8gMSh4XjlU5mmpA1FrL2Ph2Zoud0n89bXawlhdgw4mrTsXccgVrs9XuQEHz1cLZ7cluiP4FwJKYb5OQpP+gdTLTItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgXrMpo+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgXrMpo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0090CC52FC7
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724681386;
	bh=zqGmo8gp2JteG5/sJycf0vqTzJavG7LNENMm46BKWiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OgXrMpo+k7M8awKO3dLNI4I99rF1PnEPU/C+VJYBx4bL6s4bgs3KtjZ5ogXYI64lb
	 +74O5aXDrjfwg2kJtoNgt0Gc8SSNjR7ViC9BJoUKZ+cKAC7yuNw+Pk1TUBtAjr74TG
	 nPqRJ6X0VZg8C0tbIMeGbhvp9rajcMyYlqW1AUJdt4vYtaWs27ySjPf4xh1DGbYVr4
	 TpGNghI075+/JUKOz8n6ZFLDRprmarrUGy19FGKzqDc1P9NwIRdnftlcQqvWxCJr4h
	 k75rxuKphaHKm66NDr35rYjJv1skNIFR9YZRnT3rgvYSYPsb+u5vVI2MjGPFAePKq+
	 a7msM6Rybxk/A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3cb747fafso45378111fa.3
        for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 07:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUrRC/X0Mlabdi/Th6ZXKHdj6/McYyiQ0KuIFYMv7QIrl/ynxoEK7RZzM9o4gnDUgeNKpNrY6gbmo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDx3fvsQ4yKY4MbZ1Z/wNWK01VRhXLa2Fi70IU3+s9r+cEP6DT
	UKgn8uymg36gtdRH49xmzcTE/qbG9EDiMIdCGk8fWrdEfTIikV3Arg4es98Z9xPMKlQuVDsyXEs
	TaglrvkAfHlYhct2zajgRMGZ8Qw==
X-Google-Smtp-Source: AGHT+IEOI9RkXGDHQ0R1klTXWvPrZf9KdyM+dg+7Mg6CbVkQs7/RuK/OfxzhwRlPodx0+cOynU86XcFDul/kY+SaL8s=
X-Received: by 2002:a05:6512:3b27:b0:52f:288:5664 with SMTP id
 2adb3069b0e04-534387c47c8mr6660019e87.51.1724681384244; Mon, 26 Aug 2024
 07:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240821-save_resv_name-v1-1-b9c17f103ffb@flygoat.com>
In-Reply-To: <20240821-save_resv_name-v1-1-b9c17f103ffb@flygoat.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Aug 2024 09:09:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLeVPBz4mEedXEm=rb6ghWwROB7jr-PDw3qVsNRz20Z_A@mail.gmail.com>
Message-ID: <CAL_JsqLeVPBz4mEedXEm=rb6ghWwROB7jr-PDw3qVsNRz20Z_A@mail.gmail.com>
Subject: Re: [PATCH] of_reserved_mem: Save region name string into struct reserved_mem
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	chenhuacai@kernel.org, Kevin Wheatfox <enkerewpo@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 8:51=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> Previously only a pointer to fdt string pool is saved to struct
> reserved_mem as region name.
>
> As on some architectures booting FDT will be wiped at later initialisatio=
n
> stages, this is breaking reserved_mem users.

What architectures? Be specific.

Why is the FDT wiped? It should be preserved and you need it later to
implement kexec.

>
> Copy and save the whole string into struct reserved_mem to avoid
> FDT lifecycle problem.
>
> Reported-by: Kevin Wheatfox <enkerewpo@hotmail.com>
> Closes: https://lore.kernel.org/loongarch/ME4P282MB1397447C3C094554C7AF2E=
37B58E2@ME4P282MB1397.AUSP282.PROD.OUTLOOK.COM/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/of/of_reserved_mem.c    | 2 +-
>  include/linux/of_reserved_mem.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 46e1c3fbc769..22841599cd83 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -70,7 +70,7 @@ static void __init fdt_reserved_mem_save_node(unsigned =
long node, const char *un
>         }
>
>         rmem->fdt_node =3D node;
> -       rmem->name =3D uname;
> +       strscpy(rmem->name, uname, RESERVED_MEM_NAME_LEN);
>         rmem->base =3D base;
>         rmem->size =3D size;
>
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_=
mem.h
> index e338282da652..ed9de36c9cc9 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -8,8 +8,10 @@
>  struct of_phandle_args;
>  struct reserved_mem_ops;
>
> +#define RESERVED_MEM_NAME_LEN  128
> +
>  struct reserved_mem {
> -       const char                      *name;
> +       char                            name[RESERVED_MEM_NAME_LEN];
>         unsigned long                   fdt_node;
>         const struct reserved_mem_ops   *ops;
>         phys_addr_t                     base;
>
> ---
> base-commit: bb1b0acdcd66e0d8eedee3570d249e076b89ab32
> change-id: 20240821-save_resv_name-4f2e2cb8883b
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>
