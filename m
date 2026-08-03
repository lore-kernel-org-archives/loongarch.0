Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64383AE1BB
	for <loongarch@lists.linux.dev>; Mon,  3 Aug 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745484; cv=none; b=TiHH/VIi0VH4IMI78461MCvsT1lJglLLTcgSGZBhxZzXusGkkeFxQyzmlcAAu3PTjAQNqh1uDyDmVXkizbdC2gnEtxY3S/vxy5lnprzipysXNNjss5kNm5OYcTDt8T7M97Jx43r/nEy2RRAs86zNDcUwKDrwS+31+Xng9pGWe5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745484; c=relaxed/simple;
	bh=/xPd4KuPO1rtgr8x4A4p/i0YQk+dusz+zJyB3GGPjSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuGwEIBquFvSZ8XVeHGzenGdKg7jvGM/qtaKolGdtEihusnkz2VNKaAh3ZpH7N9bHUVKkrOTp/8EzX57ysVN4rMnD/ANrH1oqFMeJlp08FbLoO8bDKc3DtSwSvNMxIpTHQmxCpv332qhAreSr1af/23T1aXAwRuva99o/ZbsRFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQtmyL+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQtmyL+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566571F00A3E
	for <loongarch@lists.linux.dev>; Mon,  3 Aug 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785745483;
	bh=ELOsRbeCRU2QsFplIejZ3uG4DJcEeqqRAmp+YlMB1A0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aQtmyL+pyfc/P2xPpU+pvWZ7Pd7qynsVyasFGIma+M+aoCtOMuhCQM8BarfKkctvw
	 4ohIiC+T9VHVJ7A+FmbI0WYK4DIQ/5x7oKv/iNa8OLXEbYqMLb4KeZRj/HRnNld0tP
	 Y5/p5NMMMSj95lxaMOqs+WuJpnyJAFLr2fVOW+/Wa7uLpulJP8PR9OQlg/5FtOSwXK
	 fF7bTWSmIhI6SbFjc1DMvjI934nGRW4pylm1FAMjOsaIGzPUo/QDV7erJotZqLgtaT
	 6UgvWuNrb0cPiULQM5K9IUVXYvzIXlm+YkrHRhmfXYNIDPhXqicWqQzJZcdFtZwE9K
	 ZbGBMviNsPRzA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a0466d12so4075521a12.0
        for <loongarch@lists.linux.dev>; Mon, 03 Aug 2026 01:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVIovGzphMl+G4glYKRl8mIO+t1/EGjGUn4FW/rvNJsbTI3duucYJ9qBtFSZubePrgW8F3NbNd9zI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5o0WiM4u70lCrU4z3RB5XKHy89H6J7hvG2z2/pXhbyEGrwez0
	M25Ey7MFD3C+3/xEOhGmA8hyhCpjE1WMjggf5V/gb9n0lR1tlxkXEkQdM7irKLwAIxiXCDXMzHK
	OgGt6zOZbgE9S6w+hmxYnCaVdiRwM7BU=
X-Received: by 2002:a05:6402:1ec1:b0:698:4501:3a8e with SMTP id
 4fb4d7f45d1cf-6a0a7b71d38mr6386094a12.9.1785745482013; Mon, 03 Aug 2026
 01:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
In-Reply-To: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 3 Aug 2026 16:25:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4gQ=DZC+TmvMtrtV4FM7wrRibHFu-dAyVkxo0j2Fkbrg@mail.gmail.com>
X-Gm-Features: AUfX_mx4PNDGpsqYKEY19bSlBh4BGO_wnQf3YmRnMOVPzcg7pfuWJE9qAiGtDy8
Message-ID: <CAAhV-H4gQ=DZC+TmvMtrtV4FM7wrRibHFu-dAyVkxo0j2Fkbrg@mail.gmail.com>
Subject: Re: [PATCH 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>, 
	Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Qunqin,

On Thu, Jul 30, 2026 at 2:45=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn=
> wrote:
>
> From: Wang Jinwei <wangjinwei@loongson.cn>
>
> On Loongson multi-node systems, memory controllers are distributed
> across multiple nodes. Encode node and MC information into mc_idx
> so that sysfs entries uniquely identify each controller.
>
> The driver gets mc-idx from ACPI _DSD property 'mc-idx' if firmware
> provides it. If not, it falls back to edac_device_alloc_index() for
> legacy firmware compatibility.
>
> The number of memory controllers per node (mc-per-node) is obtained
> from firmware via ACPI _DSD property, with a default of 4 for
> backward compatibility. The node and MC IDs are decoded from mc_idx:
>      node =3D mc_idx / mc_per_node
>      mc =3D mc_idx % mc_per_node
>
> For example, with mc-per-node=3D4:
>      mc-idx 0-3   -> node0 mc0-mc3
>      mc-idx 4-7   -> node1 mc0-mc3
>      ...
>      mc-idx 28-31 -> node7 mc0-mc3
>
> The dmesg output looks like this=EF=BC=9A
> Before: (no _DSD mc-idx)
> EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
> page:0x0 offset:0x0 grain:8 syndrome:0x0)
>
> After: (_DSD mc-idx)
> EDAC MC3: 510 CE error on MC#3Channel#0_DIMM#0 (channel:0 slot:0
> page:0x0 offset:0x0 grain:8 syndrome:0x0 - node:0 mc:3)
>
> Cc: Yulong Wang <wangyulong@loongson.cn>
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 38 +++++++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 38745800ed..f2452e98f5 100644
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
> +       int mc_per_node;
I think mcs_per_node is better than mc_per_node.

> +       bool mc_idx_valid;
>  };
>
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>  static void edac_check(struct mem_ctl_info *mci)
>  {
>         struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> -       int new, add;
> +       char other_detail[64];
Use char other_detail[64] =3D {0}, then we can drop the 'else' branch below=
.

> +       int new, add, node, mc;
>
>         new =3D read_ecc(mci);
>         add =3D new - pvt->last_ce_count;
> @@ -52,8 +56,17 @@ static void edac_check(struct mem_ctl_info *mci)
>         if (add <=3D 0)
>                 return;
>
> +       if (pvt->mc_idx_valid) {
> +               node =3D mci->mc_idx / pvt->mc_per_node;
> +               mc =3D mci->mc_idx % pvt->mc_per_node;
> +               snprintf(other_detail, sizeof(other_detail),
> +                               "node:%d mc:%d", node, mc);
The snprintf() can be put in oneline.

> +       } else {
> +               other_detail[0] =3D '\0';
> +       }
> +
>         edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
> -                            0, 0, 0, 0, 0, -1, "error", "");
> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>  }
>
>  static void dimm_config_init(struct mem_ctl_info *mci)
> @@ -72,20 +85,26 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>         dimm->grain =3D 8;
>  }
>
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> +               bool mc_idx_valid, int mc_per_node)
The function definition can be put in one line.

>  {
>         struct loongson_edac_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
> +       pvt->mc_idx_valid =3D mc_idx_valid;
> +       pvt->mc_per_node =3D mc_per_node;
>  }
>
>  static int edac_probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *vbase;
> +       u32 mc_per_node;
>         int ret;
> +       bool mc_idx_valid;
Use bool mc_idx_valid =3D true, then we can drop the 'else' branch below.


Huacai

>
>         vbase =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(vbase))
> @@ -102,7 +121,6 @@ static int edac_probe(struct platform_device *pdev)
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> -       mci->mc_idx =3D edac_device_alloc_index();
>         mci->mtype_cap =3D MEM_FLAG_RDDR4;
>         mci->edac_ctl_cap =3D EDAC_FLAG_NONE;
>         mci->edac_cap =3D EDAC_FLAG_NONE;
> @@ -114,7 +132,17 @@ static int edac_probe(struct platform_device *pdev)
>         mci->error_desc.grain =3D 8;
>         mci->edac_check =3D edac_check;
>
> -       pvt_init(mci, vbase);
> +       if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx)) {
> +               mci->mc_idx =3D edac_device_alloc_index();
> +               mc_idx_valid =3D false;
> +       } else {
> +               mc_idx_valid =3D true;
> +       }
> +
> +       if (device_property_read_u32(dev, "mc-per-node", &mc_per_node))
> +               mc_per_node =3D 4;
> +
> +       pvt_init(mci, vbase, mc_idx_valid, mc_per_node);
>         dimm_config_init(mci);
>
>         ret =3D edac_mc_add_mc(mci);
>
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> --
> 2.47.2
>
>
