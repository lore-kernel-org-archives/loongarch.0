Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396A1D5160
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 06:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997223; cv=none; b=MuEOY9DqeTzAWanRI++75hfNYYwVCgbPyLO7OFKzX/z+EB4f5hts5O2CnjBWnl9h1Orx/UmcYkm6kFgkx2hPUSbvn8HlQOnugRfhCQZ30U1CdrQB6rs+fRrTPWDsJ8XHqF1AMgLtj5sZo6i34FfuXF8bhW5syvTVSEc8iKsKtvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997223; c=relaxed/simple;
	bh=NMxnNJsT6066501VRvx3K1qDB78bj12uazEtEJflWS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PevIug93JqaxfMXPd7PRSkmI5VHcjtdmsw+S5jF1E146+PuesNOiYelTMTQ5FpTyoXT2cNN9Om+XHpi54ZjxdpY/79IoquYuc38LmLhyUIXC6aPo5PQrA+L/HPjsLSj65a8kzSNDvDn8qAQtdOBhmB8/RKVO+nQ3cr4fA9SPah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dji/RrUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dji/RrUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BBC1F00ADE
	for <loongarch@lists.linux.dev>; Thu,  6 Aug 2026 06:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785997222;
	bh=Px8v7D66Q7scAfLlL7p0Y6Wsaiu9tjwpUd392U5sx0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dji/RrUFYRJBT3iFvSp+mWkNWuP5jRZoaQfglvh2BaIv1EqKsqGHzACjUnPFN67YZ
	 R3d7RQlYeJYvX+HTXOAsC/wTHsaXXLwvTJtbWcl0Zq/WPrcjJKm8nlMdMmLlKToAjv
	 2g4QeU1BtVP3Dn9x8AogxgNWKrLIKfP7/2+2ClJVLi4phtsk/ZXm1RgPaVeGzpzOhq
	 hKeXKCaxz7cfyKRcyfwr7JfEBmIlFyuJhDxL3ZecHLtD4ODcPR7jgL+7/IBTvxUnUw
	 ++vr1hj5kyGZWAXveSawF4K7I/eD4PvmBoH3v3ku49zx1J38kNDE7cG3Bm0rHXL9mq
	 EnEhMXtQt6ESw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a14f118a46so2603953a12.2
        for <loongarch@lists.linux.dev>; Wed, 05 Aug 2026 23:20:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpL1odTmEJal1vGZYK7OD+8PTec/3MtNN7tZaWDrq566xU2BwaskwhgfzhQ9KgiBWpPc6ZdkLZLdNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfjphOSpIuwUc+FnMCwrdGbbCOrtBhPGw8KIxbu9/xgDgZnC+Z
	n2QtcxLNgjRdvwMPjQBeFznH+BslWBBB8v8KnDTfZIxXmy+2RkSs51Fenvda8QBSqpSHKe8ncLj
	P+RUWteX0gDiv4yHSKh3nLzvzFJa3H0U=
X-Received: by 2002:a05:6402:a511:20b0:6a1:8ec3:766e with SMTP id
 4fb4d7f45d1cf-6a18ec377b9mr1498536a12.17.1785997220618; Wed, 05 Aug 2026
 23:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805085414.1482-1-zhaoqunqin@loongson.cn> <20260805085414.1482-2-zhaoqunqin@loongson.cn>
 <CAAhV-H5F6JasjxgiDeDdsz64o186CoL1+EEkH6OJSHPZG0PDOQ@mail.gmail.com> <3fc94c7d-8ec1-4b7e-bce7-46628d196b1e@loongson.cn>
In-Reply-To: <3fc94c7d-8ec1-4b7e-bce7-46628d196b1e@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 6 Aug 2026 14:20:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Fz4TTdpUn1z8hRx5QOBDAhrScLFa2DOcMY=iRwcWk1Q@mail.gmail.com>
X-Gm-Features: AUfX_mwt1o3Er3bwihM6i7DN-rHPDCPE39hyjX-vJGZd1WcETi8O6Wiws1sIrIg
Message-ID: <CAAhV-H7Fz4TTdpUn1z8hRx5QOBDAhrScLFa2DOcMY=iRwcWk1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] EDAC/loongson: Encode node and MC info into mc_idx
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>, 
	Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 9:36=E2=80=AFAM Qunqin Zhao <zhaoqunqin@loongson.cn>=
 wrote:
>
>
> =E5=9C=A8 2026/8/5 21:43, Huacai Chen =E5=86=99=E9=81=93:
> > Hi, Qunqin,
> >
> > On Wed, Aug 5, 2026 at 5:09=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson=
.cn> wrote:
> >> From: Wang Jinwei <wangjinwei@loongson.cn>
> >>
> >> On Loongson multi-node systems, memory controllers are distributed acr=
oss
> >> multiple nodes. Encode node and MC information into mc_idx so that sys=
fs
> >> entries uniquely identify each controller.
> >>
> >> The driver gets mc-idx from ACPI _DSD property if firmware provides it=
.
> >> If not, it falls back to edac_device_alloc_index() for legacy firmware
> >> compatibility.
> >>
> >> The number of memory controllers per node (mcs-per-node) is obtained
> >> from firmware via ACPI _DSD property, with a default of 4 for backward
> >> compatibility. Validate that the firmware-provided value is non-zero t=
o
> >> prevent division by zero. The node and MC IDs are decoded from mc_idx:
> >>      node =3D mc_idx / mcs_per_node
> >>      mc =3D mc_idx % mcs_per_node
> >>
> >> Cc: Yulong Wang <wangyulong@loongson.cn>
> >> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> >> Cc: Chao Li <lichao@loongson.cn>
> >> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> >> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> >> ---
> >>   drivers/edac/loongson_edac.c | 35 ++++++++++++++++++++++++++++++----=
-
> >>   1 file changed, 30 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac=
.c
> >> index 38745800ed..abfc1e60e0 100644
> >> --- a/drivers/edac/loongson_edac.c
> >> +++ b/drivers/edac/loongson_edac.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/io-64-nonatomic-lo-hi.h>
> >>   #include <linux/module.h>
> >>   #include <linux/platform_device.h>
> >> +#include <linux/property.h>
> >>   #include "edac_module.h"
> >>
> >>   #define ECC_CS_COUNT_REG       0x18
> >> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
> >>           * register state.
> >>           */
> >>          int last_ce_count;
> >> +       int mcs_per_node;
> >> +       bool mc_idx_valid;
> >>   };
> >>
> >>   static int read_ecc(struct mem_ctl_info *mci)
> >> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
> >>   static void edac_check(struct mem_ctl_info *mci)
> >>   {
> >>          struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> >> -       int new, add;
> >> +       char other_detail[64] =3D {0};
> >> +       int new, add, node, mc;
> >>
> >>          new =3D read_ecc(mci);
> >>          add =3D new - pvt->last_ce_count;
> >> @@ -52,8 +56,14 @@ static void edac_check(struct mem_ctl_info *mci)
> >>          if (add <=3D 0)
> >>                  return;
> >>
> >> +       if (pvt->mc_idx_valid) {
> >> +               node =3D mci->mc_idx / pvt->mcs_per_node;
> >> +               mc =3D mci->mc_idx % pvt->mcs_per_node;
> >> +               snprintf(other_detail, sizeof(other_detail), "node:%d =
mc:%d", node, mc);
> >> +       }
> >> +
> >>          edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
> >> -                            0, 0, 0, 0, 0, -1, "error", "");
> >> +                            0, 0, 0, 0, 0, -1, "error", other_detail)=
;
> >>   }
> >>
> >>   static void dimm_config_init(struct mem_ctl_info *mci)
> >> @@ -72,20 +82,26 @@ static void dimm_config_init(struct mem_ctl_info *=
mci)
> >>          dimm->grain =3D 8;
> >>   }
> >>
> >> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
> >> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> >> +                    bool mc_idx_valid, int mcs_per_node)
> >>   {
> >>          struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> >>
> >>          pvt->ecc_base =3D vbase;
> >>          pvt->last_ce_count =3D read_ecc(mci);
> >> +       pvt->mc_idx_valid =3D mc_idx_valid;
> >> +       pvt->mcs_per_node =3D mcs_per_node;
> >>   }
> >>
> >>   static int edac_probe(struct platform_device *pdev)
> >>   {
> >>          struct edac_mc_layer layers[2];
> >>          struct mem_ctl_info *mci;
> >> +       struct device *dev =3D &pdev->dev;
> >>          void __iomem *vbase;
> >> +       u32 mcs_per_node, mc_idx_u32;
> > Why do we need mc_idx_u32? The code in V1 doesn't work?
>
> V1 works. This is purely to fix the issue reported by sashiko:
>
> "The mc_idx field is defined as an int in struct mem_ctl_info, but
> device_property_read_u32() expects a u32 *. Should this be read into a
> temporary u32 variable first?"
>
> Should we ignore it?
I think we should ignore it, because:
1, it is impossible that mc_idx exceeds 2^31;
2, if mc_idx really exceeds 2^31, use mc_idx_u32 is still wrong when
assign it to mci->mc_idx.

Huacai

>
> >
> >>          int ret;
> >> +       bool mc_idx_valid =3D true;
> >>
> >>          vbase =3D devm_platform_ioremap_resource(pdev, 0);
> >>          if (IS_ERR(vbase))
> >> @@ -102,7 +118,6 @@ static int edac_probe(struct platform_device *pdev=
)
> >>          if (mci =3D=3D NULL)
> >>                  return -ENOMEM;
> >>
> >> -       mci->mc_idx =3D edac_device_alloc_index();
> >>          mci->mtype_cap =3D MEM_FLAG_RDDR4;
> >>          mci->edac_ctl_cap =3D EDAC_FLAG_NONE;
> >>          mci->edac_cap =3D EDAC_FLAG_NONE;
> >> @@ -114,7 +129,17 @@ static int edac_probe(struct platform_device *pde=
v)
> >>          mci->error_desc.grain =3D 8;
> >>          mci->edac_check =3D edac_check;
> >>
> >> -       pvt_init(mci, vbase);
> >> +       if (device_property_read_u32(dev, "mc-idx", &mc_idx_u32)) {
> >> +               mci->mc_idx =3D edac_device_alloc_index();
> >> +               mc_idx_valid =3D false;
> >> +       } else {
> >> +               mci->mc_idx =3D mc_idx_u32;
> >> +       }
> >> +
> >> +       if (device_property_read_u32(dev, "mc-per-node", &mcs_per_node=
) || mcs_per_node =3D=3D 0)
> > The property should also be mcs-per-node.
>
> OK
>
> Thanks.
>
> > Huacai
> >
> >> +               mcs_per_node =3D 4;
> >> +
> >> +       pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
> >>          dimm_config_init(mci);
> >>
> >>          ret =3D edac_mc_add_mc(mci);
> >> --
> >> 2.47.3
> >>
> >>
>
