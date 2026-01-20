Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B9B426D3D
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910682; cv=none; b=PnM9ftW7DnPSyBwLGVsKEQ8RNCYXFLTN8bgV0N3G3pUe8oMST3W9hGm6Od31cvSE9YAgi+qD9RCE3kqVvuUvolY864BEJm3TkZ/NBhhEhJJaAncAygxwJ8gBVP1UGXozuxAmL0hDbddPLRsPYvi2G1Gxa2YzC4e/3oMs/QtEuTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910682; c=relaxed/simple;
	bh=z8MmfXn/6O4AgwAXgtiQxLVfOreQ3XSFq9nCl25/da8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0oDqf+eZN/CceJlwp+aAUMd4FsU5rBb9QB1tO4Vjfmkz6jahsNx5K0dTm7cjSwNSMH/QqQJgI5Yx48GQmX+rjlmiNiV+9M2LCCZHuNQB4K1a0ewFo/kILE5ivxsPw9Z+FU+Bcf1UVIpXUG2ldE3QdIPRCVklt5BLNdY/z+xXlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdsj6DlK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdsj6DlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0219FC4AF09
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910682;
	bh=z8MmfXn/6O4AgwAXgtiQxLVfOreQ3XSFq9nCl25/da8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cdsj6DlK7zryNHoEcfgLMWD2//ismS1ThRds7+t2PHIIEkuXq2nZq+MFnEC6+0ArB
	 M3UKK+t/LUpMP4zvSDfNvYi02lF3Ja+KshFUJeRnt7EUb7OgVFe6YvyBkMptJd8SVZ
	 SKRcq+p75PMNdHRJxECrWBMK7gsx/UrjakO3No3KzgaxoPKQa2uTqmZuCl80yaKIyG
	 kEV0d8QOW4fEq9TQ7bXEpX4XLv4U5EkhO94gqii7Ldzrrz7eLqO5siAAB65CaSOJqd
	 QYj2t2mHFywfBMpSkx+oeYX7+akCQ69qz8WaULN46pRJqauc6GzRINMIibEltEs9kg
	 c3ShpCfRiftDQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87693c981fso883506666b.1
        for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 04:04:41 -0800 (PST)
X-Gm-Message-State: AOJu0YwTuLPgpB2S4tqmNSEdm+hBco88FsRWB3PQZTnC0gOn8rgJ7PXE
	/oInVqoGiWGkluzDab36Z/aP7GGXmvatDvqREJ5dXsCct+L1HcLkUYpUhdhDE/yuly5he1MyrTY
	OdDUrIOD83sLDyAbvEk3z4nClETD6BS8=
X-Received: by 2002:a17:907:6d10:b0:b87:3174:9bbe with SMTP id
 a640c23a62f3a-b8793023af2mr1242679166b.61.1768910680589; Tue, 20 Jan 2026
 04:04:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120092331.813-1-yangtiezhu@loongson.cn> <20260120092331.813-4-yangtiezhu@loongson.cn>
In-Reply-To: <20260120092331.813-4-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 20 Jan 2026 20:04:33 +0800
X-Gmail-Original-Message-ID: <CAAhV-H52X9cc_+CoQxzHA9Z+o5kNMqD5BoieNB3R4rFK8kDDSg@mail.gmail.com>
X-Gm-Features: AZwV_Qg9AQ0CrVJ1E7IrZW5GUHj8qv65DalyIyPxchoyaKeORi6w5RPfr4iv52Q
Message-ID: <CAAhV-H52X9cc_+CoQxzHA9Z+o5kNMqD5BoieNB3R4rFK8kDDSg@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] LoongArch: Remove some extern variables in source files
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

This patch can be the last one.


Huacai

On Tue, Jan 20, 2026 at 5:23=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> There are declarations of the variable "eentry", "pcpu_handlers[]" and
> "exception_handlers[]" in asm/setup.h, the source files already include
> this header file directly or indirectly, so no need to declare them in
> the source files, just remove the code.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/kernel/unwind_orc.c      | 2 --
>  arch/loongarch/kernel/unwind_prologue.c | 4 ----
>  arch/loongarch/mm/tlb.c                 | 1 -
>  3 files changed, 7 deletions(-)
>
> diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/u=
nwind_orc.c
> index 40f4d6c12cf6..d3bcbc82f101 100644
> --- a/arch/loongarch/kernel/unwind_orc.c
> +++ b/arch/loongarch/kernel/unwind_orc.c
> @@ -350,8 +350,6 @@ EXPORT_SYMBOL_GPL(unwind_start);
>
>  static inline unsigned long bt_address(unsigned long ra)
>  {
> -       extern unsigned long eentry;
> -
>  #if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
>         for (int cpu =3D 1; cpu < num_possible_cpus(); cpu++) {
>                 int vec_sz =3D sizeof(exception_handlers);
> diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/ker=
nel/unwind_prologue.c
> index 729e775bd40d..d04498d8090e 100644
> --- a/arch/loongarch/kernel/unwind_prologue.c
> +++ b/arch/loongarch/kernel/unwind_prologue.c
> @@ -23,10 +23,6 @@ extern const int unwind_hint_lasx;
>  extern const int unwind_hint_lbt;
>  extern const int unwind_hint_ri;
>  extern const int unwind_hint_watch;
> -extern unsigned long eentry;
> -#ifdef CONFIG_NUMA
> -extern unsigned long pcpu_handlers[NR_CPUS];
> -#endif
>
>  static inline bool scan_handlers(unsigned long entry_offset)
>  {
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index 6a3c91b9cacd..4014c4469587 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -262,7 +262,6 @@ static void output_pgtable_bits_defines(void)
>  #ifdef CONFIG_NUMA
>  unsigned long pcpu_handlers[NR_CPUS];
>  #endif
> -extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
>
>  static void setup_tlb_handler(int cpu)
>  {
> --
> 2.42.0
>
