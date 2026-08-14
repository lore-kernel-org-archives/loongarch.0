Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C42F42047F
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 07:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693168; cv=none; b=JE8HUHnVwzVVtq8xrXZ/u+GUgC649V0F08XuLIbt+Zb4e2RCORjbHoE6NSv+ZZZnbG9Uh+8FhFYkFS8sQk5UDXMnkb6lk5uKIERKazOLVP341uIW87nKbJWwQCHn1giYbE1N7xWeu8npkvph1jZnewdUrm7NH+7q2Far75VlH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693168; c=relaxed/simple;
	bh=Jns215yB6xs07w7M2dkhV4IO9areBb9iQ4x8t+GgVJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyEyDj+GKIc+ta8cyVJl0SUCnAM+/XqEFCbVQo90QaL49Tt/mBEL6lGjWotOR5MDvkq3uBo6JF/IyhDJMBY6fRuGS4qTI34/IJtFypfMbUvOimE0u+cVI92JLQVRwe7KjFGYjKCiKY0mA8nshbDOwvPmqcJHDDey5nE/J4dwHg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEhuRstZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEhuRstZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CB91F00ADB
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693159;
	bh=7QUQBst8WNABjT5a+com0pE4G+EK6MavQVnRB/RjQq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NEhuRstZRYwAtZIgb/OhTtFJXLHwzzpYpAeNLHzyXFcYmqtlFZd4Zj54L0D3l0CUC
	 8RhnA3OoM2HcgyheNwr476qJ6hZ8scpoTcW68cEQtlbZpUo2qZ6Q+FZtguBu6ittU/
	 9gy6bLtrL7b53W2V84QqodUcz4bH8zQOgdEVpCnY9DU+bOX/FFeGEH+sRZ2sQ67cS9
	 a+eTMo7n7RVTNU8jyAS3dE5YwAusNiIOE8tiepNSu+LiVFlgFbUwRUQ6IgNSH2kTEB
	 klO6kDraOw5BsVr5xSUPkJt/zo3iO3BMALSZ7TNoGGfmkTQ7VK3Q8+uB6kXvwTgbJI
	 r1kcP4fFXBtkw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1038557a12.0
        for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 00:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp98r2y2Z6KcI9fjttLGmlHWhh0J4HwtgMu4akbbdVJWcqYXP89X22JZMWcOzmZ4Pa25HiBBJ5nPiA=@lists.linux.dev
X-Gm-Message-State: AOJu0YweCG5JVFc4FDBVvHZ6PC21RosL5BE+4D4C/H0lFBA02cH/TPTQ
	E5WKqHIKmymgFXwiCAJ5+6cBAoQy7XRgQCUMZsWTGaG7wLXPxXu8tC//PIFTZd+XViyLXEbeCV9
	b2XsAIwcgpJVJE8oyJG3JqAu8XM28QhY=
X-Received: by 2002:a05:6402:5019:b0:6a3:71fd:4083 with SMTP id
 4fb4d7f45d1cf-6a38a949462mr1681495a12.9.1786693158079; Fri, 14 Aug 2026
 00:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812064139.1231-1-zhaoqunqin@loongson.cn> <20260812064139.1231-4-zhaoqunqin@loongson.cn>
 <54439ff4-52ae-4e87-9adc-d63356961434@loongson.cn>
In-Reply-To: <54439ff4-52ae-4e87-9adc-d63356961434@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Aug 2026 15:39:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fYO3QA2ouqFT46qKNs-P0KokAUf3hj=FKZZt+WumtXw@mail.gmail.com>
X-Gm-Features: AUfX_myRrp9jxpgY8sw0P0Injyn-w06LzUULiD2g8KohKnd-go5ABSl7T_CErBQ
Message-ID: <CAAhV-H4fYO3QA2ouqFT46qKNs-P0KokAUf3hj=FKZZt+WumtXw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] EDAC/loongson: Add CS4-7 timeout filter for
 cross-node access
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Wusheng <wusheng@loongson.cn>, Wang Jinwei <wangjinwei@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:33=E2=80=AFPM Qunqin Zhao <zhaoqunqin@loongson.cn=
> wrote:
>
>
> =E5=9C=A8 2026/8/12 14:41, Qunqin Zhao =E5=86=99=E9=81=93:
>
>
> > On Loongson 3C6000 multi-node systems, when the EDAC driver running
> > on one node accesses the memory controller registers of another node,
> > the read operation may timeout and return random values. This causes
> > false CE error reports because the random values in CS0-3 (low 32 bits)
> > are misinterpreted as valid ECC error counts.
> >
> > For cross-node accesses, check CS4-7 (high 32 bits) of the ECC
> > count register. If the valid-cs-bits firmware property is set and
> > the high bits are non-zero, it indicates a timeout or random value,
> > so skip the report and return the previous count.
> >
> > To avoid undefined behavior on 8-CS systems where valid_cs_bits=3D64,
> > guard the shift with a bounds check (valid_cs_bits < 64).
> >
> > Signed-off-by: Wusheng <wusheng@loongson.cn>
> > Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> > Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> > ---
> >   drivers/edac/loongson_edac.c | 25 ++++++++++++++++++++-----
> >   1 file changed, 20 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.=
c
> > index a3776a8501..eb36b708e6 100644
> > --- a/drivers/edac/loongson_edac.c
> > +++ b/drivers/edac/loongson_edac.c
> > @@ -27,6 +27,7 @@ struct loongson_edac_pvt {
> >        */
> >       int last_ce_count;
> >       int mcs_per_node;
> > +     int valid_cs_bits;
>
> Thanks for the pointer. I've reviewed the Sashiko report and address each
> finding below.
>
> [Severity: Medium]
>
>
>  > The valid-cs-bits device property is parsed as a u32, but it is stored
>  > here as a signed int.
>  >
>  > If the device tree specifies a value >=3D 0x80000000, it would be cast=
 to a
>  > negative integer. This could bypass the bounds check in read_ecc()
> where it
>  > checks pvt->valid_cs_bits < 64, resulting in a right-shift by a negati=
ve
>  > amount.
>  >
>  > Could this be declared as a u32 instead to avoid undefined behavior?
>
> I'll change `int valid_cs_bits` to `u32` in the struct and
> in the `pvt_init()` parameter.
If you really want to do this, please do the same changes for mcs_per_node.

Huacai

> >       bool mc_idx_valid;
> >   };
> >
> > @@ -37,11 +38,21 @@ static int read_ecc(struct mem_ctl_info *mci)
> >       int cs;
> >
> >       ecc =3D readq(pvt->ecc_base + ECC_CS_COUNT_REG);
> > -     /* cs0 -- cs3 */
> > +     /* Discard the read value if any invalid bit is set to 1 */
> > +     if (pvt->valid_cs_bits < 64 && (ecc >> pvt->valid_cs_bits)) {
> > +             edac_mc_printk(mci, KERN_DEBUG, "ECC read invalid, skip: =
0x%llx\n", ecc);
> > +             return pvt->last_ce_count;
> > +     }
> [Severity: Medium]
>
>  > If the hardware read times out during probe, this will return the
>  > uninitialized pvt->last_ce_count (which is 0 since pvt_info is
>  > zero-allocated).
>  >
>  > Since pvt_init() uses this to set the baseline error count:
>  >
>  > drivers/edac/loongson_edac.c:pvt_init() {
>  >     ...
>  >     pvt->last_ce_count =3D read_ecc(mci);
>  > }
>  >
>  > Does this incorrectly set the baseline count to 0 if a timeout occurs
> on the
>  > first read? If so, on the next successful poll, the entire historical
> error
>  > count since system reset would be subtracted by 0 and falsely reported=
 as
>  > newly occurred errors.
>
> This cannot be fixed in software:
>
> 1. Waiting for a "correct" read during probe could hang the kernel.
> 2. A bounded retry cannot guarantee correctness - all reads within the
> window
>     could still return bogus values.
> 3. The only thing software can do is print a debug message when a suspici=
ous
>     value is detected, which this patch already does.
> > +
> > +     /* cs0 -- cs7 */
> >       cs =3D ecc & 0xff;
> >       cs +=3D (ecc >> 8) & 0xff;
> >       cs +=3D (ecc >> 16) & 0xff;
> >       cs +=3D (ecc >> 24) & 0xff;
> > +     cs +=3D (ecc >> 32) & 0xff;
> > +     cs +=3D (ecc >> 40) & 0xff;
> > +     cs +=3D (ecc >> 48) & 0xff;
> > +     cs +=3D (ecc >> 56) & 0xff;
> >
> >       return cs;
> >   }
> > @@ -111,14 +122,15 @@ static void dimm_config_init(struct mem_ctl_info =
*mci)
> >   }
> >
> >   static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase,
> > -                  bool mc_idx_valid, int mcs_per_node)
> > +                  bool mc_idx_valid, int mcs_per_node, int valid_cs_bi=
ts)
> >   {
> >       struct loongson_edac_pvt *pvt =3D mci->pvt_info;
> >
> >       pvt->ecc_base =3D vbase;
> > -     pvt->last_ce_count =3D read_ecc(mci);
> >       pvt->mc_idx_valid =3D mc_idx_valid;
> >       pvt->mcs_per_node =3D mcs_per_node;
> > +     pvt->valid_cs_bits =3D valid_cs_bits;
> > +     pvt->last_ce_count =3D read_ecc(mci);
> >   }
> >
> >   static int edac_probe(struct platform_device *pdev)
> > @@ -127,7 +139,7 @@ static int edac_probe(struct platform_device *pdev)
> >       struct mem_ctl_info *mci;
> >       struct device *dev =3D &pdev->dev;
> >       void __iomem *vbase;
> > -     u32 mcs_per_node;
> > +     u32 mcs_per_node, valid_cs_bits;
> >       int ret;
> >       bool mc_idx_valid =3D true;
> >
> > @@ -165,7 +177,10 @@ static int edac_probe(struct platform_device *pdev=
)
> >       if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) =
|| mcs_per_node =3D=3D 0)
> >               mcs_per_node =3D 4;
> >
> > -     pvt_init(mci, vbase, mc_idx_valid, mcs_per_node);
> > +     if (device_property_read_u32(dev, "valid-cs-bits", &valid_cs_bits=
))
> > +             valid_cs_bits =3D 32;
> [Severity: High]
>
>  > On older 8-CS systems lacking the valid-cs-bits firmware property, thi=
s
>  > defaults to 32.
>  >
>  > If a correctable error occurs on CS4-CS7 on these systems, the
> hardware ECC
>  > register will populate the upper 32 bits. The timeout filter in
> read_ecc()
>  > will incorrectly interpret this as a timeout and discard the read.
>  >
>  > Because the hardware ECC register is cumulative and cannot be
> cleared, the
>  > upper bits will remain non-zero permanently. Will this cause every
> subsequent
>  > poll to be discarded, effectively deadlocking EDAC error reporting
> for all
>  > chip selects on that node?
>
> This concern does not apply for two reasons:
>
> 1. There are no 8-CS systems at this point, so backward compatibility wit=
h
>     8-CS firmware is not something we need to account for. The
> `valid-cs-bits`
>     default of 32 matches the 4-CS hardware that the current firmware
> targets.
>
> 2. On 8-CS systems, all 64 bits of the register are valid counter bits, s=
o
>     software cannot distinguish a correct read from a bogus one. Determin=
ing
>     whether a read is valid on such systems requires a hardware
> mechanism; no
>     software-only check can do it.
>
> Please let me know if this addresses your concerns; otherwise I'll send a=
 v4
> with the Finding 1 fix.
>
> Thanks,
> Qunqin
> > +
> > +     pvt_init(mci, vbase, mc_idx_valid, mcs_per_node, valid_cs_bits);
> >       dimm_config_init(mci);
> >
> >       ret =3D edac_mc_add_mc(mci);
>
