Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94E3DF019
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937408; cv=none; b=GCC7SSXJGXHMWhsgF0yCjOZ6tJajcoz+oWk4+U4EmfR1nNQMux5U4THwlzdBs7HlzMijrIXqFxFEc9Pr3TZi02tJx0RpMhlc1v9XmgqN1MUN9pHOHAhuDw0RTD7l5Dn9VDPWmDlkIo/5O9kReHIspPbGus/EEGGEpWw3fqNd0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937408; c=relaxed/simple;
	bh=0xaooiUgcmwVuOx6I2zxXzIIZlbMdRdOgIuicWWf7RY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bR8VssUEbJwSmE/HnH4hMQvqRpsFmxOuifpmirR98i8p1sSYvtbfu5oZ2HJ5KOOpku0YfPonBWeHlzKgKTPs1I0CkltqWbTifU3FYZimX94ekkOz+qpCZaZCTfzWEv990uecjTy9zxVKSiubt5gXYV1MS6DiKRmJe/WTcJWi5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qs9m6CrP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qs9m6CrP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59DC1F000E9
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785937406;
	bh=DXAfvHc0tie6NwMtbzftSvzsKhJtjwBY4ko3W++jGjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qs9m6CrPQdgM2k5W/HEjyYxIoh5a9TXxkochGyA//qyBw8nvwPoklvUH6LtI1+++4
	 yP+R+v4n+zK0wgmPe7CNcsFIvzRkO4Nqghyj4oBs3ibjM1bgMO5Eewd3UWpjRaRzjz
	 RmTl9YKTtCFw+BLZbkOOxvnic0nEHYEl2MsI3hLD8NeKeIn0nPtLUoh01Y1KohNg+I
	 Cjt75IoOY7tmn7dc8oer/Ca0zFezhfOwmZIxoIzdauuCRF9Y3JlbQ7W4I+yPVPY2E+
	 qvjYZPYOVnrvMXLYQgvEIeWQFalKbWARMc8WS+PmN++vEcY52Uz5gz9vgSyrKuTC8d
	 KBZGOKg8b98rA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so1181085a12.1
        for <loongarch@lists.linux.dev>; Wed, 05 Aug 2026 06:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr3VBJj4mXLDsWIZmPTgCWS/V7InpT+UUCsQe4p1AsFsraC7Y0RtxDCc6iWM76XxFa4jO9gpQKgag=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGeyPSE4UlSMKgOHhZCdQUnf2OzC/P+G04nfgPePKnIofVNtmm
	sKrxkZ2sXai3BWXnNc95AV/OBCXolk1l6BGJoFCbMBbBxB3/9q68MbBJ/JFrVgDC+a/lmNljQXz
	WGqaIEOGTis97QDwpm3FmzUVT62FX8H0=
X-Received: by 2002:a05:6402:4:b0:6a1:8b83:8f3f with SMTP id
 4fb4d7f45d1cf-6a18b839023mr348586a12.10.1785937405574; Wed, 05 Aug 2026
 06:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805085414.1482-1-zhaoqunqin@loongson.cn> <20260805085414.1482-2-zhaoqunqin@loongson.cn>
In-Reply-To: <20260805085414.1482-2-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 5 Aug 2026 21:43:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5F6JasjxgiDeDdsz64o186CoL1+EEkH6OJSHPZG0PDOQ@mail.gmail.com>
X-Gm-Features: AUfX_mwfpUkq0yu0DAJAMGmQHXDEcaBN7q3juaEgRt1xjAclE4I2CrA8VqSpVV4
Message-ID: <CAAhV-H5F6JasjxgiDeDdsz64o186CoL1+EEkH6OJSHPZG0PDOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>, 
	Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

On Wed, Aug 5, 2026 at 5:09=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn>=
 wrote:
>
> From: Wang Jinwei <wangjinwei@loongson.cn>
>
> On Loongson multi-node systems, memory controllers are distributed across
> multiple nodes. Encode node and MC information into mc_idx so that sysfs
> entries uniquely identify each controller.
>
> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
> If not, it falls back to edac_device_alloc_index() for legacy firmware
> compatibility.
>
> The number of memory controllers per node (mcs-per-node) is obtained
> from firmware via ACPI _DSD property, with a default of 4 for backward
> compatibility. Validate that the firmware-provided value is non-zero to
> prevent division by zero. The node and MC IDs are decoded from mc_idx:
>     node =3D mc_idx / mcs_per_node
>     mc =3D mc_idx % mcs_per_node
>
> Cc: Yulong Wang <wangyulong@loongson.cn>
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 38745800ed..abfc1e60e0 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -9,6 +9,7 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include "edac_module.h"
>
>  #define ECC_CS_COUNT_REG       0x18
> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
>          * register state.
>          */
>         int last_ce_count;
> +       int mcs_per_node;
> +       bool mc_idx_valid;
>  };
>
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>  static void edac_check(struct mem_ctl_info *mci)
>  {
>         struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> -       int new, add;
> +       char other_detail[64] =3D {0};
> +       int new, add, node, mc;
>
>         new =3D read_ecc(mci);
>         add =3D new - pvt->last_ce_count;
> @@ -52,8 +56,14 @@ static void edac_check(struct mem_ctl_info *mci)
>         if (add <=3D 0)
>                 return;
>
> +       if (pvt->mc_idx_valid) {
> +               node =3D mci->mc_idx / pvt->mcs_per_node;
> +               mc =3D mci->mc_idx % pvt->mcs_per_node;
> +               snprintf(other_detail, sizeof(other_detail), "node:%d mc:=
%d", node, mc);
> +       }
> +
>         edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
> -                            0, 0, 0, 0, 0, -1, "error", "");
> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>  }
>
>  static void dimm_config_init(struct mem_ctl_info *mci)
> @@ -72,20 +82,26 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>         dimm->grain =3D 8;
>  }
>
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> +                    bool mc_idx_valid, int mcs_per_node)
>  {
>         struct loongson_edac_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
> +       pvt->mc_idx_valid =3D mc_idx_valid;
> +       pvt->mcs_per_node =3D mcs_per_node;
>  }
>
>  static int edac_probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *vbase;
> +       u32 mcs_per_node, mc_idx_u32;
Why do we need mc_idx_u32? The code in V1 doesn't work?

>         int ret;
> +       bool mc_idx_valid =3D true;
>
>         vbase =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(vbase))
> @@ -102,7 +118,6 @@ static int edac_probe(struct platform_device *pdev)
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> -       mci->mc_idx =3D edac_device_alloc_index();
>         mci->mtype_cap =3D MEM_FLAG_RDDR4;
>         mci->edac_ctl_cap =3D EDAC_FLAG_NONE;
>         mci->edac_cap =3D EDAC_FLAG_NONE;
> @@ -114,7 +129,17 @@ static int edac_probe(struct platform_device *pdev)
>         mci->error_desc.grain =3D 8;
>         mci->edac_check =3D edac_check;
>
> -       pvt_init(mci, vbase);
> +       if (device_property_read_u32(dev, "mc-idx", &mc_idx_u32)) {
> +               mci->mc_idx =3D edac_device_alloc_index();
> +               mc_idx_valid =3D false;
> +       } else {
> +               mci->mc_idx =3D mc_idx_u32;
> +       }
> +
> +       if (device_property_read_u32(dev, "mc-per-node", &mcs_per_node) |=
| mcs_per_node =3D=3D 0)
The property should also be mcs-per-node.

Huacai

> +               mcs_per_node =3D 4;
> +
> +       pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
>         dimm_config_init(mci);
>
>         ret =3D edac_mc_add_mc(mci);
> --
> 2.47.3
>
>
