Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCD44E664
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937351; cv=none; b=NHGjD2ZuSn+STK54IRhCydNkr/f8sjAanhIdu0TXfA4mQjiZywkBuew8uJMQmcc2w94DYfm+gk47t7iojUPiXyEGq9an0Ht5PlpGpBAWuaf2dYv7iQvLFKJ30mVvxPrjWDpLuKX5F+WruXQCUsLjFFM6OU7QWhafEwf9IN74CXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937351; c=relaxed/simple;
	bh=1966KqqiIpe8RO3yZKISZslbw7FYEEPktp1EKsDFwRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJYyps7PFmYRCPYEbyE+yevu4+D7ZZ1R04uYFOcAQR6iTAKWUYxCgGlwGN2SWRZS0wOi881m1jRR/SPV6d8R/Rc+QSjmSb15/4RV8aTYW9j80XpBilugtoVb3Q0y17U1fP7PSG3mgENoxiEBik0gmA/1xCOP6k054EMiJEvKt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McYZwtiW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McYZwtiW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D6D1F00ACF
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937349;
	bh=UH6v11zCrpdzYCwhP1zs4M1/ZFB1T+WfffS/2VwRFgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=McYZwtiWJ5uuTsGTdo7zHLKBiLvGostriMZTD+o3QWWnAtwSLJjYn1nhQoCOfvjgw
	 7cWNPB0N1c+N+LdNrHBwXuWtjgqf5ysneIY897yaMFKbvg57R9RyCTuzcZCQcv+l9x
	 YYtRJMhSUu/LXnG5do7/NvgiYG+0SjeWxwIaBh2QuP+2dF6zMTDiUASwtbgp/L7Pgp
	 JCE26NlJPL4AA4ckkr2zRc4ORpTGQ5ozJNH7ESHgW4+prse2e1lrKq4QirWWoWxxMg
	 qAjYoBrT7+6XNf/aVsPhQ35t+wp43W8jaGFeerHzeErvuJDrgvXsIl1uqTHY67fvK3
	 gNvbjZ9IbrqbQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so797114a12.3
        for <loongarch@lists.linux.dev>; Wed, 05 Aug 2026 06:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rph9yh0DLomYjL8Wn2+Xbt0lA/hNPMBW3/OGVZiCJ20fUhwgZuQNCDnjgJe9LFzofjuVMPayDVddFE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyWHrEehbigWKjDj3Ty4uifVxN1JJeo+3RghoRdP/U0RAH8uz2
	V78x/OxlfwiuG1QrqLhHnR3jECXqAXYQzyPW3w0rVVNPeidDDYy/SadbskZlwLuYJpcUAbcTzDS
	V7C2VreTuAOkH6YNGHQbc4khvkXoSvSA=
X-Received: by 2002:a05:6402:4543:b0:69f:2c1d:d83c with SMTP id
 4fb4d7f45d1cf-6a14f2893e6mr2985312a12.21.1785937348347; Wed, 05 Aug 2026
 06:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805085414.1482-1-zhaoqunqin@loongson.cn> <20260805085414.1482-3-zhaoqunqin@loongson.cn>
In-Reply-To: <20260805085414.1482-3-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 5 Aug 2026 21:42:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H44XNByfmyONT59fmU0hcuoiWAg6eaGPddGTjcCCONMAA@mail.gmail.com>
X-Gm-Features: AUfX_myEmN-LP3kO5t6nKZ7yZwUwBzOQ2wu7QnpQw4GlIALbn78mkBYAMVYKAeo
Message-ID: <CAAhV-H44XNByfmyONT59fmU0hcuoiWAg6eaGPddGTjcCCONMAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] EDAC/loongson: get DIMM size from ACPI _DSM method
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Wang Jinwei <wangjinwei@loongson.cn>, Dongyan Qian <qiandongyan@loongson.cn>, 
	Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

Replace "get" with "Get" in the subject line.


Huacai

On Wed, Aug 5, 2026 at 5:09=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn>=
 wrote:
>
> From: Wang Jinwei <wangjinwei@loongson.cn>
>
> Add support to retrieve DIMM size from ACPI _DSM method instead
> of using hardcoded values.
>
> 1. Add loongson_get_dimm_size_acpi() to call ACPI _DSM method
>    to get DIMM size in MB.
>
> 2. Update dimm_config_init() to use the size from ACPI, with
>    fallback to default 1 MB if ACPI method fails.
>
> 3. Add ACPI UUID and DSM function definitions for EDAC.
>
> The DIMM size is passed from UEFI through ACPI OperationRegion
> and _DSM method, enabling correct display of memory size in
> /sys/devices/system/edac/mc/mc*/size_mb.
>
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index abfc1e60e0..dd26153a9b 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -13,6 +13,8 @@
>  #include "edac_module.h"
>
>  #define ECC_CS_COUNT_REG       0x18
> +#define LOONGSON_EDAC_DSM_UUID "65d0431b-7eb8-46df-b914-b7d568553140"
> +#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE   1
>
>  struct loongson_edac_pvt {
>         void __iomem *ecc_base;
> @@ -66,13 +68,39 @@ static void edac_check(struct mem_ctl_info *mci)
>                              0, 0, 0, 0, 0, -1, "error", other_detail);
>  }
>
> +static u32 loongson_get_dimm_size_acpi(struct device *dev)
> +{
> +       acpi_handle handle =3D ACPI_HANDLE(dev);
> +       union acpi_object *obj;
> +       u32 size_mb =3D 1;
> +       guid_t guid;
> +
> +       if (!handle)
> +               return size_mb;
> +
> +       if (guid_parse(LOONGSON_EDAC_DSM_UUID, &guid))
> +               return size_mb;
> +
> +       obj =3D acpi_evaluate_dsm(handle, &guid, 0,
> +                               LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE, NUL=
L);
> +       if (!obj)
> +               return size_mb;
> +
> +       if (obj->type =3D=3D ACPI_TYPE_INTEGER)
> +               size_mb =3D (u32)obj->integer.value;
> +
> +       ACPI_FREE(obj);
> +       return size_mb;
> +}
> +
>  static void dimm_config_init(struct mem_ctl_info *mci)
>  {
>         struct dimm_info *dimm;
> +       struct device *dev =3D mci->pdev;
>         u32 size, npages;
>
> -       /* size not used */
> -       size =3D -1;
> +       size =3D loongson_get_dimm_size_acpi(dev);
> +
>         npages =3D MiB_TO_PAGES(size);
>
>         dimm =3D edac_get_dimm(mci, 0, 0, 0);
> --
> 2.47.3
>
